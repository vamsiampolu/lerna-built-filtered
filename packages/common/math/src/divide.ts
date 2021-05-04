export default function divide (a: number, b: number): number {
  if ([a, b].some(v => Number.isNaN(v))) throw new Error('both values must be numbers')

  return a / b
}
