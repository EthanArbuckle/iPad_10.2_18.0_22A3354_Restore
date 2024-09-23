@implementation WarnSetterIsNoop

void __WarnSetterIsNoop_block_invoke(uint64_t a1)
{
  NSString *v1;

  v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  NSLog(CFSTR("%@ ignored on top level view controller's navigation item in document picker"), v1);
}

@end
