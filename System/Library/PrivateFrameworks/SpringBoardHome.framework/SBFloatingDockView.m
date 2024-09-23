@implementation SBFloatingDockView

- (SBIconImageInfo)_iconImageInfo
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBIconImageInfo *result;

  -[SBFloatingDockView userIconListView](self, "userIconListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutForIconLocation:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconImageInfo");
  -[SBFloatingDockView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");

  return result;
}

+ (double)_referenceInterIconSpacingWithIconImageInfo:(SBIconImageInfo *)a3
{
  double result;

  UIFloorToScale();
  return result;
}

- (double)_referenceInterIconSpacing
{
  double v2;
  double v3;
  double v4;
  double v5;
  double result;

  -[SBFloatingDockView _iconImageInfo](self, "_iconImageInfo");
  objc_msgSend((id)objc_opt_class(), "_referenceInterIconSpacingWithIconImageInfo:", v2, v3, v4, v5);
  return result;
}

- (BOOL)_shouldDisplayAccessoryIconView
{
  return self->_accessoryIconView && self->_accessoryIconViewVisible;
}

+ (double)maximumDockContinuousCornerRadiusWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;

  v4 = v3;
  objc_msgSend(a1, "maximumInterIconSpacingWithIconImageInfo:", a3);
  return v4 + v5;
}

- (double)maximumDockContinuousCornerRadius
{
  double v2;
  double v3;
  double v4;
  double v5;
  double result;

  -[SBFloatingDockView _iconImageInfo](self, "_iconImageInfo");
  objc_msgSend((id)objc_opt_class(), "maximumDockContinuousCornerRadiusWithIconImageInfo:", v2, v3, v4, v5);
  return result;
}

- (double)currentDockContinuousCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentContinuousCornerRadius");
  v4 = v3;

  return v4;
}

+ (double)maximumInterIconSpacingWithIconImageInfo:(SBIconImageInfo *)a3
{
  double result;

  objc_msgSend(a1, "_referenceInterIconSpacingWithIconImageInfo:", a3);
  UIFloorToScale();
  return result;
}

- (double)maximumInterIconSpacing
{
  double v2;
  double v3;
  double v4;
  double v5;
  double result;

  -[SBFloatingDockView _iconImageInfo](self, "_iconImageInfo");
  objc_msgSend((id)objc_opt_class(), "maximumInterIconSpacingWithIconImageInfo:", v2, v3, v4, v5);
  return result;
}

+ (double)maximumPlatterHeightWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  objc_msgSend(a1, "maximumInterIconSpacingWithIconImageInfo:", a3);
  v13 = v12;
  objc_msgSend(a1, "maximumIconSizeWithIconImageInfo:", v10, v9, v8, v7);
  return v13 + v13 + v14;
}

- (double)maximumPlatterHeight
{
  double v2;
  double v3;
  double v4;
  double v5;
  double result;

  -[SBFloatingDockView _iconImageInfo](self, "_iconImageInfo");
  objc_msgSend((id)objc_opt_class(), "maximumPlatterHeightWithIconImageInfo:", v2, v3, v4, v5);
  return result;
}

+ (double)minimumPlatterMargin
{
  return 22.0;
}

+ (CGSize)maximumIconSizeWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  UIFloorToScale();
  v4 = v3;
  UIFloorToScale();
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)maximumIconSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[SBFloatingDockView _iconImageInfo](self, "_iconImageInfo");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SBFloatingDockView isEditing](self, "isEditing"))
  {
    -[SBFloatingDockView maximumEditingIconSize](self, "maximumEditingIconSize");
    if (v11 != *MEMORY[0x1E0C9D820] || v12 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v4 = v11;
      v6 = v12;
    }
  }
  objc_msgSend((id)objc_opt_class(), "maximumIconSizeWithIconImageInfo:", v4, v6, v8, v10);
  result.height = v14;
  result.width = v13;
  return result;
}

- (SBFloatingDockView)initWithFrame:(CGRect)a3
{
  SBFloatingDockView *v3;
  SBFloatingDockView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *touchReceivingView;
  UIView *v12;
  void *v13;
  void *v14;
  SBFloatingDockPlatterView *v15;
  SBFloatingDockPlatterView *mainPlatterView;
  uint64_t v17;
  UIView *dividerView;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBFloatingDockView;
  v3 = -[SBFloatingDockView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_iconContentScale = 1.0;
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    touchReceivingView = v4->_touchReceivingView;
    v4->_touchReceivingView = (UIView *)v10;

    v12 = v4->_touchReceivingView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView layer](v4->_touchReceivingView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHitTestsAsOpaque:", 1);

    -[SBFloatingDockView addSubview:](v4, "addSubview:", v4->_touchReceivingView);
    v15 = objc_alloc_init(SBFloatingDockPlatterView);
    mainPlatterView = v4->_mainPlatterView;
    v4->_mainPlatterView = v15;

    -[SBFloatingDockView addSubview:](v4, "addSubview:", v4->_mainPlatterView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    -[SBFloatingDockPlatterView addSubview:](v4->_mainPlatterView, "addSubview:", v17);
    dividerView = v4->_dividerView;
    v4->_dividerView = (UIView *)v17;

    v4->_accessoryIconViewVisible = 1;
    -[SBFloatingDockView updateDividerVisualStyling](v4, "updateDividerVisualStyling");
    -[SBFloatingDockView layer](v4, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupBlending:", 0);

    -[SBFloatingDockView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Multitasking Dock"));
  }
  return v4;
}

- (void)setUserIconListView:(id)a3
{
  SBDockIconListView *v5;
  SBDockIconListView *userIconListView;
  void *v7;
  SBDockIconListView *v8;

  v5 = (SBDockIconListView *)a3;
  userIconListView = self->_userIconListView;
  if (userIconListView != v5)
  {
    v8 = v5;
    -[SBDockIconListView removeFromSuperview](userIconListView, "removeFromSuperview");
    -[SBIconListView removeLayoutObserver:](self->_userIconListView, "removeLayoutObserver:", self);
    objc_storeStrong((id *)&self->_userIconListView, a3);
    if (v8)
    {
      -[SBDockIconListView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("user icon list view"));
      -[SBIconListView setLayoutInsetsMode:](v8, "setLayoutInsetsMode:", 2);
      -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](v8, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
      -[SBIconListView addLayoutObserver:](v8, "addLayoutObserver:", self);
      -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

      -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
    }
    -[SBFloatingDockView updateMainPlatterMetrics](self, "updateMainPlatterMetrics");
    v5 = v8;
  }

}

- (void)updateMainPlatterMetrics
{
  SBFloatingDockPlatterView *mainPlatterView;
  SBFloatingDockPlatterView *v4;

  mainPlatterView = self->_mainPlatterView;
  -[SBFloatingDockView maximumPlatterHeight](self, "maximumPlatterHeight");
  -[SBFloatingDockPlatterView setReferenceHeight:](mainPlatterView, "setReferenceHeight:");
  v4 = self->_mainPlatterView;
  -[SBFloatingDockView maximumDockContinuousCornerRadius](self, "maximumDockContinuousCornerRadius");
  -[SBFloatingDockPlatterView setMaximumContinuousCornerRadius:](v4, "setMaximumContinuousCornerRadius:");
}

- (void)setAccessoryIconView:(id)a3
{
  SBIconView *v5;
  SBIconView *accessoryIconView;
  void *v7;
  __int128 v8;

  v5 = (SBIconView *)a3;
  accessoryIconView = self->_accessoryIconView;
  if (accessoryIconView != v5)
  {
    -[SBIconView removeFromSuperview](accessoryIconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryIconView, a3);
    if (v5)
    {
      -[SBIconView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("Dock accessory icon view"));
      -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v5);

      if (-[SBFloatingDockView _shouldDisplayAccessoryIconView](self, "_shouldDisplayAccessoryIconView"))
      {
        -[SBFloatingDockView bounds](self, "bounds", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0);
        -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", &v8);
        -[SBIconView setIconContentScale:](v5, "setIconContentScale:", 0.001);
        UIRectGetCenter();
        -[SBIconView setCenter:](v5, "setCenter:");
      }
    }
    -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAccessoryIconViewVisible:(BOOL)a3
{
  SBIconView *accessoryIconView;
  SBIconView *v5;
  __int128 v6;
  __int128 v7;

  if (self->_accessoryIconViewVisible != a3)
  {
    self->_accessoryIconViewVisible = a3;
    if (-[SBFloatingDockView _shouldDisplayAccessoryIconView](self, "_shouldDisplayAccessoryIconView"))
    {
      accessoryIconView = self->_accessoryIconView;
      v7 = 0u;
      v5 = accessoryIconView;
      -[SBFloatingDockView bounds](self, "bounds", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
      -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", &v6);
      -[SBIconView setIconContentScale:](v5, "setIconContentScale:", *(double *)&v7);
      UIRectGetCenter();
      -[SBIconView setCenter:](v5, "setCenter:");

    }
    -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRecentIconListView:(id)a3
{
  SBDockIconListView *v5;
  SBDockIconListView *recentIconListView;
  void *v7;
  SBDockIconListView *v8;

  v5 = (SBDockIconListView *)a3;
  recentIconListView = self->_recentIconListView;
  if (recentIconListView != v5)
  {
    v8 = v5;
    -[SBDockIconListView removeFromSuperview](recentIconListView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_recentIconListView, a3);
    v5 = v8;
    if (v8)
    {
      -[SBDockIconListView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("Recent icon list view"));
      -[SBIconListView setLayoutInsetsMode:](v8, "setLayoutInsetsMode:", 2);
      -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](v8, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
      -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

      -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
      v5 = v8;
    }
  }

}

- (UIView)backgroundView
{
  return -[SBFloatingDockPlatterView backgroundView](self->_mainPlatterView, "backgroundView");
}

- (void)setBackgroundView:(id)a3
{
  -[SBFloatingDockPlatterView setBackgroundView:](self->_mainPlatterView, "setBackgroundView:", a3);
}

- (void)setMinimumUserIconSpaces:(unint64_t)a3
{
  if (self->_minimumUserIconSpaces != a3)
  {
    self->_minimumUserIconSpaces = a3;
    -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPaddingEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_paddingEdgeInsets.left != a3.left
    || self->_paddingEdgeInsets.top != a3.top
    || self->_paddingEdgeInsets.right != a3.right
    || self->_paddingEdgeInsets.bottom != a3.bottom)
  {
    self->_paddingEdgeInsets = a3;
    -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_editing != a3)
  {
    v4 = a4;
    self->_editing = a3;
    -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __42__SBFloatingDockView_setEditing_animated___block_invoke;
      v6[3] = &unk_1E8D84C50;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.3);
    }
  }
}

uint64_t __42__SBFloatingDockView_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setMaximumEditingIconSize:(CGSize)a3
{
  if (a3.width != self->_maximumEditingIconSize.width || a3.height != self->_maximumEditingIconSize.height)
  {
    self->_maximumEditingIconSize = a3;
    if (-[SBFloatingDockView isEditing](self, "isEditing"))
      -[SBFloatingDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)platterFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)hasPlatterShadow
{
  void *v2;
  char v3;

  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasShadow");

  return v3;
}

- (void)setHasPlatterShadow:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasShadow:", v3);

}

- (UIEdgeInsets)platterShadowOutsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOutsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)platterShadowOutsetsForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _OWORD v25[13];
  UIEdgeInsets result;

  memset(v25, 0, sizeof(v25));
  -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", v25, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BSRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shadowOutsetsForBounds:", v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

+ (double)contentHeightForBounds:(CGRect)a3 mainPlatterViewFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxY;
  CGRect v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MaxY = CGRectGetMaxY(a3);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  return MaxY - CGRectGetMinY(v10);
}

- (double)contentHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = (void *)objc_opt_class();
  -[SBFloatingDockView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  objc_msgSend(v3, "contentHeightForBounds:mainPlatterViewFrame:", v5, v7, v9, v11, v13, v14, v15, v16);
  v18 = v17;

  return v18;
}

- (double)contentHeightForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double result;
  _OWORD v8[10];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", v8, a3.origin.x);
  objc_msgSend((id)objc_opt_class(), "contentHeightForBounds:mainPlatterViewFrame:", x, y, width, height, v9, v10);
  return result;
}

- (double)iconContentScaleForNumberOfUserIcons:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v32;
  double v33;
  double v34;
  double v35;
  _OWORD v36[12];
  __int128 v37;

  -[SBFloatingDockView recentIconListView](self, "recentIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfIcons");

  -[SBFloatingDockView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v35 = v9;

  v37 = 0u;
  memset(v36, 0, sizeof(v36));
  v10 = (void *)objc_opt_class();
  -[SBFloatingDockView bounds](self, "bounds");
  v33 = v12;
  v34 = v11;
  v32 = v13;
  v15 = v14;
  v16 = -[SBFloatingDockView _shouldDisplayAccessoryIconView](self, "_shouldDisplayAccessoryIconView");
  -[SBFloatingDockView _referenceIconSize](self, "_referenceIconSize");
  v18 = v17;
  v20 = v19;
  -[SBFloatingDockView maximumIconSize](self, "maximumIconSize");
  v22 = v21;
  v24 = v23;
  -[SBFloatingDockView _referenceInterIconSpacing](self, "_referenceInterIconSpacing");
  v26 = v25;
  -[SBFloatingDockView maximumInterIconSpacing](self, "maximumInterIconSpacing");
  v28 = v27;
  -[SBFloatingDockView platterVerticalMargin](self, "platterVerticalMargin");
  objc_msgSend(v10, "getMetrics:forBounds:layoutScale:numberOfUserIcons:numberOfRecentIcons:displayAccessoryIconView:paddingEdgeInsets:referenceIconSize:maximumIconSize:referenceInterIconSpacing:maximumInterIconSpacing:platterVerticalMargin:editing:", v36, a3, v7, v16, -[SBFloatingDockView isEditing](self, "isEditing"), v34, v33, v32, v15, v35, *(_QWORD *)&self->_paddingEdgeInsets.top, *(_QWORD *)&self->_paddingEdgeInsets.left, *(_QWORD *)&self->_paddingEdgeInsets.bottom, *(_QWORD *)&self->_paddingEdgeInsets.right, v18, v20,
    v22,
    v24,
    v26,
    v28,
    v29);
  v30 = *(double *)&v37;

  return v30;
}

- (double)interIconSpacing
{
  double v3;
  double v4;
  double result;

  -[SBFloatingDockView iconContentScale](self, "iconContentScale");
  -[SBFloatingDockView maximumInterIconSpacing](self, "maximumInterIconSpacing");
  v4 = v3;
  if ((BSFloatIsOne() & 1) != 0)
    return v4;
  UIFloorToViewScale();
  return result;
}

- (void)getMetrics:(id *)a3 forBounds:(CGRect)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  CGFloat right;
  __int128 v32;
  CGFloat top;
  void *v35;

  -[SBFloatingDockView userIconListView](self, "userIconListView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockView recentIconListView](self, "recentIconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "displayedModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfIcons");

  v9 = -[SBFloatingDockView minimumUserIconSpaces](self, "minimumUserIconSpaces");
  if (v8 <= v9)
    v10 = v9;
  else
    v10 = v8;
  objc_msgSend(v6, "displayedModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfIcons");

  v13 = -[SBFloatingDockView _shouldDisplayAccessoryIconView](self, "_shouldDisplayAccessoryIconView");
  top = self->_paddingEdgeInsets.top;
  v32 = *(_OWORD *)&self->_paddingEdgeInsets.left;
  right = self->_paddingEdgeInsets.right;
  -[SBFloatingDockView _referenceIconSize](self, "_referenceIconSize");
  v15 = v14;
  v17 = v16;
  -[SBFloatingDockView _referenceInterIconSpacing](self, "_referenceInterIconSpacing");
  v19 = v18;
  -[SBFloatingDockView maximumIconSize](self, "maximumIconSize");
  v21 = v20;
  v23 = v22;
  -[SBFloatingDockView maximumInterIconSpacing](self, "maximumInterIconSpacing");
  v25 = v24;
  -[SBFloatingDockView platterVerticalMargin](self, "platterVerticalMargin");
  v27 = v26;
  -[SBFloatingDockView traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayScale");
  v30 = v29;

  objc_msgSend((id)objc_opt_class(), "getMetrics:forBounds:layoutScale:numberOfUserIcons:numberOfRecentIcons:displayAccessoryIconView:paddingEdgeInsets:referenceIconSize:maximumIconSize:referenceInterIconSpacing:maximumInterIconSpacing:platterVerticalMargin:editing:", a3, v10, v12, v13, -[SBFloatingDockView isEditing](self, "isEditing"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v30, *(_QWORD *)&top, v32, *(_QWORD *)&right, v15, v17, v21,
    v23,
    v19,
    v25,
    v27);

}

+ (void)getMetrics:(id *)a3 forBounds:(CGRect)a4 layoutScale:(double)a5 numberOfUserIcons:(unint64_t)a6 numberOfRecentIcons:(unint64_t)a7 displayAccessoryIconView:(BOOL)a8 paddingEdgeInsets:(UIEdgeInsets)a9 referenceIconSize:(CGSize)a10 maximumIconSize:(CGSize)a11 referenceInterIconSpacing:(double)a12 maximumInterIconSpacing:(double)a13 platterVerticalMargin:(double)a14 editing:(double)a15
{
  _BOOL4 v15;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v24;
  double v25;
  BOOL IsEmpty;
  uint64_t v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  _BOOL4 v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  int v46;
  int v47;
  int v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  CGRectEdge v70;
  double v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGRectEdge v77;
  double v78;
  CGSize v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  double MaxX;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  double MinX;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double MaxY;
  CGFloat v114;
  double v115;
  CGFloat v116;
  CGSize size;
  CGSize v118;
  CGSize v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat MinY;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  double v130;
  double v131;
  CGFloat v132;
  CGFloat v133;
  double v134;
  CGFloat v135;
  CGFloat v136;
  double v137;
  double v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect remainder;
  CGRect slice;
  double v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;

  v15 = a8;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v24 = a15;
  v25 = a12;
  IsEmpty = CGRectIsEmpty(a4);
  v27 = MEMORY[0x1E0C9D648];
  if (IsEmpty)
  {
    v132 = *MEMORY[0x1E0C9D648];
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v127 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v129 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }
  else
  {
    objc_msgSend(a1, "minimumPlatterMargin");
    v30 = v29;
    v145.origin.x = x;
    v145.origin.y = y;
    v145.size.width = width;
    v145.size.height = height;
    v146 = CGRectInset(v145, v30, 0.0);
    v132 = v146.origin.x;
    v127 = v146.size.height;
    v129 = v146.origin.y;
    v28 = v146.size.width;
  }
  v31 = a6 != 0;
  if (a6)
    v32 = a6 - 1;
  else
    v32 = 0;
  if (a7)
    v33 = a7 - 1;
  else
    v33 = 0;
  if (a7)
    v34 = 1;
  else
    v34 = v15;
  v35 = 1;
  if (a7)
  {
    v35 = 2;
    v36 = v15;
  }
  else
  {
    v36 = 0;
  }
  if ((v31 & v34) != 0)
    v37 = v35;
  else
    v37 = 0;
  v38 = 1.0;
  if (v31 && a7 != 0)
    v39 = 1.0;
  else
    v39 = 0.0;
  v136 = v28;
  if (BSFloatGreaterThanFloat())
  {
    UIFloorToScale();
    v25 = v40;
    goto LABEL_25;
  }
  if (a11.width > a12)
  {
LABEL_25:
    v38 = v25 / a11.width;
    v138 = v25;
    if (v25 / a11.width == 1.0)
    {
      v38 = 1.0;
    }
    else
    {
      UIFloorToScale();
      v24 = v41;
    }
    goto LABEL_29;
  }
  v138 = a12;
LABEL_29:
  if (a6)
    v42 = v24 * (double)v32 + (double)a6 * v138;
  else
    v42 = 0.0;
  if (a7)
    v43 = v24 * (double)v33 + (double)a7 * v138;
  else
    v43 = 0.0;
  if (v15)
    v44 = v138 * (double)v15;
  else
    v44 = 0.0;
  v45 = BSFloatGreaterThanFloat();
  v46 = BSFloatGreaterThanFloat();
  v47 = BSFloatGreaterThanFloat();
  v48 = v46 | v47;
  v49 = -0.0;
  if (v46)
    v49 = v39;
  v50 = v42 + v49 + (double)v37 * v24;
  v123 = v42;
  if ((v45 & v48) == 0)
    v50 = v42;
  v134 = v38;
  v131 = v43;
  if (v46 && (v50 = v43 + v50, v47))
  {
    v51 = v24;
    v50 = v50 + (double)v36 * v24;
  }
  else
  {
    v51 = v24;
  }
  v52 = v132;
  v53 = -0.0;
  v133 = v44;
  if (v47)
    v53 = v44;
  v54 = v53 + v50;
  v147.origin.x = v52;
  v147.origin.y = v129;
  v147.size.width = v136;
  v147.size.height = v127;
  CGRectGetMidX(v147);
  UIRoundToScale();
  v56 = v55;
  v148.origin.x = v52;
  v148.origin.y = v129;
  v148.size.width = v136;
  v148.size.height = v127;
  v57 = v51;
  v58 = CGRectGetMaxY(v148) - v138 - v51;
  v59 = v144;
  if (v144 <= 0.0)
    v59 = v51;
  v149.origin.y = v58 - v59;
  v149.origin.x = v56;
  v149.size.width = v54;
  v149.size.height = v138;
  v150 = CGRectInset(v149, -v51, -v51);
  v60 = v150.origin.x;
  v61 = v150.origin.y;
  v62 = v150.size.width;
  v63 = v150.size.height;
  v130 = v54;
  if (BSFloatLessThanFloat())
  {
    v151.origin.x = v60;
    v151.origin.y = v61;
    v151.size.width = v62;
    v151.size.height = v63;
    v64 = (v57 * 6.0 + v138 * 4.0 + 1.0 - CGRectGetWidth(v151)) * 0.5;
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    v125 = v66;
    v126 = v65;
    v120 = v67;
    v128 = v68;
  }
  else
  {
    v125 = v61;
    v126 = v60;
    v128 = v63;
    v120 = v62;
    v64 = 0.0;
  }
  v135 = v64;
  v69 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection", *(_QWORD *)&v120);
  memset(&slice, 0, sizeof(slice));
  v70 = 2 * (v69 == 1);
  memset(&remainder, 0, sizeof(remainder));
  v152.origin.x = v57 + v64;
  v152.origin.y = v57;
  v152.size.width = v130;
  v152.size.height = v138;
  CGRectDivide(v152, &slice, &remainder, v123, v70);
  MinY = CGRectGetMinY(slice);
  v124 = CGRectGetHeight(slice);
  if (v46)
    v71 = v57;
  else
    v71 = v57 / 3.0;
  v72 = v138 + v57;
  v73 = slice.origin.x;
  v74 = slice.origin.y;
  v75 = slice.size.width;
  v76 = slice.size.height;
  if (v69 == 1)
  {
    v77 = CGRectMinXEdge;
    v137 = CGRectGetMinX(*(CGRect *)&v73) - v71 + -1.0;
  }
  else
  {
    v137 = v71 + CGRectGetMaxX(*(CGRect *)&v73);
    v77 = CGRectMaxXEdge;
  }
  v78 = v57 + v72;
  v79 = *(CGSize *)(v27 + 16);
  v141.origin = *(CGPoint *)v27;
  v141.size = v79;
  v80 = v57 + v64;
  v79.width = v57;
  v81 = v130;
  v82 = v138;
  CGRectDivide(*(CGRect *)((char *)&v79 - 8), &v141, &remainder, v133, v77);
  memset(&v140, 0, sizeof(v140));
  if (v131 <= 0.0)
  {
    v92 = slice.origin.x;
    v93 = slice.origin.y;
    v94 = slice.size.width;
    v95 = slice.size.height;
    v83 = 2.0;
    if (v69 == 1)
      MinX = CGRectGetMinX(*(CGRect *)&v92);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v92);
    v97 = MinX;
    v154.size.width = v57 + v57 + v130;
    v84 = MinY;
    v85 = v124;
    v86 = -1.0;
    v154.origin.y = 0.0;
    v154.origin.x = v64;
    v154.size.height = v78;
    v140.origin.x = v97;
    v140.origin.y = 0.0;
    v140.size.width = 0.0;
    v140.size.height = CGRectGetHeight(v154);
  }
  else
  {
    v153.size.width = v57 + v57 + v130;
    v83 = 2.0;
    v153.origin.y = 0.0;
    v153.origin.x = v64;
    v153.size.height = v57 + v72;
    CGRectDivide(v153, &v140, &remainder, v57 + v57 + v131, v77);
    v84 = MinY;
    v85 = v124;
    v86 = -1.0;
    if (v133 > 0.0)
    {
      v87 = v141.origin.x;
      v88 = v141.origin.y;
      v89 = v141.size.width;
      v90 = v141.size.height;
      if (v69 == 1)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v87);
      }
      else
      {
        v98 = CGRectGetMinX(*(CGRect *)&v87);
        MaxX = v98 - CGRectGetWidth(v140);
      }
      v140.origin.x = MaxX;
    }
  }
  v99 = v84 + v86;
  v100 = v85 + v83;
  memset(&v139, 0, sizeof(v139));
  if (v48)
  {
    v101 = 1.0;
    v102 = v137;
    v103 = v99;
    v104 = v100;
    if ((v45 & 1) == 0)
    {
      v102 = v140.origin.x;
      v103 = v140.origin.y;
      v101 = v140.size.width;
      v104 = v140.size.height;
    }
    if (v69 == 1)
    {
      if ((v46 & 1) == 0)
      {
        v102 = v141.origin.x;
        v103 = v141.origin.y;
        v101 = v141.size.width;
        v104 = v141.size.height;
      }
      v105 = CGRectGetMaxX(*(CGRect *)&v102);
      v155.origin.y = 0.0;
      v106 = v57 + v57 + v130;
      v155.origin.x = v135;
      v155.size.width = v106;
      v155.size.height = v78;
      v107 = CGRectGetMaxX(v155) - v105;
      v64 = v135;
    }
    else
    {
      if ((v46 & 1) == 0)
      {
        v102 = v141.origin.x;
        v103 = v141.origin.y;
        v101 = v141.size.width;
        v104 = v141.size.height;
      }
      v108 = CGRectGetMinX(*(CGRect *)&v102);
      v157.origin.y = 0.0;
      v106 = v57 + v57 + v130;
      v157.origin.x = v64;
      v157.size.width = v106;
      v157.size.height = v78;
      v107 = v108 - CGRectGetMinX(v157);
    }
  }
  else
  {
    v156.origin.y = 0.0;
    v156.origin.x = v64;
    v106 = v57 + v57 + v130;
    v156.size.width = v106;
    v156.size.height = v78;
    v107 = CGRectGetWidth(v156);
  }
  v158.origin.x = v64;
  v158.origin.y = 0.0;
  v158.size.width = v106;
  v158.size.height = v78;
  CGRectDivide(v158, &v139, &remainder, v107, v70);
  v109 = CGRectGetMinY(slice);
  v110 = v109 - CGRectGetMinY(v139);
  v111 = CGRectGetMinX(slice);
  v112 = v111 - CGRectGetMinX(v139);
  MaxY = CGRectGetMaxY(v139);
  v114 = MaxY - CGRectGetMaxY(slice);
  v115 = CGRectGetMaxX(v139);
  v116 = CGRectGetMaxX(slice);
  size = v139.size;
  a3->var0.origin = v139.origin;
  a3->var0.size = size;
  a3->var1.top = v110;
  a3->var1.left = v112;
  a3->var1.bottom = v114;
  a3->var1.right = v115 - v116;
  v118 = v140.size;
  a3->var2.origin = v140.origin;
  a3->var2.size = v118;
  v119 = v141.size;
  a3->var3.origin = v141.origin;
  a3->var3.size = v119;
  a3->var4.origin.x = v137;
  a3->var4.origin.y = v99;
  a3->var4.size.width = 1.0;
  a3->var4.size.height = v100;
  a3->var5.origin.x = v126;
  a3->var5.origin.y = v125;
  a3->var5.size.width = v121;
  a3->var5.size.height = v128;
  a3->var6 = v134;
  a3->var7 = v57;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  objc_super v8;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)SBFloatingDockView;
  if (-[SBFloatingDockView pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4))
    return 1;
  -[UIView frame](self->_touchReceivingView, "frame");
  v9.x = x;
  v9.y = y;
  return CGRectContainsPoint(v10, v9);
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
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  double v20;
  void *v21;
  CGRect v22;
  __int128 v23;
  __int128 v24;
  CGRect v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  -[SBFloatingDockView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (BSFloatGreaterThanFloat())
  {
    if (BSFloatGreaterThanFloat())
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      v24 = 0u;
      memset(&v25, 0, sizeof(v25));
      v23 = 0u;
      memset(&v22, 0, sizeof(v22));
      -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", &v22, v4, v6, v8, v10);
      if (BSFloatGreaterThanFloat())
      {
        -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sbf_setBoundsAndPositionFromFrame:", v30, v31);
        -[UIView sbf_setBoundsAndPositionFromFrame:](self->_touchReceivingView, "sbf_setBoundsAndPositionFromFrame:", *(double *)&v30 + self->_paddingEdgeInsets.left, *((double *)&v30 + 1) + self->_paddingEdgeInsets.top, *(double *)&v31 - (self->_paddingEdgeInsets.left + self->_paddingEdgeInsets.right), *((double *)&v31 + 1) - (self->_paddingEdgeInsets.top + self->_paddingEdgeInsets.bottom));
        -[SBFloatingDockView dividerView](self, "dividerView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sbf_setBoundsAndPositionFromFrame:", v28, v29);
        v13 = *((double *)&v32 + 1);
        -[SBFloatingDockView userIconListView](self, "userIconListView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIconContentScale:", *(double *)&v32);
        objc_msgSend(v14, "setIconSpacing:", v13, v13);
        objc_msgSend(v14, "sbf_setBoundsAndPositionFromFrame:", *(_OWORD *)&v22.origin, *(_OWORD *)&v22.size);
        -[SBFloatingDockView recentIconListView](self, "recentIconListView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIconContentScale:", *(double *)&v32);
        objc_msgSend(v15, "setIconSpacing:", v13, v13);
        objc_msgSend(v15, "sbf_setBoundsAndPositionFromFrame:", *(_OWORD *)&v25.origin, *(_OWORD *)&v25.size);
        -[SBFloatingDockView accessoryIconView](self, "accessoryIconView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setIconContentScale:", *(double *)&v32);
        UIRectGetCenter();
        objc_msgSend(v16, "setCenter:");
        if (v15)
          v17 = v15;
        else
          v17 = v14;
        objc_msgSend(v17, "cursorHitTestingInsetsForIconSpacing:", v13, v13);
        objc_msgSend(v16, "setCursorHitTestPadding:");
        CGRectGetWidth(v22);
        v18 = BSFloatGreaterThanFloat();
        CGRectGetWidth(v25);
        v19 = BSFloatGreaterThanFloat();
        v20 = 1.0;
        if ((v18 & v19) == 0)
          v20 = 0.0;
        objc_msgSend(v12, "setAlpha:", v20);
        -[SBFloatingDockView setIconContentScale:](self, "setIconContentScale:", *(double *)&v32);
        -[SBFloatingDockView delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatingDockViewMainPlatterDidChangeFrame:", self);

      }
    }
  }
}

- (void)bounce
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[SBFloatingDockView mainPlatterView](self, "mainPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdditive:", 1);
  objc_msgSend(v3, "setFromValue:", &unk_1E8E16EC0);
  objc_msgSend(v3, "setToValue:", &unk_1E8E16ED0);
  objc_msgSend(v3, "setMass:", 3.0);
  objc_msgSend(v3, "setStiffness:", 1560.0);
  objc_msgSend(v3, "setDamping:", 600.0);
  objc_msgSend(v3, "setDuration:", 0.4);
  v4 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditive:", 1);
  objc_msgSend(v5, "setFromValue:", &unk_1E8E16EC0);
  objc_msgSend(v5, "setToValue:", &unk_1E8E16EE0);
  objc_msgSend(v5, "setMass:", 2.0);
  objc_msgSend(v5, "setStiffness:", 300.0);
  objc_msgSend(v5, "setDamping:", 400.0);
  objc_msgSend(v5, "setBeginTime:", 0.07);
  objc_msgSend(v5, "setDuration:", 0.91);
  objc_msgSend(v5, "setFillMode:", v4);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimations:", v7);

  objc_msgSend(v3, "duration");
  v9 = v8;
  objc_msgSend(v5, "beginTime");
  v11 = v10;
  objc_msgSend(v5, "duration");
  v13 = v11 + v12;
  if (v9 >= v13)
    v13 = v9;
  objc_msgSend(v6, "setDuration:", v13);
  objc_msgSend(v2, "addAnimation:forKey:", v6, CFSTR("SBFloatingDockView-bounce"));

}

- (void)updateDividerVisualStyling
{
  void *v3;
  void *v4;
  UIView *dividerView;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0D474B8];
  -[SBFloatingDockView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, 2, objc_msgSend(v4, "userInterfaceStyle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  dividerView = self->_dividerView;
  objc_msgSend(v7, "_visualStylingForStyle:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView mt_replaceVisualStyling:](dividerView, "mt_replaceVisualStyling:", v6);

  -[UIView setAlpha:](self->_dividerView, "setAlpha:", 0.5);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockView;
  -[SBFloatingDockView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[SBFloatingDockView updateDividerVisualStyling](self, "updateDividerVisualStyling");
}

- (SBFloatingDockViewDelegate)delegate
{
  return (SBFloatingDockViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFloatingDockPlatterView)mainPlatterView
{
  return self->_mainPlatterView;
}

- (void)setMainPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_mainPlatterView, a3);
}

- (SBDockIconListView)userIconListView
{
  return self->_userIconListView;
}

- (SBDockIconListView)recentIconListView
{
  return self->_recentIconListView;
}

- (SBIconView)accessoryIconView
{
  return self->_accessoryIconView;
}

- (BOOL)isAccessoryIconViewVisible
{
  return self->_accessoryIconViewVisible;
}

- (UIEdgeInsets)paddingEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_paddingEdgeInsets.top;
  left = self->_paddingEdgeInsets.left;
  bottom = self->_paddingEdgeInsets.bottom;
  right = self->_paddingEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)platterVerticalMargin
{
  return self->_platterVerticalMargin;
}

- (void)setPlatterVerticalMargin:(double)a3
{
  self->_platterVerticalMargin = a3;
}

- (unint64_t)minimumUserIconSpaces
{
  return self->_minimumUserIconSpaces;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (CGSize)maximumEditingIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumEditingIconSize.width;
  height = self->_maximumEditingIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (UIView)touchReceivingView
{
  return self->_touchReceivingView;
}

- (void)setTouchReceivingView:(id)a3
{
  objc_storeStrong((id *)&self->_touchReceivingView, a3);
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (void)setIconContentScale:(double)a3
{
  self->_iconContentScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchReceivingView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_accessoryIconView, 0);
  objc_storeStrong((id *)&self->_recentIconListView, 0);
  objc_storeStrong((id *)&self->_userIconListView, 0);
  objc_storeStrong((id *)&self->_mainPlatterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
