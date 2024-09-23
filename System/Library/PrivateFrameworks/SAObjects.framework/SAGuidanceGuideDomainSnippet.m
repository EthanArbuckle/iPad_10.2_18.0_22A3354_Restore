@implementation SAGuidanceGuideDomainSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.guidance");
}

- (id)encodedClassName
{
  return CFSTR("GuideDomainSnippet");
}

+ (id)guideDomainSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSString)domainAlternateDisplayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainAlternateDisplayName"));
}

- (void)setDomainAlternateDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainAlternateDisplayName"), a3);
}

- (NSString)domainDisplayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainDisplayName"));
}

- (void)setDomainDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainDisplayName"), a3);
}

- (NSURL)domainIconURI
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("domainIconURI"));
}

- (void)setDomainIconURI:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("domainIconURI"), a3);
}

- (NSString)domainName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domainName"));
}

- (void)setDomainName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domainName"), a3);
}

- (BOOL)enabledInOfflineMode
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("enabledInOfflineMode"));
}

- (void)setEnabledInOfflineMode:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("enabledInOfflineMode"), a3);
}

- (BOOL)enabledInOnlineMode
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("enabledInOnlineMode"));
}

- (void)setEnabledInOnlineMode:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("enabledInOnlineMode"), a3);
}

- (NSArray)guideSections
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("guideSections"), v3);
}

- (void)setGuideSections:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("guideSections"), (uint64_t)a3);
}

- (NSString)iconDisplayIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("iconDisplayIdentifier"));
}

- (void)setIconDisplayIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("iconDisplayIdentifier"), a3);
}

- (BOOL)iconNeedsProcessing
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("iconNeedsProcessing"));
}

- (void)setIconNeedsProcessing:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("iconNeedsProcessing"), a3);
}

- (NSString)iconResourceName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("iconResourceName"));
}

- (void)setIconResourceName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("iconResourceName"), a3);
}

- (BOOL)isAppIcon
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isAppIcon"));
}

- (void)setIsAppIcon:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isAppIcon"), a3);
}

- (BOOL)performIntentEnabledAppAuthorizationCheck
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("performIntentEnabledAppAuthorizationCheck"));
}

- (void)setPerformIntentEnabledAppAuthorizationCheck:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("performIntentEnabledAppAuthorizationCheck"), a3);
}

- (NSString)tagPhrase
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("tagPhrase"));
}

- (void)setTagPhrase:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("tagPhrase"), a3);
}

@end
