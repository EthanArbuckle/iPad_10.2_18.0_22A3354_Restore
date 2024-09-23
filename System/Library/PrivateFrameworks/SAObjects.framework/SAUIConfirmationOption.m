@implementation SAUIConfirmationOption

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ConfirmationOption");
}

+ (id)confirmationOption
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)active
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("active"));
}

- (void)setActive:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("active"), a3);
}

- (NSNumber)automaticConfirmationThreshold
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("automaticConfirmationThreshold"));
}

- (void)setAutomaticConfirmationThreshold:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("automaticConfirmationThreshold"), a3);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSArray)delayExpiryCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("delayExpiryCommands"), &unk_1EE77C568);
}

- (void)setDelayExpiryCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("delayExpiryCommands"), (uint64_t)a3);
}

- (NSString)iconLabel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("iconLabel"));
}

- (void)setIconLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("iconLabel"), a3);
}

- (NSString)iconType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("iconType"));
}

- (void)setIconType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("iconType"), a3);
}

- (NSString)buttonRole
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("buttonRole"));
}

- (void)setButtonRole:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("buttonRole"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSNumber)speechDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechDuration"));
}

- (void)setSpeechDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechDuration"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

@end
