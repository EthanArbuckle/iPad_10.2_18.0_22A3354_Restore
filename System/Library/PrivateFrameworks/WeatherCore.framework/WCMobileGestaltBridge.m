@implementation WCMobileGestaltBridge

+ (BOOL)isIPad
{
  return MGGetBoolAnswer();
}

+ (id)_getStringAnswer:(__CFString *)a3
{
  return (id)MGGetStringAnswer();
}

+ (id)productVersion
{
  return (id)objc_msgSend(a1, "_getStringAnswer:", CFSTR("ProductVersion"));
}

+ (id)marketingProductName
{
  return (id)objc_msgSend(a1, "_getStringAnswer:", CFSTR("j9Th5smJpdztHwc+i39zIg"));
}

+ (id)buildVersion
{
  return (id)objc_msgSend(a1, "_getStringAnswer:", CFSTR("BuildVersion"));
}

@end
