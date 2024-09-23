@implementation SBUILockScreenDisableAssertion

+ (void)setLockScreenDisableAssertionClass:(Class)a3
{
  __assertionClass = (uint64_t)a3;
}

+ (id)lockScreenDisableAssertionWithIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)__assertionClass;
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIdentifier:", v4);

  return v5;
}

- (SBUILockScreenDisableAssertion)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUILockScreenDisableAssertion;
  return -[SBUILockScreenDisableAssertion init](&v4, sel_init, a3);
}

- (id)description
{
  return 0;
}

@end
