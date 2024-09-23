@implementation SASTTemplateStarRating

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("TemplateStarRating");
}

+ (id)templateStarRating
{
  return objc_alloc_init((Class)a1);
}

- (double)maximumValue
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("maximumValue"));
}

- (void)setMaximumValue:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("maximumValue"), a3);
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
