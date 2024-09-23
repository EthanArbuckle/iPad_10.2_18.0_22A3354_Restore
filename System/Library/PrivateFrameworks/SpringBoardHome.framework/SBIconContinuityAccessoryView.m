@implementation SBIconContinuityAccessoryView

- (SBIconContinuityAccessoryView)init
{
  SBIconContinuityAccessoryView *v2;
  UIView *v3;
  UIView *backgroundView;
  void *v5;
  void *v6;
  SBHomeScreenMaterialView *v7;
  uint64_t v8;
  SBHomeScreenMaterialView *foregroundView;
  SBHomeScreenMaterialView *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBIconContinuityAccessoryView;
  v2 = -[SBIconContinuityAccessoryView init](&v13, sel_init);
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v3;

    -[SBIconContinuityAccessoryView addSubview:](v2, "addSubview:", v2->_backgroundView);
    -[SBIconContinuityAccessoryView traitCollection](v2, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIconView componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:](SBIconView, "componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:", 1, v5, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [SBHomeScreenMaterialView alloc];
    v8 = -[SBHomeScreenMaterialView initWithFrame:backgroundView:foregroundImage:](v7, "initWithFrame:backgroundView:foregroundImage:", v6, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    foregroundView = v2->_foregroundView;
    v2->_foregroundView = (SBHomeScreenMaterialView *)v8;

    v10 = v2->_foregroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenMaterialView setTintColor:](v10, "setTintColor:", v11);

    -[UIView addSubview:](v2->_backgroundView, "addSubview:", v2->_foregroundView);
  }
  return v2;
}

- (CGPoint)layoutOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[SBIconContinuityAccessoryView listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutIconAccessoryOffset(v2);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGSize)badgeSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SBIconContinuityAccessoryView listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutIconAccessorySize(v2);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  UIView *backgroundView;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)SBIconContinuityAccessoryView;
  -[SBIconContinuityAccessoryView layoutSubviews](&v16, sel_layoutSubviews);
  backgroundView = self->_backgroundView;
  -[SBIconContinuityAccessoryView bounds](self, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  -[SBIconContinuityAccessoryView listLayout](self, "listLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBIconContinuityAccessoryView badgeSize](self, "badgeSize");
    -[SBIconContinuityAccessoryView badgeContentScale](self, "badgeContentScale");
    v6 = v5;
    BSRectWithSize();
    CGRectInset(v17, 1.0, 1.0);
    -[UIView bounds](self->_backgroundView, "bounds");
    v15 = v6;
    UIRectCenteredIntegralRectScale();
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[SBHomeScreenMaterialView setContentMode:](self->_foregroundView, "setContentMode:", 4, v15);
    -[SBHomeScreenMaterialView setFrame:](self->_foregroundView, "setFrame:", v8, v10, v12, v14);
  }
}

- (double)badgeContentScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[SBIconContinuityAccessoryView listLayout](self, "listLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBIconContinuityAccessoryView listLayout](self, "listLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconImageInfo");
    v6 = v5;
  }
  else
  {
    -[SBIconContinuityAccessoryView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v6 = v7;
  }

  return v6;
}

- (void)configureForIcon:(id)a3 infoProvider:(id)a4
{
  id v5;
  SBIconContinuityItem *v6;
  uint64_t v7;
  SBIconContinuityItem *continuityItem;
  SBIconContinuityItem *v9;
  void *v10;
  id v11;

  v5 = a4;
  objc_msgSend(v5, "continuityItem");
  v6 = (SBIconContinuityItem *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isHighlighted");

  continuityItem = self->_continuityItem;
  self->_continuityItem = v6;
  v9 = v6;

  objc_msgSend((id)objc_opt_class(), "_imageForContinuityItem:highlighted:", v9, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[SBIconContinuityAccessoryView foregroundView](self, "foregroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setForegroundImage:", v11);

  -[SBIconContinuityAccessoryView setNeedsLayout](self, "setNeedsLayout");
  -[SBIconContinuityAccessoryView layoutIfNeeded](self, "layoutIfNeeded");

}

- (BOOL)displayingAccessory
{
  return 1;
}

- (void)prepareForReuse
{
  id v2;

  -[SBIconContinuityAccessoryView foregroundView](self, "foregroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setForegroundImage:", 0);

}

- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3
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
  double v14;
  double v15;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBIconContinuityAccessoryView layoutOffset](self, "layoutOffset");
  v9 = v8;
  v11 = v10;
  -[SBIconContinuityAccessoryView badgeSize](self, "badgeSize");
  v14 = SBIconBadgeViewCalculateAccessoryCenter(objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, x, y, width, height, v12, v13, v9, v11);
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)setAccessoryBrightness:(double)a3
{
  void *v4;
  id v5;

  -[SBIconContinuityAccessoryView backgroundView](self, "backgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sbh_darkener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrightness:", a3);

}

- (void)setLegibilityStyle:(int64_t)a3
{
  id v4;

  -[SBIconContinuityAccessoryView foregroundView](self, "foregroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibilityStyle:", a3);

}

+ (id)_imageForContinuityItem:(id)a3 highlighted:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogContinuity();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "---->\tCreating continuity image for '%@', highlighted: '%{BOOL}u'", (uint8_t *)&v11, 0x12u);
  }

  objc_msgSend(v5, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 6, 12.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
  objc_storeStrong((id *)&self->_listLayout, a3);
}

- (SBIconContinuityItem)continuityItem
{
  return self->_continuityItem;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SBHomeScreenMaterialView)foregroundView
{
  return self->_foregroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_continuityItem, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
}

@end
