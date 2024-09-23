@implementation SAMicroblogSocialCredentialResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("SocialCredentialResult");
}

+ (id)socialCredentialResult
{
  return objc_alloc_init((Class)a1);
}

- (SAMicroblogSocialCredential)socialCredential
{
  return (SAMicroblogSocialCredential *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("socialCredential"));
}

- (void)setSocialCredential:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("socialCredential"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
