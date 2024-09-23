@implementation SACFFetchScriptCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("FetchScriptCommand");
}

+ (id)fetchScriptCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSString)fetchScriptType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fetchScriptType"));
}

- (void)setFetchScriptType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fetchScriptType"), a3);
}

- (NSArray)jsScriptIdentifiers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsScriptIdentifiers"));
}

- (void)setJsScriptIdentifiers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsScriptIdentifiers"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
