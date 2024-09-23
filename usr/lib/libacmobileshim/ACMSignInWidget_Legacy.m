@implementation ACMSignInWidget_Legacy

- (id)accountLabel
{
  UILabel *accountLabel;
  objc_super v4;

  accountLabel = self->super._accountLabel;
  if (!accountLabel)
  {
    v4.receiver = self;
    v4.super_class = (Class)ACMSignInWidget_Legacy;
    accountLabel = -[ACMSignInWidget accountLabel](&v4, sel_accountLabel);
    -[UILabel setFont:](accountLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0));
  }
  return accountLabel;
}

@end
