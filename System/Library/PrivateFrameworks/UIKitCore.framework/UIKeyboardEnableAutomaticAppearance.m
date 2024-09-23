@implementation UIKeyboardEnableAutomaticAppearance

uint64_t __UIKeyboardEnableAutomaticAppearance_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAutomaticAppearanceEnabled:", 1);
}

@end
