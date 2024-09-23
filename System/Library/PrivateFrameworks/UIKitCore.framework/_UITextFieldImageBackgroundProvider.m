@implementation _UITextFieldImageBackgroundProvider

- (id)backgroundView
{
  return self->_backgroundView;
}

- (void)addToTextField:(id)a3
{
  id v4;
  _UITextFieldImageBackgroundView *v5;
  _UITextFieldImageBackgroundView *backgroundView;
  objc_super v7;

  v4 = a3;
  if (!self->_backgroundView)
  {
    v5 = (_UITextFieldImageBackgroundView *)objc_opt_new();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

  }
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldImageBackgroundProvider;
  -[_UITextFieldViewBackgroundProvider addToTextField:](&v7, sel_addToTextField_, v4);

}

- (void)enabledDidChangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _UITextFieldImageBackgroundView *backgroundView;
  _QWORD v7[5];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldImageBackgroundProvider;
  -[_UITextFieldBackgroundProvider enabledDidChangeAnimated:](&v8, sel_enabledDidChangeAnimated_);
  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v3)
    {
      backgroundView = self->_backgroundView;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __64___UITextFieldImageBackgroundProvider_enabledDidChangeAnimated___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", backgroundView, 5242880, v7, 0, 0.35);
    }
    else
    {
      -[_UITextFieldImageBackgroundProvider _applyCorrectImage](self, "_applyCorrectImage");
    }
    -[_UITextFieldImageBackgroundProvider layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)_applyCorrectImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "background");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEnabled") & 1) == 0)
  {
    objc_msgSend(v8, "disabledBackground");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = v3;
    v7 = v6;

    v3 = v7;
  }
  -[UIImageView setImage:](self->_backgroundView, "setImage:", v3);

}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldImageBackgroundProvider;
  -[_UITextFieldViewBackgroundProvider setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[_UITextFieldImageBackgroundProvider _applyCorrectImage](self, "_applyCorrectImage");
}

- (void)layoutIfNeeded
{
  void *v3;
  objc_super v4;

  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "borderRectForBounds:");
  -[UIImageView setFrame:](self->_backgroundView, "setFrame:");
  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldImageBackgroundProvider;
  -[_UITextFieldViewBackgroundProvider layoutIfNeeded](&v4, sel_layoutIfNeeded);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
