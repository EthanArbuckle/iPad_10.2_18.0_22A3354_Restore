@implementation NSObject(WebScripting)

+ (uint64_t)isSelectorExcludedFromWebScript:()WebScripting
{
  return 1;
}

+ (uint64_t)isKeyExcludedFromWebScript:()WebScripting
{
  return 1;
}

@end
