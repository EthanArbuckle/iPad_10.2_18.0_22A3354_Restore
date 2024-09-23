@implementation SAQuickStopCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("QuickStopCompleted");
}

- (NSString)categoryStopped
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("categoryStopped"));
}

- (void)setCategoryStopped:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("categoryStopped"), a3);
}

- (NSNumber)confirmationRequired
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confirmationRequired"));
}

- (void)setConfirmationRequired:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confirmationRequired"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
