@implementation SAPhoneVoiceMail

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("VoiceMail");
}

+ (id)voiceMail
{
  return objc_alloc_init((Class)a1);
}

- (NSString)filePath
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("filePath"));
}

- (void)setFilePath:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("filePath"), a3);
}

- (NSNumber)length
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("length"));
}

- (void)setLength:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("length"), a3);
}

@end
