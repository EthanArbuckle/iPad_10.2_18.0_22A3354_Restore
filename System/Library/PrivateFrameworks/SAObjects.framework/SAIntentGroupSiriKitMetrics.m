@implementation SAIntentGroupSiriKitMetrics

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitMetrics");
}

+ (id)siriKitMetrics
{
  return objc_alloc_init((Class)a1);
}

- (NSString)intentTypeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentTypeName"));
}

- (void)setIntentTypeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentTypeName"), a3);
}

- (NSString)interactionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionId"));
}

- (void)setInteractionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionId"), a3);
}

- (NSString)metricsStateOrigin
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("metricsStateOrigin"));
}

- (void)setMetricsStateOrigin:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("metricsStateOrigin"), a3);
}

- (NSString)resultCandidateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultCandidateId"));
}

- (void)setResultCandidateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultCandidateId"), a3);
}

- (NSString)taskId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("taskId"));
}

- (void)setTaskId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("taskId"), a3);
}

- (NSNumber)taskStepStartTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("taskStepStartTime"));
}

- (void)setTaskStepStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("taskStepStartTime"), a3);
}

- (NSString)turnId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("turnId"));
}

- (void)setTurnId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("turnId"), a3);
}

@end
