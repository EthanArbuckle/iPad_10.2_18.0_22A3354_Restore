@implementation NSCharacterSet(PhoneNumbers)

+ (uint64_t)pn_verticalServiceCharacterSet
{
  return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("*#"));
}

@end
