@implementation SAPerformDataDetectionResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PerformDataDetectionResult");
}

+ (id)performDataDetectionResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)detectionTarget
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("detectionTarget"));
}

- (void)setDetectionTarget:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("detectionTarget"), a3);
}

- (NSArray)matches
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("matches"), v3);
}

- (void)setMatches:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("matches"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
