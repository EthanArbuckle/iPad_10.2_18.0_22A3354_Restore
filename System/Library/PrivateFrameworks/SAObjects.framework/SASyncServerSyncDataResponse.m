@implementation SASyncServerSyncDataResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("ServerSyncDataResponse");
}

- (NSString)assistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assistantId"));
}

- (void)setAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assistantId"), a3);
}

- (int64_t)batchNumber
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("batchNumber"));
}

- (void)setBatchNumber:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("batchNumber"), a3);
}

- (NSArray)dataBatch
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("dataBatch"), v3);
}

- (void)setDataBatch:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("dataBatch"), (uint64_t)a3);
}

- (BOOL)lastBatch
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("lastBatch"));
}

- (void)setLastBatch:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("lastBatch"), a3);
}

- (NSString)responseCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseCode"));
}

- (void)setResponseCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseCode"), a3);
}

- (NSString)serverGeneration
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serverGeneration"));
}

- (void)setServerGeneration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serverGeneration"), a3);
}

- (NSString)syncType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syncType"));
}

- (void)setSyncType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syncType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
