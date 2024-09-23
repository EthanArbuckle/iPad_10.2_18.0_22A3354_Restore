@implementation PLSearchIndexCategoryMaskForCategories

uint64_t __PLSearchIndexCategoryMaskForCategories_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PLSearchIndexCategoryMaskForCategory(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

@end
