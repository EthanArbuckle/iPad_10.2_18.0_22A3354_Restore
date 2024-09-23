@implementation SAUITemplateButton

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("Button");
}

+ (id)button
{
  return objc_alloc_init((Class)a1);
}

- (SAUIImageResource)backgroundImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("backgroundImage"));
}

- (void)setBackgroundImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("backgroundImage"), a3);
}

- (NSString)backgroundImageStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("backgroundImageStyle"));
}

- (void)setBackgroundImageStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("backgroundImageStyle"), a3);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSNumber)generateForegroundAppSearchButtonLabel
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("generateForegroundAppSearchButtonLabel"));
}

- (void)setGenerateForegroundAppSearchButtonLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("generateForegroundAppSearchButtonLabel"), a3);
}

- (NSDictionary)highlightedTitles
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("highlightedTitles"), v3);
}

- (void)setHighlightedTitles:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("highlightedTitles"), (uint64_t)a3);
}

- (NSDictionary)titles
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("titles"), v3);
}

- (void)setTitles:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("titles"), (uint64_t)a3);
}

@end
