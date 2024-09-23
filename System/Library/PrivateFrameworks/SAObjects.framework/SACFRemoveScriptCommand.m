@implementation SACFRemoveScriptCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("RemoveScriptCommand");
}

+ (id)removeScriptCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)scriptIdentifiers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("scriptIdentifiers"));
}

- (void)setScriptIdentifiers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("scriptIdentifiers"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
