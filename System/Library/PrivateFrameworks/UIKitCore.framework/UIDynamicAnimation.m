@implementation UIDynamicAnimation

uint64_t __47___UIDynamicAnimation__updateAnimations_timer___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  if ((a2[20] & 2) != 0)
    return objc_msgSend(a2, "_completeWithFinished:", 1);
  return result;
}

uint64_t __27___UIDynamicAnimation_init__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(_UIMainBundleIdentifier(), "isEqualToString:", CFSTR("com.apple.Maps"));
  _MergedGlobals_1 = result;
  return result;
}

@end
