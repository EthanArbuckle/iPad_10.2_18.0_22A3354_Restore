@implementation SASAcousticFeature

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("AcousticFeature");
}

+ (id)acousticFeature
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)acousticFeaturePerFrame
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("acousticFeaturePerFrame"));
}

- (void)setAcousticFeaturePerFrame:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("acousticFeaturePerFrame"), a3);
}

- (NSNumber)frameDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("frameDuration"));
}

- (void)setFrameDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("frameDuration"), a3);
}

@end
