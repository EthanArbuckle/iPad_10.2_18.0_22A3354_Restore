@implementation SACFAbstractClientCommandCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("AbstractClientCommandCompleted");
}

+ (id)abstractClientCommandCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)outputLogs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outputLogs"));
}

- (void)setOutputLogs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outputLogs"), a3);
}

- (NSString)results
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("results"));
}

- (void)setResults:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("results"), a3);
}

- (int64_t)status
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("status"));
}

- (void)setStatus:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("status"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
