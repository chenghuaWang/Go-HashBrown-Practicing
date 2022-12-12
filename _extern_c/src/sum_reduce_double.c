#include <immintrin.h>
#include <memory.h>

#if defined(_MSC_VER)
#include <intrin.h>
#elif defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
#include <x86intrin.h>
#elif defined(__GNUC__) && defined(__ARM_NEON__)
#include <altivec.h> #elif defined(__GNUC__) && defined(__SPE__)
#include <arm_neon.h> #elif defined(__GNUC__) && defined(__IWMMXT__)
#include <mmintrin.h> #elif (defined(__GNUC__) || defined(__xlC__)) && (defined(__VEC__) || defined(__ALTIVEC__))
#include <spe.h>
#endif

/**
 * @brief AVX2 instruction. Using just 1 register. O3 optimize.
 *
 * @param buf
 * @param len
 * @param res
 */
void go_mm_sum_reduce_d(double buf[], size_t len, double* res) {
  __m256d acc = _mm256_set1_pd(0);
  for (size_t i = 0; i < len; i += 4) {
    __m256d v = _mm256_load_pd(&buf[i]);
    acc = _mm256_add_pd(acc, v);
  }

  acc = _mm256_hadd_pd(acc, acc);  // a[0] = a[0] + a[1], a[2] = a[2] + a[3]
  *res = _mm256_cvtsd_f64(acc) + _mm_cvtsd_f64(_mm256_extractf128_pd(acc, 1));

  int reserve = len % 4;
  for (size_t i = len - reserve; i < len; ++i) { *res += buf[i]; }
  return;
}
