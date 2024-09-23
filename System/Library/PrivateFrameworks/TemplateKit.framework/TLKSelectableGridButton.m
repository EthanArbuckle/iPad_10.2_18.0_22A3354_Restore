@implementation TLKSelectableGridButton

+ (id)selectableGridButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[TLKSelectableGridButton buttonWithType:](TLKSelectableGridButton, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCustomHighlight:", 0);
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 5.0);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAxis:", 1);
  objc_msgSend(v4, "setAlignment:", 3);
  objc_msgSend(v4, "setSpacing:", 0.0);
  objc_msgSend(v4, "setLayoutMargins:", 4.0, 4.0, 4.0, 4.0);
  objc_msgSend(v4, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v2, "setStackView:", v4);
  objc_msgSend(v2, "addSubview:", v4);
  v5 = (void *)objc_opt_new();
  +[TLKFontUtilities subheadFont](TLKFontUtilities, "subheadFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v2, "setTopLabel:", v5);
  objc_msgSend(v4, "addArrangedSubview:", v5);
  +[TLKLabel secondaryLabel](TLKLabel, "secondaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  objc_msgSend(v2, "setBottomLabel:", v7);
  objc_msgSend(v4, "addArrangedSubview:", v7);
  objc_msgSend(v2, "_setTouchInsets:", -0.15, -0.15, -0.15, -0.15);

  return v2;
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
  v9.super_class = (Class)TLKSelectableGridButton;
  -[TLKSelectableGridButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKSelectableGridButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKSelectableGridButton traitCollection](self, "traitCollection");
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
  v3.super_class = (Class)TLKSelectableGridButton;
  -[TLKSelectableGridButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLKSelectableGridButton;
  v4 = a3;
  -[UIView tlk_updateForAppearance:](&v6, sel_tlk_updateForAppearance_, v4);
  if (self->_customHighlight)
  {
    objc_msgSend(v4, "quaternaryColor", v6.receiver, v6.super_class);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKSelectableGridButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  else
  {
    -[TLKSelectableGridButton setBackgroundColor:](self, "setBackgroundColor:", 0, v6.receiver, v6.super_class);
  }
  objc_msgSend(v4, "enableAppearanceForView:", self);

}

- (void)setCustomHighlight:(BOOL)a3
{
  self->_customHighlight = a3;
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (BOOL)customHighlight
{
  return self->_customHighlight;
}

- (void)setTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TLKSelectableGridButton topLabel](self, "topLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[TLKSelectableGridButton bottomLabel](self, "bottomLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);

}

- (CGSize)sizeThatFits:(CGSize)a3
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
  -[TLKSelectableGridButton stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
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
  -[TLKSelectableGridButton stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TLKSelectableGridButton stackView](self, "stackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
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
  v12.super_class = (Class)TLKSelectableGridButton;
  -[TLKSelectableGridButton layoutSubviews](&v12, sel_layoutSubviews);
  -[TLKSelectableGridButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKSelectableGridButton stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (TLKLabel)topLabel
{
  return self->_topLabel;
}

- (void)setTopLabel:(id)a3
{
  objc_storeStrong((id *)&self->_topLabel, a3);
}

- (TLKLabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabel, a3);
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
}

@end
