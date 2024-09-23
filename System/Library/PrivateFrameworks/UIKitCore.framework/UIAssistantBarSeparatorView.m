@implementation UIAssistantBarSeparatorView

+ (double)preferredWidth
{
  return 2.0;
}

- (UIAssistantBarSeparatorView)initWithFrame:(CGRect)a3
{
  UIAssistantBarSeparatorView *v3;
  UIView *v4;
  UIView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIAssistantBarSeparatorView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIAssistantBarSeparatorView setInnerSeparatorView:](v3, "setInnerSeparatorView:", v5);

    -[UIAssistantBarSeparatorView innerSeparatorView](v3, "innerSeparatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v6);

  }
  return v3;
}

- (BOOL)_usesLightStyle
{
  void *v2;
  char v3;

  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");

  return v3;
}

- (void)_updateVisualStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[UIColor grayColor](UIColor, "grayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[UIAssistantBarSeparatorView _usesLightStyle](self, "_usesLightStyle"))
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
    v4 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v4;
  }
  -[UIAssistantBarSeparatorView innerSeparatorView](self, "innerSeparatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAssistantBarSeparatorView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIAssistantBarSeparatorView _updateVisualStyle](self, "_updateVisualStyle");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAssistantBarSeparatorView;
  -[UIView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UIAssistantBarSeparatorView;
  -[UIView layoutSubviews](&v19, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIAssistantBarSeparatorView innerSeparatorView](self, "innerSeparatorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v6, 32.0);

  -[UIAssistantBarSeparatorView innerSeparatorView](self, "innerSeparatorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = round(v4 + (v8 - v15) * 0.5);
  -[UIAssistantBarSeparatorView innerSeparatorView](self, "innerSeparatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v12, v17, v14, v16);

}

- (UIView)innerSeparatorView
{
  return self->_innerSeparatorView;
}

- (void)setInnerSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_innerSeparatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerSeparatorView, 0);
}

@end
