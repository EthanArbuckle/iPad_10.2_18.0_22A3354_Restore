@implementation UINavigationControllerHasBugWhenPositioningBarsExclusivelyWithSafeArea

void ___UINavigationControllerHasBugWhenPositioningBarsExclusivelyWithSafeArea_block_invoke()
{
  int v0;
  id v1;

  v0 = dyld_program_sdk_at_least();
  byte_1EDDB0E51 = v0 ^ 1;
  if (((v0 ^ 1) & 1) == 0)
  {
    _UIMainBundleIdentifier();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.springboard")))
      byte_1EDDB0E51 = 1;
    else
      qword_1EDDB0F30 = (uint64_t)NSClassFromString(CFSTR("PUNavigationController"));

  }
}

@end
