@implementation SAHACurrentHome

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("CurrentHome");
}

+ (id)currentHome
{
  return objc_alloc_init((Class)a1);
}

- (NSString)currentHomeIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentHomeIdentifier"));
}

- (void)setCurrentHomeIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentHomeIdentifier"), a3);
}

- (NSString)currentHomeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currentHomeName"));
}

- (void)setCurrentHomeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currentHomeName"), a3);
}

@end
