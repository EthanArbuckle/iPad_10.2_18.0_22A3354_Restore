@implementation _UINavigationItemView

- (_UINavigationItemView)initWithNavigationItem:(id)a3
{
  id v4;
  _UINavigationItemView *v5;
  _UINavigationItemView *v6;
  UILabel *v12;
  UILabel *label;
  UILabel *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  id v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    __asm { FMOV            V0.2D, #-1.0 }
    v6->_titleSize = _Q0;
    -[UIView setOpaque:](v6, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    v12 = objc_alloc_init(UILabel);
    label = v6->_label;
    v6->_label = v12;

    -[UIView setOpaque:](v6->_label, "setOpaque:", 0);
    v14 = v6->_label;
    +[UIColor clearColor](UIColor, "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UILabel setLineBreakMode:](v6->_label, "setLineBreakMode:", 4);
    -[_UINavigationItemView _defaultFont](v6, "_defaultFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationItemView _setFont:](v6, "_setFont:", v16);

    v17 = v6->_label;
    -[_UINavigationItemView _labelFrame](v6, "_labelFrame");
    -[UILabel setFrame:](v17, "setFrame:");
    -[UIView addSubview:](v6, "addSubview:", v6->_label);
    v21[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[UIView registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v18, sel__updateLabelColor);

  }
  return v6;
}

- (id)navigationItem
{
  return objc_loadWeakRetained((id *)&self->_item);
}

- (id)_defaultFont
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_fontScaleAdjustment");
  objc_msgSend(v3, "_defaultTitleFontWithScaleAdjustment:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_currentTextColorForBarStyle:(int64_t)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_appearanceStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)off_1E1678D98);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v4, "_titleTextColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)_currentTextShadowColorForBarStyle:(int64_t)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_appearanceStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)off_1E1679048);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "shadowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v4, "buttonItemShadowColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_appearanceStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)off_1E1679048);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "shadowOffset");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v11 = -1.0;
    v9 = 0.0;
  }

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_titleSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationItemView;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)_updateLabelColor
{
  id WeakRetained;
  uint64_t v4;
  UILabel *label;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v7, "barStyle");
  label = self->_label;
  -[_UINavigationItemView _currentTextColorForBarStyle:](self, "_currentTextColorForBarStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](label, "setTextColor:", v6);

}

- (void)_updateLabelContents
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  UILabel *label;
  UILabel *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v10, "barStyle");
  -[_UINavigationItemView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationItemView _updateLabelColor](self, "_updateLabelColor");
  label = self->_label;
  -[_UINavigationItemView _currentTextShadowOffsetForBarStyle:](self, "_currentTextShadowOffsetForBarStyle:", v4);
  -[UILabel setShadowOffset:](label, "setShadowOffset:");
  v7 = self->_label;
  -[_UINavigationItemView _currentTextShadowColorForBarStyle:](self, "_currentTextShadowColorForBarStyle:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setShadowColor:](v7, "setShadowColor:", v8);

  if (!self->_customFontSet)
  {
    -[_UINavigationItemView _defaultFont](self, "_defaultFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationItemView _setFont:](self, "_setFont:", v9);

  }
  -[UILabel setText:](self->_label, "setText:", v5);

}

- (double)_titleYAdjustmentCustomization
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_appearanceStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleVerticalAdjustmentForBarMetrics:", objc_msgSend(v3, "_activeBarMetrics"));
  v6 = v5;

  return v6;
}

- (CGRect)_labelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect result;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[_UINavigationItemView _titleSize](self, "_titleSize");
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_currentVisualStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItemBaselineOffset");
  v14 = v13;
  objc_msgSend(v11, "frame");
  v15 = CGRectGetHeight(v27) - v14;
  -[UILabel _baselineOffsetFromBottom](self->_label, "_baselineOffsetFromBottom");
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v11, v4, v15 + v16 - v8);
  v18 = v17;
  v20 = v19;
  -[_UINavigationItemView _titleYAdjustmentCustomization](self, "_titleYAdjustmentCustomization");
  v22 = v20 + v21;

  v23 = v18;
  v24 = v22;
  v25 = v6;
  v26 = v8;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_updateLabel
{
  UILabel *label;

  label = self->_label;
  if (self->_isCrossFading)
  {
    -[UIView removeFromSuperview](self->_label, "removeFromSuperview");
  }
  else
  {
    -[_UINavigationItemView _labelFrame](self, "_labelFrame");
    -[UILabel setFrame:](label, "setFrame:");
    -[UIView addSubview:](self, "addSubview:", self->_label);
  }
}

- (void)_resetTitleSize
{
  self->_titleSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)_titleSize
{
  CGSize *p_titleSize;
  double width;
  double height;
  CGSize result;

  p_titleSize = &self->_titleSize;
  width = self->_titleSize.width;
  if (width <= 0.0)
  {
    -[_UINavigationItemView _updateLabelContents](self, "_updateLabelContents");
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    p_titleSize->width = width;
    p_titleSize->height = height;
  }
  else
  {
    height = self->_titleSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)title
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTitleAutoresizesToFit:(BOOL)a3
{
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)titleAutoresizesToFit
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_label, "adjustsFontSizeToFitWidth");
}

- (void)_setFont:(id)a3
{
  UILabel *label;
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  UILabel *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  label = self->_label;
  v5 = a3;
  -[UILabel setFont:](label, "setFont:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "_navigationBar");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v15, "barStyle");
  objc_msgSend(v15, "_currentVisualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = self->_label;
  if (v7)
    objc_msgSend(v8, "_legacyButtonFontSize");
  else
    objc_msgSend(v8, "buttonFontSize");
  v12 = v11;
  objc_msgSend(v5, "pointSize");
  v14 = v13;

  -[UILabel setMinimumScaleFactor:](v10, "setMinimumScaleFactor:", v12 / v14);
}

- (void)setFont:(id)a3
{
  id v4;

  self->_customFontSet = a3 != 0;
  if (a3)
  {
    -[_UINavigationItemView _setFont:](self, "_setFont:");
  }
  else
  {
    -[_UINavigationItemView _defaultFont](self, "_defaultFont");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationItemView _setFont:](self, "_setFont:", v4);

  }
}

- (id)font
{
  return -[UILabel font](self->_label, "font");
}

- (void)_setLineBreakMode:(int64_t)a3
{
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationItemView;
  -[UIView description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  -[_UINavigationItemView title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UINavigationItemView title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: item=%@ title=%@>"), v4, WeakRetained, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: item=%@ title=%@>"), v4, WeakRetained, CFSTR("<nil>"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_prepareCrossViewsForNewSize:(CGSize)a3
{
  double height;
  double width;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  _QWORD *ContextStack;
  uint64_t v10;
  void *v11;
  UIImageView *v12;
  UIView *topCrossView;
  _UINavigationItemView *v14;
  void *v15;
  _UINavigationItemView *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  UIImageView *v20;
  UIView *bottomCrossView;
  id v22;

  height = a3.height;
  width = a3.width;
  if (self->_isCrossFading)
    -[_UINavigationItemView _cleanUpCrossView](self, "_cleanUpCrossView");
  -[UIView bounds](self, "bounds");
  _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v7, 0.0);
  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v10 = 0;
  else
    v10 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  objc_msgSend(v8, "renderInContext:", v10);

  _UIGraphicsGetImageFromCurrentImageContext(0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (v11)
  {
    v12 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v11);
    topCrossView = self->_topCrossView;
    self->_topCrossView = &v12->super;

    -[UIView setAlpha:](self->_topCrossView, "setAlpha:", 1.0);
  }
  v14 = [_UINavigationItemView alloc];
  -[_UINavigationItemView navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UINavigationItemView initWithNavigationItem:](v14, "initWithNavigationItem:", v15);

  -[_UINavigationItemView setFrame:](v16, "setFrame:", 0.0, 0.0, width, height);
  _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
  -[UIView layer](v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = GetContextStack(0);
  if (*(int *)v18 < 1)
    v19 = 0;
  else
    v19 = v18[3 * (*(_DWORD *)v18 - 1) + 1];
  objc_msgSend(v17, "renderInContext:", v19);

  _UIGraphicsGetImageFromCurrentImageContext(0);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  if (v22)
  {
    v20 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v22);
    bottomCrossView = self->_bottomCrossView;
    self->_bottomCrossView = &v20->super;

    -[UIView setAlpha:](self->_bottomCrossView, "setAlpha:", 0.0);
  }
  if (self->_bottomCrossView)
    -[UIView addSubview:](self, "addSubview:");
  if (self->_topCrossView)
    -[UIView addSubview:](self, "addSubview:");
  self->_isCrossFading = 1;
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_crossFadeHiddingButton:(BOOL)a3
{
  double v3;
  uint64_t v4;
  _QWORD v5[5];

  v3 = 0.0;
  if (a3)
  {
    v3 = 0.175;
    v4 = 0x10000;
  }
  else
  {
    v4 = 0x20000;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49___UINavigationItemView__crossFadeHiddingButton___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v4, v5, 0, 0.175, v3);
}

- (void)_cleanUpCrossView
{
  UIView *topCrossView;
  UIView *bottomCrossView;

  -[UIView removeFromSuperview](self->_topCrossView, "removeFromSuperview");
  topCrossView = self->_topCrossView;
  self->_topCrossView = 0;

  -[UIView removeFromSuperview](self->_bottomCrossView, "removeFromSuperview");
  bottomCrossView = self->_bottomCrossView;
  self->_bottomCrossView = 0;

  self->_isCrossFading = 0;
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)_isFadingInFromCustomAlpha
{
  return self->__isFadingInFromCustomAlpha;
}

- (void)_setFadingInFromCustomAlpha:(BOOL)a3
{
  self->__isFadingInFromCustomAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bottomCrossView, 0);
  objc_storeStrong((id *)&self->_topCrossView, 0);
  objc_destroyWeak((id *)&self->_item);
}

@end
