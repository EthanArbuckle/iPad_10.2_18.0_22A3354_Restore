@implementation SAGuidanceGuideSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.guidance");
}

- (id)encodedClassName
{
  return CFSTR("GuideSnippet");
}

+ (id)guideSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAUIButton)appPunchOutButton
{
  return (SAUIButton *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appPunchOutButton"));
}

- (void)setAppPunchOutButton:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appPunchOutButton"), a3);
}

- (SAUIAppPunchOut)appStorePunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appStorePunchOut"));
}

- (void)setAppStorePunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appStorePunchOut"), a3);
}

- (NSArray)domainSnippets
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("domainSnippets"), v3);
}

- (void)setDomainSnippets:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("domainSnippets"), (uint64_t)a3);
}

- (NSString)headerText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headerText"));
}

- (void)setHeaderText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headerText"), a3);
}

- (NSArray)intentEnabledAppSnippets
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("intentEnabledAppSnippets"), v3);
}

- (void)setIntentEnabledAppSnippets:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("intentEnabledAppSnippets"), (uint64_t)a3);
}

@end
