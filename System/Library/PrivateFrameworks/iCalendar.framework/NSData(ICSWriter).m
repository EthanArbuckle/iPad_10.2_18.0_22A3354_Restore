@implementation NSData(ICSWriter)

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  CFStringRef v5;
  CFStringRef v6;
  id v7;

  v7 = a4;
  v5 = ICSEncodeBase64(0, a1);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v7, "appendString:", v5);
    CFRelease(v6);
  }

}

@end
