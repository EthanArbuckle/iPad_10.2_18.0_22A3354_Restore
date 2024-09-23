@implementation SASTMessageItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("MessageItem");
}

+ (id)messageItem
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)audioMessageURL
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("audioMessageURL"));
}

- (void)setAudioMessageURL:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("audioMessageURL"), a3);
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (SAUIDecoratedText)content
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("content"));
}

- (void)setContent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("content"), a3);
}

- (SAUIDecoratedText)recipient
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recipient"));
}

- (void)setRecipient:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recipient"), a3);
}

- (NSString)serviceType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serviceType"));
}

- (void)setServiceType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serviceType"), a3);
}

@end
