@implementation SASyncAnchor

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("Anchor");
}

+ (id)anchor
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appBundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appBundleId"));
}

- (void)setAppBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appBundleId"), a3);
}

- (SASyncAppMetaData)appMetaData
{
  return (SASyncAppMetaData *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appMetaData"));
}

- (void)setAppMetaData:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appMetaData"), a3);
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("count"));
}

- (void)setCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("count"), a3);
}

- (NSString)generation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("generation"));
}

- (void)setGeneration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("generation"), a3);
}

- (NSString)intentSlotName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentSlotName"));
}

- (void)setIntentSlotName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentSlotName"), a3);
}

- (NSString)key
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("key"));
}

- (void)setKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("key"), a3);
}

- (NSNumber)suspendDurationInSeconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("suspendDurationInSeconds"));
}

- (void)setSuspendDurationInSeconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("suspendDurationInSeconds"), a3);
}

- (NSString)suspendReason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("suspendReason"));
}

- (void)setSuspendReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("suspendReason"), a3);
}

- (NSString)validity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("validity"));
}

- (void)setValidity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("validity"), a3);
}

@end
