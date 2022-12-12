//go:build !noasm

package x86_64_simd

var (
	GoSumReduceFloat64 func([]float64) float64
	GoSumReduceFloat32 func([]float32) float32
	PacakgeName        = "X86_amd64_SIMD"
)

func init() {
	GoSumReduceFloat64 = go_mm_sum_reduce_d
	GoSumReduceFloat32 = go_mm_sum_reduce_f
}
