@implementation SAABPerson

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("Person");
}

+ (id)person
{
  return objc_alloc_init((Class)a1);
}

@end
