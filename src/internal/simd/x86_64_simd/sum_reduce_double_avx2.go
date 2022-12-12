//go:build !noasm && !appengine

package x86_64_simd

import "unsafe"

// go: noescape
func _go_mm_sum_reduce_d(buf, len, res unsafe.Pointer)

func go_mm_sum_reduce_d(buf []float64) (res float64) {
	_go_mm_sum_reduce_d(unsafe.Pointer(&buf[0]), unsafe.Pointer(uintptr(len(buf))), unsafe.Pointer(&res))
	return
}
