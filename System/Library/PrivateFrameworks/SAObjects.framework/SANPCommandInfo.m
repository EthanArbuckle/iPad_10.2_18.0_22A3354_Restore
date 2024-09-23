@implementation SANPCommandInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying");
}

- (id)encodedClassName
{
  return CFSTR("CommandInfo");
}

+ (id)commandInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)registeredCommands
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("registeredCommands"));
}

- (void)setRegisteredCommands:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("registeredCommands"), a3);
}

@end
