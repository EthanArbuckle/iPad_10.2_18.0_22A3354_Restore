@implementation SACFScriptEncryptionParameters

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("ScriptEncryptionParameters");
}

+ (id)scriptEncryptionParameters
{
  return objc_alloc_init((Class)a1);
}

- (NSData)encryptionKey
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("encryptionKey"));
}

- (void)setEncryptionKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("encryptionKey"), a3);
}

- (NSData)hmac
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hmac"));
}

- (void)setHmac:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hmac"), a3);
}

- (NSData)hmacKey
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hmacKey"));
}

- (void)setHmacKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hmacKey"), a3);
}

- (NSData)initializationVector
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("initializationVector"));
}

- (void)setInitializationVector:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("initializationVector"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

@end
