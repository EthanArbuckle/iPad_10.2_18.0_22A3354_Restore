@implementation SAVCSContentButton

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.videocontent");
}

- (id)encodedClassName
{
  return CFSTR("ContentButton");
}

+ (id)contentButton
{
  return objc_alloc_init((Class)a1);
}

- (NSString)canonicalId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("canonicalId"));
}

- (void)setCanonicalId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("canonicalId"), a3);
}

- (SASTTemplateContentRating)contentRating
{
  return (SASTTemplateContentRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("contentRating"));
}

- (void)setContentRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("contentRating"), a3);
}

- (NSString)contentType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentType"));
}

- (void)setContentType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentType"), a3);
}

- (NSArray)togglePlayPauseCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("togglePlayPauseCommands"), &unk_1EE77C568);
}

- (void)setTogglePlayPauseCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("togglePlayPauseCommands"), (uint64_t)a3);
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("url"));
}

- (void)setUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("url"), a3);
}

@end
