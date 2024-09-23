@implementation SAUIConfirmationView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ConfirmationView");
}

+ (id)confirmationView
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)allConfirmationOptions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("allConfirmationOptions"), v3);
}

- (void)setAllConfirmationOptions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("allConfirmationOptions"), (uint64_t)a3);
}

- (NSString)cancelTrigger
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("cancelTrigger"));
}

- (void)setCancelTrigger:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("cancelTrigger"), a3);
}

- (NSArray)confirmCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("confirmCommands"), &unk_1EE77C568);
}

- (void)setConfirmCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("confirmCommands"), (uint64_t)a3);
}

- (NSString)confirmText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confirmText"));
}

- (void)setConfirmText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confirmText"), a3);
}

- (NSArray)denyCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("denyCommands"), &unk_1EE77C568);
}

- (void)setDenyCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("denyCommands"), (uint64_t)a3);
}

- (NSString)denyText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("denyText"));
}

- (void)setDenyText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("denyText"), a3);
}

- (NSNumber)generateForegroundAppSearchButtonLabel
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("generateForegroundAppSearchButtonLabel"));
}

- (void)setGenerateForegroundAppSearchButtonLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("generateForegroundAppSearchButtonLabel"), a3);
}

- (NSString)style
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("style"));
}

- (void)setStyle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("style"), a3);
}

- (NSString)subtitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
