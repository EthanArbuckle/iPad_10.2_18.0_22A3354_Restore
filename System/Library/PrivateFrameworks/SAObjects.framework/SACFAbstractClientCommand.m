@implementation SACFAbstractClientCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("AbstractClientCommand");
}

+ (id)abstractClientCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSString)domain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domain"));
}

- (void)setDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domain"), a3);
}

- (NSString)jsFileNameSuffix
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsFileNameSuffix"));
}

- (void)setJsFileNameSuffix:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsFileNameSuffix"), a3);
}

- (NSArray)jsLibraries
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("jsLibraries"), v3);
}

- (void)setJsLibraries:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("jsLibraries"), (uint64_t)a3);
}

- (NSString)jsParameters
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsParameters"));
}

- (void)setJsParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsParameters"), a3);
}

- (NSString)jsScript
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsScript"));
}

- (void)setJsScript:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsScript"), a3);
}

- (BOOL)shouldCacheBytecode
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldCacheBytecode"));
}

- (void)setShouldCacheBytecode:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldCacheBytecode"), a3);
}

- (BOOL)shouldCacheScript
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldCacheScript"));
}

- (void)setShouldCacheScript:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldCacheScript"), a3);
}

- (BOOL)shouldRestartContext
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldRestartContext"));
}

- (void)setShouldRestartContext:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldRestartContext"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
