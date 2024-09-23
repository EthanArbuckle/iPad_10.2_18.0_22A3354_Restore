@implementation SATextDecorationRegion

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("TextDecorationRegion");
}

+ (id)textDecorationRegion
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)length
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("length"));
}

- (void)setLength:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("length"), a3);
}

- (NSString)property
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("property"));
}

- (void)setProperty:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("property"), a3);
}

- (NSNumber)start
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("start"));
}

- (void)setStart:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("start"), a3);
}

@end
