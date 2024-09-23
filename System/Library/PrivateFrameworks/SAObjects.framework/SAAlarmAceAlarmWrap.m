@implementation SAAlarmAceAlarmWrap

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alarm");
}

- (id)encodedClassName
{
  return CFSTR("AceAlarmWrap");
}

+ (id)aceAlarmWrap
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
