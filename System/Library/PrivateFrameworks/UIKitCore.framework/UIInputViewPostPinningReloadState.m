@implementation UIInputViewPostPinningReloadState

- (void)dealloc
{
  objc_super v3;

  -[UIInputViewPostPinningReloadState setResponderToReload:](self, "setResponderToReload:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewPostPinningReloadState;
  -[UIInputViewPostPinningReloadState dealloc](&v3, sel_dealloc);
}

+ (id)stateWithResponder:(id)a3
{
  id v3;
  UIInputViewPostPinningReloadState *v4;

  v3 = a3;
  v4 = objc_alloc_init(UIInputViewPostPinningReloadState);
  -[UIInputViewPostPinningReloadState setResponderToReload:](v4, "setResponderToReload:", v3);

  return v4;
}

- (UIResponder)responderToReload
{
  return self->_responderPreventedFromSettingInputViews;
}

- (void)setResponderToReload:(id)a3
{
  objc_storeStrong((id *)&self->_responderPreventedFromSettingInputViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderPreventedFromSettingInputViews, 0);
}

@end
