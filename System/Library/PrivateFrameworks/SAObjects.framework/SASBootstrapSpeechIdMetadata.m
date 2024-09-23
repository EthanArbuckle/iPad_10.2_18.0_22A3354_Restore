@implementation SASBootstrapSpeechIdMetadata

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("BootstrapSpeechIdMetadata");
}

+ (id)bootstrapSpeechIdMetadata
{
  return objc_alloc_init((Class)a1);
}

- (NSString)bootstrapSpeechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bootstrapSpeechId"));
}

- (void)setBootstrapSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bootstrapSpeechId"), a3);
}

- (NSString)deviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceType"));
}

- (void)setDeviceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceType"), a3);
}

- (NSDate)keychainCreationDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keychainCreationDate"));
}

- (void)setKeychainCreationDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keychainCreationDate"), a3);
}

@end
