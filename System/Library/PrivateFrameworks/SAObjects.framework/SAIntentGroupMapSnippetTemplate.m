@implementation SAIntentGroupMapSnippetTemplate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("MapSnippetTemplate");
}

+ (id)mapSnippetTemplate
{
  return objc_alloc_init((Class)a1);
}

- (SAUIColor)color
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("color"));
}

- (void)setColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("color"), a3);
}

- (SAIntentGroupDetailLabelTemplateComponent)detailLabelComponent
{
  return (SAIntentGroupDetailLabelTemplateComponent *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("detailLabelComponent"));
}

- (void)setDetailLabelComponent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("detailLabelComponent"), a3);
}

- (BOOL)interactive
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("interactive"));
}

- (void)setInteractive:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("interactive"), a3);
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (NSString)mapSize
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mapSize"));
}

- (void)setMapSize:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mapSize"), a3);
}

- (SAIntentGroupSetMapLocation)updateLocationCommand
{
  return (SAIntentGroupSetMapLocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("updateLocationCommand"));
}

- (void)setUpdateLocationCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("updateLocationCommand"), a3);
}

@end
