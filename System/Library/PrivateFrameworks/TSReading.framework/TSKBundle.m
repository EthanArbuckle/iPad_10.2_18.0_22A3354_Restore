@implementation TSKBundle

uint64_t __TSKBundle_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  TSKBundle_sTSKBundle = result;
  return result;
}

@end
