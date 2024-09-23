@implementation UIWindowSceneTouchCancellationOnRotationAssertion

- (UIWindowSceneTouchCancellationOnRotationAssertion)initWithWindowScene:(id)a3
{
  id v4;
  UIWindowSceneTouchCancellationOnRotationAssertion *v5;
  UIWindowSceneTouchCancellationOnRotationAssertion *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowSceneTouchCancellationOnRotationAssertion;
  v5 = -[UIWindowSceneTouchCancellationOnRotationAssertion init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_windowScene, v4);
    objc_msgSend(v4, "_setShouldDisableTouchCancellationOnRotation:", 1);

  }
  return v6;
}

- (void)cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_setShouldDisableTouchCancellationOnRotation:", 0);

}

- (void)dealloc
{
  objc_super v3;

  -[UIWindowSceneTouchCancellationOnRotationAssertion cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneTouchCancellationOnRotationAssertion;
  -[UIWindowSceneTouchCancellationOnRotationAssertion dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
