@implementation UIHyperrepeatedRegion

void *__39___UIHyperrepeatedRegion_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return memcpy(a2, (const void *)objc_msgSend(*(id *)(a1 + 32), "_repetitions"), 8 * objc_msgSend(*(id *)(a1 + 32), "_dimensions"));
}

uint64_t __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_offset");
  objc_msgSend(*(id *)(a1 + 32), "_dimensions");
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_increment");
  objc_msgSend(*(id *)(a1 + 32), "_dimensions");
  return cblas_dcopy_NEWLAPACK();
}

@end
