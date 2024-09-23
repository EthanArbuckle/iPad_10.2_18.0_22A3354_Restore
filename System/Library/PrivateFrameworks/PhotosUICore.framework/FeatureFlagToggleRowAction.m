@implementation FeatureFlagToggleRowAction

uint64_t ___FeatureFlagToggleRowAction_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(CFSTR("Toggle "), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Use ffctl or Internal Settings to toggle PhotosGoldilocks/"), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _PresentAlert((uint64_t)v6, (uint64_t)v7, v5);

  return 1;
}

@end
