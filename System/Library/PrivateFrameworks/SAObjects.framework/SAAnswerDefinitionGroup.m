@implementation SAAnswerDefinitionGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("DefinitionGroup");
}

+ (id)definitionGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)definitionEntries
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("definitionEntries"), v3);
}

- (void)setDefinitionEntries:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("definitionEntries"), (uint64_t)a3);
}

- (NSString)origin
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("origin"));
}

- (void)setOrigin:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("origin"), a3);
}

- (NSString)partOfSpeech
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("partOfSpeech"));
}

- (void)setPartOfSpeech:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("partOfSpeech"), a3);
}

- (NSArray)synonyms
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("synonyms"));
}

- (void)setSynonyms:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("synonyms"), a3);
}

@end
