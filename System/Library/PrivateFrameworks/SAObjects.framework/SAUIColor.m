@implementation SAUIColor

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("Color");
}

+ (id)color
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)alpha
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alpha"));
}

- (void)setAlpha:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alpha"), a3);
}

- (int64_t)blueValue
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("blueValue"));
}

- (void)setBlueValue:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("blueValue"), a3);
}

- (int64_t)greenValue
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("greenValue"));
}

- (void)setGreenValue:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("greenValue"), a3);
}

- (int64_t)redValue
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("redValue"));
}

- (void)setRedValue:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("redValue"), a3);
}

@end
