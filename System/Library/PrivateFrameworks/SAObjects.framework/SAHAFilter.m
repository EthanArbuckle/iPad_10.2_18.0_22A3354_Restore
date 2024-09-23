@implementation SAHAFilter

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("Filter");
}

+ (id)filter
{
  return objc_alloc_init((Class)a1);
}

@end
