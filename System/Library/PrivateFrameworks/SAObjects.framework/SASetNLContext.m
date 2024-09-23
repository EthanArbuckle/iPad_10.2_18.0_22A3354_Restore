@implementation SASetNLContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetNLContext");
}

+ (id)setNLContext
{
  return objc_alloc_init((Class)a1);
}

- (NSString)parseOverrideQuery
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parseOverrideQuery"));
}

- (void)setParseOverrideQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parseOverrideQuery"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
