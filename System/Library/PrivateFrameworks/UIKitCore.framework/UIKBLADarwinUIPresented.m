@implementation UIKBLADarwinUIPresented

uint64_t __UIKBLADarwinUIPresented_block_invoke()
{
  return objc_msgSend((id)__UIKBCurrentHiddenViewController, "_localAuthenticationUIPresented");
}

uint64_t __UIKBLADarwinUIPresented_block_invoke_0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_localAuthenticationPresented");
}

@end
