@implementation TLKRoundedCornerLabel

- (TLKRoundedCornerLabel)initWithProminence:(unint64_t)a3
{
  TLKRoundedCornerLabel *v4;
  TLKLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TLKRoundedCornerLabel;
  v4 = -[TLKView init](&v14, sel_init);
  if (v4)
  {
    v5 = -[TLKLabel initWithProminence:]([TLKLabel alloc], "initWithProminence:", a3);
    -[TLKRoundedCornerLabel setLabel:](v4, "setLabel:", v5);

    -[TLKRoundedCornerLabel label](v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);

    -[TLKRoundedCornerLabel label](v4, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKRoundedCornerLabel addSubview:](v4, "addSubview:", v7);

    -[TLKRoundedCornerLabel label](v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v8);

    -[TLKRoundedCornerLabel setCustomAlignmentRectInsets:](v4, "setCustomAlignmentRectInsets:", 0.0, -2.0, 0.0, -2.0);
    -[TLKRoundedCornerLabel label](v4, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 1);

    v10 = (void *)objc_opt_new();
    -[TLKRoundedCornerLabel setBorderView:](v4, "setBorderView:", v10);
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 1.0);

    objc_msgSend(v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 2.0);

    -[TLKRoundedCornerLabel addSubview:](v4, "addSubview:", v10);
    -[TLKRoundedCornerLabel updateFont](v4, "updateFont");

  }
  return v4;
}

- (void)setSizeConfiguration:(unint64_t)a3
{
  if (self->_sizeConfiguration != a3)
  {
    self->_sizeConfiguration = a3;
    -[TLKRoundedCornerLabel updateFont](self, "updateFont");
  }
}

- (void)updateFont
{
  unint64_t v3;
  double v4;
  void *v5;
  unint64_t v6;
  double *v7;
  void *v8;
  id v9;

  v3 = -[TLKRoundedCornerLabel sizeConfiguration](self, "sizeConfiguration");
  v4 = 0.0;
  if (v3 <= 2)
    v4 = dbl_1AC7899D8[v3];
  v5 = (void *)MEMORY[0x1E0DC37E8];
  v6 = -[TLKRoundedCornerLabel sizeConfiguration](self, "sizeConfiguration");
  v7 = (double *)MEMORY[0x1E0DC4B70];
  if (v6 != 2)
    v7 = (double *)MEMORY[0x1E0DC4B88];
  objc_msgSend(v5, "systemFontOfSize:weight:", v4, *v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TLKRoundedCornerLabel label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

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
  double x;
  double y;
  double width;
  double height;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v17.receiver = self;
  v17.super_class = (Class)TLKRoundedCornerLabel;
  -[TLKView layoutSubviews](&v17, sel_layoutSubviews);
  -[TLKRoundedCornerLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKRoundedCornerLabel label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TLKRoundedCornerLabel bounds](self, "bounds");
  if (!CGRectEqualToRect(v18, *MEMORY[0x1E0C9D648]))
  {
    -[TLKRoundedCornerLabel bounds](self, "bounds");
    v20 = CGRectInset(v19, -2.0, 0.0);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    -[TLKRoundedCornerLabel borderView](self, "borderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", x, y, width, height);

  }
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TLKRoundedCornerLabel label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveLayoutSizeFittingSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKRoundedCornerLabel;
  -[TLKRoundedCornerLabel traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKRoundedCornerLabel traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKRoundedCornerLabel traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKRoundedCornerLabel;
  -[TLKRoundedCornerLabel didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TLKRoundedCornerLabel;
  v4 = a3;
  -[UIView tlk_updateForAppearance:](&v11, sel_tlk_updateForAppearance_, v4);
  -[TLKRoundedCornerLabel label](self, "label", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorForProminence:", objc_msgSend(v5, "prominence"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  -[TLKRoundedCornerLabel borderView](self, "borderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderColor:", v7);

  -[TLKRoundedCornerLabel borderView](self, "borderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableAppearanceForView:", v10);

}

- (BOOL)allowsVibrancy
{
  return 1;
}

- (double)effectiveBaselineOffsetFromBottom
{
  return 0.1;
}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (unint64_t)sizeConfiguration
{
  return self->_sizeConfiguration;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
