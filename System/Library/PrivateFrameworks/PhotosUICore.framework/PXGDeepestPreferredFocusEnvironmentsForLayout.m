@implementation PXGDeepestPreferredFocusEnvironmentsForLayout

void __PXGDeepestPreferredFocusEnvironmentsForLayout_block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "axGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIfNeeded");
  v4 = (id)objc_msgSend(v6, "loadLeafAtSpriteIndexIfNeeded:usingOptions:", a2, 4);
  objc_msgSend(v6, "loadedLeafAtSpriteIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

@end
