@implementation TUBackdropView

- (TUBackdropView)initWithFrame:(CGRect)a3
{
  TUBackdropView *v3;
  void *v4;
  uint64_t v5;
  UIVisualEffectView *backdropView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUBackdropView;
  v3 = -[TUBackdropView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
    backdropView = v3->_backdropView;
    v3->_backdropView = (UIVisualEffectView *)v5;

    -[TUBackdropView addSubview:](v3, "addSubview:", v3->_backdropView);
    -[TUBackdropView setOpaque:](v3, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUBackdropView setBackgroundColor:](v3, "setBackgroundColor:", v7);

  }
  return v3;
}

- (UIView)contentView
{
  void *v2;
  void *v3;

  -[TUBackdropView backdropView](self, "backdropView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUBackdropView;
  -[TUBackdropView layoutSubviews](&v12, sel_layoutSubviews);
  -[TUBackdropView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUBackdropView backdropView](self, "backdropView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
