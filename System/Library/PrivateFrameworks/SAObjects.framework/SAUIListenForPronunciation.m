@implementation SAUIListenForPronunciation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ListenForPronunciation");
}

+ (id)listenForPronunciation
{
  return objc_alloc_init((Class)a1);
}

- (SASPronunciationContext)context
{
  return (SASPronunciationContext *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("context"));
}

- (void)setContext:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("context"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
