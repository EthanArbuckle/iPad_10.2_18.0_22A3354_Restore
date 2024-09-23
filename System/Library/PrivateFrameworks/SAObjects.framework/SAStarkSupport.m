@implementation SAStarkSupport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StarkSupport");
}

+ (id)starkSupport
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)supportedModes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("supportedModes"));
}

- (void)setSupportedModes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("supportedModes"), a3);
}

@end
