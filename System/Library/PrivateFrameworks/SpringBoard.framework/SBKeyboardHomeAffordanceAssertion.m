@implementation SBKeyboardHomeAffordanceAssertion

+ (id)assertionForGestureWindow:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGestureWindow:", v4);

  return v5;
}

- (SBKeyboardHomeAffordanceAssertion)init
{
  return -[SBKeyboardHomeAffordanceAssertion initWithGestureWindow:](self, "initWithGestureWindow:", 0);
}

- (SBKeyboardHomeAffordanceAssertion)initWithGestureWindow:(id)a3
{
  id v4;
  SBKeyboardHomeAffordanceAssertion *v5;
  SBKeyboardHomeAffordanceAssertion *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardHomeAffordanceAssertion;
  v5 = -[SBKeyboardHomeAffordanceAssertion init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceWindow, v4);
    +[SBKeyboardHomeAffordanceController sharedInstance](SBKeyboardHomeAffordanceController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerAssertion:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBKeyboardHomeAffordanceController sharedInstance](SBKeyboardHomeAffordanceController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterAssertion:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBKeyboardHomeAffordanceAssertion;
  -[SBKeyboardHomeAffordanceAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  +[SBKeyboardHomeAffordanceController sharedInstance](SBKeyboardHomeAffordanceController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterAssertion:", self);

}

- (void)setAdditionalEdgeMargin:(double)a3
{
  id v5;

  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_additionalEdgeMargin = a3;
    +[SBKeyboardHomeAffordanceController sharedInstance](SBKeyboardHomeAffordanceController, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didChangeAdditionalEdgeMarginForAssertion:", self);

  }
}

- (double)additionalEdgeMargin
{
  return self->_additionalEdgeMargin;
}

- (UIWindow)sourceWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_sourceWindow);
}

- (void)setSourceWindow:(id)a3
{
  objc_storeWeak((id *)&self->_sourceWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceWindow);
}

@end
