@implementation ISURLAuthenticationChallenge

- (ISURLAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3
{
  ISURLAuthenticationChallenge *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISURLAuthenticationChallenge;
  v4 = -[ISAuthenticationChallenge initWithAuthenticationChallenge:](&v7, sel_initWithAuthenticationChallenge_);
  if (v4)
  {
    v5 = objc_msgSend(a3, "protectionSpace");
    v4->super._localizedMessage = (NSString *)(id)objc_msgSend((id)objc_opt_class(), "_messageForProtectionSpace:", v5);
    v4->super._localizedTitle = (NSString *)(id)objc_msgSend((id)objc_opt_class(), "_titleForProtectionSpace:", v5);
  }
  return v4;
}

- (void)cancelAuthentication
{
  objc_msgSend(-[ISURLAuthenticationChallenge sender](self, "sender"), "cancelAuthenticationChallenge:", self->super._challenge);
}

- (int64_t)failureCount
{
  return -[NSURLAuthenticationChallenge previousFailureCount](self->super._challenge, "previousFailureCount");
}

- (BOOL)hasPassword
{
  return -[NSURLCredential hasPassword](-[NSURLAuthenticationChallenge proposedCredential](self->super._challenge, "proposedCredential"), "hasPassword");
}

- (id)password
{
  return -[NSURLCredential password](-[NSURLAuthenticationChallenge proposedCredential](self->super._challenge, "proposedCredential"), "password");
}

- (id)sender
{
  return -[NSURLAuthenticationChallenge sender](self->super._challenge, "sender");
}

- (id)user
{
  return -[NSURLCredential user](-[NSURLAuthenticationChallenge proposedCredential](self->super._challenge, "proposedCredential"), "user");
}

- (void)useCredential:(id)a3
{
  objc_msgSend(-[ISURLAuthenticationChallenge sender](self, "sender"), "useCredential:forAuthenticationChallenge:", a3, self->super._challenge);
}

+ (id)_messageForProtectionSpace:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v14;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = objc_msgSend(a3, "host");
  v6 = objc_msgSend(a3, "port");
  if (v6 >= 1)
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%ld"), v5, v6);
  v7 = objc_msgSend(a3, "isProxy");
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (v7)
  {
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PROXY_AUTHENTICATION_MESSAGE_%@_%@"), &stru_24C441158, 0);
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@"), 0, objc_msgSend(a3, "protocol"), v5);
  }
  else
  {
    v11 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SERVER_AUTHENTICATION_MESSAGE_%@"), &stru_24C441158, 0);
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v5, v14);
  }
  objc_msgSend(v4, "appendString:", v10);
  if (objc_msgSend(a3, "receivesCredentialSecurely"))
    v12 = CFSTR("SECURE_AUTH");
  else
    v12 = CFSTR("INSECURE_AUTH");
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v12, &stru_24C441158, 0));
  return v4;
}

+ (id)_titleForProtectionSpace:(id)a3
{
  const __CFString *v3;

  if (objc_msgSend(a3, "isProxy"))
    v3 = CFSTR("PROXY_AUTHENTICATION_TITLE");
  else
    v3 = CFSTR("SERVER_AUTHENTICATION_TITLE");
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v3, &stru_24C441158, 0);
}

@end
