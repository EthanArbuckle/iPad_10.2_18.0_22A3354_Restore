@implementation WLKBaseURLOverride

void __WLKBaseURLOverride_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    NSLog(CFSTR("WLKBaseURLOverride: %@"), *(_QWORD *)(a1 + 32));
}

@end
