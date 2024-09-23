@implementation SADialogConfiguration

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DialogConfiguration");
}

- (SAAceSerializable)context
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("context"));
}

- (void)setContext:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("context"), a3);
}

- (NSString)gender
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("gender"), a3);
}

- (NSString)languageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageCode"));
}

- (void)setLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageCode"), a3);
}

@end
