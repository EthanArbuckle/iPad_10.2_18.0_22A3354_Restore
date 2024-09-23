@implementation NSNull(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  return objc_msgSend(a3, "appendString:", CFSTR("null"));
}

@end
