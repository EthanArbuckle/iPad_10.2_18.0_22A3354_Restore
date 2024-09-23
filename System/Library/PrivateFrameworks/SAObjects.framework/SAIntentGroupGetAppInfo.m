@implementation SAIntentGroupGetAppInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("GetAppInfo");
}

+ (id)getAppInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appIdentifyingInfo
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("appIdentifyingInfo"), v3);
}

- (void)setAppIdentifyingInfo:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("appIdentifyingInfo"), (uint64_t)a3);
}

- (BOOL)shouldSearchLocallyOnly
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldSearchLocallyOnly"));
}

- (void)setShouldSearchLocallyOnly:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldSearchLocallyOnly"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
