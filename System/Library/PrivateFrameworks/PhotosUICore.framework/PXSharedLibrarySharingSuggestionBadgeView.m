@implementation PXSharedLibrarySharingSuggestionBadgeView

- (PXSharedLibrarySharingSuggestionBadgeView)init
{
  PXSharedLibrarySharingSuggestionBadgeView *v2;
  id v3;
  void *v4;
  PXShadowView *v5;
  uint64_t v6;
  PXShadowView *shadowView;
  id v8;
  uint64_t v9;
  UIVisualEffectView *backgroundEffectView;
  void *v11;
  id v12;
  uint64_t v13;
  UILabel *label;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  UIVisualEffectView *labelVibrancyEffectView;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PXSharedLibrarySharingSuggestionBadgeView;
  v2 = -[PXSharedLibrarySharingSuggestionBadgeView init](&v25, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC1298]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShadowColor:", v4);

    objc_msgSend(v3, "setShadowBlurRadius:", 20.0);
    v5 = [PXShadowView alloc];
    -[PXSharedLibrarySharingSuggestionBadgeView bounds](v2, "bounds");
    v6 = -[PXShadowView initWithFrame:](v5, "initWithFrame:");
    shadowView = v2->_shadowView;
    v2->_shadowView = (PXShadowView *)v6;

    -[PXShadowView setShadow:](v2->_shadowView, "setShadow:", v3);
    -[PXShadowView setCornerRadius:](v2->_shadowView, "setCornerRadius:", 4.0);
    -[PXShadowView setClipsToBounds:](v2->_shadowView, "setClipsToBounds:", 1);
    -[PXSharedLibrarySharingSuggestionBadgeView addSubview:](v2, "addSubview:", v2->_shadowView);
    v8 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[PXSharedLibrarySharingSuggestionBadgeView bounds](v2, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    backgroundEffectView = v2->_backgroundEffectView;
    v2->_backgroundEffectView = (UIVisualEffectView *)v9;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 11);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v2->_backgroundEffectView, "setEffect:", v11);
    -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](v2->_backgroundEffectView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 4.0);
    -[PXSharedLibrarySharingSuggestionBadgeView addSubview:](v2, "addSubview:", v2->_backgroundEffectView);
    v12 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PXSharedLibrarySharingSuggestionBadgeView bounds](v2, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    label = v2->_label;
    v2->_label = (UILabel *)v13;

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySharingSuggestionNewBadge"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v2->_label, "setText:", v15);

    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A98], 32770, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_label, "setFont:", v16);

    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    v17 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithEffect:", v18);
    labelVibrancyEffectView = v2->_labelVibrancyEffectView;
    v2->_labelVibrancyEffectView = (UIVisualEffectView *)v19;

    -[UIVisualEffectView contentView](v2->_labelVibrancyEffectView, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v2->_label);

    -[UIVisualEffectView contentView](v2->_backgroundEffectView, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v2->_labelVibrancyEffectView);

    -[PXSharedLibrarySharingSuggestionBadgeView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
    -[PXSharedLibrarySharingSuggestionBadgeView layer](v2, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsGroupOpacity:", 0);

  }
  return v2;
}

- (void)setUserData:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionBadgeView.m"), 110, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v7, v8);

    }
  }
  -[PXSharedLibrarySharingSuggestionBadgeView setConfiguration:](self, "setConfiguration:", v9);

}

- (void)setConfiguration:(id)a3
{
  PXSharedLibrarySharingSuggestionBadgeViewConfiguration *v4;
  BOOL v5;
  PXSharedLibrarySharingSuggestionBadgeViewConfiguration *v6;
  PXSharedLibrarySharingSuggestionBadgeViewConfiguration *v7;
  PXSharedLibrarySharingSuggestionBadgeViewConfiguration *configuration;
  PXSharedLibrarySharingSuggestionBadgeViewConfiguration *v9;

  v9 = (PXSharedLibrarySharingSuggestionBadgeViewConfiguration *)a3;
  v4 = self->_configuration;
  if (v4 == v9)
  {

    goto LABEL_6;
  }
  v5 = -[PXSharedLibrarySharingSuggestionBadgeViewConfiguration isEqual:](v4, "isEqual:", v9);

  v6 = v9;
  if (!v5)
  {
    v7 = (PXSharedLibrarySharingSuggestionBadgeViewConfiguration *)-[PXSharedLibrarySharingSuggestionBadgeViewConfiguration copy](v9, "copy");
    configuration = self->_configuration;
    self->_configuration = v7;

    v6 = v9;
    if (v9)
    {
      -[PXSharedLibrarySharingSuggestionBadgeView setNeedsLayout](self, "setNeedsLayout");
LABEL_6:
      v6 = v9;
    }
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinY;
  double v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MinX;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  objc_super v31;
  CGRect v32;

  v31.receiver = self;
  v31.super_class = (Class)PXSharedLibrarySharingSuggestionBadgeView;
  -[PXSharedLibrarySharingSuggestionBadgeView layoutSubviews](&v31, sel_layoutSubviews);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel bounds](self->_label, "bounds");
  PXSizeMax();
  -[UILabel setFrame:](self->_label, "setFrame:", 4.0, 2.0, v3, v4);
  -[PXSharedLibrarySharingSuggestionBadgeView configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sideMargin");

  -[PXSharedLibrarySharingSuggestionBadgeView bounds](self, "bounds");
  PXInsetRectWithValueForEdges();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UILabel bounds](self->_label, "bounds");
  v15 = v14;
  v17 = v16;
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  MinY = CGRectGetMinY(v32);
  v19 = v15 + 8.0;
  v20 = -[PXSharedLibrarySharingSuggestionBadgeView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v21 = v7;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  if (v20 == 1)
    MinX = CGRectGetMaxX(*(CGRect *)&v21) - v19;
  else
    MinX = CGRectGetMinX(*(CGRect *)&v21);
  -[UIVisualEffectView setFrame:](self->_backgroundEffectView, "setFrame:", MinX, MinY, v19, v17 + 4.0);
  -[UIVisualEffectView superview](self->_labelVibrancyEffectView, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  -[UIVisualEffectView setFrame:](self->_labelVibrancyEffectView, "setFrame:");

  -[PXSharedLibrarySharingSuggestionBadgeView bounds](self, "bounds");
  -[PXShadowView setFrame:](self->_shadowView, "setFrame:");
  -[PXSharedLibrarySharingSuggestionBadgeView layer](self, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cornerRadius");
  v29 = v28;
  -[PXShadowView layer](self->_shadowView, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCornerRadius:", v29);

  -[UIVisualEffectView frame](self->_backgroundEffectView, "frame");
  -[PXShadowView setCastingFrame:](self->_shadowView, "setCastingFrame:");
}

- (NSCopying)userData
{
  return self->_userData;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXSharedLibrarySharingSuggestionBadgeViewConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
}

@end
