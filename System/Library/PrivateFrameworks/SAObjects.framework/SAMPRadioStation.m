@implementation SAMPRadioStation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("RadioStation");
}

+ (id)radioStation
{
  return objc_alloc_init((Class)a1);
}

@end
