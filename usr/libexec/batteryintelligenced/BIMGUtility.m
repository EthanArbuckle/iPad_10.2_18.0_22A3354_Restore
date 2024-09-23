@implementation BIMGUtility

+ (BOOL)isiPhone
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"), a2);
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

@end
