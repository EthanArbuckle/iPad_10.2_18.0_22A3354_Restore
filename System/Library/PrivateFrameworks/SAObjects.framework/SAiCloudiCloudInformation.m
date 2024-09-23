@implementation SAiCloudiCloudInformation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.iCloud");
}

- (id)encodedClassName
{
  return CFSTR("iCloudInformation");
}

+ (id)iCloudInformation
{
  return objc_alloc_init((Class)a1);
}

@end
