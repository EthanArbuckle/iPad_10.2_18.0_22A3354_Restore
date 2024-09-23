@implementation ACMExternalAuthenticationRequestImpl

- (ACMExternalAuthenticationRequestImpl)init
{
  ACMExternalAuthenticationRequestImpl *v2;
  ACMExternalAuthenticationRequestImpl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACMExternalAuthenticationRequestImpl;
  v2 = -[ACMExternalAuthenticationRequestImpl init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ACMMessage setUserNameFieldEditable:](v2, "setUserNameFieldEditable:", 1);
  return v3;
}

@end
