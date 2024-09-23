@implementation PLExpandedPlatterView

- (PLExpandedPlatterView)initWithFrame:(CGRect)a3
{
  PLExpandedPlatterView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLExpandedPlatterView;
  v3 = -[PLExpandedPlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__reduceTransparencyDidChange_, *MEMORY[0x1E0CEB098], 0);

    -[PLExpandedPlatterView setHeaderEnabled:](v3, "setHeaderEnabled:", 1);
    -[PLExpandedPlatterView setDismissControlEnabled:](v3, "setDismissControlEnabled:", 1);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB098], 0);

  v4.receiver = self;
  v4.super_class = (Class)PLExpandedPlatterView;
  -[PLExpandedPlatterView dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[PLExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[PLExpandedPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MinY;
  int v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  char v24;
  UIControl *dismissControl;
  objc_super v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PLExpandedPlatterView;
  if (-[PLExpandedPlatterView pointInside:withEvent:](&v27, sel_pointInside_withEvent_, v7, x, y))
  {
    if (!-[PLExpandedPlatterView isDismissControlEnabled](self, "isDismissControlEnabled"))
      goto LABEL_9;
    -[PLPlatterHeaderContentView superview](self->_headerContentView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterHeaderContentView frame](self->_headerContentView, "frame");
    objc_msgSend(v8, "convertRect:toView:", self);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v28.origin.x = v10;
    v28.origin.y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    MinY = CGRectGetMinY(v28);
    v18 = -[PLExpandedPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v19 = v10;
    v20 = v12;
    v21 = v14;
    v22 = v16;
    v23 = v18 ? x >= CGRectGetMinX(*(CGRect *)&v19) : x <= CGRectGetMaxX(*(CGRect *)&v19);
    if (y < MinY || !v23)
    {
      dismissControl = self->_dismissControl;
      -[PLExpandedPlatterView convertPoint:toView:](self, "convertPoint:toView:", dismissControl, x, y);
      v24 = -[UIControl pointInside:withEvent:](dismissControl, "pointInside:withEvent:", v7);
    }
    else
    {
LABEL_9:
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[9];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLExpandedPlatterView;
  -[PLExpandedPlatterView layoutSubviews](&v12, sel_layoutSubviews);
  -[PLExpandedPlatterView _configureDismissControlIfNecessary](self, "_configureDismissControlIfNecessary");
  -[PLExpandedPlatterView _configureScrollViewIfNecessary](self, "_configureScrollViewIfNecessary");
  -[PLExpandedPlatterView _configureScrollViewContentViewIfNecessary](self, "_configureScrollViewContentViewIfNecessary");
  -[PLExpandedPlatterView _configureMainContentViewIfNecessary](self, "_configureMainContentViewIfNecessary");
  -[PLExpandedPlatterView _configureHeaderContainerViewIfNecessary](self, "_configureHeaderContainerViewIfNecessary");
  -[PLExpandedPlatterView _configureCustomContentViewIfNecessary](self, "_configureCustomContentViewIfNecessary");
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLExpandedPlatterView _configureHeaderBackgroundViewsIfCanScroll](self, "_configureHeaderBackgroundViewsIfCanScroll");
  -[PLExpandedPlatterView _layoutDismissControl](self, "_layoutDismissControl");
  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
  {
    -[PLExpandedPlatterView _headerFrame](self, "_headerFrame");
    -[PLExpandedPlatterView _layoutHeaderContainerViewWithFrame:](self, "_layoutHeaderContainerViewWithFrame:");
    -[UIView bounds](self->_headerContainerView, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PLExpandedPlatterView _layoutHeaderContentViewWithFrame:](self, "_layoutHeaderContentViewWithFrame:");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__PLExpandedPlatterView_layoutSubviews__block_invoke;
    v11[3] = &unk_1E91D3400;
    v11[4] = self;
    v11[5] = v4;
    v11[6] = v6;
    v11[7] = v8;
    v11[8] = v10;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v11);
  }
  -[PLExpandedPlatterView _layoutScrollView](self, "_layoutScrollView");
  -[PLExpandedPlatterView _layoutScrollViewContentView](self, "_layoutScrollViewContentView");
  -[PLExpandedPlatterView _layoutMainContentView](self, "_layoutMainContentView");
  -[PLExpandedPlatterView _layoutCustomContentView](self, "_layoutCustomContentView");
  -[PLExpandedPlatterView _layoutActionsView](self, "_layoutActionsView");
  -[PLExpandedPlatterView _layoutTopRubberbandingView](self, "_layoutTopRubberbandingView");
}

uint64_t __39__PLExpandedPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutHeaderBackgroundViewsWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)hasShadow
{
  return 0;
}

- (BOOL)isBackgroundBlurred
{
  return 0;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PLExpandedPlatterView _sizeThatFitsContentExcludingActionsWithSize:](self, "_sizeThatFitsContentExcludingActionsWithSize:");
  v7 = v6;
  v9 = v8;
  if (self->_actionsView)
  {
    -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", width, height);
    v9 = v9 + v10;
  }
  v11 = v7;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height;
  double v4;
  double v5;
  double width;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  v5 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3.width > 0.0 && height > 0.0)
  {
    width = a3.width;
    -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset");
    v5 = width - v8;
    -[PLExpandedPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", width - v8, 0.0);
    v4 = (double)((int)(height - v9) & ~((int)(height - v9) >> 31));
  }
  v10 = v5;
  result.height = v4;
  result.width = v10;
  return result;
}

- (NSArray)icons
{
  return -[PLPlatterHeaderContentView icons](self->_headerContentView, "icons");
}

- (void)setIcons:(id)a3
{
  id v4;

  v4 = a3;
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLPlatterHeaderContentView setIcons:](self->_headerContentView, "setIcons:", v4);

}

- (NSString)title
{
  return -[PLPlatterHeaderContentView title](self->_headerContentView, "title");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLPlatterHeaderContentView title](self->_headerContentView, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setTitle:](self->_headerContentView, "setTitle:", v6);
  }

}

- (NSDate)date
{
  return -[PLPlatterHeaderContentView date](self->_headerContentView, "date");
}

- (void)setDate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLPlatterHeaderContentView date](self->_headerContentView, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setDate:](self->_headerContentView, "setDate:", v6);
  }

}

- (BOOL)isDateAllDay
{
  return -[PLPlatterHeaderContentView isDateAllDay](self->_headerContentView, "isDateAllDay");
}

- (void)setDateAllDay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PLPlatterHeaderContentView isDateAllDay](self->_headerContentView, "isDateAllDay") != a3)
  {
    -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setDateAllDay:](self->_headerContentView, "setDateAllDay:", v3);
  }
}

- (NSTimeZone)timeZone
{
  return -[PLPlatterHeaderContentView timeZone](self->_headerContentView, "timeZone");
}

- (void)setTimeZone:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLPlatterHeaderContentView timeZone](self->_headerContentView, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setTimeZone:](self->_headerContentView, "setTimeZone:", v6);
  }

}

- (int64_t)dateFormatStyle
{
  return -[PLPlatterHeaderContentView dateFormatStyle](self->_headerContentView, "dateFormatStyle");
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (-[PLPlatterHeaderContentView dateFormatStyle](self->_headerContentView, "dateFormatStyle") != a3)
    -[PLPlatterHeaderContentView setDateFormatStyle:](self->_headerContentView, "setDateFormatStyle:", a3);
}

- (NSArray)iconButtons
{
  return -[PLPlatterHeaderContentView iconButtons](self->_headerContentView, "iconButtons");
}

- (UIButton)utilityButton
{
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  return -[PLPlatterHeaderContentView utilityButton](self->_headerContentView, "utilityButton");
}

- (UIControl)dismissControl
{
  -[PLExpandedPlatterView _configureDismissControlIfNecessary](self, "_configureDismissControlIfNecessary");
  return self->_dismissControl;
}

- (UIEdgeInsets)dismissControlInsets
{
  int v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v3 = -[PLExpandedPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v4 = self->_dismissControlPosition == 0;
  v5 = 0.0;
  if ((v3 & v4) != 0)
    v6 = 12.0;
  else
    v6 = 0.0;
  if ((v3 & v4) != 0)
    v7 = 0.0;
  else
    v7 = 12.0;
  v8 = 0.0;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)setDismissControlPosition:(int64_t)a3
{
  if (self->_dismissControlPosition != a3)
  {
    self->_dismissControlPosition = a3;
    -[PLExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCustomContentSize:(CGSize)a3
{
  if (a3.width != self->_customContentSize.width || a3.height != self->_customContentSize.height)
  {
    self->_customContentSize = a3;
    -[PLExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setActionsHidden:(BOOL)a3
{
  MTMaterialView *actionsBackgroundView;
  double v5;

  if (self->_actionsHidden != a3)
  {
    self->_actionsHidden = a3;
    actionsBackgroundView = self->_actionsBackgroundView;
    if (a3)
      v5 = 0.0;
    else
      v5 = 1.0;
    -[MTMaterialView setAlpha:](actionsBackgroundView, "setAlpha:", v5);
    -[PLInterfaceActionGroupView setAlpha:](self->_actionsView, "setAlpha:", v5);
  }
}

- (void)setDismissControlEnabled:(BOOL)a3
{
  if (self->_dismissControlEnabled != a3)
  {
    self->_dismissControlEnabled = a3;
    -[PLExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHeaderEnabled:(BOOL)a3
{
  if (self->_headerEnabled != a3)
  {
    self->_headerEnabled = a3;
    -[PLExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeExcludingActions
{
  double v2;
  double v3;
  CGSize result;

  -[PLExpandedPlatterView _sizeThatFitsContentExcludingActionsWithSize:](self, "_sizeThatFitsContentExcludingActionsWithSize:", self->_customContentSize.width, self->_customContentSize.height);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)contentSizeExcludingActions
{
  double v2;
  double v3;
  CGSize result;

  -[PLExpandedPlatterView _contentSizeThatFitsContentWithSizeExcludingActions:](self, "_contentSizeThatFitsContentWithSizeExcludingActions:", self->_customContentSize.width, self->_customContentSize.height);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)actionsSizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PLExpandedPlatterView _actionsSizeThatFits:includingPadding:](self, "_actionsSizeThatFits:includingPadding:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)frameForPlatterFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset");
  v9 = v8;
  v11 = v10;
  v12 = -[PLExpandedPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v13 = 0.0;
  if (v12)
    v13 = v11;
  v14 = x - v13;
  v15 = width + v11;
  -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", v15, height);
  v17 = height + v9 + v16;
  v18 = v14;
  v19 = y - v9;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)platterFrameForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset");
  v9 = v8;
  v11 = v10;
  v12 = -[PLExpandedPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v13 = 0.0;
  if (v12)
    v13 = v11;
  v14 = x + v13;
  v15 = width - v11;
  -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", v15, height);
  v17 = height - (v9 + v16);
  v18 = v14;
  v19 = y + v9;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)scrollViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PLExpandedPlatterView _boundsInsetHorizontallyFromDismissControlIfNecessary](self, "_boundsInsetHorizontallyFromDismissControlIfNecessary");
  -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset");
  PLMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIEdgeInsets)minimumScrollViewContentInsets
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
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[PLExpandedPlatterView _boundsInsetHorizontallyFromDismissControlIfNecessary](self, "_boundsInsetHorizontallyFromDismissControlIfNecessary");
  v7 = v6;
  v9 = v8;
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v7, v9);
  v11 = v10;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (NSArray)interfaceActions
{
  return -[PLInterfaceActionGroupView actions](self->_actionsView, "actions");
}

- (void)setInterfaceActions:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLExpandedPlatterView interfaceActions](self, "interfaceActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PLExpandedPlatterView _configureActionViewIfNecessaryWithActions:](self, "_configureActionViewIfNecessaryWithActions:", v6);
    -[PLInterfaceActionGroupView setActions:](self->_actionsView, "setActions:", v6);
    -[PLExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIEdgeInsets)_dismissControlTotalOutset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t dismissControlPosition;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[PLExpandedPlatterView _configureDismissControlIfNecessary](self, "_configureDismissControlIfNecessary");
  v4 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (-[PLExpandedPlatterView isDismissControlEnabled](self, "isDismissControlEnabled"))
  {
    -[UIControl sizeThatFits:](self->_dismissControl, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    dismissControlPosition = self->_dismissControlPosition;
    if (dismissControlPosition == 1)
    {
      v6 = v7 + 8.0;
    }
    else if (!dismissControlPosition)
    {
      v4 = v8 + 8.0;
    }
  }
  v10 = v4;
  v11 = v3;
  v12 = v5;
  v13 = v6;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (CGRect)_boundsInsetHorizontallyFromDismissControlIfNecessary
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
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[PLExpandedPlatterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[PLExpandedPlatterView isDismissControlEnabled](self, "isDismissControlEnabled"))
  {
    -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset");
    v12 = v11;
    v13 = -[PLExpandedPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v14 = 0.0;
    if (v13)
      v14 = v12;
    v4 = v4 + v14;
    v8 = v8 - v12;
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGSize)_sizeThatFitsContentExcludingActionsWithSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  -[PLExpandedPlatterView _contentSizeThatFitsContentWithSizeExcludingActions:](self, "_contentSizeThatFitsContentWithSizeExcludingActions:", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  if (-[PLExpandedPlatterView isDismissControlEnabled](self, "isDismissControlEnabled"))
  {
    -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset");
    v6 = v6 + v9;
    v8 = v8 + v10;
  }
  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
  {
    -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, 0.0);
    v8 = v8 + v11;
  }
  v12 = v6;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_actionsSizeThatFits:(CGSize)a3 includingPadding:(BOOL)a4
{
  PLInterfaceActionGroupView *actionsView;
  _BOOL4 v5;
  double width;
  double v7;
  double v8;
  CGSize result;

  actionsView = self->_actionsView;
  if (actionsView)
  {
    v5 = a4;
    width = a3.width;
    -[PLInterfaceActionGroupView sizeThatFits:](actionsView, "sizeThatFits:", a3.width, a3.height);
    if (v7 < width)
      v7 = width;
    if (v5)
      v8 = v8 + 8.0;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIView)customContentView
{
  -[PLExpandedPlatterView _configureCustomContentViewIfNecessary](self, "_configureCustomContentViewIfNecessary");
  return self->_customContentView;
}

- (void)_configureDismissControlIfNecessary
{
  UIControl *v3;
  void *v4;
  UIControl *dismissControl;
  UIControl *v6;

  if (-[PLExpandedPlatterView isDismissControlEnabled](self, "isDismissControlEnabled"))
  {
    if (!self->_dismissControl)
    {
      +[PLGlyphControl dismissControlWithMaterialRecipe:](PLGlyphControl, "dismissControlWithMaterialRecipe:", 1);
      v3 = (UIControl *)objc_claimAutoreleasedReturnValue();
      -[UIControl setBlurEnabled:](v3, "setBlurEnabled:", 0);
      -[UIControl setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("dismiss-expanded-button"));
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", self);
      -[UIControl addInteraction:](v3, "addInteraction:", v4);

      dismissControl = self->_dismissControl;
      self->_dismissControl = v3;
      v6 = v3;

      -[PLExpandedPlatterView addSubview:](self, "addSubview:", self->_dismissControl);
    }
  }
}

- (void)_configureHeaderContainerViewIfNecessary
{
  UIView *v3;
  UIView *headerContainerView;

  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
  {
    if (!self->_headerContainerView)
    {
      v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      headerContainerView = self->_headerContainerView;
      self->_headerContainerView = v3;

      -[UIView setClipsToBounds:](self->_headerContainerView, "setClipsToBounds:", 0);
      -[PLExpandedPlatterView addSubview:](self, "addSubview:", self->_headerContainerView);
    }
  }
}

- (void)_configureHeaderBackgroundDefaultIfNecessary
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *headerBackgroundView;
  void *v7;
  UIView *headerContainerView;
  UIView *v9;
  UIView *v10;
  UIView *headerTintView;
  UIView *v12;
  void *v13;
  void *v14;
  UIView *headerKeyLineView;

  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled") && !self->_headerBackgroundView)
  {
    v3 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("expandedPlatterHeaderBackground"), v4, 0, 0, 1.0);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    headerBackgroundView = self->_headerBackgroundView;
    self->_headerBackgroundView = v5;

    -[UIView layer](self->_headerBackgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaskedCorners:", 3);

    -[UIView _setContinuousCornerRadius:](self->_headerBackgroundView, "_setContinuousCornerRadius:", 13.0);
    -[PLExpandedPlatterView _configureHeaderContainerViewIfNecessary](self, "_configureHeaderContainerViewIfNecessary");
    headerContainerView = self->_headerContainerView;
    v9 = self->_headerBackgroundView;
    if (self->_headerContentView)
      -[UIView insertSubview:belowSubview:](headerContainerView, "insertSubview:belowSubview:", v9);
    else
      -[UIView addSubview:](headerContainerView, "addSubview:", v9);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    headerTintView = self->_headerTintView;
    self->_headerTintView = v10;

    v12 = self->_headerTintView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView setAlpha:](self->_headerTintView, "setAlpha:", 0.65);
    -[UIView layer](self->_headerTintView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMaskedCorners:", 3);

    -[UIView _setContinuousCornerRadius:](self->_headerTintView, "_setContinuousCornerRadius:", 13.0);
    -[UIView insertSubview:aboveSubview:](self->_headerContainerView, "insertSubview:aboveSubview:", self->_headerTintView, self->_headerBackgroundView);
    -[UIView removeFromSuperview](self->_headerKeyLineView, "removeFromSuperview");
    headerKeyLineView = self->_headerKeyLineView;
    self->_headerKeyLineView = 0;

  }
}

- (double)_headerKeyLineAlphaForContentOffset
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double result;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v6 = v4 <= -v5;
  result = 0.0;
  if (!v6)
    return 1.0;
  return result;
}

- (void)_updateHeaderKeyLineAlphaIfNecessaryAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  if (self->_headerKeyLineView)
  {
    v3 = a3;
    -[PLExpandedPlatterView _headerKeyLineAlphaForContentOffset](self, "_headerKeyLineAlphaForContentOffset");
    v6 = v5;
    -[UIView alpha](self->_headerKeyLineView, "alpha");
    if (vabdd_f64(v7, v6) > 2.22044605e-16)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __70__PLExpandedPlatterView__updateHeaderKeyLineAlphaIfNecessaryAnimated___block_invoke;
      v10[3] = &unk_1E91D3428;
      v10[4] = self;
      *(double *)&v10[5] = v6;
      v8 = MEMORY[0x1D17E5ED8](v10);
      v9 = (void *)v8;
      if (v3)
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v8, 0.25);
      else
        (*(void (**)(uint64_t))(v8 + 16))(v8);

    }
  }
}

uint64_t __70__PLExpandedPlatterView__updateHeaderKeyLineAlphaIfNecessaryAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_configureHeaderBackgroundForReduceTransparencyIfNecessary
{
  UIView *v3;
  UIView *headerBackgroundView;
  UIView *v5;
  void *v6;
  void *v7;
  UIView *headerContainerView;
  UIView *v9;
  UIView *v10;
  UIView *headerKeyLineView;
  UIView *v12;
  void *v13;
  UIView *headerTintView;

  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled") && !self->_headerBackgroundView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    headerBackgroundView = self->_headerBackgroundView;
    self->_headerBackgroundView = v3;

    v5 = self->_headerBackgroundView;
    objc_msgSend(MEMORY[0x1E0CEA478], "_systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView layer](self->_headerBackgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaskedCorners:", 3);

    -[UIView _setContinuousCornerRadius:](self->_headerBackgroundView, "_setContinuousCornerRadius:", 13.0);
    -[PLExpandedPlatterView _configureHeaderContainerViewIfNecessary](self, "_configureHeaderContainerViewIfNecessary");
    headerContainerView = self->_headerContainerView;
    v9 = self->_headerBackgroundView;
    if (self->_headerContentView)
      -[UIView insertSubview:belowSubview:](headerContainerView, "insertSubview:belowSubview:", v9);
    else
      -[UIView addSubview:](headerContainerView, "addSubview:", v9);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    headerKeyLineView = self->_headerKeyLineView;
    self->_headerKeyLineView = v10;

    v12 = self->_headerKeyLineView;
    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[PLExpandedPlatterView _updateHeaderKeyLineAlphaIfNecessaryAnimated:](self, "_updateHeaderKeyLineAlphaIfNecessaryAnimated:", 0);
    -[UIView addSubview:](self->_headerContainerView, "addSubview:", self->_headerKeyLineView);
    -[UIView removeFromSuperview](self->_headerTintView, "removeFromSuperview");
    headerTintView = self->_headerTintView;
    self->_headerTintView = 0;

  }
}

- (void)_configureHeaderBackgroundViewsIfNecessary
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
    -[PLExpandedPlatterView _configureHeaderBackgroundForReduceTransparencyIfNecessary](self, "_configureHeaderBackgroundForReduceTransparencyIfNecessary");
  else
    -[PLExpandedPlatterView _configureHeaderBackgroundDefaultIfNecessary](self, "_configureHeaderBackgroundDefaultIfNecessary");
}

- (void)_invalidateHeaderBackgroundViews
{
  UIView *headerBackgroundView;
  UIView *headerTintView;
  UIView *headerKeyLineView;

  -[UIView removeFromSuperview](self->_headerBackgroundView, "removeFromSuperview");
  headerBackgroundView = self->_headerBackgroundView;
  self->_headerBackgroundView = 0;

  -[UIView removeFromSuperview](self->_headerTintView, "removeFromSuperview");
  headerTintView = self->_headerTintView;
  self->_headerTintView = 0;

  -[UIView removeFromSuperview](self->_headerKeyLineView, "removeFromSuperview");
  headerKeyLineView = self->_headerKeyLineView;
  self->_headerKeyLineView = 0;

}

- (void)_configureHeaderBackgroundViewsIfCanScroll
{
  double v3;
  double v4;
  double v5;
  double Height;
  double v7;
  _QWORD v8[5];
  CGRect v9;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  -[PLExpandedPlatterView minimumScrollViewContentInsets](self, "minimumScrollViewContentInsets");
  if (v4 <= -v5
    && (-[UIScrollView frame](self->_scrollView, "frame"),
        Height = CGRectGetHeight(v9),
        -[UIScrollView contentSize](self->_scrollView, "contentSize"),
        Height >= v7))
  {
    -[PLExpandedPlatterView _invalidateHeaderBackgroundViews](self, "_invalidateHeaderBackgroundViews");
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PLExpandedPlatterView__configureHeaderBackgroundViewsIfCanScroll__block_invoke;
    v8[3] = &unk_1E91D3160;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v8);
  }
}

uint64_t __67__PLExpandedPlatterView__configureHeaderBackgroundViewsIfCanScroll__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureHeaderBackgroundViewsIfNecessary");
}

- (void)_configureHeaderContentViewIfNecessary
{
  PLExpandedPlatterHeaderContentView *v3;
  PLPlatterHeaderContentView *headerContentView;
  void *v5;

  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
  {
    if (!self->_headerContentView)
    {
      v3 = objc_alloc_init(PLExpandedPlatterHeaderContentView);
      headerContentView = self->_headerContentView;
      self->_headerContentView = &v3->super;

      -[PLPlatterHeaderContentView layer](self->_headerContentView, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMaskedCorners:", 3);

      -[PLPlatterHeaderContentView _setContinuousCornerRadius:](self->_headerContentView, "_setContinuousCornerRadius:", 13.0);
      -[PLExpandedPlatterView _configureHeaderContainerViewIfNecessary](self, "_configureHeaderContainerViewIfNecessary");
      -[UIView addSubview:](self->_headerContainerView, "addSubview:", self->_headerContentView);
    }
  }
}

- (void)_configureScrollViewIfNecessary
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  void *v5;
  UIView *v6;
  UIView *topRubberbandingView;
  void *v8;
  UIView *v9;
  void *v10;

  if (!self->_scrollView)
  {
    v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0CEA970]);
    scrollView = self->_scrollView;
    self->_scrollView = v3;

    -[UIScrollView layer](self->_scrollView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskedCorners:", 3);

    -[UIScrollView _setContinuousCornerRadius:](self->_scrollView, "_setContinuousCornerRadius:", 13.0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setKeyboardDismissMode:](self->_scrollView, "setKeyboardDismissMode:", 0);
    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
    -[PLExpandedPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_scrollView, 0);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    topRubberbandingView = self->_topRubberbandingView;
    self->_topRubberbandingView = v6;

    -[UIView layer](self->_topRubberbandingView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaskedCorners:", 3);

    -[UIView _setContinuousCornerRadius:](self->_topRubberbandingView, "_setContinuousCornerRadius:", 13.0);
    v9 = self->_topRubberbandingView;
    objc_msgSend(MEMORY[0x1E0CEA478], "_systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_topRubberbandingView);
  }
}

- (void)_configureScrollViewContentViewIfNecessary
{
  UIView *v3;
  UIView *scrollViewContentView;
  void *v5;

  if (!self->_scrollViewContentView)
  {
    -[PLExpandedPlatterView _configureScrollViewIfNecessary](self, "_configureScrollViewIfNecessary");
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    scrollViewContentView = self->_scrollViewContentView;
    self->_scrollViewContentView = v3;

    -[UIView layer](self->_scrollViewContentView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskedCorners:", 3);

    -[UIView _setContinuousCornerRadius:](self->_scrollViewContentView, "_setContinuousCornerRadius:", 13.0);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_scrollViewContentView);
  }
}

- (void)_configureCustomContentViewIfNecessary
{
  double v3;
  double v4;

  if (!self->_customContentView)
  {
    -[PLExpandedPlatterView customContentSize](self, "customContentSize");
    if (v4 != 0.0 || v3 != 0.0)
      -[PLExpandedPlatterView _configureCustomContentView](self, "_configureCustomContentView");
  }
}

- (void)_configureActionsBackgroundViewIfNecessaryWithActions:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  MTMaterialView *actionsBackgroundView;
  id v10;

  if (!self->_actionsBackgroundView)
  {
    if (objc_msgSend(a3, "count"))
    {
      -[PLExpandedPlatterView _configureScrollViewContentViewIfNecessary](self, "_configureScrollViewContentViewIfNecessary");
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:", 1, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.actions"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGroupNameBase:", v8);

      objc_msgSend(v4, "_setContinuousCornerRadius:", 13.0);
      actionsBackgroundView = self->_actionsBackgroundView;
      self->_actionsBackgroundView = (MTMaterialView *)v4;
      v10 = v4;

      -[UIView addSubview:](self->_scrollViewContentView, "addSubview:", self->_actionsBackgroundView);
    }
  }
}

- (void)_configureActionViewIfNecessaryWithActions:(id)a3
{
  id v4;
  void *v5;
  MTMaterialView *actionsBackgroundView;
  PLInterfaceActionGroupView *actionsView;
  PLInterfaceActionGroupView *v8;
  PLInterfaceActionGroupView *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PLInterfaceActionGroupView *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_actionsView || !objc_msgSend(v4, "count"))
  {
    if (!objc_msgSend(v5, "count"))
    {
      -[MTMaterialView removeFromSuperview](self->_actionsBackgroundView, "removeFromSuperview");
      -[PLInterfaceActionGroupView removeFromSuperview](self->_actionsView, "removeFromSuperview");
      actionsBackgroundView = self->_actionsBackgroundView;
      self->_actionsBackgroundView = 0;

      actionsView = self->_actionsView;
      self->_actionsView = 0;

    }
  }
  else
  {
    v18 = v5;
    -[PLExpandedPlatterView _configureActionsBackgroundViewIfNecessaryWithActions:](self, "_configureActionsBackgroundViewIfNecessaryWithActions:", v5);
    v8 = objc_alloc_init(PLInterfaceActionGroupView);
    v9 = self->_actionsView;
    self->_actionsView = v8;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PLInterfaceActionGroupView requiredVisualStyleCategories](self->_actionsView, "requiredVisualStyleCategories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "integerValue");
          v16 = self->_actionsView;
          -[MTMaterialView visualStylingProviderForCategory:](self->_actionsBackgroundView, "visualStylingProviderForCategory:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLInterfaceActionGroupView setVisualStylingProvider:forCategory:](v16, "setVisualStylingProvider:forCategory:", v17, v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    -[PLInterfaceActionGroupView setCornerRadius:](self->_actionsView, "setCornerRadius:", 13.0);
    v5 = v18;
    -[PLInterfaceActionGroupView setActions:](self->_actionsView, "setActions:", v18);
    -[UIView insertSubview:aboveSubview:](self->_scrollViewContentView, "insertSubview:aboveSubview:", self->_actionsView, self->_actionsBackgroundView);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__PLExpandedPlatterView__configureActionViewIfNecessaryWithActions___block_invoke;
    v19[3] = &unk_1E91D3160;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v19);
  }

}

uint64_t __68__PLExpandedPlatterView__configureActionViewIfNecessaryWithActions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutActionsView");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "layoutIfNeeded");
}

- (void)_layoutDismissControl
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double MinX;
  double v25;
  double v26;
  double MaxX;
  double v28;
  double v29;
  CGRect v30;

  if (-[PLExpandedPlatterView isDismissControlEnabled](self, "isDismissControlEnabled"))
  {
    -[PLExpandedPlatterView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIControl sizeThatFits:](self->_dismissControl, "sizeThatFits:", v7, v9);
    BSRectWithSize();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = -[PLExpandedPlatterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v20 = v4;
    v21 = v6;
    v22 = v8;
    v23 = v10;
    if (v19)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v20);
      v25 = 12.0;
      if (self->_dismissControlPosition == 1)
        v25 = 0.0;
      v26 = MinX + v25;
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v20);
      v30.origin.x = v12;
      v30.origin.y = v14;
      v30.size.width = v16;
      v30.size.height = v18;
      v28 = MaxX - CGRectGetWidth(v30);
      v29 = 12.0;
      if (self->_dismissControlPosition == 1)
        v29 = 0.0;
      v26 = v28 - v29;
    }
    -[UIControl setFrame:](self->_dismissControl, "setFrame:", v26, v14, v16, v18);
  }
}

- (CGRect)_headerFrame
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
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[PLExpandedPlatterView _boundsInsetHorizontallyFromDismissControlIfNecessary](self, "_boundsInsetHorizontallyFromDismissControlIfNecessary");
  v4 = v3;
  v6 = v5;
  -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v7, v8);
  BSRectWithSize();
  v10 = v9;
  v12 = v11;
  if (!self->_dismissControlPosition)
  {
    -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset");
    v6 = v6 + v13;
  }
  v14 = v4;
  v15 = v6;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_layoutHeaderContainerViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
    -[UIView setFrame:](self->_headerContainerView, "setFrame:", x, y, width, height);
}

- (void)_layoutHeaderContentViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PLPlatterHeaderContentView *headerContentView;
  double MidX;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
    -[PLPlatterHeaderContentView setFrame:](self->_headerContentView, "setFrame:", x, y, width, height);
  if (-[PLExpandedPlatterView isDismissControlEnabled](self, "isDismissControlEnabled"))
  {
    headerContentView = self->_headerContentView;
    MidX = 0.0;
    if (!self->_dismissControlPosition)
    {
      -[UIControl frame](self->_dismissControl, "frame", 0.0);
      MidX = CGRectGetMidX(v10);
    }
    -[PLPlatterHeaderContentView _setUtilityButtonHorizontalLayoutReference:](headerContentView, "_setUtilityButtonHorizontalLayoutReference:", MidX);
  }
}

- (void)_layoutHeaderBackgroundViewsWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIView *headerBackgroundView;
  double MinX;
  double MaxY;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
  {
    headerBackgroundView = self->_headerBackgroundView;
    if (headerBackgroundView)
    {
      -[UIView setFrame:](headerBackgroundView, "setFrame:", x, y, width, height);
      -[UIView setFrame:](self->_headerTintView, "setFrame:", x, y, width, height);
      if (self->_headerKeyLineView)
      {
        v12.origin.x = x;
        v12.origin.y = y;
        v12.size.width = width;
        v12.size.height = height;
        MinX = CGRectGetMinX(v12);
        v13.origin.x = x;
        v13.origin.y = y;
        v13.size.width = width;
        v13.size.height = height;
        MaxY = CGRectGetMaxY(v13);
        v14.origin.x = x;
        v14.origin.y = y;
        v14.size.width = width;
        v14.size.height = height;
        v11 = CGRectGetWidth(v14);
        -[UIView setFrame:](self->_headerKeyLineView, "setFrame:", MinX, MaxY, v11, 1.0 / PLMainScreenScale());
      }
    }
  }
}

- (CGRect)_scrollViewContentViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[PLExpandedPlatterView _boundsInsetHorizontallyFromDismissControlIfNecessary](self, "_boundsInsetHorizontallyFromDismissControlIfNecessary");
  v4 = v3;
  v6 = v5;
  -[PLExpandedPlatterView _contentViewSize](self, "_contentViewSize");
  BSRectWithSize();
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLExpandedPlatterView _headerContentView](self, "_headerContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v4, v6);

  PLMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_layoutScrollView
{
  UIScrollView *scrollView;

  -[PLExpandedPlatterView scrollViewFrame](self, "scrollViewFrame");
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  scrollView = self->_scrollView;
  -[PLExpandedPlatterView minimumScrollViewContentInsets](self, "minimumScrollViewContentInsets");
  -[UIScrollView setContentInset:](scrollView, "setContentInset:");
}

- (void)_layoutTopRubberbandingView
{
  if (-[PLExpandedPlatterView isHeaderEnabled](self, "isHeaderEnabled"))
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    PLMainScreenScale();
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_topRubberbandingView, "setFrame:");
  }
}

- (void)_layoutScrollViewContentView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double contentBottomInset;
  CGRect v20;
  CGRect v21;

  -[PLExpandedPlatterView _scrollViewContentViewFrame](self, "_scrollViewContentViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_scrollViewContentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v8, v10);
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLExpandedPlatterView scrollViewFrame](self, "scrollViewFrame");
  Height = CGRectGetHeight(v20);
  -[PLExpandedPlatterView minimumScrollViewContentInsets](self, "minimumScrollViewContentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v18 = CGRectGetHeight(v21);
  contentBottomInset = 0.0;
  if (v18 > Height)
    contentBottomInset = self->_contentBottomInset;
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v13, v15, contentBottomInset, v17);
}

- (void)_layoutMainContentView
{
  UIView *mainContentView;

  mainContentView = self->_mainContentView;
  -[PLExpandedPlatterView _effectiveMainContentViewFrame](self, "_effectiveMainContentViewFrame");
  -[UIView setFrame:](mainContentView, "setFrame:");
}

- (void)_layoutActionsView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_actionsView)
  {
    -[PLExpandedPlatterView _actionsViewFrame](self, "_actionsViewFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[MTMaterialView setFrame:](self->_actionsBackgroundView, "setFrame:");
    -[PLInterfaceActionGroupView setFrame:](self->_actionsView, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)_reduceTransparencyDidChange:(id)a3
{
  -[PLExpandedPlatterView _invalidateHeaderBackgroundViews](self, "_invalidateHeaderBackgroundViews", a3);
  -[PLExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLExpandedPlatterView;
  if (-[PLExpandedPlatterView respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else if (-[UIView pl_isScrollViewDelegateMethod:](self, "pl_isScrollViewDelegateMethod:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  if (-[UIView pl_isScrollViewDelegateMethod:](self, "pl_isScrollViewDelegateMethod:", objc_msgSend(v4, "selector")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "invokeWithTarget:", WeakRetained);
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)PLExpandedPlatterView;
      -[PLExpandedPlatterView forwardInvocation:](&v6, sel_forwardInvocation_, v4);
    }

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  -[PLExpandedPlatterView _configureHeaderBackgroundViewsIfCanScroll](self, "_configureHeaderBackgroundViewsIfCanScroll");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__PLExpandedPlatterView_scrollViewDidScroll___block_invoke;
  v10[3] = &unk_1E91D3160;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v10);
  -[PLExpandedPlatterView _layoutTopRubberbandingView](self, "_layoutTopRubberbandingView");
  objc_msgSend(v9, "contentOffset");
  v5 = v4;
  objc_msgSend(v9, "contentInset");
  objc_msgSend(v9, "setClipsToBounds:", v5 > -v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(WeakRetained, "associatedViewControllerDidAppearForExpandedPlatterView:", self);
  else
    v8 = 0;
  -[PLExpandedPlatterView _updateHeaderKeyLineAlphaIfNecessaryAnimated:](self, "_updateHeaderKeyLineAlphaIfNecessaryAnimated:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewDidScroll:", v9);

}

uint64_t __45__PLExpandedPlatterView_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  id *v1;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[52], "bounds");
  return objc_msgSend(v1, "_layoutHeaderBackgroundViewsWithFrame:");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;

  v4 = a4;
  v7 = a3;
  if (v4)
    objc_msgSend(v7, "setClipsToBounds:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewDidEndDragging:willDecelerate:", v7, v4);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  return -[PLPlatterHeaderContentView adjustsFontForContentSizeCategory](self->_headerContentView, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PLExpandedPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLPlatterHeaderContentView setAdjustsFontForContentSizeCategory:](self->_headerContentView, "setAdjustsFontForContentSizeCategory:", v3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[PLPlatterHeaderContentView adjustForContentSizeCategoryChange](self->_headerContentView, "adjustForContentSizeCategoryChange");
  if (v3)
    -[PLExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self->_dismissControl);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (CGSize)customContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_customContentSize.width;
  height = self->_customContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isActionsHidden
{
  return self->_actionsHidden;
}

- (BOOL)clipsVisibleContentToBounds
{
  return self->_clipsVisibleContentToBounds;
}

- (void)setClipsVisibleContentToBounds:(BOOL)a3
{
  self->_clipsVisibleContentToBounds = a3;
}

- (double)contentBottomInset
{
  return self->_contentBottomInset;
}

- (void)setContentBottomInset:(double)a3
{
  self->_contentBottomInset = a3;
}

- (int64_t)dismissControlPosition
{
  return self->_dismissControlPosition;
}

- (BOOL)isDismissControlEnabled
{
  return self->_dismissControlEnabled;
}

- (BOOL)isHeaderEnabled
{
  return self->_headerEnabled;
}

- (PLExpandedPlatterViewDelegate)delegate
{
  return (PLExpandedPlatterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)_mainContentView
{
  return self->_mainContentView;
}

- (void)setMainContentView:(id)a3
{
  objc_storeStrong((id *)&self->_mainContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_actionsView, 0);
  objc_storeStrong((id *)&self->_actionsBackgroundView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_topRubberbandingView, 0);
  objc_storeStrong((id *)&self->_scrollViewContentView, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_headerTintView, 0);
  objc_storeStrong((id *)&self->_headerKeyLineView, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
}

- (void)_configureMainContentViewIfNecessary
{
  UIView *v3;
  UIView *mainContentView;
  UIView *v5;
  void *v6;
  void *v7;

  if (!self->_mainContentView)
  {
    -[PLExpandedPlatterView _configureScrollViewContentViewIfNecessary](self, "_configureScrollViewContentViewIfNecessary");
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    mainContentView = self->_mainContentView;
    self->_mainContentView = v3;

    v5 = self->_mainContentView;
    objc_msgSend(MEMORY[0x1E0CEA478], "_systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView layer](self->_mainContentView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaskedCorners:", 12);

    -[UIView _setContinuousCornerRadius:](self->_mainContentView, "_setContinuousCornerRadius:", 13.0);
    -[UIView addSubview:](self->_scrollViewContentView, "addSubview:", self->_mainContentView);
  }
}

- (void)_configureCustomContentView
{
  UIView *v3;
  UIView *customContentView;
  UIView *v5;
  void *v6;
  void *v7;

  -[PLExpandedPlatterView _configureMainContentViewIfNecessary](self, "_configureMainContentViewIfNecessary");
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  customContentView = self->_customContentView;
  self->_customContentView = v3;

  v5 = self->_customContentView;
  objc_msgSend(MEMORY[0x1E0CEA478], "_systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UIView setClipsToBounds:](self->_customContentView, "setClipsToBounds:", 1);
  -[UIView setAutoresizesSubviews:](self->_customContentView, "setAutoresizesSubviews:", 1);
  -[UIView layer](self->_customContentView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", 12);

  -[UIView _setContinuousCornerRadius:](self->_customContentView, "_setContinuousCornerRadius:", 13.0);
  -[UIView addSubview:](self->_mainContentView, "addSubview:", self->_customContentView);
}

- (CGRect)_actionsViewFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[PLExpandedPlatterView _boundsInsetHorizontallyFromDismissControlIfNecessary](self, "_boundsInsetHorizontallyFromDismissControlIfNecessary");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PLExpandedPlatterView _actionsSizeThatFits:includingPadding:](self, "_actionsSizeThatFits:includingPadding:", 0, v7, v9);
  BSRectWithSize();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PLExpandedPlatterView customContentSize](self, "customContentSize");
  v20 = v14 + v19 + 8.0;
  if (self->_clipsVisibleContentToBounds)
  {
    v25.origin.x = v12;
    v25.origin.y = v20;
    v25.size.width = v16;
    v25.size.height = v18;
    CGRectGetMinY(v25);
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    CGRectGetHeight(v26);
    v27.origin.x = v12;
    v27.origin.y = v20;
    v27.size.width = v16;
    v27.size.height = v18;
    CGRectGetHeight(v27);
  }
  PLMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_mainContentViewFrame
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
  double v15;
  CGRect v16;
  CGRect result;

  -[PLExpandedPlatterView _boundsInsetHorizontallyFromDismissControlIfNecessary](self, "_boundsInsetHorizontallyFromDismissControlIfNecessary");
  CGRectGetWidth(v16);
  BSRectWithSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PLExpandedPlatterView customContentSize](self, "customContentSize");
  v12 = v10 + v11;
  v13 = v4;
  v14 = v6;
  v15 = v8;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)_contentViewSize
{
  double width;
  double height;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;
  CGRect v15;

  -[PLExpandedPlatterView _boundsInsetHorizontallyFromDismissControlIfNecessary](self, "_boundsInsetHorizontallyFromDismissControlIfNecessary");
  width = v15.size.width;
  height = v15.size.height;
  v5 = CGRectGetWidth(v15);
  -[PLExpandedPlatterView customContentSize](self, "customContentSize");
  v7 = v6 + 0.0;
  if (self->_actionsView)
  {
    -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", width, height);
    v7 = v7 + v8;
  }
  -[PLExpandedPlatterView minimumScrollViewContentInsets](self, "minimumScrollViewContentInsets");
  v10 = v7 + v9;
  -[PLExpandedPlatterView minimumScrollViewContentInsets](self, "minimumScrollViewContentInsets");
  v12 = v10 + v11;
  v13 = v5;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)_layoutCustomContentView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  UIView *customContentView;
  CGRect v17;

  if (self->_customContentView)
  {
    -[PLExpandedPlatterView _layoutMainContentViewIfNecessary](self, "_layoutMainContentViewIfNecessary");
    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    CGRectGetWidth(v17);
    -[PLExpandedPlatterView customContentSize](self, "customContentSize");
    BSRectWithSize();
    if (self->_clipsVisibleContentToBounds)
    {
      CGRectGetHeight(*(CGRect *)&v12);
      -[PLExpandedPlatterView bounds](self, "bounds");
      -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
    }
    customContentView = self->_customContentView;
    PLMainScreenScale();
    UIRectIntegralWithScale();
    -[UIView setFrame:](customContentView, "setFrame:");
  }
}

- (UIView)_headerContentView
{
  return (UIView *)self->_headerContentView;
}

- (CGRect)_effectiveMainContentViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PLExpandedPlatterView _mainContentViewFrame](self, "_mainContentViewFrame");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  if (self->_clipsVisibleContentToBounds)
  {
    Height = CGRectGetHeight(*(CGRect *)&v3);
    -[PLExpandedPlatterView bounds](self, "bounds");
    -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
    if (Height <= v11)
      v6 = Height;
    else
      v6 = v11;
  }
  v12 = v7;
  v13 = v8;
  v14 = v9;
  result.size.height = v6;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)_flexibleAreaSizeForBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  -[PLExpandedPlatterView _dismissControlTotalOutset](self, "_dismissControlTotalOutset", a3.origin.x, a3.origin.y);
  v7 = v6;
  -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, height);
  v9 = v8;
  -[PLExpandedPlatterView _actionsSizeThatFits:includingPadding:](self, "_actionsSizeThatFits:includingPadding:", 1, width, height);
  v11 = height - (v7 + v9 + v10);
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)_layoutMainContentViewIfNecessary
{
  void *v3;
  int v4;

  -[UIView layer](self->_mainContentView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsLayout");

  if (v4)
    -[PLExpandedPlatterView _layoutMainContentView](self, "_layoutMainContentView");
}

@end
