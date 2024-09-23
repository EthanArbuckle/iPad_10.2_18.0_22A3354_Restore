@implementation SASClientBoundConfusionNetwork

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("ClientBoundConfusionNetwork");
}

+ (id)clientBoundConfusionNetwork
{
  return objc_alloc_init((Class)a1);
}

- (SASRecognition)rawRecognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("rawRecognition"));
}

- (void)setRawRecognition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("rawRecognition"), a3);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
