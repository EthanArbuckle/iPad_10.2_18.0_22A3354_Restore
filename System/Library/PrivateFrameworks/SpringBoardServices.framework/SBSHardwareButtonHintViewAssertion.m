@implementation SBSHardwareButtonHintViewAssertion

- (SBSHardwareButtonHintViewAssertion)initWithButtonKind:(int64_t)a3 assertionName:(id)a4 reason:(id)a5 receiveRight:(id)a6
{
  SBSHardwareButtonHintViewAssertion *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSHardwareButtonHintViewAssertion;
  result = -[SBSAssertion initWithAssertionName:reason:receiveRight:](&v8, sel_initWithAssertionName_reason_receiveRight_, a4, a5, a6);
  if (result)
    result->_buttonKind = a3;
  return result;
}

- (void)setContentVisibility:(int64_t)a3 animationSettings:(id)a4
{
  SBSHardwareButtonService *v6;
  id v7;

  v7 = a4;
  if (-[SBSAssertion isValid](self, "isValid"))
  {
    v6 = objc_alloc_init(SBSHardwareButtonService);
    -[SBSHardwareButtonService updateHintViewContentVisibility:forButton:animationSettings:](v6, "updateHintViewContentVisibility:forButton:animationSettings:", a3, self->_buttonKind, v7);

  }
}

@end
