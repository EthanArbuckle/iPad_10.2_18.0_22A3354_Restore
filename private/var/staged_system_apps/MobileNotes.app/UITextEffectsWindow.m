@implementation UITextEffectsWindow

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  Class v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (_AXSAutomationEnabled())
  {
    v16.receiver = self;
    v16.super_class = (Class)UITextEffectsWindow;
    v8 = -[UITextEffectsWindow _accessibilityHitTest:withEvent:](&v16, "_accessibilityHitTest:withEvent:", v7, x, y);
LABEL_8:
    v11 = (void *)objc_claimAutoreleasedReturnValue(v8);
    goto LABEL_9;
  }
  v9 = NSClassFromString(CFSTR("UIRemoteKeyboardWindow"));
  if ((objc_opt_isKindOfClass(self, v9) & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)UITextEffectsWindow;
    v8 = -[UITextEffectsWindow _accessibilityHitTest:withEvent:](&v15, "_accessibilityHitTest:withEvent:", v7, x, y);
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextEffectsWindow _icaxKeyboardImpl](self, "_icaxKeyboardImpl"));
  -[UITextEffectsWindow convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_accessibilityHitTest:withEvent:", v7));
  if (!v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)UITextEffectsWindow;
    v12 = -[UITextEffectsWindow _accessibilityHitTest:withEvent:](&v14, "_accessibilityHitTest:withEvent:", v7, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

LABEL_9:
  return v11;
}

@end
