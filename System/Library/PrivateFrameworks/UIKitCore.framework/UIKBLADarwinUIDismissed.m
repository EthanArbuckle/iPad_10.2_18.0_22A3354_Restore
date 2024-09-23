@implementation UIKBLADarwinUIDismissed

uint64_t __UIKBLADarwinUIDismissed_block_invoke()
{
  return objc_msgSend((id)__UIKBCurrentHiddenViewController, "_localAuthenticationUIDismissed");
}

uint64_t __UIKBLADarwinUIDismissed_block_invoke_0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_localAuthenticationDismissed");
}

@end
