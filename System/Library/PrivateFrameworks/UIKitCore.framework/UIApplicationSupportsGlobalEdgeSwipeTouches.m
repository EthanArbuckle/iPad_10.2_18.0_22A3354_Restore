@implementation UIApplicationSupportsGlobalEdgeSwipeTouches

void ___UIApplicationSupportsGlobalEdgeSwipeTouches_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  _UIMainBundleIdentifier();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v2 = (void *)v0;
    LOBYTE(v0) = objc_msgSend(&unk_1E1A94700, "containsObject:", v0);
    v1 = v2;
  }
  byte_1EDDC7FF8 = v0;

}

@end
