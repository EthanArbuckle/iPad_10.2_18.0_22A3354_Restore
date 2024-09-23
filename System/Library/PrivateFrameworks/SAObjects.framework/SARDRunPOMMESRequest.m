@implementation SARDRunPOMMESRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("RunPOMMESRequest");
}

- (NSData)nlFallbackParse
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nlFallbackParse"));
}

- (void)setNlFallbackParse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nlFallbackParse"), a3);
}

- (NSData)nlUserParses
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nlUserParses"));
}

- (void)setNlUserParses:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nlUserParses"), a3);
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recognition"));
}

- (void)setRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recognition"), a3);
}

- (NSString)requestType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestType"));
}

- (void)setRequestType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestType"), a3);
}

- (NSString)responseVariantResult
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseVariantResult"));
}

- (void)setResponseVariantResult:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseVariantResult"), a3);
}

- (NSString)userId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userId"));
}

- (void)setUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userId"), a3);
}

- (NSString)utterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterance"));
}

- (void)setUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterance"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
