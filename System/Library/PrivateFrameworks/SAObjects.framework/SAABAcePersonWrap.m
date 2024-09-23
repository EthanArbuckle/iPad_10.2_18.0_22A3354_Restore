@implementation SAABAcePersonWrap

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("AcePersonWrap");
}

+ (id)acePersonWrap
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)generation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("generation"));
}

- (void)setGeneration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("generation"), a3);
}

@end
