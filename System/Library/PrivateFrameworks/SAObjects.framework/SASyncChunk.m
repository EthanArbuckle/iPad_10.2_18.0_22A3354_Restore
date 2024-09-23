@implementation SASyncChunk

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("Chunk");
}

+ (id)chunk
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

- (NSString)postGen
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("postGen"));
}

- (void)setPostGen:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("postGen"), a3);
}

- (NSString)preGen
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preGen"));
}

- (void)setPreGen:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preGen"), a3);
}

- (NSArray)toAdd
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("toAdd"), v3);
}

- (void)setToAdd:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("toAdd"), (uint64_t)a3);
}

- (NSArray)toRemove
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("toRemove"), v3);
}

- (void)setToRemove:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("toRemove"), (uint64_t)a3);
}

- (NSString)validity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("validity"));
}

- (void)setValidity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("validity"), a3);
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
