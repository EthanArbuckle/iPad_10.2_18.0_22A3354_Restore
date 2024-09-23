@implementation SAAppCustomVocabulary

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AppCustomVocabulary");
}

+ (id)appCustomVocabulary
{
  return objc_alloc_init((Class)a1);
}

- (NSString)intentSlotValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentSlotValue"));
}

- (void)setIntentSlotValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentSlotValue"), a3);
}

- (SAIntentGroupCustomVocabularyEntity)vocabularyEntity
{
  return (SAIntentGroupCustomVocabularyEntity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("vocabularyEntity"));
}

- (void)setVocabularyEntity:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("vocabularyEntity"), a3);
}

- (NSString)vocabularyIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("vocabularyIdentifier"));
}

- (void)setVocabularyIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("vocabularyIdentifier"), a3);
}

@end
