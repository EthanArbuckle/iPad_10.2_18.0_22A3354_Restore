@implementation SALocalSearchAttribution

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("Attribution");
}

+ (id)attribution
{
  return objc_alloc_init((Class)a1);
}

- (NSString)attributionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("attributionId"));
}

- (void)setAttributionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("attributionId"), a3);
}

- (NSArray)urls
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("urls"));
}

- (void)setUrls:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("urls"), a3);
}

- (int64_t)version
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("version"));
}

- (void)setVersion:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("version"), a3);
}

@end
