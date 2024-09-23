@implementation UIAccessibilityAddToDragSessionCustomAction

- (UIAccessibilityAddToDragSessionCustomAction)initWithPoint:(CGPoint)a3 inSourceView:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  UIAccessibilityAddToDragSessionCustomAction *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  UIKitAccessibilityLocalizedString(CFSTR("add.to.session"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityAddToDragSessionCustomAction;
  v9 = -[UIAccessibilityAddToDragSessionCustomAction initWithName:target:selector:](&v11, sel_initWithName_target_selector_, v8, self, sel__accessibilityInvokeAddToSession);

  if (v9)
  {
    v9->_pt.x = x;
    v9->_pt.y = y;
    objc_storeWeak((id *)&v9->_view, v7);
  }

  return v9;
}

- (BOOL)_accessibilityInvokeAddToSession
{
  UIAccessibilityAddToDragSessionCustomAction *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "_accessibilityAddItemsToDragSessionAtPoint:", v2->_pt.x, v2->_pt.y);

  return (char)v2;
}

- (id)_accessibilityCustomActionIdentifier
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  NSStringFromCGPoint(self->_pt);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UIAccessibilityAddToDragSessionCustomAction.\nTarget:%p\npoint:%@"), WeakRetained, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end
