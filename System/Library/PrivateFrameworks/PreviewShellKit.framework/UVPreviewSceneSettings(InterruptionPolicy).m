@implementation UVPreviewSceneSettings(InterruptionPolicy)

- (uint64_t)copyResettingInterruptionPolicy
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "setInterruptionPolicy:", 1);
  v2 = objc_msgSend(v1, "copy");

  return v2;
}

@end
