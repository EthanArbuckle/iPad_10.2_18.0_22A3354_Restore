@implementation NSString(Crypto)

- (uint64_t)getDataUsingOfficeCryptographicEncoding
{
  return objc_msgSend(a1, "dataUsingEncoding:", 2483028224);
}

@end
