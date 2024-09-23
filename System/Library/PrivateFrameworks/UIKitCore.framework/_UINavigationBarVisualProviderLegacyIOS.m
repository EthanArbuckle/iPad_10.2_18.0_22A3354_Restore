@implementation _UINavigationBarVisualProviderLegacyIOS

- (void)prepare
{
  _UIBarBackground *v3;
  _UIBarBackground *v4;
  _UIBarBackground *backgroundView;
  _UIBarBackgroundLayoutLegacy *v6;
  _UIBarBackgroundLayoutLegacy *backgroundViewLayout;
  _UINavigationBarGestureHandler *v8;
  _UINavigationBarGestureHandler *gestureHandler;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarVisualProviderLegacyIOS;
  -[_UINavigationBarVisualProvider prepare](&v10, sel_prepare);
  v3 = [_UIBarBackground alloc];
  -[UIView bounds](self->super._navigationBar, "bounds");
  v4 = -[_UIBarBackground initWithFrame:](v3, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  v6 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
  backgroundViewLayout = self->_backgroundViewLayout;
  self->_backgroundViewLayout = v6;

  -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", self->_backgroundViewLayout);
  -[_UIBarBackground setTopAligned:](self->_backgroundView, "setTopAligned:", 1);
  -[UIView addSubview:](self->super._navigationBar, "addSubview:", self->_backgroundView);
  v8 = -[_UINavigationBarGestureHandler initWithNavigationBar:]([_UINavigationBarGestureHandler alloc], "initWithNavigationBar:", self->super._navigationBar);
  gestureHandler = self->_gestureHandler;
  self->_gestureHandler = v8;

  -[_UINavigationBarGestureHandler setDelegate:](self->_gestureHandler, "setDelegate:", self);
  -[_UINavigationBarVisualProviderLegacyIOS _setUpContentFocusContainerGuide](self, "_setUpContentFocusContainerGuide");
}

- (void)teardown
{
  _UIBarBackground *backgroundView;
  _UINavigationBarLegacyContentView *layoutView;
  objc_super v5;

  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  -[UIView removeFromSuperview](self->_layoutView, "removeFromSuperview");
  layoutView = self->_layoutView;
  self->_layoutView = 0;

  self->_contentView = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualProviderLegacyIOS;
  -[_UINavigationBarVisualProvider teardown](&v5, sel_teardown);
}

- (void)changeAppearance
{
  void *v3;

  -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  -[_UINavBarPrompt prompt](self->_prompt, "prompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIView setNeedsLayout](self->_prompt, "setNeedsLayout");
}

- (void)updateArchivedSubviews:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27[0] = self->_titleView;
  v27[1] = self->_prompt;
  v27[2] = self->_backgroundView;
  v27[3] = self->_backIndicatorView;
  v5 = 0;
  v27[4] = self->_layoutView;
  do
  {
    if (v27[v5])
      objc_msgSend(v4, "removeObject:");
    ++v5;
  }
  while (v5 != 5);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_rightViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_leftViews;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  for (i = 4; i != -1; --i)
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;

  -[UIView traitCollection](self->super._navigationBar, "traitCollection", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarGestureHandler setIdiom:](self->_gestureHandler, "setIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  -[_UINavigationBarVisualProviderLegacyIOS _setUpContentFocusContainerGuide](self, "_setUpContentFocusContainerGuide");

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "_customLeftViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10++), "setSemanticContentAttribute:", a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "_customRightViews", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15++), "setSemanticContentAttribute:", a3);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  -[UIImageView setSemanticContentAttribute:](self->_backIndicatorView, "setSemanticContentAttribute:", a3);
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSemanticContentAttribute:", a3);

}

- (int64_t)statusBarStyle
{
  double v3;
  objc_super v5;

  if (-[UINavigationBar barStyle](self->super._navigationBar, "barStyle"))
    return 1;
  -[_UIBarBackgroundLayoutLegacy topInset](self->_backgroundViewLayout, "topInset");
  if (v3 > 0.0)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualProviderLegacyIOS;
  return -[_UINavigationBarVisualProvider statusBarStyle](&v5, sel_statusBarStyle);
}

- (BOOL)canHandleStatusBarTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 0;
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == v8;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)preferredFocusedView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSArray firstObject](self->_leftViews, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSArray firstObject](self->_rightViews, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "implicitAnimationForKeyPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  UINavigationBar *navigationBar;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  navigationBar = self->super._navigationBar;
  v7 = a4;
  v8 = a3;
  -[UINavigationBar _currentVisualStyle](navigationBar, "_currentVisualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timingFunctionForAnimationInView:withKeyPath:isInteractive:", v8, v7, objc_msgSend(v10, "interactive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3 defaultAnswer:(id)a4
{
  uint64_t (**v6)(id, id);
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;

  v6 = (uint64_t (**)(id, id))a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "locationInView:", self->super._navigationBar);
    v9 = v8;
    v11 = v10;

    -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:", v9, v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v7 == 0;
  }
  else
  {
    v12 = v6[2](v6, v7);
  }

  return v12;
}

- (CGPoint)frameOriginForStatusBarLocatedAt:(CGPoint)a3
{
  int64_t v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = -[UINavigationBar barPosition](self->super._navigationBar, "barPosition", a3.x, a3.y);
  v4 = 0.0;
  v5 = 20.0;
  if (v3 != 3)
    v5 = 0.0;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)_preferredContentSizeForItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[6];
  CGSize result;

  v4 = a3;
  -[UINavigationBar defaultSizeForOrientation:](self->super._navigationBar, "defaultSizeForOrientation:", -[UINavigationBar effectiveInterfaceOrientation](self->super._navigationBar, "effectiveInterfaceOrientation"));
  v6 = v5;
  v8 = v7;
  if (v4)
  {
    v9 = -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72___UINavigationBarVisualProviderLegacyIOS__preferredContentSizeForItem___block_invoke;
    v16[3] = &__block_descriptor_48_e8_d16__0q8l;
    *(double *)&v16[4] = v6;
    *(double *)&v16[5] = v8;
    objc_msgSend(v4, "_desiredHeightForBarMetrics:defaultHeightBlock:", v9, v16);
    v8 = v10;
  }
  -[UIView superview](self->super._navigationBar, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "bounds");
    v6 = v13;
  }

  v14 = v6;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UIView subviews](self->_contentView, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidateIntrinsicContentSize");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  UINavigationItem *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (-[_UINavigationBarVisualProviderLegacyIOS _supportsCanvasView](self, "_supportsCanvasView", a3.width, a3.height))
  {
    v5 = self->super._itemForMeasuring;
    if (!v5)
    {
      v6 = -[_UINavigationBarItemStack state](self->super._stack, "state");
      if (v6 == 2)
      {
        -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "cancelledTransition"))
        {
          -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
          v5 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();
LABEL_9:

          goto LABEL_7;
        }
      }
      -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
      v5 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();
      if (v6 == 2)
        goto LABEL_9;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_7:
  -[_UINavigationBarVisualProviderLegacyIOS _preferredContentSizeForItem:](self, "_preferredContentSizeForItem:", v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)shouldUseHeightRangeFittingWidth
{
  return 0;
}

- (void)barSizeChanged
{
  id v2;

  -[UINavigationBar currentBackButton](self->super._navigationBar, "currentBackButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);

}

- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (self->_backIndicatorView == a3)
  {
    objc_msgSend(a3, "sizeToFit");
    -[UIView setNeedsLayout](self->_contentView, "setNeedsLayout");
  }
}

- (void)_layoutSubviewsFromContentView
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
  id v13;

  -[UIView window](self->_layoutView, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!-[_UINavigationBarItemStack state](self->super._stack, "state"))
    {
      -[UIView bounds](self->_layoutView, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarVisualProviderLegacyIOS _layoutInBounds:withVisualStyle:](self, "_layoutInBounds:withVisualStyle:", v12, v5, v7, v9, v11);

    }
  }
}

- (void)_layoutInBounds:(CGRect)a3 withVisualStyle:(id)a4
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UINavBarPrompt *prompt;
  double v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  void *v43;
  id v44;
  unint64_t v45;
  void *v46;
  UIView *contentView;
  void *v48;
  uint64_t v49;
  double v50;
  BOOL v51;
  UIImageView *backIndicatorView;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  _UINavigationBarVisualProviderLegacyIOS *v75;
  uint64_t *v76;
  unint64_t v77;
  _QWORD v78[4];
  id v79;
  _UINavigationBarVisualProviderLegacyIOS *v80;
  uint64_t *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _QWORD v99[3];
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v99[1] = *MEMORY[0x1E0C80C00];
  v70 = a4;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  prompt = self->_prompt;
  objc_msgSend(v70, "promptInset");
  v11 = v10;
  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  v101 = CGRectInset(v100, v11, 0.0);
  -[UIView setFrame:](prompt, "setFrame:", v101.origin.x, v101.origin.y, v101.size.width, v101.size.height);
  v12 = v72;
  objc_msgSend(v72, "_updateViewsForBarSizeChangeAndApply:", 1);
  v13 = objc_msgSend(v70, "metricsIsMini");
  if ((objc_msgSend(v72, "leftItemsSupplementBackButton") & 1) != 0
    || (objc_msgSend(v72, "leftBarButtonItems"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "count"),
        v14,
        v12 = v72,
        !v15))
  {
    -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v71, v12);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v72;
  }
  else
  {
    v68 = 0;
  }
  objc_msgSend(v12, "_customLeftViews");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v99[0] = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v67)
    {
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:");
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v18;
    }
  }
  else
  {
    v17 = v67;
  }
  objc_opt_class();
  objc_opt_class();
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v94 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v23, "setControlSize:", v13);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
    }
    while (v20);
  }

  objc_msgSend(v72, "_customRightViews");
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v90 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v28, "setControlSize:", v13);
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    }
    while (v25);
  }

  objc_msgSend(v72, "_titleView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 && (objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v29, "setControlSize:", v13);
  v30 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v87 = *MEMORY[0x1E0C9D648];
  v88 = v30;
  v31 = objc_msgSend(v19, "count");
  v32 = objc_msgSend(v24, "count");
  v33 = v32;
  if (!v31)
  {
    v69 = 0;
    if (v32)
      goto LABEL_34;
LABEL_36:
    v34 = 0;
    goto LABEL_37;
  }
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v31);
  if (!v33)
    goto LABEL_36;
LABEL_34:
  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v33);
LABEL_37:
  v66 = (void *)v34;
  -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:", &v87, v69);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v29, "_shouldUseNavigationBarHeight"))
  {
    v35 = objc_msgSend(v70, "metricsHasPrompt");
    v36 = 0.0;
    if (v35)
    {
      objc_msgSend(v70, "barPromptHeight", 0.0);
      v38 = v37;
      objc_msgSend(v70, "barHeight");
      v36 = v38 - v39;
    }
    *((double *)&v87 + 1) = v36;
    *((double *)&v88 + 1) = height - v36;
  }
  objc_msgSend(v29, "setFrame:", v87, v88);
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v40 = MEMORY[0x1E0C809B0];
  v86 = 0;
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke;
  v78[3] = &unk_1E16B5F98;
  v82 = v31;
  v41 = v19;
  v79 = v41;
  v80 = self;
  v81 = &v83;
  objc_msgSend(v69, "enumerateObjectsUsingBlock:", v78);
  v42 = v84[3] + 1;
  if (v42 < v31)
  {
    do
    {
      objc_msgSend(v41, "objectAtIndex:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "removeFromSuperview");

      ++v42;
    }
    while (v31 != v42);
  }
  v73[0] = v40;
  v73[1] = 3221225472;
  v73[2] = __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke_2;
  v73[3] = &unk_1E16B5F98;
  v77 = v33;
  v44 = v24;
  v74 = v44;
  v75 = self;
  v76 = &v83;
  objc_msgSend(v66, "enumerateObjectsUsingBlock:", v73);
  v45 = v84[3] + 1;
  if (v45 < v33)
  {
    do
    {
      objc_msgSend(v44, "objectAtIndex:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "removeFromSuperview");

      ++v45;
    }
    while (v33 != v45);
  }
  contentView = self->_contentView;
  -[UINavigationBar items](self->super._navigationBar, "items");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");
  if (v31 | v33)
    v51 = v49 == 0;
  else
    v51 = 1;
  LODWORD(v50) = -1105618534;
  if (v51)
    *(float *)&v50 = 0.0;
  -[UIView setCharge:](contentView, "setCharge:", v50);

  -[_UINavigationBarVisualProviderLegacyIOS _updateBackIndicatorImage](self, "_updateBackIndicatorImage");
  backIndicatorView = self->_backIndicatorView;
  if (backIndicatorView)
  {
    -[UIView frame](backIndicatorView, "frame");
    v65 = v53;
    v55 = v54;
    -[_UINavigationBarVisualProviderLegacyIOS _effectiveBackIndicatorLeftMargin](self, "_effectiveBackIndicatorLeftMargin");
    v57 = v56;
    if ((*((_DWORD *)&self->super._navigationBar->super._viewFlags + 4) & 0x80000) != 0)
    {
      v102.origin.x = x;
      v102.origin.y = y;
      v102.size.width = width;
      v102.size.height = height;
      v57 = CGRectGetMaxX(v102) - v65 - v57;
    }
    objc_msgSend(v70, "backIndicatorBottomMargin");
    -[UIImageView alignmentRectInsets](self->_backIndicatorView, "alignmentRectInsets");
    v103.origin.x = x;
    v103.origin.y = y;
    v103.size.width = width;
    v103.size.height = height;
    CGRectGetMaxY(v103);
    UIRoundToViewScale(self->super._navigationBar);
    -[UIImageView setFrame:](self->_backIndicatorView, "setFrame:", v57, v58, v65, v55);
    -[UIView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:", self->_backIndicatorView);
    -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v71, v72);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UINavigationBar _hasBackButton](self->super._navigationBar, "_hasBackButton")
      && objc_msgSend(v72, "_leftItemsWantBackButton")
      && (objc_msgSend(v59, "_suppressesBackIndicatorView") & 1) == 0)
    {
      objc_msgSend(v59, "alpha");
      v60 = v63;
    }
    else
    {
      v60 = 0.0;
      if (objc_msgSend(v72, "_wantsBackButtonIndicator"))
      {
        objc_msgSend(v72, "_buttonForBackButtonIndicator");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "alpha");
        v60 = v62;

      }
    }
    -[UIView alpha](self->_backIndicatorView, "alpha");
    if ((v60 != 0.0) == (v64 == 0.0))
      -[UIView setAlpha:](self->_backIndicatorView, "setAlpha:", v60);

  }
  _Block_object_dispose(&v83, 8);

}

- (void)layoutSubviews
{
  id v3;

  -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->super._navigationBar, "bounds");
  if (self->_layoutView)
  {
    -[_UINavigationBarVisualProviderLegacyIOS _contentViewFrameInBounds:style:](self, "_contentViewFrameInBounds:style:", v3);
    -[UIView setFrame:](self->_layoutView, "setFrame:");
    -[UIView setNeedsLayout](self->_layoutView, "setNeedsLayout");
    -[UIView layoutIfNeeded](self->_layoutView, "layoutIfNeeded");
  }
  else
  {
    -[_UINavigationBarVisualProviderLegacyIOS _layoutInBounds:withVisualStyle:](self, "_layoutInBounds:withVisualStyle:", v3);
  }
  -[_UINavigationBarVisualProviderLegacyIOS _updateBackground](self, "_updateBackground");

}

- (void)prepareForPush
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[UINavigationBar _barStyle](self->super._navigationBar, "_barStyle");
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setTitleAutoresizesToFit:", -[UINavigationBar _titleAutoresizesToFit](self->super._navigationBar, "_titleAutoresizesToFit"));
  -[UIView addSubview:](self->_contentView, "addSubview:", v4);
  objc_storeStrong((id *)&self->_titleView, v4);
  if ((objc_msgSend(v8, "hidesBackButton") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "setStyle:", v3);
      objc_msgSend(v5, "setPressed:", 0);
      -[UIView addSubview:](self->_contentView, "addSubview:", v5);
      if (objc_msgSend(v5, "_appearanceIsInvalid"))
      {
        -[UIView window](self->super._navigationBar, "window");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIAppearance _applyInvocationsTo:window:](_UIAppearance, "_applyInvocationsTo:window:", v5, v7);

      }
      if (objc_msgSend(v5, "customBackgroundImageChangedToOrFromNil"))
        -[_UINavigationBarVisualProviderLegacyIOS _updateBackIndicatorImage](self, "_updateBackIndicatorImage");
    }
  }

}

- (void)prepareForPop
{
  void *v3;
  UIView *contentView;
  void *v5;
  id v6;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    contentView = self->_contentView;
    v6 = v3;
    objc_msgSend(v3, "_titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](contentView, "addSubview:", v5);

    v3 = v6;
  }

}

- (void)removeContentForItem:(id)a3
{
  UINavigationBar *contentView;

  contentView = (UINavigationBar *)self->_contentView;
  if (!contentView)
    contentView = self->super._navigationBar;
  objc_msgSend(a3, "_removeContentInView:", contentView);
}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
  _UINavigationBarItemStack *stack;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  double v18;
  int v19;
  id v20;

  stack = self->super._stack;
  v7 = a4;
  if (!a3)
  {
    -[_UINavigationBarItemStack topItem](stack, "topItem");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack previousBackItem](self->super._stack, "previousBackItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_titleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 1.0);

    objc_msgSend(v9, "backButtonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v10, "removeFromSuperview");
    v13 = 0.0;
    if (v8)
    {
      objc_msgSend(v8, "_titleView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFromSuperview");
      objc_msgSend(v8, "backButtonView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._navigationBar, "semanticContentAttribute"));
      if ((objc_msgSend(v20, "hidesBackButton") & 1) != 0)
      {
        objc_msgSend(v15, "setAlpha:", 0.0);
      }
      else
      {
        v16 = objc_msgSend(v20, "_leftItemsWantBackButton");
        v17 = v16;
        if (v16)
          v18 = 1.0;
        else
          v18 = 0.0;
        objc_msgSend(v15, "setAlpha:", v18);
        if ((v17 & 1) != 0)
        {
          v19 = objc_msgSend(v15, "_suppressesBackIndicatorView");

          if (v19)
            v13 = 0.0;
          else
            v13 = 1.0;
          goto LABEL_14;
        }
      }

    }
LABEL_14:
    -[UIView setAlpha:](self->_backIndicatorView, "setAlpha:", v13);
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

    -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
    goto LABEL_15;
  }
  -[_UINavigationBarItemStack previousBackItem](stack, "previousBackItem");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderLegacyIOS _startPushAnimationFromOldBackItem:oldTopItem:newBackItem:newTopItem:withTransitionAssistant:completion:](self, "_startPushAnimationFromOldBackItem:oldTopItem:newBackItem:newTopItem:withTransitionAssistant:completion:", v20, v8, v9, v10, v11, v7);

LABEL_15:
}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
  _UINavigationBarItemStack *stack;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UINavigationBar *v13;
  UINavigationBar *navigationBar;
  void *v15;
  void *v16;
  UIView *v17;
  void *v18;
  UIView *titleView;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  int v26;
  id v27;

  stack = self->super._stack;
  v7 = a4;
  if (a3)
  {
    -[_UINavigationBarItemStack previousBackItem](stack, "previousBackItem");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderLegacyIOS _startPopAnimationFromOldBackItem:oldTopItem:newBackItem:newTopItem:withTransitionAssistant:completion:](self, "_startPopAnimationFromOldBackItem:oldTopItem:newBackItem:newTopItem:withTransitionAssistant:completion:", v27, v8, v9, v10, v11, v7);

  }
  else
  {
    -[_UINavigationBarItemStack topItem](stack, "topItem");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v12)
    {
      objc_msgSend(v12, "navigationBar");
      v13 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
      navigationBar = self->super._navigationBar;

      if (v13 == navigationBar)
      {
        objc_msgSend(v9, "_removeTitleAndButtonViews");
        objc_msgSend(v9, "setNavigationBar:", 0);
      }
      objc_msgSend(v27, "navigationBar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v27, "backButtonView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);

      }
    }
    if (v27)
    {
      objc_msgSend(v27, "_titleView");
      v17 = (UIView *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "backButtonView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromSuperview");

      -[UIView setAlpha:](v17, "setAlpha:", 1.0);
      titleView = self->_titleView;
      self->_titleView = v17;

      objc_msgSend(v27, "updateNavigationBarButtonsAnimated:", 0);
    }
    if (v8)
    {
      objc_msgSend(v8, "backButtonView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPressed:", 0);
      -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "shouldHideBackButtonDuringTransition") & 1) != 0
        || (objc_msgSend(v27, "hidesBackButton") & 1) != 0)
      {

        v22 = 0.0;
        v23 = 0.0;
      }
      else
      {
        v25 = objc_msgSend(v27, "_leftItemsWantBackButton");

        v22 = 0.0;
        v23 = 0.0;
        if (v25)
        {
          v26 = objc_msgSend(v20, "_suppressesBackIndicatorView", 0.0);
          v22 = 1.0;
          if (v26)
            v23 = 0.0;
          else
            v23 = 1.0;
        }
      }
      objc_msgSend(v20, "setAlpha:", v22);
      -[UIView addSubview:](self->_contentView, "addSubview:", v20);

    }
    else
    {
      v23 = 0.0;
    }
    -[UIView setAlpha:](self->_backIndicatorView, "setAlpha:", v23);
    -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v24);

    -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
  }

}

- (void)updateTopNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderLegacyIOS _setViewsAnimated:forTopNavigationItem:backNavigationItem:previousTopItem:](self, "_setViewsAnimated:forTopNavigationItem:backNavigationItem:previousTopItem:", v3, v7, v5, v6);

}

- (void)updateTopNavigationItemTitleView
{
  void *v3;
  UIView *v4;
  id *p_titleView;
  UIView *titleView;
  UIView *v7;
  id v8;
  UIView *obj;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_titleView");
  obj = (UIView *)objc_claimAutoreleasedReturnValue();

  v4 = obj;
  p_titleView = (id *)&self->_titleView;
  titleView = self->_titleView;
  if (titleView != obj)
  {
    -[UIView superview](titleView, "superview");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    if (v7 == self->_contentView)
    {
      v8 = *p_titleView;
    }
    else
    {
      if (!-[NSMutableArray containsObject:](self->_slideTransitionClippingViews, "containsObject:", v7))
      {
LABEL_7:
        objc_storeStrong((id *)&self->_titleView, obj);
        objc_msgSend(*p_titleView, "setAlpha:", 1.0);
        -[UIView addSubview:](self->_contentView, "addSubview:", obj);

        v4 = obj;
        goto LABEL_8;
      }
      -[NSMutableArray removeObject:](self->_slideTransitionClippingViews, "removeObject:", v7);
      v8 = v7;
    }
    objc_msgSend(v8, "removeFromSuperview");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setupTopNavigationItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setAlpha:", 1.0);
    -[UIView addSubview:](self->_contentView, "addSubview:", v4);
  }
  objc_storeStrong((id *)&self->_titleView, v4);
  -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v5 != v12)
  {
    objc_msgSend(v12, "_updateViewsForBarSizeChangeAndApply:", 0);
    -[_UINavigationBarVisualProviderLegacyIOS updateTopNavigationItemAnimated:](self, "updateTopNavigationItemAnimated:", 0);
    -[UINavigationBar updatePrompt](self->super._navigationBar, "updatePrompt");
    v7 = v12;
    if (v6)
    {
      objc_msgSend(v6, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v12;
      if (v8)
      {
        objc_msgSend(v6, "backButtonView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);

        v7 = v12;
      }
    }
  }
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(v12, "_leftItemsWantBackButton"))
  {
    -[UIView addSubview:](self->_contentView, "addSubview:", v10);
    if (objc_msgSend(v10, "_appearanceIsInvalid"))
    {
      -[UIView window](self->super._navigationBar, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIAppearance _applyInvocationsTo:window:](_UIAppearance, "_applyInvocationsTo:window:", v10, v11);

    }
    objc_msgSend(v10, "setAlpha:", 1.0);
    if (objc_msgSend(v10, "customBackgroundImageChangedToOrFromNil"))
      -[_UINavigationBarVisualProviderLegacyIOS changeAppearance](self, "changeAppearance");
  }

}

- (void)setBackButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  UIView *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  _UINavigationBarVisualProviderLegacyIOS *v26;
  BOOL v27;

  v4 = a4;
  v5 = a3;
  if (-[_UINavigationBarItemStack state](self->super._stack, "state"))
  {
    if (!v5)
    {
      -[_UINavigationBarItemStack transitionAssistant](self->super._stack, "transitionAssistant");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setShouldHideBackButtonDuringTransition:", 1);

    }
  }
  else
  {
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backButtonView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9
      || (objc_msgSend(v9, "superview"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = v11 == 0,
          v11,
          v12))
    {
      if (v8 && (objc_msgSend(v8, "leftItemsSupplementBackButton") & 1) == 0)
      {
        objc_msgSend(v8, "_barButtonForBackButtonIndicator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "_actsAsFakeBackButton"))
        {
          objc_msgSend(v13, "view");
          v14 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v14;
        }

      }
    }
    v15 = self->_contentView;
    if (v5)
    {
      if (v10)
      {
        -[UINavigationBar currentLeftView](self->super._navigationBar, "currentLeftView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 == v10)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:", 0, v17, 0, v7, v8);
          objc_msgSend(v17, "objectAtIndex:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "CGRectValue");
          objc_msgSend(v10, "setFrame:");

          -[UIView addSubview:](v15, "addSubview:", v10);
        }
      }
    }
    if (v10)
      v19 = v5;
    else
      v19 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73___UINavigationBarVisualProviderLegacyIOS_setBackButtonVisible_animated___block_invoke;
    aBlock[3] = &unk_1E16B4008;
    v20 = v10;
    v27 = v19;
    v25 = v20;
    v26 = self;
    v21 = _Block_copy(aBlock);
    v22 = v21;
    if (v4)
    {
      +[UINavigationBar defaultAnimationDuration](UINavigationBar, "defaultAnimationDuration");
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v22);
    }
    else
    {
      (*((void (**)(void *))v21 + 2))(v21);
    }

  }
}

- (BOOL)_shouldShowBackButtonForNavigationItem:(id)a3
{
  return 1;
}

- (id)_backButtonForBackItem:(id)a3 topItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6
    && (objc_msgSend(v7, "hidesBackButton") & 1) == 0
    && -[_UINavigationBarVisualProviderLegacyIOS _shouldShowBackButtonForNavigationItem:](self, "_shouldShowBackButtonForNavigationItem:", v6))
  {
    objc_msgSend(v6, "backButtonView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_defaultTitleFontForItem:(id)a3 fittingHeight:(double)a4 withScaleAdjustment:(double)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;

  v8 = a3;
  -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 0.0)
    v10 = 1.0;
  else
    v10 = a5;
  -[UINavigationBar _appearanceStorage](self->super._navigationBar, "_appearanceStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)off_1E1678D90);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "pointSize");
    if (v14 == 0.0)
    {
      objc_msgSend(v9, "headingFontSize");
      v16 = v15;
      objc_msgSend(v13, "fontWithSize:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_titleView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 > 0.0
        && objc_msgSend(v13, "isMemberOfClass:", objc_opt_class())
        && (objc_msgSend(v17, "lineHeight"), v18 + 2.0 > a4))
      {
        do
        {
          objc_msgSend(v17, "fontWithSize:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v16 + -1.0;
          objc_msgSend(v19, "lineHeight");
          v17 = v19;
        }
        while (v20 + 2.0 > a4);
      }
      else
      {
        v19 = v17;
      }
      if (v10 < 1.0)
      {
        objc_msgSend(v19, "pointSize");
        objc_msgSend(v19, "fontWithSize:", v10 * v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v24;
      }
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(v9, "headingFontSize");
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    if (v10 < 1.0)
    {
      objc_msgSend(v21, "pointSize");
      objc_msgSend(v13, "fontWithSize:", v10 * v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      v13 = v19;
    }
  }

  return v13;
}

- (void)_getLeftMargin:(double *)a3 rightMargin:(double *)a4 forNavigationItem:(id)a5 showingBackButton:(BOOL)a6 visualStyle:(id)a7
{
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  v32 = a5;
  v12 = a7;
  objc_msgSend(v12, "textButtonMarginInNavigationBar:", self->super._navigationBar);
  v14 = v13;
  objc_msgSend(v12, "imageButtonMarginInNavigationBar:", self->super._navigationBar);
  v16 = v15;
  if (a3)
  {
    objc_msgSend(v32, "_firstNonSpaceLeftItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a6 || !v17)
    {
      -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
      v23 = v22;
      objc_msgSend(v12, "horizontalMarginAdjustment");
      v20 = v23 - v24;
      if (v20 < 0.0)
        v20 = 0.0;
    }
    else
    {
      v19 = objc_msgSend(v17, "_isImageBarButtonItem");
      v20 = v14;
      if (v19)
      {
        objc_msgSend(v18, "_leftImagePaddingForEdgeMarginInNavBar", v14);
        v20 = v16 + v21;
      }
    }
    *a3 = v20;

  }
  if (a4)
  {
    objc_msgSend(v32, "_firstNonSpaceRightItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if (objc_msgSend(v25, "_isImageBarButtonItem"))
      {
        objc_msgSend(v26, "_rightImagePaddingForEdgeMarginInNavBar");
        v14 = v16 + v27;
      }
    }
    else
    {
      -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
      v29 = v28;
      objc_msgSend(v12, "horizontalMarginAdjustment");
      v31 = v29 - v30;
      if (v31 >= 0.0)
        v14 = v31;
      else
        v14 = 0.0;
    }
    *a4 = v14;

  }
}

- (void)_getTitleViewFrame:(CGRect *)a3 leftViewFrames:(id)a4 rightViewFrames:(id)a5 forPreviousItem:(id)a6 item:(id)a7 returnedIdealWidthOfTextContent:(double *)a8 availableLayoutWidthForTextContent:(double *)a9 idealBackButtonWidth:(double *)a10
{
  id v15;
  id v16;
  id v17;
  _UINavigationBarVisualProviderLegacyIOS *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  UIView *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  BOOL v37;
  void *v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  _UINavigationBarVisualProviderLegacyIOS *v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  _BOOL8 v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  BOOL v89;
  int v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  size_t v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t v121;
  CGSize v122;
  double v123;
  char v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double Width;
  void *v130;
  void *v131;
  void *v132;
  size_t v133;
  CGRect *v134;
  _BOOL4 v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  unint64_t v149;
  double v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  id v164;
  objc_class *v165;
  id v166;
  id v167;
  void *v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  void *v184;
  void *v185;
  double v186;
  double v187;
  double *p_x;
  double MaxX;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t p_size;
  void *v195;
  int v196;
  double v197;
  double v198;
  double v199;
  double v200;
  void *v201;
  uint64_t v202;
  double v203;
  double v204;
  void *v205;
  void *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  double v210;
  double v211;
  unint64_t v212;
  void *v213;
  double v214;
  double v215;
  double v216;
  double v217;
  unint64_t v218;
  unint64_t v219;
  CGRect *v220;
  void *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  double *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  void *v230;
  double v231;
  double v232;
  double v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  uint64_t v237;
  double v238;
  double v239;
  void *v240;
  void *v241;
  double MinX;
  void *v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  void *v249;
  uint64_t v250;
  double v251;
  _BOOL4 v253;
  double v254;
  int v255;
  double v257;
  double v258;
  double v259;
  double v261;
  double v262;
  double v263;
  unint64_t v264;
  unint64_t v265;
  _BOOL4 v266;
  BOOL v267;
  unint64_t v268;
  CGRect *v269;
  double v270;
  double v271;
  int v272;
  int v273;
  double v274;
  double v275;
  double v276;
  BOOL v277;
  double v278;
  BOOL v279;
  double v280;
  double v281;
  double v282;
  uint64_t v283;
  double *v284;
  uint64_t n;
  unint64_t v286;
  unint64_t v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  _BOOL4 v294;
  CGFloat MidX;
  double v296;
  CGFloat height;
  double x;
  CGFloat y;
  double v300;
  CGRect *v301;
  double v302;
  uint64_t v303;
  double v304;
  double v305;
  uint64_t v306;
  void *v307;
  void *v308;
  double *v309;
  id v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t ii;
  CGFloat v315;
  double v316;
  CGFloat v317;
  double v318;
  double v319;
  _BOOL4 v320;
  unint64_t v321;
  unint64_t v322;
  CGFloat *v323;
  double v324;
  double v325;
  CGRect *v326;
  CGRect *v327;
  unint64_t v328;
  unint64_t v329;
  double v331;
  double v332;
  double v333;
  uint64_t v334;
  double v335;
  double v336;
  void *v337;
  void *v338;
  double *v339;
  id v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t jj;
  double v345;
  double v346;
  CGFloat v347;
  void *v348;
  uint64_t v349;
  void *v350;
  double v351;
  double v352;
  uint64_t v353;
  double *v354;
  uint64_t v355;
  void *v356;
  id v357;
  double v358;
  double v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  void *v368;
  uint64_t v369;
  CGSize *v370;
  void *v371;
  double v372;
  double v373;
  double v374;
  double v375;
  double v376;
  double v377;
  double v378;
  double v379;
  double v380;
  double v381;
  void *v382;
  double v383;
  double *v384;
  void *v385;
  void *v386;
  double v387;
  double v388;
  void *v389;
  double v390;
  double v391;
  void *v392;
  double *v393;
  CGFloat v394;
  CGFloat v395;
  void *v396;
  double v397;
  _BOOL4 v398;
  id v399;
  double v400;
  double v401;
  void *v402;
  int v403;
  void *v404;
  double v405;
  CGFloat v406;
  void *v407;
  double v408;
  CGFloat v409;
  void *v410;
  UIView *v411;
  double rect;
  id rect_16;
  void *rect_24;
  void *v415;
  void *v416;
  size_t count;
  id v419;
  size_t v420;
  void *v421;
  void *v422;
  void *v423;
  char *p_height;
  double v425;
  double *v426;
  void *v427;
  CGRect *v428;
  void *v429;
  void *v430;
  double v431;
  void *v432;
  void *v433;
  double *v434;
  uint64_t v435;
  unint64_t v436;
  int64_t v437;
  double v438;
  id v439;
  double v440;
  uint64_t v442;
  double v443;
  unint64_t v444;
  double *v445;
  double v446;
  double v447;
  double v448;
  void *v449;
  unsigned int v450;
  id v451;
  id obj;
  double v453;
  void *v454;
  unint64_t v455;
  unint64_t v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  double v473;
  double v474;
  double v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  _BYTE v492[128];
  _BYTE v493[128];
  _BYTE v494[128];
  _BYTE v495[128];
  uint64_t v496;
  uint64_t v497;
  _QWORD v498[2];
  _QWORD v499[2];
  _BYTE v500[128];
  _BYTE v501[128];
  _BYTE v502[128];
  _BYTE v503[128];
  uint64_t v504;
  CGRect v505;
  CGRect v506;
  CGRect v507;
  CGRect v508;
  CGRect v509;
  CGRect v510;
  CGRect v511;
  CGRect v512;
  CGRect v513;

  v504 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v419 = a6;
  v17 = a7;
  if (objc_msgSend(v15, "count") || objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v385, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderLegacyIOS.m"), 842, CFSTR("Empty arrays required."));

  }
  v18 = self;
  -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_customLeftViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_customRightViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v416 = v19;
  v21 = objc_msgSend(v19, "count");
  v415 = v20;
  v22 = objc_msgSend(v20, "count");
  v23 = self->_contentView;
  -[UIView window](self->super._navigationBar, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _screen](self->super._navigationBar, "_screen");
  rect_24 = (void *)objc_claimAutoreleasedReturnValue();
  v411 = v23;
  -[UIView bounds](v23, "bounds");
  rect = v25;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[UINavigationBar _effectiveDelegate](self->super._navigationBar, "_effectiveDelegate");
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_fontScaleAdjustment");
  v33 = v32;
  v89 = v32 == 0.0;
  v34 = 1.0;
  if (!v89)
  {
    if ((unint64_t)a8 | (unint64_t)a9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1.0);
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self;
      objc_msgSend(v386, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarVisualProviderLegacyIOS.m"), 865, CFSTR("Not designed for collecting font scale information when already scaling"));

      v34 = v33;
    }
    else
    {
      v34 = v33;
      v18 = self;
    }
  }
  v446 = v34;
  v420 = v21;
  count = v22;
  v35 = MEMORY[0x1E0C9D648];
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](v18, "_backButtonForBackItem:topItem:", v419, v17);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  v422 = v17;
  v36 = fabs(v31);
  v37 = fabs(v29) < 1.0 || v36 < 1.0;
  v433 = v24;
  if (v37)
  {
    objc_msgSend(v17, "titleView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a3)
    {
      if (!v38)
      {
        v122 = *(CGSize *)(v35 + 16);
        a3->origin = *(CGPoint *)v35;
        a3->size = v122;
        if (v15)
          goto LABEL_15;
        goto LABEL_29;
      }
      objc_msgSend(v38, "frame");
      a3->origin.x = v40;
      a3->origin.y = v41;
      a3->size.width = v42;
      a3->size.height = v43;
    }
    if (v15)
    {
LABEL_15:
      if (v421
        && (objc_msgSend(v17, "hidesBackButton") & 1) == 0
        && ((objc_msgSend(v17, "leftItemsSupplementBackButton") & 1) != 0 || !objc_msgSend(v416, "count")))
      {
        objc_msgSend(v421, "frame");
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v51 = v50;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v52);

        if (a10)
        {
          v505.origin.x = v45;
          v505.origin.y = v47;
          v505.size.width = v49;
          v505.size.height = v51;
          *a10 = CGRectGetWidth(v505);
        }
      }
      v491 = 0u;
      v489 = 0u;
      v490 = 0u;
      v488 = 0u;
      v53 = v416;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v488, v503, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v489;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v489 != v56)
              objc_enumerationMutation(v53);
            v58 = (void *)MEMORY[0x1E0CB3B18];
            objc_msgSend(*(id *)(*((_QWORD *)&v488 + 1) + 8 * i), "frame");
            objc_msgSend(v58, "valueWithCGRect:");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v59);

          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v488, v503, 16);
        }
        while (v55);
      }

      v17 = v422;
    }
LABEL_29:
    if (v16)
    {
      v486 = 0u;
      v487 = 0u;
      v484 = 0u;
      v485 = 0u;
      v60 = v415;
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v484, v502, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v485;
        do
        {
          for (j = 0; j != v62; ++j)
          {
            if (*(_QWORD *)v485 != v63)
              objc_enumerationMutation(v60);
            v65 = (void *)MEMORY[0x1E0CB3B18];
            objc_msgSend(*(id *)(*((_QWORD *)&v484 + 1) + 8 * j), "frame");
            objc_msgSend(v65, "valueWithCGRect:");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v66);

          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v484, v502, 16);
        }
        while (v62);
      }

      v17 = v422;
    }
    if (a8)
      *a8 = 0.0;
    if (a9)
      *a9 = 0.0;

    goto LABEL_428;
  }
  v393 = a8;
  rect_16 = v16;
  v482 = 0u;
  v483 = 0u;
  v480 = 0u;
  v481 = 0u;
  v67 = v416;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v480, v501, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v481;
    do
    {
      for (k = 0; k != v69; ++k)
      {
        if (*(_QWORD *)v481 != v70)
          objc_enumerationMutation(v67);
        v72 = *(void **)(*((_QWORD *)&v480 + 1) + 8 * k);
        if (objc_msgSend(v72, "_appearanceIsInvalid"))
          +[_UIAppearance _applyInvocationsTo:window:](_UIAppearance, "_applyInvocationsTo:window:", v72, v24);
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v480, v501, 16);
    }
    while (v69);
  }

  v478 = 0u;
  v479 = 0u;
  v476 = 0u;
  v477 = 0u;
  obj = v415;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v476, v500, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v477;
    do
    {
      for (m = 0; m != v74; ++m)
      {
        if (*(_QWORD *)v477 != v75)
          objc_enumerationMutation(obj);
        v77 = *(void **)(*((_QWORD *)&v476 + 1) + 8 * m);
        if (objc_msgSend(v77, "_appearanceIsInvalid"))
          +[_UIAppearance _applyInvocationsTo:window:](_UIAppearance, "_applyInvocationsTo:window:", v77, v24);
      }
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v476, v500, 16);
    }
    while (v74);
  }

  v78 = self;
  if (!v421
    || (objc_msgSend(v17, "hidesBackButton") & 1) != 0
    || objc_msgSend(v67, "count") && (objc_msgSend(v17, "leftItemsSupplementBackButton") & 1) == 0)
  {
    v81 = objc_msgSend(v17, "_wantsBackButtonIndicator");
    v80 = 0;
    v79 = v81;
  }
  else
  {
    v79 = 0;
    v80 = 1;
    v81 = 1;
  }
  v437 = -[UINavigationBar _activeBarMetrics](self->super._navigationBar, "_activeBarMetrics");
  v82 = -[UINavigationBar isMinibar](self->super._navigationBar, "isMinibar");
  v475 = 0.0;
  v474 = 0.0;
  if (objc_msgSend(rect_24, "_userInterfaceIdiom") == 2 || objc_msgSend(rect_24, "_userInterfaceIdiom") == 8)
  {
    objc_msgSend(rect_24, "overscanCompensationInsets");
    v84 = v83;
    v86 = v85;
    v475 = v83;
    v474 = v85;
  }
  else
  {
    -[_UINavigationBarVisualProviderLegacyIOS _getLeftMargin:rightMargin:forNavigationItem:showingBackButton:visualStyle:](self, "_getLeftMargin:rightMargin:forNavigationItem:showingBackButton:visualStyle:", &v475, &v474, v17, v81, v423);
    v84 = v475;
    v86 = v474;
  }
  objc_msgSend(v423, "buttonHeight");
  v88 = v87;
  if (-[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self->super._navigationBar))
  {
    v89 = v437 == 1 || v437 == 102;
    v90 = v89;
    _UINavigationButtonAccessibilityBackground(0, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "size");
    v88 = v92;

  }
  v391 = v84;
  v93 = v86 + v84;
  objc_msgSend(v423, "topMargin");
  UIRoundToViewScale(self->super._navigationBar);
  v95 = v94;
  -[UINavigationBar _appearanceStorage](self->super._navigationBar, "_appearanceStorage");
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "title");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "titleView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v407 = v96;
  if (v97)
    v398 = 0;
  else
    v398 = objc_msgSend(v96, "length") != 0;
  v448 = v29 - v93;
  v453 = v27 + v95;

  objc_msgSend(v17, "titleView");
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v394 = v31;
  v395 = v27;
  if (v404)
  {
    objc_msgSend(v17, "titleView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "frame");
    v100 = v99;
    v409 = v101;

    objc_msgSend(v17, "_idealCustomTitleWidth");
    if (v102 > v100)
    {
      objc_msgSend(v17, "_idealCustomTitleWidth");
      v100 = v103;
    }
    objc_msgSend(v17, "_titleViewWidthForAnimations");
    v104 = v420;
    if (v105 != 0.0)
    {
      objc_msgSend(v17, "_titleViewWidthForAnimations");
      v100 = v106;
    }
    objc_msgSend(v17, "titleView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "sizeThatFits:", v448, v88);
    v387 = fmin(v100, 1000.0);
    v109 = fmax(v387, v108);

    v408 = v109;
    v110 = v448 - v109;
    if (v398)
    {
      v396 = 0;
LABEL_96:
      v123 = 0.0;
      goto LABEL_97;
    }
LABEL_95:
    objc_msgSend(v402, "titleVerticalAdjustmentForBarMetrics:", v437);
    v396 = 0;
    goto LABEL_96;
  }
  if (!v398)
  {
    v408 = *(double *)(v35 + 16);
    v409 = *(double *)(v35 + 24);
    v387 = 0.0;
    v110 = v29 - v93;
    v104 = v420;
    goto LABEL_95;
  }
  objc_msgSend(v423, "topTitleMargin");
  UIRoundToViewScale(self->super._navigationBar);
  v112 = v111;
  objc_msgSend(v17, "_fontScaleAdjustment");
  v409 = v112;
  -[_UINavigationBarVisualProviderLegacyIOS _defaultTitleFontForItem:fittingHeight:withScaleAdjustment:](self, "_defaultTitleFontForItem:fittingHeight:withScaleAdjustment:", v17, v112, v113);
  v114 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v402, "textAttributes");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = *(_QWORD *)off_1E1679048;
  objc_msgSend(v115, "objectForKey:", *(_QWORD *)off_1E1679048);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v396 = (void *)v114;
  if (v117)
  {
    v498[0] = *(_QWORD *)off_1E1678D90;
    v498[1] = v116;
    v499[0] = v114;
    v499[1] = v117;
    v118 = (void *)MEMORY[0x1E0C99D80];
    v119 = v499;
    v120 = v498;
    v121 = 2;
  }
  else
  {
    v496 = *(_QWORD *)off_1E1678D90;
    v497 = v114;
    v118 = (void *)MEMORY[0x1E0C99D80];
    v119 = &v497;
    v120 = &v496;
    v121 = 1;
  }
  objc_msgSend(v118, "dictionaryWithObjects:forKeys:count:", v119, v120, v121);
  v164 = (id)objc_claimAutoreleasedReturnValue();

  v165 = (objc_class *)MEMORY[0x1E0CB3498];
  v166 = v164;
  v167 = v407;
  v168 = (void *)objc_msgSend([v165 alloc], "initWithString:attributes:", v167, v166);

  objc_msgSend(v168, "size");
  v170 = v169;

  objc_msgSend(v423, "minTitleWidth");
  v408 = v170;
  v387 = fmin(v170, v171);
  v123 = fmax(v387, v170) + 0.0;

  v110 = v448;
  v17 = v422;
  v104 = v420;
LABEL_97:
  -[_UIBarBackgroundLayoutLegacy shadowImage](self->_backgroundViewLayout, "shadowImage");
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  if (v392)
    v124 = v82;
  else
    v124 = 1;
  if ((v124 & 1) == 0)
  {
    objc_msgSend(v17, "titleView");

  }
  UIRoundToViewScale(self->super._navigationBar);
  v406 = v125;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  v455 = v104 + v80;
  if (v455)
  {
    v434 = (double *)malloc_type_calloc(v104 + v80, 0x20uLL, 0x1000040E0EAB150uLL);
    v445 = (double *)malloc_type_calloc(v104, 8uLL, 0x100004000313F17uLL);
  }
  else
  {
    v434 = 0;
    v445 = 0;
  }
  objc_msgSend(v17, "_leftItemSpaceList");
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  v399 = v15;
  v401 = v29;
  v126 = v88;
  if (!v80)
  {
    v149 = 0;
    v403 = 0;
    v150 = 0.0;
    v388 = 0.0;
    v133 = v455;
    v134 = (CGRect *)v434;
    goto LABEL_143;
  }
  objc_msgSend(v423, "minBackTextWidth");
  v128 = v127;
  -[UIView frame](self->_backIndicatorView, "frame");
  Width = CGRectGetWidth(v506);
  objc_msgSend(v421, "_appearanceStorage");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v421, "backgroundImageView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "image");
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = v104 + v80;
  v134 = (CGRect *)v434;
  if (v132)
    goto LABEL_113;
  objc_msgSend(v130, "backButtonBackgroundImageForState:isMini:", 0, v82);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if (v132)
    v135 = 0;
  else
    v135 = v82;
  if (v135)
  {
    objc_msgSend(v130, "backButtonBackgroundImageForState:isMini:", 0, 0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v132)
    goto LABEL_113;
  v139 = 0.0;
  if (-[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self->super._navigationBar))
  {
    _UINavigationButtonAccessibilityBackground(1, v82);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (v132)
    {
LABEL_113:
      objc_msgSend(v132, "capInsets");
      v137 = v136;
      v139 = v138;
      goto LABEL_114;
    }
  }
  else
  {
    v132 = 0;
  }
  v137 = 0.0;
LABEL_114:
  objc_msgSend(v421, "image");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (v140)
  {
    objc_msgSend(v423, "leftBackImageMargin");
    v142 = fmax(v137, v141);
    objc_msgSend(v423, "rightImageMargin");
    v144 = fmax(v139, v143);
    objc_msgSend(v421, "imageSize");
    v146 = v144 + v142 + v145;
    objc_msgSend(v423, "minBackImageWidth");
    v403 = 0;
    v148 = fmax(v146, v144 + v142 + v147);
    v388 = v148;
  }
  else
  {
    v148 = v128 + Width;
    objc_msgSend(v421, "title");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v419, "_abbreviatedBackButtonTitles");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "lastObject");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v403 = objc_msgSend(v151, "isEqualToString:", v153);

    if (v151)
    {
      v388 = v148;
      v133 = v455;
      v134 = (CGRect *)v434;
      if (objc_msgSend(v151, "length"))
      {
        objc_msgSend(v421, "_defaultFont");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v423, "leftBackTitleMarginForCustomBackButtonBackground:", v132);
        v156 = v155;
        objc_msgSend(v423, "rightTitleMargin");
        v158 = v156 + v446 * fmax(v139, v157);
        objc_msgSend(v423, "backButtonIndicatorSpacing");
        v160 = (v446 + -1.0) * v159 + v158;
        v134 = (CGRect *)v434;
        objc_msgSend(v423, "minBackTextWidth");
        v162 = v161 + v160;
        objc_msgSend(v151, "_legacy_sizeWithFont:", v154);
        v388 = v162;
        v148 = fmax(v163 + v160, v162);

        v133 = v455;
      }
    }
    else
    {
      v388 = v148;
      v133 = v455;
      v134 = (CGRect *)v434;
    }

  }
  if (a10)
    *a10 = v148;
  objc_msgSend(v423, "maxBackButtonProportion");
  v173 = v172;
  v507.origin.x = rect;
  v507.size.height = v394;
  v507.origin.y = v395;
  v507.size.width = v29;
  v174 = floor(v173 * CGRectGetWidth(v507));
  -[UINavigationBar _requestedMaxBackButtonWidth](self->super._navigationBar, "_requestedMaxBackButtonWidth");
  if (v175 > 0.0)
  {
    -[UINavigationBar _requestedMaxBackButtonWidth](self->super._navigationBar, "_requestedMaxBackButtonWidth");
    v174 = fmin(v174, v176);
  }
  v150 = fmin(v148, v174);
  if (v140)
  {
    v177 = v150;
  }
  else
  {
    objc_msgSend(v423, "backButtonIndicatorSpacing");
    v177 = v446 * v178;
    v123 = v123 + v150 - v446 * v178;
  }
  -[UINavigationBar defaultBackButtonAlignmentHeight](self->super._navigationBar, "defaultBackButtonAlignmentHeight");
  v134->size.width = v150;
  v134->size.height = v179;
  v134->origin.y = v453 + floor((v126 - v179) * 0.5);
  v473 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v421, "_hasBaselineAlignedAbsoluteVerticalPosition:withinNavBar:forSize:", &v473, self->super._navigationBar, v134->size.width, v134->size.height))
  {
    v180 = v473;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v421, "_backgroundVerticalPositionAdjustmentForBarMetrics:", v437);
      v134->origin.y = v181 + v134->origin.y;
    }
    if ((objc_msgSend(v421, "hasCustomBackgroundImage") & 1) != 0)
      goto LABEL_142;
    v180 = v134->origin.y + -1.0;
  }
  v134->origin.y = v180;
LABEL_142:
  v110 = v110 - v177;

  v149 = 1;
  v78 = self;
LABEL_143:
  objc_msgSend(v423, "interItemSpace");
  v183 = v182;
  if (v149 >= v133)
    goto LABEL_157;
  objc_msgSend(v449, "objectAtIndex:", v149 - v80);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v184;
  if (!v184 || v184 == v454)
  {
    v186 = 0.0;
    if (v80 | v79)
      v186 = v183;
  }
  else
  {
    v186 = totalSpaceForSpaceItems(v184, v80, v183);
  }
  if (v403)
    v186 = v186 + v186;
  v187 = v446 * v186;
  v445[v149 - v80] = v446 * v186;
  p_x = &v134[v149].origin.x;
  *p_x = v446 * v186;
  if (v80)
  {
    MaxX = CGRectGetMaxX(*v134);
LABEL_155:
    *p_x = MaxX + *p_x;
    goto LABEL_156;
  }
  if (v79)
  {
    -[UIView frame](v78->_backIndicatorView, "frame");
    MaxX = CGRectGetWidth(v508);
    goto LABEL_155;
  }
LABEL_156:
  v123 = v123 + v187;

LABEL_157:
  v397 = v150;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  v469 = 0u;
  v470 = 0u;
  v471 = 0u;
  v472 = 0u;
  v451 = v67;
  v190 = objc_msgSend(v451, "countByEnumeratingWithState:objects:count:", &v469, v495, 16);
  v450 = v80;
  if (v190)
  {
    v191 = v190;
    v435 = 0;
    v192 = *(_QWORD *)v470;
    do
    {
      v193 = 0;
      p_size = (uint64_t)&v134[v149].size;
      do
      {
        if (*(_QWORD *)v470 != v192)
          objc_enumerationMutation(v451);
        v195 = *(void **)(*((_QWORD *)&v469 + 1) + 8 * v193);
        v196 = _barItemHidden(v195);
        if (v196)
        {
          *(_QWORD *)(p_size - 8) = 0;
          *(_OWORD *)p_size = *MEMORY[0x1E0C9D820];
          goto LABEL_179;
        }
        if (objc_msgSend(v195, "_appearanceIsInvalid"))
          objc_msgSend(v195, "layoutBelowIfNeeded");
        objc_msgSend(v195, "frame");
        objc_msgSend(v195, "alignmentRectForFrame:");
        v198 = v197;
        v200 = v199;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v195, "titleForState:", 0),
              v201 = (void *)objc_claimAutoreleasedReturnValue(),
              v202 = objc_msgSend(v201, "length"),
              v201,
              v202))
        {
          v123 = v123 + v198;
          objc_msgSend(v429, "addIndex:", v435 + v193);
        }
        else
        {
          v110 = v110 - v198;
        }
        *(double *)p_size = v198;
        *(double *)(p_size + 8) = v200;
        *(double *)(p_size - 8) = v453 + floor((v126 - v200) * 0.5);
        v473 = 0.0;
        v80 = v450;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v195, "_hasBaselineAlignedAbsoluteVerticalPosition:withinNavBar:forSize:", &v473, self->super._navigationBar, v434[2], v434[3]))
        {
          v203 = v473;
LABEL_178:
          *(double *)(p_size - 8) = v203;
          goto LABEL_179;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v195, "_backgroundVerticalPositionAdjustmentForBarMetrics:", v437);
          *(double *)(p_size - 8) = v204 + *(double *)(p_size - 8);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v195, "_appearanceStorage");
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "anyBackgroundImage");
          v206 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v206)
          {
            v203 = *(double *)(p_size - 8) + -1.0;
            goto LABEL_178;
          }
        }
LABEL_179:
        if (v149 + v193 + 1 < v455)
        {
          if (v80)
            v207 = v149 + v193;
          else
            v207 = v149 + v193 + 1;
          objc_msgSend(v449, "objectAtIndex:", v207);
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          v209 = v208;
          if (!v208 || v208 == v454)
          {
            if (v196)
              v210 = 0.0;
            else
              v210 = v183;
          }
          else
          {
            v210 = totalSpaceForSpaceItems(v208, v196 ^ 1u, v183);
          }
          v211 = v446 * v210;
          v445[v207] = v446 * v210;
          *(double *)(p_size + 16) = v446 * v210 + CGRectGetMaxX(*(CGRect *)(p_size - 16));
          v123 = v123 + v211;

        }
        ++v193;
        p_size += 32;
      }
      while (v191 != v193);
      v191 = objc_msgSend(v451, "countByEnumeratingWithState:objects:count:", &v469, v495, 16);
      v435 += v193;
      v149 += v193;
    }
    while (v191);
  }

  v212 = v420;
  objc_msgSend(v449, "objectAtIndex:", v420);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v423, "interBlockSpace");
  v215 = v214;
  v216 = 0.0;
  v217 = 0.0;
  if (v213 && v213 != v454)
  {
    v217 = totalSpaceForSpaceItems(v213, 0, v183);
    v216 = 0.0;
  }
  v390 = v217;
  v15 = v399;
  v16 = rect_16;
  v17 = v422;
  v24 = v433;
  v218 = count;
  v219 = v455;
  if (v434)
    v216 = CGRectGetMaxX(*(CGRect *)&v434[4 * v455 - 4]);
  v389 = v213;
  v405 = v216;
  if (count)
  {
    v220 = (CGRect *)malloc_type_calloc(count, 0x20uLL, 0x1000040E0EAB150uLL);
    v426 = (double *)malloc_type_calloc(count, 8uLL, 0x100004000313F17uLL);
  }
  else
  {
    v220 = 0;
    v426 = 0;
  }
  objc_msgSend(v422, "_rightItemSpaceList");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  v428 = v220;
  v432 = v221;
  if (v220 && v426)
  {
    v467 = 0u;
    v468 = 0u;
    v465 = 0u;
    v466 = 0u;
    v439 = obj;
    v222 = objc_msgSend(v439, "countByEnumeratingWithState:objects:count:", &v465, v494, 16);
    if (!v222)
      goto LABEL_235;
    v223 = v222;
    v224 = 0;
    v442 = *(_QWORD *)v466;
    p_height = (char *)&v220->size.height;
    while (1)
    {
      v225 = 0;
      v226 = (double *)&p_height[32 * v224];
      do
      {
        if (*(_QWORD *)v466 != v442)
          objc_enumerationMutation(v439);
        v227 = v224 + v225;
        v228 = *(void **)(*((_QWORD *)&v465 + 1) + 8 * v225);
        objc_msgSend(v221, "objectAtIndex:", v224 + v225);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        v230 = v229;
        if (!v229 || v229 == v454)
        {
          if (v227)
            v231 = v183;
          else
            v231 = 0.0;
        }
        else
        {
          v231 = totalSpaceForSpaceItems(v229, v227 != 0, v183);
        }
        v426[v224 + v225] = v231;
        if (_barItemHidden(v228))
        {
          *(v226 - 2) = 0.0;
          *(_OWORD *)(v226 - 1) = *MEMORY[0x1E0C9D820];
          goto LABEL_231;
        }
        if (objc_msgSend(v228, "_appearanceIsInvalid"))
          objc_msgSend(v228, "layoutBelowIfNeeded");
        objc_msgSend(v228, "frame");
        objc_msgSend(v228, "alignmentRectForFrame:");
        v233 = v232;
        v235 = v234;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v228, "titleForState:", 0),
              v236 = (void *)objc_claimAutoreleasedReturnValue(),
              v237 = objc_msgSend(v236, "length"),
              v236,
              v221 = v432,
              v237))
        {
          v123 = v123 + v233;
          objc_msgSend(v427, "addIndex:", v224 + v225);
        }
        else
        {
          v110 = v110 - v233;
        }
        *(v226 - 1) = v233;
        *(_QWORD *)v226 = v235;
        v473 = 0.0;
        v24 = v433;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v228, "_hasBaselineAlignedAbsoluteVerticalPosition:withinNavBar:forSize:", &v473, self->super._navigationBar, v428->size.width, v428->size.height))
        {
          v238 = v473;
        }
        else
        {
          *(v226 - 2) = v453 + floor((v126 - *v226) * 0.5);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v228, "_backgroundVerticalPositionAdjustmentForBarMetrics:", v437);
            *(v226 - 2) = v239 + *(v226 - 2);
          }
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_230;
          objc_msgSend(v228, "_appearanceStorage");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "anyBackgroundImage");
          v241 = (void *)objc_claimAutoreleasedReturnValue();

          v221 = v432;
          if (v241)
            goto LABEL_230;
          v238 = *(v226 - 2) + -1.0;
        }
        *(v226 - 2) = v238;
LABEL_230:
        v110 = v110 - v231;
LABEL_231:
        MinX = v448;
        if (v227)
          MinX = CGRectGetMinX(*(CGRect *)(v226 - 7));
        *(v226 - 3) = MinX - v231 - *(v226 - 1);

        ++v225;
        v226 += 4;
      }
      while (v223 != v225);
      v223 = objc_msgSend(v439, "countByEnumeratingWithState:objects:count:", &v465, v494, 16);
      v224 += v225;
      if (!v223)
      {
LABEL_235:

        v15 = v399;
        v16 = rect_16;
        v17 = v422;
        v218 = count;
        v80 = v450;
        v212 = v420;
        v219 = v455;
        break;
      }
    }
  }
  objc_msgSend(v221, "objectAtIndex:", v218);
  v243 = (void *)objc_claimAutoreleasedReturnValue();

  v244 = 0.0;
  v245 = 0.0;
  if (v243 && v243 != v454)
  {
    v245 = totalSpaceForSpaceItems(v243, 0, v183);
    v244 = 0.0;
  }
  v430 = v243;
  if (v428)
  {
    v246 = CGRectGetMaxX(*v428);
    v244 = v246 - CGRectGetMinX(v428[v218 - 1]);
  }
  v247 = v215;
  v248 = fmax(v215, v390);
  v440 = v244;
  if (v80)
  {
    objc_msgSend(v421, "title");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = objc_msgSend(v249, "length");
    v251 = v405;
    v253 = v408 > v448 - v405 - v440 && v250 == 0;

    v244 = v440;
  }
  else
  {
    v253 = 0;
    v251 = v405;
  }
  v254 = fmax(v247, v245);
  v255 = v253 & (v403 ^ 1);
  if (v251 == 0.0)
    v255 = 1;
  if (v244 == 0.0 && v408 == 0.0)
    v257 = 0.0;
  else
    v257 = v248;
  if (v255)
    v258 = 0.0;
  else
    v258 = v257;
  if (((v403 ^ 1) & 1) == 0 && !objc_msgSend(v451, "count", v257))
    v258 = v258 + v258;
  v259 = rect + v391;
  if (v408 == 0.0 || v440 == 0.0)
    v261 = 0.0;
  else
    v261 = v254;
  v438 = v446 * v261;
  v431 = v446 * v258;
  v400 = v446 * v261 + v446 * v258;
  v262 = v448 - (v408 + v405 + v440 + v400);
  if (v262 >= 0.0)
  {
    v277 = 0;
    v268 = v218;
    v276 = v408;
    v282 = v408;
    v280 = v401;
    v269 = v428;
    goto LABEL_304;
  }
  v263 = v408 + v397 + v262;
  if (v446 < 1.0 && v263 < v387 + v388 && (v212 > 1 || v218 >= 2))
  {
    v264 = v212 ? v80 + 1 : v80;
    v265 = v218 != 0;
    v266 = v218 > v265;
    v267 = v219 > v264;
    if (v219 > v264 || v218 > v265)
    {
      v320 = v218 - v265 > v219 - v264;
      v268 = v218;
      v269 = v428;
      v444 = v264;
      while (!v267 || v320 && v268 != v265)
      {
        if (v266 && (v320 || v219 == v264))
        {
          v456 = v219;
          v328 = v268 - 1;
          v329 = v268;
          v327 = &v269[v268 - 1];
          v324 = v327->size.width;
          v326 = v269;
          v325 = CGRectGetMinX(v269[v329 - 2]);
          v321 = v328;
          v219 = v456;
          goto LABEL_357;
        }
LABEL_358:
        v263 = v408 + v397 + v262;
        if (v262 < 0.0 && v263 < v387 + v388)
        {
          v266 = v268 > v265;
          v320 = v268 - v265 > v219 - v264;
          v267 = v219 > v264;
          if (v219 > v264 || v268 > v265)
            continue;
        }
        goto LABEL_281;
      }
      v321 = v268;
      v322 = v219--;
      v323 = &v434[4 * v219];
      v512.origin.x = *v323;
      v512.origin.y = v323[1];
      v324 = v323[2];
      v512.size.height = v323[3];
      v512.size.width = v324;
      v325 = CGRectGetMinX(v512);
      v326 = v428;
      v327 = (CGRect *)&v434[4 * v322 - 8];
LABEL_357:
      v262 = v262 + v324 + v325 - CGRectGetMaxX(*v327);
      v268 = v321;
      v269 = v326;
      v264 = v444;
      goto LABEL_358;
    }
  }
  v268 = v218;
  v269 = v428;
LABEL_281:
  v270 = fmin(v397, fmax(v263 * 0.4, v388));
  v271 = fmin(v408, fmax(v263 - v270, v387));
  v272 = v80 ^ 1;
  if (v271 >= v408)
    v272 = 1;
  v273 = v272 | v403;
  v274 = fmin(v408, v270 - v388 + v271);
  if (v273)
    v275 = v270;
  else
    v275 = v388;
  if (v273)
    v276 = v271;
  else
    v276 = v274;
  v277 = v276 + v275 > v263;
  v262 = v263 - (v276 + v275);
  UIRoundToViewScale(self->super._navigationBar);
  if (v278 <= 0.0)
  {
    v280 = v401;
  }
  else
  {
    v279 = v275 < v397 || v276 < v408;
    v280 = v401;
    if (v279)
    {
      if (v276 == v408)
      {
        v281 = fmin(v262, v397 - v275);
        v262 = v262 - v281;
        v275 = v275 + v281;
      }
      else
      {
        v331 = v408 - v276;
        if (v275 == v397)
        {
          v332 = fmin(v262, v331);
          v262 = v262 - v332;
        }
        else
        {
          v383 = fmin(v262 * 0.4, v397 - v275);
          v332 = fmin(v262 - v383, v331);
          v262 = v262 - (v383 + v332);
          v275 = v275 + v383;
        }
        v276 = v276 + v332;
      }
    }
  }
  v455 = v219;
  if (v80)
  {
    UIRoundToViewScale(self->super._navigationBar);
    *((_QWORD *)v434 + 2) = v283;
    if (v219 >= 2)
    {
      v284 = v434 + 4;
      for (n = 1; n != v219; ++n)
      {
        *v284 = *v284 - (v397 - v275);
        v284 += 4;
      }
    }
  }
  v282 = v408;
LABEL_304:
  v286 = objc_msgSend(v17, "_leftFlexibleSpaceCount");
  v436 = objc_msgSend(v17, "_rightFlexibleSpaceCount");
  v447 = v276;
  v443 = (v280 - v276) * 0.5 - v259;
  v287 = v268;
  if (v282 != 0.0)
  {
    if (v434)
      v288 = CGRectGetMaxX(*(CGRect *)&v434[4 * v455 - 4]);
    else
      v288 = 0.0;
    v425 = v288;
    v289 = v448;
    if (v269)
      v289 = CGRectGetMinX(v269[v268 - 1]);
    v509.origin.x = (v280 - v276) * 0.5 - v259;
    v509.origin.y = v406;
    v290 = v276;
    v509.size.width = v276;
    v509.size.height = v409;
    if (CGRectGetMinX(v509) < v431 + v425
      || (v510.origin.x = v443,
          v510.origin.y = v406,
          v510.size.width = v276,
          v510.size.height = v409,
          CGRectGetMaxX(v510) > v289 - v438))
    {
      v291 = fmin(v289 - v425 - v431 - v438, v408) - v276;
      if (v398)
      {
        objc_msgSend(v407, "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v396, 4, v447 + v291, 0.0);
        v290 = v447;
        v291 = fmax(v292 + 1.0 - v447, 0.0);
      }
      v293 = v290 + v291;
      if ((v286 != 0) != (v436 != 0))
      {
        v294 = v286 == 0;
      }
      else
      {
        v511.origin.x = rect + v391;
        v511.origin.y = v453;
        v511.size.width = v448;
        v511.size.height = v126;
        MidX = CGRectGetMidX(v511);
        v294 = v425 - MidX > MidX - v289;
      }
      v262 = v262 - v291;
      v447 = v293;
      v296 = v289 - v438 - v293;
      if (v294)
        v296 = v431 + v425;
      v443 = v296;
    }
    v280 = v401;
  }
  if (v262 <= 0.0 || !(v286 | v436))
    goto LABEL_384;
  if (v434 && v286)
  {
    height = v409;
    x = v443;
    y = v406;
    v300 = v447;
    if (v408 == 0.0)
    {
      if (v440 == 0.0)
        goto LABEL_329;
      v301 = &v428[v268];
      x = v301[-1].origin.x;
      y = v301[-1].origin.y;
      v300 = v301[-1].size.width;
      height = v301[-1].size.height;
    }
    v448 = CGRectGetMinX(*(CGRect *)&x);
LABEL_329:
    v302 = CGRectGetMaxX(*(CGRect *)&v434[4 * v455 - 4]);
    if (v420)
    {
      v303 = 0;
      v304 = (v448 - v431 - v302) / (double)v286;
      v305 = 0.0;
      do
      {
        if (v80)
          v306 = v303 + 1;
        else
          v306 = v303;
        objc_msgSend(v449, "objectAtIndex:", v303);
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        v308 = v307;
        v309 = &v434[4 * v306];
        *v309 = v305 + *v309;
        if (v307 && v307 != v454)
        {
          v463 = 0u;
          v464 = 0u;
          v461 = 0u;
          v462 = 0u;
          v310 = v307;
          v311 = objc_msgSend(v310, "countByEnumeratingWithState:objects:count:", &v461, v493, 16);
          if (v311)
          {
            v312 = v311;
            v313 = *(_QWORD *)v462;
            do
            {
              for (ii = 0; ii != v312; ++ii)
              {
                if (*(_QWORD *)v462 != v313)
                  objc_enumerationMutation(v310);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v461 + 1) + 8 * ii), "systemItem") == 5)
                {
                  *v309 = v304 + *v309;
                  v305 = v304 + v305;
                }
              }
              v312 = objc_msgSend(v310, "countByEnumeratingWithState:objects:count:", &v461, v493, 16);
            }
            while (v312);
          }

          v16 = rect_16;
          v17 = v422;
          v24 = v433;
        }
        ++v303;

        v80 = v450;
      }
      while (v303 != v420);
    }
  }
  if (v428 && v436)
  {
    v315 = v409;
    v316 = v443;
    v317 = v406;
    v318 = v447;
    if (v408 == 0.0)
    {
      v319 = 0.0;
      if (v405 == 0.0)
      {
LABEL_369:
        v333 = CGRectGetMinX(v428[v287 - 1]);
        if (count)
        {
          v334 = 0;
          v335 = (v333 - (v438 + v319)) / (double)v436;
          v336 = 0.0;
          do
          {
            objc_msgSend(v432, "objectAtIndex:", v334);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            v338 = v337;
            v339 = &v428[v334].origin.x;
            *v339 = *v339 - v336;
            if (v337 && v337 != v454)
            {
              v459 = 0u;
              v460 = 0u;
              v457 = 0u;
              v458 = 0u;
              v340 = v337;
              v341 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v457, v492, 16);
              if (v341)
              {
                v342 = v341;
                v343 = *(_QWORD *)v458;
                do
                {
                  for (jj = 0; jj != v342; ++jj)
                  {
                    if (*(_QWORD *)v458 != v343)
                      objc_enumerationMutation(v340);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v457 + 1) + 8 * jj), "systemItem") == 5)
                    {
                      *v339 = *v339 - v335;
                      v336 = v335 + v336;
                    }
                  }
                  v342 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v457, v492, 16);
                }
                while (v342);
              }

              v16 = rect_16;
              v17 = v422;
              v24 = v433;
            }

            ++v334;
            v80 = v450;
          }
          while (v334 != count);
        }
        goto LABEL_384;
      }
      v384 = &v434[4 * v455];
      v316 = *(v384 - 4);
      v317 = *(v384 - 3);
      v318 = *(v384 - 2);
      v315 = *(v384 - 1);
    }
    v319 = CGRectGetMaxX(*(CGRect *)&v316);
    goto LABEL_369;
  }
LABEL_384:

  if (a3)
  {
    UIRoundToViewScale(self->super._navigationBar);
    v443 = v345;
    UICeilToViewScale(self->super._navigationBar);
    v347 = v346;
    v348 = v407;
    v447 = v346;
    if (!v277)
    {
      objc_msgSend(v17, "titleView");
      v349 = objc_claimAutoreleasedReturnValue();
      v347 = v447;
      if (v349)
      {
        v350 = (void *)v349;
        objc_msgSend(v17, "_idealCustomTitleWidth");
        v352 = v351;

        v347 = v447;
        if (v352 == 0.0)
        {
          objc_msgSend(v17, "_setIdealCustomTitleWidth:", v447);
          v347 = v447;
        }
      }
    }
    a3->origin.x = v443;
    a3->origin.y = v406;
    a3->size.width = v347;
    a3->size.height = v409;
  }
  else
  {
    v348 = v407;
  }
  if (v434)
  {
    if (v15 && v455)
    {
      v353 = 0;
      v354 = v434 + 2;
      do
      {
        if (v80)
        {
          if (!v353)
          {
            v357 = v421;
            goto LABEL_400;
          }
          v355 = v353 - 1;
          v356 = v451;
        }
        else
        {
          v356 = v451;
          v355 = v353;
        }
        objc_msgSend(v356, "objectAtIndex:", v355);
        v357 = (id)objc_claimAutoreleasedReturnValue();

LABEL_400:
        v358 = *(v354 - 1);
        v359 = v354[1];
        UIRoundToViewScale(self->super._navigationBar);
        v361 = v360;
        UICeilToViewScale(self->super._navigationBar);
        v363 = v362;
        if ((_barItemHidden(v357) & 1) == 0)
        {
          objc_msgSend(v357, "frameForAlignmentRect:", v361, v358, v363, v359);
          v361 = v364;
          v358 = v365;
          v363 = v366;
          v359 = v367;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v361, v358, v363, v359);
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v368);

        ++v353;
        v354 += 4;
      }
      while (v455 != v353);
    }
    free(v434);
    free(v445);
    v17 = v422;
    v348 = v407;
  }
  if (v428)
  {
    if (v16 && v287)
    {
      v369 = 0;
      v370 = &v428->size;
      do
      {
        objc_msgSend(obj, "objectAtIndex:", v369);
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        v372 = v370[-1].height;
        v373 = v370->height;
        UIRoundToViewScale(self->super._navigationBar);
        v375 = v374;
        UICeilToViewScale(self->super._navigationBar);
        v377 = v376;
        if ((_barItemHidden(v371) & 1) == 0)
        {
          objc_msgSend(v371, "frameForAlignmentRect:", v375, v372, v377, v373);
          v375 = v378;
          v372 = v379;
          v377 = v380;
          v373 = v381;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v375, v372, v377, v373);
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v382);

        ++v369;
        v370 += 2;
      }
      while (v287 != v369);
    }
    free(v428);
    free(v426);
    v17 = v422;
    v348 = v407;
  }
  if ((*((_DWORD *)&self->super._navigationBar->super._viewFlags + 4) & 0x80000) != 0)
  {
    if (v15 && objc_msgSend(v15, "count"))
      _UIRTLConvertAllLTRFramesToRTL(v15, rect, v395, v280, v394);
    if (v16 && objc_msgSend(v16, "count"))
      _UIRTLConvertAllLTRFramesToRTL(v16, rect, v395, v280, v394);
    if (a3)
    {
      v513.origin.x = rect;
      v513.size.height = v394;
      v513.origin.y = v395;
      v513.size.width = v280;
      a3->origin.x = CGRectGetMaxX(v513) - v447 - v443;
      a3->origin.y = v406;
      a3->size.width = v447;
      a3->size.height = v409;
    }
  }
  if (v393)
    *v393 = v123 + v400;
  if (a9)
    *a9 = v110;

LABEL_428:
}

- (void)_getTitleViewFrame:(CGRect *)a3 leftViewFrames:(id)a4 rightViewFrames:(id)a5 forPreviousItem:(id)a6 item:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double Width;
  double v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  CGRect v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_customLeftViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_abbreviatedBackButtonTitles");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (objc_msgSend(v16, "_abbreviatedTitleIndex") >= v19)
      objc_msgSend(v16, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);
    if (v16 && v19)
    {
      objc_msgSend(v16, "image");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20
        && objc_msgSend(v16, "_abbreviatedTitleIndex") == 0x7FFFFFFFFFFFFFFFLL
        && (objc_msgSend(v15, "hidesBackButton") & 1) == 0
        && (!objc_msgSend(v17, "count") || objc_msgSend(v15, "leftItemsSupplementBackButton")))
      {
        v26 = 0.0;
        -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:returnedIdealWidthOfTextContent:availableLayoutWidthForTextContent:idealBackButtonWidth:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:returnedIdealWidthOfTextContent:availableLayoutWidthForTextContent:idealBackButtonWidth:", a3, v12, v13, v14, v15, 0, 0, &v26);
        if (v12)
        {
          while (1)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "CGRectValue");
            Width = CGRectGetWidth(v27);
            v23 = v26;

            if (Width >= v23)
              break;
            v24 = objc_msgSend(v16, "_abbreviatedTitleIndex");
            v25 = v24 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v24 + 1;
            if (v25 >= v19)
              break;
            objc_msgSend(v16, "_setAbbreviatedTitleIndex:");
            if (objc_msgSend(v16, "_abbreviatedTitleIndex") == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v16, "_setAbbreviatedTitleIndex:", 0);
            objc_msgSend(v12, "removeAllObjects");
            objc_msgSend(v13, "removeAllObjects");
            -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:returnedIdealWidthOfTextContent:availableLayoutWidthForTextContent:idealBackButtonWidth:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:returnedIdealWidthOfTextContent:availableLayoutWidthForTextContent:idealBackButtonWidth:", a3, v12, v13, v14, v15, 0, 0, &v26);
          }
        }
        goto LABEL_22;
      }

    }
    v26 = 0.0;
    -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:returnedIdealWidthOfTextContent:availableLayoutWidthForTextContent:idealBackButtonWidth:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:returnedIdealWidthOfTextContent:availableLayoutWidthForTextContent:idealBackButtonWidth:", a3, v12, v13, v14, v15, 0, 0, &v26);
LABEL_22:

  }
}

- (double)_backTitleWidthOverTitleWidthForMatchingBackButtonView:(id)a3 titleView:(id)a4 withBackButtonWidth:(double)a5
{
  id v8;
  UINavigationBar *navigationBar;
  id v10;
  void *v11;
  double Width;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  CGRect v23;

  v8 = a3;
  navigationBar = self->super._navigationBar;
  v10 = a4;
  -[UINavigationBar _currentVisualStyle](navigationBar, "_currentVisualStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  Width = CGRectGetWidth(v23);
  objc_msgSend(v10, "_titleSize");
  v14 = v13;

  v15 = Width == 0.0 || v14 > Width;
  v16 = 1.0;
  if (!v15)
  {
    objc_msgSend(v11, "leftBackTitleMarginForCustomBackButtonBackground:", 0, 1.0);
    v18 = a5 - v17;
    objc_msgSend(v8, "_titleSize");
    v20 = v19 > v18 || v18 == 0.0;
    v16 = v19 / Width;
    if (v20)
      v16 = 1.0;
  }
  if (fabs(v16) >= 0.1)
    v21 = v16;
  else
    v21 = 1.0;

  return v21;
}

- (unint64_t)_subviewIndexAboveBackground
{
  UINavigationBar *v3;
  UINavigationBar *navigationBar;
  unint64_t v5;
  void *v7;

  if (-[UIView _canDrawContent](self->super._navigationBar, "_canDrawContent"))
    return 0;
  if (self->_contentView == &self->super._navigationBar->super)
    return 0;
  -[UIView superview](self->_backgroundView, "superview");
  v3 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
  navigationBar = self->super._navigationBar;

  if (v3 != navigationBar)
    return 0;
  -[UIView subviews](self->super._navigationBar, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "indexOfObject:", self->_backgroundView) + 1;

  return v5;
}

- (void)_wrapView:(id)a3 inClippingViewWithLeftBoundary:(double)a4 rightBoundary:(double)a5 leftMaskImage:(id)a6 leftMaskIsChevron:(BOOL)a7 rightMaskImage:(id)a8
{
  _BOOL4 v9;
  unint64_t v14;
  UINavigationBar *navigationBar;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIView *v22;
  NSMutableArray *slideTransitionClippingViews;
  NSMutableArray *v24;
  NSMutableArray *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  double v37;
  double MinY;
  id v39;
  id v40;
  double v41;
  id v42;
  id v43;
  CGFloat v44;
  void *v45;
  unint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v9 = a7;
  v46 = (unint64_t)a6;
  v14 = (unint64_t)a8;
  navigationBar = self->super._navigationBar;
  v16 = a3;
  -[UIView bounds](navigationBar, "bounds");
  v18 = v17;
  v20 = v19;
  v21 = a5 - a4;
  v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a4, v17, v21, v19);
  -[UIView setBounds:](v22, "setBounds:", a4, v18, v21, v20);
  -[UIView setClipsToBounds:](v22, "setClipsToBounds:", 1);
  -[UIView setUserInteractionEnabled:](v22, "setUserInteractionEnabled:", 0);
  -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", v22, -[_UINavigationBarVisualProviderLegacyIOS _subviewIndexAboveBackground](self, "_subviewIndexAboveBackground"));
  -[UIView addSubview:](v22, "addSubview:", v16);

  slideTransitionClippingViews = self->_slideTransitionClippingViews;
  if (!slideTransitionClippingViews)
  {
    v24 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v25 = self->_slideTransitionClippingViews;
    self->_slideTransitionClippingViews = v24;

    slideTransitionClippingViews = self->_slideTransitionClippingViews;
  }
  -[NSMutableArray addObject:](slideTransitionClippingViews, "addObject:", v22);
  if (v46 | v14)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v26, "setBounds:", 0.0, 0.0, v21, v20);
    v27 = *MEMORY[0x1E0C9D538];
    v28 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v26, "setAnchorPoint:", *MEMORY[0x1E0C9D538], v28);
    objc_msgSend(v26, "setPosition:", a4, v18);
    objc_msgSend((id)v46, "size");
    v30 = v29;
    v32 = v31;
    objc_msgSend((id)v14, "size");
    v34 = v33;
    if (v46)
    {
      v35 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v36 = objc_retainAutorelease((id)v46);
      objc_msgSend(v35, "setContents:", objc_msgSend(v36, "CGImage"));
      if (v9)
        v37 = v32;
      else
        v37 = v20;
      objc_msgSend(v35, "setBounds:", 0.0, 0.0, v30, v37);
      objc_msgSend(v35, "setAnchorPoint:", 0.0, 0.0);
      MinY = 0.0;
      if (v9)
      {
        -[UIView frame](self->_backIndicatorView, "frame");
        MinY = CGRectGetMinY(v47);
      }
      objc_msgSend(v35, "setPosition:", 0.0, MinY);
      objc_msgSend(v36, "scale");
      objc_msgSend(v35, "setContentsScale:");
      objc_msgSend(v26, "addSublayer:", v35);

    }
    v39 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    +[UIColor redColor](UIColor, "redColor");
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v39, "setBackgroundColor:", objc_msgSend(v40, "CGColor"));

    objc_msgSend(v39, "setBounds:", 0.0, 0.0, fmax(v21 - v30 - v34, 0.0), v20);
    objc_msgSend(v39, "setAnchorPoint:", v27, v28);
    v48.origin.x = 0.0;
    v48.origin.y = 0.0;
    v48.size.width = v21;
    v48.size.height = v20;
    v41 = v30 + CGRectGetMinX(v48);
    v49.origin.x = 0.0;
    v49.origin.y = 0.0;
    v49.size.width = v21;
    v49.size.height = v20;
    objc_msgSend(v39, "setPosition:", v41, CGRectGetMinY(v49));
    objc_msgSend(v26, "addSublayer:", v39);
    if (v14)
    {
      v42 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v43 = objc_retainAutorelease((id)v14);
      objc_msgSend(v42, "setContents:", objc_msgSend(v43, "CGImage"));
      objc_msgSend(v42, "setBounds:", 0.0, 0.0, v34, v20);
      objc_msgSend(v42, "setAnchorPoint:", v27, v28);
      objc_msgSend(v26, "bounds");
      v44 = CGRectGetMaxX(v50) - v34;
      v51.origin.x = 0.0;
      v51.origin.y = 0.0;
      v51.size.width = v21;
      v51.size.height = v20;
      objc_msgSend(v42, "setPosition:", v44, CGRectGetMinY(v51));
      objc_msgSend(v43, "scale");
      objc_msgSend(v42, "setContentsScale:");
      objc_msgSend(v26, "addSublayer:", v42);

    }
    -[UIView layer](v22, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setMask:", v26);

  }
}

- (double)_effectiveBackIndicatorLeftMargin
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  -[UINavigationBar _appearanceStorage](self->super._navigationBar, "_appearanceStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backIndicatorImage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "backIndicatorTransitionMaskImage");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v3, "backIndicatorLeftMargin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v3, "backIndicatorLeftMargin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
  v13 = v12;
  -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "horizontalMarginAdjustment");
  v11 = v13 - v15;

  if (v11 < 0.0)
    v11 = 0.0;
LABEL_8:

  return v11;
}

- (double)_backIndicatorClippingMargin
{
  double result;

  if (!self->_backIndicatorView)
    return 0.0;
  -[_UINavigationBarVisualProviderLegacyIOS _effectiveBackIndicatorLeftMargin](self, "_effectiveBackIndicatorLeftMargin");
  return result;
}

- (BOOL)_suppressBackIndicator
{
  void *v3;
  UINavigationBar *navigationBar;
  void *v5;
  _BOOL4 v6;

  -[UIView _screen](self->super._navigationBar, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    navigationBar = self->super._navigationBar;
    -[UIView _screen](navigationBar, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[UINavigationBar _shouldShowBackButtonForScreen:](navigationBar, "_shouldShowBackButtonForScreen:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_effectiveBackIndicatorImage
{
  id v3;

  if (-[_UINavigationBarVisualProviderLegacyIOS _suppressBackIndicator](self, "_suppressBackIndicator"))
  {
    v3 = 0;
  }
  else
  {
    -[UINavigationBar backIndicatorImage](self->super._navigationBar, "backIndicatorImage");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      if (qword_1ECD7A210 != -1)
        dispatch_once(&qword_1ECD7A210, &__block_literal_global_60);
      v3 = (id)_MergedGlobals_29_0;
    }
  }
  return v3;
}

- (id)_effectiveBackIndicatorTransitionMaskImage
{
  id v3;

  if (-[_UINavigationBarVisualProviderLegacyIOS _suppressBackIndicator](self, "_suppressBackIndicator"))
  {
    v3 = 0;
  }
  else
  {
    -[UINavigationBar backIndicatorTransitionMaskImage](self->super._navigationBar, "backIndicatorTransitionMaskImage");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      if (qword_1ECD7A220 != -1)
        dispatch_once(&qword_1ECD7A220, &__block_literal_global_57);
      v3 = (id)qword_1ECD7A218;
    }
  }
  return v3;
}

- (void)_updateBackIndicatorImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  UINavigationBarBackIndicatorView *v8;
  UIImageView *backIndicatorView;
  void *v10;
  char v11;
  id v12;

  -[_UINavigationBarVisualProviderLegacyIOS _effectiveBackIndicatorImage](self, "_effectiveBackIndicatorImage");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "backIndicatorViewHasRespondedToCustomBackgroundImageChange");
  if (v12
    || (-[UIImageView image](self->_backIndicatorView, "image"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UIImageView image](self->_backIndicatorView, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isEqual:", v6);

    if (v12)
    {
      if ((v7 & 1) == 0)
      {
        if (!self->_backIndicatorView)
        {
          v8 = objc_alloc_init(UINavigationBarBackIndicatorView);
          backIndicatorView = self->_backIndicatorView;
          self->_backIndicatorView = &v8->super;

          -[UIImageView _setDefaultRenderingMode:](self->_backIndicatorView, "_setDefaultRenderingMode:", 2);
          -[UIImageView setSemanticContentAttribute:](self->_backIndicatorView, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._navigationBar, "semanticContentAttribute"));
          -[UIView addSubview:](self->_contentView, "addSubview:", self->_backIndicatorView);
          if (!-[UINavigationBar _hasBackButton](self->super._navigationBar, "_hasBackButton")
            || (-[UINavigationBar topItem](self->super._navigationBar, "topItem"),
                v10 = (void *)objc_claimAutoreleasedReturnValue(),
                v11 = objc_msgSend(v10, "_leftItemsWantBackButton"),
                v10,
                (v11 & 1) == 0))
          {
            -[UIView setAlpha:](self->_backIndicatorView, "setAlpha:", 0.0);
          }
        }
        -[UIImageView setImage:](self->_backIndicatorView, "setImage:", v12);
        -[UIView sizeToFit](self->_backIndicatorView, "sizeToFit");
        goto LABEL_11;
      }
    }
    else
    {

      if ((v7 & 1) == 0)
LABEL_11:
        -[UIView setNeedsLayout](self->_contentView, "setNeedsLayout");
    }
  }
  -[_UINavigationBarVisualProviderLegacyIOS _updateBackIndicatorViewTintColor](self, "_updateBackIndicatorViewTintColor");

}

- (void)_updateBackIndicatorViewTintColor
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 <= 1)
  {
    -[UINavigationBar topItem](self->super._navigationBar, "topItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (-[UINavigationBar _hasBackButton](self->super._navigationBar, "_hasBackButton")
      || !objc_msgSend(v9, "_wantsBackButtonIndicator"))
    {
      -[UIView setTintColor:](self->_backIndicatorView, "setTintColor:", 0);
LABEL_14:

      return;
    }
    objc_msgSend(v9, "_barButtonForBackButtonIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self->_backIndicatorView, "setTintColor:", v6);
LABEL_13:

    goto LABEL_14;
  }
  if (v4 == 3)
  {
    -[UIView tintColor](self->_backIndicatorView, "tintColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isFocused"))
    {
      +[UIColor _externalBarBackgroundColor](UIColor, "_externalBarBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if ((objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
    {
      -[UIView setTintColor:](self->_backIndicatorView, "setTintColor:", v6);
      -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
    }
    goto LABEL_13;
  }
}

- (CGRect)_contentViewFrameInBounds:(CGRect)a3 style:(id)a4
{
  CGFloat width;
  CGFloat x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  v7 = a4;
  objc_msgSend(v7, "barHeightForMetrics:", objc_msgSend(v7, "metrics"));
  v9 = v8;

  UIFloorToViewScale(self->super._navigationBar);
  v11 = v10;
  v12 = x;
  v13 = width;
  v14 = v9;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (BOOL)_supportsCanvasView
{
  return objc_msgSend((id)objc_opt_class(), "_supportsCanvasView");
}

- (void)_startPushAnimationFromOldBackItem:(id)a3 oldTopItem:(id)a4 newBackItem:(id)a5 newTopItem:(id)a6 withTransitionAssistant:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double *v20;
  CGSize v21;
  id v22;
  _UINavigationBarVisualProviderLegacyIOS *v23;
  void *v24;
  double v25;
  _UINavigationBarVisualProviderLegacyIOS *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  CGFloat MinX;
  void *v37;
  void *v38;
  _UINavigationItemButtonView *v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  void *v57;
  CGFloat v58;
  void *v59;
  double v60;
  CGFloat MidX;
  double MidY;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  _UINavigationItemButtonView *v69;
  double v70;
  char v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  _UINavigationItemButtonView *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  UINavigationBar *navigationBar;
  double v94;
  double v95;
  void *v96;
  void *v97;
  double v98;
  void *v99;
  uint64_t v100;
  double v101;
  double x;
  double v103;
  CGFloat y;
  double v105;
  CGFloat width;
  double v107;
  CGFloat height;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  double MaxX;
  double v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  void *v125;
  CGPoint v126;
  CGSize v127;
  UINavigationBar *v128;
  double v129;
  double v130;
  double v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  double v136;
  void *v137;
  int v138;
  uint64_t v139;
  double v140;
  double v141;
  id v142;
  id v143;
  id v144;
  _UINavigationBarVisualProviderLegacyIOS *v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  _UINavigationItemButtonView *v152;
  void *v153;
  void *v154;
  double v155;
  uint64_t v156;
  double v157;
  double v158;
  CGFloat v159;
  CGFloat v160;
  double v161;
  _BOOL4 v162;
  void *v163;
  id v164;
  void *v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  id v170;
  void *v171;
  int v172;
  double v173;
  void *v174;
  double rect;
  void *recta;
  UIView *rect_8;
  void *rect_16;
  void *rect_24;
  id v180;
  _UINavigationItemButtonView *v181;
  id v182;
  id v183;
  id v184;
  id v185;
  double object;
  _UINavigationItemButtonView *objecta;
  void *v188;
  _QWORD v189[4];
  id v190;
  _QWORD v191[4];
  id v192;
  _QWORD v193[5];
  id v194;
  id v195;
  id v196;
  _UINavigationItemButtonView *v197;
  id v198;
  _QWORD aBlock[5];
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  _UINavigationItemButtonView *v205;
  id v206;
  double v207;
  char v208;
  BOOL v209;
  _QWORD v210[4];
  id v211;
  CGAffineTransform v212;
  CGPoint v213;
  CGSize v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v164 = a8;
  -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
  rect_16 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v170 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v180 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v184 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = (double *)MEMORY[0x1E0C9D648];
  v21 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v213 = (CGPoint)*MEMORY[0x1E0C9D648];
  v214 = v21;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = self;
  rect_24 = v17;
  -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:", &v213, v19, v22, v16, v17);
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "CGRectValue");
    v161 = v25;

  }
  else
  {
    v161 = 0.0;
  }
  v26 = self;

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "CGRectValue");
    rect = v28;
    v30 = v29;
    v173 = v31;
    v33 = v32;

  }
  else
  {
    v30 = v20[1];
    rect = *v20;
    v33 = v20[3];
    v173 = v20[2];
  }
  v34 = rect_24;
  objc_msgSend(rect_24, "leftBarButtonItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  MinX = 0.0;
  if (v35)
  {
    objc_msgSend(v19, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "CGRectValue");
    object = CGRectGetMaxX(v215);

    if (objc_msgSend(rect_24, "leftItemsSupplementBackButton")
      && (unint64_t)objc_msgSend(v19, "count") >= 2)
    {
      objc_msgSend(v19, "objectAtIndex:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "CGRectValue");
      MinX = CGRectGetMinX(v216);

    }
  }
  else
  {
    object = 0.0;
  }

  v174 = v16;
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v16, rect_24);
  v39 = (_UINavigationItemButtonView *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationItemButtonView _backButtonBackgroundImageForState:barMetrics:](v39, "_backButtonBackgroundImageForState:barMetrics:", 0, -[UINavigationBar isMinibar](v23->super._navigationBar, "isMinibar"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(rect_16, "leftBackTitleMarginForCustomBackButtonBackground:");
  v167 = v40;
  rect_8 = v23->_contentView;
  v172 = *((_DWORD *)&v23->super._navigationBar->super._viewFlags + 4);
  objc_msgSend(v15, "_titleView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "title");
  v42 = objc_claimAutoreleasedReturnValue();
  -[_UINavigationItemButtonView title](v39, "title");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v45 = 1.0;
  v188 = v43;
  v171 = v15;
  v166 = (void *)v42;
  v159 = v33;
  v160 = v30;
  v158 = MinX;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  if (!objc_msgSend(v43, "isEqualToString:", v42))
  {
    v162 = 0;
    if (!v41)
      goto LABEL_25;
    goto LABEL_19;
  }
  if (-[_UINavigationItemButtonView hasCustomBackgroundImage](v39, "hasCustomBackgroundImage")
    || (objc_msgSend(v18, "shouldCrossfade") & 1) != 0)
  {
LABEL_16:
    v162 = 0;
    if (!v41)
      goto LABEL_25;
  }
  else
  {
    -[_UINavigationBarVisualProviderLegacyIOS _backTitleWidthOverTitleWidthForMatchingBackButtonView:titleView:withBackButtonWidth:](v23, "_backTitleWidthOverTitleWidthForMatchingBackButtonView:titleView:withBackButtonWidth:", v39, v41, v173);
    v45 = v155;
    v44 = 1.0;
    v162 = v45 != 1.0;
    if (!v41)
      goto LABEL_25;
  }
LABEL_19:
  objc_msgSend(v41, "frame");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v54 = fmin(v46, rect + v167);
  v55 = fmax(v47, rect);
  if ((*(_QWORD *)&v172 & 0x80000) != 0)
    v56 = v55;
  else
    v56 = v54;
  objc_msgSend(v182, "addObject:", v41);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v47, v49, v51, v53);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v41, &_UINavigationBarOriginalFrameKey, v57, (void *)1);

  v217.origin.x = v56;
  v217.origin.y = v49;
  v217.size.width = v51;
  v217.size.height = v53;
  v58 = v45 * CGRectGetWidth(v217);
  v59 = (void *)MEMORY[0x1E0CB3B18];
  v218.origin.x = v56;
  v218.origin.y = v49;
  v218.size.width = v58;
  v218.size.height = v53;
  v60 = v45;
  MidX = CGRectGetMidX(v218);
  v219.origin.x = v56;
  v219.origin.y = v49;
  v219.size.width = v58;
  v219.size.height = v53;
  MidY = CGRectGetMidY(v219);
  v63 = MidX;
  v45 = v60;
  objc_msgSend(v59, "valueWithCGPoint:", v63, MidY);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "addObject:", v64);

  v43 = v188;
  if ((objc_msgSend(v18, "shouldCrossfade") & 1) == 0)
  {
    v44 = object;
    if (object > 0.0)
    {
      __slideTransitionFadeMaskImage(1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v220.origin.x = v47;
      v220.origin.y = v49;
      v220.size.width = v51;
      v220.size.height = v53;
      v66 = CGRectGetMinX(v220);
      objc_msgSend(v65, "size");
      v68 = fmin(object, v66 - v67);
      -[UIView bounds](v23->super._navigationBar, "bounds");
      -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v23, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v41, v65, 0, 0, v68, CGRectGetMaxX(v221));

      v43 = v188;
    }
  }
LABEL_25:
  objc_msgSend(v14, "backButtonView", v44);
  v69 = (_UINavigationItemButtonView *)objc_claimAutoreleasedReturnValue();
  v70 = 0.0;
  if (!objc_msgSend(rect_24, "_leftItemsWantBackButton")
    || (objc_msgSend(v18, "shouldHideBackButtonDuringTransition") & 1) != 0
    || (objc_msgSend(rect_24, "hidesBackButton") & 1) != 0
    || v39 && -[_UINavigationItemButtonView _suppressesBackIndicatorView](v39, "_suppressesBackIndicatorView"))
  {
    v71 = 1;
  }
  else
  {
    if (!-[_UINavigationItemButtonView _suppressesBackIndicatorView](v69, "_suppressesBackIndicatorView"))
    {
      -[_UINavigationBarVisualProviderLegacyIOS _backIndicatorClippingMargin](v23, "_backIndicatorClippingMargin");
      v70 = v115;
    }
    v71 = 0;
  }
  v165 = v14;
  if (v69)
  {
    -[UIView frame](v69, "frame");
    v156 = v72;
    v74 = v73;
    v76 = v75;
    v78 = v77;
    if (v69 == v39)
    {
      v79 = [_UINavigationItemButtonView alloc];
      -[_UINavigationItemView navigationItem](v39, "navigationItem");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[_UINavigationItemButtonView initWithNavigationItem:](v79, "initWithNavigationItem:", v80);

      -[_UINavigationItemButtonView _appearanceStorage](v39, "_appearanceStorage");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        objc_msgSend(v14, "backBarButtonItem");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "_appearanceStorage");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_getAssociatedObject(v82, &_UIAppearanceCustomizedSelectorsAssociationKey);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationItemButtonView _applyBarButtonAppearanceStorage:withTaggedSelectors:](v69, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v83, v84);

        v34 = rect_24;
      }
      -[UIView frame](v39, "frame", v156);
      -[_UINavigationItemView setFrame:](v69, "setFrame:");
      v26 = v23;
    }
    -[_UINavigationItemButtonView setPressed:](v69, "setPressed:", 0, v156);
    objecta = v69;
    if ((objc_msgSend(v18, "shouldCrossfade") & 1) != 0 || v70 <= 0.0)
    {
      v85 = v45;
      -[UIView addSubview:](rect_8, "addSubview:", v69);
    }
    else
    {
      v85 = v45;
      -[_UINavigationBarVisualProviderLegacyIOS _effectiveBackIndicatorTransitionMaskImage](v26, "_effectiveBackIndicatorTransitionMaskImage");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView frame](v69, "frame");
      -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v26, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v69, v86, 1, 0, v70, CGRectGetMaxX(v222));

    }
    -[UIView frame](v69, "frame");
    v89 = v88;
    v90 = v87;
    v92 = v91;
    navigationBar = v26->super._navigationBar;
    if ((*((_DWORD *)&navigationBar->super._viewFlags + 4) & 0x80000) != 0)
    {
      -[UIView bounds](navigationBar, "bounds");
      v94 = v95;
    }
    else
    {
      v94 = -v87;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v157, v74, v76, v78);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v69, &_UINavigationBarOriginalFrameKey, v96, (void *)1);

    objc_msgSend(v182, "addObject:", v69);
    v97 = (void *)MEMORY[0x1E0CB3B18];
    v223.origin.x = v94;
    v223.origin.y = v89;
    v223.size.width = v90;
    v223.size.height = v92;
    v98 = CGRectGetMidX(v223);
    v224.origin.x = v94;
    v224.origin.y = v89;
    v224.size.width = v90;
    v224.size.height = v92;
    objc_msgSend(v97, "valueWithCGPoint:", v98, CGRectGetMidY(v224));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "addObject:", v99);

    v43 = v188;
    v45 = v85;
  }
  else
  {
    objecta = 0;
  }
  v100 = -[_UINavigationBarVisualProviderLegacyIOS _subviewIndexAboveBackground](v26, "_subviewIndexAboveBackground");
  if (v39)
  {
    -[_UINavigationItemButtonView setStyle:](v39, "setStyle:", -[UINavigationBar _barStyle](v26->super._navigationBar, "_barStyle"));
    -[_UINavigationItemButtonView setPressed:](v39, "setPressed:", 0);
    if (v41)
    {
      objc_msgSend(v41, "frame");
      x = v101;
      y = v103;
      width = v105;
      height = v107;
    }
    else
    {
      y = v213.y;
      x = v213.x;
      height = v214.height;
      width = v214.width;
    }
    if (v174)
      goto LABEL_50;
    objc_msgSend(v171, "titleView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {

    }
    else if (objc_msgSend(v43, "isEqualToString:", v166))
    {
LABEL_50:
      v109 = v173 / v45;
      if ((v172 & 0x80000) != 0)
      {
        v225.origin.x = x;
        v225.origin.y = y;
        v225.size.width = width;
        v225.size.height = height;
        MaxX = CGRectGetMaxX(v225);
        v226.origin.x = rect;
        v112 = v159;
        v111 = v160;
        v226.origin.y = v160;
        v226.size.width = v173 / v45;
        v226.size.height = v159;
        v110 = v167 / v45 + MaxX - CGRectGetWidth(v226);
      }
      else
      {
        v110 = x - v167 / v45;
        v112 = v159;
        v111 = v160;
      }
      goto LABEL_62;
    }
    if ((v172 & 0x80000) != 0)
    {
      -[UIView bounds](v26->super._navigationBar, "bounds");
      v168 = CGRectGetMaxX(v229);
      v230.origin.x = rect;
      v112 = v159;
      v230.origin.y = v160;
      v109 = v173;
      v230.size.width = v173;
      v230.size.height = v159;
      v169 = v168 - CGRectGetWidth(v230);
      v231.origin.x = rect;
      v231.origin.y = v160;
      v231.size.width = v173;
      v231.size.height = v159;
      v117 = CGRectGetMidX(v231);
      v232.origin.x = x;
      v111 = v160;
      v232.origin.y = y;
      v232.size.width = width;
      v232.size.height = height;
      v110 = v169 - (v117 - CGRectGetMidX(v232));
    }
    else
    {
      v227.origin.x = x;
      v227.origin.y = y;
      v227.size.width = width;
      v227.size.height = height;
      v116 = CGRectGetMidX(v227);
      v228.origin.x = rect;
      v112 = v159;
      v111 = v160;
      v228.origin.y = v160;
      v228.size.width = v173;
      v228.size.height = v159;
      v110 = v116 - CGRectGetMidX(v228) - v167;
      v109 = v173;
    }
LABEL_62:
    if ((objc_msgSend(v18, "shouldCrossfade") & 1) != 0 || v158 <= 0.0)
    {
      -[UIView insertSubview:atIndex:](rect_8, "insertSubview:atIndex:", v39, v100);
    }
    else
    {
      __slideTransitionFadeMaskImage(0);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](v26->super._navigationBar, "bounds");
      v119 = CGRectGetMinX(v233);
      v234.origin.x = v110;
      v234.origin.y = v111;
      v234.size.width = v109;
      v234.size.height = v112;
      v120 = CGRectGetMaxX(v234);
      objc_msgSend(v118, "size");
      -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v26, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v39, 0, 0, v118, v119, fmax(v158, v120 + v121));

    }
    -[UIView setAlpha:](v39, "setAlpha:", 0.0);
    if ((objc_msgSend(v18, "shouldHideBackButtonDuringTransition") & 1) != 0
      || objc_msgSend(v34, "hidesBackButton"))
    {
      -[_UINavigationItemView setFrame:](v39, "setFrame:", rect, v111, v173, v112);
    }
    else
    {
      -[_UINavigationItemView setFrame:](v39, "setFrame:", v110, v111, v109, v112);
      if (v162)
      {
        CGAffineTransformMakeScale(&v212, 1.0 / v45, 1.0);
        -[UIView setTransform:](v39, "setTransform:", &v212);
      }
      objc_msgSend(v170, "addObject:", v39);
      v122 = (void *)MEMORY[0x1E0CB3B18];
      v235.origin.x = rect;
      v235.origin.y = v111;
      v235.size.width = v173;
      v235.size.height = v112;
      v123 = CGRectGetMidX(v235);
      v236.origin.x = rect;
      v236.origin.y = v111;
      v236.size.width = v173;
      v236.size.height = v112;
      objc_msgSend(v122, "valueWithCGPoint:", v123, CGRectGetMidY(v236));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "addObject:", v124);

    }
  }
  objc_msgSend(v34, "_titleView");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (v125)
  {
    v126 = v213;
    v127 = v214;
    v128 = v26->super._navigationBar;
    if ((*((_DWORD *)&v128->super._viewFlags + 4) & 0x80000) != 0)
    {
      v130 = -v214.width;
    }
    else
    {
      -[UIView bounds](v128, "bounds");
      v130 = v129;
    }
    if ((objc_msgSend(v18, "shouldCrossfade") & 1) != 0 || (v131 = v161, v161 <= 0.0))
    {
      -[UIView insertSubview:atIndex:](rect_8, "insertSubview:atIndex:", v125, v100, v131);
    }
    else
    {
      __slideTransitionFadeMaskImage(0);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v237.origin = v126;
      v237.size = v127;
      v133 = CGRectGetMaxX(v237);
      objc_msgSend(v132, "size");
      -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v26, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v125, 0, 0, v132, 0.0, fmax(v161, v133 + v134));

    }
    objc_msgSend(v125, "setFrame:", v130, v126.y, v127);
    objc_msgSend(v125, "setAlpha:", 0.0);
    objc_msgSend(v170, "addObject:", v125);
    v135 = (void *)MEMORY[0x1E0CB3B18];
    v238.origin = v126;
    v238.size = v127;
    v136 = CGRectGetMidX(v238);
    v239.origin = v126;
    v239.size = v127;
    objc_msgSend(v135, "valueWithCGPoint:", v136, CGRectGetMidY(v239));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "addObject:", v137);

  }
  recta = v125;
  v138 = objc_msgSend(v18, "shouldCrossfade");
  v139 = MEMORY[0x1E0C809B0];
  if (v138)
  {
    v210[0] = MEMORY[0x1E0C809B0];
    v210[1] = 3221225472;
    v210[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke;
    v210[3] = &unk_1E16B24A0;
    v211 = v184;
    objc_msgSend(v170, "enumerateObjectsUsingBlock:", v210);

  }
  objc_msgSend(v18, "duration");
  v141 = v140;
  objc_msgSend(v18, "incrementAnimationCount");
  aBlock[0] = v139;
  aBlock[1] = 3221225472;
  aBlock[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2;
  aBlock[3] = &unk_1E16B5FC0;
  aBlock[4] = v26;
  v208 = v71;
  v142 = v182;
  v200 = v142;
  v143 = v18;
  v201 = v143;
  v183 = v180;
  v202 = v183;
  v144 = v170;
  v203 = v144;
  v185 = v184;
  v204 = v185;
  v209 = v162;
  v181 = v39;
  v205 = v181;
  v207 = v45;
  v145 = v26;
  v146 = v41;
  v206 = v146;
  v147 = _Block_copy(aBlock);
  v193[0] = v139;
  v193[1] = 3221225472;
  v193[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5;
  v193[3] = &unk_1E16B5FE8;
  v193[4] = v145;
  v148 = v144;
  v194 = v148;
  v149 = v142;
  v195 = v149;
  v150 = v143;
  v196 = v150;
  v151 = v164;
  v198 = v151;
  v152 = objecta;
  v197 = v152;
  v153 = _Block_copy(v193);
  if ((objc_msgSend(v150, "shouldAnimateAlongside") & 1) != 0)
  {
    objc_msgSend(v150, "transitionCoordinator");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v191[0] = MEMORY[0x1E0C809B0];
    v191[1] = 3221225472;
    v191[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6;
    v191[3] = &unk_1E16B1CC8;
    v192 = v147;
    v189[0] = MEMORY[0x1E0C809B0];
    v189[1] = 3221225472;
    v189[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7;
    v189[3] = &unk_1E16B1CC8;
    v190 = v153;
    objc_msgSend(v154, "animateAlongsideTransition:completion:", v191, v189);

  }
  else
  {
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v145, v147, v153, v141, 0.0);
  }

}

- (void)_startPopAnimationFromOldBackItem:(id)a3 oldTopItem:(id)a4 newBackItem:(id)a5 newTopItem:(id)a6 withTransitionAssistant:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double *v19;
  __int128 v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double MinX;
  void *v34;
  CGFloat MaxX;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id *p_isa;
  void *v42;
  uint64_t v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  _BOOL4 v49;
  _DWORD *v50;
  int *v51;
  int v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat y;
  double x;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  void *v69;
  void *titleView;
  double MidX;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  UIView *contentView;
  uint64_t v121;
  UIView *v122;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  void *v128;
  int v129;
  void *v130;
  double v131;
  void *v132;
  int v133;
  uint64_t v134;
  double v135;
  void *v136;
  double v137;
  double v138;
  id v139;
  id v140;
  uint64_t v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  CGFloat v164;
  CGFloat v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  CGFloat rect;
  CGFloat v175;
  CGFloat v176;
  char v177;
  void *v178;
  id v179;
  CGFloat v180;
  void *v181;
  void *v182;
  id v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  CGPoint v188;
  void *v189;
  void *v190;
  id v191;
  id v192;
  void *v193;
  id v194;
  id v195;
  id v196;
  id v197;
  void *v198;
  _UINavigationBarVisualProviderLegacyIOS *v199;
  _QWORD v200[4];
  id v201;
  _QWORD v202[4];
  id v203;
  _QWORD v204[4];
  id v205;
  _UINavigationBarVisualProviderLegacyIOS *v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  _QWORD aBlock[5];
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  double v220;
  char v221;
  BOOL v222;
  _QWORD v223[4];
  id v224;
  CGAffineTransform v225;
  CGPoint v226;
  __int128 v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;

  v14 = a3;
  v191 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v183 = a8;
  v196 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v192 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v194 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v179 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = (double *)MEMORY[0x1E0C9D648];
  v20 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v226 = (CGPoint)*MEMORY[0x1E0C9D648];
  v227 = v20;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v199 = self;
  -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:", &v226, v18, v21, v15, v16);
  objc_msgSend(v21, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v21, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "CGRectValue");
    v171 = v24;

  }
  else
  {
    v171 = 0.0;
  }
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "objectAtIndex:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "CGRectValue");
    v27 = v26;
    v166 = v29;
    v167 = v28;
    v31 = v30;

  }
  else
  {
    v27 = *v19;
    v31 = v19[2];
    v166 = v19[3];
    v167 = v19[1];
  }
  objc_msgSend(v16, "leftBarButtonItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  MinX = 0.0;
  if (v32)
  {
    objc_msgSend(v18, "lastObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "CGRectValue");
    MaxX = CGRectGetMaxX(v228);

    if (objc_msgSend(v16, "leftItemsSupplementBackButton")
      && (unint64_t)objc_msgSend(v18, "count") >= 2)
    {
      objc_msgSend(v18, "objectAtIndex:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "CGRectValue");
      MinX = CGRectGetMinX(v229);

    }
  }
  else
  {
    MaxX = 0.0;
  }
  if (-[_UINavigationBarVisualProviderLegacyIOS _shouldShowBackButtonForNavigationItem:](self, "_shouldShowBackButtonForNavigationItem:", v15)&& (objc_msgSend(v16, "hidesBackButton") & 1) == 0)
  {
    objc_msgSend(v16, "leftBarButtonItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 && !objc_msgSend(v16, "leftItemsSupplementBackButton"))
    {
      v37 = 0;
    }
    else
    {
      objc_msgSend(v15, "backButtonView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(v14, "existingBackButtonView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = 0.0;
  v190 = v14;
  v184 = v21;
  v185 = v15;
  v178 = v37;
  if (v37
    && (objc_msgSend(v37, "_suppressesBackIndicatorView") & 1) == 0
    && objc_msgSend(v16, "_leftItemsWantBackButton")
    && (objc_msgSend(v17, "shouldHideBackButtonDuringTransition") & 1) == 0)
  {
    v40 = v17;
    p_isa = (id *)&v199->super.super.isa;
    if ((objc_msgSend(v16, "hidesBackButton") & 1) != 0)
    {
      v177 = 1;
    }
    else
    {
      -[_UINavigationBarVisualProviderLegacyIOS _backIndicatorClippingMargin](v199, "_backIndicatorClippingMargin");
      v170 = v160;
      v177 = 0;
    }
  }
  else
  {
    v40 = v17;
    v177 = 1;
    p_isa = (id *)&v199->super.super.isa;
  }

  objc_msgSend(p_isa[1], "_currentVisualStyle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_backButtonBackgroundImageForState:barMetrics:", 0, objc_msgSend(p_isa[1], "isMinibar"));
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leftBackTitleMarginForCustomBackButtonBackground:", v43);
  v172 = v44;
  objc_msgSend(v16, "_titleView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "title");
  v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "title");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v48 = 1.0;
  v198 = v16;
  v181 = (void *)v43;
  v182 = v42;
  v186 = v47;
  v187 = (void *)v46;
  v168 = v27;
  v169 = v31;
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v47, "isEqualToString:", v46)
    && (objc_msgSend(v39, "hasCustomBackgroundImage") & 1) == 0
    && (objc_msgSend(v40, "shouldCrossfade") & 1) == 0)
  {
    objc_msgSend(v39, "bounds");
    objc_msgSend(p_isa, "_backTitleWidthOverTitleWidthForMatchingBackButtonView:titleView:withBackButtonWidth:", v39, v45, v158);
    v48 = v159;
    v49 = v159 != 1.0;
  }
  else
  {
    v49 = 0;
  }
  v50 = p_isa[1];
  v51 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
  v52 = v50[30];
  v53 = *(double *)&v227;
  v188 = v226;
  v54 = *((double *)&v227 + 1);
  objc_msgSend(v50, "bounds");
  v175 = v57;
  v176 = v56;
  v58 = v55;
  rect = v59;
  if (!v198 || !v45)
  {
    v69 = v179;
    if (v45)
      goto LABEL_46;
    titleView = v199->_titleView;
    v199->_titleView = 0;
    goto LABEL_45;
  }
  v60 = v54;
  v163 = MaxX;
  v164 = v55;
  -[UIView addSubview:](v199->_contentView, "addSubview:", v45);
  objc_storeStrong((id *)&v199->_titleView, v45);
  y = v226.y;
  x = v226.x;
  v63 = *((double *)&v227 + 1);
  v64 = *(double *)&v227;
  v161 = MinX;
  if (v39)
  {
    objc_msgSend(v39, "frame");
    v66 = fmin(x, v172 + v65);
    v67 = fmax(x, v65);
    if ((*(_QWORD *)&v52 & 0x80000) != 0)
      x = v67;
    else
      x = v66;
    v68 = v48;
    v64 = v48 * v64;
  }
  else
  {
    v68 = v48;
  }
  v69 = v179;
  v230.origin.x = x;
  v230.origin.y = y;
  v230.size.width = v64;
  v230.size.height = v63;
  MidX = CGRectGetMidX(v230);
  v231.origin.x = x;
  v231.origin.y = y;
  v231.size.width = v64;
  v231.size.height = v63;
  objc_msgSend(v45, "setCenter:", MidX, CGRectGetMidY(v231));
  v72 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v45, "frame");
  objc_msgSend(v72, "valueWithCGRect:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v45, &_UINavigationBarOriginalFrameKey, v73, (void *)1);

  v48 = v68;
  if (v49)
  {
    CGAffineTransformMakeScale(&v225, v68, 1.0);
    objc_msgSend(v45, "setTransform:", &v225);
  }
  objc_msgSend(v45, "setAlpha:", 0.0, *(_QWORD *)&v161);
  objc_msgSend(v192, "addObject:", v45);
  v74 = (void *)MEMORY[0x1E0CB3B18];
  v232.origin = v188;
  v232.size.width = v53;
  v54 = v60;
  v232.size.height = v60;
  v75 = CGRectGetMidX(v232);
  v233.origin = v188;
  v233.size.width = v53;
  v233.size.height = v60;
  objc_msgSend(v74, "valueWithCGPoint:", v75, CGRectGetMidY(v233));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "addObject:", v76);

  v58 = v164;
  MinX = v162;
  if ((objc_msgSend(v40, "shouldCrossfade") & 1) == 0 && v163 > 0.0)
  {
    __slideTransitionFadeMaskImage(1);
    titleView = (void *)objc_claimAutoreleasedReturnValue();
    v234.origin = v188;
    v234.size.width = v53;
    v234.size.height = v60;
    v77 = CGRectGetMinX(v234);
    objc_msgSend(titleView, "size");
    v79 = fmin(v163, v77 - v78);
    v235.origin.y = v175;
    v235.origin.x = v176;
    v235.size.width = v164;
    v235.size.height = rect;
    -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v199, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v45, titleView, 0, 0, v79, CGRectGetMaxX(v235));
LABEL_45:

  }
LABEL_46:
  if (!v39)
    goto LABEL_63;
  v165 = v53;
  v180 = v54;
  v80 = v58;
  objc_msgSend(v39, "setPressed:", 0);
  objc_msgSend(v39, "frame");
  v82 = v81;
  v84 = v83;
  v86 = v85;
  v88 = v87;
  if ((objc_msgSend(v40, "shouldCrossfade") & 1) != 0 || MinX == 0.0)
  {
    -[UIView addSubview:](v199->_contentView, "addSubview:", v39);
  }
  else
  {
    __slideTransitionFadeMaskImage(0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v236.origin.x = v82;
    v236.origin.y = v84;
    v236.size.width = v86;
    v236.size.height = v88;
    v90 = MinX;
    v91 = v48;
    v92 = CGRectGetMaxX(v236);
    objc_msgSend(v89, "size");
    v94 = v92 + fmax(v93, 2.0);
    v48 = v91;
    -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v199, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v39, 0, 0, v89, 0.0, fmax(v90, v94));

  }
  if (!v190)
  {
    objc_msgSend(v198, "titleView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {

    }
    else if (objc_msgSend(v186, "isEqualToString:", v46))
    {
      goto LABEL_52;
    }
    if ((v52 & 0x80000) != 0)
    {
      v250.origin.y = v175;
      v250.origin.x = v176;
      v250.size.width = v80;
      v250.size.height = rect;
      v173 = v48;
      v154 = CGRectGetMaxX(v250);
      v251.origin.x = v82;
      v251.origin.y = v84;
      v251.size.width = v86;
      v251.size.height = v88;
      v155 = v154 - CGRectGetWidth(v251);
      v252.origin.x = v82;
      v58 = v80;
      v252.origin.y = v84;
      v252.size.width = v86;
      v252.size.height = v88;
      v156 = CGRectGetMidX(v252);
      v253.origin = v188;
      v253.size.width = v165;
      v253.size.height = v180;
      v157 = v156 - CGRectGetMidX(v253);
      v48 = v173;
      v99 = v155 - v157;
      goto LABEL_62;
    }
    v239.origin = v188;
    v239.size.width = v165;
    v239.size.height = v180;
    v100 = CGRectGetMidX(v239);
    v240.origin.x = v82;
    v240.origin.y = v84;
    v240.size.width = v86;
    v240.size.height = v88;
    v95 = v100 - CGRectGetMidX(v240);
    v96 = v172;
    goto LABEL_60;
  }
LABEL_52:
  v86 = v86 / v48;
  if ((v52 & 0x80000) == 0)
  {
    v95 = v226.x;
    v96 = v172 / v48;
LABEL_60:
    v99 = v95 - v96;
    goto LABEL_61;
  }
  v237.origin = v188;
  v237.size.width = v165;
  v237.size.height = v180;
  v98 = CGRectGetMaxX(v237);
  v238.origin.x = v82;
  v238.origin.y = v84;
  v238.size.width = v86;
  v238.size.height = v88;
  v99 = v172 / v48 + v98 - CGRectGetWidth(v238);
LABEL_61:
  v58 = v80;
LABEL_62:
  objc_msgSend(v196, "addObject:", v39);
  v101 = (void *)MEMORY[0x1E0CB3B18];
  v241.origin.x = v99;
  v241.origin.y = v84;
  v241.size.width = v86;
  v241.size.height = v88;
  v102 = CGRectGetMidX(v241);
  v242.origin.x = v99;
  v242.origin.y = v84;
  v242.size.width = v86;
  v242.size.height = v88;
  objc_msgSend(v101, "valueWithCGPoint:", v102, CGRectGetMidY(v242));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "addObject:", v103);

LABEL_63:
  objc_msgSend(v191, "_titleView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = v104;
  if (v104)
  {
    objc_msgSend(v104, "frame");
    v107 = v106;
    v109 = v108;
    v110 = v105;
    v112 = v111;
    if ((*((_DWORD *)&v199->super._navigationBar->super._viewFlags + 4) & 0x80000) != 0)
      v113 = -v105;
    else
      v113 = v58;
    if ((objc_msgSend(v40, "shouldCrossfade") & 1) != 0 || (v114 = v171, v171 <= 0.0))
    {
      contentView = v199->_contentView;
      v121 = -[_UINavigationBarVisualProviderLegacyIOS _subviewIndexAboveBackground](v199, "_subviewIndexAboveBackground", v114);
      v122 = contentView;
      v119 = v189;
      -[UIView insertSubview:atIndex:](v122, "insertSubview:atIndex:", v189, v121);
    }
    else
    {
      __slideTransitionFadeMaskImage(0);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v243.origin.y = v175;
      v243.origin.x = v176;
      v243.size.width = v58;
      v243.size.height = rect;
      v116 = CGRectGetMinX(v243);
      v244.origin.x = v107;
      v244.origin.y = v109;
      v244.size.width = v110;
      v244.size.height = v112;
      v117 = CGRectGetMaxX(v244);
      objc_msgSend(v115, "size");
      v119 = v189;
      -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v199, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v189, 0, 0, v115, v116, fmax(v171, v117 + fmax(v118, 2.0)));

      v51 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
    }
    objc_msgSend(v196, "addObject:", v119);
    v123 = (void *)MEMORY[0x1E0CB3B18];
    v245.origin.x = v113;
    v245.origin.y = v109;
    v245.size.width = v110;
    v245.size.height = v112;
    v124 = CGRectGetMidX(v245);
    v246.origin.x = v113;
    v246.origin.y = v109;
    v246.size.width = v110;
    v246.size.height = v112;
    objc_msgSend(v123, "valueWithCGPoint:", v124, CGRectGetMidY(v246));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "addObject:", v125);

  }
  if (v178)
  {
    objc_msgSend(v178, "setPressed:", 0);
    if ((objc_msgSend(v40, "shouldCrossfade") & 1) != 0 || v170 <= 0.0)
    {
      -[UIView addSubview:](v199->_contentView, "addSubview:", v178);
    }
    else
    {
      -[_UINavigationBarVisualProviderLegacyIOS _effectiveBackIndicatorTransitionMaskImage](v199, "_effectiveBackIndicatorTransitionMaskImage");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v247.origin.y = v175;
      v247.origin.x = v176;
      v247.size.width = v58;
      v247.size.height = rect;
      -[_UINavigationBarVisualProviderLegacyIOS _wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:](v199, "_wrapView:inClippingViewWithLeftBoundary:rightBoundary:leftMaskImage:leftMaskIsChevron:rightMaskImage:", v178, v126, 1, 0, v170, CGRectGetMaxX(v247));

    }
    objc_msgSend(v178, "_setFadingInFromCustomAlpha:", 1);
    objc_msgSend(v178, "setAlpha:", 0.3);
    if ((*(_DWORD *)((_BYTE *)&v199->super._navigationBar->super.super.__layeringSceneIdentity + v51[642]) & 0x80000) != 0)
      v127 = v58;
    else
      v127 = -v169;
    if ((objc_msgSend(v40, "shouldHideBackButtonDuringTransition") & 1) == 0)
    {
      objc_msgSend(v198, "_customLeftViews");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v128, "count") && (objc_msgSend(v198, "leftItemsSupplementBackButton") & 1) == 0)
      {

      }
      else
      {
        v129 = objc_msgSend(v198, "hidesBackButton");

        if (!v129)
        {
          objc_msgSend(v178, "setFrame:", v127, v167, v169, v166);
          objc_msgSend(v192, "addObject:", v178);
          v130 = (void *)MEMORY[0x1E0CB3B18];
          v248.origin.x = v168;
          v248.origin.y = v167;
          v248.size.width = v169;
          v248.size.height = v166;
          v131 = CGRectGetMidX(v248);
          v249.origin.x = v168;
          v249.origin.y = v167;
          v249.size.width = v169;
          v249.size.height = v166;
          objc_msgSend(v130, "valueWithCGPoint:", v131, CGRectGetMidY(v249));
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addObject:", v132);

          goto LABEL_87;
        }
      }
    }
    objc_msgSend(v178, "setFrame:", v168, v167, v169, v166);
  }
LABEL_87:
  v133 = objc_msgSend(v40, "shouldCrossfade");
  v134 = MEMORY[0x1E0C809B0];
  if (v133)
  {
    v223[0] = MEMORY[0x1E0C809B0];
    v223[1] = 3221225472;
    v223[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke;
    v223[3] = &unk_1E16B24A0;
    v224 = v69;
    objc_msgSend(v192, "enumerateObjectsUsingBlock:", v223);

  }
  objc_msgSend(v40, "duration");
  if (v135 == 0.0)
  {
    v136 = v178;
    +[UINavigationBar defaultAnimationDuration](UINavigationBar, "defaultAnimationDuration");
    v138 = v137;
  }
  else
  {
    v138 = v135;
    v136 = v178;
  }
  objc_msgSend(v40, "incrementAnimationCount");
  aBlock[0] = v134;
  aBlock[1] = 3221225472;
  aBlock[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2;
  aBlock[3] = &unk_1E16B5FC0;
  aBlock[4] = v199;
  v221 = v177;
  v139 = v196;
  v213 = v139;
  v140 = v40;
  v214 = v140;
  v197 = v194;
  v215 = v197;
  v141 = v134;
  v142 = v192;
  v216 = v142;
  v195 = v69;
  v217 = v195;
  v222 = v49;
  v143 = v45;
  v218 = v143;
  v144 = v39;
  v219 = v144;
  v220 = v48;
  v193 = _Block_copy(aBlock);
  v204[0] = v141;
  v204[1] = 3221225472;
  v204[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5;
  v204[3] = &unk_1E16B6010;
  v145 = v136;
  v205 = v145;
  v206 = v199;
  v146 = v142;
  v207 = v146;
  v147 = v139;
  v208 = v147;
  v148 = v140;
  v209 = v148;
  v149 = v183;
  v211 = v149;
  v150 = v144;
  v210 = v150;
  v151 = _Block_copy(v204);
  if (objc_msgSend(v148, "interactive"))
    -[_UINavigationBarVisualProviderLegacyIOS updateTopNavigationItemAnimated:](v199, "updateTopNavigationItemAnimated:", 1);
  if ((objc_msgSend(v148, "shouldAnimateAlongside") & 1) != 0)
  {
    objc_msgSend(v148, "transitionCoordinator");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v202[0] = MEMORY[0x1E0C809B0];
    v202[1] = 3221225472;
    v202[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6;
    v202[3] = &unk_1E16B1CC8;
    v153 = v193;
    v203 = v193;
    v200[0] = MEMORY[0x1E0C809B0];
    v200[1] = 3221225472;
    v200[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7;
    v200[3] = &unk_1E16B1CC8;
    v201 = v151;
    objc_msgSend(v152, "animateAlongsideTransition:completion:", v202, v200);

  }
  else
  {
    v153 = v193;
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v199, v193, v151, v138, 0.0);
  }

}

- (void)_completeNavigationTransitionWithIncomingViews:(id)a3 outgoingViews:(id)a4 transitionAssistant:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  UIView *v37;
  UIView *contentView;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIView *v49;
  UIView *titleView;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void (**v56)(id, uint64_t, void *);
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _OWORD v72[3];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v56 = (void (**)(id, uint64_t, void *))a6;
  v59 = v12;
  v57 = v10;
  v58 = v11;
  if (objc_msgSend(v12, "cancelledTransition"))
    v13 = v10;
  else
    v13 = v11;
  v14 = v13;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v15 = self->_slideTransitionClippingViews;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v78 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v20, "subviews");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v14, "containsObject:", v22) & 1) == 0)
        {
          if (!v22)
            goto LABEL_13;
          -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", v22, -[_UINavigationBarVisualProviderLegacyIOS _subviewIndexAboveBackground](self, "_subviewIndexAboveBackground"));
        }

LABEL_13:
        objc_msgSend(v20, "removeFromSuperview");
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    }
    while (v17);
  }

  -[NSMutableArray removeAllObjects](self->_slideTransitionClippingViews, "removeAllObjects");
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v23 = v14;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v74;
    v61 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v62 = *MEMORY[0x1E0C9BAA8];
    v60 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v74 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        v72[0] = v62;
        v72[1] = v61;
        v72[2] = v60;
        objc_msgSend(v28, "setTransform:", v72);
        if (objc_msgSend(v59, "cancelledTransition"))
        {
          objc_getAssociatedObject(v28, &_UINavigationBarOriginalFrameKey);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v29)
          {
            objc_msgSend(v29, "CGRectValue");
            objc_msgSend(v28, "setFrame:");
            objc_setAssociatedObject(v28, &_UINavigationBarOriginalFrameKey, 0, (void *)1);
          }

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v25);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v31 = v23;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v69 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
        objc_msgSend(v36, "superview");
        v37 = (UIView *)objc_claimAutoreleasedReturnValue();
        contentView = self->_contentView;

        if (v37 == contentView)
          objc_msgSend(v36, "removeFromSuperview");
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    }
    while (v33);
  }

  v39 = v59;
  if (objc_msgSend(v59, "cancelledTransition"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v40 = v58;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v65;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v65 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * m);
          objc_msgSend(v45, "setAlpha:", 1.0);
          objc_getAssociatedObject(v45, &_UINavigationBarOriginalFrameKey);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (v46)
          {
            objc_msgSend(v46, "CGRectValue");
            objc_msgSend(v45, "setFrame:");
            objc_setAssociatedObject(v45, &_UINavigationBarOriginalFrameKey, 0, (void *)1);
          }

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
      }
      while (v42);
    }

    v39 = v59;
  }
  v56[2](v56, 1, v39);
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_titleView");
  v49 = (UIView *)objc_claimAutoreleasedReturnValue();
  titleView = self->_titleView;
  self->_titleView = v49;

  if (objc_msgSend(v39, "shouldUpdatePromptAfterTransition"))
  {
    -[UINavigationBar updatePrompt](self->super._navigationBar, "updatePrompt");
    objc_msgSend(v39, "setShouldUpdatePromptAfterTransition:", 0);
  }
  -[_UINavigationBarVisualProviderLegacyIOS _updateBackground](self, "_updateBackground");
  objc_msgSend(v39, "decrementAnimationCount");
  -[UINavigationBar topItem](self->super._navigationBar, "topItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_pendingTitle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    if ((objc_msgSend(v39, "shouldAnimateAlongside") & 1) != 0)
    {
      objc_msgSend(v39, "transitionCoordinator");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __135___UINavigationBarVisualProviderLegacyIOS__completeNavigationTransitionWithIncomingViews_outgoingViews_transitionAssistant_completion___block_invoke;
      v63[3] = &unk_1E16B2150;
      v63[4] = self;
      objc_msgSend(v53, "animateAlongsideTransition:completion:", v63, 0);
    }
    else
    {
      -[UINavigationBar topItem](self->super._navigationBar, "topItem");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar topItem](self->super._navigationBar, "topItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "_pendingTitle");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "_setTitle:animated:matchBarButtonItemAnimationDuration:", v55, 1, 1);

    }
  }

}

- (void)_setViewsAnimated:(BOOL)a3 forTopNavigationItem:(id)a4 backNavigationItem:(id)a5 previousTopItem:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  _BOOL8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  CGSize v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  _UINavigationBarVisualProviderLegacyIOS *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  char v45;
  double v46;
  int v47;
  id *p_leftViews;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  double v56;
  double v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  unint64_t mm;
  void *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  _BOOL4 v74;
  id *p_rightViews;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  void *v82;
  _BOOL4 v83;
  void *v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t n;
  void *v96;
  BOOL v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t ii;
  void *v110;
  BOOL v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  uint64_t v119;
  void *kk;
  double v121;
  void *v122;
  uint64_t v123;
  UINavigationBar *v124;
  UINavigationBar *v125;
  NSMutableArray *slideTransitionClippingViews;
  void *v127;
  double v128;
  double v129;
  CGFloat v130;
  double v131;
  CGFloat v132;
  double v133;
  CGFloat v134;
  double v135;
  CGFloat v136;
  void *v137;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  BOOL v142;
  void *v143;
  char v144;
  double v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  unint64_t v151;
  unint64_t jj;
  void *v153;
  uint64_t v154;
  unint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  double v160;
  double v161;
  double v162;
  void *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  void *v169;
  _UINavigationBarVisualProviderLegacyIOS *v170;
  char v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  id v176;
  _BOOL4 v177;
  _BOOL4 v178;
  int v179;
  id v180;
  _BOOL4 v181;
  int v182;
  id v183;
  unsigned int v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  id obj;
  NSArray *obja;
  NSArray *objb;
  void *v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  _BOOL4 v198;
  uint64_t v199;
  id v200;
  _UINavigationBarVisualProviderLegacyIOS *v201;
  void *v202;
  _QWORD v203[4];
  id v204;
  _QWORD v205[4];
  id v206;
  _QWORD v207[5];
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  _QWORD aBlock[4];
  id v214;
  id v215;
  _QWORD v216[4];
  id v217;
  CGRect v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  _QWORD v227[4];
  id v228;
  BOOL v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  _QWORD v234[4];
  id v235;
  BOOL v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  _QWORD v241[4];
  id v242;
  uint64_t v243;
  _QWORD v244[4];
  id v245;
  id v246;
  uint64_t v247;
  char v248;
  CGRect rect1;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  uint64_t v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;

  v198 = a3;
  v264 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v188 = a5;
  v186 = a6;
  objc_msgSend(v9, "_customLeftViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v9;
  objc_msgSend(v9, "_customRightViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UINavigationBar _barStyle](self->super._navigationBar, "_barStyle");
  v201 = self;
  v13 = -[UINavigationBar isMinibar](self->super._navigationBar, "isMinibar");
  v254 = 0u;
  v255 = 0u;
  v256 = 0u;
  v257 = 0u;
  obj = v10;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v254, v263, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v255;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v255 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "setControlSize:", v13);
          objc_msgSend(v19, "setBarStyle:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v19, "setControlSize:", v13);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v254, v263, 16);
    }
    while (v16);
  }

  v252 = 0u;
  v253 = 0u;
  v250 = 0u;
  v251 = 0u;
  v193 = v11;
  v20 = v11;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v250, v262, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v251;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v251 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v25, "setControlSize:", v13);
          objc_msgSend(v25, "setBarStyle:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v25, "setControlSize:", v13);
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v250, v262, 16);
    }
    while (v22);
  }

  v26 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  rect1.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  rect1.size = v26;
  v27 = objc_msgSend(v14, "count");
  objc_msgSend(v187, "leftBarButtonItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "leftBarButtonItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = _dontCrossfadeBarButtonItems(v28, v29);

  objc_msgSend(v187, "rightBarButtonItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "rightBarButtonItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = _dontCrossfadeBarButtonItems(v30, v31);

  if ((objc_msgSend(v187, "hidesBackButton") & 1) != 0)
  {
    v32 = 0;
    v33 = v201;
  }
  else
  {
    v33 = v201;
    if (v27)
      v32 = objc_msgSend(v187, "leftItemsSupplementBackButton");
    else
      v32 = 1;
  }
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](v33, "_backButtonForBackItem:topItem:", v188, v187);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);
  v35 = objc_msgSend(v20, "count");
  if (v27 || v32)
  {
    v197 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

  }
  else
  {
    v197 = 0;
  }
  v184 = v32;
  if (v35)
  {
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

  }
  else
  {
    v36 = 0;
  }
  v37 = v197;
  -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:](v33, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:", &rect1, v197, v36, v188, v187);
  v38 = objc_msgSend(v197, "count");
  v39 = MEMORY[0x1E0C809B0];
  if (v38)
  {
    v40 = v38;
    v244[0] = MEMORY[0x1E0C809B0];
    v244[1] = 3221225472;
    v244[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke;
    v244[3] = &unk_1E16B6038;
    v248 = v184;
    v245 = v34;
    v246 = v197;
    v247 = v40;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v244);

  }
  v41 = objc_msgSend(v36, "count");
  if (v41)
  {
    v42 = v41;
    v241[0] = v39;
    v241[1] = 3221225472;
    v241[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_2;
    v241[3] = &unk_1E16B6060;
    v242 = v36;
    v243 = v42;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v241);

  }
  v192 = v36;
  v185 = v34;
  if (v198)
  {
    v180 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v183 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v14 && v33->_leftViews && objc_msgSend(v14, "isEqualToArray:") && v33->_leftViews)
    {
      v182 = 0;
      v176 = 0;
    }
    else
    {
      p_leftViews = (id *)&v33->_leftViews;
      if (v33->_leftViews)
      {
        objc_msgSend(v180, "addObjectsFromArray:");
        if (v181)
        {
          objc_msgSend(*p_leftViews, "lastObject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setAlpha:", 0.0);

        }
        v239 = 0u;
        v240 = 0u;
        v237 = 0u;
        v238 = 0u;
        v50 = *p_leftViews;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v237, v261, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v238;
          do
          {
            for (k = 0; k != v52; ++k)
            {
              if (*(_QWORD *)v238 != v53)
                objc_enumerationMutation(v50);
              v55 = *(void **)(*((_QWORD *)&v237 + 1) + 8 * k);
              if (objc_msgSend(v55, "isUserInteractionEnabled"))
              {
                objc_msgSend(v43, "addObject:", v55);
                objc_msgSend(v55, "setUserInteractionEnabled:", 0);
              }
            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v237, v261, 16);
          }
          while (v52);
        }

        v176 = *p_leftViews;
        v33 = v201;
      }
      else
      {
        v176 = 0;
      }
      if (v14)
      {
        v234[0] = MEMORY[0x1E0C809B0];
        v234[1] = 3221225472;
        v234[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_3;
        v234[3] = &unk_1E16B6088;
        v236 = v181;
        v235 = v183;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v234);

        v74 = 1;
      }
      else
      {
        v74 = *p_leftViews != 0;
      }
      v182 = v74;
      objc_storeStrong(p_leftViews, obj);
      v37 = v197;
      v39 = MEMORY[0x1E0C809B0];
    }
    if (v20 && v33->_rightViews && objc_msgSend(v20, "isEqualToArray:") && v33->_rightViews)
    {
      objc_msgSend(v187, "_titleView", 0);
    }
    else
    {
      p_rightViews = (id *)&v33->_rightViews;
      if (v33->_rightViews)
      {
        objc_msgSend(v180, "addObjectsFromArray:");
        if (v177)
        {
          objc_msgSend(*p_rightViews, "lastObject");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setAlpha:", 0.0);

        }
        v232 = 0u;
        v233 = 0u;
        v230 = 0u;
        v231 = 0u;
        v77 = *p_rightViews;
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v230, v260, 16);
        if (v78)
        {
          v79 = v78;
          v80 = *(_QWORD *)v231;
          do
          {
            for (m = 0; m != v79; ++m)
            {
              if (*(_QWORD *)v231 != v80)
                objc_enumerationMutation(v77);
              v82 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * m);
              if (objc_msgSend(v82, "isUserInteractionEnabled"))
              {
                objc_msgSend(v43, "addObject:", v82);
                objc_msgSend(v82, "setUserInteractionEnabled:", 0);
              }
            }
            v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v230, v260, 16);
          }
          while (v79);
        }

        v175 = *p_rightViews;
        v37 = v197;
        v39 = MEMORY[0x1E0C809B0];
      }
      else
      {
        v175 = 0;
      }
      if (v20)
      {
        v227[0] = v39;
        v227[1] = 3221225472;
        v227[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_4;
        v227[3] = &unk_1E16B6088;
        v229 = v177;
        v228 = v183;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v227, v175, v176);

        v83 = 1;
      }
      else
      {
        v83 = *p_rightViews != 0;
      }
      v182 |= v83;
      objc_storeStrong((id *)&v33->_rightViews, v193);
      objc_msgSend(v187, "_titleView", v175);
    }
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "frame");
    v266.origin.x = v85;
    v266.origin.y = v86;
    v266.size.width = v87;
    v266.size.height = v88;
    v178 = CGRectEqualToRect(rect1, v266);

    v199 = -[_UINavigationBarVisualProviderLegacyIOS _subviewIndexAboveBackground](v33, "_subviewIndexAboveBackground");
    v89 = objc_msgSend(v37, "count");
    v90 = -[NSArray count](v33->_leftViews, "count");
    v223 = 0u;
    v224 = 0u;
    v225 = 0u;
    v226 = 0u;
    obja = v33->_leftViews;
    v91 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v223, v259, 16);
    if (v91)
    {
      v92 = v91;
      v93 = 0;
      v94 = v89 > v90;
      v194 = *(id *)v224;
      while (2)
      {
        for (n = 0; n != v92; ++n)
        {
          if (*(id *)v224 != v194)
            objc_enumerationMutation(obja);
          v96 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * n);
          -[UIView insertSubview:atIndex:](v33->_contentView, "insertSubview:atIndex:", v96, v199);
          if ((v93 & 1) != 0)
          {
            v97 = 0;
          }
          else
          {
            objc_msgSend(v96, "frame");
            v99 = v98;
            v101 = v100;
            objc_msgSend(v197, "objectAtIndexedSubscript:", v94 + n);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "CGRectValue");
            v97 = v101 != v104 || v99 != v103;

          }
          v93 |= v97;
          if (v94 + n + 1 >= v89)
          {
            v33 = v201;
            goto LABEL_138;
          }
          v33 = v201;
        }
        v92 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v223, v259, 16);
        v94 += n;
        if (v92)
          continue;
        break;
      }
    }
    else
    {
      v93 = 0;
    }
LABEL_138:
    v179 = !v178;

    v195 = (id)objc_msgSend(v192, "count");
    v219 = 0u;
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    objb = v33->_rightViews;
    v105 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v219, v258, 16);
    if (v105)
    {
      v106 = v105;
      v107 = 0;
      v108 = *(_QWORD *)v220;
      while (2)
      {
        for (ii = 0; ii != v106; ++ii)
        {
          if (*(_QWORD *)v220 != v108)
            objc_enumerationMutation(objb);
          v110 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * ii);
          -[UIView insertSubview:atIndex:](v33->_contentView, "insertSubview:atIndex:", v110, v199);
          if ((v93 & 1) != 0)
          {
            v111 = 0;
          }
          else
          {
            objc_msgSend(v110, "frame");
            v113 = v112;
            v115 = v114;
            objc_msgSend(v192, "objectAtIndexedSubscript:", v107 + ii);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "CGRectValue");
            v111 = v115 != v118 || v113 != v117;

          }
          v93 |= v111;
          if (v107 + ii + 1 >= (unint64_t)v195)
          {
            v33 = v201;
            goto LABEL_154;
          }
          v33 = v201;
        }
        v106 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v219, v258, 16);
        v107 += ii;
        if (v106)
          continue;
        break;
      }
    }
LABEL_154:

    if ((v93 & 1) != 0)
    {
      objc_msgSend(v197, "removeAllObjects");
      objc_msgSend(v192, "removeAllObjects");
      -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:](v33, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:", &rect1, v197, v192, v188, v187);
    }
    v119 = MEMORY[0x1E0C809B0];
    kk = v183;
    if (!(v182 | v179))
      goto LABEL_187;
    objc_msgSend(v187, "_titleViewWidthForAnimations");
    if (v121 == 0.0)
    {
      objc_msgSend(v187, "_titleView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "setFrame:", rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
    }
    else
    {
      v216[0] = v119;
      v216[1] = 3221225472;
      v216[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_5;
      v216[3] = &unk_1E16B20D8;
      v217 = v187;
      v218 = rect1;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v216, 0.25);
      v122 = v217;
    }

    if (v185)
      v123 = v184;
    else
      v123 = 0;
    if ((_DWORD)v123 == 1)
    {
      objc_msgSend(v185, "superview");
      v124 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
      v125 = v124;
      if (v124 == v33->super._navigationBar)
      {

      }
      else
      {
        slideTransitionClippingViews = v33->_slideTransitionClippingViews;
        objc_msgSend(v185, "superview");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(slideTransitionClippingViews) = -[NSMutableArray containsObject:](slideTransitionClippingViews, "containsObject:", v127);

        kk = v183;
        if ((slideTransitionClippingViews & 1) == 0)
          -[UIView addSubview:](v33->_contentView, "addSubview:", v185);
      }
      objc_msgSend(v185, "alpha");
      if (v128 < 0.5)
        goto LABEL_172;
      objc_msgSend(v185, "frame");
      v130 = v129;
      v132 = v131;
      v134 = v133;
      v136 = v135;
      objc_msgSend(v197, "objectAtIndex:", 0);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "CGRectValue");
      v267.origin.x = v138;
      v267.origin.y = v139;
      v267.size.width = v140;
      v267.size.height = v141;
      v265.origin.x = v130;
      v265.origin.y = v132;
      v265.size.width = v134;
      v265.size.height = v136;
      v142 = CGRectEqualToRect(v265, v267);

      if (!v142)
      {
LABEL_172:
        objc_msgSend(kk, "addObject:", v185);
        objc_msgSend(v197, "objectAtIndex:", 0);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "CGRectValue");
        objc_msgSend(v185, "setFrame:");

      }
    }
    else
    {
      objc_msgSend(v185, "removeFromSuperview");
      objc_msgSend(v185, "setAlpha:", 0.0);
      if (!v185)
      {
LABEL_176:
        v146 = objc_msgSend(v197, "count");
        v147 = v123;
        if (v146 > v123)
        {
          v148 = 0;
          do
          {
            -[NSArray objectAtIndex:](v33->_leftViews, "objectAtIndex:", v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v197, "objectAtIndex:", v123 + v148);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "CGRectValue");
            objc_msgSend(v149, "setFrame:");

            v151 = objc_msgSend(v197, "count");
            ++v148;
            v147 = v123 + v148;
          }
          while (v123 + v148 < v151);
          kk = v183;
        }
        for (jj = v147 - v123; jj < -[NSArray count](v33->_leftViews, "count"); ++jj)
        {
          -[NSArray objectAtIndex:](v33->_leftViews, "objectAtIndex:", jj);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "removeFromSuperview");
          objc_msgSend(kk, "removeObject:", v153);

        }
        v154 = objc_msgSend(v192, "count");
        v119 = MEMORY[0x1E0C809B0];
        v155 = 0;
        if (v154)
        {
          do
          {
            -[NSArray objectAtIndex:](v33->_rightViews, "objectAtIndex:", v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "objectAtIndex:", v155);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "CGRectValue");
            objc_msgSend(v156, "setFrame:");

            ++v155;
          }
          while (v155 < objc_msgSend(v192, "count"));
        }
        for (kk = v183; v155 < -[NSArray count](v33->_rightViews, "count"); ++v155)
        {
          -[NSArray objectAtIndex:](v33->_rightViews, "objectAtIndex:", v155);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "removeFromSuperview");
          objc_msgSend(v183, "removeObject:", v158);

        }
LABEL_187:
        -[_UINavigationBarItemStack transitionAssistant](v33->super._stack, "transitionAssistant");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "duration");
        v161 = v160;

        if (v161 == 0.0)
        {
          +[UINavigationBar defaultAnimationDuration](UINavigationBar, "defaultAnimationDuration");
          v161 = v162;
        }
        -[_UINavigationBarItemStack transitionAssistant](v33->super._stack, "transitionAssistant");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "incrementAnimationCount");

        aBlock[0] = v119;
        aBlock[1] = 3221225472;
        aBlock[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_6;
        aBlock[3] = &unk_1E16B1B50;
        v164 = v180;
        v214 = v164;
        v165 = kk;
        v215 = v165;
        v202 = _Block_copy(aBlock);
        v207[0] = v119;
        v207[1] = 3221225472;
        v207[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_7;
        v207[3] = &unk_1E16B60B0;
        v207[4] = v33;
        v200 = v165;
        v208 = v200;
        v72 = v164;
        v209 = v72;
        v196 = v176;
        v210 = v196;
        v166 = v174;
        v211 = v166;
        v167 = v43;
        v212 = v167;
        v168 = _Block_copy(v207);
        -[_UINavigationBarItemStack transitionAssistant](v33->super._stack, "transitionAssistant");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = v33;
        v171 = objc_msgSend(v169, "shouldAnimateAlongside");

        if ((v171 & 1) != 0)
        {
          -[_UINavigationBarItemStack transitionAssistant](v170->super._stack, "transitionAssistant");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "transitionCoordinator");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          v205[0] = v119;
          v205[1] = 3221225472;
          v205[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_8;
          v205[3] = &unk_1E16B1CC8;
          v206 = v202;
          v203[0] = v119;
          v203[1] = 3221225472;
          v203[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_9;
          v203[3] = &unk_1E16B1CC8;
          v204 = v168;
          objc_msgSend(v173, "animateAlongsideTransition:completion:", v205, v203);

        }
        else
        {
          +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v170, v202, v168, v161, 0.0);
        }

        v68 = v187;
        v73 = v185;
        v36 = v192;
        goto LABEL_193;
      }
    }
    v144 = objc_msgSend(v185, "_suppressesBackIndicatorView");
    v145 = 0.0;
    if ((v144 & 1) == 0)
      objc_msgSend(v185, "alpha", 0.0);
    -[UIView setAlpha:](v33->_backIndicatorView, "setAlpha:", v145);
    goto LABEL_176;
  }
  if (!v14 || !v33->_leftViews || !objc_msgSend(v14, "isEqualToArray:") || !v33->_leftViews)
  {
    -[NSArray makeObjectsPerformSelector:](v33->_leftViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_storeStrong((id *)&v33->_leftViews, obj);
  }
  if (!v20 || !v33->_rightViews || !objc_msgSend(v20, "isEqualToArray:") || !v33->_rightViews)
  {
    -[NSArray makeObjectsPerformSelector:](v33->_rightViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_storeStrong((id *)&v33->_rightViews, v193);
  }
  if (v184)
  {
    objc_msgSend(v34, "setPressed:", 0);
    objc_msgSend(v34, "setStyle:", -[UINavigationBar _barStyle](v33->super._navigationBar, "_barStyle"));
    -[_UINavigationBarItemStack transitionAssistant](v33->super._stack, "transitionAssistant");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "shouldHideBackButtonDuringTransition");
    v46 = 0.0;
    if ((v45 & 1) == 0)
    {
      v47 = objc_msgSend(v187, "hidesBackButton", 0.0);
      v46 = 1.0;
      if (v47)
        v46 = 0.0;
    }
    objc_msgSend(v34, "setAlpha:", v46);

  }
  else
  {
    objc_msgSend(v34, "removeFromSuperview");
    objc_msgSend(v34, "setAlpha:", 0.0);
  }
  v56 = 0.0;
  if (v34 && (objc_msgSend(v34, "_suppressesBackIndicatorView") & 1) == 0)
  {
    objc_msgSend(v34, "alpha");
    v56 = v57;
  }
  -[UIView setAlpha:](v33->_backIndicatorView, "setAlpha:", v56);
  if (v34)
    v58 = v184;
  else
    v58 = 0;
  v59 = objc_msgSend(v197, "count");
  v60 = v58;
  if (v59 > v58)
  {
    v61 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndex:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "objectAtIndex:", v58 + v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "CGRectValue");
      objc_msgSend(v62, "setFrame:");

      -[UIView addSubview:](v201->_contentView, "addSubview:", v62);
      objc_msgSend(v62, "setAlpha:", 1.0);

      v64 = objc_msgSend(v197, "count");
      ++v61;
      v60 = v58 + v61;
    }
    while (v58 + v61 < v64);
  }
  for (mm = v60 - v58; mm < -[NSArray count](v201->_leftViews, "count"); ++mm)
  {
    -[NSArray objectAtIndex:](v201->_leftViews, "objectAtIndex:", mm);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "removeFromSuperview");

  }
  v67 = 0;
  if (objc_msgSend(v36, "count"))
  {
    v68 = v187;
    do
    {
      objc_msgSend(v20, "objectAtIndex:", v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndex:", v67);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "CGRectValue");
      objc_msgSend(v69, "setFrame:");

      -[UIView addSubview:](v201->_contentView, "addSubview:", v69);
      objc_msgSend(v69, "setAlpha:", 1.0);

      ++v67;
    }
    while (v67 < objc_msgSend(v36, "count"));
  }
  else
  {
    v68 = v187;
  }
  while (v67 < -[NSArray count](v201->_rightViews, "count"))
  {
    -[NSArray objectAtIndex:](v201->_rightViews, "objectAtIndex:", v67);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "removeFromSuperview");

    ++v67;
  }
  objc_msgSend(v68, "_titleView");
  v72 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFrame:", rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
  v73 = v34;
LABEL_193:

}

- (void)_completeTopItemTransitionWithIncomingViews:(id)a3 outgoingViews:(id)a4 previousLeftViews:(id)a5 previousRightViews:(id)a6 enableUserInteraction:(id)a7 transitionAssistant:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  UIView *v24;
  UIView *contentView;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  id obj;
  id v37;
  int v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v37 = a5;
  v41 = a5;
  obj = a6;
  v40 = a6;
  v16 = a7;
  v39 = a8;
  v38 = objc_msgSend(v39, "cancelledTransition");
  v42 = v15;
  v43 = v14;
  if (v38)
    v17 = v14;
  else
    v17 = v15;
  v18 = v17;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v23, "superview", obj, v37);
        v24 = (UIView *)objc_claimAutoreleasedReturnValue();
        contentView = self->_contentView;

        if (v24 == contentView)
          objc_msgSend(v23, "removeFromSuperview");
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v20);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v26 = v16;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v49 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "setUserInteractionEnabled:", 1, obj);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v28);
  }

  if (v38)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v31 = v42;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v45 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "setAlpha:", 1.0, obj);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v33);
    }

    objc_storeStrong((id *)&self->_rightViews, obj);
    objc_storeStrong((id *)&self->_leftViews, v37);
  }
  objc_msgSend(v39, "decrementAnimationCount", obj);

}

- (void)_updateBackground
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  int64_t v11;
  BOOL v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  UIBarStyle v17;
  UINavigationBar *navigationBar;
  int v19;
  id v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  _UIBarBackgroundLayoutLegacy *v30;
  _UIBarBackgroundLayoutLegacy *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  _UIBarBackgroundLayoutLegacy *backgroundViewLayout;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  _BOOL4 v42;
  UINavigationBar *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  BOOL v65;
  void *v66;
  _BOOL4 v67;
  char v68;
  id v69;
  uint64_t v70;
  char v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  if (-[UIView _canDrawContent](self->super._navigationBar, "_canDrawContent"))
  {
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    -[UIView setNeedsDisplay](self->super._navigationBar, "setNeedsDisplay");
    return;
  }
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", self->_customBackgroundView);
  -[UIView insertSubview:atIndex:](self->super._navigationBar, "insertSubview:atIndex:", self->_backgroundView, 0);
  -[UIView bounds](self->super._navigationBar, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UINavigationBar _barPosition](self->super._navigationBar, "_barPosition");
  v12 = v11 == 3;
  if (self->_customBackgroundView)
  {
    -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](self->_backgroundViewLayout, "configureWithoutShadow");
    -[_UIBarBackgroundLayoutLegacy setTopInset:](self->_backgroundViewLayout, "setTopInset:", 0.0);
    if (v11 == 3)
    {
      v13 = v10;
      goto LABEL_45;
    }
    v13 = v10;
    goto LABEL_48;
  }
  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceIdiom:](self->_backgroundViewLayout, "setInterfaceIdiom:", objc_msgSend(v14, "userInterfaceIdiom"));

  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceStyle:](self->_backgroundViewLayout, "setInterfaceStyle:", objc_msgSend(v15, "userInterfaceStyle"));

  v67 = -[UINavigationBar isTranslucent](self->super._navigationBar, "isTranslucent");
  -[UINavigationBar _effectiveBarTintColor](self->super._navigationBar, "_effectiveBarTintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v70 = 0;
  v17 = -[UINavigationBar barStyle](self->super._navigationBar, "barStyle");
  navigationBar = self->super._navigationBar;
  if (v17 != 4)
  {
    v69 = 0;
    -[UINavigationBar _getBackgroundImage:shouldRespectOversizedBackgroundImage:actualBarMetrics:actualBarPosition:](navigationBar, "_getBackgroundImage:shouldRespectOversizedBackgroundImage:actualBarMetrics:actualBarPosition:", &v69, &v71, &v70, 0);
    v20 = v69;
    v19 = -[UINavigationBar _hidesShadow](self->super._navigationBar, "_hidesShadow");
    if (!v20)
      goto LABEL_15;
    v66 = v16;
    objc_msgSend(v20, "size");
    v13 = v21;
    objc_msgSend(v20, "capInsets");
    v24 = 0;
    if (v11 == 3 && v22 == 0.0 && v23 == 0.0)
    {
      v65 = v11 == 3;
      -[UIView window](self->super._navigationBar, "window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isStatusBarHidden");

      if ((v27 & 1) != 0)
      {
        v24 = 0;
      }
      else
      {
        -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "barHeightForMetrics:", v70);
        v24 = v13 == v35;

      }
      v12 = v65;
    }
    v68 = 0;
    objc_msgSend(v20, "_isInvisibleAndGetIsTranslucent:", &v68);
    if (v67)
    {
      -[_UIBarBackgroundLayoutLegacy configureImage:forceTranslucent:](self->_backgroundViewLayout, "configureImage:forceTranslucent:", v20, v68 == 0);
    }
    else
    {
      backgroundViewLayout = self->_backgroundViewLayout;
      if (v66)
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:backgroundTintColor:](backgroundViewLayout, "configureImage:forceOpaque:backgroundTintColor:", v20, v68 != 0);
      else
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:barStyle:](backgroundViewLayout, "configureImage:forceOpaque:barStyle:", v20, v68 != 0, v17);
    }
    if (v71)
      v37 = 1;
    else
      v37 = v19;
    if (v37 == 1)
    {
      if (!v71)
        v13 = v10;
      if ((v19 & 1) != 0)
      {
        -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](self->_backgroundViewLayout, "configureWithoutShadow");
        goto LABEL_41;
      }
    }
    else
    {
      -[UINavigationBar shadowImage](self->super._navigationBar, "shadowImage");
      v38 = objc_claimAutoreleasedReturnValue();
      v13 = v10;
      if (v38)
      {
        v32 = (void *)v38;
        -[_UIBarBackgroundLayoutLegacy configureShadowImage:](self->_backgroundViewLayout, "configureShadowImage:", v38);
        v33 = 0.0;
        v13 = v10;
        if (v24)
        {
LABEL_42:
          -[UIView window](self->super._navigationBar, "window");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          __UIStatusBarManagerForWindow(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "defaultStatusBarHeightInOrientation:", 1);
          v33 = v41;

          goto LABEL_43;
        }
        v13 = v10;
LABEL_43:
        v16 = v66;
        goto LABEL_44;
      }
    }
    -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](self->_backgroundViewLayout, "configureShadowForBarStyle:", v17);
LABEL_41:
    v32 = 0;
    v33 = 0.0;
    if (v24)
      goto LABEL_42;
    goto LABEL_43;
  }
  v19 = -[UINavigationBar _hidesShadow](navigationBar, "_hidesShadow");
LABEL_15:
  -[UIView _screen](self->super._navigationBar, "_screen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "_userInterfaceIdiom");

  v30 = self->_backgroundViewLayout;
  if (v29 == 3)
  {
    -[_UIBarBackgroundLayoutLegacy configureAsTransparent](v30, "configureAsTransparent");
    v12 = 0;
  }
  else
  {
    -[_UIBarBackgroundLayoutLegacy configureEffectForStyle:backgroundTintColor:forceOpaque:](v30, "configureEffectForStyle:backgroundTintColor:forceOpaque:", v17, v16, !v67);
  }
  v31 = self->_backgroundViewLayout;
  if (v19)
    -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](v31, "configureWithoutShadow");
  else
    -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](v31, "configureShadowForBarStyle:", v17);
  v20 = 0;
  v32 = 0;
  v33 = 0.0;
  v13 = v10;
LABEL_44:
  -[_UIBarBackgroundLayoutLegacy setTopInset:](self->_backgroundViewLayout, "setTopInset:", v33);

  if (v12)
  {
LABEL_45:
    v42 = -[UINavigationBar _delegateWantsNavigationBarHidden](self->super._navigationBar, "_delegateWantsNavigationBarHidden");
    v43 = self->super._navigationBar;
    if (v42)
    {
      -[UIView window](v43, "window");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isStatusBarHidden");

      if ((v46 & 1) == 0)
      {
        -[UIView window](self->super._navigationBar, "window");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        __UIStatusBarManagerForWindow(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "defaultStatusBarHeightInOrientation:", 1);
        v50 = v49;

        v72.origin.x = v4;
        v72.origin.y = v6;
        v72.size.width = v8;
        v72.size.height = v10;
        v51 = CGRectGetMinY(v72) - v50;
        v73.origin.x = v4;
        v73.origin.y = v6;
        v73.size.width = v8;
        v73.size.height = v10;
        v13 = v50 + CGRectGetHeight(v73);
        v6 = v51;
      }
    }
    else
    {
      -[UIView frame](v43, "frame");
      v6 = -v53;
      v13 = v53 + v54;
    }
    goto LABEL_50;
  }
LABEL_48:
  -[_UIBarBackgroundLayoutLegacy topInset](self->_backgroundViewLayout, "topInset");
  v6 = v6 - v52;
  v13 = v13 + v52;
LABEL_50:
  -[UIView frame](self->_backgroundView, "frame");
  v75.origin.x = v55;
  v75.origin.y = v56;
  v75.size.width = v57;
  v75.size.height = v58;
  v74.origin.x = v4;
  v74.origin.y = v6;
  v74.size.width = v8;
  v74.size.height = v13;
  if (!CGRectEqualToRect(v74, v75))
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v13);
  -[UINavigationBar topItem](self->super._navigationBar, "topItem");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "_backgroundHidden");

  if (v60)
  {
    -[_UIBarBackgroundLayoutLegacy configureAsTransparent](self->_backgroundViewLayout, "configureAsTransparent");
    -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](self->_backgroundViewLayout, "configureWithoutShadow");
    -[_UIBarBackgroundLayout setShadowAlpha:](self->_backgroundViewLayout, "setShadowAlpha:", 1.0);
  }
  -[_UINavigationBarVisualProviderLegacyIOS updateBackgroundGroupName](self, "updateBackgroundGroupName");
  -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  -[UINavigationBar _updatePaletteBackgroundIfNecessary](self->super._navigationBar, "_updatePaletteBackgroundIfNecessary");
  -[UINavigationBar _accessibilityButtonBackgroundTintColor](self->super._navigationBar, "_accessibilityButtonBackgroundTintColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = 0;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v63, "_graphicsQuality") == 100
       && _UIBarBlurAcceptsBlendModeOnBackground(self->super._navigationBar);

  }
  -[UIView subviews](self->_contentView, "subviews");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  _UINavigationButtonUpdateAccessibilityBackgrounds(v64, v62, v61);

}

- (void)updateBackgroundGroupName
{
  void *v3;
  void *v4;
  id v5;

  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackground setGroupName:](self->_backgroundView, "setGroupName:", v4);

}

- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView **v14;
  uint64_t v15;
  UIImageView *backIndicatorView;
  double v17;
  void *v18;
  void *v19;
  _UIBarBackground *backgroundView;
  UIImageView *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "_titleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleView:", v11);

  objc_msgSend(v8, "setPromptView:", self->_prompt);
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (self->_backIndicatorView)
    {
      v23[0] = self->_backIndicatorView;
      v23[1] = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = (UIImageView **)v23;
      v15 = 2;
LABEL_10:
      objc_msgSend(v13, "arrayWithObjects:count:", v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setViewsRepresentingBackButton:", v18);

      goto LABEL_11;
    }
    v22 = v12;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = (UIImageView **)&v22;
LABEL_9:
    v15 = 1;
    goto LABEL_10;
  }
  if (-[_UINavigationBarVisualProviderLegacyIOS _shouldShowBackButtonForNavigationItem:](self, "_shouldShowBackButtonForNavigationItem:", v9))
  {
    backIndicatorView = self->_backIndicatorView;
    if (backIndicatorView)
    {
      -[UIView alpha](backIndicatorView, "alpha");
      if (v17 > 0.0)
      {
        v21 = self->_backIndicatorView;
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = &v21;
        goto LABEL_9;
      }
    }
  }
LABEL_11:
  if (self->_backgroundView)
  {
    backgroundView = self->_backgroundView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &backgroundView, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setViewsRepresentingContentBackground:", v19);

  }
}

- (void)_setUpContentFocusContainerGuide
{
  void *v3;
  UIFocusContainerGuide *v4;
  UIFocusContainerGuide *contentFocusContainerGuide;
  void *v6;
  void *v7;
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
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[UIView _focusSystem](self->super._navigationBar, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!self->_contentFocusContainerGuide)
    {
      v4 = objc_alloc_init(UIFocusContainerGuide);
      contentFocusContainerGuide = self->_contentFocusContainerGuide;
      self->_contentFocusContainerGuide = v4;

      -[UIView addLayoutGuide:](self->super._navigationBar, "addLayoutGuide:", self->_contentFocusContainerGuide);
      -[UILayoutGuide setIdentifier:](self->_contentFocusContainerGuide, "setIdentifier:", CFSTR("UINavigationBarContentFocusContainerGuide"));
      v16 = (void *)MEMORY[0x1E0D156E0];
      -[UILayoutGuide topAnchor](self->_contentFocusContainerGuide, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->super._navigationBar, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v17;
      -[UILayoutGuide leadingAnchor](self->_contentFocusContainerGuide, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->super._navigationBar, "leadingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v8;
      -[UILayoutGuide trailingAnchor](self->_contentFocusContainerGuide, "trailingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->super._navigationBar, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v11;
      -[UILayoutGuide bottomAnchor](self->_contentFocusContainerGuide, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->super._navigationBar, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activateConstraints:", v15);

    }
  }
}

- (id)_shim_contentView
{
  return self->_contentView;
}

- (id)_shim_layoutView
{
  return self->_layoutView;
}

- (id)_shim_displayViewsIncludingHiddenBackButtonViews:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView **p_backIndicatorView;

  -[UIView subviews](self->_contentView, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", self->_backgroundView);
  if (!a3)
  {
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backButtonView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (objc_msgSend(v7, "hidesBackButton"))
        objc_msgSend(v6, "removeObject:", v9);
      p_backIndicatorView = &self->_backIndicatorView;
      if (!*p_backIndicatorView
        || (objc_msgSend(v7, "hidesBackButton") & 1) == 0
        && objc_msgSend(v7, "_wantsBackButtonIndicator")
        && !objc_msgSend(v9, "_suppressesBackIndicatorView"))
      {
        goto LABEL_12;
      }
    }
    else
    {
      p_backIndicatorView = &self->_backIndicatorView;
      if (!*p_backIndicatorView)
      {
LABEL_12:

        return v6;
      }
    }
    objc_msgSend(v6, "removeObject:", *p_backIndicatorView);
    goto LABEL_12;
  }
  return v6;
}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    -[_UINavigationBarVisualProviderLegacyIOS _updateBackground](self, "_updateBackground");
    v5 = v6;
  }

}

- (id)_shim_compatibilityBackgroundView
{
  _UIBarBackground *customBackgroundView;

  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView)
    customBackgroundView = self->_backgroundView;
  return customBackgroundView;
}

- (double)_shim_shadowAlpha
{
  double result;

  -[_UIBarBackgroundLayout shadowAlpha](self->_backgroundViewLayout, "shadowAlpha");
  return result;
}

- (void)_shim_setShadowAlpha:(double)a3
{
  -[_UIBarBackgroundLayout setShadowAlpha:](self->_backgroundViewLayout, "setShadowAlpha:", a3);
}

- (void)_shim_setUseContentView:(BOOL)a3
{
  _UINavigationBarLegacyContentView *v4;
  _UINavigationBarLegacyContentView *v5;
  UIView **p_layoutView;
  _UINavigationBarLegacyContentView *layoutView;
  _UINavigationBarLegacyContentView *v8;

  if (a3)
  {
    v4 = [_UINavigationBarLegacyContentView alloc];
    -[UIView bounds](self->super._navigationBar, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    p_layoutView = (UIView **)&self->_layoutView;
    layoutView = self->_layoutView;
    self->_layoutView = v5;

    -[_UINavigationBarLegacyContentView setVisualProvider:](self->_layoutView, "setVisualProvider:", self);
    -[UIView addSubview:](self->super._navigationBar, "addSubview:", self->_layoutView);
  }
  else
  {
    -[UIView removeFromSuperview](self->_layoutView, "removeFromSuperview");
    v8 = self->_layoutView;
    self->_layoutView = 0;

    p_layoutView = (UIView **)&self->super._navigationBar;
  }
  self->_contentView = *p_layoutView;
}

- (BOOL)_shim_disableBlurTinting
{
  return -[_UIBarBackgroundLayout disableTinting](self->_backgroundViewLayout, "disableTinting");
}

- (void)_shim_setDisableBlurTinting:(BOOL)a3
{
  -[_UIBarBackgroundLayout setDisableTinting:](self->_backgroundViewLayout, "setDisableTinting:", a3);
  -[_UINavigationBarVisualProviderLegacyIOS changeAppearance](self, "changeAppearance");
}

- (double)_shim_backgroundHeight
{
  double v2;

  -[UIView frame](self->_backgroundView, "frame");
  return v2;
}

- (int64_t)_shim_backdropStyle
{
  UIBarStyle v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v9;

  if (!-[_UIBarBackgroundLayoutLegacy hasBackgroundEffect](self->_backgroundViewLayout, "hasBackgroundEffect"))
    return 0;
  v3 = -[UINavigationBar barStyle](self->super._navigationBar, "barStyle");
  -[UIView traitCollection](self->super._navigationBar, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  v6 = 2010;
  if ((unint64_t)(v3 - 1) < 2)
    v6 = 2030;
  v7 = 4004;
  if ((unint64_t)(v3 - 1) < 2)
    v7 = 4009;
  if (v5 == 8 || v5 == 2)
    v9 = v7;
  else
    v9 = v6;

  return v9;
}

- (id)_shim_userContentGuide
{
  UILayoutGuide *userContentGuide;
  UILayoutGuide *v4;
  UILayoutGuide *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *userContentGuideLeading;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *userContentGuideTrailing;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  userContentGuide = self->_userContentGuide;
  if (!userContentGuide)
  {
    v4 = objc_alloc_init(UILayoutGuide);
    v5 = self->_userContentGuide;
    self->_userContentGuide = v4;

    -[UIView addLayoutGuide:](self->super._navigationBar, "addLayoutGuide:", self->_userContentGuide);
    -[UILayoutGuide _setLockedToOwningView:](self->_userContentGuide, "_setLockedToOwningView:", 1);
    -[UILayoutGuide setIdentifier:](self->_userContentGuide, "setIdentifier:", CFSTR("_UINavigationBarContentGuide"));
    -[UILayoutGuide topAnchor](self->_userContentGuide, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->super._navigationBar, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setIdentifier:", CFSTR("_UINavigationBarContentGuide.top"));
    -[UILayoutGuide bottomAnchor](self->_userContentGuide, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->super._navigationBar, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIdentifier:", CFSTR("_UINavigationBarContentGuide.bottom"));
    -[UILayoutGuide leadingAnchor](self->_userContentGuide, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->super._navigationBar, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    userContentGuideLeading = self->_userContentGuideLeading;
    self->_userContentGuideLeading = v14;

    -[NSLayoutConstraint setIdentifier:](self->_userContentGuideLeading, "setIdentifier:", CFSTR("_UINavigationBarContentGuide.leading"));
    -[UIView trailingAnchor](self->super._navigationBar, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_userContentGuide, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    userContentGuideTrailing = self->_userContentGuideTrailing;
    self->_userContentGuideTrailing = v18;

    -[NSLayoutConstraint setIdentifier:](self->_userContentGuideTrailing, "setIdentifier:", CFSTR("_UINavigationBarContentGuide.trailing"));
    v25[0] = v8;
    v25[1] = v11;
    v20 = self->_userContentGuideTrailing;
    v25[2] = self->_userContentGuideLeading;
    v25[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](self->_userContentGuide, "_setSystemConstraints:", v21);

    v22 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](self->_userContentGuide, "_systemConstraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v23);

    userContentGuide = self->_userContentGuide;
  }
  return userContentGuide;
}

- (void)_shim_updateUserContentGuideForTopItem:(id)a3 backItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v6 = a3;
  if (self->_userContentGuide)
  {
    -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", a4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "_wantsBackButtonIndicator");
    v13 = 0.0;
    -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderLegacyIOS _getLeftMargin:rightMargin:forNavigationItem:showingBackButton:visualStyle:](self, "_getLeftMargin:rightMargin:forNavigationItem:showingBackButton:visualStyle:", &v13, &v12, v6, v8, v9);
    -[UIView bounds](self->super._navigationBar, "bounds");
    v10 = v13;
    if (v11 < v13 + v12)
    {
      v12 = 0.0;
      v13 = 0.0;
      v10 = 0.0;
    }
    -[NSLayoutConstraint setConstant:](self->_userContentGuideLeading, "setConstant:", v10, *(_QWORD *)&v12, *(_QWORD *)&v13);
    -[NSLayoutConstraint setConstant:](self->_userContentGuideTrailing, "setConstant:", v12);

  }
}

- (id)_shim_promptText
{
  return -[_UINavBarPrompt prompt](self->_prompt, "prompt");
}

- (void)_shim_setPromptText:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  _UINavBarPrompt *v8;
  _UINavBarPrompt *v9;
  _UINavBarPrompt *prompt;
  _UINavBarPrompt *v11;
  void *v12;
  _UINavBarPrompt *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _UINavBarPrompt *v27;
  void (**v28)(_QWORD);
  _UINavBarPrompt *v29;
  void (**v30)(void *, uint64_t);
  _QWORD v31[4];
  _UINavBarPrompt *v32;
  _QWORD aBlock[5];
  _UINavBarPrompt *v34;
  CGRect v35;
  CGRect v36;

  v4 = a4;
  v6 = a3;
  -[_UINavBarPrompt prompt](self->_prompt, "prompt");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
    goto LABEL_26;
  if (v6)
  {
    v8 = self->_prompt;
    v9 = -[_UINavBarPrompt initWithNavBar:]([_UINavBarPrompt alloc], "initWithNavBar:", self->super._navigationBar);
    prompt = self->_prompt;
    self->_prompt = v9;

    -[_UINavBarPrompt setPrompt:](self->_prompt, "setPrompt:", v6);
  }
  else
  {
    if ((objc_msgSend(0, "isEqualToString:", v7) & 1) != 0)
      goto LABEL_26;
    v8 = self->_prompt;
    v11 = self->_prompt;
    self->_prompt = 0;

  }
  -[UINavigationBar _currentVisualStyle](self->super._navigationBar, "_currentVisualStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_prompt;
  if (v13)
  {
    -[UIView bounds](self->_contentView, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v12, "promptInset");
    v23 = v22;
    v35.origin.x = v15;
    v35.origin.y = v17;
    v35.size.width = v19;
    v35.size.height = v21;
    v36 = CGRectInset(v35, v23, 0.0);
    -[UIView setFrame:](v13, "setFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_prompt);
  }
  v24 = objc_msgSend(v12, "metrics");
  if (v24 <= 100)
  {
    if (v24)
    {
      if (v24 != 1 || !self->_prompt)
        goto LABEL_22;
      goto LABEL_16;
    }
    if (!self->_prompt)
      goto LABEL_22;
    v25 = 101;
LABEL_21:
    objc_msgSend(v12, "setMetrics:", v25);
    goto LABEL_22;
  }
  if (v24 == 101)
  {
    if (self->_prompt)
      goto LABEL_22;
    v25 = 0;
    goto LABEL_21;
  }
  if (v24 == 102 && !self->_prompt)
  {
LABEL_16:
    v25 = 102;
    goto LABEL_21;
  }
LABEL_22:
  -[UIView setAlpha:](self->_prompt, "setAlpha:", 0.0);
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v27 = v8;
  v34 = v27;
  v28 = (void (**)(_QWORD))_Block_copy(aBlock);
  v31[0] = v26;
  v31[1] = 3221225472;
  v31[2] = __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke_2;
  v31[3] = &unk_1E16B3FD8;
  v32 = v27;
  v29 = v27;
  v30 = (void (**)(void *, uint64_t))_Block_copy(v31);
  if (v4)
  {
    +[UINavigationBar defaultAnimationDuration](UINavigationBar, "defaultAnimationDuration");
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v30);
  }
  else
  {
    v28[2](v28);
    v30[2](v30, 1);
  }

LABEL_26:
}

- (id)_shim_backIndicatorView
{
  return self->_backIndicatorView;
}

- (void)_shim_pressBackIndicator:(BOOL)a3 initialPress:(BOOL)a4
{
  UIImageView *backIndicatorView;
  _BOOL8 v6;
  _BOOL8 v7;
  double v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  backIndicatorView = self->_backIndicatorView;
  if (backIndicatorView)
  {
    v6 = a4;
    v7 = a3;
    -[UIView alpha](backIndicatorView, "alpha");
    if (v8 > 0.0)
    {
      v10[0] = self->_backIndicatorView;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIButton _setVisuallyHighlighted:forViews:initialPress:](UIButton, "_setVisuallyHighlighted:forViews:initialPress:", v7, v9, v6);

    }
  }
}

- (id)_shim_customHitTest:(CGPoint)a3 forView:(id)a4
{
  double x;
  UINavigationBar *v6;
  UINavigationBar *v7;
  UINavigationBar *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  UIView *v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  UINavigationBar *v29;
  char v30;
  UIView *titleView;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  char v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char v41;
  unint64_t v42;
  void *v43;
  UIView *p_super;
  char v45;
  int v46;
  UIView *v47;
  UIView *v48;
  double v49;
  double v50;
  UINavigationBar *v51;
  UIView *v52;
  uint64_t v53;
  void *v54;
  char v55;
  unint64_t v56;
  void *v57;
  UINavigationBar *navigationBar;
  uint64_t v60;
  void *v61;
  void *v62;
  UINavigationBar *v63;
  _UINavigationBarVisualProviderLegacyIOS *v64;
  UIView *v65;
  void *v66;
  BOOL v67;
  UIView *v68;
  uint64_t v69;
  CGRect v70;
  CGRect v71;

  x = a3.x;
  v6 = (UINavigationBar *)a4;
  v7 = v6;
  if ((UINavigationBar *)self->_contentView == v6 || self->super._navigationBar == v6)
  {
    -[UIView window](v6, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v10, "interfaceOrientation") - 3) >= 2)
      v11 = 100.0;
    else
      v11 = 75.0;

    -[UIView bounds](self->super._navigationBar, "bounds");
    v12 = v70.origin.x;
    y = v70.origin.y;
    width = v70.size.width;
    height = v70.size.height;
    MinX = CGRectGetMinX(v70);
    v71.origin.x = v12;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    MaxX = CGRectGetMaxX(v71);
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_customLeftViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_customRightViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v18;
    if (!v22 || (objc_msgSend(v22, "isHidden") & 1) != 0 || (objc_msgSend(v22, "alpha"), v23 <= 0.05))
    {
      v25 = 0;
    }
    else
    {
      objc_msgSend(v22, "superview");
      v24 = (UIView *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == self->_contentView;

    }
    v26 = objc_msgSend(v19, "count");
    v27 = objc_msgSend(v20, "count");
    v61 = v22;
    if (v25)
      v28 = v22;
    else
      v28 = 0;
    v29 = v28;
    v30 = UIViewIgnoresTouchEvents(self->_titleView);
    titleView = 0;
    if ((v30 & 1) == 0)
      titleView = self->_titleView;
    v64 = self;
    v65 = titleView;
    v32 = v27 - 1;
    v63 = v7;
    v60 = 136;
    if (v32 < 0)
    {
      v35 = 0;
      v33 = -1;
    }
    else
    {
      v33 = -1;
      do
      {
        objc_msgSend(v20, "objectAtIndex:", v32, v60, v61, v62);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "superview");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = UIViewIgnoresTouchEvents(v34);

          if ((v36 & 1) != 0)
          {
            v35 = 0;
          }
          else
          {
            v35 = v34;
            v33 = v32;
          }
        }

        v37 = v32-- < 1;
      }
      while (!v37 && !v35);
    }
    v68 = v65;
    if (!v65)
      v68 = (UIView *)v35;
    v66 = v35;
    if (v26)
    {
      v38 = 0;
      v67 = v25 || v26 != 1;
      do
      {
        objc_msgSend(v19, "objectAtIndex:", v38, v60);
        v8 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
        -[UIView superview](v8, "superview");
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39 && (v40 = (void *)v39, v41 = UIViewIgnoresTouchEvents(v8), v40, (v41 & 1) == 0))
        {
          v69 = v38 + 1;
          if (v38 + 1 >= v26)
            goto LABEL_44;
          v42 = v38 + 2;
          do
          {
            objc_msgSend(v19, "objectAtIndex:", v42 - 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "superview");
            p_super = (UIView *)objc_claimAutoreleasedReturnValue();
            if (p_super)
            {
              v45 = UIViewIgnoresTouchEvents(v43);

              if ((v45 & 1) != 0)
                p_super = 0;
              else
                p_super = v43;
            }

            if (v42 >= v26)
              break;
            ++v42;
          }
          while (!p_super);
          v35 = v66;
          if (p_super)
          {
            v46 = 0;
            v47 = p_super;
          }
          else
          {
LABEL_44:
            p_super = 0;
            v46 = 1;
            v47 = v68;
          }
          v48 = v47;
          v49 = _hitAreaRightEdge(v8, v48, MaxX);
          v50 = fmax(v49, v11);
          if (!v67)
            v49 = v50;
          if (x <= v49 && x >= _hitAreaLeftEdge(v29, v8, MinX))
          {

LABEL_82:
LABEL_83:
            v7 = v63;
            goto LABEL_84;
          }
          v51 = v8;

          if (v46)
          {

            v29 = v51;
            break;
          }

          v38 = v69;
          v29 = v51;
        }
        else
        {

          ++v38;
        }
      }
      while (v38 != v26);
    }
    if (v65)
    {
      if (x >= _hitAreaLeftEdge(v29, v64->_titleView, MinX) && x <= _hitAreaRightEdge(v64->_titleView, v35, MaxX))
      {
        v8 = v64->_titleView;
        goto LABEL_83;
      }
      v52 = v64->_titleView;

      v29 = (UINavigationBar *)v52;
    }
    if ((v33 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        objc_msgSend(v20, "objectAtIndex:", v33, v60);
        v8 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
        -[UIView superview](v8, "superview");
        v53 = objc_claimAutoreleasedReturnValue();
        if (v53 && (v54 = (void *)v53, v55 = UIViewIgnoresTouchEvents(v8), v54, (v55 & 1) == 0))
        {
          v56 = v33;
          if (v33)
          {
            do
            {
              objc_msgSend(v20, "objectAtIndex:", v56 - 1);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if ((UIViewIgnoresTouchEvents(v57) & 1) != 0)
                p_super = 0;
              else
                p_super = v57;

              if (v56 < 2)
                break;
              --v56;
            }
            while (!p_super);
          }
          else
          {
            p_super = 0;
          }
          if (x >= _hitAreaLeftEdge(v29, v8, MinX) && x <= _hitAreaRightEdge(v8, p_super, MaxX))
            goto LABEL_82;

        }
        else
        {
          p_super = &v8->super;
          v8 = v29;
        }

        v29 = v8;
        v37 = v33-- < 1;
        if (v37)
          goto LABEL_77;
      }
    }
    v8 = v29;
LABEL_77:
    v7 = v63;
    navigationBar = v63;
    if (*(UINavigationBar **)((char *)&v64->super.super.isa + v60) == v63)
      navigationBar = v64->super._navigationBar;
    v29 = v8;
    v8 = navigationBar;
LABEL_84:

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (BOOL)_shim_wantsCustomTouchHandlingForTouches:(id)a3
{
  return _UITouchesContainsTouchFromCarTouchpad(a3) ^ 1;
}

- (id)_navigationItemAtPoint:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int v19;
  double v20;
  _BOOL4 v21;
  BOOL IsEmpty;
  void *v23;
  id v24;
  CGRect v26;
  CGRect v27;

  x = a3.x;
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
    v7 = v6;
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backButtonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self->super._navigationBar, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = *((_DWORD *)&self->super._navigationBar->super._viewFlags + 4);
    v20 = _UINavigationBarTouchExtremaForBackButtonView(v10, v7);
    if ((v19 & 0x80000) != 0)
    {
      v26.origin.x = v12;
      v26.origin.y = v14;
      v26.size.width = v16;
      v26.size.height = v18;
      v20 = CGRectGetMaxX(v26) - v20;
    }
    if ((*(_QWORD *)&v19 & 0x80000) != 0)
      v21 = x >= v20;
    else
      v21 = x <= v20;
    if (v21)
    {
      objc_msgSend(v9, "frame");
      IsEmpty = CGRectIsEmpty(v27);

      v23 = v5;
      if (!IsEmpty)
        goto LABEL_13;
    }
    else
    {

    }
    v23 = v8;
LABEL_13:
    v24 = v23;

    goto LABEL_14;
  }
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v24;
}

- (id)backButtonViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  int v22;
  double v23;
  BOOL v24;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
    v10 = v9;
    v11 = _UINavigationBarTouchExtremaForBackButtonView(v8, v9);
    v13 = v12;
    -[UIView bounds](self->super._navigationBar, "bounds", v11);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = *((_DWORD *)&self->super._navigationBar->super._viewFlags + 4);
    v23 = _UINavigationBarTouchExtremaForBackButtonView(v8, v10);
    if ((v22 & 0x80000) != 0)
    {
      v26.origin.x = v15;
      v26.origin.y = v17;
      v26.size.width = v19;
      v26.size.height = v21;
      v23 = CGRectGetMaxX(v26) - v23;
    }
    v24 = x < v23;
    if ((*(_QWORD *)&v22 & 0x80000) == 0)
      v24 = x > v23;
    if (v24 || y > v13)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)_handleMouseDownAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  UIImageView *backIndicatorView;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  int v25;
  double v26;
  _BOOL4 v27;
  id v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  if (!-[_UINavigationBarItemStack state](self->super._stack, "state")
    || -[UINavigationBar _allowInteractionDuringTransition](self->super._navigationBar, "_allowInteractionDuringTransition"))
  {
    -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6 != v28;
      if (v6 == v28)
      {
        objc_msgSend(v28, "backButtonView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alpha");
        if (v9 > 0.5 && (objc_msgSend(v8, "isHidden") & 1) == 0)
        {
          objc_msgSend(v8, "setPressed:initialPress:", 1, 1);
          -[_UINavigationBarVisualProviderLegacyIOS _shim_pressBackIndicator:initialPress:](self, "_shim_pressBackIndicator:initialPress:", 1, 1);
        }

      }
    }
    else
    {
      v7 = 1;
    }
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_buttonForBackButtonIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7)
    {
      if (v11)
      {
        objc_msgSend(v11, "alpha");
        if (v13 > 0.5 && (objc_msgSend(v12, "isHidden") & 1) == 0)
        {
          backIndicatorView = self->_backIndicatorView;
          -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
          v16 = v15;
          -[UIView bounds](self->super._navigationBar, "bounds");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v25 = *((_DWORD *)&self->super._navigationBar->super._viewFlags + 4);
          v26 = _UINavigationBarTouchExtremaForBackButtonView(backIndicatorView, v16);
          if ((v25 & 0x80000) != 0)
          {
            v29.origin.x = v18;
            v29.origin.y = v20;
            v29.size.width = v22;
            v29.size.height = v24;
            v26 = CGRectGetMaxX(v29) - v26;
          }
          if ((*(_QWORD *)&v25 & 0x80000) != 0)
            v27 = x >= v26;
          else
            v27 = x <= v26;
          if (v27)
            objc_msgSend(v12, "setHighlighted:", 1);
        }
      }
    }

  }
}

- (void)_handleMouseUpAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  UIImageView *backIndicatorView;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;

  y = a3.y;
  x = a3.x;
  if ((!-[_UINavigationBarItemStack state](self->super._stack, "state")
     || -[UINavigationBar _allowInteractionDuringTransition](self->super._navigationBar, "_allowInteractionDuringTransition"))&& (UIViewIgnoresTouchEvents(self->super._navigationBar) & 1) == 0)
  {
    -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v20 = v6;
      objc_msgSend(v6, "backButtonView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "pressed"))
      {
        objc_msgSend(v7, "setPressed:initialPress:", 0, 0);
      }
      else
      {
        -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (v8 != v20)
        {
          objc_msgSend(v8, "backButtonView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setPressed:initialPress:", 0, 0);

        }
      }
      if (-[_UINavigationBarVisualProviderLegacyIOS _shouldPopForTouchAtPoint:](self, "_shouldPopForTouchAtPoint:", x, y))
      {
        -[_UINavigationBarVisualProviderLegacyIOS _popForTouchAtPoint:](self, "_popForTouchAtPoint:", x, y);
      }
      else
      {
        -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_buttonForBackButtonIndicator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (objc_msgSend(v11, "alpha"), v12 > 0.5) && (objc_msgSend(v11, "isHidden") & 1) == 0)
        {
          backIndicatorView = self->_backIndicatorView;
          -[UIView _contentMargin](self->super._navigationBar, "_contentMargin");
          v15 = v14;
          -[UIView bounds](self->super._navigationBar, "bounds");
          if (_UIPointInsideNavigationBarTouchExtremaForBackButton(backIndicatorView, (*((_DWORD *)&self->super._navigationBar->super._viewFlags + 4) >> 19) & 1, v15, x, y, v16, v17, v18, v19))
          {
            objc_msgSend(v11, "setHighlighted:", 0);
            objc_msgSend(v11, "sendActionsForControlEvents:", 64);
          }
        }
        else
        {
          -[_UINavigationBarVisualProviderLegacyIOS _shim_pressBackIndicator:initialPress:](self, "_shim_pressBackIndicator:initialPress:", 0, 0);
        }

      }
      v6 = v20;
    }

  }
}

- (BOOL)_shouldPopForTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  int v6;
  void *v7;
  int v8;
  _UINavigationBarItemStack *stack;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  UIView *v14;
  UIView *v15;
  UIView *v16;
  UIView *v17;
  UIView *contentView;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  double v23;
  UIView *v24;
  UIView *v25;
  void *v26;
  int v27;
  void *v28;

  y = a3.y;
  x = a3.x;
  v6 = -[_UINavigationBarItemStack state](self->super._stack, "state");
  if (v6
    && !-[UINavigationBar _allowInteractionDuringTransition](self->super._navigationBar, "_allowInteractionDuringTransition"))
  {
    return 0;
  }
  -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UINavigationBarItemStack state](self->super._stack, "state");
  stack = self->super._stack;
  if (v8 == 2)
  {
    -[_UINavigationBarItemStack previousBackItem](stack, "previousBackItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack previousTopItem](self->super._stack, "previousTopItem");
  }
  else
  {
    -[_UINavigationBarItemStack backItem](stack, "backItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProviderLegacyIOS _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "alpha");
  if (v13 <= 0.05 || (objc_msgSend(v12, "isHidden") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(v12, "superview");
  v14 = (UIView *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6 != 2)
  {
    contentView = self->_contentView;

    if (v15 == contentView)
      goto LABEL_13;
    goto LABEL_12;
  }
  -[UIView superview](v14, "superview");
  v16 = (UIView *)objc_claimAutoreleasedReturnValue();
  v17 = self->_contentView;

  if (v16 != v17)
  {
LABEL_12:

    v12 = 0;
  }
LABEL_13:
  -[_UINavigationBarItemStack topItem](self->super._stack, "topItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "leftItemsSupplementBackButton");
  if ((v20 & 1) == 0)
  {
    objc_msgSend(v19, "_customLeftViews");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "alpha");
    if (v23 > 0.05 && (objc_msgSend(v22, "isHidden") & 1) == 0)
    {
      objc_msgSend(v22, "superview");
      v24 = (UIView *)objc_claimAutoreleasedReturnValue();
      v25 = self->_contentView;

      if (v24 == v25)
        goto LABEL_19;
    }

  }
  v22 = 0;
LABEL_19:
  -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v27 = v20;
  else
    v27 = 1;
  if (v12 && v7 == v26 && v27)
  {
    -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:", x, y);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (void)_popForTouchAtPoint:(CGPoint)a3
{
  UINavigationBar *navigationBar;
  void *v4;
  id v5;

  navigationBar = self->super._navigationBar;
  -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", a3.x, a3.y);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _sendNavigationPopForBackBarButtonItem:](navigationBar, "_sendNavigationPopForBackBarButtonItem:", v4);

}

- (void)_shim_touchesBegan:(id)a3 withEvent:(id)a4
{
  UINavigationBar *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = self->super._navigationBar;
  if (objc_msgSend(v7, "type"))
  {

    v6 = 0;
  }
  else
  {
    objc_msgSend(v7, "_firstTouchForView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "locationInView:", self->super._navigationBar);
      -[_UINavigationBarVisualProviderLegacyIOS _handleMouseDownAtPoint:](self, "_handleMouseDownAtPoint:");
    }
  }

}

- (void)_shim_touchesMoved:(id)a3 withEvent:(id)a4
{
  UINavigationBar *v5;
  void *v6;
  UINavigationBar *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = self->super._navigationBar;
  if (objc_msgSend(v9, "type"))
  {
    v6 = 0;
LABEL_3:

    goto LABEL_4;
  }
  objc_msgSend(v9, "_firstTouchForView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && !-[_UINavigationBarItemStack state](self->super._stack, "state")
    && (UIViewIgnoresTouchEvents(self->super._navigationBar) & 1) == 0)
  {
    objc_msgSend(v6, "locationInView:", self->super._navigationBar);
    -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:");
    v7 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v7)
    {
      -[UINavigationBar setPressed:initialPress:](v7, "setPressed:initialPress:", 1, 0);
    }
    else
    {
      objc_msgSend(v6, "previousLocationInView:", self->super._navigationBar);
      -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPressed:initialPress:", 0, 0);

    }
    -[_UINavigationBarVisualProviderLegacyIOS _shim_pressBackIndicator:initialPress:](self, "_shim_pressBackIndicator:initialPress:", v5 != 0, 0);
    goto LABEL_3;
  }
LABEL_4:

}

- (void)_shim_touchesEnded:(id)a3 withEvent:(id)a4
{
  UINavigationBar *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = self->super._navigationBar;
  if (objc_msgSend(v7, "type"))
  {

    v6 = 0;
  }
  else
  {
    objc_msgSend(v7, "_firstTouchForView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "locationInView:", self->super._navigationBar);
      -[_UINavigationBarVisualProviderLegacyIOS _handleMouseUpAtPoint:](self, "_handleMouseUpAtPoint:");
    }
  }

}

- (void)_shim_touchesCancelled:(id)a3 withEvent:(id)a4
{
  UINavigationBar *v5;
  void *v6;
  UINavigationBar *v7;
  void *v8;
  UINavigationBar *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v5 = self->super._navigationBar;
  if (objc_msgSend(v11, "type"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v11, "_firstTouchForView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_4;
    objc_msgSend(v6, "locationInView:", self->super._navigationBar);
    -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:");
    v7 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v7)
    {
      -[UINavigationBar backButtonView](v7, "backButtonView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarItemStack backItem](self->super._stack, "backItem");
      v9 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "pressed") & 1) == 0 && v9 && v9 != v5)
      {
        -[UINavigationBar backButtonView](v9, "backButtonView");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
      objc_msgSend(v8, "setPressed:initialPress:", 0, 0);
      -[_UINavigationBarVisualProviderLegacyIOS _shim_pressBackIndicator:initialPress:](self, "_shim_pressBackIndicator:initialPress:", 0, 0);

    }
  }

LABEL_4:
}

- (void)_shim_popForCarplayPressAtFakePoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[_UINavigationBarVisualProviderLegacyIOS _shouldPopForTouchAtPoint:](self, "_shouldPopForTouchAtPoint:"))
    -[_UINavigationBarVisualProviderLegacyIOS _popForTouchAtPoint:](self, "_popForTouchAtPoint:", x, y);
}

- (BOOL)_shim_throwConstraintExceptions
{
  return -[UINavigationBar isLocked](self->super._navigationBar, "isLocked");
}

- (void)_shim_updateBackgroundViewIgnoringFlag
{
  _BOOL4 v3;
  UINavigationBar *navigationBar;

  v3 = -[UIView _canDrawContent](self->super._navigationBar, "_canDrawContent");
  navigationBar = self->super._navigationBar;
  if (v3)
  {
    -[UIView setNeedsDisplay](navigationBar, "setNeedsDisplay");
  }
  else
  {
    -[UINavigationBar setNeedsLayout](navigationBar, "setNeedsLayout");
    -[UIView layoutIfNeeded](self->super._navigationBar, "layoutIfNeeded");
  }
}

- (void)_shim_30244716
{
  -[UIView insertSubview:atIndex:](self->super._navigationBar, "insertSubview:atIndex:", self->_backgroundView, 0);
}

- (BOOL)_shim_34415965
{
  return 1;
}

- (BOOL)_shim_107516167
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_userContentGuideTrailing, 0);
  objc_storeStrong((id *)&self->_userContentGuideLeading, 0);
  objc_storeStrong((id *)&self->_userContentGuide, 0);
  objc_storeStrong((id *)&self->_layoutView, 0);
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_slideTransitionClippingViews, 0);
  objc_storeStrong((id *)&self->_gestureHandler, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_backIndicatorView, 0);
  objc_storeStrong((id *)&self->_rightViews, 0);
  objc_storeStrong((id *)&self->_leftViews, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
