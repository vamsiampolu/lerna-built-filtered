export default function multiply (values: number[]): number | undefined {
  if (values.length <= 1) {
    throw new Error('one or more numbers must be provided')
  } else if (values.some(num => Number.isNaN(num))) {
    throw new Error('one of the values provided is not a number')
  } else {
    return values.reduce((acc: number, num: number) => acc * num, 1)
  }
}
