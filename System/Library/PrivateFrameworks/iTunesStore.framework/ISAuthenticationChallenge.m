@implementation ISAuthenticationChallenge

- (ISAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3
{
  ISAuthenticationChallenge *v4;

  v4 = -[ISAuthenticationChallenge init](self, "init");
  if (v4)
    v4->_challenge = (NSURLAuthenticationChallenge *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[ISAuthenticationChallenge setLocalizedMessage:](self, "setLocalizedMessage:", 0);
  -[ISAuthenticationChallenge setLocalizedTitle:](self, "setLocalizedTitle:", 0);

  self->_challenge = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISAuthenticationChallenge;
  -[ISAuthenticationChallenge dealloc](&v3, sel_dealloc);
}

- (void)cancelAuthentication
{
  -[NSURLAuthenticationChallengeSender cancelAuthenticationChallenge:](-[ISAuthenticationChallenge sender](self, "sender"), "cancelAuthenticationChallenge:", self->_challenge);
}

- (int64_t)failureCount
{
  return 0;
}

- (BOOL)hasPassword
{
  return 0;
}

- (NSString)password
{
  return 0;
}

- (NSURLAuthenticationChallengeSender)sender
{
  return 0;
}

- (NSString)user
{
  return 0;
}

- (void)useCredential:(id)a3
{
  -[NSURLAuthenticationChallengeSender useCredential:forAuthenticationChallenge:](-[ISAuthenticationChallenge sender](self, "sender"), "useCredential:forAuthenticationChallenge:", a3, self->_challenge);
}

- (BOOL)userNameIsEditable
{
  return 1;
}

- (BOOL)userNameIsEmail
{
  return 0;
}

- (NSString)localizedMessage
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalizedMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)localizedTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
