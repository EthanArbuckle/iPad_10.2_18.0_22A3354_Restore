@implementation SAPerformDataDetection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PerformDataDetection");
}

+ (id)performDataDetection
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)detectionTargets
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("detectionTargets"));
}

- (void)setDetectionTargets:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("detectionTargets"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
