@implementation SASmsRecipientSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("RecipientSearchCompleted");
}

+ (id)recipientSearchCompleted
{
  return objc_alloc_init((Class)a1);
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
  return 0;
}

@end
