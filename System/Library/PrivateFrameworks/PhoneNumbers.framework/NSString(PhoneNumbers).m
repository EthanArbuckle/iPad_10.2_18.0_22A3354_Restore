@implementation NSString(PhoneNumbers)

- (uint64_t)pn_hasInternationalDirectDialingPrefix
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("+"));
}

@end
