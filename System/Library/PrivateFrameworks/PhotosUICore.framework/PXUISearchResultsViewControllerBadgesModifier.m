@implementation PXUISearchResultsViewControllerBadgesModifier

uint64_t ___PXUISearchResultsViewControllerBadgesModifier_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
      a3 |= 0x1000000000uLL;

  }
  return a3;
}

@end
