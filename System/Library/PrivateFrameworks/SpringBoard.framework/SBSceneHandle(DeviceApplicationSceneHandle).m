@implementation SBSceneHandle(DeviceApplicationSceneHandle)

- (uint64_t)isEffectivelyForeground
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "sceneIfExists");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForeground");

  return v3;
}

- (uint64_t)isDeviceApplicationSceneHandle
{
  return 0;
}

@end
