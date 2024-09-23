@implementation SAAppInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AppInfo");
}

+ (id)appInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSString)adamId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("adamId"));
}

- (void)setAdamId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("adamId"), a3);
}

- (NSString)appId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appId"));
}

- (void)setAppId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appId"), a3);
}

- (SASyncAppIdentifyingInfo)appIdentifyingInfo
{
  return (SASyncAppIdentifyingInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appIdentifyingInfo"));
}

- (void)setAppIdentifyingInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appIdentifyingInfo"), a3);
}

- (NSString)appName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appName"));
}

- (void)setAppName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appName"), a3);
}

- (NSDictionary)appNameMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appNameMap"));
}

- (void)setAppNameMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appNameMap"), a3);
}

- (NSArray)appNameSynonyms
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("appNameSynonyms"), v3);
}

- (void)setAppNameSynonyms:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("appNameSynonyms"), (uint64_t)a3);
}

- (NSDictionary)appNameSynonymsMap
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassArrayDictionaryForProperty(self, (uint64_t)CFSTR("appNameSynonymsMap"), v3);
}

- (void)setAppNameSynonymsMap:(id)a3
{
  AceObjectSetAceObjectArrayDictionaryForProperty(self, CFSTR("appNameSynonymsMap"), a3);
}

- (NSString)appVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appVersion"));
}

- (void)setAppVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appVersion"), a3);
}

- (BOOL)betaApp
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("betaApp"));
}

- (void)setBetaApp:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("betaApp"), a3);
}

- (NSString)carPlayAlternativeDisplayName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("carPlayAlternativeDisplayName"));
}

- (void)setCarPlayAlternativeDisplayName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("carPlayAlternativeDisplayName"), a3);
}

- (NSDictionary)carPlayAlternativeDisplayNameMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("carPlayAlternativeDisplayNameMap"));
}

- (void)setCarPlayAlternativeDisplayNameMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("carPlayAlternativeDisplayNameMap"), a3);
}

- (NSString)containerName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("containerName"));
}

- (void)setContainerName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("containerName"), a3);
}

- (NSString)displayAppName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayAppName"));
}

- (void)setDisplayAppName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayAppName"), a3);
}

- (NSDictionary)displayAppNameMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayAppNameMap"));
}

- (void)setDisplayAppNameMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayAppNameMap"), a3);
}

- (SAGlance)glance
{
  return (SAGlance *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("glance"));
}

- (void)setGlance:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("glance"), a3);
}

- (BOOL)hasSiriIntegration
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("hasSiriIntegration"));
}

- (void)setHasSiriIntegration:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("hasSiriIntegration"), a3);
}

- (BOOL)hidden
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("hidden"));
}

- (void)setHidden:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("hidden"), a3);
}

- (BOOL)isMacApp
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isMacApp"));
}

- (void)setIsMacApp:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isMacApp"), a3);
}

- (BOOL)isNanoApp
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isNanoApp"));
}

- (void)setIsNanoApp:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isNanoApp"), a3);
}

- (NSNumber)nowPlayingAppWithBrowsableContent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nowPlayingAppWithBrowsableContent"));
}

- (void)setNowPlayingAppWithBrowsableContent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nowPlayingAppWithBrowsableContent"), a3);
}

- (NSString)providerName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("providerName"));
}

- (void)setProviderName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("providerName"), a3);
}

- (SASiriSupport)siriSupport
{
  return (SASiriSupport *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("siriSupport"));
}

- (void)setSiriSupport:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("siriSupport"), a3);
}

- (NSString)spokenName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("spokenName"));
}

- (void)setSpokenName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("spokenName"), a3);
}

- (NSDictionary)spokenNameMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("spokenNameMap"));
}

- (void)setSpokenNameMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("spokenNameMap"), a3);
}

- (NSString)spotlightName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("spotlightName"));
}

- (void)setSpotlightName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("spotlightName"), a3);
}

- (NSDictionary)spotlightNameMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("spotlightNameMap"));
}

- (void)setSpotlightNameMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("spotlightNameMap"), a3);
}

- (SAStarkSupport)starkSupport
{
  return (SAStarkSupport *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("starkSupport"));
}

- (void)setStarkSupport:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("starkSupport"), a3);
}

- (NSArray)supportedCommands
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("supportedCommands"), v3);
}

- (void)setSupportedCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("supportedCommands"), (uint64_t)a3);
}

- (NSArray)supportedSchemes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("supportedSchemes"));
}

- (void)setSupportedSchemes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("supportedSchemes"), a3);
}

- (BOOL)supportsUniversalSearchSubscription
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("supportsUniversalSearchSubscription"));
}

- (void)setSupportsUniversalSearchSubscription:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("supportsUniversalSearchSubscription"), a3);
}

@end
