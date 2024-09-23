@implementation SASTTSSelectionStatistics

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("TTSSelectionStatistics");
}

+ (id)tTSSelectionStatistics
{
  return objc_alloc_init((Class)a1);
}

- (NSString)completionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("completionType"));
}

- (void)setCompletionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("completionType"), a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (NSArray)listenedItems
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listenedItems"));
}

- (void)setListenedItems:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listenedItems"), a3);
}

- (int64_t)selectedItemIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("selectedItemIndex"));
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("selectedItemIndex"), a3);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
}

- (NSArray)timesListened
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timesListened"));
}

- (void)setTimesListened:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timesListened"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
