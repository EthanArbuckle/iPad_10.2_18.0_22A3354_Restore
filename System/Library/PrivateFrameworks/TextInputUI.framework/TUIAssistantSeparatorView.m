@implementation TUIAssistantSeparatorView

- (TUIAssistantSeparatorView)initWithFrame:(CGRect)a3
{
  TUIAssistantSeparatorView *v3;
  TUIAssistantSeparatorView *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIAssistantSeparatorView;
  v3 = -[TUIAssistantSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TUIAssistantSeparatorView _setCornerRadius:](v3, "_setCornerRadius:", *(double *)&kTUISeparatorCornerRadius);
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TUIAssistantSeparatorView setInnerSeparatorView:](v4, "setInnerSeparatorView:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantSeparatorView innerSeparatorView](v4, "innerSeparatorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[TUIAssistantSeparatorView innerSeparatorView](v4, "innerSeparatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantSeparatorView addSubview:](v4, "addSubview:", v9);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TUIAssistantSeparatorView;
  -[TUIAssistantSeparatorView layoutSubviews](&v17, sel_layoutSubviews);
  -[TUIAssistantSeparatorView bounds](self, "bounds");
  v4 = v3;
  -[TUIAssistantSeparatorView innerSeparatorView](self, "innerSeparatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v4, 19.0);

  v6 = TUIScreenScaleForView(self);
  -[TUIAssistantSeparatorView innerSeparatorView](self, "innerSeparatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  UIRectCenteredYInRectScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[TUIAssistantSeparatorView innerSeparatorView](self, "innerSeparatorView", *(_QWORD *)&v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

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

+ (id)barButtonItem
{
  TUIAssistantSeparatorView *v2;
  void *v3;

  v2 = objc_alloc_init(TUIAssistantSeparatorView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v2);
  objc_msgSend(v3, "setWidth:", 1.0);

  return v3;
}

@end
