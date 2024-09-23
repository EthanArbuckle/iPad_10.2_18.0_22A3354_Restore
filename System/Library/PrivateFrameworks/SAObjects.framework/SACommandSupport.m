@implementation SACommandSupport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CommandSupport");
}

+ (id)commandSupport
{
  return objc_alloc_init((Class)a1);
}

- (NSString)aceVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("aceVersion"));
}

- (void)setAceVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("aceVersion"), a3);
}

- (NSString)commandId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("commandId"));
}

- (void)setCommandId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("commandId"), a3);
}

- (SAObjectSupport)resultSupport
{
  return (SAObjectSupport *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("resultSupport"));
}

- (void)setResultSupport:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("resultSupport"), a3);
}

- (NSURL)serverEndpoint
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("serverEndpoint"));
}

- (void)setServerEndpoint:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("serverEndpoint"), a3);
}

- (NSArray)supportedConstraints
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("supportedConstraints"), v3);
}

- (void)setSupportedConstraints:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("supportedConstraints"), (uint64_t)a3);
}

- (int64_t)weight
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("weight"));
}

- (void)setWeight:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("weight"), a3);
}

@end
