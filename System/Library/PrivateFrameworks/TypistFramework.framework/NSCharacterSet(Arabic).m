@implementation NSCharacterSet(Arabic)

+ (uint64_t)numberCombiningCharacterSet
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(",.:٬٫"));
}

@end
