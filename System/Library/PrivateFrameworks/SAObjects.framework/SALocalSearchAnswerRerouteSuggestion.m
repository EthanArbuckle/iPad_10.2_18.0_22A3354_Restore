@implementation SALocalSearchAnswerRerouteSuggestion

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("AnswerRerouteSuggestion");
}

+ (id)answerRerouteSuggestion
{
  return objc_alloc_init((Class)a1);
}

- (NSString)response
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("response"));
}

- (void)setResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("response"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
