@implementation SAUIFetchSpeechAlternatives

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("FetchSpeechAlternatives");
}

+ (id)fetchSpeechAlternatives
{
  return objc_alloc_init((Class)a1);
}

- (NSString)requestId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestId"));
}

- (void)setRequestId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
