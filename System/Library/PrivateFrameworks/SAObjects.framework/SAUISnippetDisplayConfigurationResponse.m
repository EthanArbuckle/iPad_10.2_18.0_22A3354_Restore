@implementation SAUISnippetDisplayConfigurationResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SnippetDisplayConfigurationResponse");
}

- (BOOL)accessibilityDifferentiateWithoutColor
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("accessibilityDifferentiateWithoutColor"));
}

- (void)setAccessibilityDifferentiateWithoutColor:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("accessibilityDifferentiateWithoutColor"), a3);
}

- (BOOL)accessibilityInvertColors
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("accessibilityInvertColors"));
}

- (void)setAccessibilityInvertColors:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("accessibilityInvertColors"), a3);
}

- (BOOL)accessibilityReduceMotion
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("accessibilityReduceMotion"));
}

- (void)setAccessibilityReduceMotion:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("accessibilityReduceMotion"), a3);
}

- (BOOL)accessibilityReduceTransparency
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("accessibilityReduceTransparency"));
}

- (void)setAccessibilityReduceTransparency:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("accessibilityReduceTransparency"), a3);
}

- (NSString)displayColorScheme
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayColorScheme"));
}

- (void)setDisplayColorScheme:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayColorScheme"), a3);
}

- (NSString)displayContrast
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayContrast"));
}

- (void)setDisplayContrast:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayContrast"), a3);
}

- (NSString)displayGamut
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayGamut"));
}

- (void)setDisplayGamut:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayGamut"), a3);
}

- (NSString)dynamicTypeSize
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dynamicTypeSize"));
}

- (void)setDynamicTypeSize:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dynamicTypeSize"), a3);
}

- (SAUISize)estimatedVisibleSnippetDisplaySize
{
  return (SAUISize *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("estimatedVisibleSnippetDisplaySize"));
}

- (void)setEstimatedVisibleSnippetDisplaySize:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("estimatedVisibleSnippetDisplaySize"), a3);
}

- (NSString)textDirection
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("textDirection"));
}

- (void)setTextDirection:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("textDirection"), a3);
}

- (NSString)textLegibilityWeight
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("textLegibilityWeight"));
}

- (void)setTextLegibilityWeight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("textLegibilityWeight"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
