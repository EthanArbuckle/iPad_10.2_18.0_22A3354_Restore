@implementation SFUBundle

uint64_t __SFUBundle_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  SFUBundle_sSFUBundle = result;
  return result;
}

@end
