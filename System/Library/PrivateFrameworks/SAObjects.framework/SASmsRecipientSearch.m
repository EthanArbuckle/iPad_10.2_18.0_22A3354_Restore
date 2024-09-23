@implementation SASmsRecipientSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("RecipientSearch");
}

+ (id)recipientSearch
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)clientShouldResolvePhonesAndEmails
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("clientShouldResolvePhonesAndEmails"));
}

- (void)setClientShouldResolvePhonesAndEmails:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("clientShouldResolvePhonesAndEmails"), a3);
}

- (NSArray)recipients
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("recipients"), v3);
}

- (void)setRecipients:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("recipients"), (uint64_t)a3);
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
