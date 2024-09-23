@implementation SALogSignatureWithABC

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("LogSignatureWithABC");
}

+ (id)logSignatureWithABC
{
  return objc_alloc_init((Class)a1);
}

- (NSString)subType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subType"));
}

- (void)setSubType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subType"), a3);
}

- (NSDictionary)subTypeContext
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subTypeContext"));
}

- (void)setSubTypeContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subTypeContext"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
