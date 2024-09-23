@implementation UIResolvedDynamicColorWithHighContrast

id ___UIResolvedDynamicColorWithHighContrast_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", a2, 0x1E1A99570);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_resolvedColorWithTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
