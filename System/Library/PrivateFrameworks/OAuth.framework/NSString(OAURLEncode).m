@implementation NSString(OAURLEncode)

- (CFStringRef)oauth_urlEncodedString
{
  return objc_autorelease((id)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], originalString, 0, CFSTR(":/?#[]@!$&’()*+,;=%"),
                                0x8000100u));
}

@end
