@implementation SAAnswerDictionaryStructuredAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("DictionaryStructuredAnswer");
}

+ (id)dictionaryStructuredAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSString)category
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("category"));
}

- (void)setCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("category"), a3);
}

- (NSArray)definitionGroups
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("definitionGroups"), v3);
}

- (void)setDefinitionGroups:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("definitionGroups"), (uint64_t)a3);
}

- (NSString)phoneticPronunciation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phoneticPronunciation"));
}

- (void)setPhoneticPronunciation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phoneticPronunciation"), a3);
}

- (NSURL)sound
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("sound"));
}

- (void)setSound:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("sound"), a3);
}

- (NSArray)syllables
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("syllables"));
}

- (void)setSyllables:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("syllables"), a3);
}

- (NSString)word
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("word"));
}

- (void)setWord:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("word"), a3);
}

@end
