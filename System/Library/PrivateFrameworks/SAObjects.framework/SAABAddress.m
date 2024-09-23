@implementation SAABAddress

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("Address");
}

+ (id)address
{
  return objc_alloc_init((Class)a1);
}

@end
