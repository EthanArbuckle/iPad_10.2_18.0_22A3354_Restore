@implementation SALCMMovie

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("Movie");
}

+ (id)movie
{
  return objc_alloc_init((Class)a1);
}

@end
