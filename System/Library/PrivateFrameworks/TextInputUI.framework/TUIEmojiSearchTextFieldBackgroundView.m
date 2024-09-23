@implementation TUIEmojiSearchTextFieldBackgroundView

- (TUIEmojiSearchTextFieldBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  TUIEmojiSearchTextFieldBackgroundView *v4;
  TUIEmojiSearchTextFieldBackgroundView *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextFieldBackgroundView;
  v4 = -[TUIEmojiSearchTextFieldBackgroundView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  v5 = v4;
  if (v4)
  {
    -[TUIEmojiSearchTextFieldBackgroundView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      -[TUIEmojiSearchTextFieldBackgroundView layer](v5, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCornerRadius:", height * 0.5);

      v7 = (uint64_t *)MEMORY[0x1E0CD2A60];
    }
    else
    {
      -[TUIEmojiSearchTextFieldBackgroundView layer](v5, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCornerRadius:", 12.0);

      v7 = (uint64_t *)MEMORY[0x1E0CD2A68];
    }
    v9 = *v7;
    -[TUIEmojiSearchTextFieldBackgroundView layer](v5, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerCurve:", v9);

    v11 = *MEMORY[0x1E0CD2EA0];
    -[TUIEmojiSearchTextFieldBackgroundView layer](v5, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositingFilter:", v11);

    -[TUIEmojiSearchTextFieldBackgroundView setBackgroundStyle:animated:](v5, "setBackgroundStyle:animated:", 1, 0);
  }
  return v5;
}

- (void)_setRenderConfig:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIEmojiSearchTextFieldBackgroundView;
  v4 = a3;
  -[TUIEmojiSearchTextFieldBackgroundView _setRenderConfig:](&v7, sel__setRenderConfig_, v4);
  v5 = objc_msgSend(v4, "lightKeyboard", v7.receiver, v7.super_class);

  if (v5)
    v6 = 1;
  else
    v6 = 2;
  -[TUIEmojiSearchTextFieldBackgroundView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v6);
}

- (void)setBackgroundStyle:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[6];

  if (self->_backgroundStyle != a3)
  {
    v4 = a4;
    self->_backgroundStyle = a3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__TUIEmojiSearchTextFieldBackgroundView_setBackgroundStyle_animated___block_invoke;
    v8[3] = &unk_1E24FB430;
    v8[4] = self;
    v8[5] = a3;
    v6 = (void (**)(_QWORD))_Block_copy(v8);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v6, 0, 0.3, 0.0);
    }
    else
    {
      -[TUIEmojiSearchTextFieldBackgroundView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAllAnimations");

      v6[2](v6);
    }

  }
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  -[TUIEmojiSearchTextFieldBackgroundView setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiSearchTextFieldBackgroundView;
  -[TUIEmojiSearchTextFieldBackgroundView layoutSubviews](&v8, sel_layoutSubviews);
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    -[TUIEmojiSearchTextFieldBackgroundView frame](self, "frame");
    v4 = v3 * 0.5;
    -[TUIEmojiSearchTextFieldBackgroundView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v4;
  }
  else
  {
    -[TUIEmojiSearchTextFieldBackgroundView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 12.0;
  }
  objc_msgSend(v5, "setCornerRadius:", v7);

}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

void __69__TUIEmojiSearchTextFieldBackgroundView_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.04, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2 != 1)
      return;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_2994);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v3);

}

id __69__TUIEmojiSearchTextFieldBackgroundView_setBackgroundStyle_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;

  v2 = a2;
  if (objc_msgSend(v2, "accessibilityContrast") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v2, "userInterfaceStyle") == 1)
    {
      v4 = 0.05;
      v5 = 1.0;
    }
    else
    {
      v5 = 0.1;
      v4 = 1.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v5, v4);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v3;

  return v6;
}

@end
