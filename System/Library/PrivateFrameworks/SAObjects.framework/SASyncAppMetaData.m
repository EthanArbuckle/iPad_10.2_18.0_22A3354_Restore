@implementation SASyncAppMetaData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("AppMetaData");
}

+ (id)appMetaData
{
  return objc_alloc_init((Class)a1);
}

- (SASyncAppIdentifyingInfo)appIdentifyingInfo
{
  return (SASyncAppIdentifyingInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appIdentifyingInfo"));
}

- (void)setAppIdentifyingInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appIdentifyingInfo"), a3);
}

- (NSNumber)developerMode
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("developerMode"));
}

- (void)setDeveloperMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("developerMode"), a3);
}

- (NSArray)syncSlots
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syncSlots"));
}

- (void)setSyncSlots:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syncSlots"), a3);
}

@end
