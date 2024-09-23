@implementation SAUIListenForPronunciationCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ListenForPronunciationCompleted");
}

+ (id)listenForPronunciationCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)errorCode
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("errorCode"));
}

- (void)setErrorCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("errorCode"), a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (SASPronunciationData)pronunciationData
{
  return (SASPronunciationData *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("pronunciationData"));
}

- (void)setPronunciationData:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("pronunciationData"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
