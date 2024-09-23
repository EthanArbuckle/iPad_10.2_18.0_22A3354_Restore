@implementation SAUITemplateBaseItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("BaseItem");
}

+ (id)baseItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)communicationOptions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("communicationOptions"));
}

- (void)setCommunicationOptions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("communicationOptions"), a3);
}

- (SAUITemplateEdgeInsets)fullScreenPaddingDelta
{
  return (SAUITemplateEdgeInsets *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("fullScreenPaddingDelta"));
}

- (void)setFullScreenPaddingDelta:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("fullScreenPaddingDelta"), a3);
}

- (BOOL)hasPriorityLayout
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("hasPriorityLayout"));
}

- (void)setHasPriorityLayout:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("hasPriorityLayout"), a3);
}

- (SAUITemplateEdgeInsets)padding
{
  return (SAUITemplateEdgeInsets *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("padding"));
}

- (void)setPadding:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("padding"), a3);
}

- (NSArray)presentationOptions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("presentationOptions"));
}

- (void)setPresentationOptions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("presentationOptions"), a3);
}

- (BOOL)shouldBeOffscreenInPartial
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldBeOffscreenInPartial"));
}

- (void)setShouldBeOffscreenInPartial:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldBeOffscreenInPartial"), a3);
}

@end
