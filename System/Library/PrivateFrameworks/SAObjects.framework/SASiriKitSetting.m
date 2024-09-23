@implementation SASiriKitSetting

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitSetting");
}

+ (id)siriKitSetting
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)applySASToFirstPartyDomains
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("applySASToFirstPartyDomains"));
}

- (void)setApplySASToFirstPartyDomains:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("applySASToFirstPartyDomains"), a3);
}

- (NSArray)listOfSiriKitEnabledDomains
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listOfSiriKitEnabledDomains"));
}

- (void)setListOfSiriKitEnabledDomains:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listOfSiriKitEnabledDomains"), a3);
}

- (BOOL)useSASAutoSelectionFeature
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("useSASAutoSelectionFeature"));
}

- (void)setUseSASAutoSelectionFeature:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("useSASAutoSelectionFeature"), a3);
}

@end
