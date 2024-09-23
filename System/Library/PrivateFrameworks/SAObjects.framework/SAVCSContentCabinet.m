@implementation SAVCSContentCabinet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("ContentCabinet");
}

+ (id)contentCabinet
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)browseResults
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("browseResults"));
}

- (void)setBrowseResults:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("browseResults"), a3);
}

- (SAUIConfirmationView)confirmationView
{
  return (SAUIConfirmationView *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("confirmationView"));
}

- (void)setConfirmationView:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("confirmationView"), a3);
}

- (SAUITemplateButton)foregroundAppButton
{
  return (SAUITemplateButton *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("foregroundAppButton"));
}

- (void)setForegroundAppButton:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("foregroundAppButton"), a3);
}

- (NSNumber)fullScreenEnabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fullScreenEnabled"));
}

- (void)setFullScreenEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fullScreenEnabled"), a3);
}

- (NSArray)shelves
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("shelves"), v3);
}

- (void)setShelves:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("shelves"), (uint64_t)a3);
}

@end
