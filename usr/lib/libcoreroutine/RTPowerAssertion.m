@implementation RTPowerAssertion

- (RTPowerAssertion)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_timeout_);
}

- (RTPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  id v5;
  void *v6;
  RTPowerAssertion *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && ((v9.receiver = self,
         v9.super_class = (Class)RTPowerAssertion,
         (self = -[RTPowerAssertion init](&v9, sel_init)) == 0)
     || (v6 = (void *)CPPowerAssertionCreate(), (self->_powerAssertion = v6) != 0)))
  {
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *powerAssertion;
  objc_super v4;

  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    CFRelease(powerAssertion);
    self->_powerAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RTPowerAssertion;
  -[RTPowerAssertion dealloc](&v4, sel_dealloc);
}

@end
