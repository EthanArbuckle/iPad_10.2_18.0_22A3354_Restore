@implementation SAWeatherCondition

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.weather");
}

- (id)encodedClassName
{
  return CFSTR("Condition");
}

+ (id)condition
{
  return objc_alloc_init((Class)a1);
}

- (NSString)conditionCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("conditionCode"));
}

- (void)setConditionCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("conditionCode"), a3);
}

- (int64_t)conditionCodeIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("conditionCodeIndex"));
}

- (void)setConditionCodeIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("conditionCodeIndex"), a3);
}

@end
