@implementation SAIntentGroupCustomVocabularyPerson

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("CustomVocabularyPerson");
}

+ (id)customVocabularyPerson
{
  return objc_alloc_init((Class)a1);
}

- (NSString)firstName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firstName"));
}

- (void)setFirstName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firstName"), a3);
}

- (NSString)lastName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastName"));
}

- (void)setLastName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastName"), a3);
}

- (NSString)middleName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("middleName"));
}

- (void)setMiddleName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("middleName"), a3);
}

- (NSString)nickname
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nickname"));
}

- (void)setNickname:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nickname"), a3);
}

- (NSString)relationship
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("relationship"));
}

- (void)setRelationship:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("relationship"), a3);
}

@end
