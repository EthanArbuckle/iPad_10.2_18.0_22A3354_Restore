@implementation SASStartPronunciationRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartPronunciationRequest");
}

+ (id)startPronunciationRequest
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
  return 1;
}

@end
