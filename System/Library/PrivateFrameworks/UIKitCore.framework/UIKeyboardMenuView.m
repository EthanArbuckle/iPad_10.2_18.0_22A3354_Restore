@implementation UIKeyboardMenuView

- (UIKeyboardMenuView)initWithFrame:(CGRect)a3
{
  UIKeyboardMenuView *v3;
  UIKeyboardMenuView *v4;
  UIInputSwitcherTableView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIInputSwitcherTableView *m_table;
  void *v12;
  UIInputSwitcherSelectionExtraView *v13;
  UIInputSwitcherSelectionExtraView *m_selExtraView;
  UIInputSwitcherTableView *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UIKeyboardMenuView *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardMenuView;
  v3 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    if (-[UIKeyboardMenuView usesTable](v3, "usesTable"))
    {
      v5 = [UIInputSwitcherTableView alloc];
      v6 = *MEMORY[0x1E0C9D648];
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v10 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], v7, v8, v9);
      m_table = v4->m_table;
      v4->m_table = (UIInputSwitcherTableView *)v10;

      -[UITableView setDataSource:](v4->m_table, "setDataSource:", v4);
      -[UITableView setDelegate:](v4->m_table, "setDelegate:", v4);
      -[UITableView setSeparatorStyle:](v4->m_table, "setSeparatorStyle:", 0);
      +[UIColor clearColor](UIColor, "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView setBackgroundColor:](v4->m_table, "setBackgroundColor:", v12);

      -[UIScrollView setUserInteractionEnabled:](v4->m_table, "setUserInteractionEnabled:", 0);
      -[UIInputSwitcherTableView setMenu:](v4->m_table, "setMenu:", v4);
      -[UIView addSubview:](v4, "addSubview:", v4->m_table);
      v13 = -[UIInputSwitcherSelectionExtraView initWithFrame:]([UIInputSwitcherSelectionExtraView alloc], "initWithFrame:", v6, v7, v8, v9);
      m_selExtraView = v4->m_selExtraView;
      v4->m_selExtraView = v13;

      -[UIInputSwitcherSelectionExtraView setMenu:](v4->m_selExtraView, "setMenu:", v4);
      v15 = v4->m_table;
      v16 = objc_opt_class();
      +[UIInputSwitcherTableCell reuseIdentifier](UIInputSwitcherTableCell, "reuseIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView registerClass:forCellReuseIdentifier:](v15, "registerClass:forCellReuseIdentifier:", v16, v17);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v4, sel_applicationWillSuspend_, CFSTR("UIApplicationSuspendedNotification"), 0);

    -[UIView setOpaque:](v4, "setOpaque:", 0);
    v4->m_shouldFade = 1;
    v19 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationSuspendedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardMenuView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (id)table
{
  return self->m_table;
}

- (BOOL)usesTable
{
  return 1;
}

- (BOOL)centerPopUpOverKey
{
  return 0;
}

- (id)subtitleFont
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", 12.0);
}

- (id)font
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", 18.0);
}

- (void)setFrame:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  UIInputSwitcherShadowView *m_shadowView;
  double v9;
  double v10;
  double v11;
  double MidX;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v14 = CGRectIntegral(a3);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardMenuView;
  -[UIView setFrame:](&v13, sel_setFrame_);
  m_shadowView = self->m_shadowView;
  -[UIScrollView contentSize](self->m_table, "contentSize");
  v10 = v9;
  -[UIScrollView contentSize](self->m_table, "contentSize");
  -[UIInputSwitcherShadowView setFrame:](m_shadowView, "setFrame:", 0.0, 0.0, v10, v11);
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    -[UIInputSwitcherSelectionExtraView setFrame:](self->m_selExtraView, "setFrame:", 0.0, 0.0, width, height);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MidX = CGRectGetMidX(v15);
  self->m_pointerOffset = MidX - CGRectGetMidX(self->m_referenceRect);
  -[UIInputSwitcherShadowView setPointerOffset:](self->m_shadowView, "setPointerOffset:");
  -[UIInputSwitcherSelectionExtraView setPointerOffset:](self->m_selExtraView, "setPointerOffset:", self->m_pointerOffset);
}

- (BOOL)isVisible
{
  void *v2;
  BOOL v3;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)performShowAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__UIKeyboardMenuView_performShowAnimation__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v2, 0, 0.0, 0.0);
}

uint64_t __42__UIKeyboardMenuView_performShowAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)setKeyboardDimmed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  double v7;
  id v8;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "deactivateActiveKeysClearingTouchInfo:clearingDimming:", 1, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[UIKeyboardMenuView usesDarkTheme](self, "usesDarkTheme");
    v7 = 0.1;
    if (v6)
      v7 = 0.4;
    objc_msgSend(v8, "setKeyboardDim:amount:withDuration:", v3, v7, 0.3);
  }

}

- (id)inputView
{
  return self->m_inputView;
}

- (id)dimmingView
{
  UIDimmingView *v3;
  UIDimmingView *v4;
  UIDimmingView *m_dimmingView;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  UIDimmingView *v15;

  if (!self->m_dimmingView)
  {
    v3 = [UIDimmingView alloc];
    v4 = -[UIDimmingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    m_dimmingView = self->m_dimmingView;
    self->m_dimmingView = v4;

    -[UIDimmingView setDelegate:](self->m_dimmingView, "setDelegate:", self);
  }
  -[UIKeyboardMenuView containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "frame");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v9 = v13;
    v11 = v14;

  }
  -[UIView setFrame:](self->m_dimmingView, "setFrame:", 0.0, 0.0, v9, v11);
  v15 = self->m_dimmingView;

  return v15;
}

- (void)dimmingViewWasTapped:(id)a3
{
  -[UIKeyboardMenuView hide](self, "hide", a3);
  -[UIKeyboardMenuView returnToKeyboardIfNeeded](self, "returnToKeyboardIfNeeded");
}

- (BOOL)usesDimmingView
{
  return 1;
}

- (BOOL)usesShadowView
{
  return -[UIKeyboardMenuView mode](self, "mode") == 0;
}

- (void)insertSelExtraView
{
  _BOOL4 v3;
  int *v4;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v3 = -[UIKeyboardMenuView usesShadowView](self, "usesShadowView");
    v4 = &OBJC_IVAR___UIKeyboardMenuView_m_table;
    if (v3)
      v4 = &OBJC_IVAR___UIKeyboardMenuView_m_shadowView;
    -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->m_selExtraView, *(Class *)((char *)&self->super.super.super.isa + *v4));
  }
}

- (void)show
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double y;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  _BOOL8 v41;
  double v42;
  double v43;
  CGRect *p_m_referenceRect;
  double x;
  double v46;
  double v47;
  CGFloat v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  UISelectionFeedbackGenerator *m_slideBehavior;
  void *v64;
  void *v65;
  UISelectionFeedbackGenerator *v66;
  UISelectionFeedbackGenerator *v67;
  _QWORD v68[5];
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  if (-[UIKeyboardMenuView shouldShow](self, "shouldShow"))
  {
    -[UITableView reloadData](self->m_table, "reloadData");
    -[UIKeyboardMenuView willShow](self, "willShow");
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __26__UIKeyboardMenuView_show__block_invoke;
    v68[3] = &unk_1E16B1B28;
    v68[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v68);
    -[UIInputSwitcherShadowView setMode:](self->m_shadowView, "setMode:", LODWORD(self->m_mode));
    -[UIView setNeedsDisplay](self->m_shadowView, "setNeedsDisplay");
    -[UIView setNeedsDisplay](self->m_selExtraView, "setNeedsDisplay");
    -[UIKeyboardMenuView containerView](self, "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[UIKeyboardMenuView containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v5, "window");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }

    if ((objc_msgSend(v6, "_isHostedInAnotherProcess") & 1) != 0
      || (objc_msgSend(v6, "windowScene"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "_effectiveSettings"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      v9 = 0;
      v10 = *MEMORY[0x1E0C9D648];
      v11 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      objc_msgSend(v9, "frame");
      v13 = v12;
      v15 = v14;
    }
    v16 = v13;
    v17 = v15;
    if (CGRectIsEmpty(*(CGRect *)&v10))
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v13 = v19;
      v21 = v20;

    }
    else
    {
      v22 = objc_msgSend(v9, "interfaceOrientation");
      if (objc_msgSend((id)UIApp, "_isSpringBoard"))
      {
        v23 = +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
        if ((unint64_t)(v23 - 1) >= 4)
          v22 = 0;
        else
          v22 = v23;
      }
      if ((unint64_t)(v22 - 3) >= 2)
        v21 = v15;
      else
        v21 = v13;
      if ((unint64_t)(v22 - 3) < 2)
        v13 = v15;
    }
    self->m_visibleRows = -[UIKeyboardMenuView numberOfItems](self, "numberOfItems");
    -[UIKeyboardMenuView preferredSize](self, "preferredSize");
    v25 = v24;
    v27 = v26;
    v28 = v21;
    if (!self->m_mode)
      goto LABEL_69;
    v28 = v21;
    if (-[UIKeyboardMenuView usesTable](self, "usesTable"))
    {
      y = self->m_referenceRect.origin.y;
      -[UIKeyboardMenuView containerView](self, "containerView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      v32 = y + v31 + -6.0;
      -[UIKeyboardMenuView containerView](self, "containerView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "window");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "statusBarHeight");
      v37 = v36;

      v28 = v32 - v37;
    }
    if (!self->m_mode)
    {
LABEL_69:
      if (self->m_inputView)
      {
        v38 = self->m_referenceLocation.y;
        -[UIKeyboardMenuView containerView](self, "containerView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "safeAreaInsets");
        v28 = v38 - v40 + -6.0;

      }
    }
    if (v25 > v13 + -10.0)
      v25 = v13 + -10.0;
    self->m_scrollable = v27 > v28;
    self->m_scrolling = 0;
    if (self->m_scrollable)
    {
      if (self->m_mode)
        v41 = 1;
      else
        v41 = self->m_inputView != 0;
    }
    else
    {
      v41 = 0;
    }
    -[UIScrollView setUserInteractionEnabled:](self->m_table, "setUserInteractionEnabled:", v41);
    self->m_startAutoscroll = 0;
    -[UIScrollView setScrollEnabled:](self->m_table, "setScrollEnabled:", self->m_scrollable);
    -[UIScrollView _setAutoscrolling:](self->m_table, "_setAutoscrolling:", self->m_scrollable);
    if (self->m_scrollable)
    {
      self->m_visibleRows = vcvtmd_u64_f64(v28 / 50.0);
      v42 = (double)(unint64_t)floor(v28 / 50.0) * 50.0;
      v27 = v42 + -4.0;
    }
    else
    {
      v42 = v27;
    }
    -[UITableView setFrame:](self->m_table, "setFrame:", 0.0, 0.0, v25, v27);
    -[UIKeyboardMenuView setUsesStraightLeftEdge:](self, "setUsesStraightLeftEdge:", 0);
    if (self->m_mode)
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v43 = 0.0;
      else
        v43 = 20.0;
      p_m_referenceRect = &self->m_referenceRect;
      x = self->m_referenceRect.origin.x;
      if (x < v43)
      {
        -[UIKeyboardMenuView setUsesStraightLeftEdge:](self, "setUsesStraightLeftEdge:", 1);
        x = p_m_referenceRect->origin.x;
      }
      v46 = self->m_referenceRect.origin.y - v42 + -6.0;
      v47 = fmax(x + self->m_referenceRect.size.width * 0.5 - v25 * 0.5, 10.0);
      if (-[UIKeyboardMenuView usesStraightLeftEdge](self, "usesStraightLeftEdge"))
        v47 = p_m_referenceRect->origin.x;
      v69.size.width = self->m_referenceRect.size.width;
      v69.size.height = self->m_referenceRect.size.height;
      v69.origin.x = p_m_referenceRect->origin.x;
      v69.origin.y = self->m_referenceRect.origin.y;
      if (CGRectGetMidX(v69) > 32.0)
      {
        v70.origin.x = p_m_referenceRect->origin.x;
        v70.origin.y = self->m_referenceRect.origin.y;
        v70.size.width = self->m_referenceRect.size.width;
        v70.size.height = self->m_referenceRect.size.height;
        if (v25 + CGRectGetMinX(v70) >= v13)
        {
          v71.origin.x = p_m_referenceRect->origin.x;
          v71.origin.y = self->m_referenceRect.origin.y;
          v71.size.width = self->m_referenceRect.size.width;
          v71.size.height = self->m_referenceRect.size.height;
          v47 = fmax(CGRectGetMidX(v71) - v25 + 14.0 + 8.0, 25.0);
        }
      }
      v72.origin.x = v47;
      v72.origin.y = v46;
      v72.size.width = v25;
      v72.size.height = v42;
      v48 = CGRectGetMinX(v72) + 8.0;
      v73.origin.x = p_m_referenceRect->origin.x;
      v73.origin.y = self->m_referenceRect.origin.y;
      v73.size.width = self->m_referenceRect.size.width;
      v73.size.height = self->m_referenceRect.size.height;
      if (v48 > CGRectGetMinX(v73))
      {
        v74.origin.x = p_m_referenceRect->origin.x;
        v74.origin.y = self->m_referenceRect.origin.y;
        v74.size.width = self->m_referenceRect.size.width;
        v74.size.height = self->m_referenceRect.size.height;
        v47 = CGRectGetMinX(v74) + -8.0;
      }
    }
    else
    {
      -[UIKeyboardMenuView containerView](self, "containerView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "safeAreaInsets");
      v51 = v50;
      v53 = v52;

      if (self->m_inputView)
      {
        v54 = self->m_referenceLocation.x + v25 * -0.5;
        v46 = self->m_referenceLocation.y - v42 + -6.0;
        v47 = v51 + 5.0;
        if (v54 >= v47)
        {
          if (v53 + v25 + v54 + 5.0 <= v13)
            v47 = self->m_referenceLocation.x + v25 * -0.5;
          else
            v47 = v13 - v25 + -5.0 - v53;
        }
      }
      else
      {
        v47 = round(*MEMORY[0x1E0C9D538] + (v13 - v25) * 0.5);
        v46 = round(*(double *)(MEMORY[0x1E0C9D538] + 8) + (v21 - v42) * 0.5);
      }
    }
    -[UIKeyboardMenuView setupBackgroundKeyViewWithSize:](self, "setupBackgroundKeyViewWithSize:", v25, v42);
    -[UIKeyboardMenuView setFrame:](self, "setFrame:", v47, v46, v25, v42);
    if (-[UIKeyboardMenuView usesDimmingView](self, "usesDimmingView"))
    {
      -[UIKeyboardMenuView dimmingView](self, "dimmingView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardMenuView containerView](self, "containerView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addSubview:", v55);

    }
    -[UIKeyboardMenuView containerView](self, "containerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", self);

    if (self->m_scrollable)
      -[UITableView flashScrollIndicators](self->m_table, "flashScrollIndicators");
    v58 = -[UIKeyboardMenuView defaultSelectedIndex](self, "defaultSelectedIndex");
    if (v58 != 0x7FFFFFFFFFFFFFFFLL)
      -[UIKeyboardMenuView highlightRow:](self, "highlightRow:", v58);
    -[UIView removeFromSuperview](self->m_selExtraView, "removeFromSuperview");
    if (self->m_mode == 1)
    {
      -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
      v59 = objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        v60 = (void *)v59;
        -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[UIKeyboardMenuView shouldShowSelectionExtraViewForIndexPath:](self, "shouldShowSelectionExtraViewForIndexPath:", v61);

        if (v62)
          -[UIKeyboardMenuView insertSelExtraView](self, "insertSelExtraView");
      }
    }
    -[UIKeyboardMenuView setNeedsDisplay](self, "setNeedsDisplay");
    -[UIKeyboardMenuView performShowAnimation](self, "performShowAnimation");
    m_slideBehavior = self->m_slideBehavior;
    if (!m_slideBehavior)
    {
      +[_UISelectionFeedbackGeneratorConfiguration defaultConfiguration](_UISelectionFeedbackGeneratorConfiguration, "defaultConfiguration");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("retarget"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = -[UIFeedbackGenerator initWithConfiguration:]([UISelectionFeedbackGenerator alloc], "initWithConfiguration:", v65);
      v67 = self->m_slideBehavior;
      self->m_slideBehavior = v66;

      -[UIFeedbackGenerator activateWithCompletionBlock:](self->m_slideBehavior, "activateWithCompletionBlock:", 0);
      m_slideBehavior = self->m_slideBehavior;
    }
    -[UISelectionFeedbackGenerator selectionChanged](m_slideBehavior, "selectionChanged");
    -[UIKeyboardMenuView didShow](self, "didShow");

  }
}

void __26__UIKeyboardMenuView_show__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissCurrentMenu");

}

- (void)setupBackgroundKeyViewWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double x;
  double y;
  double v16;
  double v17;
  UIKBKeyView *m_backgroundKeyView;
  void *v19;
  int v20;
  BOOL v21;
  UIKBTree *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIKBKeyViewAnimator *v27;
  id v28;
  UIKBKeyView *v29;
  UIKBKeyView *v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a3.height;
  width = a3.width;
  if (-[UIKeyboardMenuView mode](self, "mode"))
  {
    -[UIKBKeyView removeFromSuperview](self->m_backgroundKeyView, "removeFromSuperview");
    return;
  }
  if (!setupBackgroundKeyViewWithSize____keyplane)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    UIKeyboardGetKBStarName(CFSTR("en_US"), v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardGetKBStarKeyboardWithName(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subtrees");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)setupBackgroundKeyViewWithSize____keyplane;
    setupBackgroundKeyViewWithSize____keyplane = v11;

    if (objc_msgSend(v7, "idiom") == 1)
      v13 = 102;
    else
      v13 = 1;
    objc_msgSend((id)setupBackgroundKeyViewWithSize____keyplane, "setVisualStyle:", v13);

  }
  -[UIKeyboardMenuView _renderConfig](self, "_renderConfig");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v32.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectInset(v32, -2.0, -1.0);
  x = v33.origin.x;
  y = v33.origin.y;
  v16 = v33.size.width;
  v17 = v33.size.height;
  m_backgroundKeyView = self->m_backgroundKeyView;
  if (!m_backgroundKeyView)
    goto LABEL_12;
  -[UIKBKeyView renderConfig](m_backgroundKeyView, "renderConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "lightKeyboard");
  if (v20 != objc_msgSend(v31, "lightKeyboard"))
  {

LABEL_12:
    v22 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 8);
    +[UIKBShape shape](UIKBShape, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree setShape:](v22, "setShape:", v23);

    -[UIKBTree setPaddedFrame:](v22, "setPaddedFrame:", x, y, v16, v17);
    -[UIKBTree setState:](v22, "setState:", 16);
    -[UIKBTree setDisplayTypeHint:](v22, "setDisplayTypeHint:", 12);
    -[UIKBTree setInteractionType:](v22, "setInteractionType:", 9);
    +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIsFloating:", +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"));
    +[UIKBRenderFactory factoryForVisualStyle:renderingContext:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:", objc_msgSend((id)setupBackgroundKeyViewWithSize____keyplane, "visualStyling"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "traitsForKey:onKeyplane:", v22, setupBackgroundKeyViewWithSize____keyplane);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(UIKBKeyViewAnimator);
    v28 = objc_alloc(-[UIKBKeyViewAnimator keyViewClassForKey:renderTraits:screenTraits:](v27, "keyViewClassForKey:renderTraits:screenTraits:", v22, v26, 0));
    v29 = (UIKBKeyView *)objc_msgSend(v28, "initWithFrame:keyplane:key:", setupBackgroundKeyViewWithSize____keyplane, v22, x, y, v16, v17);
    -[UIKBKeyView setDrawFrame:](v29, "setDrawFrame:", x, y, v16, v17);
    -[UIKBKeyView removeFromSuperview](self->m_backgroundKeyView, "removeFromSuperview");
    v30 = self->m_backgroundKeyView;
    self->m_backgroundKeyView = v29;

    goto LABEL_13;
  }
  -[UIView frame](self->m_backgroundKeyView, "frame");
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = v16;
  v35.size.height = v17;
  v21 = CGRectEqualToRect(v34, v35);

  if (!v21)
    goto LABEL_12;
LABEL_13:
  -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->m_backgroundKeyView, 0);
  -[UIKBKeyView setRenderConfig:](self->m_backgroundKeyView, "setRenderConfig:", v31);
  -[UIKBKeyView prepareForDisplay](self->m_backgroundKeyView, "prepareForDisplay");
  -[UIView setNeedsDisplay](self->m_backgroundKeyView, "setNeedsDisplay");

}

- (void)setupShadowViewWithSize:(CGSize)a3
{
  double height;
  double width;
  UIInputSwitcherShadowView *m_shadowView;
  UIInputSwitcherShadowView *v7;
  UIInputSwitcherShadowView *v8;
  UIInputSwitcherShadowView *v9;

  height = a3.height;
  width = a3.width;
  if (-[UIKeyboardMenuView usesShadowView](self, "usesShadowView"))
  {
    m_shadowView = self->m_shadowView;
    if (m_shadowView)
    {
      -[UIView removeFromSuperview](m_shadowView, "removeFromSuperview");
      v7 = self->m_shadowView;
      self->m_shadowView = 0;

    }
    v8 = -[UIInputSwitcherShadowView initWithFrame:]([UIInputSwitcherShadowView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    v9 = self->m_shadowView;
    self->m_shadowView = v8;

    -[UIInputSwitcherShadowView setMode:](self->m_shadowView, "setMode:", LODWORD(self->m_mode));
    -[UIInputSwitcherShadowView setKeyRect:](self->m_shadowView, "setKeyRect:", self->m_referenceRect.origin.x, self->m_referenceRect.origin.y, self->m_referenceRect.size.width, self->m_referenceRect.size.height);
    -[UIInputSwitcherShadowView setMenu:](self->m_shadowView, "setMenu:", self);
    -[UIView insertSubview:atIndex:](self->m_table, "insertSubview:atIndex:", self->m_shadowView, 0);
    -[UIView setNeedsDisplay](self->m_shadowView, "setNeedsDisplay");
  }
}

- (id)_renderConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "_inheritedRenderConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_inheritedRenderConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)showAsHUDFromLocation:(CGPoint)a3 withInputView:(id)a4 touchBegan:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  CGSize v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  y = a3.y;
  x = a3.x;
  v10 = a4;
  if (self->m_timeDismissed <= a5)
  {
    v15 = v10;
    self->m_referenceLocation.x = x;
    self->m_referenceLocation.y = y;
    objc_storeStrong((id *)&self->m_inputView, a4);
    self->m_mode = 0;
    v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->m_referenceRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->m_referenceRect.size = v11;
    if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
    {
      -[UIKeyboardMenuView layout](self, "layout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deactivateActiveKeys");

    }
    -[UIKeyboardMenuView _renderConfig](self, "_renderConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMenuView setRenderConfig:](self, "setRenderConfig:", v13);

    -[UIKeyboardMenuView containerView](self, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v15;
    if (v14)
    {
      -[UIKeyboardMenuView show](self, "show");
      v10 = v15;
    }
  }

}

- (void)showAsHUD
{
  -[UIKeyboardMenuView showAsHUDFromLocation:withInputView:touchBegan:](self, "showAsHUDFromLocation:withInputView:touchBegan:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), self->m_timeDismissed);
}

- (id)containerView
{
  void *v3;
  void *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->m_inputView, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = self->m_inputView;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "inputViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputView");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();

    }
  }

  -[UIView window](v5, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v3, "containerView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  -[UIView window](v5, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && !-[UIView isDescendantOfView:](v5, "isDescendantOfView:", v14))
  {
    v17 = 0;
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isDictationPopoverPresented") ^ 1;

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEmojiPopoverPresented") & 1) != 0)
  {
    objc_msgSend(v18, "emojiPopoverController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((v17 & 1) != 0)
    {
      v22 = v14;
    }
    else
    {
      -[UIView window](v5, "window");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v22;
  }

  return v21;
}

- (id)maskForShadowViewBlurredBackground
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double i;
  void *v19;
  CGRect v21;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  -[UIScrollView contentSize](self->m_table, "contentSize");
  v7 = v6;
  v9 = v8;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v8, v5);
  +[UIColor blackColor](UIColor, "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");

  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v7, v9, 8.0, 8.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fill");

  +[UIColor clearColor](UIColor, "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set");

  -[UITableView visibleCells](self->m_table, "visibleCells");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    if (v5 <= 1.0)
      v14 = 1.0;
    else
      v14 = 0.5;
    objc_msgSend(v13, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;

    for (i = v17 - v14; i < v9; i = v17 + i)
    {
      v21.origin.x = 0.0;
      v21.origin.y = i;
      v21.size.width = v7;
      v21.size.height = v14;
      UIRectFillUsingBlendMode(v21, kCGBlendModeCopy);
    }
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (double)minYOfLastTableCellForSelectionExtraView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MinY;
  CGRect v16;

  -[UITableView visibleCells](self->m_table, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v5, "convertRect:toView:", self->m_selExtraView);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  MinY = CGRectGetMinY(v16);

  return MinY;
}

- (unint64_t)_internationalKeyRoundedCornerInLayout:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v4 = -1;
  }
  else
  {
    objc_msgSend(v3, "keyboardName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("Emoji"));

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v4 = -1;
    else
      v4 = 0;
  }

  return v4;
}

- (void)showAsPopupForKey:(id)a3 inLayout:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "paddedFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  self->m_mode = 1;
  -[UIKeyboardMenuView containerView](self, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:toView:", v16, v9, v11, v13, v15);
  self->m_referenceRect.origin.x = v17;
  self->m_referenceRect.origin.y = v18;
  self->m_referenceRect.size.width = v19;
  self->m_referenceRect.size.height = v20;

  -[UIInputSwitcherSelectionExtraView setRoundedCorners:](self->m_selExtraView, "setRoundedCorners:", -[UIKeyboardMenuView _internationalKeyRoundedCornerInLayout:](self, "_internationalKeyRoundedCornerInLayout:", v6));
  -[UIInputSwitcherSelectionExtraView setKeyRect:](self->m_selExtraView, "setKeyRect:", self->m_referenceRect.origin.x, self->m_referenceRect.origin.y, self->m_referenceRect.size.width, self->m_referenceRect.size.height);
  -[UIKeyboardMenuView setReferenceKey:](self, "setReferenceKey:", v7);

  -[UIKeyboardMenuView setLayout:](self, "setLayout:", v6);
  -[UIKeyboardMenuView show](self, "show");
  -[UIKeyboardMenuView layout](self, "layout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardMenuView referenceKey](self, "referenceKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setState:forKey:", 16, v22);

  -[UIKeyboardMenuView layout](self, "layout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentKeyplaneView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardMenuView referenceKey](self, "referenceKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "viewForKey:", v25);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView superview](self, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  objc_msgSend(v38, "superview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "convertRect:fromView:", v35, v28, v30, v32, v34);
  objc_msgSend(v38, "setFrame:");

  -[UIView superview](self, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v38);

  -[UIView superview](self, "superview");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self, "frame");
  objc_msgSend(v37, "convertRect:toView:", v38);
  -[UIKeyboardMenuView setFrame:](self, "setFrame:");

  objc_msgSend(v38, "setUserInteractionEnabled:", 1);
  objc_msgSend(v38, "addSubview:", self);

}

- (void)_delayedFade
{
  void *v3;
  _BOOL4 m_shouldFade;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  _QWORD v14[5];
  _QWORD v15[5];

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[UIKeyboardMenuView setKeyboardDimmed:](self, "setKeyboardDimmed:", 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (m_shouldFade = self->m_shouldFade, v3, m_shouldFade))
  {
    -[UIKeyboardMenuView layout](self, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentKeyplaneView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMenuView referenceKey](self, "referenceKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardMenuView layout](self, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMenuView referenceKey](self, "referenceKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:forKey:", 2, v10);

    -[UIView superview](self, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v8)
    {
      -[UIKeyboardMenuView clear](self, "clear");
    }
    else
    {
      v12 = -[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher");
      v13 = 0.5;
      if (v12)
        v13 = 0.25;
      v14[4] = self;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __34__UIKeyboardMenuView__delayedFade__block_invoke;
      v15[3] = &unk_1E16B1B28;
      v15[4] = self;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __34__UIKeyboardMenuView__delayedFade__block_invoke_2;
      v14[3] = &unk_1E16B3FD8;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v15, v14, v13, 0.0);
    }

  }
  else
  {
    self->m_shouldFade = 1;
  }
}

uint64_t __34__UIKeyboardMenuView__delayedFade__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __34__UIKeyboardMenuView__delayedFade__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  return result;
}

- (void)fade
{
  if (self->m_mode)
    -[UIKeyboardMenuView fadeWithDelay:forSelectionAtIndex:](self, "fadeWithDelay:forSelectionAtIndex:", 0x7FFFFFFFFFFFFFFFLL, 1.0);
}

- (void)fadeWithDelay:(double)a3
{
  -[UIKeyboardMenuView fadeWithDelay:forSelectionAtIndex:](self, "fadeWithDelay:forSelectionAtIndex:", 0x7FFFFFFFFFFFFFFFLL, a3);
}

- (void)fadeWithDelay:(double)a3 forSelectionAtIndex:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  -[UIKeyboardMenuView willFadeForSelectionAtIndex:](self, "willFadeForSelectionAtIndex:", a4);
  if (self->m_mode || self->m_inputView)
  {
    -[UIView superview](self, "superview");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[UIKeyboardMenuView referenceKey](self, "referenceKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "state");

      if (v9 == 16)
      {
        -[UIKeyboardMenuView layout](self, "layout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentKeyplaneView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardMenuView referenceKey](self, "referenceKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "viewForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[UIView frame](self, "frame");
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;
          -[UIView superview](self, "superview");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "convertRect:fromView:", v22, v15, v17, v19, v21);
          -[UIKeyboardMenuView setFrame:](self, "setFrame:");

          objc_msgSend(v13, "addSubview:", self);
        }

      }
    }
    -[UIKeyboardMenuView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedFade, 0, a3);
  }
}

- (void)clear
{
  void *v3;
  UIView *m_inputView;
  UISelectionFeedbackGenerator *m_slideBehavior;

  -[UIKeyboardMenuView dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  m_inputView = self->m_inputView;
  self->m_inputView = 0;

  self->m_mode = 0;
  self->m_timeDismissed = (double)(unint64_t)GSCurrentEventTimestamp() / 1000000000.0;
  -[UIKeyboardMenuView stopAnyAutoscrolling](self, "stopAnyAutoscrolling");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[UIFeedbackGenerator deactivate](self->m_slideBehavior, "deactivate");
  m_slideBehavior = self->m_slideBehavior;
  self->m_slideBehavior = 0;

}

- (BOOL)launchedFromKeyboard
{
  _BOOL4 v3;

  v3 = -[UIKeyboardMenuView isVisible](self, "isVisible");
  if (v3)
    LOBYTE(v3) = self->m_mode == 1 || self->m_inputView != 0;
  return v3;
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UIKeyboardMenuView clear](self, "clear");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardMenuView;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)hide
{
  void *v3;
  void *v4;

  if (self->m_mode || self->m_inputView)
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      -[UIKeyboardMenuView setKeyboardDimmed:](self, "setKeyboardDimmed:", 0);
    -[UIKeyboardMenuView layout](self, "layout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMenuView referenceKey](self, "referenceKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setState:forKey:", 2, v4);

    -[UIView setAlpha:](self, "setAlpha:", 0.0);
    self->m_shouldFade = 1;
    -[UIKeyboardMenuView removeFromSuperview](self, "removeFromSuperview");
  }
}

- (void)setNeedsDisplayForCell:(id)a3
{
  id v3;

  objc_msgSend(a3, "backgroundView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (void)setNeedsDisplayForTopBottomCells
{
  void *v3;
  void *v4;
  id v5;

  -[UITableView visibleCells](self->m_table, "visibleCells");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMenuView setNeedsDisplayForCell:](self, "setNeedsDisplayForCell:", v3);

    objc_msgSend(v5, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMenuView setNeedsDisplayForCell:](self, "setNeedsDisplayForCell:", v4);

  }
}

- (void)setNeedsDisplay
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[UITableView visibleCells](self->m_table, "visibleCells");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          -[UIKeyboardMenuView setNeedsDisplayForCell:](self, "setNeedsDisplayForCell:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardMenuView;
  -[UIView setNeedsDisplay](&v9, sel_setNeedsDisplay);
}

- (void)endScrolling:(id)a3
{
  if (self->m_scrolling)
  {
    -[UIKeyboardMenuView setNeedsDisplayForTopBottomCells](self, "setNeedsDisplayForTopBottomCells", a3);
    self->m_scrolling = 0;
    -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:", self->m_point.x, self->m_point.y);
  }
}

- (void)stopAnyAutoscrolling
{
  NSTimer *m_scrollTimer;
  NSTimer *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;

  m_scrollTimer = self->m_scrollTimer;
  if (m_scrollTimer)
  {
    -[NSTimer invalidate](m_scrollTimer, "invalidate");
    v4 = self->m_scrollTimer;
    self->m_scrollTimer = 0;

    self->m_scrolling = 1;
    if (self->m_scrollDirection == 8)
      v5 = 3;
    else
      v5 = 1;
    -[UITableView scrollToNearestSelectedRowAtScrollPosition:animated:](self->m_table, "scrollToNearestSelectedRowAtScrollPosition:animated:", v5, 1);
    if (self->m_scrollDirection == 8 && self->m_mode == 1)
    {
      -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIKeyboardMenuView shouldShowSelectionExtraViewForIndexPath:](self, "shouldShowSelectionExtraViewForIndexPath:", v6);

      if (v7)
        -[UIKeyboardMenuView insertSelExtraView](self, "insertSelExtraView");
    }
    -[UIKeyboardMenuView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_endScrolling_, 0, 0.3);
  }
}

- (void)autoscrollTimerFired:(id)a3
{
  CFAbsoluteTime Current;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  UIInputSwitcherTableView *m_table;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  id v30;

  Current = CFAbsoluteTimeGetCurrent();
  v5 = Current - self->m_scrollStartTime + Current - self->m_scrollStartTime;
  if (v5 >= 1.0)
    v6 = 40.0;
  else
    v6 = v5 * v5 * 40.0;
  if (v6 <= 0.0)
    goto LABEL_12;
  v7 = v6 * 1.1;
  -[UIScrollView _contentOffsetAnimationDuration](self->m_table, "_contentOffsetAnimationDuration");
  v9 = v8;
  -[UIScrollView contentOffset](self->m_table, "contentOffset");
  v11 = v10;
  v13 = v12;
  -[UIScrollView contentSize](self->m_table, "contentSize");
  v15 = v14;
  v16 = -(v6 * 1.1);
  v17 = self->m_scrollDirection == 8 ? v6 * 1.1 : -(v6 * 1.1);
  v18 = v13 + v17;
  if (v13 + v17 <= v16 || (-[UIView frame](self->m_table, "frame"), v18 >= v7 + v15 - v19))
  {
LABEL_12:
    -[UIKeyboardMenuView stopAnyAutoscrolling](self, "stopAnyAutoscrolling");
  }
  else
  {
    if (self->m_scrollDirection == 8)
    {
      -[UIView frame](self->m_table, "frame");
      v21 = v20 + -16.6666667;
    }
    else
    {
      v21 = 16.6666667;
    }
    v22 = v13 + v21;
    -[UIView removeFromSuperview](self->m_selExtraView, "removeFromSuperview");
    -[UITableView indexPathForRowAtPoint:](self->m_table, "indexPathForRowAtPoint:", v11, v22);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isEqual:", v23) & 1) == 0)
    {
      m_table = self->m_table;
      -[UITableView indexPathForSelectedRow](m_table, "indexPathForSelectedRow");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputSwitcherTableView deselectRowAtIndexPath:animated:](m_table, "deselectRowAtIndexPath:animated:", v25, 1);

      -[UIInputSwitcherTableView selectRowAtIndexPath:animated:scrollPosition:](self->m_table, "selectRowAtIndexPath:animated:scrollPosition:", v30, 0, 0);
      -[UITableView cellForRowAtIndexPath:](self->m_table, "cellForRowAtIndexPath:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardMenuView setNeedsDisplayForCell:](self, "setNeedsDisplayForCell:", v26);

      -[UIKeyboardMenuView setNeedsDisplayForTopBottomCells](self, "setNeedsDisplayForTopBottomCells");
    }
    v27 = 0.0;
    if (v18 >= 0.0)
    {
      -[UIView frame](self->m_table, "frame");
      v27 = v18;
      if (v18 > v15 - v28)
      {
        -[UIView frame](self->m_table, "frame");
        v27 = v15 - v29;
      }
    }
    -[UIScrollView _setContentOffsetAnimationDuration:](self->m_table, "_setContentOffsetAnimationDuration:", 0.11);
    -[UIScrollView _setContentOffset:animated:animationCurve:](self->m_table, "_setContentOffset:animated:animationCurve:", 1, 3, v11, v27);
    -[UIScrollView _setContentOffsetAnimationDuration:](self->m_table, "_setContentOffsetAnimationDuration:", v9);

  }
}

- (id)indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGPoint v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UITableView visibleCells](self->m_table, "visibleCells", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "frame");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        objc_msgSend(v11, "interactiveInsets");
        v21 = v15 + v20;
        v24 = v17 - (v22 + v23);
        v35.size.height = v19 - (v20 + v25);
        v35.origin.x = v13 + v22;
        v35.origin.y = v21;
        v35.size.width = v24;
        v34.x = x;
        v34.y = y;
        if (CGRectContainsPoint(v35, v34))
        {
          -[UITableView indexPathForCell:](self->m_table, "indexPathForCell:", v11);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v8)
        continue;
      break;
    }
  }
  v26 = 0;
LABEL_11:

  return v26;
}

- (CGRect)interactiveBounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  v38 = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[UITableView visibleCells](self->m_table, "visibleCells", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v16, "frame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v16, "interactiveInsets");
        v42.origin.x = v18 + v25;
        v42.origin.y = v20 + v26;
        v42.size.width = v22 - (v25 + v27);
        v42.size.height = v24 - (v26 + v28);
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        v40 = CGRectUnion(v39, v42);
        x = v40.origin.x;
        y = v40.origin.y;
        width = v40.size.width;
        height = v40.size.height;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }

  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  UIInputSwitcherTableView *m_table;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  int v16;
  NSTimer *v17;
  NSTimer *m_scrollTimer;
  uint64_t v19;
  UIInputSwitcherTableView *v20;
  void *v21;
  uint64_t v22;
  id v23;
  CGPoint v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  m_table = self->m_table;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", m_table);
  -[UITableView indexPathForRowAtPoint:](m_table, "indexPathForRowAtPoint:");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->m_scrollable)
    goto LABEL_13;
  if (v23)
  {
    -[UITableView visibleCells](self->m_table, "visibleCells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView cellForRowAtIndexPath:](self->m_table, "cellForRowAtIndexPath:", v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if ((v10 & 1) != 0)
    {
      self->m_startAutoscroll = 1;
      goto LABEL_7;
    }

  }
  v23 = 0;
LABEL_7:
  self->m_point.x = x;
  self->m_point.y = y;
  if (self->m_startAutoscroll && x >= 0.0)
  {
    -[UIView frame](self->m_table, "frame");
    if (x <= v11)
    {
      if (y <= 25.0 || (-[UIView frame](self->m_table, "frame"), y >= v12 + -12.5))
      {
        if (y > 50.0)
          v16 = 8;
        else
          v16 = 4;
        self->m_scrollDirection = v16;
        if (!self->m_scrollTimer)
        {
          self->m_scrollStartTime = CFAbsoluteTimeGetCurrent();
          objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_autoscrollTimerFired_, 0, 1, 0.1);
          v17 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          m_scrollTimer = self->m_scrollTimer;
          self->m_scrollTimer = v17;

        }
        goto LABEL_35;
      }
    }
  }
  -[UIKeyboardMenuView stopAnyAutoscrolling](self, "stopAnyAutoscrolling");
  if (self->m_scrolling)
    goto LABEL_35;
LABEL_13:
  if (v23)
  {
    if (-[UIKeyboardMenuView shouldSelectItemAtIndex:](self, "shouldSelectItemAtIndex:", objc_msgSend(v23, "row")))
    {
      v13 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[UIKeyboardMenuView defaultSelectedIndex](self, "defaultSelectedIndex"), 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
  }
  else
  {
    self->m_shouldFade = 1;
    -[UIView bounds](self, "bounds");
    v25.size.height = v14 + 16.6666667;
    v24.x = x;
    v24.y = y;
    if (CGRectContainsPoint(v25, v24))
    {
      v23 = 0;
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[UIKeyboardMenuView defaultSelectedIndex](self, "defaultSelectedIndex"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v13;
  if (!v7 || (v19 = objc_msgSend(v13, "row"), v19 != objc_msgSend(v7, "row")))
  {
    v20 = self->m_table;
    -[UITableView indexPathForSelectedRow](v20, "indexPathForSelectedRow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputSwitcherTableView deselectRowAtIndexPath:animated:](v20, "deselectRowAtIndexPath:animated:", v21, 1);

    if (objc_msgSend(v23, "row") != 0x7FFFFFFFFFFFFFFFLL)
      -[UIInputSwitcherTableView selectRowAtIndexPath:animated:scrollPosition:](self->m_table, "selectRowAtIndexPath:animated:scrollPosition:", v23, 0, 0);
    -[UIView removeFromSuperview](self->m_selExtraView, "removeFromSuperview");
    if (self->m_mode == 1
      && -[UIKeyboardMenuView shouldShowSelectionExtraViewForIndexPath:](self, "shouldShowSelectionExtraViewForIndexPath:", v23))
    {
      -[UIKeyboardMenuView insertSelExtraView](self, "insertSelExtraView");
    }
    -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[UISelectionFeedbackGenerator selectionChanged](self->m_slideBehavior, "selectionChanged");
      v7 = (void *)v22;
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_35:

}

- (void)highlightRow:(unint64_t)a3
{
  _BOOL4 v4;
  UIInputSwitcherTableView *m_table;
  void *v6;
  int64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher");
  m_table = self->m_table;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadSections:withRowAnimation:](m_table, "reloadSections:withRowAnimation:", v6, 5);

    v7 = -[UIKeyboardMenuView indexForSelectedFastSwitchMode](self, "indexForSelectedFastSwitchMode");
    v8 = v7 > -[UIKeyboardMenuView indexForUnselectedFastSwitchMode](self, "indexForUnselectedFastSwitchMode");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    -[UIInputSwitcherTableView selectRowAtIndexPath:animated:scrollPosition:](self->m_table, "selectRowAtIndexPath:animated:scrollPosition:", v9, 0, 3);
    v12 = (id)v9;
  }
  else
  {
    -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputSwitcherTableView deselectRowAtIndexPath:animated:](m_table, "deselectRowAtIndexPath:animated:", v10, 1);

    if (self->m_mode == 1)
    {
      v11 = 3;
    }
    else if (self->m_inputView)
    {
      v11 = 3;
    }
    else
    {
      v11 = 2;
    }
    -[UIInputSwitcherTableView selectRowAtIndexPath:animated:scrollPosition:](self->m_table, "selectRowAtIndexPath:animated:scrollPosition:", v12, 0, v11);
  }
  if (!self->m_mode)
  {
    -[UIScrollView contentOffset](self->m_table, "contentOffset");
    -[UITableView setContentOffset:](self->m_table, "setContentOffset:");
  }
  -[UIView removeFromSuperview](self->m_selExtraView, "removeFromSuperview");
  if (self->m_mode == 1
    && -[UIKeyboardMenuView shouldShowSelectionExtraViewForIndexPath:](self, "shouldShowSelectionExtraViewForIndexPath:", v12))
  {
    -[UIKeyboardMenuView insertSelExtraView](self, "insertSelExtraView");
  }
  -[UIView setNeedsDisplay](self->m_table, "setNeedsDisplay");

}

- (BOOL)shouldShowSelectionExtraViewForIndexPath:(id)a3
{
  UIInputSwitcherTableView *m_table;
  id v4;
  void *v5;
  id v6;

  m_table = self->m_table;
  v4 = a3;
  -[UITableView indexPathsForVisibleRows](m_table, "indexPathsForVisibleRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v4;
}

- (void)selectItemAtPoint:(CGPoint)a3
{
  void *v4;
  id v5;

  self->m_shouldFade = 1;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->m_table, a3.x, a3.y);
  -[UIKeyboardMenuView indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:](self, "indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    -[UIKeyboardMenuView didSelectItemAtIndex:](self, "didSelectItemAtIndex:", objc_msgSend(v4, "row"));
  else
    -[UIKeyboardMenuView fade](self, "fade");

}

- (void)setHighlightForRowAtIndexPath:(id)a3 highlight:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[UITableView cellForRowAtIndexPath:](self->m_table, "cellForRowAtIndexPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    -[UIView removeFromSuperview](self->m_selExtraView, "removeFromSuperview");
    if (self->m_mode == 1)
    {
      -[UITableView indexPathsForVisibleRows](self->m_table, "indexPathsForVisibleRows");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v18)
        -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->m_selExtraView, self->m_shadowView);
    }
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    +[UIColor blackColor](UIColor, "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

  }
  objc_msgSend(v6, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsDisplay");

}

- (void)customizeCell:(id)a3 forItemAtIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
  {
    v8 = -[UIKeyboardMenuView indexForSelectedFastSwitchMode](self, "indexForSelectedFastSwitchMode");
    v9 = -[UIKeyboardMenuView indexForUnselectedFastSwitchMode](self, "indexForUnselectedFastSwitchMode");
    if (a4 == 1)
    {
      if (v8 < v9)
      {
LABEL_5:
        v10 = -[UIKeyboardMenuView indexForUnselectedFastSwitchMode](self, "indexForUnselectedFastSwitchMode");
LABEL_8:
        v7 = v10;
        goto LABEL_9;
      }
    }
    else
    {
      v7 = a4;
      if (a4)
        goto LABEL_9;
      if (v8 >= v9)
        goto LABEL_5;
    }
    v10 = -[UIKeyboardMenuView indexForSelectedFastSwitchMode](self, "indexForSelectedFastSwitchMode");
    goto LABEL_8;
  }
LABEL_9:
  +[UIColor clearColor](UIColor, "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v11);

  objc_msgSend(v6, "setSelectionFadeDuration:", 0.0);
  objc_msgSend(v6, "setSelectionStyle:", 0);
  objc_msgSend(v6, "setFirst:", a4 == 0);
  objc_msgSend(v6, "setLast:", -[UIKeyboardMenuView numberOfItems](self, "numberOfItems") - 1 == a4);
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
  {
    objc_msgSend(v6, "setFirst:", a4 == 0);
    objc_msgSend(v6, "setLast:", a4 == 1);
  }
  objc_msgSend(v6, "setUsesDarkTheme:", -[UIKeyboardMenuView usesDarkTheme](self, "usesDarkTheme"));
  objc_msgSend(v6, "setUsesStraightLeftEdge:", -[UIKeyboardMenuView usesStraightLeftEdge](self, "usesStraightLeftEdge"));
  objc_msgSend(v6, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAlignment:", 1);
  -[UIKeyboardMenuView localizedTitleForItemAtIndex:](self, "localizedTitleForItemAtIndex:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  if (-[UIKeyboardMenuView usesDeviceLanguageForItemAtIndex:](self, "usesDeviceLanguageForItemAtIndex:", v7))
  {
    objc_msgSend(v12, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v12, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *MEMORY[0x1E0CA8590];
      objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v18);
      objc_msgSend(v12, "setAttributedText:", v19);

    }
  }
  if (-[UIKeyboardMenuView usesDarkTheme](self, "usesDarkTheme"))
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v20);

  objc_msgSend(v12, "textColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlightedTextColor:", v21);

  -[UIKeyboardMenuView fontForItemAtIndex:](self, "fontForItemAtIndex:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v22);

  -[UIKeyboardMenuView subtitleForItemAtIndex:](self, "subtitleForItemAtIndex:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {
    objc_msgSend(v6, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextAlignment:", 1);
    if (-[UIKeyboardMenuView usesDarkTheme](self, "usesDarkTheme"))
      +[UIColor whiteColor](UIColor, "whiteColor");
    else
      +[UIColor blackColor](UIColor, "blackColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v25);

    objc_msgSend(v24, "textColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHighlightedTextColor:", v26);

    -[UIKeyboardMenuView subtitleFontForItemAtIndex:](self, "subtitleFontForItemAtIndex:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v27);

  }
  objc_msgSend(v6, "_detailTextLabel:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", v23);

  v29 = -[UIKeyboardMenuView usesDeviceLanguageForItemAtIndex:](self, "usesDeviceLanguageForItemAtIndex:", v7);
  if (v23 && v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB3498]);
    v36 = *MEMORY[0x1E0CA8590];
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithString:attributes:", v23, v32);
    objc_msgSend(v6, "_detailTextLabel:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAttributedText:", v33);

  }
  if (!self->m_mode)
  {
    objc_msgSend(v6, "textLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setShadowColor:", 0);

  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  +[UIInputSwitcherTableCell reuseIdentifier](UIInputSwitcherTableCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "row");
  -[UIKeyboardMenuView customizeCell:forItemAtIndex:](self, "customizeCell:forItemAtIndex:", v9, v10);
  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("UIInputSwitcherSegmentedTableCell"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      NSLog(CFSTR("got it!"));
    -[UIKeyboardMenuView setHighlightForRowAtIndexPath:highlight:](self, "setHighlightForRowAtIndexPath:highlight:", v7, 0);
    v8 = v7;

  }
  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKeyboardMenuView setHighlightForRowAtIndexPath:highlight:](self, "setHighlightForRowAtIndexPath:highlight:", v5, 1);
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardMenuView setHighlightForRowAtIndexPath:highlight:](self, "setHighlightForRowAtIndexPath:highlight:", v4, 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a4;
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
    v5 = 0;
  else
    v5 = objc_msgSend(v6, "row");
  -[UIKeyboardMenuView didSelectItemAtIndex:](self, "didSelectItemAtIndex:", v5);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  self->m_shouldFade = 0;
  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:");

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;

  self->m_shouldFade = 0;
  objc_msgSend(a3, "anyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:");

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;

  self->m_shouldFade = 1;
  objc_msgSend(a3, "anyObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", self);
  -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:");
  -[UITableView indexPathForSelectedRow](self->m_table, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v6, "locationInView:", self);
    -[UIKeyboardMenuView selectItemAtPoint:](self, "selectItemAtPoint:");
  }
  else
  {
    -[UIKeyboardMenuView fadeWithDelay:](self, "fadeWithDelay:", 0.1);
  }

}

- (void)setRenderConfig:(id)a3
{
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = -[UIKeyboardMenuView usesDarkTheme](self, "usesDarkTheme");
  v5 = v4 == objc_msgSend(v12, "whiteText");
  v6 = v12;
  if (!v5)
  {
    -[UIKeyboardMenuView setUsesDarkTheme:](self, "setUsesDarkTheme:", objc_msgSend(v12, "whiteText"));
    -[UITableView reloadData](self->m_table, "reloadData");
    -[UIKBKeyView renderConfig](self->m_backgroundKeyView, "renderConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "lightKeyboard");
    v9 = objc_msgSend(v12, "lightKeyboard");

    if (v8 != v9)
    {
      -[UIView frame](self, "frame");
      -[UIKeyboardMenuView setupBackgroundKeyViewWithSize:](self, "setupBackgroundKeyViewWithSize:", v10, v11);
    }
    -[UIKeyboardMenuView setNeedsDisplay](self, "setNeedsDisplay");
    v6 = v12;
  }

}

- (CGRect)popupRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->m_table, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldShow
{
  return 1;
}

- (void)willShow
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", 0x1E174CBC0, 0);

}

- (unint64_t)numberOfItems
{
  return 0;
}

- (unint64_t)defaultSelectedIndex
{
  return 0;
}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldSelectItemAtIndex:(unint64_t)a3
{
  return 1;
}

- (id)titleForItemAtIndex:(unint64_t)a3
{
  return &stru_1E16EDF20;
}

- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)subtitleForItemAtIndex:(unint64_t)a3
{
  return &stru_1E16EDF20;
}

- (int64_t)mode
{
  return self->m_mode;
}

- (void)setMode:(int64_t)a3
{
  self->m_mode = a3;
}

- (BOOL)usesStraightLeftEdge
{
  return self->_usesStraightLeftEdge;
}

- (void)setUsesStraightLeftEdge:(BOOL)a3
{
  self->_usesStraightLeftEdge = a3;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (BOOL)showingCapsLockSwitcher
{
  return self->_showingCapsLockSwitcher;
}

- (void)setShowingCapsLockSwitcher:(BOOL)a3
{
  self->_showingCapsLockSwitcher = a3;
}

- (int64_t)indexForSelectedFastSwitchMode
{
  return self->_indexForSelectedFastSwitchMode;
}

- (void)setIndexForSelectedFastSwitchMode:(int64_t)a3
{
  self->_indexForSelectedFastSwitchMode = a3;
}

- (int64_t)indexForUnselectedFastSwitchMode
{
  return self->_indexForUnselectedFastSwitchMode;
}

- (void)setIndexForUnselectedFastSwitchMode:(int64_t)a3
{
  self->_indexForUnselectedFastSwitchMode = a3;
}

- (UIKBTree)referenceKey
{
  return self->_referenceKey;
}

- (void)setReferenceKey:(id)a3
{
  self->_referenceKey = (UIKBTree *)a3;
}

- (UIKeyboardLayoutStar)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  self->_layout = (UIKeyboardLayoutStar *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_slideBehavior, 0);
  objc_storeStrong((id *)&self->m_backgroundKeyView, 0);
  objc_storeStrong((id *)&self->m_inputView, 0);
  objc_storeStrong((id *)&self->m_dimmingView, 0);
  objc_storeStrong((id *)&self->m_scrollTimer, 0);
  objc_storeStrong((id *)&self->m_selExtraView, 0);
  objc_storeStrong((id *)&self->m_shadowView, 0);
  objc_storeStrong((id *)&self->m_table, 0);
}

@end
