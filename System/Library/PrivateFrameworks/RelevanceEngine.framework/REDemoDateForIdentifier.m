@implementation REDemoDateForIdentifier

void __REDemoDateForIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.NanoTimeKit.face"));
  v1 = (void *)REDemoDateForIdentifier_defaults;
  REDemoDateForIdentifier_defaults = v0;

}

@end
