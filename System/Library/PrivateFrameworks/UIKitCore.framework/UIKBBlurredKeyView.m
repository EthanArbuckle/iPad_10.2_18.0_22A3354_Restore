@implementation UIKBBlurredKeyView

- (UIKBBlurredKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  UIKBBlurredKeyView *v5;
  void *v6;
  uint64_t v7;
  UIKBBackdropView *v8;
  uint64_t v9;
  UIKBBackdropView *backdropView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKBBlurredKeyView;
  v5 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v12, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "keyBackdropStyle");

    v8 = [UIKBBackdropView alloc];
    -[UIView bounds](v5, "bounds");
    v9 = -[UIKBBackdropView initWithFrame:style:](v8, "initWithFrame:style:", v7);
    backdropView = v5->_backdropView;
    v5->_backdropView = (UIKBBackdropView *)v9;

    -[UIView insertSubview:atIndex:](v5, "insertSubview:atIndex:", v5->_backdropView, 0);
  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBBlurredKeyView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_backdropView, "setFrame:");
}

- (void)setRenderConfig:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  UIKBBlurredKeyView *v12;
  BOOL v13;

  v4 = a3;
  -[UIKBContainerKeyView keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "visualStyling") & 0xFF00) == 0x7F00)
  {
    v6 = 1;
  }
  else
  {
    -[UIKBContainerKeyView keyplane](self, "keyplane");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "visualStyle") == 5;

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__UIKBBlurredKeyView_setRenderConfig___block_invoke;
  v10[3] = &unk_1E16B4008;
  v13 = v6;
  v11 = v4;
  v12 = self;
  v8 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
  -[UIKBKeyView configureBackdropView:forRenderConfig:](self, "configureBackdropView:forRenderConfig:", self->_backdropView, v8);
  v9.receiver = self;
  v9.super_class = (Class)UIKBBlurredKeyView;
  -[UIKBContainerKeyView setRenderConfig:](&v9, sel_setRenderConfig_, v8);

}

uint64_t __38__UIKBBlurredKeyView_setRenderConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 48))
    v2 = 3900;
  else
    v2 = objc_msgSend(*(id *)(a1 + 32), "keyBackdropStyle");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 608), "transitionToStyle:", v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
