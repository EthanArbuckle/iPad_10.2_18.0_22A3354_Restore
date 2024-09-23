@implementation PUDiffHorizontalRects

uint64_t __PUDiffHorizontalRects_block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a3, a2, a5, a4);
}

@end
