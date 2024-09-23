@implementation SACFScriptUrlInformation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("ScriptUrlInformation");
}

+ (id)scriptUrlInformation
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)downloadUrl
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("downloadUrl"));
}

- (void)setDownloadUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("downloadUrl"), a3);
}

- (NSDictionary)headerFields
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headerFields"));
}

- (void)setHeaderFields:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headerFields"), a3);
}

- (NSString)requestMethodType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestMethodType"));
}

- (void)setRequestMethodType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestMethodType"), a3);
}

@end
