@implementation SAUIAlternateProviderResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AlternateProviderResult");
}

+ (id)alternateProviderResult
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

- (NSNumber)numberOfResults
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("numberOfResults"));
}

- (void)setNumberOfResults:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("numberOfResults"), a3);
}

- (SAUIImageResource)providerImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("providerImage"));
}

- (void)setProviderImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("providerImage"), a3);
}

- (NSString)providerName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("providerName"));
}

- (void)setProviderName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("providerName"), a3);
}

@end
