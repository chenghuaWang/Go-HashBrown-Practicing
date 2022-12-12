package main

import "./internal/simd"

func main() {
	var foo = []float64{0.1, 0.2, 0.3, 0.4}
	println(simd.X86_64.SumReduceFloat64(foo))
}
