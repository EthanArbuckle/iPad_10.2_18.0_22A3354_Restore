@implementation PSIsValueRestrictedByMCFeature

BOOL ___PSIsValueRestrictedByMCFeature_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = (void *)MEMORY[0x1E0D47230];
  v3 = a2;
  objc_msgSend(v2, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveBoolValueForSetting:", v3);

  return v5 == 2;
}

@end
