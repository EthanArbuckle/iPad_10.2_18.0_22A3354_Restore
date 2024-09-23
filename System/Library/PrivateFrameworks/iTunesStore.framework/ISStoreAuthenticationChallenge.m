@implementation ISStoreAuthenticationChallenge

- (ISStoreAuthenticationChallenge)init
{
  ISStoreAuthenticationChallenge *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISStoreAuthenticationChallenge;
  v2 = -[ISStoreAuthenticationChallenge init](&v4, sel_init);
  if (v2)
  {
    -[ISAuthenticationChallenge setLocalizedTitle:](v2, "setLocalizedTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ENTER_PASSWORD"), &stru_24C441158, 0));
    -[ISStoreAuthenticationChallenge setUserNameIsEditable:](v2, "setUserNameIsEditable:", 1);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ISStoreAuthenticationChallenge setPassword:](self, "setPassword:", 0);
  -[ISStoreAuthenticationChallenge setUser:](self, "setUser:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ISStoreAuthenticationChallenge;
  -[ISAuthenticationChallenge dealloc](&v3, sel_dealloc);
}

- (BOOL)userNameIsEmail
{
  return 1;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (BOOL)hasPassword
{
  return self->_hasPassword;
}

- (void)setHasPassword:(BOOL)a3
{
  self->_hasPassword = a3;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURLAuthenticationChallengeSender)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  self->_sender = (NSURLAuthenticationChallengeSender *)a3;
}

- (NSString)user
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)userNameIsEditable
{
  return self->_userNameIsEditable;
}

- (void)setUserNameIsEditable:(BOOL)a3
{
  self->_userNameIsEditable = a3;
}

@end
