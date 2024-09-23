@implementation SAAceDomainSignal

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceDomainSignal");
}

+ (id)aceDomainSignal
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appIdHints
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appIdHints"));
}

- (void)setAppIdHints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appIdHints"), a3);
}

- (NSString)domain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domain"));
}

- (void)setDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domain"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
