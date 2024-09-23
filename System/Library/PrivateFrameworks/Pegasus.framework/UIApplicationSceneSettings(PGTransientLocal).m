@implementation UIApplicationSceneSettings(PGTransientLocal)

- (uint64_t)pg_hasVisiblePIPContent
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "transientLocalSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 4821);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
