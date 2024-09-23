@implementation SAEmailSend

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.email");
}

- (id)encodedClassName
{
  return CFSTR("Send");
}

+ (id)send
{
  return objc_alloc_init((Class)a1);
}

- (SAEmailEmail)email
{
  return (SAEmailEmail *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("email"));
}

- (void)setEmail:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("email"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
