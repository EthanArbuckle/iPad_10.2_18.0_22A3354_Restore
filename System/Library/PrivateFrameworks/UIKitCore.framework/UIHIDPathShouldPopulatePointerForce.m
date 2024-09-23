@implementation UIHIDPathShouldPopulatePointerForce

void ___UIHIDPathShouldPopulatePointerForce_block_invoke()
{
  void *v0;
  char v1;
  char v2;
  void *v3;

  _UIHIDPathShouldPopulatePointerForce_shouldPopulate = dyld_program_sdk_at_least();
  if ((_UIHIDPathShouldPopulatePointerForce_shouldPopulate & 1) == 0)
  {
    _UIMainBundleIdentifier();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (v0)
    {
      v3 = v0;
      v1 = objc_msgSend(&unk_1E1A947A8, "containsObject:", v0);
      v0 = v3;
      v2 = v1 ^ 1;
    }
    else
    {
      v2 = 0;
    }
    _UIHIDPathShouldPopulatePointerForce_shouldPopulate = v2;

  }
}

@end
