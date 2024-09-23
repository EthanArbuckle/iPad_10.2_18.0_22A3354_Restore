@implementation SBHLibraryPodFolderView

- (SBHLibraryPodFolderView)initWithConfiguration:(id)a3
{
  SBHLibraryPodFolderView *v3;
  id v4;
  uint64_t v5;
  BSUIScrollView *podScrollView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryPodFolderView;
  v3 = -[SBFolderView initWithConfiguration:](&v12, sel_initWithConfiguration_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D01950]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    podScrollView = v3->_podScrollView;
    v3->_podScrollView = (BSUIScrollView *)v5;

    -[BSUIScrollView _setLayoutDebuggingIdentifier:](v3->_podScrollView, "_setLayoutDebuggingIdentifier:", CFSTR("podScrollView"));
    -[BSUIScrollView setAlwaysBounceVertical:](v3->_podScrollView, "setAlwaysBounceVertical:", 1);
    -[BSUIScrollView setContentInsetAdjustmentBehavior:](v3->_podScrollView, "setContentInsetAdjustmentBehavior:", 3);
    -[BSUIScrollView setClipsToBounds:](v3->_podScrollView, "setClipsToBounds:", 0);
    -[BSUIScrollView setDelegate:](v3->_podScrollView, "setDelegate:", v3);
    -[BSUIScrollView setDelaysContentTouches:](v3->_podScrollView, "setDelaysContentTouches:", 0);
    -[SBFolderView scalingView](v3, "scalingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_podScrollView);

    -[SBFolderView folder](v3, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addListObserver:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_accessibilityReduceTransparencyDidChange_, *MEMORY[0x1E0DC45B8], 0);

    -[SBHLibraryPodFolderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("dewey-pod-expanded"));
  }
  return v3;
}

- (void)_configureScrollingInteraction:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setConsidersFolderIconTargets:", -[SBHLibraryPodFolderView isLibraryPodCategoryFolderView](self, "isLibraryPodCategoryFolderView") ^ 1);

}

+ (id)defaultIconLocation
{
  return CFSTR("SBIconLocationAppLibrary");
}

+ (Class)defaultIconListViewClass
{
  return (Class)objc_opt_class();
}

- (int64_t)iconVisibilityHandling
{
  return 2;
}

- (BOOL)isLibraryPodCategoryFolderView
{
  return 0;
}

- (void)setFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SBFolderView folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeListObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView setFolder:](&v9, sel_setFolder_, v4);

  -[SBFolderView folder](self, "folder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addListObserver:", self);

}

- (void)setLegibilitySettings:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView setLegibilitySettings:](&v3, sel_setLegibilitySettings_, a3);
}

- (UINavigationBar)navigationBar
{
  SBHFeatherBlurNavigationBar *navBar;
  SBHFeatherBlurNavigationBar *v4;
  SBHFeatherBlurNavigationBar *v5;
  SBHFeatherBlurNavigationBar *v6;
  void *v7;

  navBar = self->_navBar;
  if (!navBar)
  {
    v4 = [SBHFeatherBlurNavigationBar alloc];
    v5 = -[SBHFeatherBlurNavigationBar initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_navBar;
    self->_navBar = v5;

    -[SBHFeatherBlurNavigationBar setDelegate:](self->_navBar, "setDelegate:", self);
    -[SBHFeatherBlurNavigationBar setHidesFeatherBlur:](self->_navBar, "setHidesFeatherBlur:", self->_hidesFeatherBlur);
    -[SBFolderView scalingView](self, "scalingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_navBar);

    navBar = self->_navBar;
  }
  return (UINavigationBar *)navBar;
}

- (void)setCentersContentIfPossible:(BOOL)a3
{
  if (self->_centersContentIfPossible != a3)
  {
    self->_centersContentIfPossible = a3;
    -[SBHLibraryPodFolderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHidesFeatherBlur:(BOOL)a3
{
  if (self->_hidesFeatherBlur != a3)
  {
    self->_hidesFeatherBlur = a3;
    -[SBHFeatherBlurNavigationBar setHidesFeatherBlur:](self->_navBar, "setHidesFeatherBlur:");
  }
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[SBHFeatherBlurNavigationBar setNeedsLayout](self->_navBar, "setNeedsLayout");
}

- (void)_layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBHLibraryPodFolderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BSUIScrollView frame](self->_podScrollView, "frame");
  if ((BSRectEqualToRect() & 1) == 0)
    -[BSUIScrollView setFrame:](self->_podScrollView, "setFrame:", v4, v6, v8, v10);
  -[SBHLibraryPodFolderView _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  -[SBHLibraryPodFolderView _zeroFirstListViewOriginIfNeeded](self, "_zeroFirstListViewOriginIfNeeded");
  if (self->_navBar)
    -[SBHLibraryPodFolderView _layoutNavBarAndContentInsets](self, "_layoutNavBarAndContentInsets");
}

- (void)_layoutNavBarAndContentInsets
{
  int v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  double v19;
  double v20;
  _BOOL4 centersContentIfPossible;
  CGFloat x;
  double maximumNavBarHeight;
  double MaxY;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BSUIScrollView *podScrollView;
  double v34;
  void *v35;
  NSArray *podScrollViewGradientMaskLayers;
  NSArray *v37;
  NSArray *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  CGFloat rect;
  CGFloat width;
  CGFloat y;
  double MinY;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v73 = *MEMORY[0x1E0C80C00];
  -[BSUIScrollView contentOffset](self->_podScrollView, "contentOffset");
  -[BSUIScrollView adjustedContentInset](self->_podScrollView, "adjustedContentInset");
  v3 = BSFloatLessThanOrEqualToFloat();
  -[SBHFeatherBlurNavigationBar sb_minimumNavbarHeight](self->_navBar, "sb_minimumNavbarHeight");
  self->_minimumNavBarHeight = v4;
  -[SBHFeatherBlurNavigationBar sb_maximumNavbarHeight](self->_navBar, "sb_maximumNavbarHeight");
  self->_maximumNavBarHeight = v5;
  -[SBHLibraryPodFolderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[SBHLibraryPodFolderView _scrollViewContentSize](self, "_scrollViewContentSize");
  v16 = v15;
  v74.origin.x = v8;
  v74.origin.y = v10;
  v74.size.width = v12;
  v74.size.height = v14;
  CGRectGetWidth(v74);
  v17 = v16 + self->_minimumNavBarHeight;
  v75.origin.x = v8;
  v75.origin.y = v10;
  v75.size.width = v12;
  v75.size.height = v14;
  MinY = CGRectGetMinY(v75);
  v18 = MEMORY[0x1E0DC49E8];
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v76.origin.x = v8;
  v76.origin.y = v10;
  v76.size.width = v12;
  v76.size.height = v14;
  if (CGRectGetHeight(v76) <= v17)
  {
    self->_usingCenteredLayout = 0;
  }
  else
  {
    centersContentIfPossible = self->_centersContentIfPossible;
    self->_usingCenteredLayout = centersContentIfPossible;
    if (centersContentIfPossible)
    {
      UIRectCenteredRect();
      x = v77.origin.x;
      width = v77.size.width;
      y = v77.origin.y;
      rect = v77.size.height;
      maximumNavBarHeight = CGRectGetMinY(v77) - MinY + self->_minimumNavBarHeight;
      v78.origin.x = v8;
      v78.origin.y = v10;
      v78.size.width = v12;
      v78.size.height = v14;
      MaxY = CGRectGetMaxY(v78);
      v79.origin.x = x;
      v79.size.width = width;
      v79.origin.y = y;
      v79.size.height = rect;
      v25 = MaxY - CGRectGetMaxY(v79);
      goto LABEL_6;
    }
  }
  v25 = *(double *)(v18 + 16);
  maximumNavBarHeight = self->_maximumNavBarHeight;
LABEL_6:
  -[BSUIScrollView contentInset](self->_podScrollView, "contentInset", *(_QWORD *)&rect, *(_QWORD *)&width, *(_QWORD *)&y);
  if (v29 != v19 || v26 != maximumNavBarHeight || v28 != v20 || v27 != v25)
  {
    -[BSUIScrollView setContentInset:](self->_podScrollView, "setContentInset:", maximumNavBarHeight, v19, v25, v20);
    -[BSUIScrollView setScrollIndicatorInsets:](self->_podScrollView, "setScrollIndicatorInsets:", maximumNavBarHeight, v19, v25, v20);
  }
  -[SBHLibraryPodFolderView _positionNavBarAbuttingListView](self, "_positionNavBarAbuttingListView");
  if (v3 && !-[BSUIScrollView isScrolling](self->_podScrollView, "isScrolling"))
  {
    podScrollView = self->_podScrollView;
    -[BSUIScrollView adjustedContentInset](podScrollView, "adjustedContentInset");
    -[BSUIScrollView setContentOffset:](podScrollView, "setContentOffset:", 0.0, -v34);
  }
  -[SBHLibraryPodFolderView superview](self, "superview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    podScrollViewGradientMaskLayers = self->_podScrollViewGradientMaskLayers;

    if (!podScrollViewGradientMaskLayers)
    {
      objc_msgSend(MEMORY[0x1E0DA9E00], "configureGradientMaskForFeatherBlurRecipe:onContentView:", 2, self->_podScrollView);
      v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v38 = self->_podScrollViewGradientMaskLayers;
      self->_podScrollViewGradientMaskLayers = v37;

    }
  }
  if (self->_podScrollViewGradientMaskLayers)
  {
    objc_msgSend(MEMORY[0x1E0DA9E00], "gradientMaskLayerInsetsForFeatherBlurRecipe:", 2);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    -[SBHFeatherBlurNavigationBar gradientMaskFrame](self->_navBar, "gradientMaskFrame");
    v48 = v47;
    v50 = v49;
    v52 = v51;
    -[SBHLibraryPodFolderView window](self, "window");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v54 = self->_podScrollViewGradientMaskLayers;
    v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v55)
    {
      v56 = v55;
      v57 = v52 - (v40 + v44);
      v58 = v50 - (v42 + v46);
      v59 = v42 + v48;
      v60 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v69 != v60)
            objc_enumerationMutation(v54);
          v62 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v62, "setFrame:", v59, 0.0, v58, v57);
          objc_msgSend(MEMORY[0x1E0DA9E00], "matchMoveAnimationForFrame:relativeToView:", v53, v59, 0.0, v58, v57);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "addAnimation:forKey:", v63, CFSTR("SBLibraryPodFolderViewMatchMoveAnimation"));

        }
        v56 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      }
      while (v56);
    }

  }
}

- (void)_positionNavBarAbuttingListView
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
  double v12;
  double v13;
  double MinY;
  double minimumNavBarHeight;
  double v16;
  double v17;
  double v18;
  double v19;
  double Height;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;

  -[SBHLibraryPodFolderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[BSUIScrollView contentOffset](self->_podScrollView, "contentOffset");
  v13 = -v12;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  MinY = CGRectGetMinY(v24);
  minimumNavBarHeight = self->_minimumNavBarHeight;
  v16 = v13 - MinY;
  -[SBHLibraryPodFolderView bounds](self, "bounds");
  v18 = v17;
  v23 = v19;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  Height = CGRectGetHeight(v25);
  if (minimumNavBarHeight >= v16)
    v21 = minimumNavBarHeight;
  else
    v21 = v16;
  if (Height <= v21)
    v22 = Height;
  else
    v22 = v21;
  -[SBHFeatherBlurNavigationBar sbf_setBoundsAndPositionFromFrame:](self->_navBar, "sbf_setBoundsAndPositionFromFrame:", v18, MinY, v23, v22);
}

- (CGPoint)_restingContentOffsetForScrollOffset:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y;
  CGFloat x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MinY;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t i;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGPoint result;
  CGRect v36;

  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x1E0C80C00];
  if (self->_usingCenteredLayout)
  {
    -[SBHLibraryPodFolderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide", a3.x, a3.y, a4.x, a4.y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v36.origin.x = v9;
    v36.origin.y = v11;
    v36.size.width = v13;
    v36.size.height = v15;
    MinY = CGRectGetMinY(v36);
    v17 = -y - MinY;
    if (v17 >= self->_minimumNavBarHeight && v17 < self->_maximumNavBarHeight)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[SBHFeatherBlurNavigationBar _restingHeights](self->_navBar, "_restingHeights", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        v22 = 1.79769313e308;
        v23 = NAN;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "doubleValue");
            v26 = vabdd_f64(v25, v17);
            if (v26 < v22)
            {
              v23 = v25;
              v22 = v26;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v20);
      }
      else
      {
        v23 = NAN;
      }

      y = -(MinY + v23);
    }
  }
  v27 = x;
  v28 = y;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)_zeroFirstListViewOriginIfNeeded
{
  void *v3;

  if (-[SBFolderView iconListViewCount](self, "iconListViewCount"))
  {
    -[SBFolderView firstIconListView](self, "firstIconListView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    objc_msgSend(v3, "setFrame:");

  }
  -[SBHLibraryPodFolderView _updateVisibleRowRange](self, "_updateVisibleRowRange");
}

- (void)_updateScrollViewContentSize
{
  BSUIScrollView *podScrollView;

  podScrollView = self->_podScrollView;
  -[SBHLibraryPodFolderView _scrollViewContentSize](self, "_scrollViewContentSize");
  -[BSUIScrollView setContentSize:](podScrollView, "setContentSize:");
}

- (double)_pageWidth
{
  CGRect v3;

  -[BSUIScrollView frame](self->_podScrollView, "frame");
  return CGRectGetWidth(v3);
}

- (void)_updateIconListContainment:(id)a3 atIndex:(unint64_t)a4
{
  BSUIScrollView *v5;
  BSUIScrollView *podScrollView;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "superview");
  v5 = (BSUIScrollView *)objc_claimAutoreleasedReturnValue();
  podScrollView = self->_podScrollView;

  if (v5 != podScrollView)
    -[BSUIScrollView addSubview:](self->_podScrollView, "addSubview:", v7);

}

- (CGRect)_iconListFrameForPageRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MinX;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect result;

  v15.receiver = self;
  v15.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView _iconListFrameForPageRect:atIndex:](&v15, sel__iconListFrameForPageRect_atIndex_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BSUIScrollView bounds](self->_podScrollView, "bounds");
  UIRectCenteredXInRect();
  MinX = CGRectGetMinX(v16);
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = MinX;
  return result;
}

- (void)_configureIconListView:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodFolderView;
  v4 = a3;
  -[SBFolderView _configureIconListView:](&v5, sel__configureIconListView_, v4);
  objc_msgSend(v4, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setBoundsSizeTracksContentSize:", 1);
  objc_msgSend(v4, "addLayoutObserver:", self);
  -[SBHLibraryPodFolderView _iconSpacingForIconListView](self, "_iconSpacingForIconListView");
  objc_msgSend(v4, "setIconSpacing:");

}

- (CGSize)_iconSpacingForIconListView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appLibraryVisualConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(-[SBFolderView orientation](self, "orientation") - 3) > 1)
    objc_msgSend(v5, "portraitCategoryPodIconSpacing");
  else
    objc_msgSend(v5, "landscapeCategoryPodIconSpacing");
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)_frameForIconListAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView _frameForIconListAtIndex:](&v7, sel__frameForIconListAtIndex_, a3);
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGSize)_iconListViewSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (-[SBFolderView iconListViewCount](self, "iconListViewCount"))
  {
    -[SBFolderView firstIconListView](self, "firstIconListView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_orientationDidChange:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  _QWORD v8[6];

  -[SBHLibraryPodFolderView _iconSpacingForIconListView](self, "_iconSpacingForIconListView");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SBHLibraryPodFolderView__orientationDidChange___block_invoke;
  v8[3] = &__block_descriptor_48_e28_v24__0__SBIconListView_8_B16l;
  v8[4] = v5;
  v8[5] = v6;
  -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v8);
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView _orientationDidChange:](&v7, sel__orientationDidChange_, a3);
}

uint64_t __49__SBHLibraryPodFolderView__orientationDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconSpacing:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (BOOL)_animatesRotationForAllVisibleIconListViews
{
  return 1;
}

- (BOOL)_shouldUseScrollableIconViewInteraction
{
  return 1;
}

- (UIEdgeInsets)_scrollingInteractionVisibleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[BSUIScrollView adjustedContentInset](self->_podScrollView, "adjustedContentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_enumerateScrollableIconViewsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[SBFolderView currentIconListView](self, "currentIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icons");
  v37 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    v26 = v6;
    v27 = v5;
    v24 = *(_QWORD *)v34;
    while (2)
    {
      v10 = 0;
      v25 = v8;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        objc_msgSend(v5, "displayedIconViewForIcon:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = v12;
          objc_msgSend(v12, "customIconImageViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (((objc_msgSend(v11, "isCategoryIcon") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            && (v15 = v14) != 0)
          {
            v28 = v15;
            objc_msgSend(v15, "iconListView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "icons");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v18 = v17;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v30;
              while (2)
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v30 != v21)
                    objc_enumerationMutation(v18);
                  objc_msgSend(v16, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23)
                  {
                    v4[2](v4, v23, &v37);
                    if (v37)
                    {

                      v6 = v26;
                      v5 = v27;
                      goto LABEL_26;
                    }
                  }

                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
                if (v20)
                  continue;
                break;
              }
            }

            v6 = v26;
            v5 = v27;
            v9 = v24;
            v8 = v25;
          }
          else
          {
            v4[2](v4, v13, &v37);
            if (v37)
            {
LABEL_26:

              goto LABEL_27;
            }
          }

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_27:

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  objc_super v7;

  if (self->_podScrollView == a3)
  {
    v5 = a3;
    -[SBHLibraryPodFolderView _updateVisibleRowRange](self, "_updateVisibleRowRange");
    if (self->_navBar)
      -[SBHLibraryPodFolderView _positionNavBarAbuttingListView](self, "_positionNavBarAbuttingListView");
    -[SBFolderView _scrollingInteractionScrollViewDidScroll:](self, "_scrollingInteractionScrollViewDidScroll:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    objc_msgSend(WeakRetained, "scrollViewDidScroll:", v5);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHLibraryPodFolderView;
    v4 = a3;
    -[SBFolderView scrollViewDidScroll:](&v7, sel_scrollViewDidScroll_, v4);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  BSUIScrollView *v9;
  CGFloat v10;
  CGFloat v11;
  id WeakRetained;
  objc_super v13;

  y = a4.y;
  x = a4.x;
  v9 = (BSUIScrollView *)a3;
  if (self->_podScrollView == v9)
  {
    if (self->_navBar)
    {
      -[SBHLibraryPodFolderView _restingContentOffsetForScrollOffset:withVelocity:](self, "_restingContentOffsetForScrollOffset:withVelocity:", a5->x, a5->y, x, y);
      a5->x = v10;
      a5->y = v11;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBHLibraryPodFolderView;
    -[SBFolderView scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v13, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  BSUIScrollView *v4;
  id WeakRetained;
  objc_super v6;

  v4 = (BSUIScrollView *)a3;
  if (self->_podScrollView == v4)
  {
    -[SBFolderView _updateScrollingInteractionIsScrolling:](self, "_updateScrollingInteractionIsScrolling:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    objc_msgSend(WeakRetained, "scrollViewWillBeginDragging:", v4);

  }
  -[SBHFeatherBlurNavigationBar setAllowsAnimatedUpdating:](self->_navBar, "setAllowsAnimatedUpdating:", 1);
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView scrollViewWillBeginDragging:](&v6, sel_scrollViewWillBeginDragging_, v4);

}

- (void)scrollViewWillBeginScrolling:(id)a3
{
  BSUIScrollViewDelegate **p_librarySearchControllerScrollViewDelegate;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_podScrollView == a3)
  {
    p_librarySearchControllerScrollViewDelegate = &self->_librarySearchControllerScrollViewDelegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_librarySearchControllerScrollViewDelegate);
    objc_msgSend(WeakRetained, "scrollViewWillBeginScrolling:", v5);

    objc_msgSend(v5, "contentOffset");
    v8 = v7;
    v10 = v9;

    -[SBHLibraryPodFolderView setScrollingStartOffset:](self, "setScrollingStartOffset:", v8, v10);
    -[SBHLibraryPodFolderView setExtraIdleScrollVisibleRows:](self, "setExtraIdleScrollVisibleRows:", 0);
  }
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  BSUIScrollView *v4;
  id WeakRetained;
  objc_super v6;

  v4 = (BSUIScrollView *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView scrollViewDidEndScrolling:](&v6, sel_scrollViewDidEndScrolling_, v4);
  if (self->_podScrollView == v4)
  {
    -[SBFolderView _updateScrollingInteractionIsScrolling:](self, "_updateScrollingInteractionIsScrolling:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
    objc_msgSend(WeakRetained, "scrollViewDidEndScrolling:", v4);

    -[SBHLibraryPodFolderView setExtraIdleScrollVisibleRows:](self, "setExtraIdleScrollVisibleRows:", 0);
  }
  -[SBHFeatherBlurNavigationBar setAllowsAnimatedUpdating:](self->_navBar, "setAllowsAnimatedUpdating:", 0);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView didMoveToWindow](&v3, sel_didMoveToWindow);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  -[SBHLibraryPodFolderView _updateVisibleRowRange](self, "_updateVisibleRowRange");
}

- (void)_updateVisibleRowRange
{
  double v3;
  long double v4;
  CGFloat Height;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  CGRect v18;

  -[SBFolderView firstIconListView](self, "firstIconListView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[BSUIScrollView contentOffset](self->_podScrollView, "contentOffset");
  v4 = v3;
  -[BSUIScrollView bounds](self->_podScrollView, "bounds");
  Height = CGRectGetHeight(v18);
  v6 = nexttoward(v4 + Height, v4);
  -[SBHLibraryPodFolderView scrollingStartOffset](self, "scrollingStartOffset");
  v8 = v7;
  v9 = objc_msgSend(v17, "rowAtPoint:", 0.0, (double)v4);
  v10 = objc_msgSend(v17, "rowAtPoint:", 0.0, v6);
  v11 = -[SBHLibraryPodFolderView extraIdleScrollVisibleRows](self, "extraIdleScrollVisibleRows");
  v12 = v10 - v9 + v11;
  v13 = v9 - v11;
  if (v9 < v11)
    v13 = 0;
  if (v4 >= v8)
    v14 = v9;
  else
    v14 = v13;
  v15 = objc_msgSend(v17, "iconRowsForCurrentOrientation");
  if (v14 + v12 + 1 < v15)
    v16 = v12 + 1;
  else
    v16 = v15 - v14;
  objc_msgSend(v17, "setVisibleRowRange:", v14, v16);
  objc_msgSend(v17, "layoutIconsIfNeeded");

}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  void *v4;
  int v5;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCategoryIcon");

  if (v5)
    objc_msgSend(v6, "setAllowsEditingAnimation:", 0);

}

- (NSDirectionalEdgeInsets)_layoutMarginsforNavigationBar:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSDirectionalEdgeInsets result;

  v4 = a3;
  v5 = SBHScreenTypeForCurrentDevice();
  if (SBHScreenTypeIsPhone(v5)
    || !-[SBHLibraryPodFolderView isLibraryPodCategoryFolderView](self, "isLibraryPodCategoryFolderView"))
  {
    -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(v8, 1);
    v10 = v12 + 4.0;
  }
  else
  {
    -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderView iconLocation](self, "iconLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutForIconLocation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "layoutInsetsForOrientation:", -[SBFolderView orientation](self, "orientation"));
    v10 = v9;
  }

  if (objc_msgSend(v4, "insetsLayoutMarginsFromSafeArea"))
  {
    v13 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
    -[SBHLibraryPodFolderView safeAreaInsets](self, "safeAreaInsets");
    if (v13 == 1)
      v16 = v14;
    else
      v16 = v15;
    if (v13 == 1)
      v14 = v15;
    v17 = v10 + v14;
    v10 = v10 + v16;
  }
  else
  {
    v17 = v10;
  }

  v18 = 0.0;
  v19 = 0.0;
  v20 = v17;
  v21 = v10;
  result.trailing = v21;
  result.bottom = v19;
  result.leading = v20;
  result.top = v18;
  return result;
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)_updateCycleIdleUntil:(unint64_t)a3
{
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView _updateCycleIdleUntil:](&v5, sel__updateCycleIdleUntil_, a3);
  v4 = -[SBHLibraryPodFolderView extraIdleScrollVisibleRows](self, "extraIdleScrollVisibleRows");
  if (v4 <= 9)
  {
    -[SBHLibraryPodFolderView setExtraIdleScrollVisibleRows:](self, "setExtraIdleScrollVisibleRows:", v4 + 1);
    -[SBHLibraryPodFolderView _updateVisibleRowRange](self, "_updateVisibleRowRange");
  }
}

- (void)updateAccessibilityTintColors
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodFolderView;
  -[SBFolderView updateAccessibilityTintColors](&v2, sel_updateAccessibilityTintColors);
}

- (BSUIScrollViewDelegate)librarySearchControllerScrollViewDelegate
{
  return (BSUIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_librarySearchControllerScrollViewDelegate);
}

- (void)setLibrarySearchControllerScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_librarySearchControllerScrollViewDelegate, a3);
}

- (BSUIScrollView)podScrollView
{
  return self->_podScrollView;
}

- (BOOL)centersContentIfPossible
{
  return self->_centersContentIfPossible;
}

- (BOOL)hidesFeatherBlur
{
  return self->_hidesFeatherBlur;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (unint64_t)extraIdleScrollVisibleRows
{
  return self->_extraIdleScrollVisibleRows;
}

- (void)setExtraIdleScrollVisibleRows:(unint64_t)a3
{
  self->_extraIdleScrollVisibleRows = a3;
}

- (CGPoint)scrollingStartOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollingStartOffset.x;
  y = self->_scrollingStartOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScrollingStartOffset:(CGPoint)a3
{
  self->_scrollingStartOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_podScrollView, 0);
  objc_destroyWeak((id *)&self->_librarySearchControllerScrollViewDelegate);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_podScrollViewGradientMaskLayers, 0);
}

@end
