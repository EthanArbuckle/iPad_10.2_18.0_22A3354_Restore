@implementation SiriSharedUIViewStackContainer

- (SiriSharedUIViewStackContainer)initWithFrame:(CGRect)a3 contentViews:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SiriSharedUIViewStackContainer *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriSharedUIViewStackContainer;
  v10 = -[SiriSharedUIViewStackContainer initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SiriSharedUIViewStackContainer initWithFrame:contentViews:]";
      _os_log_impl(&dword_1DE0BF000, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    -[SiriSharedUIViewStackContainer _configureContainingView](v10, "_configureContainingView");
    -[SiriSharedUIViewStackContainer _setContentViews:](v10, "_setContentViews:", v9);
  }

  return v10;
}

- (void)_configureContainingView
{
  SiriSharedUIStandardScrollView *v3;
  SiriSharedUIStandardScrollView *scrollView;
  void *v5;
  _BOOL4 IsPad;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *leadingContainerConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *topContainerConstraint;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *trailingContainerConstraint;
  void *v19;
  void *v20;
  double v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *bottomContainerConstraint;
  NSLayoutConstraint *v24;
  void *v25;
  SiriSharedUIStandardView *v26;
  UIView *v27;
  UIView *containingView;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSLayoutConstraint *v49;
  double v50;
  NSLayoutConstraint *containingViewHeightConstraint;
  id v52;

  v3 = objc_alloc_init(SiriSharedUIStandardScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[SiriSharedUIStandardScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  -[SiriSharedUIStandardScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriSharedUIStandardScrollView setKeyboardDismissMode:](self->_scrollView, "setKeyboardDismissMode:", 2);
  -[SiriSharedUIStandardScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 0);
  -[SiriSharedUIStandardScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[SiriSharedUIStandardScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[SiriSharedUIStandardScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[SiriSharedUIViewStackContainer addSubview:](self, "addSubview:", self->_scrollView);
  -[SiriSharedUIStandardScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainer safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsPad = SiriSharedUIDeviceIsPad();
  objc_msgSend(v52, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsPad)
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 30.0);
  else
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingContainerConstraint = self->_leadingContainerConstraint;
  self->_leadingContainerConstraint = v9;

  -[NSLayoutConstraint setActive:](self->_leadingContainerConstraint, "setActive:", 1);
  objc_msgSend(v52, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, self->_topPadding);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topContainerConstraint = self->_topContainerConstraint;
  self->_topContainerConstraint = v13;

  -[SiriSharedUIViewStackContainer _updateContainingViewTopConstraint](self, "_updateContainingViewTopConstraint");
  -[NSLayoutConstraint setActive:](self->_topContainerConstraint, "setActive:", 1);
  objc_msgSend(v52, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 0.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingContainerConstraint = self->_trailingContainerConstraint;
  self->_trailingContainerConstraint = v17;

  -[SiriSharedUIViewStackContainer _updateContainingViewTrailingConstraint](self, "_updateContainingViewTrailingConstraint");
  -[NSLayoutConstraint setActive:](self->_trailingContainerConstraint, "setActive:", 1);
  objc_msgSend(v52, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainer bottomAnchor](self, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainer bottomPadding](self, "bottomPadding");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -v21);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  -[NSLayoutConstraint setActive:](v22, "setActive:", 1);
  bottomContainerConstraint = self->_bottomContainerConstraint;
  self->_bottomContainerConstraint = v22;
  v24 = v22;

  -[SiriSharedUIStandardScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [SiriSharedUIStandardView alloc];
  v27 = -[SiriSharedUIStandardView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  containingView = self->_containingView;
  self->_containingView = v27;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriSharedUIStandardScrollView addContentView:](self->_scrollView, "addContentView:", self->_containingView);
  -[UIView leadingAnchor](self->_containingView, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[UIView topAnchor](self->_containingView, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[UIView trailingAnchor](self->_containingView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[UIView bottomAnchor](self->_containingView, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[UIView leadingAnchor](self->_containingView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", 1);

  -[UIView widthAnchor](self->_containingView, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  -[UIView heightAnchor](self->_containingView, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  LODWORD(v50) = 1148846080;
  -[NSLayoutConstraint setPriority:](v49, "setPriority:", v50);
  -[NSLayoutConstraint setActive:](v49, "setActive:", 1);
  containingViewHeightConstraint = self->_containingViewHeightConstraint;
  self->_containingViewHeightConstraint = v49;

}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  self->_isInAmbient = a3;
  -[SiriSharedUIStandardScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:");
  LODWORD(v5) = 1148846080;
  if (v3)
    *(float *)&v5 = 250.0;
  -[NSLayoutConstraint setPriority:](self->_containingViewHeightConstraint, "setPriority:", v5);
  -[SiriSharedUIViewStackContainer _updateContainingViewTopConstraint](self, "_updateContainingViewTopConstraint");
  -[SiriSharedUIViewStackContainer _updateLeadingTrailingConstraints](self, "_updateLeadingTrailingConstraints");
  -[SiriSharedUIViewStackContainer _updateScrollViewContentInsets](self, "_updateScrollViewContentInsets");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIViewStackContainer;
  -[SiriSharedUIViewStackContainer safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[SiriSharedUIViewStackContainer _updateContainingViewTopConstraint](self, "_updateContainingViewTopConstraint");
  -[SiriSharedUIViewStackContainer _updateLeadingTrailingConstraints](self, "_updateLeadingTrailingConstraints");
}

- (void)_updateLeadingTrailingConstraints
{
  double v3;
  double v4;
  NSLayoutConstraint *trailingContainerConstraint;
  double v6;
  NSLayoutConstraint *leadingContainerConstraint;
  _BOOL4 IsPad;
  double v9;

  -[SiriSharedUIViewStackContainer safeAreaInsets](self, "safeAreaInsets");
  if (self->_isInAmbient)
  {
    if (v3 <= 36.0)
    {
      -[NSLayoutConstraint setConstant:](self->_leadingContainerConstraint, "setConstant:", 36.0);
      trailingContainerConstraint = self->_trailingContainerConstraint;
      v6 = -36.0;
    }
    else
    {
      v4 = v3 - 36.0;
      -[NSLayoutConstraint setConstant:](self->_leadingContainerConstraint, "setConstant:", -(v3 - 36.0));
      trailingContainerConstraint = self->_trailingContainerConstraint;
      v6 = v4;
    }
  }
  else
  {
    leadingContainerConstraint = self->_leadingContainerConstraint;
    IsPad = SiriSharedUIDeviceIsPad();
    v9 = 30.0;
    if (!IsPad)
      v9 = 0.0;
    -[NSLayoutConstraint setConstant:](leadingContainerConstraint, "setConstant:", v9);
    trailingContainerConstraint = self->_trailingContainerConstraint;
    v6 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](trailingContainerConstraint, "setConstant:", v6);
}

- (void)_updateScrollViewContentInsets
{
  -[SiriSharedUIStandardScrollView contentInset](self->_scrollView, "contentInset");
  -[SiriSharedUIStandardScrollView setContentInset:](self->_scrollView, "setContentInset:");
}

- (void)_updateContainingViewConstraints
{
  -[SiriSharedUIViewStackContainer _updateContainingViewTrailingConstraint](self, "_updateContainingViewTrailingConstraint");
  -[SiriSharedUIViewStackContainer _updateContainingViewTopConstraint](self, "_updateContainingViewTopConstraint");
}

- (void)updateConstraints
{
  objc_super v3;

  -[SiriSharedUIViewStackContainer _updateContainingViewConstraints](self, "_updateContainingViewConstraints");
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIViewStackContainer;
  -[SiriSharedUIViewStackContainer updateConstraints](&v3, sel_updateConstraints);
}

- (void)_updateContainingViewTrailingConstraint
{
  uint64_t v3;
  void *v4;
  _BOOL4 IsPad;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;

  -[SiriSharedUIViewStackContainer window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_trailingContainerConstraint)
  {
    v17 = (void *)v3;
    IsPad = SiriSharedUIDeviceIsPad();
    v4 = v17;
    if (IsPad)
    {
      if (v17)
      {
        objc_msgSend(v17, "bounds");
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;
        objc_msgSend(v17, "windowScene");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        SiriSharedUICompactSlideOverContentSpacingOnPad(objc_msgSend(v14, "interfaceOrientation"), v7, v9, v11, v13);
        v16 = v15;

        -[NSLayoutConstraint setConstant:](self->_trailingContainerConstraint, "setConstant:", -v16);
        v4 = v17;
      }
    }
  }

}

- (void)_updateContainingViewTopConstraint
{
  double v3;
  BOOL v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (!SiriSharedUIDeviceIsPad())
  {
    if (self->_isInAmbient)
    {
      -[SiriSharedUIViewStackContainer safeAreaInsets](self, "safeAreaInsets");
      v4 = v3 <= 36.0;
      v5 = 36.0 - v3;
      if (v4)
        v5 = 36.0;
      goto LABEL_11;
    }
    -[SiriSharedUIViewStackContainer window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v7, "interfaceOrientation") - 3) > 1)
    {

    }
    else
    {
      -[SiriSharedUIViewStackContainer safeAreaInsets](self, "safeAreaInsets");
      v9 = v8;

      v5 = 8.0;
      if (v9 == 0.0)
      {
LABEL_11:
        -[NSLayoutConstraint setConstant:](self->_topContainerConstraint, "setConstant:", v5);
        return;
      }
    }
    v5 = 0.0;
    goto LABEL_11;
  }
}

- (void)_configureCustomTopAndBottomViews:(id)a3
{
  id v4;
  SiriSharedUIViewStack *v5;
  uint64_t v6;
  SiriSharedUIViewStack *v7;
  SiriSharedUIViewStack *customConstraintsViewStack;
  SiriSharedUIViewStack *v9;
  SiriSharedUIViewStack *bottomViewStack;
  SiriSharedUIViewStack *v11;
  SiriSharedUIViewStack *topViewStack;
  SiriSharedUIViewStack *v13;
  SiriSharedUIViewStack *listViewStack;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [SiriSharedUIViewStack alloc];
  v6 = MEMORY[0x1E0C9AA60];
  v7 = -[SiriSharedUIViewStack initWithContentViews:](v5, "initWithContentViews:", MEMORY[0x1E0C9AA60]);
  customConstraintsViewStack = self->_customConstraintsViewStack;
  self->_customConstraintsViewStack = v7;

  v9 = -[SiriSharedUIViewStack initWithContentViews:]([SiriSharedUIViewStack alloc], "initWithContentViews:", v6);
  bottomViewStack = self->_bottomViewStack;
  self->_bottomViewStack = v9;

  v11 = -[SiriSharedUIViewStack initWithContentViews:]([SiriSharedUIViewStack alloc], "initWithContentViews:", v6);
  topViewStack = self->_topViewStack;
  self->_topViewStack = v11;

  v13 = -[SiriSharedUIViewStack initWithContentViews:]([SiriSharedUIViewStack alloc], "initWithContentViews:", v6);
  listViewStack = self->_listViewStack;
  self->_listViewStack = v13;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[SiriSharedUIViewStackContainer addContentView:](self, "addContentView:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  y = a3.y;
  x = a3.x;
  -[SiriSharedUIViewStackContainer _transitionalContentViewFrames](self, "_transitionalContentViewFrames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsPoint:", x, y);

  if ((v7 & 1) != 0)
    return 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[SiriSharedUIViewStackContainer contentViews](self, "contentViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SiriSharedUIViewStackContainer_hasContentAtPoint___block_invoke;
  v11[3] = &unk_1EA89CF08;
  *(double *)&v11[6] = x;
  *(double *)&v11[7] = y;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  v8 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __52__SiriSharedUIViewStackContainer_hasContentAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  id v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v17 = a2;
  objc_msgSend(v17, "frame");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v10 = CGRectGetWidth(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v11 = CGRectGetHeight(v20);
  objc_msgSend(v17, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v13 = v12;
  v15 = v14;
  if ((objc_msgSend(v17, "isHidden") & 1) == 0)
  {
    objc_msgSend(v17, "alpha");
    if (v16 > 0.0)
    {
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = v10;
      v21.size.height = v11;
      v18.x = v13;
      v18.y = v15;
      if (CGRectContainsPoint(v21, v18))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

}

- (id)_mostRecentBottomStackViewAnchor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SiriSharedUIViewStack mostRecentlyAddedView](self->_bottomViewStack, "mostRecentlyAddedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIView bottomAnchor](self->_containingView, "bottomAnchor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_mostRecentTopStackViewAnchor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SiriSharedUIViewStack mostRecentlyAddedView](self->_topViewStack, "mostRecentlyAddedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIView topAnchor](self->_containingView, "topAnchor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_stackContainingContentView:(id)a3
{
  id v4;
  SiriSharedUIViewStack **p_bottomViewStack;
  SiriSharedUIViewStack *v6;

  v4 = a3;
  p_bottomViewStack = &self->_bottomViewStack;
  if (-[SiriSharedUIViewStack containsContentView:](self->_bottomViewStack, "containsContentView:", v4)
    || (p_bottomViewStack = &self->_topViewStack,
        -[SiriSharedUIViewStack containsContentView:](self->_topViewStack, "containsContentView:", v4))
    || (p_bottomViewStack = &self->_listViewStack,
        -[SiriSharedUIViewStack containsContentView:](self->_listViewStack, "containsContentView:", v4))
    || (p_bottomViewStack = &self->_customConstraintsViewStack,
        -[SiriSharedUIViewStack containsContentView:](self->_customConstraintsViewStack, "containsContentView:", v4)))
  {
    v6 = *p_bottomViewStack;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)topPadding
{
  double v3;
  double v4;
  double v5;

  -[SiriSharedUIViewStackContainer safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  -[NSLayoutConstraint constant](self->_topContainerConstraint, "constant");
  return v4 + v5;
}

- (void)_snapshotContentViewFramesForTransition
{
  SiriSharedUIRectSet *v3;
  void *v4;
  SiriSharedUIRectSet *v5;

  v3 = [SiriSharedUIRectSet alloc];
  -[SiriSharedUIViewStackContainer contentViews](self, "contentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SiriSharedUIRectSet initWithFramesForViews:inCoordinateSpace:](v3, "initWithFramesForViews:inCoordinateSpace:", v4, self);

  -[SiriSharedUIViewStackContainer _setTransitionalContentViewFrames:](self, "_setTransitionalContentViewFrames:", v5);
}

- (void)_clearTransitionalContentViewFrameSnapshots
{
  -[SiriSharedUIViewStackContainer _setTransitionalContentViewFrames:](self, "_setTransitionalContentViewFrames:", 0);
}

- (void)setBottomPadding:(double)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5 alongsideAnimations:(id)a6 completion:(id)a7
{
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[5];
  void (**v23)(_QWORD);
  _QWORD v24[5];
  id v25;
  void (**v26)(_QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = (void (**)(_QWORD))a6;
  v13 = (void (**)(_QWORD))a7;
  if (self->_bottomPadding == a3)
  {
    if (v12)
      v12[2](v12);
    if (v13)
      v13[2](v13);
  }
  else
  {
    self->_bottomPadding = a3;
    -[SiriSharedUIViewStackContainer _snapshotContentViewFramesForTransition](self, "_snapshotContentViewFramesForTransition");
    -[SiriSharedUIViewStackContainer contentViews](self, "contentViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18++), "setNeedsLayout");
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);
    }
    -[NSLayoutConstraint setConstant:](self->_bottomContainerConstraint, "setConstant:", -self->_bottomPadding);
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v20 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke;
    v24[3] = &unk_1EA89CF30;
    v24[4] = self;
    v25 = v14;
    v26 = v12;
    v22[0] = v20;
    v22[1] = 3221225472;
    v22[2] = __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke_2;
    v22[3] = &unk_1EA89CF58;
    v22[4] = self;
    v23 = v13;
    v21 = v14;
    objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", a5, v24, v22, a4, 0.0);

  }
}

uint64_t __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "layoutIfNeeded", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __120__SiriSharedUIViewStackContainer_setBottomPadding_animatedWithDuration_animationOptions_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_clearTransitionalContentViewFrameSnapshots");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setBottomPadding:(double)a3
{
  -[SiriSharedUIViewStackContainer setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:](self, "setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:", 0, 0, 0, a3, 0.0);
}

- (NSArray)contentViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStack contentViews](self->_bottomViewStack, "contentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[SiriSharedUIViewStack contentViews](self->_topViewStack, "contentViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[SiriSharedUIViewStack contentViews](self->_customConstraintsViewStack, "contentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[SiriSharedUIViewStack contentViews](self->_listViewStack, "contentViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v8;
}

- (void)bringSubviewToFront:(id)a3
{
  UIView *containingView;

  containingView = self->_containingView;
  if (containingView)
    -[UIView bringSubviewToFront:](containingView, "bringSubviewToFront:", a3);
}

- (void)addContentView:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SiriSharedUIViewStackContainer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewStackContainer:willBeginHostingChildViewController:", self, v6);

  -[SiriSharedUIViewStackContainer addContentView:](self, "addContentView:", v7);
  -[SiriSharedUIViewStackContainer delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewStackContainer:didBeginHostingChildViewController:", self, v6);

}

- (void)addContentView:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setStackContainerDelegate:", self);
  +[SiriSharedUIViewStackConstraints constraints](SiriSharedUIViewStackConstraints, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStackConstraints:", v4);

  -[UIView addSubview:](self->_containingView, "addSubview:", v6);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SiriSharedUIViewStackContainer _attachContentView:](self, "_attachContentView:", v6);
  v5 = objc_msgSend(v6, "attachmentType");
  if (v5 <= 3)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_1EA89CF78[v5]), "addContentView:", v6);

}

- (void)removeContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SiriSharedUIViewStackContainer *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "removeFromSuperview");
  v26 = self;
  -[SiriSharedUIViewStackContainer _stackContainingContentView:](self, "_stackContainingContentView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextViewAfterContentView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "attachmentType") == 1 && objc_msgSend(v6, "attachmentType") == 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "stackConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v8, "addObject:", v10);
    objc_msgSend(v6, "stackConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "setActive:", 0);
      objc_msgSend(v6, "removeConstraint:", v12);
    }

  }
  objc_msgSend(v4, "stackConstraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 0);

  objc_msgSend(v4, "stackConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHeightConstraint:", 0);

  objc_msgSend(v5, "removeContentView:", v4);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v20);
        objc_msgSend(v6, "bottomAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "secondAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToAnchor:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setActive:", 1);
        objc_msgSend(v6, "stackConstraints");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setBottomConstraint:", v24);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

  objc_msgSend(v6, "portraitContentSize");
  -[SiriSharedUIViewStackContainer stackableContentWillUpdateLayout:withUpdatedContentSize:animated:](v26, "stackableContentWillUpdateLayout:withUpdatedContentSize:animated:", v6, 0);

}

- (void)_attachContentView:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "attachmentType");
  objc_msgSend(v4, "portraitContentSize");
  v7 = v6;
  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_containingView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setActive:", 1);
  objc_msgSend(v4, "stackConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeadingConstraint:", v10);

  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_containingView, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setActive:", 1);
  objc_msgSend(v4, "stackConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTrailingConstraint:", v14);

  switch(v5)
  {
    case 0:
      objc_msgSend(v4, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUIViewStackContainer _mostRecentTopStackViewAnchor](self, "_mostRecentTopStackViewAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attachmentYOffset");
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setActive:", 1);
      objc_msgSend(v4, "stackConstraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTopConstraint:", v18);
      goto LABEL_10;
    case 1:
      objc_msgSend(v4, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUIViewStackContainer _mostRecentBottomStackViewAnchor](self, "_mostRecentBottomStackViewAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attachmentYOffset");
      objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setActive:", 1);
      objc_msgSend(v4, "stackConstraints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBottomConstraint:", v18);

      objc_msgSend(v4, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_containingView, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v25) = 1148846080;
      v26 = v19;
      goto LABEL_5;
    case 2:
      objc_msgSend(v4, "bottomAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_containingView, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v29) = 1148846080;
      objc_msgSend(v18, "setPriority:", v29);
      objc_msgSend(v18, "setActive:", 1);
      objc_msgSend(v4, "stackConstraints");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBottomConstraint:", v18);

      objc_msgSend(v4, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_containingView, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v19;
      LODWORD(v25) = 1148846080;
LABEL_5:
      objc_msgSend(v26, "setPriority:", v25);
      objc_msgSend(v19, "setActive:", 1);
      objc_msgSend(v4, "stackConstraints");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTopConstraint:", v19);

      goto LABEL_10;
    case 3:
      -[SiriSharedUIViewStack mostRecentlyAddedView](self->_listViewStack, "mostRecentlyAddedView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v34;
      if (v34)
      {
        objc_msgSend(v34, "stackConstraints");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bottomConstraint");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "removeConstraint:", v36);
        objc_msgSend(v36, "setActive:", 0);
        objc_msgSend(v18, "stackConstraints");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setBottomConstraint:", 0);

        objc_msgSend(v18, "bottomAnchor");
      }
      else
      {
        -[UIView topAnchor](self->_containingView, "topAnchor");
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v19);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "setActive:", 1);
      objc_msgSend(v4, "stackConstraints");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setTopConstraint:", v39);

      objc_msgSend(v4, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_containingView, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "setActive:", 1);
      objc_msgSend(v4, "stackConstraints");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setBottomConstraint:", v43);

LABEL_10:
      break;
    default:
      break;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "customAttachmentConstraints");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v56 != v49)
              objc_enumerationMutation(v46);
            objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "setActive:", 1);
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        }
        while (v48);
      }
    }

  }
  objc_msgSend(v4, "heightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToConstant:", v7);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "useLowerPriorityHeightConstraint"))
  {
    LODWORD(v53) = 1137180672;
    objc_msgSend(v52, "setPriority:", v53);
  }
  objc_msgSend(v52, "setActive:", 1);
  objc_msgSend(v4, "stackConstraints");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setHeightConstraint:", v52);

}

- (void)relayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SiriSharedUIViewStackContainer _updateContainingViewConstraints](self, "_updateContainingViewConstraints");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SiriSharedUIViewStackContainer contentViews](self, "contentViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "relayout");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)willPresentModalContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *temporaryTopConstraintForBottomViewStack;
  id v13;

  -[SiriSharedUIViewStack contentViews](self->_bottomViewStack, "contentViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SiriSharedUIViewStack viewAtIndex:](self->_bottomViewStack, "viewAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stackConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomConstraint");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    LODWORD(v7) = 1132068864;
    objc_msgSend(v13, "setPriority:", v7);
    -[SiriSharedUIViewStack mostRecentlyAddedView](self->_bottomViewStack, "mostRecentlyAddedView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_containingView, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    temporaryTopConstraintForBottomViewStack = self->_temporaryTopConstraintForBottomViewStack;
    self->_temporaryTopConstraintForBottomViewStack = v11;

    -[NSLayoutConstraint setActive:](self->_temporaryTopConstraintForBottomViewStack, "setActive:", 1);
    -[SiriSharedUIViewStackContainer layoutIfNeeded](self, "layoutIfNeeded");

  }
}

- (void)willDismissModalContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  -[SiriSharedUIViewStack contentViews](self->_bottomViewStack, "contentViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SiriSharedUIViewStack viewAtIndex:](self->_bottomViewStack, "viewAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stackConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomConstraint");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    LODWORD(v7) = 1148846080;
    objc_msgSend(v8, "setPriority:", v7);
    -[NSLayoutConstraint setActive:](self->_temporaryTopConstraintForBottomViewStack, "setActive:", 0);
    -[SiriSharedUIViewStackContainer layoutIfNeeded](self, "layoutIfNeeded");

  }
}

- (void)didDismissModalContent
{
  void *v3;
  uint64_t v4;
  NSLayoutConstraint *temporaryTopConstraintForBottomViewStack;

  -[SiriSharedUIViewStack contentViews](self->_bottomViewStack, "contentViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[UIView removeConstraint:](self->_containingView, "removeConstraint:", self->_temporaryTopConstraintForBottomViewStack);
    temporaryTopConstraintForBottomViewStack = self->_temporaryTopConstraintForBottomViewStack;
    self->_temporaryTopConstraintForBottomViewStack = 0;

  }
}

- (void)stackableContentWillUpdateLayout:(id)a3 withUpdatedContentSize:(CGSize)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id location;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[SiriSharedUIViewStackContainer _stackContainingContentView:](self, "_stackContainingContentView:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[UIView frame](self->_containingView, "frame");
    if ((v11 - width) * 0.5 >= 0.0)
      v12 = (v11 - width) * 0.5;
    else
      v12 = 0.0;
    objc_msgSend(v9, "stackConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v12);

    objc_msgSend(v9, "stackConstraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", -v12);

    objc_msgSend(v9, "stackConstraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeConstraint:", v18);
    objc_msgSend(v18, "setActive:", 0);
    objc_msgSend(v9, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "useLowerPriorityHeightConstraint"))
    {
      LODWORD(v21) = 1137180672;
      objc_msgSend(v20, "setPriority:", v21);
    }
    objc_msgSend(v20, "setActive:", 1);
    objc_msgSend(v9, "stackConstraints");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHeightConstraint:", v20);

    objc_msgSend(v9, "setNeedsLayout");
    objc_msgSend(v9, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNeedsLayout");

    if (v5)
    {
      objc_initWeak(&location, self);
      v26[0] = MEMORY[0x1E0C809B0];
      v24 = (void *)MEMORY[0x1E0DC3F10];
      v26[2] = __99__SiriSharedUIViewStackContainer_stackableContentWillUpdateLayout_withUpdatedContentSize_animated___block_invoke;
      v26[3] = &unk_1EA89CE68;
      v26[1] = 3221225472;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v24, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v26, 0, 0.5, 0.0, 3.0, 1000.0, 500.0, 0.0);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v25 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SiriSharedUIViewStackContainer stackableContentWillUpdateLayout:withUpdatedContentSize:animated:].cold.1(v25);
  }

}

void __99__SiriSharedUIViewStackContainer_stackableContentWillUpdateLayout_withUpdatedContentSize_animated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[56], "layoutIfNeeded");
    WeakRetained = v2;
  }

}

- (void)stackableContentDidLayout:(id)a3
{
  objc_msgSend(a3, "setAnimationContextForFrameAndLayoutUpdate:", 0);
}

- (double)stackableContentMaximumContainerWidth
{
  double v2;

  -[UIView frame](self->_containingView, "frame");
  return v2;
}

- (id)stackableViewsWithAttachment:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 <= 3)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *off_1EA89CF78[a3]), "contentViews", v3, v4);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (SiriSharedUIStandardScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (SiriSharedUIViewStackContainerDelegate)delegate
{
  return (SiriSharedUIViewStackContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)containingView
{
  return self->_containingView;
}

- (void)setContainingView:(id)a3
{
  objc_storeStrong((id *)&self->_containingView, a3);
}

- (SiriSharedUIViewStack)customConstraintsViewStack
{
  return self->_customConstraintsViewStack;
}

- (void)setCustomConstraintsViewStack:(id)a3
{
  objc_storeStrong((id *)&self->_customConstraintsViewStack, a3);
}

- (SiriSharedUIViewStack)bottomViewStack
{
  return self->_bottomViewStack;
}

- (void)setBottomViewStack:(id)a3
{
  objc_storeStrong((id *)&self->_bottomViewStack, a3);
}

- (SiriSharedUIViewStack)listViewStack
{
  return self->_listViewStack;
}

- (void)setListViewStack:(id)a3
{
  objc_storeStrong((id *)&self->_listViewStack, a3);
}

- (SiriSharedUIViewStack)topViewStack
{
  return self->_topViewStack;
}

- (void)setTopViewStack:(id)a3
{
  objc_storeStrong((id *)&self->_topViewStack, a3);
}

- (NSLayoutConstraint)topContainerConstraint
{
  return self->_topContainerConstraint;
}

- (void)setTopContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topContainerConstraint, a3);
}

- (NSLayoutConstraint)leadingContainerConstraint
{
  return self->_leadingContainerConstraint;
}

- (void)setLeadingContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingContainerConstraint, a3);
}

- (NSLayoutConstraint)trailingContainerConstraint
{
  return self->_trailingContainerConstraint;
}

- (void)setTrailingContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingContainerConstraint, a3);
}

- (NSLayoutConstraint)bottomContainerConstraint
{
  return self->_bottomContainerConstraint;
}

- (void)setBottomContainerConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomContainerConstraint, a3);
}

- (NSLayoutConstraint)temporaryTopConstraintForBottomViewStack
{
  return self->_temporaryTopConstraintForBottomViewStack;
}

- (void)setTemporaryTopConstraintForBottomViewStack:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryTopConstraintForBottomViewStack, a3);
}

- (NSLayoutConstraint)containingViewHeightConstraint
{
  return self->_containingViewHeightConstraint;
}

- (void)setContainingViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containingViewHeightConstraint, a3);
}

- (SiriSharedUIRectSet)_transitionalContentViewFrames
{
  return self->_transitionalContentViewFrames;
}

- (void)_setTransitionalContentViewFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalContentViewFrames, 0);
  objc_storeStrong((id *)&self->_containingViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_temporaryTopConstraintForBottomViewStack, 0);
  objc_storeStrong((id *)&self->_bottomContainerConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContainerConstraint, 0);
  objc_storeStrong((id *)&self->_leadingContainerConstraint, 0);
  objc_storeStrong((id *)&self->_topContainerConstraint, 0);
  objc_storeStrong((id *)&self->_topViewStack, 0);
  objc_storeStrong((id *)&self->_listViewStack, 0);
  objc_storeStrong((id *)&self->_bottomViewStack, 0);
  objc_storeStrong((id *)&self->_customConstraintsViewStack, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentViews, 0);
}

- (void)stackableContentWillUpdateLayout:(os_log_t)log withUpdatedContentSize:animated:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[SiriSharedUIViewStackContainer stackableContentWillUpdateLayout:withUpdatedContentSize:animated:]";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_1DE0BF000, log, OS_LOG_TYPE_ERROR, "%s #viewStack Skipping because contentView wasn't found in SiriSharedUIViewStack: %@", (uint8_t *)&v1, 0x16u);
}

@end
