@implementation APOdmlStoreServerPolicy

- (id)allowableClassesForClientWithContext:(id)a3
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_allowedTopLevelClasses(APOdmlFeatureValueTransformer, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
