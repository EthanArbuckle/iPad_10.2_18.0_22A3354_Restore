@implementation SAUserConfidenceScore

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("UserConfidenceScore");
}

+ (id)userConfidenceScore
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)confidenceScore
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("confidenceScore"));
}

- (void)setConfidenceScore:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("confidenceScore"), a3);
}

- (NSString)sharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sharedUserId"));
}

- (void)setSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sharedUserId"), a3);
}

@end
