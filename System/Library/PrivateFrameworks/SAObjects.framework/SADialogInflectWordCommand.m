@implementation SADialogInflectWordCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.dialog");
}

- (id)encodedClassName
{
  return CFSTR("InflectWordCommand");
}

+ (id)inflectWordCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)constraints
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("constraints"));
}

- (void)setConstraints:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("constraints"), a3);
}

- (BOOL)defaultToSemantic
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("defaultToSemantic"));
}

- (void)setDefaultToSemantic:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("defaultToSemantic"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSString)locale
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("locale"));
}

- (void)setLocale:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("locale"), a3);
}

- (NSString)semanticFeatureName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("semanticFeatureName"));
}

- (void)setSemanticFeatureName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("semanticFeatureName"), a3);
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
  return 1;
}

@end
