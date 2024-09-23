@implementation SAGetWatchAppIntentPolicyAndVocabResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetWatchAppIntentPolicyAndVocabResponse");
}

+ (id)getWatchAppIntentPolicyAndVocabResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)aceAppBundleInfos
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("aceAppBundleInfos"), v3);
}

- (void)setAceAppBundleInfos:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("aceAppBundleInfos"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
