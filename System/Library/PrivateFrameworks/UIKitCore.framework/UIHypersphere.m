@implementation UIHypersphere

uint64_t __31___UIHypersphere_copyWithZone___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_center");
  objc_msgSend(*(id *)(a1 + 32), "_dimensions");
  return cblas_dcopy_NEWLAPACK();
}

@end
