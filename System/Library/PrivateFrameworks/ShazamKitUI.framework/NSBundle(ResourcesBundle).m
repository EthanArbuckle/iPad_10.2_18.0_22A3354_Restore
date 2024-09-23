@implementation NSBundle(ResourcesBundle)

+ (uint64_t)sh_UIBundle
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
