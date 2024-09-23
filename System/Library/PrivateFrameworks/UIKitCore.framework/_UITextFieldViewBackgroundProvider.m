@implementation _UITextFieldViewBackgroundProvider

- (void)setNeedsDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldViewBackgroundProvider;
  -[_UITextFieldBackgroundProvider setNeedsDisplay](&v4, sel_setNeedsDisplay);
  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (void)addToTextField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldViewBackgroundProvider;
  v4 = a3;
  -[_UITextFieldBackgroundProvider addToTextField:](&v7, sel_addToTextField_, v4);
  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v5 != v6)
  {
    objc_msgSend(v6, "insertSubview:atIndex:", v5, 0);
    -[_UITextFieldViewBackgroundProvider layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)layoutIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldViewBackgroundProvider;
  -[_UITextFieldBackgroundProvider layoutIfNeeded](&v8, sel_layoutIfNeeded);
  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_backgroundBounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "_continuousCornerRadius");
  v6 = v5;
  objc_msgSend(v3, "_backgroundCoverView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", v6);

}

- (void)removeFromTextField
{
  void *v3;
  objc_super v4;

  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldViewBackgroundProvider;
  -[_UITextFieldBackgroundProvider removeFromTextField](&v4, sel_removeFromTextField);
}

- (void)didChangeFirstResponder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldViewBackgroundProvider;
  -[_UITextFieldBackgroundProvider didChangeFirstResponder](&v3, sel_didChangeFirstResponder);
  -[_UITextFieldViewBackgroundProvider layoutIfNeeded](self, "layoutIfNeeded");
}

- (UIView)backgroundView
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextFieldViewBackgroundProvider.m"), 36, CFSTR("%@ (subclass of _UITextFieldViewBackgroundProvider) needs to override -backgroundView."), objc_opt_class());

  return 0;
}

- (id)overridingSetBackgroundColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  return v4;
}

- (BOOL)hitTestView:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5 == v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)populateArchivedSubviews:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UITextFieldViewBackgroundProvider;
  -[_UITextFieldBackgroundProvider populateArchivedSubviews:](&v6, sel_populateArchivedSubviews_, v4);
  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "removeObject:", v5);

}

- (void)_buildDescription:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldViewBackgroundProvider;
  -[_UITextFieldBackgroundProvider _buildDescription:](&v7, sel__buildDescription_, v4);
  -[_UITextFieldViewBackgroundProvider backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("backgroundView"), v5);

}

@end
