import { jest, describe, it, expect } from '@jest/globals';
import add from './add';

describe('add', () => {
  it('adds two numbers', () => {
    expect(add(1,2)).toEqual(3);
  });

  it('adds more than 2 numbers', () => {
    expect(add(1,2,3,4,5)).toEqual(15);
  });
});
