package simd

import "./x86_64_simd"

type __x86_amd64 struct {
	SumReduceFloat64 func([]float64) float64
	SumReduceFloat32 func([]float32) float32
}

// type __amr64 struct {
// }

// type __risc64 struct {
// }

// type __mips struct {
// }

var (
	// X86_amd64
	X86_64 __x86_amd64
)

func init() {
	X86_64.SumReduceFloat64 = x86_64_simd.GoSumReduceFloat64
	X86_64.SumReduceFloat32 = x86_64_simd.GoSumReduceFloat32
}
