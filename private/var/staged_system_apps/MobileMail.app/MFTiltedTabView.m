@implementation MFTiltedTabView

- (MFTiltedTabView)initWithFrame:(CGRect)a3
{
  MFTiltedTabView *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _TabGradientView *v11;
  _TabGradientView *statusBarGradient;
  void *v13;
  _MFTouchDownTapRecognizer *v14;
  _MFTouchDownTapRecognizer *pressRecognizer;
  UIPanGestureRecognizer *v16;
  UIPanGestureRecognizer *tabCloseRecognizer;
  UILongPressGestureRecognizer *v18;
  UILongPressGestureRecognizer *tabReorderRecognizer;
  UITapGestureRecognizer *v20;
  UITapGestureRecognizer *tabSelectionRecognizer;
  NSMutableSet *v22;
  NSMutableSet *itemsCurrentlyClosing;
  uint64_t v24;
  UIImage *closeButtonImage;
  NSMutableArray *v26;
  NSMutableArray *visibleItems;
  NSMutableSet *v28;
  NSMutableSet *allTabItems;
  _QWORD v31[4];
  id v32;
  id location[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGFloat m33;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)MFTiltedTabView;
  v3 = -[MFTiltedTabView initWithFrame:](&v42, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    scrollView = v3->_scrollView;
    v3->_scrollView = v4;

    -[UIScrollView setAlwaysBounceVertical:](v3->_scrollView, "setAlwaysBounceVertical:", 1);
    -[UIScrollView setClipsToBounds:](v3->_scrollView, "setClipsToBounds:", 0);
    v6 = qword_1005A2AE8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView layer](v3->_scrollView, "layer"));
    v8 = *(_OWORD *)&CATransform3DIdentity.m23;
    v35 = *(_OWORD *)&CATransform3DIdentity.m21;
    v36 = v8;
    v37 = *(_OWORD *)&CATransform3DIdentity.m31;
    m33 = CATransform3DIdentity.m33;
    v9 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)location = *(_OWORD *)&CATransform3DIdentity.m11;
    v34 = v9;
    v39 = v6;
    v10 = *(_OWORD *)&CATransform3DIdentity.m43;
    v40 = *(_OWORD *)&CATransform3DIdentity.m41;
    v41 = v10;
    objc_msgSend(v7, "setSublayerTransform:", location);

    -[UIScrollView setDelegate:](v3->_scrollView, "setDelegate:", v3);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v3->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v3->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[MFTiltedTabView addSubview:](v3, "addSubview:", v3->_scrollView);
    v11 = objc_alloc_init(_TabGradientView);
    statusBarGradient = v3->_statusBarGradient;
    v3->_statusBarGradient = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_TabGradientView gradientLayer](v3->_statusBarGradient, "gradientLayer"));
    +[MFSafariTabsClassConstants configureStatusBarGradientLayer:](MFSafariTabsClassConstants, "configureStatusBarGradientLayer:", v13);
    -[MFTiltedTabView insertSubview:aboveSubview:](v3, "insertSubview:aboveSubview:", v3->_statusBarGradient, v3->_scrollView);
    v14 = -[_MFTouchDownTapRecognizer initWithTarget:action:]([_MFTouchDownTapRecognizer alloc], "initWithTarget:action:", v3, "_tabPressUpdated:");
    pressRecognizer = v3->_pressRecognizer;
    v3->_pressRecognizer = v14;

    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, v3);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001AE8DC;
    v31[3] = &unk_100522D18;
    objc_copyWeak(&v32, location);
    -[_MFTouchDownTapRecognizer setTouchdownHandler:](v3->_pressRecognizer, "setTouchdownHandler:", v31);
    -[MFTiltedTabView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_pressRecognizer);
    v16 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v3, "_tabCloseRecognized:");
    tabCloseRecognizer = v3->_tabCloseRecognizer;
    v3->_tabCloseRecognizer = v16;

    -[UIPanGestureRecognizer setDelegate:](v3->_tabCloseRecognizer, "setDelegate:", v3);
    -[UIPanGestureRecognizer _setHysteresis:](v3->_tabCloseRecognizer, "_setHysteresis:", 25.0);
    -[UIPanGestureRecognizer _setCanPanVertically:](v3->_tabCloseRecognizer, "_setCanPanVertically:", 0);
    -[MFTiltedTabView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tabCloseRecognizer);
    v18 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v3, "_tabReorderRecognized:");
    tabReorderRecognizer = v3->_tabReorderRecognizer;
    v3->_tabReorderRecognizer = v18;

    -[UILongPressGestureRecognizer setDelegate:](v3->_tabReorderRecognizer, "setDelegate:", v3);
    -[MFTiltedTabView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tabReorderRecognizer);
    v20 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "_tabSelectionRecognized:");
    tabSelectionRecognizer = v3->_tabSelectionRecognizer;
    v3->_tabSelectionRecognizer = v20;

    -[UITapGestureRecognizer setDelegate:](v3->_tabSelectionRecognizer, "setDelegate:", v3);
    -[MFTiltedTabView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tabSelectionRecognizer);
    v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    itemsCurrentlyClosing = v3->_itemsCurrentlyClosing;
    v3->_itemsCurrentlyClosing = v22;

    v24 = objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphXMark, 1));
    closeButtonImage = v3->_closeButtonImage;
    v3->_closeButtonImage = (UIImage *)v24;

    v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    visibleItems = v3->_visibleItems;
    v3->_visibleItems = v26;

    v28 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    allTabItems = v3->_allTabItems;
    v3->_allTabItems = v28;

    v3->_animating = 0;
    -[MFTiltedTabView setRotationStyle:](v3, "setRotationStyle:", 2);
    -[MFTiltedTabView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    objc_destroyWeak(&v32);
    objc_destroyWeak(location);

  }
  return v3;
}

- (void)_installMotionEffectOntoScrollView
{
  UIMotionEffectGroup *parallaxMotionEffectGroup;
  id v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  UIMotionEffectGroup *v13;
  UIMotionEffectGroup *v14;
  UIMotionEffectGroup *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double m31;
  _BYTE v32[56];
  _QWORD v33[2];

  parallaxMotionEffectGroup = self->_parallaxMotionEffectGroup;
  if (!parallaxMotionEffectGroup)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIInterpolatingMotionEffect), "initWithKeyPath:type:", CFSTR("sublayerTransform"), 0);
    v5 = *(_OWORD *)&CATransform3DIdentity.m13;
    v27 = *(_OWORD *)&CATransform3DIdentity.m11;
    v26 = v27;
    v25 = v5;
    v23 = *(_OWORD *)&CATransform3DIdentity.m23;
    v24 = *(_OWORD *)&CATransform3DIdentity.m21;
    v28 = v5;
    v29 = v24;
    v30 = v23;
    *(_OWORD *)v32 = *(_OWORD *)&CATransform3DIdentity.m32;
    v21 = *(_OWORD *)v32;
    *(_OWORD *)&v32[16] = *(_OWORD *)&CATransform3DIdentity.m34;
    v19 = *(_OWORD *)&v32[16];
    *(_OWORD *)&v32[32] = *(_OWORD *)&CATransform3DIdentity.m42;
    v17 = *(_OWORD *)&v32[32];
    *(CGFloat *)&v32[48] = CATransform3DIdentity.m44;
    v6 = *(_QWORD *)&v32[48];
    m31 = -*(double *)&qword_1005A2AF0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v27));
    objc_msgSend(v4, "setMinimumRelativeValue:", v7);

    v27 = v26;
    v28 = v25;
    v29 = v24;
    v30 = v23;
    *(_OWORD *)v32 = v21;
    *(_OWORD *)&v32[16] = v19;
    *(_OWORD *)&v32[32] = v17;
    *(_QWORD *)&v32[48] = v6;
    m31 = *(double *)&qword_1005A2AF0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v27));
    objc_msgSend(v4, "setMaximumRelativeValue:", v8);

    v9 = objc_msgSend(objc_alloc((Class)UIInterpolatingMotionEffect), "initWithKeyPath:type:", CFSTR("sublayerTransform"), 1);
    v29 = v24;
    v30 = v23;
    m31 = CATransform3DIdentity.m31;
    v10 = m31;
    v27 = v26;
    v28 = v25;
    v20 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v32[8] = *(_OWORD *)&CATransform3DIdentity.m33;
    v22 = *(_OWORD *)&v32[8];
    *(_OWORD *)&v32[24] = v20;
    *(_OWORD *)&v32[40] = *(_OWORD *)&CATransform3DIdentity.m43;
    v18 = *(_OWORD *)&v32[40];
    *(double *)v32 = -*(double *)&qword_1005A2AF8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v27));
    objc_msgSend(v9, "setMinimumRelativeValue:", v11);

    v29 = v24;
    v30 = v23;
    m31 = v10;
    v27 = v26;
    v28 = v25;
    *(_OWORD *)&v32[8] = v22;
    *(_OWORD *)&v32[24] = v20;
    *(_OWORD *)&v32[40] = v18;
    *(_QWORD *)v32 = qword_1005A2AF8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v27));
    objc_msgSend(v9, "setMaximumRelativeValue:", v12);

    v13 = (UIMotionEffectGroup *)objc_alloc_init((Class)UIMotionEffectGroup);
    v14 = self->_parallaxMotionEffectGroup;
    self->_parallaxMotionEffectGroup = v13;

    v15 = self->_parallaxMotionEffectGroup;
    v33[0] = v4;
    v33[1] = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
    -[UIMotionEffectGroup setMotionEffects:](v15, "setMotionEffects:", v16);

    parallaxMotionEffectGroup = self->_parallaxMotionEffectGroup;
  }
  -[UIScrollView addMotionEffect:](self->_scrollView, "addMotionEffect:", parallaxMotionEffectGroup);
}

- (void)_uninstallMotionEffectOntoScrollView
{
  -[UIScrollView removeMotionEffect:](self->_scrollView, "removeMotionEffect:", self->_parallaxMotionEffectGroup);
}

- (void)setDelegate:(id)a3
{
  MFTiltedTabViewDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFTiltedTabView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MFTiltedTabView;
  -[MFTiltedTabView setFrame:](&v13, "setFrame:", x, y, width, height);
  if (v9 != width || v11 != height)
    -[MFTiltedTabView _invalidateAllSnapshots](self, "_invalidateAllSnapshots");
}

- (unint64_t)_numberOfItems
{
  NSMutableArray *visibleItems;
  id WeakRetained;
  id v6;

  visibleItems = self->_visibleItems;
  if (visibleItems)
    return (unint64_t)-[NSMutableArray count](visibleItems, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "numberOfItemsInTiltedTabView:", self);

  return (unint64_t)v6;
}

- (unint64_t)_indexOfVisibleItem:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObject:](self->_visibleItems, "indexOfObject:", a3);
}

- (double)_scrollingEffectFactorForTabsWithCount:(double)a3
{
  return fmin(fmax(a3 + -2.0, 0.0), 1.0);
}

- (double)_topAreaHeightForTabsWithCount:(double)a3
{
  double v4;
  double v5;
  double v6;

  -[MFTiltedTabView _scrollingEffectFactorForTabsWithCount:](self, "_scrollingEffectFactorForTabsWithCount:", a3);
  v5 = (1.0 - v4) * unk_1005A2A40 + v4 * *(double *)&qword_1005A2A38;
  -[MFTiltedTabView _statusBarHeight](self, "_statusBarHeight");
  return v6 + v5;
}

- (CGRect)_hitRectForItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  _BYTE *v7;
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
  CGRect result;

  v4 = a3;
  v18 = 0.0;
  -[MFTiltedTabView _baseOffsetForItem:index:count:](self, "_baseOffsetForItem:index:count:", v4, 0, &v18);
  v6 = v5;
  v7 = -[NSMutableArray indexOfObject:](self->_visibleItems, "indexOfObject:", v4);
  v8 = v6;
  if (v7 != (char *)-[MFTiltedTabView _numberOfItems](self, "_numberOfItems") - 1)
  {
    -[MFTiltedTabView _spaceBetweenTabsWithCount:](self, "_spaceBetweenTabsWithCount:", v18);
    v8 = v9;
  }
  -[MFTiltedTabView _topAreaHeightForTabsWithCount:](self, "_topAreaHeightForTabsWithCount:", v18);
  v11 = v10;
  -[MFTiltedTabView _tabLayoutBounds](self, "_tabLayoutBounds");
  v13 = v12;

  v14 = 0.0;
  v15 = v6 + v11;
  v16 = v13;
  v17 = v8;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)_statusBarHeight
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusBarManager"));
  objc_msgSend(v4, "statusBarFrame");
  v6 = v5;

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  NSMutableArray *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  UIScrollView *scrollView;
  UIScrollView *v19;
  UIScrollView *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGPoint v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[MFTiltedTabView convertPoint:toView:](self, "convertPoint:toView:", self->_scrollView, x, y);
  v9 = v8;
  v11 = v10;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_visibleItems;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "closeButtonHitRect");
        v28.x = v9;
        v28.y = v11;
        if (CGRectContainsPoint(v29, v28))
        {
          v19 = (UIScrollView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "closeButton"));
          goto LABEL_13;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
        continue;
      break;
    }
  }

  v22.receiver = self;
  v22.super_class = (Class)MFTiltedTabView;
  v17 = -[MFTiltedTabView hitTest:withEvent:](&v22, "hitTest:withEvent:", v7, x, y);
  v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v17);
  scrollView = (UIScrollView *)v12;
  if (v12 == (NSMutableArray *)self)
    scrollView = self->_scrollView;
  v19 = scrollView;
LABEL_13:
  v20 = v19;

  return v20;
}

- (id)_tiltedTabItemForLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  CGPoint v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  if (self->_presented)
  {
    y = a3.y;
    x = a3.x;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_visibleItems;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "closeButtonHitRect");
        v26.x = x;
        v26.y = y;
        if (CGRectContainsPoint(v28, v26))
          break;
        if (v7 == (id)++v9)
        {
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = self->_visibleItems;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v6);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            -[MFTiltedTabView _hitRectForItem:](self, "_hitRectForItem:", v13, (_QWORD)v16);
            v27.x = x;
            v27.y = y;
            if (CGRectContainsPoint(v29, v27))
            {
              v14 = v13;
              goto LABEL_21;
            }
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v10)
            continue;
          break;
        }
      }
    }
    v14 = 0;
LABEL_21:

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)setReorderingEnabled:(BOOL)a3
{
  self->_reorderingEnabled = a3;
  -[UILongPressGestureRecognizer setEnabled:](self->_tabReorderRecognizer, "setEnabled:");
}

- (void)_setPressedItem:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _MFTiltedTabItemView *v7;

  v4 = a4;
  v7 = (_MFTiltedTabItemView *)a3;
  if (self->_pressedItem != v7)
  {
    if (v4)
    {
      -[MFTiltedTabView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
      objc_storeStrong((id *)&self->_pressedItem, a3);
      -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", 1);
    }
    else
    {
      objc_storeStrong((id *)&self->_pressedItem, a3);
      -[MFTiltedTabView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_tabPressUpdated:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "numberOfTouches") && objc_msgSend(v5, "state") != (id)5)
  {
    objc_msgSend(v5, "locationInView:", self->_scrollView);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:"));
    -[MFTiltedTabView _setPressedItem:animated:](self, "_setPressedItem:animated:", v4, 1);

  }
  else
  {
    -[MFTiltedTabView _setPressedItem:animated:](self, "_setPressedItem:animated:", 0, 1);
  }

}

- (BOOL)_gestureRecognizer:(id)a3 shouldInteractWithItem:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_tabSelectionRecognizer != v6
    && (UITapGestureRecognizer *)self->_tabCloseRecognizer != v6
    && (UITapGestureRecognizer *)self->_tabReorderRecognizer != v6)
  {
    __assert_rtn("-[MFTiltedTabView _gestureRecognizer:shouldInteractWithItem:]", "MFTiltedTabView.m", 622, "gestureRecognizer == _tabSelectionRecognizer || gestureRecognizer == _tabCloseRecognizer || gestureRecognizer == _tabReorderRecognizer");
  }
  v9 = v7
    && ((UITapGestureRecognizer *)self->_tabReorderRecognizer != v6
     || -[MFTiltedTabView _numberOfItems](self, "_numberOfItems") >= 2);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if ((-[MFTiltedTabView isUserInteractionEnabled](self, "isUserInteractionEnabled") & 1) != 0)
  {
    if (self->_tabSelectionRecognizer != v6
      && (UITapGestureRecognizer *)self->_tabCloseRecognizer != v6
      && (UITapGestureRecognizer *)self->_tabReorderRecognizer != v6)
    {
      __assert_rtn("-[MFTiltedTabView gestureRecognizer:shouldReceiveTouch:]", "MFTiltedTabView.m", 635, "gestureRecognizer == _tabSelectionRecognizer || gestureRecognizer == _tabCloseRecognizer || gestureRecognizer == _tabReorderRecognizer");
    }
    objc_msgSend(v7, "locationInView:", self->_scrollView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:"));
    v9 = -[MFTiltedTabView _gestureRecognizer:shouldInteractWithItem:](self, "_gestureRecognizer:shouldInteractWithItem:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  void *v6;
  BOOL v7;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  if (self->_tabSelectionRecognizer != v4
    && (UITapGestureRecognizer *)self->_tabCloseRecognizer != v4
    && (UITapGestureRecognizer *)self->_tabReorderRecognizer != v4)
  {
    __assert_rtn("-[MFTiltedTabView gestureRecognizerShouldBegin:]", "MFTiltedTabView.m", 641, "gestureRecognizer == _tabSelectionRecognizer || gestureRecognizer == _tabCloseRecognizer || gestureRecognizer == _tabReorderRecognizer");
  }
  -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self->_scrollView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:"));
  v7 = -[MFTiltedTabView _gestureRecognizer:shouldInteractWithItem:](self, "_gestureRecognizer:shouldInteractWithItem:", v5, v6);

  return v7;
}

- (double)_tabCloseAnimationSlideDistance
{
  double v2;
  CGRect v4;

  v2 = *(double *)&qword_1005A2A58;
  -[MFTiltedTabView _tabLayoutBounds](self, "_tabLayoutBounds");
  return v2 + CGRectGetMaxX(v4);
}

- (void)_closeItem:(id)a3
{
  id v5;
  id WeakRetained;
  unint64_t v7;
  id v8;
  NSMutableArray *visibleItems;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_visibleItems, "indexOfObject:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "tiltedTabView:canCloseItemAtIndex:", self, v5))
  {
    v7 = -[MFTiltedTabView _numberOfItems](self, "_numberOfItems");
    objc_msgSend(v11, "setClosing:", 1);
    objc_msgSend(WeakRetained, "tiltedTabView:closeItemAtIndex:", self, -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v11));
    v8 = objc_msgSend(WeakRetained, "numberOfItemsInTiltedTabView:", self);
    if ((unint64_t)v8 >= v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTiltedTabView.m"), 663, CFSTR("Number of items should be less than before when closing tabs."));

    }
    -[NSMutableArray removeObject:](self->_visibleItems, "removeObject:", v11);
    visibleItems = self->_visibleItems;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001AFA3C;
    v12[3] = &unk_100522D38;
    v12[4] = v8;
    -[NSMutableArray enumerateObjectsUsingBlock:](visibleItems, "enumerateObjectsUsingBlock:", v12);
    -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", 1);
  }

}

- (id)tabItemAtIndex:(unint64_t)a3
{
  void *v5;

  if ((unint64_t)-[NSMutableArray count](self->_visibleItems, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_visibleItems, "objectAtIndexedSubscript:", a3));
  return v5;
}

- (void)_tabCloseRecognized:(id)a3
{
  id WeakRetained;
  unsigned int v5;
  _MFTiltedTabItemView *v6;
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
  unsigned __int8 v18;
  _MFTiltedTabItemView **p_onlyHorizontalVelocityItem;
  _MFTiltedTabItemView *interactivelyClosingItem;
  const char *v21;
  int v22;
  UIPanGestureRecognizer *v23;

  v23 = (UIPanGestureRecognizer *)a3;
  if (self->_tabCloseRecognizer != v23)
    __assert_rtn("-[MFTiltedTabView _tabCloseRecognized:]", "MFTiltedTabView.m", 684, "gestureRecognizer == _tabCloseRecognizer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = 0;
  switch((unint64_t)-[UIPanGestureRecognizer state](v23, "state"))
  {
    case 1uLL:
      -[UIPanGestureRecognizer locationInView:](v23, "locationInView:", self->_scrollView);
      v6 = (_MFTiltedTabItemView *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:"));
      if (!v6)
      {
        v21 = "tabItemForLocation";
        v22 = 692;
        goto LABEL_27;
      }
      if (self->_interactivelyClosingItem)
      {
        v21 = "!_interactivelyClosingItem";
        v22 = 693;
LABEL_27:
        __assert_rtn("-[MFTiltedTabView _tabCloseRecognized:]", "MFTiltedTabView.m", v22, v21);
      }
      objc_storeStrong((id *)&self->_interactivelyClosingItem, v6);
      self->_interactiveCloseProgress = 0.0;
      -[_MFTiltedTabItemView setCountForLayout:](v6, "setCountForLayout:", -[MFTiltedTabView _numberOfItems](self, "_numberOfItems"));
      -[_MFTiltedTabItemView setIndexForLayout:](v6, "setIndexForLayout:", -[NSMutableArray indexOfObject:](self->_visibleItems, "indexOfObject:", v6));
LABEL_22:

LABEL_23:
      return;
    case 2uLL:
      -[UIPanGestureRecognizer translationInView:](v23, "translationInView:", self);
      v13 = v12;
      -[MFTiltedTabView _tabCloseAnimationSlideDistance](self, "_tabCloseAnimationSlideDistance");
      v15 = -v13 / v14;
      self->_interactiveCloseProgress = v15;
      if (v15 >= 0.0)
      {
        if ((objc_msgSend(WeakRetained, "tiltedTabView:canCloseItemAtIndex:", self, -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", self->_interactivelyClosingItem)) & 1) != 0)goto LABEL_13;
        v16 = 1.0 - 1.0 / (self->_interactiveCloseProgress * 0.55 + 1.0);
      }
      else
      {
        v16 = -(1.0 - 1.0 / (v15 * -0.55 + 1.0));
      }
      self->_interactiveCloseProgress = v16;
LABEL_13:
      -[MFTiltedTabView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_23;
    case 3uLL:
      -[UIPanGestureRecognizer translationInView:](v23, "translationInView:", self);
      v8 = v7;
      -[UIPanGestureRecognizer velocityInView:](v23, "velocityInView:", self);
      v10 = v9;
      -[MFTiltedTabView _tabCloseAnimationSlideDistance](self, "_tabCloseAnimationSlideDistance");
      if (v8 + v10 >= v11 * -0.75)
        v5 = 0;
      else
        v5 = objc_msgSend(WeakRetained, "tiltedTabView:canCloseItemAtIndex:", self, -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", self->_interactivelyClosingItem));
      goto LABEL_15;
    case 4uLL:
LABEL_15:
      -[UIPanGestureRecognizer velocityInView:](v23, "velocityInView:", self);
      self->_interactiveCloseVelocity = v17;
      if (v5)
        -[MFTiltedTabView _closeItem:](self, "_closeItem:", self->_interactivelyClosingItem);
      v18 = -[_MFTiltedTabItemView isClosing](self->_interactivelyClosingItem, "isClosing");
      if ((v18 & 1) == 0)
      {
        -[_MFTiltedTabItemView setCountForLayout:](self->_interactivelyClosingItem, "setCountForLayout:", 0x7FFFFFFFFFFFFFFFLL);
        -[_MFTiltedTabItemView setIndexForLayout:](self->_interactivelyClosingItem, "setIndexForLayout:", 0x7FFFFFFFFFFFFFFFLL);
      }
      p_onlyHorizontalVelocityItem = &self->_onlyHorizontalVelocityItem;
      objc_storeStrong((id *)&self->_onlyHorizontalVelocityItem, self->_interactivelyClosingItem);
      interactivelyClosingItem = self->_interactivelyClosingItem;
      self->_interactivelyClosingItem = 0;

      if ((v18 & 1) == 0)
        -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", 1);
      self->_interactiveCloseProgress = 0.0;
      self->_interactiveCloseVelocity = 0.0;
      v6 = *p_onlyHorizontalVelocityItem;
      *p_onlyHorizontalVelocityItem = 0;
      goto LABEL_22;
    default:
      goto LABEL_23;
  }
}

- (void)_setReorderScrollVelocity:(double)a3
{
  CADisplayLink *reorderScrollDisplayLink;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  CADisplayLink *v9;
  void *v10;

  reorderScrollDisplayLink = self->_reorderScrollDisplayLink;
  if (fabs(a3) >= 0.01)
  {
    if (!reorderScrollDisplayLink)
    {
      v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "_reorderScroll:"));
      v8 = self->_reorderScrollDisplayLink;
      self->_reorderScrollDisplayLink = v7;

      v9 = self->_reorderScrollDisplayLink;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
      -[CADisplayLink addToRunLoop:forMode:](v9, "addToRunLoop:forMode:", v10, NSRunLoopCommonModes);

    }
    self->_reorderScrollVelocity = a3;
  }
  else
  {
    -[CADisplayLink invalidate](reorderScrollDisplayLink, "invalidate");
    v6 = self->_reorderScrollDisplayLink;
    self->_reorderScrollDisplayLink = 0;

  }
}

- (void)_reorderScroll:(id)a3
{
  double v4;
  double v5;
  double reorderScrollVelocity;
  double reorderScrollOffsetError;
  void *v8;
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
  double __y;

  objc_msgSend(a3, "duration");
  v5 = v4;
  reorderScrollVelocity = self->_reorderScrollVelocity;
  reorderScrollOffsetError = self->_reorderScrollOffsetError;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "scale");
  v10 = v9;

  __y = NAN;
  self->_reorderScrollOffsetError = modf((reorderScrollOffsetError + v5 * reorderScrollVelocity) * v10, &__y) / v10;
  v11 = __y;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v13 = v12;
  v15 = v14;
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v17 = v16;
  v19 = v18;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v21 = v20;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v13, fmin(fmax(v11 / v10 + v15, -v17), v19 + v21 - v22));
  -[MFTiltedTabView _updateReorderGesture](self, "_updateReorderGesture");
}

- (void)_updateReorderGesture
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double interactiveReorderOffset;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  CGFloat v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[MFTiltedTabView _spaceBetweenTabsWithCount:](self, "_spaceBetweenTabsWithCount:", (double)-[MFTiltedTabView _numberOfItems](self, "_numberOfItems"));
  v4 = v3;
  -[UILongPressGestureRecognizer locationInView:](self->_tabReorderRecognizer, "locationInView:", self->_scrollView);
  v6 = v5;
  if (self->_reorderOffsetNeedsReset)
  {
    -[MFTiltedTabView _resetInteractiveReorderOffsetAtLocation:](self, "_resetInteractiveReorderOffsetAtLocation:");
    self->_reorderOffsetNeedsReset = 0;
  }
  else
  {
    self->_interactiveReorderOffset = v5 - self->_interactiveReorderOffsetDistanceFromTouch;
  }
  v7 = v4 * ((double)-[MFTiltedTabView _numberOfItems](self, "_numberOfItems") + -0.5);
  interactiveReorderOffset = self->_interactiveReorderOffset;
  if (interactiveReorderOffset > v7)
    self->_interactiveReorderOffset = v7 + (1.0 - 1.0 / ((interactiveReorderOffset - v7) / v4 * 0.55 + 1.0)) * v4;
  v9 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", self->_interactivelyReorderingItem);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    sub_100394C4C();
  v10 = v9;
  v11 = vcvtad_u64_f64(self->_interactiveReorderOffset / v4);
  if (v9 != v11 && -[MFTiltedTabView _numberOfItems](self, "_numberOfItems") > v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tiltedTabView:didMoveItemAtIndex:toIndex:", self, v10, v11);

  }
  v13 = *(double *)&qword_1005A2A80;
  v14 = unk_1005A2A88;
  -[MFTiltedTabView bounds](self, "bounds");
  v16 = v13 * v15;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (v6 - CGRectGetMinY(v24) < v14)
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v21 = v6 - CGRectGetMinY(v25) - v14;
LABEL_14:
    v23 = v16 * v21 / v14;
    goto LABEL_15;
  }
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v22 = CGRectGetMaxY(v26) - v6;
  v23 = 0.0;
  if (v22 < v14)
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v21 = v14 + v6 - CGRectGetMaxY(v27);
    goto LABEL_14;
  }
LABEL_15:
  -[MFTiltedTabView _setReorderScrollVelocity:](self, "_setReorderScrollVelocity:", v23);
  -[MFTiltedTabView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_resetInteractiveReorderOffsetAtLocation:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  unint64_t v7;
  double v8;

  y = a3.y;
  -[MFTiltedTabView _spaceBetweenTabsWithCount:](self, "_spaceBetweenTabsWithCount:", (double)-[MFTiltedTabView _numberOfItems](self, "_numberOfItems", a3.x));
  v6 = v5;
  v7 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", self->_interactivelyReorderingItem);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    sub_100394C74();
  v8 = v6 * (double)v7;
  self->_interactiveReorderOffset = v8;
  self->_interactiveReorderOffsetDistanceFromTouch = y - v8;
}

- (void)_tabReorderRecognized:(id)a3
{
  UILongPressGestureRecognizer *v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _MFTiltedTabItemView *interactivelyReorderingItem;
  const char *v12;
  int v13;
  UILongPressGestureRecognizer *v14;

  v4 = (UILongPressGestureRecognizer *)a3;
  v14 = v4;
  if (self->_tabReorderRecognizer != v4)
    __assert_rtn("-[MFTiltedTabView _tabReorderRecognized:]", "MFTiltedTabView.m", 827, "gestureRecognizer == _tabReorderRecognizer");
  v5 = (char *)-[UILongPressGestureRecognizer state](v4, "state");
  if ((unint64_t)(v5 - 3) < 2)
  {
    interactivelyReorderingItem = self->_interactivelyReorderingItem;
    self->_interactivelyReorderingItem = 0;

    self->_interactiveReorderOffset = 0.0;
    self->_interactiveReorderOffsetDistanceFromTouch = 0.0;
    -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", 1);
    -[MFTiltedTabView _setReorderScrollVelocity:](self, "_setReorderScrollVelocity:", 0.0);
    self->_reorderScrollOffsetError = 0.0;
    goto LABEL_10;
  }
  if (v5 == (char *)2)
  {
    -[MFTiltedTabView _updateReorderGesture](self, "_updateReorderGesture");
    goto LABEL_10;
  }
  if (v5 == (char *)1)
  {
    -[UILongPressGestureRecognizer locationInView:](v14, "locationInView:", self->_scrollView);
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:"));
    if (v10)
    {
      if (!self->_interactivelyReorderingItem)
      {
        objc_storeStrong((id *)&self->_interactivelyReorderingItem, v10);
        -[MFTiltedTabView _resetInteractiveReorderOffsetAtLocation:](self, "_resetInteractiveReorderOffsetAtLocation:", v7, v9);
        -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", 1);
        self->_reorderOffsetNeedsReset = 1;

        goto LABEL_10;
      }
      v12 = "!_interactivelyReorderingItem";
      v13 = 833;
    }
    else
    {
      v12 = "tabItemForLocation";
      v13 = 832;
    }
    __assert_rtn("-[MFTiltedTabView _tabReorderRecognized:]", "MFTiltedTabView.m", v13, v12);
  }
LABEL_10:

}

- (void)selectItemAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  _MFTiltedTabItemView **p_selectedItem;
  id WeakRetained;
  void *v9;
  void *v10;
  __int128 v11;
  _OWORD v12[3];

  if ((unint64_t)-[NSMutableArray count](self->_visibleItems, "count", a3, a4) > a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_visibleItems, "objectAtIndex:", a3));
    p_selectedItem = &self->_selectedItem;
    objc_storeStrong((id *)&self->_selectedItem, v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tiltedTabView:contentViewForItemAtIndex:", self, a3));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView borrowedContentView](*p_selectedItem, "borrowedContentView"));
      objc_msgSend(WeakRetained, "tiltedTabView:relinquishSnapshotView:forItemAtIndex:", self, v10, a3);

      v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v12[1] = v11;
      v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      objc_msgSend(v9, "setTransform:", v12);
      -[_MFTiltedTabItemView setBorrowedContentView:](*p_selectedItem, "setBorrowedContentView:", v9);
      -[_MFTiltedTabItemView setContentViewType:](*p_selectedItem, "setContentViewType:", 0);
    }
    objc_msgSend(WeakRetained, "tiltedTabView:didSelectItemAtIndex:", self, a3);

  }
}

- (void)_tabSelectionRecognized:(id)a3
{
  UITapGestureRecognizer *v4;
  void *v5;
  UITapGestureRecognizer *v6;

  v4 = (UITapGestureRecognizer *)a3;
  v6 = v4;
  if (self->_tabSelectionRecognizer != v4)
    __assert_rtn("-[MFTiltedTabView _tabSelectionRecognized:]", "MFTiltedTabView.m", 883, "gestureRecognizer == _tabSelectionRecognizer");
  -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self->_scrollView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _tiltedTabItemForLocation:](self, "_tiltedTabItemForLocation:"));
  -[MFTiltedTabView selectItemAtIndex:animated:](self, "selectItemAtIndex:animated:", -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v5), 1);

}

- (void)_sendPresentedStateDidChangeToDelegateIfNeeded
{
  id WeakRetained;
  BOOL *p_sentDidPresentToDelegate;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (self->_presented)
  {
    p_sentDidPresentToDelegate = &self->_sentDidPresentToDelegate;
    if (!self->_sentDidPresentToDelegate)
      objc_msgSend(WeakRetained, "tiltedTabViewDidPresent:", self);
  }
  else
  {
    p_sentDidPresentToDelegate = &self->_sentDidDismissToDelegate;
    if (!self->_sentDidDismissToDelegate)
      objc_msgSend(WeakRetained, "tiltedTabViewDidDismiss:", self);
  }
  *p_sentDidPresentToDelegate = 1;

}

- (void)_relinquishBorrowedViews
{
  NSMutableArray *visibleItems;
  _QWORD v3[5];

  visibleItems = self->_visibleItems;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001B0868;
  v3[3] = &unk_100522D60;
  v3[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](visibleItems, "enumerateObjectsUsingBlock:", v3);
}

- (void)_finishAnimations
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  void *j;
  void *v11;
  id WeakRetained;
  _MFTiltedTabItemView *selectedItem;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_visibleItems;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "setShadowOpacity:", 0.0);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  if (!self->_presented)
  {
    -[MFTiltedTabView _relinquishBorrowedViews](self, "_relinquishBorrowedViews");
    -[NSMutableSet addObjectsFromArray:](self->_itemsCurrentlyClosing, "addObjectsFromArray:", self->_visibleItems);
    -[NSMutableArray removeAllObjects](self->_visibleItems, "removeAllObjects");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_itemsCurrentlyClosing;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v8; j = (char *)j + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v11, "uninstallMaskCutoutView", (_QWORD)v14);
        objc_msgSend(v11, "setFinishedClosing:", 1);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v8);
  }

  -[MFTiltedTabView _updateItemsInvolvedInAnimation](self, "_updateItemsInvolvedInAnimation");
  if (self->_presented && -[NSMutableSet count](self->_itemsCurrentlyClosing, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tiltedTabViewDidScroll:", self);

  }
  -[NSMutableSet removeAllObjects](self->_itemsCurrentlyClosing, "removeAllObjects", (_QWORD)v14);
  selectedItem = self->_selectedItem;
  self->_selectedItem = 0;

  self->_animating = 0;
  -[MFTiltedTabView _sendPresentedStateDidChangeToDelegateIfNeeded](self, "_sendPresentedStateDidChangeToDelegateIfNeeded");
  if (!self->_presented)
  {
    -[NSMutableSet makeObjectsPerformSelector:](self->_allTabItems, "makeObjectsPerformSelector:", "removeFromSuperview");
    -[NSMutableSet removeAllObjects](self->_allTabItems, "removeAllObjects");
    -[MFTiltedTabView setHidden:](self, "setHidden:", 1);
  }
}

- (id)_tabItem
{
  _MFTiltedTabItemView *v3;

  v3 = objc_alloc_init(_MFTiltedTabItemView);
  -[NSMutableSet addObject:](self->_allTabItems, "addObject:", v3);
  return v3;
}

- (void)setPresented:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  _MFTiltedTabItemView *selectedItem;
  char *v8;
  char *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double Height;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  NSMutableArray *visibleItems;
  id v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  unint64_t v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40[2];
  id location[2];
  CGRect v42;

  if (((!self->_presented ^ a3) & 1) == 0)
  {
    v4 = a3;
    v35 = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v36 = v4;
    if (v4)
    {
      -[MFTiltedTabView setHidden:](self, "setHidden:", 0);
      -[MFTiltedTabView _installMotionEffectOntoScrollView](self, "_installMotionEffectOntoScrollView");
      selectedItem = self->_selectedItem;
      self->_selectedItem = 0;

      self->_sentDidPresentToDelegate = 0;
      -[MFTiltedTabView _relinquishBorrowedViews](self, "_relinquishBorrowedViews");
      -[NSMutableArray removeAllObjects](self->_visibleItems, "removeAllObjects");
      v37 = -[MFTiltedTabView rotationStyle](self, "rotationStyle");
      v8 = (char *)objc_msgSend(WeakRetained, "numberOfItemsInTiltedTabView:", self);
      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tiltedTabView:snapshotViewForItemAtIndex:", self, i));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _tabItem](self, "_tabItem"));
          objc_msgSend(v11, "setIndexForLayout:", i);
          objc_msgSend(v11, "setCountForLayout:", v8);
          objc_msgSend(v11, "setBorrowedContentView:", v10);
          objc_msgSend(v11, "setContentViewType:", 1);
          objc_msgSend(v11, "setCapturedInterfaceOrientation:", -[MFTiltedTabView _currentOrientation](self, "_currentOrientation"));
          objc_msgSend(v11, "setAutoresizesContentView:", v37 == 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentClipperView"));
          objc_msgSend(v10, "bounds");
          objc_msgSend(v12, "setBounds:");

          objc_msgSend(v11, "setClipsToBounds:", objc_msgSend(v10, "clipsToBounds"));
          objc_msgSend(v10, "_continuousCornerRadius");
          objc_msgSend(v11, "_setContinuousCornerRadius:");
          location[0] = (id)0xAAAAAAAAAAAAAAAALL;
          objc_initWeak(location, self);
          v13 = objc_alloc((Class)UISpringLoadedInteraction);
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1001B1268;
          v39[3] = &unk_100522D88;
          objc_copyWeak(v40, location);
          v40[1] = i;
          v14 = objc_msgSend(v13, "initWithActivationHandler:", v39);
          objc_msgSend(v11, "addInteraction:", v14);

          if (i)
          {
            v15 = WeakRetained;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tiltedTabView:headerViewForItemAtIndex:", self, i));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
            objc_msgSend(v17, "frame");
            v19 = v18;
            v21 = v20;
            v23 = v22;

            objc_msgSend(v16, "frame");
            Height = CGRectGetHeight(v42);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
            objc_msgSend(v25, "setFrame:", v19, v21, v23, Height);

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
            objc_msgSend(v27, "setTitle:", v26);

            objc_msgSend(v16, "bottomInset");
            v29 = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerView"));
            objc_msgSend(v30, "setBottomInset:", v29);

            WeakRetained = v15;
          }
          -[NSMutableArray addObject:](self->_visibleItems, "addObject:", v11);
          objc_destroyWeak(v40);
          objc_destroyWeak(location);

        }
      }
      objc_msgSend(WeakRetained, "tiltedTabViewWillPresent:", self);
      -[MFTiltedTabView _updateItemsInvolvedInAnimation](self, "_updateItemsInvolvedInAnimation");
    }
    else
    {
      -[MFTiltedTabView _uninstallMotionEffectOntoScrollView](self, "_uninstallMotionEffectOntoScrollView");
      self->_sentDidDismissToDelegate = 0;
      objc_msgSend(WeakRetained, "tiltedTabViewWillDismiss:", self);
    }
    if (v35)
    {
      self->_animating = 1;
      -[MFTiltedTabView setNeedsLayout](self, "setNeedsLayout");
      -[MFTiltedTabView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    }
    if ((!self->_selectedItem || !-[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:")) && !v36)
    {
      visibleItems = self->_visibleItems;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1001B12D8;
      v38[3] = &unk_100522D60;
      v38[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](visibleItems, "enumerateObjectsUsingBlock:", v38);
    }
    self->_presented = v36;
    objc_msgSend(WeakRetained, "tiltedTabViewDidLayoutItems:", self);
    if (v36)
    {
      v32 = WeakRetained;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tiltedTabView:maskCutoutViewForItemAtIndex:", self, 0));
      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_visibleItems, "firstObject"));
        objc_msgSend(v34, "installMaskCutoutView:", v33);

      }
      WeakRetained = v32;
    }
    -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", v35);
    if (!self->_activeAnimationCount)
      -[MFTiltedTabView _finishAnimations](self, "_finishAnimations");
    -[_MFTouchDownTapRecognizer setEnabled:](self->_pressRecognizer, "setEnabled:", v36);
    -[UIPanGestureRecognizer setEnabled:](self->_tabCloseRecognizer, "setEnabled:", v36);
    -[UILongPressGestureRecognizer setEnabled:](self->_tabReorderRecognizer, "setEnabled:", self->_reorderingEnabled);
    -[UITapGestureRecognizer setEnabled:](self->_tabSelectionRecognizer, "setEnabled:", v36);

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  unint64_t v16;
  id v17;

  v17 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("reordering-item")));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("being-replaced")));
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("base-begin-time")));
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      objc_msgSend(v17, "beginTime");
      v12 = v11;
      v13 = *(double *)&qword_1005A2A30;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("tab-count")));
      objc_msgSend(v14, "doubleValue");
      -[MFTiltedTabView _stopReorderingItem:withFinalTimeAdjustment:tabCount:](self, "_stopReorderingItem:withFinalTimeAdjustment:tabCount:", v5, (v10 - v12) / v13, v15);

    }
  }
  else
  {
    v16 = self->_activeAnimationCount - 1;
    self->_activeAnimationCount = v16;
    if (v16 <= 2 && self->_animating)
      -[MFTiltedTabView _finishAnimations](self, "_finishAnimations");
  }

}

- (void)setPresented:(BOOL)a3
{
  -[MFTiltedTabView setPresented:animated:](self, "setPresented:animated:", a3, 0);
}

- (BOOL)_shouldContinueAnimatingItem:(id)a3
{
  return objc_msgSend(a3, "isFinishedClosing") ^ 1;
}

- (void)_resetItem:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClosing:", 0);
  objc_msgSend(v3, "setFinishedClosing:", 0);
  objc_msgSend(v3, "setCountForLayout:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v3, "setIndexForLayout:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v3, "setVerticalScrollAdjustment:", 0.0);

}

- (void)_updateItemsInvolvedInAnimation
{
  void *v3;
  NSArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *itemsInvolvedInAnimation;
  NSArray *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v18 = self->_itemsInvolvedInAnimation;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_visibleItems));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v18;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v3, "indexOfObject:", v8) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (!-[MFTiltedTabView _shouldContinueAnimatingItem:](self, "_shouldContinueAnimatingItem:", v8))
          {
            objc_msgSend(v8, "removeFromSuperview");
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "closeButton"));
            objc_msgSend(v9, "removeTarget:action:forControlEvents:", self, "_closeButtonPressed:", 64);

          }
        }
        else
        {
          objc_msgSend(v3, "removeObject:", v8);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "closeButton"));
        objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "_closeButtonPressed:", 64);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v11);
  }

  v16 = (NSArray *)-[NSMutableArray copy](self->_visibleItems, "copy");
  itemsInvolvedInAnimation = self->_itemsInvolvedInAnimation;
  self->_itemsInvolvedInAnimation = v16;

}

- (void)_updateCloseButtonImageForItem:(id)a3
{
  UIImage *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self->_closeButtonImage;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "closeButton"));
  objc_msgSend(v5, "setImage:forState:", v4, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailTiltedTabCloseButtonTintColor](UIColor, "mailTiltedTabCloseButtonTintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "closeButton"));
  objc_msgSend(v7, "setTintColor:", v6);

}

- (void)_closeButtonPressed:(id)a3
{
  id v4;
  NSMutableArray *visibleItems;
  id v6;
  _QWORD v7[4];
  id v8;
  MFTiltedTabView *v9;

  v4 = a3;
  visibleItems = self->_visibleItems;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B19E8;
  v7[3] = &unk_100522DB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](visibleItems, "enumerateObjectsUsingBlock:", v7);

}

- (void)_updateSpringAnimationForView:(id)a3 withFrame:(CGRect)a4 verticalScrollAdjustment:(double)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[8];
  _OWORD v21[8];

  v6 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "transform");
  else
    memset(v21, 0, sizeof(v21));
  v16 = *(_OWORD *)&CATransform3DIdentity.m33;
  v20[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v20[5] = v16;
  v17 = *(_OWORD *)&CATransform3DIdentity.m43;
  v20[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v20[7] = v17;
  v18 = *(_OWORD *)&CATransform3DIdentity.m13;
  v20[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v20[1] = v18;
  v19 = *(_OWORD *)&CATransform3DIdentity.m23;
  v20[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v20[3] = v19;
  -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v13, v21, v20, v6, x, y, width, height, 1.0, a5);

}

- (double)_velocityForSpringAnimations
{
  double v3;
  double v4;
  unsigned int v5;
  double v6;
  double result;
  double v8;

  -[MFTiltedTabView _tabCloseAnimationSlideDistance](self, "_tabCloseAnimationSlideDistance");
  v4 = v3;
  v5 = -[_MFTiltedTabItemView isClosing](self->_interactivelyClosingItem, "isClosing");
  v6 = -v4;
  result = 0.0;
  if (!v5)
    v6 = 0.0;
  v8 = -(v4 * self->_interactiveCloseProgress);
  if (v6 != v8)
    return self->_interactiveCloseVelocity / (v6 - v8);
  return result;
}

- (void)_configureVelocityForSpringAnimation:(id)a3 withKeyPath:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MFTiltedTabView _velocityForSpringAnimations](self, "_velocityForSpringAnimations");
  v8 = v7;
  if (v7 != 0.0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("position.x")) & 1) != 0)
    {
LABEL_5:
      objc_msgSend(v9, "setVelocity:", v8);
      goto LABEL_6;
    }
    if (!self->_applyVelocityOnlyToHorizontalPosition)
    {
      v8 = v8 + v8;
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_alloc_init((Class)MFSpringAnimation);
  objc_msgSend(v6, "setKeyPath:", v5);
  -[MFTiltedTabView _configureVelocityForSpringAnimation:withKeyPath:](self, "_configureVelocityForSpringAnimation:withKeyPath:", v6, v5);

  return v6;
}

- (void)_addSpringAnimationWithKeyPath:(id)a3 toLayer:(id)a4 fromValue:(id)a5 toValue:(id)a6
{
  id v10;
  id v11;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[MFSpringAnimation springAnimationWithKeyPath:fromValue:toValue:](MFSpringAnimation, "springAnimationWithKeyPath:fromValue:toValue:", v14, a5, a6));
  -[MFTiltedTabView _velocityForSpringAnimations](self, "_velocityForSpringAnimations");
  if (v12 != 0.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
    objc_msgSend(v11, "setTimingFunction:", v13);

    -[MFTiltedTabView _configureVelocityForSpringAnimation:withKeyPath:](self, "_configureVelocityForSpringAnimation:withKeyPath:", v11, v14);
  }
  objc_msgSend(v11, "setDelegate:", self);
  ++self->_activeAnimationCount;
  objc_msgSend(v10, "addAnimation:forKey:", v11, 0);

}

- (void)_updateSpringAnimationForView:(id)a3 withFrame:(CGRect)a4 transform:(CATransform3D *)a5 userTransform:(CATransform3D *)a6 opacity:(double)a7 verticalScrollAdjustment:(double)a8 animated:(BOOL)a9
{
  _BOOL8 v9;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  double v30;
  double v31;
  double Height;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
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
  double v56;
  __int128 v57;
  float v58;
  float v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  _BOOL4 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BOOL4 v73;
  _BOOL4 v74;
  double v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v104;
  double v105;
  double rect;
  CATransform3D v107;
  CATransform3D b;
  CATransform3D a;
  CGAffineTransform v110;
  CATransform3D v111;
  CGAffineTransform v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v9 = a9;
  rect = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
  objc_msgSend(v17, "anchorPoint");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v17, "position");
  v101 = v22;
  v24 = v23;
  *(_QWORD *)&v25 = -1;
  *((_QWORD *)&v25 + 1) = -1;
  *(_OWORD *)&v112.c = v25;
  *(_OWORD *)&v112.tx = v25;
  *(_OWORD *)&v112.a = v25;
  v26 = *(_OWORD *)&a6->m33;
  *(_OWORD *)&v111.m31 = *(_OWORD *)&a6->m31;
  *(_OWORD *)&v111.m33 = v26;
  v27 = *(_OWORD *)&a6->m43;
  *(_OWORD *)&v111.m41 = *(_OWORD *)&a6->m41;
  *(_OWORD *)&v111.m43 = v27;
  v28 = *(_OWORD *)&a6->m13;
  *(_OWORD *)&v111.m11 = *(_OWORD *)&a6->m11;
  *(_OWORD *)&v111.m13 = v28;
  v29 = *(_OWORD *)&a6->m23;
  *(_OWORD *)&v111.m21 = *(_OWORD *)&a6->m21;
  *(_OWORD *)&v111.m23 = v29;
  CATransform3DGetAffineTransform(&v112, &v111);
  objc_msgSend(v16, "bounds");
  v30 = CGRectGetWidth(v113);
  v31 = 0.0;
  if (v30 > 0.0)
    v31 = v112.tx / v30;
  v112.tx = v31;
  objc_msgSend(v16, "bounds");
  Height = CGRectGetHeight(v114);
  v33 = 0.0;
  if (Height > 0.0)
    v33 = v112.ty / Height;
  v34 = v19;
  v99 = v24;
  v112.ty = v33;
  v35 = *(_OWORD *)&a6->m33;
  *(_OWORD *)&v111.m31 = *(_OWORD *)&a6->m31;
  *(_OWORD *)&v111.m33 = v35;
  v36 = *(_OWORD *)&a6->m43;
  *(_OWORD *)&v111.m41 = *(_OWORD *)&a6->m41;
  *(_OWORD *)&v111.m43 = v36;
  v37 = *(_OWORD *)&a6->m13;
  *(_OWORD *)&v111.m11 = *(_OWORD *)&a6->m11;
  *(_OWORD *)&v111.m13 = v37;
  v38 = *(_OWORD *)&a6->m23;
  *(_OWORD *)&v111.m21 = *(_OWORD *)&a6->m21;
  *(_OWORD *)&v111.m23 = v38;
  CATransform3DGetAffineTransform(&v110, &v111);
  v39 = x;
  v115.origin.x = x;
  v40 = y;
  v115.origin.y = y;
  v105 = width;
  v115.size.width = width;
  v115.size.height = rect;
  v116 = CGRectApplyAffineTransform(v115, &v110);
  v41 = v116.origin.x;
  v42 = v116.origin.y;
  v43 = v116.size.width;
  v44 = v116.size.height;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v45, "scale");
  v47 = UIRectCenteredIntegralRectScale(v41, v42, v43, v44, v39, v40, v105, rect, v46);
  v49 = v48;
  v51 = v50;
  v53 = v52;

  v54 = UIPointRoundToViewScale(self, v47 + v34 * v51, v49 + v21 * v53);
  v104 = v55;
  v56 = v54;
  *(_QWORD *)&v57 = -1;
  *((_QWORD *)&v57 + 1) = -1;
  *(_OWORD *)&v111.m41 = v57;
  *(_OWORD *)&v111.m43 = v57;
  *(_OWORD *)&v111.m31 = v57;
  *(_OWORD *)&v111.m33 = v57;
  *(_OWORD *)&v111.m21 = v57;
  *(_OWORD *)&v111.m23 = v57;
  *(_OWORD *)&v111.m11 = v57;
  *(_OWORD *)&v111.m13 = v57;
  if (v17)
    objc_msgSend(v17, "transform");
  else
    memset(&v111, 0, sizeof(v111));
  objc_msgSend(v17, "opacity");
  v59 = v58;
  objc_msgSend(v17, "bounds");
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v100 = v99 + a8;
  v68 = v100 != v104 || v101 != v56;
  a = v111;
  v69 = *(_OWORD *)&a5->m33;
  *(_OWORD *)&b.m31 = *(_OWORD *)&a5->m31;
  *(_OWORD *)&b.m33 = v69;
  v70 = *(_OWORD *)&a5->m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&a5->m41;
  *(_OWORD *)&b.m43 = v70;
  v71 = *(_OWORD *)&a5->m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&a5->m11;
  *(_OWORD *)&b.m13 = v71;
  v72 = *(_OWORD *)&a5->m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&a5->m21;
  *(_OWORD *)&b.m23 = v72;
  v73 = CATransform3DEqualToTransform(&a, &b);
  v117.origin.x = v61;
  v117.origin.y = v63;
  v117.size.width = v65;
  v117.size.height = v67;
  v118.origin.x = v61;
  v118.origin.y = v63;
  v118.size.width = v105;
  v118.size.height = rect;
  v74 = CGRectEqualToRect(v117, v118);
  v75 = v59;
  if (v68 || !v73 || v75 != a7 || !v74)
  {
    if (!v74)
      -[MFTiltedTabView _updateSpringAnimationForView:withBounds:animated:](self, "_updateSpringAnimationForView:withBounds:animated:", v16, v9, v61, v63, v105, rect);
    objc_msgSend(v17, "setPosition:", v56, v104);
    v76 = *(_OWORD *)&a5->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&a5->m31;
    *(_OWORD *)&a.m33 = v76;
    v77 = *(_OWORD *)&a5->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&a5->m41;
    *(_OWORD *)&a.m43 = v77;
    v78 = *(_OWORD *)&a5->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&a5->m11;
    *(_OWORD *)&a.m13 = v78;
    v79 = *(_OWORD *)&a5->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&a5->m21;
    *(_OWORD *)&a.m23 = v79;
    objc_msgSend(v17, "setTransform:", &a);
    HIDWORD(v80) = HIDWORD(a7);
    *(float *)&v80 = a7;
    objc_msgSend(v17, "setOpacity:", v80);
    if (v9)
    {
      if (v68)
      {
        v81 = v101 - v56;
        v82 = v100 - v104;
        if (!self->_applyVelocityOnlyToHorizontalPosition
          || (-[MFTiltedTabView _velocityForSpringAnimations](self, "_velocityForSpringAnimations"), v83 == 0.0))
        {
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v81, v82));
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y));
          -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("position"), v17, v85, v86);

        }
        else
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v81));
          -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("position.x"), v17, v84, &off_100541950);

          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v82));
          -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("position.y"), v17, v85, &off_100541950);
        }

      }
      if (!v73)
      {
        *(_QWORD *)&v87 = -1;
        *((_QWORD *)&v87 + 1) = -1;
        *(_OWORD *)&a.m41 = v87;
        *(_OWORD *)&a.m43 = v87;
        *(_OWORD *)&a.m31 = v87;
        *(_OWORD *)&a.m33 = v87;
        *(_OWORD *)&a.m21 = v87;
        *(_OWORD *)&a.m23 = v87;
        *(_OWORD *)&a.m11 = v87;
        *(_OWORD *)&a.m13 = v87;
        v88 = *(_OWORD *)&a5->m33;
        *(_OWORD *)&b.m31 = *(_OWORD *)&a5->m31;
        *(_OWORD *)&b.m33 = v88;
        v89 = *(_OWORD *)&a5->m43;
        *(_OWORD *)&b.m41 = *(_OWORD *)&a5->m41;
        *(_OWORD *)&b.m43 = v89;
        v90 = *(_OWORD *)&a5->m13;
        *(_OWORD *)&b.m11 = *(_OWORD *)&a5->m11;
        *(_OWORD *)&b.m13 = v90;
        v91 = *(_OWORD *)&a5->m23;
        *(_OWORD *)&b.m21 = *(_OWORD *)&a5->m21;
        *(_OWORD *)&b.m23 = v91;
        CATransform3DInvert(&v107, &b);
        b = v111;
        CATransform3DConcat(&a, &b, &v107);
        b = a;
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &b));
        v93 = *(_OWORD *)&CATransform3DIdentity.m33;
        *(_OWORD *)&b.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
        *(_OWORD *)&b.m33 = v93;
        v94 = *(_OWORD *)&CATransform3DIdentity.m43;
        *(_OWORD *)&b.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
        *(_OWORD *)&b.m43 = v94;
        v95 = *(_OWORD *)&CATransform3DIdentity.m13;
        *(_OWORD *)&b.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
        *(_OWORD *)&b.m13 = v95;
        v96 = *(_OWORD *)&CATransform3DIdentity.m23;
        *(_OWORD *)&b.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
        *(_OWORD *)&b.m23 = v96;
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &b));
        -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("transform"), v17, v92, v97);

      }
      if (v75 != a7)
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v75 - a7));
        -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("opacity"), v17, v98, &off_100541950);

      }
    }
  }
  else if (a8 != 0.0)
  {
    objc_msgSend(v17, "setPosition:", v56, v104);
  }

}

- (void)_updateSpringAnimationForView:(id)a3 withBounds:(CGRect)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  CGRect v22;
  CGRect v23;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a3;
  objc_msgSend(v21, "bounds");
  v11 = v22.origin.x;
  v12 = v22.origin.y;
  v13 = v22.size.width;
  v14 = v22.size.height;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  if (!CGRectEqualToRect(v22, v23))
  {
    objc_msgSend(v21, "setBounds:", x, y, width, height);
    if (v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v11 - x, v12 - y));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y));
      -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("bounds.origin"), v15, v16, v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v13 - width, v14 - height));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height));
      -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("bounds.size"), v18, v19, v20);

    }
  }

}

- (id)_makeReorderAnimationWithDirection:(int64_t)a3 springDuration:(double)a4 tabCount:(double)a5
{
  double v7;
  __double2 v8;
  double v9;
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
  double v21;
  _QWORD v23[3];

  v7 = sub_10019E778(a5);
  v8 = __sincos_stret(v7 * 3.14159265 / 180.0);
  v9 = *(double *)&qword_1005A2A78;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position")));
  objc_msgSend(v10, "setMass:", 1.0);
  objc_msgSend(v10, "setStiffness:", 300.0);
  objc_msgSend(v10, "setDamping:", 400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v10, "setTimingFunction:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, v9 * v8.__cosval));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y));
  sub_1001B2B2C(v10, v12, v13, a3);

  objc_msgSend(v10, "setDuration:", a4);
  objc_msgSend(v10, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v10, "setAdditive:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("zPosition")));
  objc_msgSend(v14, "setMass:", 1.0);
  objc_msgSend(v14, "setStiffness:", 300.0);
  objc_msgSend(v14, "setDamping:", 400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v14, "setTimingFunction:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -(v8.__sinval * v9)));
  sub_1001B2B2C(v14, v16, &off_100541950, a3);

  objc_msgSend(v14, "setDuration:", a4);
  objc_msgSend(v14, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v14, "setAdditive:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  sub_1001B2B2C(v17, &off_100541968, &off_100541950, a3);
  if (a3 < 1)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn));
  else
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  objc_msgSend(v17, "setTimingFunction:", v18);

  objc_msgSend(v17, "setDuration:", *(double *)&qword_1005A2A30);
  objc_msgSend(v17, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v17, "setAdditive:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](CAAnimationGroup, "animation"));
  v23[0] = v10;
  v23[1] = v14;
  v23[2] = v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
  objc_msgSend(v19, "setAnimations:", v20);

  *(float *)&v21 = 1.0 / UIAnimationDragCoefficient(objc_msgSend(v19, "setDuration:", a4));
  objc_msgSend(v19, "setSpeed:", v21);
  objc_msgSend(v19, "setFillMode:", kCAFillModeBoth);

  return v19;
}

- (void)_stopReorderingItem:(id)a3 withFinalTimeAdjustment:(double)a4 tabCount:(double)a5
{
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "setReordering:", 0);
  objc_msgSend(v13, "setIndexForLayout:", 0x7FFFFFFFFFFFFFFFLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v8, "removeAnimationForKey:", CFSTR("reorder-animation"));
  -[MFTiltedTabView setNeedsLayout](self, "setNeedsLayout");
  v9 = 1.0 - a4;
  if (a4 > 1.0)
    v9 = 0.0;
  v10 = fmin(*(double *)&qword_1005A2A20 / *(double *)&qword_1005A2A30 + v9 * 2.0, 1.0);
  if (v10 > 0.001)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView _makeReorderAnimationWithDirection:springDuration:tabCount:](self, "_makeReorderAnimationWithDirection:springDuration:tabCount:", 1, *(double *)&qword_1005A2A28, a5));
    v12 = 1.0 / v10;
    *(float *)&v12 = 1.0 / v10;
    objc_msgSend(v11, "setSpeed:", v12);
    objc_msgSend(v8, "addAnimation:forKey:", v11, 0);

  }
}

- (void)_updateReorderAnimationBeginTimeForLayer:(id)a3 withTimeAdjustment:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;

  v13 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "animationForKey:", CFSTR("reorder-animation")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("base-begin-time")));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = *(double *)&qword_1005A2A30;
  objc_msgSend(v5, "beginTime");
  v11 = v8 - a4 * v9;
  if (v10 == 0.0 || v11 < v10)
  {
    objc_msgSend(v5, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("being-replaced"));
    v12 = objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v12, "setValue:forKey:", &__kCFBooleanFalse, CFSTR("being-replaced"));
    objc_msgSend(v12, "setBeginTime:", v11);
    objc_msgSend(v13, "addAnimation:forKey:", v12, CFSTR("reorder-animation"));
  }
  else
  {
    v12 = v5;
  }

}

- (void)_updateReorderAnimationsForItem:(id)a3 withTimeAdjustment:(double)a4 tabCount:(double)a5 createIfNecessary:(BOOL)a6
{
  void *v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "animationForKey:", CFSTR("reorder-animation")));
  if (v9)
  {
    v10 = 0.0;
    if (a4 >= 0.0 && (v10 = a4, a4 >= 1.0))
    {
      -[MFTiltedTabView _stopReorderingItem:withFinalTimeAdjustment:tabCount:](self, "_stopReorderingItem:withFinalTimeAdjustment:tabCount:", v11);
    }
    else
    {
      CACurrentMediaTime();
      -[MFTiltedTabView _updateReorderAnimationBeginTimeForLayer:withTimeAdjustment:](self, "_updateReorderAnimationBeginTimeForLayer:withTimeAdjustment:", v8, v10);
    }
  }

}

- (double)_spaceBetweenTabsWithCount:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[MFTiltedTabView _tabLayoutBounds](self, "_tabLayoutBounds");
  v6 = v5 * 0.07 + 77.0;
  if (a3 >= 1.0)
  {
    v7 = v5;
    -[MFTiltedTabView _topAreaHeightForTabsWithCount:](self, "_topAreaHeightForTabsWithCount:", a3);
    v9 = (v7 - v8 - *(double *)&qword_1005A2AC0 + unk_1005A2AC8) / a3;
    if (v9 >= v6)
      return v9;
  }
  return v6;
}

- (CGSize)_contentSizeForItemCount:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[MFTiltedTabView _tabLayoutBounds](self, "_tabLayoutBounds");
  v6 = v5;
  -[MFTiltedTabView _spaceBetweenTabsWithCount:](self, "_spaceBetweenTabsWithCount:", a3);
  v8 = v7;
  -[MFTiltedTabView _topAreaHeightForTabsWithCount:](self, "_topAreaHeightForTabsWithCount:", a3);
  v10 = v9 + v8 * a3 + *(double *)&qword_1005A2AC0;
  v11 = v6;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)_baseOffsetForItemAtIndex:(unint64_t)a3 withItemCountForLayout:(double)a4
{
  double v5;

  -[MFTiltedTabView _spaceBetweenTabsWithCount:](self, "_spaceBetweenTabsWithCount:", fmax(a4, 1.0));
  return v5 * (double)a3;
}

- (double)_baseOffsetForItem:(id)a3 index:(unint64_t *)a4 count:(double *)a5
{
  _MFTiltedTabItemView *v8;
  id v9;
  unint64_t v10;
  double v11;
  double v12;
  double interactiveReorderOffset;

  v8 = (_MFTiltedTabItemView *)a3;
  v9 = -[_MFTiltedTabItemView indexForLayout](v8, "indexForLayout");
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v8);
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = -[MFTiltedTabView _numberOfItems](self, "_numberOfItems");
      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
        __assert_rtn("-[MFTiltedTabView _baseOffsetForItem:index:count:]", "MFTiltedTabView.m", 1513, "itemIndex != NSNotFound");
    }
  }
  if (-[_MFTiltedTabItemView countForLayout](v8, "countForLayout") == 0x7FFFFFFFFFFFFFFFLL)
    v10 = -[MFTiltedTabView _numberOfItems](self, "_numberOfItems");
  else
    v10 = -[_MFTiltedTabItemView countForLayout](v8, "countForLayout");
  v11 = (double)v10;
  if (self->_interactivelyReorderingItem != v8)
  {
    -[MFTiltedTabView _baseOffsetForItemAtIndex:withItemCountForLayout:](self, "_baseOffsetForItemAtIndex:withItemCountForLayout:", v9, v11);
    interactiveReorderOffset = v12;
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  interactiveReorderOffset = self->_interactiveReorderOffset;
  if (a4)
LABEL_9:
    *a4 = (unint64_t)v9;
LABEL_10:
  if (a5)
    *a5 = v11;

  return interactiveReorderOffset;
}

- (void)_invalidateAllSnapshots
{
  -[MFTiltedTabView _invalidateAllSnapshotsForce:](self, "_invalidateAllSnapshotsForce:", 0);
}

- (void)_invalidateAllSnapshotsForce:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  double v15;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (self->_presented)
  {
    v3 = a3;
    if (-[NSArray count](self->_itemsInvolvedInAnimation, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v5 = self->_itemsInvolvedInAnimation;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            v10 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v9, (_QWORD)v20);
            objc_msgSend(v9, "frame");
            v12 = v11;
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "tiltedTabView:frameForItemAtIndex:", self, v10);
            v15 = v14;

            if (v15 != v12 || v3)
            {
              if (-[MFTiltedTabView rotationStyle](self, "rotationStyle"))
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "borrowedContentView"));
                objc_msgSend(v17, "setAlpha:", 0.0);

                v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentClipperView"));
                objc_msgSend(v19, "setBackgroundColor:", v18);

              }
            }
          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v6);
      }

    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTiltedTabView;
  -[MFTiltedTabView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "mf_traitDifferenceAffectsTextLayout:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if ((v6 | v8) == 1)
  {
    -[MFTiltedTabView _invalidateAllSnapshotsForce:](self, "_invalidateAllSnapshotsForce:", 1);
    -[MFTiltedTabView updateSnapshotsIfNecessary](self, "updateSnapshotsIfNecessary");
  }

}

- (int64_t)_currentOrientation
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView window](self, "window"));

  if (!v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTiltedTabView.m"), 1575, CFSTR("Asking for currentOrientation without a window is not supported."));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView window](self, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = objc_msgSend(v6, "interfaceOrientation");

  return (int64_t)v7;
}

- (id)visibleIndexSet
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v5 = v4;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v6 = 0;
  v8 = v5 + v7;
  while (v6 < -[MFTiltedTabView _numberOfItems](self, "_numberOfItems"))
  {
    -[MFTiltedTabView _baseOffsetForItemAtIndex:withItemCountForLayout:](self, "_baseOffsetForItemAtIndex:withItemCountForLayout:", v6, (double)-[MFTiltedTabView _numberOfItems](self, "_numberOfItems"));
    if (v9 + 200.0 > v5 && v9 < v8)
      objc_msgSend(v3, "addIndex:", v6);
    ++v6;
  }
  return v3;
}

- (void)updateSnapshotsIfNecessary
{
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSArray *obj;
  CGPoint origin;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  CGPoint v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_itemsInvolvedInAnimation;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v36;
    origin = CGRectZero.origin;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentClipperView"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0));

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentClipperView"));
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "transform");
        }
        else
        {
          v33 = 0u;
          v34 = 0u;
          v32 = 0u;
        }
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        objc_msgSend(v8, "setTransform:", v31);

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentClipperView"));
        objc_msgSend(v11, "frame");
        objc_msgSend(v8, "setFrame:");

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentClipperView"));
        objc_msgSend(v6, "insertSubview:aboveSubview:", v8, v12);

        v13 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v6);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1001B39F4;
        v30[3] = &unk_10051CF70;
        v30[4] = self;
        v30[5] = v6;
        v30[6] = v13;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "tiltedTabView:frameForItemAtIndex:", self, v13);
        v16 = v15;
        v18 = v17;

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1001B3DCC;
        v24[3] = &unk_10051BF58;
        v25 = v8;
        v26 = v6;
        v27 = origin;
        v28 = v16;
        v29 = v18;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001B3EE0;
        v22[3] = &unk_10051A848;
        v19 = v25;
        v23 = v19;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v24, v22, 0.22);

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v3);
  }

  -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", 0);
}

- (void)layoutItemsAnimated:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  unint64_t v16;
  double v17;
  double v18;
  UIScrollView *scrollView;
  double v20;
  id v21;
  _MFTiltedTabItemView *v22;
  unint64_t v23;
  double v24;
  double v25;
  double top;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  double j;
  double v61;
  __int128 v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  double MidX;
  void *v75;
  double MidY;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  unint64_t v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  _BOOL4 presented;
  CGFloat v113;
  double v114;
  __int128 v115;
  _MFTiltedTabItemView *selectedItem;
  BOOL v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  double v138;
  double v139;
  __int128 v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  id v150;
  double v151;
  double v152;
  double x;
  double v154;
  void *v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  _QWORD *v167;
  void *v168;
  double v169;
  double v170;
  _QWORD *v171;
  void *v172;
  double v173;
  double v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  NSArray *obj;
  unint64_t v180;
  double v181;
  double v182;
  CGFloat height;
  double width;
  double v185;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  uint64_t v189;
  double v190;
  id v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double y;
  char v197;
  double v198;
  double v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  void *i;
  double v209;
  double rect;
  BOOL v211;
  double v212;
  double v213;
  id WeakRetained;
  _BOOL4 v215;
  _QWORD v216[6];
  _QWORD v217[6];
  CATransform3D v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v229;
  CGAffineTransform v230;
  CATransform3D v231;
  CATransform3D v232;
  CATransform3D v233;
  double v234;
  unint64_t v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  _BYTE v240[128];
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;

  v215 = a3;
  -[MFTiltedTabView bounds](self, "bounds");
  if (self->_suppressingScrollViewDidScroll)
    sub_100394C9C();
  v8 = v4;
  v9 = v5;
  v10 = v7;
  self->_suppressingScrollViewDidScroll = 1;
  v11 = v6;
  -[UIScrollView frame](self->_scrollView, "frame");
  v249.origin.x = v12;
  v249.origin.y = v13;
  v249.size.width = v14;
  v249.size.height = v15;
  v241.origin.x = v8;
  v241.origin.y = v9;
  v178 = v11;
  v241.size.width = v11;
  v190 = v10;
  v241.size.height = v10;
  if (!CGRectEqualToRect(v241, v249))
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v8, v9, v11, v10);
  v16 = -[MFTiltedTabView _numberOfItems](self, "_numberOfItems");
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v18 = v17;
  scrollView = self->_scrollView;
  v177 = (double)v16;
  -[MFTiltedTabView _contentSizeForItemCount:](self, "_contentSizeForItemCount:");
  -[UIScrollView setContentSize:](scrollView, "setContentSize:");
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v192 = v20;
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", self->_presented);
  self->_suppressingScrollViewDidScroll = 0;
  if (self->_selectedItem)
    v180 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:");
  else
    v180 = 0x7FFFFFFFFFFFFFFFLL;
  v239 = 0u;
  v238 = 0u;
  v237 = 0u;
  v236 = 0u;
  obj = self->_itemsInvolvedInAnimation;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v236, v240, 16);
  if (v21)
  {
    v191 = v21;
    v197 = 0;
    v194 = v192 - v18;
    v189 = *(_QWORD *)v237;
    left = UIEdgeInsetsZero.left;
    right = UIEdgeInsetsZero.right;
    bottom = UIEdgeInsetsZero.bottom;
    y = CGPointZero.y;
    v193 = fmax(-v192, 0.0);
    v181 = v10 + v192;
    v185 = CGRectNull.origin.y;
    height = CGRectNull.size.height;
    width = CGRectNull.size.width;
    v182 = CGRectZero.origin.y;
    do
    {
      for (i = 0; i != v191; i = (char *)i + 1)
      {
        if (*(_QWORD *)v237 != v189)
          objc_enumerationMutation(obj);
        v22 = *(_MFTiltedTabItemView **)(*((_QWORD *)&v236 + 1) + 8 * (_QWORD)i);
        self->_applyVelocityOnlyToHorizontalPosition = v22 == self->_onlyHorizontalVelocityItem;
        v211 = !-[_MFTiltedTabItemView isClosing](v22, "isClosing")
            && -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v22) == 0x7FFFFFFFFFFFFFFFLL;
        v23 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v22);
        v235 = 0xAAAAAAAAAAAAAAAALL;
        v234 = NAN;
        -[MFTiltedTabView _baseOffsetForItem:index:count:](self, "_baseOffsetForItem:index:count:", v22, &v235, &v234);
        v25 = v24;
        v206 = *(_OWORD *)&CATransform3DIdentity.m33;
        v207 = *(_OWORD *)&CATransform3DIdentity.m31;
        *(_OWORD *)&v233.m31 = v207;
        *(_OWORD *)&v233.m33 = v206;
        v204 = *(_OWORD *)&CATransform3DIdentity.m43;
        v205 = *(_OWORD *)&CATransform3DIdentity.m41;
        *(_OWORD *)&v233.m41 = v205;
        *(_OWORD *)&v233.m43 = v204;
        v202 = *(_OWORD *)&CATransform3DIdentity.m13;
        v203 = *(_OWORD *)&CATransform3DIdentity.m11;
        *(_OWORD *)&v233.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
        *(_OWORD *)&v233.m13 = v202;
        v200 = *(_OWORD *)&CATransform3DIdentity.m23;
        v201 = *(_OWORD *)&CATransform3DIdentity.m21;
        *(_OWORD *)&v233.m21 = v201;
        *(_OWORD *)&v233.m23 = v200;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v27 = left;
        top = UIEdgeInsetsZero.top;
        v29 = right;
        v28 = bottom;
        if (!-[_MFTiltedTabItemView isClosing](v22, "isClosing"))
        {
          objc_msgSend(WeakRetained, "tiltedTabView:expanded:edgeInsetsForItemAtIndex:", self, self->_presented, v23);
          top = v30;
          v27 = v31;
          v28 = v32;
          v29 = v33;
          if (WeakRetained)
            objc_msgSend(WeakRetained, "tiltedTabView:expanded:layerTransformForItemAtIndex:", self, self->_presented, v23);
          else
            memset(&v232, 0, sizeof(v232));
          v233 = v232;
        }
        -[_MFTiltedTabItemView setContentClippingInsets:](v22, "setContentClippingInsets:", top, v27, v28, v29);
        v198 = 0.0;
        if (!v211 && self->_presented)
        {
          -[MFTiltedTabView _scrollingEffectFactorForTabsWithCount:](self, "_scrollingEffectFactorForTabsWithCount:", v234);
          v198 = v34;
        }
        if (-[_MFTiltedTabItemView isClosing](v22, "isClosing"))
        {
          -[_MFTiltedTabItemView bounds](v22, "bounds");
          v213 = v35;
          rect = v36;
          v38 = v37;
          v40 = v39;
        }
        else
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView superview](v22, "superview"));
          objc_msgSend(WeakRetained, "tiltedTabView:frameForItemAtIndex:", self, v23);
          v43 = v42;
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[MFTiltedTabView superview](self, "superview"));
          objc_msgSend(v41, "convertRect:fromView:", v50, v43, v45, v47, v49);
          v213 = v51;
          rect = v52;
          v38 = v53;
          v40 = v54;

        }
        if ((id)-[MFTiltedTabView rotationStyle](self, "rotationStyle") != (id)2)
        {
          v56 = -[_MFTiltedTabItemView capturedInterfaceOrientation](v22, "capturedInterfaceOrientation");
          v57 = -[MFTiltedTabView _currentOrientation](self, "_currentOrientation");
          v58 = 0;
          v59 = 0;
          for (j = 0.0; ; j = j + v61)
          {
            if (qword_1004C9AF0[v58] == v56)
            {
              if (qword_1004C9AF0[v59] == v57)
              {
                *(_QWORD *)&v62 = -1;
                *((_QWORD *)&v62 + 1) = -1;
                *(_OWORD *)&v232.m43 = v62;
                *(_OWORD *)&v232.m41 = v62;
                *(_OWORD *)&v232.m33 = v62;
                *(_OWORD *)&v232.m31 = v62;
                *(_OWORD *)&v232.m23 = v62;
                *(_OWORD *)&v232.m21 = v62;
                *(_OWORD *)&v232.m13 = v62;
                *(_OWORD *)&v232.m11 = v62;
                CATransform3DMakeRotation(&v232, j, 0.0, 0.0, 1.0);
                v231 = v232;
                -[_MFTiltedTabItemView setContentTransform:](v22, "setContentTransform:", &v231);
                v231 = v232;
                CATransform3DGetAffineTransform(&v230, &v231);
                v242.origin.x = v38;
                v242.origin.y = v40;
                v242.size.width = v213;
                v242.size.height = rect;
                *(CGRect *)&v55 = CGRectApplyAffineTransform(v242, &v230);
                v40 = v63;
                v213 = v64;
                rect = v65;
                break;
              }
              v59 = ((_BYTE)v59 + 1) & 3;
              v61 = 1.57079633;
            }
            else
            {
              v58 = ((_BYTE)v58 + 1) & 3;
              v61 = -1.57079633;
            }
          }
        }
        -[MFTiltedTabView bounds](self, "bounds", v55);
        v209 = (v66 - v213) * 0.5;
        if (self->_presented)
        {
          v67 = v25;
        }
        else
        {
          -[_MFTiltedTabItemView contentClippingInsets](v22, "contentClippingInsets");
          v69 = v68;
          -[_MFTiltedTabItemView contentClippingInsets](v22, "contentClippingInsets");
          v209 = v209 + v69;
          v67 = v25 + v70;
        }
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView borrowedContentView](v22, "borrowedContentView"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "layer"));

        v73 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView borrowedContentView](v22, "borrowedContentView"));
        objc_msgSend(v73, "bounds");
        MidX = CGRectGetMidX(v243);
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView borrowedContentView](v22, "borrowedContentView"));
        objc_msgSend(v75, "bounds");
        MidY = CGRectGetMidY(v244);

        -[_MFTiltedTabItemView contentClippingInsets](v22, "contentClippingInsets");
        v78 = v77;
        -[_MFTiltedTabItemView contentClippingInsets](v22, "contentClippingInsets");
        v80 = v79;
        objc_msgSend(v72, "position");
        v82 = v81;
        objc_msgSend(v72, "position");
        v83 = MidX - v78;
        v84 = MidY - v80;
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v82 - v83, v85 - v84));
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, y));
        -[MFTiltedTabView _addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:](self, "_addSpringAnimationWithKeyPath:toLayer:fromValue:toValue:", CFSTR("position"), v72, v86, v87);

        objc_msgSend(v72, "setPosition:", v83, v84);
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView contentClipperView](v22, "contentClipperView"));
        -[_MFTiltedTabItemView bounds](v22, "bounds");
        v90 = v89;
        v92 = v91;
        -[_MFTiltedTabItemView contentClippingInsets](v22, "contentClippingInsets");
        -[MFTiltedTabView _updateSpringAnimationForView:withBounds:animated:](self, "_updateSpringAnimationForView:withBounds:animated:", v88, v215, CGPointZero.x, y, v90 - (v93 + v94), v92 - (v95 + v96));
        v97 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView maskCutoutView](v22, "maskCutoutView"));
        if (v97)
        {
          objc_msgSend(v88, "frame");
          objc_msgSend(v97, "setFrame:");
          if (v215)
          {
            v98 = (void *)objc_claimAutoreleasedReturnValue(+[MFSpringAnimation springAnimationWithKeyPath:fromValue:toValue:](MFSpringAnimation, "springAnimationWithKeyPath:fromValue:toValue:", CFSTR("path"), 0, 0));
            objc_msgSend(v98, "setAdditive:", 0);
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "layer"));
            objc_msgSend(v99, "addAnimation:forKey:", v98, 0);

          }
        }
        objc_msgSend(WeakRetained, "tiltedTabView:alphaValueForItemAtIndex:", self, v23);
        -[_MFTiltedTabItemView setAlpha:](v22, "setAlpha:");
        if (-[_MFTiltedTabItemView isReordering](v22, "isReordering"))
        {
          v100 = -[MFTiltedTabView _indexOfVisibleItem:](self, "_indexOfVisibleItem:", v22);
          v101 = 0.0;
          if (v100 < v235)
            v101 = -1.0;
          if (v100 > v235)
            v101 = 1.0;
          -[MFTiltedTabView _updateReorderAnimationsForItem:withTimeAdjustment:tabCount:createIfNecessary:](self, "_updateReorderAnimationsForItem:withTimeAdjustment:tabCount:createIfNecessary:", v22, v215, 1.0 - (self->_interactiveReorderOffset - v67) * v101 / *(double *)&qword_1005A2A70, v234);
          v197 = 1;
        }
        else
        {
          v197 |= v22 == self->_interactivelyReorderingItem;
        }
        if (self->_presented || (v102 = v192, -[_MFTiltedTabItemView isClosing](v22, "isClosing")))
        {
          v103 = v181;
          if (!v211)
          {
            -[MFTiltedTabView _topAreaHeightForTabsWithCount:](self, "_topAreaHeightForTabsWithCount:", v234);
            v103 = v67 + v104;
          }
          v102 = v103 * (v193 * *(double *)&qword_1005A2AD8 + 1.0);
        }
        if (v211)
          v105 = *(double *)&qword_1005A2AD0;
        else
          v105 = sub_10019E778(v234);
        v106 = *(double *)&qword_1005A2A60;
        if (!self->_presented)
          v106 = 0.0;
        v212 = v106;
        if (v22 == self->_pressedItem
          || v22 == self->_interactivelyClosingItem
          || v22 == self->_interactivelyReorderingItem
          || -[_MFTiltedTabItemView isClosing](v22, "isClosing"))
        {
          v105 = v105 + -2.0;
          v102 = v102 + -10.0;
        }
        if (self->_presented)
          v212 = v212 + v198 * 0.2 * sub_10019E914((v25 - v192) / v190, v190);
        if (-[_MFTiltedTabItemView isClosing](v22, "isClosing"))
        {
          -[MFTiltedTabView _tabCloseAnimationSlideDistance](self, "_tabCloseAnimationSlideDistance");
          v108 = v107;
          -[_MFTiltedTabItemView verticalScrollAdjustment](v22, "verticalScrollAdjustment");
          v110 = v194 + v109;
          -[_MFTiltedTabItemView setVerticalScrollAdjustment:](v22, "setVerticalScrollAdjustment:", v194 + v109);
          -[NSMutableSet addObject:](self->_itemsCurrentlyClosing, "addObject:", v22);
          v209 = -(v213 + v108);
          v102 = v102 + v110;
        }
        else if (v22 == self->_interactivelyClosingItem)
        {
          -[MFTiltedTabView _tabCloseAnimationSlideDistance](self, "_tabCloseAnimationSlideDistance");
          v209 = -(v111 * self->_interactiveCloseProgress);
        }
        presented = self->_presented;
        if (self->_presented)
          v113 = v102;
        else
          v113 = v40;
        v195 = v113;
        v232 = v233;
        if (presented)
        {
          v114 = v198 * sub_10019E8C8((v25 - v192) / v190)
               + (v105 + v193 * *(double *)&qword_1005A2AE0) * -3.14159265 / 180.0;
          if (v114 != 0.00000011920929)
          {
            *(_QWORD *)&v115 = -1;
            *((_QWORD *)&v115 + 1) = -1;
            *(_OWORD *)&v231.m43 = v115;
            *(_OWORD *)&v231.m41 = v115;
            *(_OWORD *)&v231.m33 = v115;
            *(_OWORD *)&v231.m31 = v115;
            *(_OWORD *)&v231.m23 = v115;
            *(_OWORD *)&v231.m21 = v115;
            *(_OWORD *)&v231.m13 = v115;
            *(_OWORD *)&v231.m11 = v115;
            CATransform3DMakeRotation(&v231, v114, 1.0, 0.0, 0.0);
            a = v233;
            b = v231;
            CATransform3DConcat(&v229, &a, &b);
            v232 = v229;
          }
        }
        selectedItem = self->_selectedItem;
        if (selectedItem && v180)
        {
          if (v235)
            v117 = v22 == selectedItem;
          else
            v117 = 1;
          v118 = v212 + -20.0;
          if (v117)
            v118 = v212;
          if (v22 == selectedItem)
            v118 = 1.0;
          v212 = v118;
          v197 = 1;
        }
        if (self->_presented)
        {
          -[MFTiltedTabView frame](self, "frame");
          v120 = v119;
          v122 = v121;
          v124 = v123;
          v126 = v125;
          -[MFTiltedTabView safeAreaInsets](self, "safeAreaInsets");
          v128 = v127;
          v130 = v129;
          v132 = v131;
          v134 = v133;
          v245.origin.x = v120;
          v245.origin.y = v122;
          v245.size.width = v124;
          v245.size.height = v126;
          v199 = CGRectGetWidth(v245);
          v246.origin.x = v120 + v130;
          v246.origin.y = v122 + v128;
          v246.size.width = v124 - (v130 + v134);
          v246.size.height = v126 - (v128 + v132);
          v135 = CGRectGetWidth(v246);
          v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView layer](self->_scrollView, "layer"));
          v137 = v136;
          if (v136)
          {
            objc_msgSend(v136, "sublayerTransform");
            v138 = *((double *)&v224 + 1);
          }
          else
          {
            v225 = 0u;
            v226 = 0u;
            v223 = 0u;
            v224 = 0u;
            v221 = 0u;
            v222 = 0u;
            v138 = 0.0;
            v219 = 0u;
            v220 = 0u;
          }

          v139 = v212 + -1.0 / v138 - v199 * (-1.0 / v138) / v135;
        }
        else
        {
          v139 = v212;
        }
        if (v139 != 0.0)
        {
          *(_QWORD *)&v140 = -1;
          *((_QWORD *)&v140 + 1) = -1;
          *(_OWORD *)&v231.m43 = v140;
          *(_OWORD *)&v231.m41 = v140;
          *(_OWORD *)&v231.m33 = v140;
          *(_OWORD *)&v231.m31 = v140;
          *(_OWORD *)&v231.m23 = v140;
          *(_OWORD *)&v231.m21 = v140;
          *(_OWORD *)&v231.m13 = v140;
          *(_OWORD *)&v231.m11 = v140;
          CATransform3DMakeTranslation(&v231, 0.0, 0.0, v139);
          a = v232;
          b = v231;
          CATransform3DConcat(&v229, &a, &b);
          v232 = v229;
        }
        v231 = v232;
        v229 = v233;
        -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v22, &v231, &v229, v215, v209, v195, v213, rect, 1.0, v194);
        -[_MFTiltedTabItemView layoutSubviews](v22, "layoutSubviews");
        objc_msgSend(WeakRetained, "tiltedTabView:headerHeightForItemAtIndex:", self, v23);
        v142 = v141;
        -[_MFTiltedTabItemView setTopBackdropHeight:](v22, "setTopBackdropHeight:");
        -[_MFTiltedTabItemView setTopBackdropScaled:](v22, "setTopBackdropScaled:", self->_presented);
        -[MFTiltedTabView _updateCloseButtonImageForItem:](self, "_updateCloseButtonImageForItem:", v22);
        v143 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView closeButtonWrapperView](v22, "closeButtonWrapperView"));
        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "superview"));
        objc_msgSend(v144, "bounds");
        v146 = v145;
        v147 = sub_10019E754();

        v148 = 0.8;
        if (self->_presented)
          v148 = v142 / v147;
        v149 = 0.0;
        if (!self->_presented)
          v149 = v142 / 1.6 + v147 * -0.5;
        CATransform3DMakeScale(&v218, 1.0, v148, 1.0);
        *(_OWORD *)&v231.m31 = v207;
        *(_OWORD *)&v231.m33 = v206;
        *(_OWORD *)&v231.m41 = v205;
        *(_OWORD *)&v231.m43 = v204;
        *(_OWORD *)&v231.m11 = v203;
        *(_OWORD *)&v231.m13 = v202;
        *(_OWORD *)&v231.m21 = v201;
        *(_OWORD *)&v231.m23 = v200;
        -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v143, &v218, &v231, v215, 0.0, v149, v146, v147, 1.0, 0.0);
        if (self->_presented)
          v150 = objc_msgSend(WeakRetained, "tiltedTabView:canCloseItemAtIndex:", self, v23);
        else
          v150 = 0;
        -[_MFTiltedTabItemView layoutHeaderViewAnimated:closeButton:](v22, "layoutHeaderViewAnimated:closeButton:", v215, v150);
        v152 = height;
        v151 = width;
        v154 = v185;
        x = CGRectNull.origin.x;
        if ((_DWORD)v150)
        {
          v155 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView closeButton](v22, "closeButton", CGRectNull.origin.x, v185, width));
          UIRectGetCenter(objc_msgSend(v155, "bounds"));
          objc_msgSend(v155, "convertPoint:toView:", self->_scrollView);
          v157 = v156;
          v159 = v158;
          v152 = *(double *)&qword_1005A2A50;

          x = v157 - v152 * 0.5;
          v154 = v159 - v152 * 0.5;
          v151 = v152;
        }
        -[_MFTiltedTabItemView setCloseButtonHitRect:](v22, "setCloseButtonHitRect:", x, v154, v151, v152);
        -[_MFTiltedTabItemView contentClippingInsets](v22, "contentClippingInsets");
        v161 = v160;
        v162 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView contentShadowView](v22, "contentShadowView"));
        if (self->_presented)
        {
          sub_10019E854();
          v164 = v163;
        }
        else
        {
          v164 = 0.0;
        }
        *(_OWORD *)&v231.m31 = v207;
        *(_OWORD *)&v231.m33 = v206;
        *(_OWORD *)&v231.m41 = v205;
        *(_OWORD *)&v231.m43 = v204;
        *(_OWORD *)&v231.m11 = v203;
        *(_OWORD *)&v231.m13 = v202;
        *(_OWORD *)&v231.m21 = v201;
        *(_OWORD *)&v231.m23 = v200;
        *(_OWORD *)&v229.m31 = v207;
        *(_OWORD *)&v229.m33 = v206;
        *(_OWORD *)&v229.m41 = v205;
        *(_OWORD *)&v229.m43 = v204;
        *(_OWORD *)&v229.m11 = v203;
        *(_OWORD *)&v229.m13 = v202;
        *(_OWORD *)&v229.m21 = v201;
        *(_OWORD *)&v229.m23 = v200;
        -[MFTiltedTabView _updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:](self, "_updateSpringAnimationForView:withFrame:transform:userTransform:opacity:verticalScrollAdjustment:animated:", v162, &v231, &v229, v215, CGRectZero.origin.x, v182, v213, rect - v161, v164, 0.0);
        if (v23)
        {
          v165 = (void *)objc_claimAutoreleasedReturnValue(-[DockedPlaceholderView headerView](v22, "headerView"));
          -[_MFTiltedTabItemView bringSubviewToFront:](v22, "bringSubviewToFront:", v165);

          v166 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView closeButtonWrapperView](v22, "closeButtonWrapperView"));
          -[_MFTiltedTabItemView bringSubviewToFront:](v22, "bringSubviewToFront:", v166);

          v217[0] = _NSConcreteStackBlock;
          v217[1] = 3221225472;
          v217[2] = sub_1001B5590;
          v217[3] = &unk_10051A910;
          v217[4] = self;
          v217[5] = v22;
          v167 = objc_retainBlock(v217);
          v168 = v167;
          if (v215)
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v167, 0, 0.22, 0.0);
          else
            ((void (*)(_QWORD *))v167[2])(v167);

        }
      }
      v191 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v236, v240, 16);
    }
    while (v191);
  }
  else
  {
    v197 = 0;
  }

  self->_applyVelocityOnlyToHorizontalPosition = 0;
  if (self->_presented)
  {
    -[MFTiltedTabView _topAreaHeightForTabsWithCount:](self, "_topAreaHeightForTabsWithCount:", v177);
    v170 = *(double *)&qword_1005A2AB0 * fmax(fmin(v192 / v169, 1.0), 0.0);
  }
  else
  {
    v170 = 0.0;
  }
  v216[0] = _NSConcreteStackBlock;
  v216[1] = 3221225472;
  v216[2] = sub_1001B5634;
  v216[3] = &unk_10051ABD8;
  v216[4] = self;
  *(double *)&v216[5] = v170;
  v171 = objc_retainBlock(v216);
  v172 = v171;
  if (v215)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v171, 0.25);
  else
    ((void (*)(_QWORD *))v171[2])(v171);
  -[MFTiltedTabView _statusBarHeight](self, "_statusBarHeight");
  v247.size.height = v190;
  v247.origin.y = -(v190 + v173 - *(double *)&qword_1005A2AB8);
  v247.size.width = v178;
  v247.origin.x = 0.0;
  v248 = CGRectInset(v247, -v178, 0.0);
  v174 = v248.size.height;
  -[_TabGradientView setFrame:](self->_statusBarGradient, "setFrame:", v248.origin.x, v248.origin.y, v248.size.width);
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[_TabGradientView gradientLayer](self->_statusBarGradient, "gradientLayer"));
  objc_msgSend(v175, "setStartPoint:", 0.5, 1.0 - *(double *)&qword_1005A2AB8 / v174);
  objc_msgSend(v175, "setEndPoint:", 0.5, 1.0);
  v176 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView layer](self->_scrollView, "layer"));
  objc_msgSend(v176, "setSortsSublayers:", v197 & 1);

  sub_1001B5650((uint64_t)self);
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;

  if (!self->_suppressingScrollViewDidScroll)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tiltedTabViewDidScroll:", self);

    -[MFTiltedTabView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  -[MFTiltedTabView layoutItemsAnimated:](self, "layoutItemsAnimated:", 0);
}

- (MFTiltedTabViewDelegate)delegate
{
  return (MFTiltedTabViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)reorderingEnabled
{
  return self->_reorderingEnabled;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (unint64_t)rotationStyle
{
  return self->_rotationStyle;
}

- (void)setRotationStyle:(unint64_t)a3
{
  self->_rotationStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parallaxMotionEffectGroup, 0);
  objc_storeStrong((id *)&self->_closeButtonImage, 0);
  objc_storeStrong((id *)&self->_itemsCurrentlyClosing, 0);
  objc_storeStrong((id *)&self->_itemsInvolvedInAnimation, 0);
  objc_storeStrong((id *)&self->_reorderScrollDisplayLink, 0);
  objc_storeStrong((id *)&self->_interactivelyReorderingItem, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_pressRecognizer, 0);
  objc_storeStrong((id *)&self->_pressedItem, 0);
  objc_storeStrong((id *)&self->_onlyHorizontalVelocityItem, 0);
  objc_storeStrong((id *)&self->_interactivelyClosingItem, 0);
  objc_storeStrong((id *)&self->_statusBarGradient, 0);
  objc_storeStrong((id *)&self->_allTabItems, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tabSelectionRecognizer, 0);
  objc_storeStrong((id *)&self->_tabReorderRecognizer, 0);
  objc_storeStrong((id *)&self->_tabCloseRecognizer, 0);
}

@end
