//go:build !noasm && !appengine

package x86_64_simd

import "unsafe"

// go: noescape
func _go_mm_sum_reduce_f(buf, len, res unsafe.Pointer)

func go_mm_sum_reduce_f(buf []float32) (res float32) {
	_go_mm_sum_reduce_f(unsafe.Pointer(&buf[0]), unsafe.Pointer(uintptr(len(buf))), unsafe.Pointer(&res))
	return
}
