@implementation SADialog

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Dialog");
}

- (BOOL)canUseServerTTS
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("canUseServerTTS"));
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("canUseServerTTS"), a3);
}

- (SADialogText)caption
{
  return (SADialogText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("caption"));
}

- (void)setCaption:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("caption"), a3);
}

- (SADialogConfiguration)configuration
{
  return (SADialogConfiguration *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("configuration"));
}

- (void)setConfiguration:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("configuration"), a3);
}

- (SADialogText)content
{
  return (SADialogText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("content"));
}

- (void)setContent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("content"), a3);
}

- (NSString)dialogIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogIdentifier"));
}

- (void)setDialogIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogIdentifier"), a3);
}

- (BOOL)printedOnly
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("printedOnly"));
}

- (void)setPrintedOnly:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("printedOnly"), a3);
}

- (BOOL)spokenOnly
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("spokenOnly"));
}

- (void)setSpokenOnly:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("spokenOnly"), a3);
}

@end
