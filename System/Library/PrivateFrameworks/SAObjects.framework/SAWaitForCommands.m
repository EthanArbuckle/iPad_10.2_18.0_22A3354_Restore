@implementation SAWaitForCommands

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("WaitForCommands");
}

+ (id)waitForCommands
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commandAceIds
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("commandAceIds"));
}

- (void)setCommandAceIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("commandAceIds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
