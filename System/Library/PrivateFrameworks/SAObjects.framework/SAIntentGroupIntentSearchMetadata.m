@implementation SAIntentGroupIntentSearchMetadata

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("IntentSearchMetadata");
}

+ (id)intentSearchMetadata
{
  return objc_alloc_init((Class)a1);
}

- (NSString)jsonData
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonData"));
}

- (void)setJsonData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonData"), a3);
}

- (NSString)metadataType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("metadataType"));
}

- (void)setMetadataType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("metadataType"), a3);
}

- (int64_t)version
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("version"));
}

- (void)setVersion:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("version"), a3);
}

@end
