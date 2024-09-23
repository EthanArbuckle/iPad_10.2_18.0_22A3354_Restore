@implementation PXRectDiff

uint64_t __PXRectDiff_block_invoke(uint64_t a1, double a2, double a3)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 40), a2, *(double *)(a1 + 56), a3 - a2);
}

uint64_t __PXRectDiff_block_invoke_2(uint64_t a1, __n128 a2, double a3)
{
  return (*(uint64_t (**)(__n128, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a2, *(double *)(a1 + 48), a3 - a2.n128_f64[0], *(double *)(a1 + 64));
}

@end
