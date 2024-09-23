@implementation _UIRemoteInputViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteInputViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v6, sel_viewServiceDidTerminateWithError_, a3);
  -[UIViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[_UIKeyboardUsageTracking keyboardExtensionCrashed](_UIKeyboardUsageTracking, "keyboardExtensionCrashed");
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "switchToCurrentSystemInputMode");

  }
}

- (CGSize)intrinsicContentSizeForServiceSize:(CGSize)result
{
  double v3;

  if (result.height == 0.0)
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", objc_msgSend((id)UIApp, "_frontMostAppOrientation", result.width));
  v3 = -1.0;
  result.width = v3;
  return result;
}

- (void)viewDidInvalidateIntrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_rootInputWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateViewSizingConstraints");

  -[UIViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_didChangeKeyplaneWithContext:", v8);

}

@end
