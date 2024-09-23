@implementation UISwipeActionButton

- (UISwipeActionButton)initWithFrame:(CGRect)a3
{
  UISwipeActionButton *v3;
  UISwipeActionButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)UISwipeActionButton;
  v3 = -[UIButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwipeActionButton setVisualStyle:](v4, "setVisualStyle:", v6);

    -[UIButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
    -[UIView setTintAdjustmentMode:](v4, "setTintAdjustmentMode:", 1);
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UISwipeActionButton visualStyle](v4, "visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v8);

    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[UISwipeActionButton titleFont](v4, "titleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v4, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    -[UIButton titleLabel](v4, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

    -[UIButton titleLabel](v4, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwipeActionButton _minScaleFactorForFont:](v4, "_minScaleFactorForFont:", v13);
    v15 = v14;
    -[UIButton titleLabel](v4, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMinimumScaleFactor:", v15);

    -[UIButton titleLabel](v4, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLineBreakMode:", 4);

    -[UIButton imageView](v4, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentMode:", 4);

    if (dyld_program_sdk_at_least())
    {
      v23[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[UIView registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v19, &__block_literal_global_509);

    }
  }
  return v4;
}

void __37__UISwipeActionButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v2 = a2;
  objc_msgSend(v2, "titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v2, "titleFont");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_minScaleFactorForFont:", v8);
  v6 = v5;
  objc_msgSend(v2, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMinimumScaleFactor:", v6);
}

- (CGRect)_allowableContentRectForContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISwipeActionButton _horizontalPaddingForCurrentIdiom](self, "_horizontalPaddingForCurrentIdiom");
  v9 = v8;
  -[UISwipeActionButton buttonWidth](self, "buttonWidth");
  v11 = v10;
  if (-[UIControl contentHorizontalAlignment](self, "contentHorizontalAlignment") == UIControlContentHorizontalAlignmentRight)
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    CGRectGetWidth(v23);
  }
  UIRoundToViewScale(self);
  v22 = v12;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v13 = CGRectGetHeight(v24);
  -[UISwipeActionButton visualStyle](self, "visualStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defaultContentHeightForView:", self);
  v16 = v15;

  if (v13 < v16)
    v16 = v13;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  CGRectGetHeight(v25);
  UIRoundToViewScale(self);
  v18 = v17;
  v19 = v11 - (v9 + v9);
  v20 = v22;
  v21 = v16;
  result.size.height = v21;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v20;
  return result;
}

- (BOOL)_heightDemandsCompactLayout
{
  double v3;

  -[UIView frame](self, "frame");
  -[UISwipeActionButton _defaultLayoutForHeight:](self, "_defaultLayoutForHeight:", v3);
  return 0;
}

- (unint64_t)_defaultLayoutForHeight:(double)a3
{
  if (a3 >= 50.0)
    return a3 < 90.0;
  else
    return 2;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  objc_super v15;

  v6 = (void *)MEMORY[0x1E0CB3500];
  v7 = a3;
  objc_msgSend(v6, "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)UISwipeActionButton;
  -[UIButton setTitle:forState:](&v15, sel_setTitle_forState_, v9, a4);
  -[UIButton titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwipeActionButton visualStyle](self, "visualStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maxLines");

  v13 = -[UISwipeActionButton _numberOfLinesForTitle:](self, "_numberOfLinesForTitle:", v9);
  if (v12 >= v13)
    v14 = v13;
  else
    v14 = v12;
  objc_msgSend(v10, "setNumberOfLines:", v14);

}

- (int64_t)_numberOfLinesForTitle:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Height;
  double v20;
  int64_t v21;
  uint64_t v23;
  _QWORD v24[2];
  CGRect v25;

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  v4 = a3;
  -[UISwipeActionButton titleFont](self, "titleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self, "frame");
  -[UISwipeActionButton _allowableContentRectForContentRect:](self, "_allowableContentRectForContentRect:");
  v7 = v6;
  v9 = v8;
  v23 = *(_QWORD *)off_1E1678D90;
  v24[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v7, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  Height = CGRectGetHeight(v25);
  objc_msgSend(v5, "lineHeight");
  v21 = vcvtpd_s64_f64(Height / v20);

  return v21;
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[UISwipeActionButton backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (void)setDefaultBackgroundColor:(id)a3
{
  UIColor **p_defaultBackgroundColor;
  id v6;

  p_defaultBackgroundColor = &self->_defaultBackgroundColor;
  objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
  v6 = a3;
  -[UISwipeActionButton setBackgroundColor:](self, "setBackgroundColor:", *p_defaultBackgroundColor);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISwipeActionButton;
  -[UIButton setHighlighted:](&v6, sel_setHighlighted_);
  v5 = 1;
  if (!v3)
    v5 = 0;
  -[UISwipeActionButton setBackgroundColor:](self, "setBackgroundColor:", *(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___UISwipeActionButton__defaultBackgroundColor[v5]));
}

- (double)defaultButtonWidth
{
  void *v2;
  double v3;
  double v4;

  -[UISwipeActionButton visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultButtonWidth");
  v4 = v3;

  return v4;
}

- (id)titleFontOfSize:(double)a3
{
  double v4;

  -[UISwipeActionButton _titleFontWeightForCurrentIdiom](self, "_titleFontWeightForCurrentIdiom");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", a3, v4);
}

- (id)titleFont
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;

  -[UISwipeActionButton _maxFontSizeForCurrentIdiom](self, "_maxFontSizeForCurrentIdiom");
  v4 = v3;
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("_UICTContentSizeCategoryUnspecified");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  if (dyld_program_sdk_at_least()
    && UIContentSizeCategoryCompareToCategory(&v8->isa, CFSTR("UICTContentSizeCategoryL")) == NSOrderedDescending)
  {
    if (UIContentSizeCategoryCompareToCategory(&v8->isa, CFSTR("UICTContentSizeCategoryAccessibilityXL")) == NSOrderedDescending)
    {
      v9 = CFSTR("UICTContentSizeCategoryAccessibilityXL");

      v8 = v9;
    }
    +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleBody"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_scaledValueForValue:", v4);
    v4 = v12;

  }
  -[UISwipeActionButton titleFontOfSize:](self, "titleFontOfSize:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)_minScaleFactorForFont:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a3, "pointSize");
  v5 = v4;
  -[UISwipeActionButton _minFontSizeForCurrentIdiom](self, "_minFontSizeForCurrentIdiom");
  v7 = v6;
  -[UISwipeActionButton _maxFontSizeForCurrentIdiom](self, "_maxFontSizeForCurrentIdiom");
  if (v5 != 0.0)
    v8 = v5;
  return v7 / v8;
}

- (double)_minFontSizeForCurrentIdiom
{
  void *v2;
  double v3;
  double v4;

  -[UISwipeActionButton visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minFontSize");
  v4 = v3;

  return v4;
}

- (double)_maxFontSizeForCurrentIdiom
{
  void *v2;
  double v3;
  double v4;

  -[UISwipeActionButton visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxFontSize");
  v4 = v3;

  return v4;
}

- (double)_horizontalPaddingForCurrentIdiom
{
  void *v2;
  double v3;
  double v4;

  -[UISwipeActionButton visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "horizontalPadding");
  v4 = v3;

  return v4;
}

- (double)_titleFontWeightForCurrentIdiom
{
  void *v2;
  double v3;
  double v4;

  -[UISwipeActionButton visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleFontWeight");
  v4 = v3;

  return v4;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id WeakRetained;
  objc_super v10;

  v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)UISwipeActionButton;
  -[UIControl contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_swipeActionButtonDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "swipeActionButton:willDisplayContextMenuWithAnimator:", self, v8);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id WeakRetained;
  objc_super v10;

  v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)UISwipeActionButton;
  -[UIControl contextMenuInteraction:willEndForConfiguration:animator:](&v10, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_swipeActionButtonDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "swipeActionButton:willDismissContextMenuWithAnimator:", self, v8);

}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (UISwipeActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (BOOL)autosizes
{
  return self->_autosizes;
}

- (void)setAutosizes:(BOOL)a3
{
  self->_autosizes = a3;
}

- (_UISwipeActionButtonDelegate)swipeActionButtonDelegate
{
  return (_UISwipeActionButtonDelegate *)objc_loadWeakRetained((id *)&self->_swipeActionButtonDelegate);
}

- (void)setSwipeActionButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_swipeActionButtonDelegate, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_swipeActionButtonDelegate);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
}

@end
