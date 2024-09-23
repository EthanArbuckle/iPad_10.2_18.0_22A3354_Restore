@implementation NSString(TIWordSearchCangjie)

- (BOOL)containsCangjieWildcard
{
  return objc_msgSend(a1, "rangeOfString:options:", CFSTR("z"), 2) != 0x7FFFFFFFFFFFFFFFLL;
}

@end
