@implementation SALocalSearchRating

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("Rating");
}

+ (id)rating
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("count"));
}

- (void)setCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("count"), a3);
}

- (double)maxValue
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("maxValue"));
}

- (void)setMaxValue:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("maxValue"), a3);
}

- (NSString)providerId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("providerId"));
}

- (void)setProviderId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("providerId"), a3);
}

- (double)value
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("value"), a3);
}

@end
