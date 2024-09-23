@implementation PLPlatterDiscoveryView

- (PLPlatterDiscoveryView)init
{
  PLPlatterDiscoveryView *v2;
  PLPlatterDiscoveryView *v3;
  uint64_t v4;
  MTVisualStylingProvider *strokeVisualStylingProvider;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLPlatterDiscoveryView;
  v2 = -[PLPlatterView initWithRecipe:](&v7, sel_initWithRecipe_, 1);
  v3 = v2;
  if (v2)
  {
    -[PLPlatterView setUsesBackgroundView:](v2, "setUsesBackgroundView:", 0);
    -[PLPlatterDiscoveryView visualStylingProviderForCategory:](v3, "visualStylingProviderForCategory:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    strokeVisualStylingProvider = v3->_strokeVisualStylingProvider;
    v3->_strokeVisualStylingProvider = (MTVisualStylingProvider *)v4;

  }
  return v3;
}

- (NSString)titleText
{
  return -[UILabel text](self->_titleTextLabel, "text");
}

- (void)setTitleText:(id)a3
{
  void *v4;
  char v5;
  UILabel *titleTextLabel;
  id v7;

  v7 = a3;
  -[PLPlatterDiscoveryView titleText](self, "titleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      -[PLPlatterDiscoveryView _configureTitleTextLabelIfNeccessary](self, "_configureTitleTextLabelIfNeccessary");
      -[UILabel setText:](self->_titleTextLabel, "setText:", v7);
    }
    else
    {
      -[UILabel removeFromSuperview](self->_titleTextLabel, "removeFromSuperview");
      titleTextLabel = self->_titleTextLabel;
      self->_titleTextLabel = 0;

    }
    -[PLPlatterDiscoveryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)bodyText
{
  return -[UILabel text](self->_bodyTextLabel, "text");
}

- (void)setBodyText:(id)a3
{
  void *v4;
  char v5;
  UILabel *bodyTextLabel;
  id v7;

  v7 = a3;
  -[PLPlatterDiscoveryView bodyText](self, "bodyText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      -[PLPlatterDiscoveryView _configureBodyLabelIfNeccessary](self, "_configureBodyLabelIfNeccessary");
      -[UILabel setText:](self->_bodyTextLabel, "setText:", v7);
    }
    else
    {
      -[UILabel removeFromSuperview](self->_bodyTextLabel, "removeFromSuperview");
      bodyTextLabel = self->_bodyTextLabel;
      self->_bodyTextLabel = 0;

    }
    -[PLPlatterDiscoveryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIView)graphicView
{
  void *v2;
  void *v3;

  -[UIView subviews](self->_graphicContainerView, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setGraphicView:(id)a3
{
  void *v4;
  void *v5;
  UIView *graphicContainerView;
  void *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  UIView *v12;
  id v13;

  v13 = a3;
  -[PLPlatterDiscoveryView graphicView](self, "graphicView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLPlatterDiscoveryView graphicView](self, "graphicView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  graphicContainerView = self->_graphicContainerView;
  v7 = v13;
  if (v13)
  {
    if (!graphicContainerView)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v9 = self->_graphicContainerView;
      self->_graphicContainerView = v8;

      -[PLPlatterView customContentView](self, "customContentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_graphicContainerView);

      -[PLPlatterView customContentView](self, "customContentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendSubviewToBack:", self->_graphicContainerView);

      v7 = v13;
    }
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self->_graphicContainerView, "addSubview:", v13);
  }
  else
  {
    -[UIView removeFromSuperview](graphicContainerView, "removeFromSuperview");
    v12 = self->_graphicContainerView;
    self->_graphicContainerView = 0;

  }
  -[PLPlatterDiscoveryView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setClearAction:(id)a3
{
  UIButton *clearButton;
  UIButton *v6;
  id v7;

  v7 = a3;
  clearButton = self->_clearButton;
  if (clearButton)
  {
    -[UIButton removeFromSuperview](clearButton, "removeFromSuperview");
    v6 = self->_clearButton;
    self->_clearButton = 0;

  }
  objc_storeStrong((id *)&self->_clearAction, a3);
  if (self->_clearAction)
  {
    -[PLPlatterDiscoveryView _configureClearButtonIfNeccessary](self, "_configureClearButtonIfNeccessary");
    -[UIButton addAction:forControlEvents:](self->_clearButton, "addAction:forControlEvents:", self->_clearAction, 64);
  }
  -[PLPlatterDiscoveryView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  __int128 v6;
  CGSize result;

  v6 = *MEMORY[0x1E0C9D820];
  BSRectWithSize();
  -[PLPlatterDiscoveryView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", &v6);
  v5 = *((double *)&v6 + 1);
  v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)PLPlatterDiscoveryView;
  -[PLPlatterView layoutSubviews](&v3, sel_layoutSubviews);
  -[PLPlatterDiscoveryView bounds](self, "bounds");
  if (CGRectGetWidth(v4) > 0.0)
  {
    -[PLPlatterDiscoveryView bounds](self, "bounds");
    -[PLPlatterDiscoveryView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", 0);
  }
}

- (void)_configureClearButtonIfNeccessary
{
  UIButton *v3;
  UIButton *clearButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_clearButton)
  {
    v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E0CEA3A0]);
    clearButton = self->_clearButton;
    self->_clearButton = v3;

    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB548], 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v8);
    -[UIButton setConfiguration:](self->_clearButton, "setConfiguration:", v11);
    -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_clearButton, 1, self->_strokeVisualStylingProvider, 0);
    -[PLPlatterView customContentView](self, "customContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_clearButton);

    -[PLPlatterView customContentView](self, "customContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", self->_clearButton);

  }
}

- (void)_configureTitleTextLabelIfNeccessary
{
  void *v3;
  UILabel *v4;
  UILabel *titleTextLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  if (!self->_titleTextLabel)
  {
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB570], 2, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB578], 2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleTextLabel = self->_titleTextLabel;
    self->_titleTextLabel = v4;

    v6 = self->_titleTextLabel;
    -[PLPlatterDiscoveryView titleText](self, "titleText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v6, "setText:", v7);

    v8 = self->_titleTextLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v15, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleTextLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v10 = self->_titleTextLabel;
    objc_msgSend(v3, "pointSize");
    v12 = v11;
    objc_msgSend(v15, "pointSize");
    -[UILabel setMinimumScaleFactor:](v10, "setMinimumScaleFactor:", v12 / v13);
    -[UILabel setNumberOfLines:](self->_titleTextLabel, "setNumberOfLines:", 0);
    -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_titleTextLabel, 0, self->_strokeVisualStylingProvider, 0);
    -[PLPlatterView customContentView](self, "customContentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_titleTextLabel);

  }
}

- (void)_configureBodyLabelIfNeccessary
{
  UILabel *v3;
  UILabel *bodyTextLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  id v9;

  if (!self->_bodyTextLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    bodyTextLabel = self->_bodyTextLabel;
    self->_bodyTextLabel = v3;

    v5 = self->_bodyTextLabel;
    -[PLPlatterDiscoveryView bodyText](self, "bodyText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5, "setText:", v6);

    v7 = self->_bodyTextLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_bodyTextLabel, 1, self->_strokeVisualStylingProvider, 0);
    -[UILabel setNumberOfLines:](self->_bodyTextLabel, "setNumberOfLines:", 0);
    -[PLPlatterView customContentView](self, "customContentView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_bodyTextLabel);

  }
}

- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v10;
  void *v11;
  double v12;
  double v13;
  UILabel *titleTextLabel;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  UILabel *bodyTextLabel;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[PLPlatterDiscoveryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PLPlatterDiscoveryView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v12 = CGRectGetWidth(v35);
  v13 = v12 * 0.5;
  titleTextLabel = self->_titleTextLabel;
  if (titleTextLabel)
  {
    -[UILabel sizeThatFits:](titleTextLabel, "sizeThatFits:", v13, 1.79769313e308);
    UIRectIntegralWithScale();
    v19 = v15;
    v20 = v16;
    v21 = v17;
    v22 = v18;
    if (!a4)
      -[UILabel setFrame:](self->_titleTextLabel, "setFrame:", v15, v16, v17, v18);
    v36.origin.x = v19;
    v36.origin.y = v20;
    v36.size.width = v21;
    v36.size.height = v22;
    CGRectGetMaxY(v36);
  }
  bodyTextLabel = self->_bodyTextLabel;
  if (bodyTextLabel)
  {
    -[UILabel sizeThatFits:](bodyTextLabel, "sizeThatFits:", v13, 1.79769313e308);
    UIRectIntegralWithScale();
    v28 = v24;
    v29 = v25;
    v30 = v26;
    v31 = v27;
    if (!a4)
      -[UILabel setFrame:](self->_bodyTextLabel, "setFrame:", v24, v25, v26, v27);
    v37.origin.x = v28;
    v37.origin.y = v29;
    v37.size.width = v30;
    v37.size.height = v31;
    CGRectGetMaxY(v37);
  }
  if (a4)
  {
    UISizeRoundToScale();
    a4->width = v32;
    a4->height = v33;
  }
  else
  {
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_graphicContainerView, "setFrame:");
    v34 = v12 + -2.0 + -44.0;
    if (v10)
      v34 = 2.0;
    -[UIButton setFrame:](self->_clearButton, "setFrame:", v34, 2.0, 44.0, 44.0);
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  MTVisualStylingProvider *strokeVisualStylingProvider;
  objc_super v5;

  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
    return strokeVisualStylingProvider;
  v5.receiver = self;
  v5.super_class = (Class)PLPlatterDiscoveryView;
  -[PLPlatterView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requiredVisualStyleCategories
{
  return &unk_1E91E2EC8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v7;
  void *v8;
  char v9;
  MTVisualStylingProvider *strokeVisualStylingProvider;
  MTVisualStylingProvider *v11;
  MTVisualStylingProvider *v12;
  MTVisualStylingProvider *v13;
  MTVisualStylingProvider *v14;
  void *v15;
  MTVisualStylingProvider *v16;

  v16 = (MTVisualStylingProvider *)a3;
  -[PLPlatterDiscoveryView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPlatterDiscoveryView.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[self requiredVisualStyleCategories] containsObject:@(category)]"));

  }
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  v11 = v16;
  if (strokeVisualStylingProvider != v16)
  {
    v12 = v16;
    v13 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v12;
    v14 = strokeVisualStylingProvider;

    -[PLPlatterDiscoveryView visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "visualStylingProviderDidChange:forCategory:outgoingProvider:", self->_strokeVisualStylingProvider, a4, v14);
    v11 = v16;
  }

}

- (void)visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  UILabel *titleTextLabel;
  id v8;
  id v9;

  titleTextLabel = self->_titleTextLabel;
  v8 = a5;
  v9 = a3;
  -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", titleTextLabel, 0, v9, v8);
  -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_bodyTextLabel, 1, v9, v8);
  -[PLPlatterDiscoveryView updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_clearButton, 1, v9, v8);

}

- (void)updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (MTVisualStylingProvider)strokeVisualStylingProvider
{
  return self->_strokeVisualStylingProvider;
}

- (void)setStrokeVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, a3);
}

- (UIAction)clearAction
{
  return self->_clearAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_graphicContainerView, 0);
  objc_storeStrong((id *)&self->_bodyTextLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabel, 0);
}

@end
