@implementation TLKStoreButton

- (TLKStoreButton)init
{
  TLKStoreButton *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLKStoreButton;
  v2 = -[TLKStoreButton init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);
    -[TLKStoreButton setBackgroundView:](v2, "setBackgroundView:", v3);
    -[TLKStoreButton addSubview:](v2, "addSubview:", v3);
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v4, "setBaselineAdjustment:", 1);
    objc_msgSend(v4, "setTextAlignment:", 1);
    -[TLKStoreButton setLabel:](v2, "setLabel:", v4);
    -[TLKStoreButton addSubview:](v2, "addSubview:", v4);
    -[TLKStoreButton setUseCompactMode:](v2, "setUseCompactMode:", 0);

  }
  return v2;
}

- (void)setUseCompactMode:(BOOL)a3
{
  double v4;
  void *v5;

  self->_useCompactMode = a3;
  v4 = 15.0;
  if (a3)
    v4 = 12.0;
  objc_msgSend(MEMORY[0x1E0DC37E8], "boldSystemFontOfSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKStoreButton setFont:](self, "setFont:", v5);

  -[TLKStoreButton setCornerRadius:](self, "setCornerRadius:", 0.0);
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[TLKStoreButton label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TLKStoreButton label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[TLKStoreButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (double)cornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[TLKStoreButton backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  if (a3 == 0.0)
  {
    -[TLKStoreButton effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v5 = v6 * 0.5;
  }
  -[TLKStoreButton backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v5);

  v9 = (uint64_t *)MEMORY[0x1E0CD2A68];
  if (a3 == 0.0)
    v9 = (uint64_t *)MEMORY[0x1E0CD2A60];
  v10 = *v9;
  -[TLKStoreButton backgroundView](self, "backgroundView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v10);

}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  BOOL v21;

  -[TLKStoreButton highlightView](self, "highlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[TLKProminenceView viewWithProminence:](TLKProminenceView, "viewWithProminence:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKStoreButton setHighlightView:](self, "setHighlightView:", v6);

    -[TLKStoreButton backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cornerRadius");
    v10 = v9;
    -[TLKStoreButton highlightView](self, "highlightView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v10);

    -[TLKStoreButton backgroundView](self, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cornerCurve");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKStoreButton highlightView](self, "highlightView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerCurve:", v15);

    -[TLKStoreButton highlightView](self, "highlightView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", 0.0);

    -[TLKStoreButton highlightView](self, "highlightView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKStoreButton addSubview:](self, "addSubview:", v19);

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __33__TLKStoreButton_setHighlighted___block_invoke;
  v20[3] = &unk_1E5C06FC8;
  v20[4] = self;
  v21 = a3;
  +[TLKUtilities performAnimatableChanges:](TLKUtilities, "performAnimatableChanges:", v20);
}

void __33__TLKStoreButton_setHighlighted___block_invoke(uint64_t a1, double a2)
{
  double v2;
  id v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Height;
  void *v14;
  double v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48.receiver = self;
  v48.super_class = (Class)TLKStoreButton;
  -[TLKStoreButton layoutSubviews](&v48, sel_layoutSubviews);
  -[TLKStoreButton bounds](self, "bounds");
  v3 = CGRectGetWidth(v49) * 0.5;
  if (v3 <= 6.0)
    v4 = v3;
  else
    v4 = 6.0;
  -[TLKStoreButton bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[TLKStoreButton bounds](self, "bounds");
  Height = CGRectGetHeight(v50);
  -[TLKStoreButton label](self, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "intrinsicContentSize");
  v16 = (Height - v15) * 0.5;
  v51.origin.x = v6;
  v51.origin.y = v8;
  v51.size.width = v10;
  v51.size.height = v12;
  v52 = CGRectInset(v51, v4, v16);
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  v20 = v52.size.height;

  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", self, x, y, width, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[TLKStoreButton label](self, "label");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[TLKStoreButton bounds](self, "bounds");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[TLKStoreButton backgroundView](self, "backgroundView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  -[TLKStoreButton bounds](self, "bounds");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[TLKStoreButton highlightView](self, "highlightView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  CGSize result;

  -[TLKStoreButton label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[TLKStoreButton backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cornerRadius");
  v9 = v5 + v8 * 2.0;

  v10 = -[TLKStoreButton useCompactMode](self, "useCompactMode");
  v11 = 74.0;
  if (v10)
    v11 = 59.0;
  if (v9 < v11)
    v9 = v11;
  v12 = -[TLKStoreButton useCompactMode](self, "useCompactMode");
  v13 = 24.0;
  if (!v12)
    v13 = 30.0;
  v14 = v9;
  result.height = v13;
  result.width = v14;
  return result;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[TLKStoreButton richTitle](self, "richTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;

  +[TLKMultilineText textWithString:](TLKRichText, "textWithString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxLines:", 1);
  -[TLKStoreButton setRichTitle:](self, "setRichTitle:", v4);
  -[TLKStoreButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)setRichTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_richTitle, a3);
  v5 = a3;
  -[TLKStoreButton label](self, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRichText:", v5);

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
  v9.super_class = (Class)TLKStoreButton;
  -[TLKStoreButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKStoreButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKStoreButton traitCollection](self, "traitCollection");
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
  v3.super_class = (Class)TLKStoreButton;
  -[TLKStoreButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TLKStoreButton;
  -[UIView tlk_updateForAppearance:](&v12, sel_tlk_updateForAppearance_, v4);
  if ((objc_msgSend(v4, "isVibrant") & 1) != 0 || -[TLKStoreButton isEmphasized](self, "isEmphasized"))
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "secondaryButtonColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
  }
  -[TLKStoreButton label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  if (v5)
  objc_msgSend(v4, "quaternaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isVibrant") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[TLKStoreButton backgroundView](self, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v8);

  -[TLKStoreButton backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableAppearanceForView:", v11);

}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (TLKRichText)richTitle
{
  return self->_richTitle;
}

- (TLKLabel)label
{
  return (TLKLabel *)objc_getProperty(self, a2, 768, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (UIView)backgroundView
{
  return (UIView *)objc_getProperty(self, a2, 776, 1);
}

- (void)setBackgroundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (TLKProminenceView)highlightView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 784, 1);
}

- (void)setHighlightView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (void)setIsEmphasized:(BOOL)a3
{
  self->_isEmphasized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_richTitle, 0);
}

@end
