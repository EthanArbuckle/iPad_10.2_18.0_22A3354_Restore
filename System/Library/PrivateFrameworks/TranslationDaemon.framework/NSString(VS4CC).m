@implementation NSString(VS4CC)

+ (CFStringRef)vs_stringFrom4CC:()VS4CC
{
  return (id)VSCreate4CCString(a3);
}

@end
