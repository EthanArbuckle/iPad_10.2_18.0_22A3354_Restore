@implementation SADPHeadphone

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicePlaySound");
}

- (id)encodedClassName
{
  return CFSTR("Headphone");
}

+ (id)headphone
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)inOrOverEar
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("inOrOverEar"));
}

- (void)setInOrOverEar:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("inOrOverEar"), a3);
}

- (NSString)position
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("position"));
}

- (void)setPosition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("position"), a3);
}

@end
