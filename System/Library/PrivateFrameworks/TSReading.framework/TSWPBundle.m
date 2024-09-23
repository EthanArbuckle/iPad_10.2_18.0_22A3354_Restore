@implementation TSWPBundle

uint64_t __TSWPBundle_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  TSWPBundle::bundle = result;
  return result;
}

@end
