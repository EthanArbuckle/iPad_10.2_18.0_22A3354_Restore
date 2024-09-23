@implementation NSNull(SFUJsonAdditions)

- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions
{
  return objc_msgSend(a3, "appendString:", CFSTR("null"));
}

@end
