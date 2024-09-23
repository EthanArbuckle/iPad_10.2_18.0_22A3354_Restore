@implementation RXRelease

void __RXRelease_block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
