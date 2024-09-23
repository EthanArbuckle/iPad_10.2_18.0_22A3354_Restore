@implementation SAIntentGroupAceAppIntentPolicyAndVocab

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AceAppIntentPolicyAndVocab");
}

+ (id)aceAppIntentPolicyAndVocab
{
  return objc_alloc_init((Class)a1);
}

- (SAIntentGroupProtobufMessage)aceAppBundleInfo
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("aceAppBundleInfo"));
}

- (void)setAceAppBundleInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("aceAppBundleInfo"), a3);
}

@end
