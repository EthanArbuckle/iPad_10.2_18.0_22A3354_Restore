@implementation SASTCountdownTimerItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("CountdownTimerItem");
}

+ (id)countdownTimerItem
{
  return objc_alloc_init((Class)a1);
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("action"));
}

- (void)setAction:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("action"), a3);
}

- (int64_t)actionDelayInSeconds
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("actionDelayInSeconds"));
}

- (void)setActionDelayInSeconds:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("actionDelayInSeconds"), a3);
}

- (SAUIColor)bodyBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("bodyBackgroundColor"));
}

- (void)setBodyBackgroundColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("bodyBackgroundColor"), a3);
}

- (SAUIColor)countdownTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("countdownTextColor"));
}

- (void)setCountdownTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("countdownTextColor"), a3);
}

- (SAUIColor)headerBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("headerBackgroundColor"));
}

- (void)setHeaderBackgroundColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("headerBackgroundColor"), a3);
}

- (NSString)headerText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headerText"));
}

- (void)setHeaderText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headerText"), a3);
}

- (SAUIColor)headerTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("headerTextColor"));
}

- (void)setHeaderTextColor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("headerTextColor"), a3);
}

@end
