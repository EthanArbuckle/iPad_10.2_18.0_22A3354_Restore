@implementation SAUITemplateSegmentedControl

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("SegmentedControl");
}

+ (id)segmentedControl
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)backgroundColors
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("backgroundColors"), v3);
}

- (void)setBackgroundColors:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("backgroundColors"), (uint64_t)a3);
}

- (NSDictionary)textColors
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("textColors"), v3);
}

- (void)setTextColors:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("textColors"), (uint64_t)a3);
}

- (NSArray)titles
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("titles"));
}

- (void)setTitles:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("titles"), a3);
}

@end
