@implementation NSData(Base64)

- (uint64_t)base64
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
}

@end
