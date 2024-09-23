@implementation _UITextFieldSystemBackgroundProvider

- (id)preferredMetricsProvider
{
  return +[_UITextFieldSystemBackgroundProvider systemStyleMetricsProvider](_UITextFieldSystemBackgroundProvider, "systemStyleMetricsProvider");
}

+ (id)systemStyleMetricsProvider
{
  _UITextFieldPaddedMetricsProvider *v2;

  v2 = -[_UITextFieldPaddedMetricsProvider initWithSymmetricalPadding:]([_UITextFieldPaddedMetricsProvider alloc], "initWithSymmetricalPadding:", 7.0, 2.0);
  -[_UITextFieldPaddedMetricsProvider setMinimumIntrinsicHeight:](v2, "setMinimumIntrinsicHeight:", 30.0);
  return v2;
}

- (void)addToTextField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  -[_UITextFieldViewBackgroundProvider addToTextField:](&v7, sel_addToTextField_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_roundedRectBackgroundCornerRadius");
    -[UITextFieldBackgroundView setCornerRadius:](self->_systemBackgroundView, "setCornerRadius:");
  }
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextFieldSystemBackgroundProvider overridingSetBackgroundColor:](self, "overridingSetBackgroundColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setBackgroundColor:", v6);

}

- (id)overridingSetBackgroundColor:(id)a3
{
  -[UITextFieldBackgroundView setFillColor:](self->_systemBackgroundView, "setFillColor:", a3);
  return 0;
}

- (id)overridingGetBackgroundColor
{
  return -[UITextFieldBackgroundView fillColor](self->_systemBackgroundView, "fillColor");
}

- (int64_t)associatedBorderStyle
{
  return 3;
}

- (id)backgroundView
{
  UITextFieldBackgroundView *systemBackgroundView;
  void *v4;
  uint64_t v5;
  id v6;
  UITextFieldBackgroundView *v7;
  UITextFieldBackgroundView *v8;

  systemBackgroundView = self->_systemBackgroundView;
  if (!systemBackgroundView)
  {
    -[_UITextFieldBackgroundProvider textField](self, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEditing");

    v6 = objc_alloc(-[_UITextFieldSystemBackgroundProvider systemBackgroundViewClass](self, "systemBackgroundViewClass"));
    v7 = (UITextFieldBackgroundView *)objc_msgSend(v6, "initWithFrame:active:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_systemBackgroundView;
    self->_systemBackgroundView = v7;

    systemBackgroundView = self->_systemBackgroundView;
  }
  return systemBackgroundView;
}

- (Class)systemBackgroundViewClass
{
  void *v2;
  void *v3;
  void *v4;

  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_isKindOfClass();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
}

- (void)removeFromTextField
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_systemBackgroundView)
  {
    -[_UITextFieldBackgroundProvider textField](self, "textField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFieldBackgroundView fillColor](self->_systemBackgroundView, "fillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setBackgroundColor:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  -[_UITextFieldViewBackgroundProvider removeFromTextField](&v5, sel_removeFromTextField);
}

- (void)enabledDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UITextFieldBackgroundView *systemBackgroundView;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  -[_UITextFieldBackgroundProvider enabledDidChangeAnimated:](&v7, sel_enabledDidChangeAnimated_);
  systemBackgroundView = self->_systemBackgroundView;
  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextFieldBackgroundView setEnabled:animated:](systemBackgroundView, "setEnabled:animated:", objc_msgSend(v6, "isEnabled"), v3);

  -[_UITextFieldViewBackgroundProvider layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setProgress:(double)a3
{
  *(float *)&a3 = a3;
  -[UITextFieldBackgroundView setProgress:](self->_systemBackgroundView, "setProgress:", a3);
}

- (void)_buildDescription:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  -[_UITextFieldViewBackgroundProvider _buildDescription:](&v7, sel__buildDescription_, v4);
  -[UITextFieldBackgroundView fillColor](self->_systemBackgroundView, "fillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("fillColor"), v5);

}

@end
