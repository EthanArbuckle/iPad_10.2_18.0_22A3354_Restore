@implementation SAAnswerDirectAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("DirectAnswer");
}

+ (id)directAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSString)answer
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("answer"));
}

- (void)setAnswer:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("answer"), a3);
}

- (SAAnswerSpeakableAnswer)speakableAnswer
{
  return (SAAnswerSpeakableAnswer *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("speakableAnswer"));
}

- (void)setSpeakableAnswer:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("speakableAnswer"), a3);
}

@end
