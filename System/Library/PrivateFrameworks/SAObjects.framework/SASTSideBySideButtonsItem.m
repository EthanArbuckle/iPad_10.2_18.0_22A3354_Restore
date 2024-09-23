@implementation SASTSideBySideButtonsItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("SideBySideButtonsItem");
}

+ (id)sideBySideButtonsItem
{
  return objc_alloc_init((Class)a1);
}

- (NSString)buttonsViewStyle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("buttonsViewStyle"));
}

- (void)setButtonsViewStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("buttonsViewStyle"), a3);
}

- (SASTTemplateAction)primaryButtonAction
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("primaryButtonAction"));
}

- (void)setPrimaryButtonAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("primaryButtonAction"), a3);
}

- (BOOL)primaryButtonEnabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("primaryButtonEnabled"));
}

- (void)setPrimaryButtonEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("primaryButtonEnabled"), a3);
}

- (NSString)primaryButtonLabel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("primaryButtonLabel"));
}

- (void)setPrimaryButtonLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("primaryButtonLabel"), a3);
}

- (SAUIColor)primaryButtonTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("primaryButtonTextColor"));
}

- (void)setPrimaryButtonTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("primaryButtonTextColor"), a3);
}

- (SASTTemplateAction)secondaryButtonAction
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("secondaryButtonAction"));
}

- (void)setSecondaryButtonAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("secondaryButtonAction"), a3);
}

- (BOOL)secondaryButtonEnabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("secondaryButtonEnabled"));
}

- (void)setSecondaryButtonEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("secondaryButtonEnabled"), a3);
}

- (NSString)secondaryButtonLabel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("secondaryButtonLabel"));
}

- (void)setSecondaryButtonLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("secondaryButtonLabel"), a3);
}

@end
