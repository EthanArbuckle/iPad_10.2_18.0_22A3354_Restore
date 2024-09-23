@implementation UNCMuteAssertion

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UNCMuteAssertion;
  return -[UNCMuteAssertion init](&v3, sel_init);
}

- (BOOL)isActiveForThreadIdentifier:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCMuteAssertion)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UNCMuteAssertion;
  return -[UNCMuteAssertion init](&v4, sel_init, a3);
}

@end
