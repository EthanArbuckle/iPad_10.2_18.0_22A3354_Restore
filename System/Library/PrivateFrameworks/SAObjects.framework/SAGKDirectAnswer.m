@implementation SAGKDirectAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
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

- (NSString)confidenceLevel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confidenceLevel"));
}

- (void)setConfidenceLevel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confidenceLevel"), a3);
}

- (SAGKSpeakableAnswer)speakableAnswer
{
  return (SAGKSpeakableAnswer *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("speakableAnswer"));
}

- (void)setSpeakableAnswer:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("speakableAnswer"), a3);
}

@end
