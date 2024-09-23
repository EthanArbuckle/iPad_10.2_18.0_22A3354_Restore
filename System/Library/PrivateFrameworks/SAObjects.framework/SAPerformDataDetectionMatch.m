@implementation SAPerformDataDetectionMatch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PerformDataDetectionMatch");
}

+ (id)performDataDetectionMatch
{
  return objc_alloc_init((Class)a1);
}

- (NSString)dataDetectionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dataDetectionType"));
}

- (void)setDataDetectionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dataDetectionType"), a3);
}

- (NSNumber)length
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("length"));
}

- (void)setLength:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("length"), a3);
}

- (NSNumber)location
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
