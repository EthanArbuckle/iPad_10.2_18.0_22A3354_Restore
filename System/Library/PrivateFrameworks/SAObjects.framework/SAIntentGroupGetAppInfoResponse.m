@implementation SAIntentGroupGetAppInfoResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("GetAppInfoResponse");
}

+ (id)getAppInfoResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appInfo
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("appInfo"), v3);
}

- (void)setAppInfo:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("appInfo"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
