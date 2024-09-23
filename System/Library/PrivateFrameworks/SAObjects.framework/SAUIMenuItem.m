@implementation SAUIMenuItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("MenuItem");
}

+ (id)menuItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSURL)icon
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("icon"));
}

- (void)setIcon:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("icon"), a3);
}

- (NSURL)ref
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("ref"));
}

- (void)setRef:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("ref"), a3);
}

- (NSString)subtitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
