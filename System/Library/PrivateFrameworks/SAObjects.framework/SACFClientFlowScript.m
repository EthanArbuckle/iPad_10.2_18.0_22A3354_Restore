@implementation SACFClientFlowScript

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("ClientFlowScript");
}

+ (id)clientFlowScript
{
  return objc_alloc_init((Class)a1);
}

- (NSData)compressedScript
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("compressedScript"));
}

- (void)setCompressedScript:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("compressedScript"), a3);
}

- (SACFScriptEncryptionParameters)encryptionParameters
{
  return (SACFScriptEncryptionParameters *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("encryptionParameters"));
}

- (void)setEncryptionParameters:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("encryptionParameters"), a3);
}

- (NSString)fileContentType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fileContentType"));
}

- (void)setFileContentType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fileContentType"), a3);
}

- (NSString)jsScript
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsScript"));
}

- (void)setJsScript:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsScript"), a3);
}

- (NSData)jsScriptChecksum
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsScriptChecksum"));
}

- (void)setJsScriptChecksum:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsScriptChecksum"), a3);
}

- (NSString)jsScriptIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsScriptIdentifier"));
}

- (void)setJsScriptIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsScriptIdentifier"), a3);
}

- (BOOL)shouldCacheScript
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldCacheScript"));
}

- (void)setShouldCacheScript:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldCacheScript"), a3);
}

- (BOOL)shouldSkipExecution
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldSkipExecution"));
}

- (void)setShouldSkipExecution:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldSkipExecution"), a3);
}

- (SACFScriptUrlInformation)urlInformation
{
  return (SACFScriptUrlInformation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("urlInformation"));
}

- (void)setUrlInformation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("urlInformation"), a3);
}

@end
