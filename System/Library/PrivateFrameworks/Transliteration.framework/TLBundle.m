@implementation TLBundle

+ (id)mainBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
