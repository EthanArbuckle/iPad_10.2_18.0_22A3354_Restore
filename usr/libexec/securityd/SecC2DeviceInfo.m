@implementation SecC2DeviceInfo

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_content("com.apple.security.analytics", a2);
}

+ (id)buildVersion
{
  return sub_100162F14(CFSTR("BuildVersion"));
}

+ (id)productName
{
  return sub_100162F14(CFSTR("ProductName"));
}

+ (id)productType
{
  return sub_100162F14(CFSTR("ProductType"));
}

+ (id)productVersion
{
  return sub_100162F14(CFSTR("ProductVersion"));
}

+ (id)processName
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_100162E8C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCFBundleIdentifierKey));

  return v4;
}

+ (id)processVersion
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_100162E8C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", _kCFBundleShortVersionStringKey));

  return v4;
}

+ (id)processUUID
{
  if (qword_100341440 != -1)
    dispatch_once(&qword_100341440, &stru_1002E93B8);
  return (id)qword_100341438;
}

@end
