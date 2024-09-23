@implementation SAClockAceClockWrap

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("AceClockWrap");
}

+ (id)aceClockWrap
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
