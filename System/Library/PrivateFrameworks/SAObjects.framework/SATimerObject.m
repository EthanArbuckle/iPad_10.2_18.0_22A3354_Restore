@implementation SATimerObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.timer");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
{
  return objc_alloc_init((Class)a1);
}

- (SADataSourceInfo)dataSourceInfo
{
  return (SADataSourceInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("dataSourceInfo"));
}

- (void)setDataSourceInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("dataSourceInfo"), a3);
}

- (NSNumber)isFiring
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isFiring"));
}

- (void)setIsFiring:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isFiring"), a3);
}

- (NSString)state
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("state"));
}

- (void)setState:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("state"), a3);
}

- (NSNumber)timerValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timerValue"));
}

- (void)setTimerValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timerValue"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

@end
