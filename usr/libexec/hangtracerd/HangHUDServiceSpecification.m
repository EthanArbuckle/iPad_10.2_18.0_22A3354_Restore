@implementation HangHUDServiceSpecification

+ (NSString)domainName
{
  return (NSString *)CFSTR("com.apple.HangHUD");
}

+ (NSString)machName
{
  return (NSString *)CFSTR("com.apple.HangHUD");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.HangHUD.service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)+[BSServiceQuality userInteractive](BSServiceQuality, "userInteractive");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000173A8;
  block[3] = &unk_10004D420;
  block[4] = a1;
  if (qword_100060258 != -1)
    dispatch_once(&qword_100060258, block);
  return (BSServiceInterface *)(id)qword_100060250;
}

+ (NSString)clientContextIdentifierKey
{
  return (NSString *)CFSTR("identifier");
}

@end
