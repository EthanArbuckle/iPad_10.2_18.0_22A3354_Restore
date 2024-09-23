@implementation SASExtractSpeechDataCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("ExtractSpeechDataCompleted");
}

+ (id)extractSpeechDataCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSData)speechData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechData"));
}

- (void)setSpeechData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechData"), a3);
}

- (NSString)speechDataUrl
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechDataUrl"));
}

- (void)setSpeechDataUrl:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechDataUrl"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
