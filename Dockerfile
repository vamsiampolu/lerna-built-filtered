FROM node:12 as build-image

WORKDIR /usr/app

COPY . .

RUN yarn install
RUN yarn workspace do-math build:all

FROM node:12

WORKDIR /usr/app

COPY lerna.json ./lerna.json
COPY yarn.lock ./yarn.lock

# copy built libraries to be used with lerna.
# this is only for times when the dependencies are packages that have not been published.
COPY packages/common/math/package.json /usr/app/packages/common/math/package.json

COPY --from=build-image /usr/app/packages/common/math/build /usr/app/packages/common/math/build

COPY --from=build-image /usr/app/node_modules /usr/app/node_modules
COPY --from=build-image /usr/app/packages/core/do-math/package.json /usr/app/package.json
COPY --from=build-image /usr/app/packages/core/do-math/build /usr/app/build


CMD yarn start
