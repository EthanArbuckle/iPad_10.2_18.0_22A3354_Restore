@implementation STDevicePINFactory

+ (Class)devicePINPaneForPlatform
{
  return (Class)objc_opt_class();
}

+ (Class)devicePINControllerForPlatform
{
  return (Class)objc_opt_class();
}

@end
