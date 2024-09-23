@implementation SASVTokenData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("TokenData");
}

+ (id)tokenData
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)endTimeMillis
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endTimeMillis"));
}

- (void)setEndTimeMillis:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endTimeMillis"), a3);
}

- (float)score
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("score"));
}

- (void)setScore:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("score"), a3);
}

- (NSNumber)startTimeMillis
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startTimeMillis"));
}

- (void)setStartTimeMillis:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startTimeMillis"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
