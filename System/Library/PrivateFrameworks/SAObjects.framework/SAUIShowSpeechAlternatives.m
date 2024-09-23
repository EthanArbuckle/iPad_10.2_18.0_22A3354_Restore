@implementation SAUIShowSpeechAlternatives

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ShowSpeechAlternatives");
}

+ (id)showSpeechAlternatives
{
  return objc_alloc_init((Class)a1);
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recognition"));
}

- (void)setRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recognition"), a3);
}

- (NSString)requestId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestId"));
}

- (void)setRequestId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestId"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
