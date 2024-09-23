@implementation SASyncGetAnchors

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("GetAnchors");
}

+ (id)getAnchors
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appMetaDataList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("appMetaDataList"), v3);
}

- (void)setAppMetaDataList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("appMetaDataList"), (uint64_t)a3);
}

- (NSString)authToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("authToken"));
}

- (void)setAuthToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("authToken"), a3);
}

- (BOOL)companionOfMUDevice
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("companionOfMUDevice"));
}

- (void)setCompanionOfMUDevice:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("companionOfMUDevice"), a3);
}

- (NSDictionary)customVocabSources
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("customVocabSources"));
}

- (void)setCustomVocabSources:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("customVocabSources"), a3);
}

- (BOOL)includeAllKnownAnchors
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("includeAllKnownAnchors"));
}

- (void)setIncludeAllKnownAnchors:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("includeAllKnownAnchors"), a3);
}

- (NSString)primeToken
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("primeToken"));
}

- (void)setPrimeToken:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("primeToken"), a3);
}

- (NSArray)sources
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sources"));
}

- (void)setSources:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sources"), a3);
}

- (NSString)syncReason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syncReason"));
}

- (void)setSyncReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syncReason"), a3);
}

- (NSArray)watchAppMetaDataList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("watchAppMetaDataList"), v3);
}

- (void)setWatchAppMetaDataList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("watchAppMetaDataList"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
