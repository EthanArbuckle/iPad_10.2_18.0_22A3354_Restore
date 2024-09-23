@implementation NCNotificationListView

- (NCNotificationListView)initWithModelType:(Class)a3 purpose:(id)a4
{
  id v7;
  NCNotificationListView *v8;
  NCNotificationListView *v9;
  uint64_t v10;
  NSString *model;
  void *v12;
  NSMutableSet *v13;
  NSMutableSet *insertedViewIndices;
  NSMutableSet *v15;
  NSMutableSet *reloadedViewIndices;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *visibleViews;
  uint64_t v21;
  NSHashTable *viewsPerformingAnimation;
  uint64_t v23;
  NSHashTable *viewsPerformingBottomMarginAdjustmentAnimation;
  uint64_t v25;
  NSHashTable *viewsPerformingRollUnderLayout;
  double v27;
  void *v28;
  objc_super v30;

  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)NCNotificationListView;
  v8 = -[NCNotificationListView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_purpose, a4);
    NSStringFromClass(a3);
    v10 = objc_claimAutoreleasedReturnValue();
    model = v9->_model;
    v9->_model = (NSString *)v10;

    +[NCUNUIKitPrototypeDomain rootSettings](NCUNUIKitPrototypeDomain, "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_animationSettings = (NCListAnimationSettings *)(id)objc_msgSend(v12, "listAnimationSettings");

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    insertedViewIndices = v9->_insertedViewIndices;
    v9->_insertedViewIndices = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    reloadedViewIndices = v9->_reloadedViewIndices;
    v9->_reloadedViewIndices = v15;

    -[NCNotificationListView setRemovedViewIndex:](v9, "setRemovedViewIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[NCNotificationListView setShowsHorizontalScrollIndicator:](v9, "setShowsHorizontalScrollIndicator:", 0);
    -[NCNotificationListView setAlwaysBounceVertical:](v9, "setAlwaysBounceVertical:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListView setBackgroundColor:](v9, "setBackgroundColor:", v17);

    -[NCNotificationListView setClipsToBounds:](v9, "setClipsToBounds:", 0);
    -[NCNotificationListView layer](v9, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsGroupOpacity:", 0);

    -[NCNotificationListView setRevealed:](v9, "setRevealed:", 1);
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    visibleViews = v9->_visibleViews;
    v9->_visibleViews = v19;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    viewsPerformingAnimation = v9->_viewsPerformingAnimation;
    v9->_viewsPerformingAnimation = (NSHashTable *)v21;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v23 = objc_claimAutoreleasedReturnValue();
    viewsPerformingBottomMarginAdjustmentAnimation = v9->_viewsPerformingBottomMarginAdjustmentAnimation;
    v9->_viewsPerformingBottomMarginAdjustmentAnimation = (NSHashTable *)v23;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v25 = objc_claimAutoreleasedReturnValue();
    viewsPerformingRollUnderLayout = v9->_viewsPerformingRollUnderLayout;
    v9->_viewsPerformingRollUnderLayout = (NSHashTable *)v25;

    -[NCNotificationListView _setIgnoresLayerTransformForSafeAreaInsets:](v9, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);
    v9->_performedFirstLayout = 0;
    v9->_hiddenBelowStack = 0;
    v9->_hoverViewHidden = 1;
    v9->_groupingAnimationStyle = 0;
    v9->_horizontalInsetMargin = 0.0;
    v9->_backgroundViewHorizontalOutsetMargin = 0.0;
    -[NCListAnimationSettings viewSpacing](v9->_animationSettings, "viewSpacing");
    v9->_footerViewVerticalMargin = v27;
    v9->_numberOfFeaturedLeadingViews = 0;
    *(_WORD *)&v9->_showStackBelowLeadingView = 1;
    v9->_leadingContentShouldFillList = 0;
    v9->_groupedOverlapHeightMultiple = 1.0;
    v9->_interactionTranslationPercentage = 0.0;
    *(_WORD *)&v9->_supportsBottomViewsRollUnder = 1;
    v9->_groupingViewOverlapCompressionFactor = 1.0;
    v9->_groupingViewOverlapAlphaFactor = 1.0;
    -[NCNotificationListView setScrollEnabled:](v9, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@('%@')"), v9->_model, v9->_purpose);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v28);

    -[NCNotificationListView updateBottomViewsRollUnder](v9, "updateBottomViewsRollUnder");
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[NCNotificationListView isCachedSizeValid](self, "isCachedSizeValid"))
  {
    -[NCNotificationListView cachedSize](self, "cachedSize");
  }
  else
  {
    -[NCNotificationListView _calculateSizeForGrouped:size:idealizedSize:](self, "_calculateSizeForGrouped:size:idealizedSize:", -[NCNotificationListView _isGrouping](self, "_isGrouping"), 0, width, height);
    v9 = v8;
    -[NCNotificationListView setCachedSize:](self, "setCachedSize:", width, v8);
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 1);
    v6 = width;
    v7 = v9;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)calculateSizeForGrouped:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double result;

  v3 = a3;
  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _calculateSizeForGrouped:size:idealizedSize:](self, "_calculateSizeForGrouped:size:idealizedSize:", v3, 1, v5, v6);
  return result;
}

- (double)_calculateSizeForGrouped:(BOOL)a3 size:(CGSize)a4 idealizedSize:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  _BOOL4 v8;
  void *v10;
  unint64_t v11;
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
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v8 = a3;
  -[NCNotificationListView dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "notificationListViewNumberOfItems:", self);
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:", 0.0, 0.0, width, height);
  v13 = v12;
  if (v8)
  {
    if (v11)
    {
      objc_msgSend(v10, "notificationListView:heightForItemAtIndex:withWidth:", self, 0, v12);
      v14 = 1.0;
      if (v11 != 2)
        v14 = 0.0;
      if (v5)
      {
        -[NCNotificationListView groupedOverlapHeightMultiple](self, "groupedOverlapHeightMultiple", v14);
        -[NCListAnimationSettings viewOverlap](self->_animationSettings, "viewOverlap");
      }
      else if (!-[NCNotificationListView isHiddenBelowStack](self, "isHiddenBelowStack", v14)
             && -[NCNotificationListView showStackBelowLeadingView](self, "showStackBelowLeadingView"))
      {
        -[NCNotificationListView groupedOverlapHeightMultiple](self, "groupedOverlapHeightMultiple");
        -[NCNotificationListView _resolvedViewOverlap](self, "_resolvedViewOverlap");
      }
    }
  }
  else
  {
    -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight");
    v15 = 0.0;
    if (v16 > 0.0)
    {
      -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight");
      v18 = v17;
      -[NCListAnimationSettings headerSpacing](self->_animationSettings, "headerSpacing");
      v15 = v18 + v19 + 0.0;
    }
    if (v11)
    {
      if (-[NCNotificationListView _isShowingFeaturedLeadingViews](self, "_isShowingFeaturedLeadingViews"))
      {
        -[NCNotificationListView _heightForFeaturedLeadingViewInRect:](self, "_heightForFeaturedLeadingViewInRect:", 0.0, 0.0, width, height);
        v21 = v15 + v20;
        -[NCListAnimationSettings viewSpacing](self->_animationSettings, "viewSpacing");
        v15 = v21 + v22;
        v23 = -[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews");
      }
      else
      {
        v23 = 0;
      }
      if (v23 < v11)
      {
        do
        {
          objc_msgSend(v10, "notificationListView:heightForItemAtIndex:withWidth:", self, v23, v13);
          if (v24 <= 0.0)
          {
            -[NCListAnimationSettings viewSpacing](self->_animationSettings, "viewSpacing");
            v15 = v15 - v30;
          }
          else
          {
            v25 = v24;
            if (!v23)
            {
              -[NCNotificationListView _topSpacingForItemAtIndex:](self, "_topSpacingForItemAtIndex:", 0);
              v15 = v15 + v26;
            }
            if (!-[NCNotificationListView isRevealed](self, "isRevealed") || (v27 = 0.0, v5))
              -[NCNotificationListView _positionOffsetForRevealHintingForItemAtIndex:](self, "_positionOffsetForRevealHintingForItemAtIndex:", v23, v27);
            v28 = v25 + v15 + v27;
            -[NCNotificationListView _bottomSpacingForItemAtIndex:](self, "_bottomSpacingForItemAtIndex:", v23);
            v15 = v28 + v29;
          }
          ++v23;
        }
        while (v11 != v23);
      }
    }
    -[NCNotificationListView _footerViewHeight](self, "_footerViewHeight");
    if (v31 > 0.0)
      -[NCNotificationListView footerViewVerticalMargin](self, "footerViewVerticalMargin", 0.0);
  }
  -[NCNotificationListView traitCollection](self, "traitCollection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "displayScale");
  UICeilToScale();
  v34 = v33;

  return v34;
}

- (void)didExitAlwaysOn
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;

  -[NCNotificationListView dataSource](self, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "notificationListViewNumberOfItems:", self);
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NCNotificationListView _viewForItemAtIndex:](self, "_viewForItemAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutIfNeeded");

    }
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView layoutSubviews](&v9, sel_layoutSubviews);
  -[NCNotificationListView _configureDebugViewIfNeeded](self, "_configureDebugViewIfNeeded");
  -[NCNotificationListView _removeDebugViewIfNeeded](self, "_removeDebugViewIfNeeded");
  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationListWillLayoutSubviews");
  if (-[NCNotificationListView _isGrouping](self, "_isGrouping"))
    -[NCNotificationListView _layoutForGrouping](self, "_layoutForGrouping");
  else
    -[NCNotificationListView _layoutForList](self, "_layoutForList");
  -[NCNotificationListView alpha](self, "alpha");
  v5 = v4 < 1.0
    && -[NCNotificationListView _isGrouping](self, "_isGrouping")
    && -[NCNotificationListView count](self, "count") > 1;
  -[NCNotificationListView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", v5);

  -[NCNotificationListView _adjustContentSizeWidthIfNecessary](self, "_adjustContentSizeWidthIfNecessary");
  -[NCNotificationListView _layoutBackgroundViewIfNecessary](self, "_layoutBackgroundViewIfNecessary");
  -[NCNotificationListView _layoutHoverViewIfNecessary](self, "_layoutHoverViewIfNecessary");
  -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[NCNotificationListView setRemovedViewIndex:](self, "setRemovedViewIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[NCNotificationListView setPerformingGroupingAnimation:](self, "setPerformingGroupingAnimation:", 0);
  -[NCNotificationListView setSubviewPerformingGroupingAnimation:](self, "setSubviewPerformingGroupingAnimation:", 0);
  -[NCNotificationListView setPerformingRevealAnimation:](self, "setPerformingRevealAnimation:", 0);
  -[NCNotificationListView setPerformingHeaderReloadAnimation:](self, "setPerformingHeaderReloadAnimation:", 0);
  -[NCNotificationListView setPerformingContentRevealAnimation:](self, "setPerformingContentRevealAnimation:", 0);
  -[NCNotificationListView setPerformingVisibleRectAdjustment:](self, "setPerformingVisibleRectAdjustment:", 0);
  -[NCNotificationListView setPerformingStackVisibilityAnimation:](self, "setPerformingStackVisibilityAnimation:", 0);
  -[NCNotificationListView setPerformingInteractiveTranslationAnimation:](self, "setPerformingInteractiveTranslationAnimation:", 0);
  -[NCNotificationListView setPerformingRevealTransitionAnimation:](self, "setPerformingRevealTransitionAnimation:", 0);
  -[NCNotificationListView setPerformingBottomMarginAdjustmentAnimation:](self, "setPerformingBottomMarginAdjustmentAnimation:", 0);
  -[NCNotificationListView setPerformingInteractionVelocityAnimation:](self, "setPerformingInteractionVelocityAnimation:", 0);
  -[NCNotificationListView setPerformingOverrideLeadingViewHeightAdjustment:](self, "setPerformingOverrideLeadingViewHeightAdjustment:", 0);
  -[NCNotificationListView visibleRect](self, "visibleRect");
  -[NCNotificationListView _updateVisibleViewsForUpdatedVisibleRect:](self, "_updateVisibleViewsForUpdatedVisibleRect:");
  -[NCNotificationListView _layoutOverlayViewIfNecessary](self, "_layoutOverlayViewIfNecessary");
  -[NCNotificationListView setPerformedFirstLayout:](self, "setPerformedFirstLayout:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationListDidLayoutSubviews");

}

- (void)subviewDidLayout
{
  id v2;

  -[NCNotificationListView dataSource](self, "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "notificationListDidLayoutSubviews");

}

- (void)_configureDebugViewIfNeeded
{
  NCNotificationListDebugView *debugView;
  NCNotificationListDebugView *v4;
  NCNotificationListDebugView *v5;
  NCNotificationListDebugView *v6;

  debugView = self->_debugView;
  if (debugView)
    goto LABEL_6;
  if (+[NCNotificationListDebugView shouldShow](NCNotificationListDebugView, "shouldShow"))
  {
    v4 = -[NCNotificationListDebugView initWithListView:]([NCNotificationListDebugView alloc], "initWithListView:", self);
    v5 = self->_debugView;
    self->_debugView = v4;

    v6 = self->_debugView;
    if (!v6)
      return;
    -[NCNotificationListDebugView setIndex:](v6, "setIndex:", -[NCNotificationListView index](self, "index"));
    -[NCNotificationListView addSubview:](self, "addSubview:", self->_debugView);
    -[NCNotificationListView _updateDebugViewFrame](self, "_updateDebugViewFrame");
  }
  debugView = self->_debugView;
  if (debugView)
LABEL_6:
    -[NCNotificationListDebugView setDepth:](debugView, "setDepth:", -[NCNotificationListView _depth](self, "_depth"));
}

- (void)_removeDebugViewIfNeeded
{
  NCNotificationListDebugView *debugView;

  if (self->_debugView)
  {
    if (!+[NCNotificationListDebugView shouldShow](NCNotificationListDebugView, "shouldShow"))
    {
      -[NCNotificationListDebugView removeFromSuperview](self->_debugView, "removeFromSuperview");
      debugView = self->_debugView;
      self->_debugView = 0;

    }
  }
}

- (void)_updateDebugViewFrame
{
  NCNotificationListDebugView *debugView;

  debugView = self->_debugView;
  if (debugView)
  {
    -[NCNotificationListView bounds](self, "bounds");
    -[NCNotificationListDebugView setFrame:](debugView, "setFrame:");
  }
}

- (void)addSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView addSubview:](&v4, sel_addSubview_, a3);
  if (self->_debugView)
    -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (void)bringSubviewToFront:(id)a3
{
  NCNotificationListDebugView *v4;
  NCNotificationListDebugView *debugView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListView;
  v4 = (NCNotificationListDebugView *)a3;
  -[NCNotificationListView bringSubviewToFront:](&v6, sel_bringSubviewToFront_, v4);
  debugView = self->_debugView;

  if (debugView != v4)
    -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:", debugView, v6.receiver, v6.super_class);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView setFrame:](&v10, sel_setFrame_);
  if (!-[NCNotificationListView hasPerformedFirstLayout](self, "hasPerformedFirstLayout"))
    -[NCNotificationListView layoutIfNeeded](self, "layoutIfNeeded");
  -[NCNotificationListView _updateDebugViewFrame](self, "_updateDebugViewFrame");
  -[NCNotificationListView _directSuperListView](self, "_directSuperListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "notificationListView:changingFrameOfView:toFrame:", v8, self, x, y, width, height);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView setBounds:](&v10, sel_setBounds_);
  -[NCNotificationListView _updateDebugViewFrame](self, "_updateDebugViewFrame");
  -[NCNotificationListView _directSuperListView](self, "_directSuperListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "notificationListView:changingBoundsOfView:toBounds:", v8, self, x, y, width, height);

}

- (void)setAdditionalYOffset:(double)a3
{
  self->_additionalYOffset = a3;
  -[NCNotificationListView setAnimatingAdditionalYOffset:](self, "setAnimatingAdditionalYOffset:", fabs(a3) > 0.001);
  -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView setCenter:](&v8, sel_setCenter_);
  -[NCNotificationListView _updateDebugViewFrame](self, "_updateDebugViewFrame");
  -[NCNotificationListView _directSuperListView](self, "_directSuperListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "notificationListView:changingCenterOfView:toCenter:", v6, self, x, y);

}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  _OWORD v5[3];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListView;
  v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  -[NCNotificationListView setTransform:](&v6, sel_setTransform_, v5);
  -[NCNotificationListView _giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation](self, "_giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation");
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[NCNotificationListView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView _configureDebugViewIfNeeded](self, "_configureDebugViewIfNeeded");
  }
}

- (void)setSupportsBottomViewsRollUnder:(BOOL)a3
{
  self->_supportsBottomViewsRollUnder = a3;
}

- (void)setGroupingViewOverlapCompressionFactor:(double)a3
{
  if (self->_groupingViewOverlapCompressionFactor != a3)
  {
    self->_groupingViewOverlapCompressionFactor = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateBottomViewsRollUnder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = -[NCNotificationListView supportsBottomViewsRollUnder](self, "supportsBottomViewsRollUnder");
  self->_shouldBottomViewsRollUnder = v3;
  if (!v3)
    goto LABEL_7;
  if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3) >= 2)
  {
    self->_shouldBottomViewsRollUnder = 1;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_shouldBottomViewsRollUnder = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  if (self->_shouldBottomViewsRollUnder)
  {
LABEL_6:
    -[NCNotificationListView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    self->_shouldBottomViewsRollUnder = !UIContentSizeCategoryIsAccessibilityCategory(v6);

  }
LABEL_7:
  -[NCNotificationListView visibleViews](self, "visibleViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__NCNotificationListView_updateBottomViewsRollUnder__block_invoke;
  v9[3] = &unk_1E8D1CF08;
  v9[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

  if (-[NCNotificationListView hasPerformedFirstLayout](self, "hasPerformedFirstLayout"))
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
}

void __52__NCNotificationListView_updateBottomViewsRollUnder__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_listViewForView:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBottomViewsRollUnder");

}

- (NSNumber)distanceScrolledBeyondBottomOfContent
{
  void *v3;
  double Height;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGRect v11;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v11);

  -[NCNotificationListView contentSize](self, "contentSize");
  v6 = Height - v5;
  -[NCNotificationListView _footerViewHeight](self, "_footerViewHeight");
  v8 = v6 - v7;
  if (v8 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    *(float *)&v8 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v9;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationListView debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__NCNotificationListView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E8D1B3A0;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

uint64_t __64__NCNotificationListView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendBaseDescriptionToBuilder:", *(_QWORD *)(a1 + 40));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationListView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationListView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  NCNotificationListView *v20;
  _QWORD v21[5];
  id v22;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDebugDescription:", 1);
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke;
  v21[3] = &unk_1E8D1B3A0;
  v21[4] = self;
  v8 = v6;
  v22 = v8;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v21);
  v15 = v7;
  v16 = 3221225472;
  v17 = __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_2;
  v18 = &unk_1E8D1B3A0;
  v19 = v8;
  v20 = self;
  v9 = v8;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Data"), v5, &v15);
  -[NCNotificationListView subviews](self, "subviews", v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bs_compactMap:", &__block_literal_global_8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v12, CFSTR("Subview"), v5, 1);
  objc_msgSend(v9, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendBaseDescriptionToBuilder:", *(_QWORD *)(a1 + 40));
}

id __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "_depth"), CFSTR("ViewDepth"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "count"), CFSTR("ItemCount"));
}

id __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "frame");
  v7 = v6;
  objc_msgSend(v5, "frame");
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "frame");
    v11 = v10;
    objc_msgSend(v5, "frame");
    if (v11 >= v12)
      v9 = 1;
    else
      v9 = -1;
  }

  return v9;
}

- (int64_t)_depth
{
  uint64_t v2;
  void *v3;
  int64_t v4;
  uint64_t v5;

  -[NCNotificationListView superview](self, "superview");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  v4 = 0;
  do
  {
    objc_opt_class();
    v4 += objc_opt_isKindOfClass() & 1;
    objc_msgSend(v3, "superview");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  while (v5);
  return v4;
}

- (void)setIndex:(unint64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    -[NCNotificationListDebugView setIndex:](self->_debugView, "setIndex:");
  }
}

- (void)_appendBaseDescriptionToBuilder:(id)a3
{
  NSString *purpose;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  CGAffineTransform v13;

  purpose = self->_purpose;
  v5 = a3;
  objc_msgSend(v5, "appendString:withName:", purpose, CFSTR("Purpose"));
  objc_msgSend(v5, "appendString:withName:", self->_model, CFSTR("Model"));
  -[NCNotificationListView _visibleRect](self, "_visibleRect");
  v6 = (id)objc_msgSend(v5, "appendRect:withName:", CFSTR("VisibleRect"));
  -[NCNotificationListView frame](self, "frame");
  v7 = (id)objc_msgSend(v5, "appendRect:withName:", CFSTR("Frame"));
  -[NCNotificationListView contentSize](self, "contentSize");
  v8 = (id)objc_msgSend(v5, "appendSize:withName:", CFSTR("ContentSize"));
  -[NCNotificationListView contentOffset](self, "contentOffset");
  v9 = (id)objc_msgSend(v5, "appendPoint:withName:", CFSTR("ContentOffset"));
  v10 = (id)objc_msgSend(v5, "appendBool:withName:", -[NCNotificationListView isHidden](self, "isHidden"), CFSTR("IsHidden"));
  -[NCNotificationListView alpha](self, "alpha");
  v11 = (id)objc_msgSend(v5, "appendFloat:withName:", CFSTR("Alpha"));
  -[NCNotificationListView transform](self, "transform");
  NSStringFromCGAffineTransform(&v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v12, CFSTR("Transform"));

}

- (double)_resolvedViewOverlap
{
  double v3;
  double v4;
  double v5;

  -[NCListAnimationSettings viewOverlap](self->_animationSettings, "viewOverlap");
  v4 = v3;
  -[NCNotificationListView groupingViewOverlapCompressionFactor](self, "groupingViewOverlapCompressionFactor");
  return v4 * v5;
}

- (BOOL)_isViewWithinVisibleRectForHeight:(double)a3 layoutOffset:(double)a4
{
  double MinY;
  double Height;
  double v9;
  double v11;
  CGRect v12;
  CGRect v13;

  -[NCNotificationListView visibleRect](self, "visibleRect");
  MinY = CGRectGetMinY(v12);
  -[NCNotificationListView visibleRect](self, "visibleRect");
  Height = CGRectGetHeight(v13);
  -[NCListAnimationSettings viewVisibilityMargin](self->_animationSettings, "viewVisibilityMargin");
  if (a3 + a4 < MinY - v9)
    return 0;
  -[NCListAnimationSettings viewVisibilityMargin](self->_animationSettings, "viewVisibilityMargin");
  return MinY + Height + v11 > a4;
}

- (void)_adjustContentSizeWidthIfNecessary
{
  double Width;
  double v4;
  CGRect v5;

  -[NCNotificationListView frame](self, "frame");
  Width = CGRectGetWidth(v5);
  -[NCNotificationListView contentSize](self, "contentSize");
  if (vabdd_f64(v4, Width) >= 2.22044605e-16)
    -[NCNotificationListView setContentSize:](self, "setContentSize:", Width);
}

- (void)_adjustContentSizeHeightIfNecessaryForUpdatedHeight:(double)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _QWORD v16[6];

  v5 = -[NCNotificationListView isReactiveLayout](self, "isReactiveLayout");
  -[NCNotificationListView contentSize](self, "contentSize");
  if (v5)
    -[NCNotificationListView visibleRectBottomMarginForRollUnder](self, "visibleRectBottomMarginForRollUnder");
  if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    if (-[NCNotificationListView isScrollEnabled](self, "isScrollEnabled"))
    {
      if ((-[NCNotificationListView isTracking](self, "isTracking") & 1) == 0
        && (-[NCNotificationListView isDecelerating](self, "isDecelerating") & 1) == 0)
      {
        -[NCNotificationListView bounds](self, "bounds");
        v7 = a3 - v6;
        -[NCNotificationListView contentInset](self, "contentInset");
        v9 = v8 + v7;
        -[NCNotificationListView contentOffset](self, "contentOffset");
        if (v10 >= v9)
        {
          -[NCNotificationListView contentInset](self, "contentInset");
          v12 = -v11;
          if (v9 <= v12)
            v13 = v12;
          else
            v13 = v9;
          -[NCNotificationListView _setContentOffsetWithDecelerationAnimation:](self, "_setContentOffsetWithDecelerationAnimation:", 0.0, v13);
        }
      }
    }
    if (-[NCNotificationListView isReactiveLayout](self, "isReactiveLayout"))
    {
      -[NCNotificationListView visibleRectBottomMarginForRollUnder](self, "visibleRectBottomMarginForRollUnder");
      a3 = v14 + a3;
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__NCNotificationListView__adjustContentSizeHeightIfNecessaryForUpdatedHeight___block_invoke;
    v16[3] = &unk_1E8D1BCF8;
    v16[4] = self;
    *(double *)&v16[5] = a3;
    -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v16, 0);
    -[NCNotificationListView superview](self, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

  }
}

uint64_t __78__NCNotificationListView__adjustContentSizeHeightIfNecessaryForUpdatedHeight___block_invoke(uint64_t a1)
{
  void *v2;
  CGRect v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "frame");
  return objc_msgSend(v2, "setContentSize:", CGRectGetWidth(v4), *(double *)(a1 + 40));
}

- (void)setContentSize:(CGSize)a3
{
  double v3;
  objc_super v4;

  v3 = fmax(a3.height, self->_minimumContentHeight);
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView setContentSize:](&v4, sel_setContentSize_, a3.width, v3);
}

- (void)_layoutBackgroundViewIfNecessary
{
  UIView *v3;
  UIView *backgroundView;
  UIView *v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void (**v28)(_QWORD);
  _QWORD v29[5];
  _QWORD aBlock[10];
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  if (self->_backgroundView)
    goto LABEL_6;
  if (!-[NCNotificationListView isGrouped](self, "isGrouped"))
  {
    -[NCNotificationListView _backgroundViewFromDataSource](self, "_backgroundViewFromDataSource");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    v5 = self->_backgroundView;
    if (!v5)
      return;
    -[NCNotificationListView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[NCNotificationListView addSubview:](self, "addSubview:", self->_backgroundView);
  }
  if (self->_backgroundView)
  {
LABEL_6:
    -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:");
    -[NCNotificationListView bounds](self, "bounds");
    x = v6;
    y = v8;
    width = v10;
    height = v12;
    -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
    if (v14 > 0.0)
    {
      -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
      height = v15;
    }
    -[NCNotificationListView backgroundViewHorizontalOutsetMargin](self, "backgroundViewHorizontalOutsetMargin");
    v17 = v16;
    if (!-[NCNotificationListView isGrouped](self, "isGrouped"))
    {
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      v32 = CGRectInset(v31, -v17, 0.0);
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
    }
    if (-[NCNotificationListView isRevealed](self, "isRevealed"))
      v18 = 1.0;
    else
      v18 = 0.0;
    -[UIView frame](self->_backgroundView, "frame");
    v34.origin.x = v19;
    v34.origin.y = v20;
    v34.size.width = v21;
    v34.size.height = v22;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    if (!CGRectEqualToRect(v33, v34)
      || (-[NCNotificationListView backgroundView](self, "backgroundView"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "alpha"),
          v25 = v24,
          v23,
          v18 != v25))
    {
      v26 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke;
      aBlock[3] = &unk_1E8D1CFB0;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v18;
      *(CGFloat *)&aBlock[6] = x;
      *(CGFloat *)&aBlock[7] = y;
      *(CGFloat *)&aBlock[8] = width;
      *(CGFloat *)&aBlock[9] = height;
      v27 = _Block_copy(aBlock);
      v29[0] = v26;
      v29[1] = 3221225472;
      v29[2] = __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke_2;
      v29[3] = &unk_1E8D1B568;
      v29[4] = self;
      v28 = (void (**)(_QWORD))_Block_copy(v29);
      if (-[NCNotificationListView isPerformingOverrideLeadingViewHeightAdjustment](self, "isPerformingOverrideLeadingViewHeightAdjustment")|| -[NCNotificationListView isReactiveLayout](self, "isReactiveLayout"))
      {
        +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v27);
        v28[2](v28);
      }
      else
      {
        -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v27, v28);
      }

    }
  }
}

void __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

uint64_t __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isGrouped");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2408), "removeFromSuperview");
    return objc_msgSend(*(id *)(a1 + 32), "setBackgroundView:", 0);
  }
  return result;
}

- (void)_layoutOverlayViewIfNecessary
{
  UIView *v3;
  UIView *overlayView;
  UIView *v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  uint64_t v24;
  void *v25;
  void (**v26)(_QWORD);
  _QWORD v27[5];
  _QWORD aBlock[10];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (self->_overlayView)
    goto LABEL_6;
  if (!-[NCNotificationListView isGrouped](self, "isGrouped"))
  {
    -[NCNotificationListView _overlayViewFromDataSource](self, "_overlayViewFromDataSource");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    overlayView = self->_overlayView;
    self->_overlayView = v3;

    v5 = self->_overlayView;
    if (!v5)
      return;
    -[NCNotificationListView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[NCNotificationListView addSubview:](self, "addSubview:", self->_overlayView);
  }
  if (self->_overlayView)
  {
LABEL_6:
    -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:");
    -[NCNotificationListView bounds](self, "bounds");
    x = v6;
    y = v8;
    width = v10;
    height = v12;
    -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
    if (v14 > 0.0)
    {
      -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
      height = v15;
    }
    -[NCNotificationListView frame](self, "frame");
    v17 = v16;
    if (!-[NCNotificationListView isGrouped](self, "isGrouped"))
    {
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v30 = CGRectInset(v29, -v17, 0.0);
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
    }
    if (-[NCNotificationListView isRevealed](self, "isRevealed"))
      v18 = 1.0;
    else
      v18 = 0.0;
    -[UIView frame](self->_overlayView, "frame");
    v32.origin.x = v19;
    v32.origin.y = v20;
    v32.size.width = v21;
    v32.size.height = v22;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    if (!CGRectEqualToRect(v31, v32) || (-[UIView alpha](self->_overlayView, "alpha"), v18 != v23))
    {
      v24 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke;
      aBlock[3] = &unk_1E8D1CFB0;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v18;
      *(CGFloat *)&aBlock[6] = x;
      *(CGFloat *)&aBlock[7] = y;
      *(CGFloat *)&aBlock[8] = width;
      *(CGFloat *)&aBlock[9] = height;
      v25 = _Block_copy(aBlock);
      v27[0] = v24;
      v27[1] = 3221225472;
      v27[2] = __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke_2;
      v27[3] = &unk_1E8D1B568;
      v27[4] = self;
      v26 = (void (**)(_QWORD))_Block_copy(v27);
      if (-[NCNotificationListView isPerformingOverrideLeadingViewHeightAdjustment](self, "isPerformingOverrideLeadingViewHeightAdjustment")|| -[NCNotificationListView isReactiveLayout](self, "isReactiveLayout"))
      {
        +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v25);
        v26[2](v26);
      }
      else
      {
        -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v25, v26);
      }

    }
  }
}

void __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

uint64_t __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isGrouped");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2416), "removeFromSuperview");
    return objc_msgSend(*(id *)(a1 + 32), "setOverlayView:", 0);
  }
  return result;
}

- (void)_layoutHoverViewIfNecessary
{
  UIView *v3;
  UIView *hoverView;
  BOOL v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  uint64_t v9;
  UIView *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double Width;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  double MinY;
  double v42;
  BOOL v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double height;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  void *v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  _QWORD v63[4];
  UIView *v64;
  NCNotificationListView *v65;
  _QWORD v66[4];
  UIView *v67;
  _QWORD v68[5];
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  if (self->_hoverView)
    goto LABEL_6;
  if (!-[NCNotificationListView isGrouped](self, "isGrouped"))
  {
    -[NCNotificationListView _hoverViewFromDataSource](self, "_hoverViewFromDataSource");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    hoverView = self->_hoverView;
    self->_hoverView = v3;

    if (!self->_hoverView)
      return;
    -[NCNotificationListView addSubview:](self, "addSubview:");
  }
  if (self->_hoverView)
  {
LABEL_6:
    v5 = -[NCNotificationListView isGrouped](self, "isGrouped");
    v6 = self->_hoverView;
    if (v5)
    {
      v7 = v6;
      v8 = self->_hoverView;
      self->_hoverView = 0;

      v9 = MEMORY[0x1E0C809B0];
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_2;
      v66[3] = &unk_1E8D1B568;
      v67 = v7;
      v63[0] = v9;
      v63[1] = 3221225472;
      v63[2] = __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_3;
      v63[3] = &unk_1E8D1B3A0;
      v64 = v67;
      v65 = self;
      v10 = v67;
      -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v66, v63);

    }
    else
    {
      -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:", v6);
      -[NCNotificationListView bounds](self, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[NCNotificationListView visibleRect](self, "visibleRect");
      v61 = v20;
      v62 = v19;
      v59 = v22;
      v60 = v21;
      -[UIView frame](self->_hoverView, "frame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      if (-[NCNotificationListView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
        v32 = v31;
        -[NCListAnimationSettings hoverViewTrailingMargin](self->_animationSettings, "hoverViewTrailingMargin");
        v34 = v32 + v33;
      }
      else
      {
        v69.origin.x = v12;
        v69.origin.y = v14;
        v69.size.width = v16;
        v69.size.height = v18;
        Width = CGRectGetWidth(v69);
        -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
        v37 = Width - v36;
        v70.origin.x = v24;
        v70.origin.y = v26;
        v70.size.width = v28;
        v70.size.height = v30;
        v38 = v37 - CGRectGetWidth(v70);
        -[NCListAnimationSettings hoverViewTrailingMargin](self->_animationSettings, "hoverViewTrailingMargin");
        v34 = v38 - v39;
      }
      v40 = -[NCNotificationListView isHoverViewHidden](self, "isHoverViewHidden");
      v71.origin.x = v62;
      v71.origin.y = v61;
      v71.size.width = v60;
      v71.size.height = v59;
      MinY = CGRectGetMinY(v71);
      -[NCListAnimationSettings hoverViewMovingTopMargin](self->_animationSettings, "hoverViewMovingTopMargin");
      v43 = MinY > v42;
      self->_hoverViewHidden = MinY <= v42;
      v44 = 1.0;
      if (!v43)
        v44 = 0.0;
      -[UIView setAlpha:](self->_hoverView, "setAlpha:", v44);
      v72.origin.x = v62;
      v72.origin.y = v61;
      v72.size.width = v60;
      v72.size.height = v59;
      v45 = CGRectGetMinY(v72);
      -[NCListAnimationSettings hoverViewMovingTopMargin](self->_animationSettings, "hoverViewMovingTopMargin");
      v47 = v45 + v46;
      height = self->_cachedSize.height;
      -[NCListAnimationSettings hoverViewBottomMarginMinimum](self->_animationSettings, "hoverViewBottomMarginMinimum");
      v50 = height - v49;
      if (v47 >= v50)
        v51 = v50;
      else
        v51 = v47;
      v52 = v40 && !self->_hoverViewHidden;
      -[UIView frame](self->_hoverView, "frame");
      v74.origin.x = v53;
      v74.origin.y = v54;
      v74.size.width = v55;
      v74.size.height = v56;
      v73.origin.x = v34;
      v73.origin.y = v51;
      v73.size.width = v28;
      v73.size.height = v30;
      if (!CGRectEqualToRect(v73, v74))
      {
        -[NCNotificationListView hoverView](self, "hoverView");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setFrame:", v34, v51, v28, v30);

        if (v52)
        {
          -[NCNotificationListView hoverView](self, "hoverView");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setAlpha:", 0.0);

          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke;
          v68[3] = &unk_1E8D1B568;
          v68[4] = self;
          -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v68, 0);
        }
      }
    }
  }
}

void __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "hoverView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v6;
  double v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hoverView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v2 != v3)
    return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v6 = objc_msgSend(*(id *)(a1 + 40), "isHoverViewHidden");
  v7 = 1.0;
  if (v6)
    v7 = 0.0;
  return objc_msgSend(v4, "setAlpha:", v7);
}

- (double)_initialLayoutOffset
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  CGRect v18;

  if (!-[NCNotificationListView layoutFromBottom](self, "layoutFromBottom"))
    return 0.0;
  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  v5 = v4;
  if (-[NCNotificationListView areSublistsRevealed](self, "areSublistsRevealed")
    && !-[NCNotificationListView isActiveRevealTransitioning](self, "isActiveRevealTransitioning"))
  {
    v6 = -[NCNotificationListView count](self, "count");
  }
  else
  {
    v6 = -[NCNotificationListView indexForReveal](self, "indexForReveal");
  }
  v8 = v6;
  v9 = 0.0;
  if (v6)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v3, "notificationListView:heightForItemAtIndex:withWidth:", self, v10, v5);
      if (v11 > 0.0)
      {
        v12 = v11;
        if (!v10)
        {
          -[NCNotificationListView _topSpacingForItemAtIndex:](self, "_topSpacingForItemAtIndex:", 0);
          v9 = v9 + v13;
        }
        -[NCNotificationListView _bottomSpacingForItemAtIndex:](self, "_bottomSpacingForItemAtIndex:", v10);
        v9 = v9 + v12 + v14;
      }
      ++v10;
    }
    while (v8 != v10);
  }
  -[NCNotificationListView visibleRectBottomMarginForRollUnder](self, "visibleRectBottomMarginForRollUnder");
  -[NCNotificationListView bounds](self, "bounds");
  CGRectGetHeight(v18);
  -[NCNotificationListView contentInset](self, "contentInset");
  -[NCNotificationListView interactionTranslation](self, "interactionTranslation");
  -[NCNotificationListView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  UIFloorToScale();
  v17 = v16;

  return v17;
}

- (void)_layoutForList
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  double v17;
  double MinY;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
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
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  CGRect v42;

  -[NCNotificationListView _initialLayoutOffset](self, "_initialLayoutOffset");
  v4 = v3;
  -[NCNotificationListView _layoutHeaderViewIfNecessaryAtLayoutOffset:](self, "_layoutHeaderViewIfNecessaryAtLayoutOffset:");
  -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight");
  v5 = 0.0;
  v7 = v6 <= 0.0;
  v8 = 0.0;
  if (!v7)
  {
    -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight", 0.0);
    v10 = v9;
    -[NCListAnimationSettings headerSpacing](self->_animationSettings, "headerSpacing");
    v8 = v10 + v11;
  }
  v12 = v4 + v8;
  v13 = -[NCNotificationListView count](self, "count");
  if (v13)
  {
    v14 = v13;
    -[NCNotificationListView _topSpacingForItemAtIndex:](self, "_topSpacingForItemAtIndex:", 0);
    v15 = 0;
    v16 = 0;
    v12 = v12 + v17;
    MinY = v12;
    do
    {
      -[NCNotificationListView visibleViewAtIndex:](self, "visibleViewAtIndex:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20
        && (objc_msgSend(v20, "isRevealed") & 1) == 0
        && !-[NCNotificationListView isActiveRevealTransitioning](self, "isActiveRevealTransitioning"))
      {
        v22 = -[NCNotificationListView _isTopSubviewHeightLessThanVisibleRect](self, "_isTopSubviewHeightLessThanVisibleRect");
        v23 = 100.0;
        if (v22)
          v23 = 0.0;
        v24 = v12 + v23;
        -[NCNotificationListView _topSpacingForItemAtIndex:](self, "_topSpacingForItemAtIndex:", v15);
        v5 = v24 - v25;
        v16 = 1;
      }
      if (!v15)
      {
        objc_msgSend(v19, "frame");
        MinY = CGRectGetMinY(v42);
      }
      -[NCNotificationListView _layoutViewIfNecessaryAtIndex:layoutOffset:startingLayoutOffset:](self, "_layoutViewIfNecessaryAtIndex:layoutOffset:startingLayoutOffset:", v15, v12, MinY);
      v27 = v26;
      if (v26 > v12 + 0.001)
      {
        -[NCNotificationListView _bottomSpacingForItemAtIndex:](self, "_bottomSpacingForItemAtIndex:", v15);
        v29 = v27 + v28;
        objc_msgSend(v21, "additionalBottomSpace");
        v12 = v29 + v30;
      }

      ++v15;
    }
    while (v14 != v15);
  }
  else
  {
    v16 = 0;
  }
  -[NCNotificationListView footerViewVerticalMargin](self, "footerViewVerticalMargin");
  -[NCNotificationListView _layoutFooterViewIfNecessaryAtLayoutOffset:](self, "_layoutFooterViewIfNecessaryAtLayoutOffset:", v12 + v31);
  -[NCNotificationListView _footerViewHeight](self, "_footerViewHeight");
  v32 = 0.0;
  if (v33 > 0.0)
  {
    -[NCNotificationListView _footerViewHeight](self, "_footerViewHeight");
    v35 = v34;
    -[NCNotificationListView footerViewVerticalMargin](self, "footerViewVerticalMargin");
    v32 = v35 + v36;
  }
  v37 = -[NCNotificationListView isPerformingHeaderGroupingAnimation](self, "isPerformingHeaderGroupingAnimation");
  -[NCNotificationListView headerView](self, "headerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v38);
  else
    -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:", v38);

  v39 = v12 + v32;
  -[NCNotificationListView footerView](self, "footerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v40);

  if ((v16 & 1) != 0)
    v41 = v5;
  else
    v41 = v39;
  if (v41 < 0.0)
    v41 = 0.0;
  -[NCNotificationListView _adjustContentSizeHeightIfNecessaryForUpdatedHeight:](self, "_adjustContentSizeHeightIfNecessaryForUpdatedHeight:", v41);
}

- (void)_layoutHeaderViewIfNecessaryAtLayoutOffset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *headerView;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  _QWORD v43[5];
  _QWORD aBlock[5];
  UIView *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGAffineTransform v50;
  double v51;
  _QWORD v52[5];
  UIView *v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGRect v57;

  -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight");
  v6 = v5;
  if (-[NCNotificationListView _isViewWithinVisibleRectForHeight:layoutOffset:](self, "_isViewWithinVisibleRectForHeight:layoutOffset:"))
  {
    -[NCNotificationListView bounds](self, "bounds");
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    v8 = v7;
    headerView = self->_headerView;
    if (headerView)
    {
      v10 = headerView;
LABEL_9:
      -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v10);
      if (-[NCNotificationListView isPerformingHeaderReloadAnimation](self, "isPerformingHeaderReloadAnimation"))
        -[UIView setAlpha:](v10, "setAlpha:", 0.0);
      v21 = -[NCNotificationListView _shouldRollUnderView:withHeight:layoutOffset:](self, "_shouldRollUnderView:withHeight:layoutOffset:", v10, v6, a3);
      -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
      v23 = v22;
      v24 = 1.0;
      if (!-[NCNotificationListView isRevealed](self, "isRevealed"))
      {
        -[NCListAnimationSettings headerViewRevealAlphaPercentage](self->_animationSettings, "headerViewRevealAlphaPercentage");
        v26 = v25;
        -[NCNotificationListView revealPercentage](self, "revealPercentage");
        v24 = v26 * v27;
      }
      v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v56.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v56.c = v28;
      *(_OWORD *)&v56.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v29 = -[NCNotificationListView count](self, "count");
      v30 = MEMORY[0x1E0C809B0];
      if (v29)
      {
        -[NCNotificationListView visibleViews](self, "visibleViews");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", &unk_1E8D5F920);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[NCNotificationListView dataSource](self, "dataSource");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "notificationListView:heightForItemAtIndex:withWidth:", self, 0, v8);
        v35 = v34;

        -[NCNotificationListView layoutOffsetForViewAtIndex:](self, "layoutOffsetForViewAtIndex:", 0);
        if (v32
          && (v37 = v36,
              -[NCNotificationListView _shouldRollUnderView:withHeight:layoutOffset:](self, "_shouldRollUnderView:withHeight:layoutOffset:", v32, v35, v36)))
        {
          -[NCListAnimationSettings rollUnderLimitHeightMax](self->_animationSettings, "rollUnderLimitHeightMax");
          if (v35 >= v38)
            v35 = v38;
          -[NCNotificationListView _visibleRect](self, "_visibleRect");
          if (v6 + a3 > CGRectGetMaxY(v57))
          {
            v24 = 0.0;
            -[UIView setAlpha:](v10, "setAlpha:", 0.0);
          }
          -[NCNotificationListView _alphaForRollUnderForView:withHeight:layoutOffset:](self, "_alphaForRollUnderForView:withHeight:layoutOffset:", v10, v6, a3);
          v24 = v24 * v39;
          memset(&v55, 0, sizeof(v55));
          -[NCNotificationListView _transformForRollUnderForView:withHeight:layoutOffset:](self, "_transformForRollUnderForView:withHeight:layoutOffset:", v32, v35, v37);
          CGAffineTransformMakeTranslation(&v56, 0.0, fmin(v37 + 0.0 - (v6 + a3), 0.0));
        }
        else if (v21)
        {
          -[NCNotificationListView _alphaForRollUnderForView:withHeight:layoutOffset:](self, "_alphaForRollUnderForView:withHeight:layoutOffset:", v10, v6, a3);
          v24 = v24 * v40;
          -[NCNotificationListView _transformForRollUnderForView:withHeight:layoutOffset:](self, "_transformForRollUnderForView:withHeight:layoutOffset:", v10, v6, a3);
        }
        v52[0] = v30;
        v52[1] = 3221225472;
        v52[2] = __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke;
        v52[3] = &unk_1E8D1CFD8;
        v52[4] = self;
        v53 = v10;
        v54 = v56;
        +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v52);

      }
      else if (v21)
      {
        -[NCNotificationListView _alphaForRollUnderForView:withHeight:layoutOffset:](self, "_alphaForRollUnderForView:withHeight:layoutOffset:", v10, v6, a3);
        v24 = v24 * v41;
        -[NCNotificationListView _transformForRollUnderForView:withHeight:layoutOffset:](self, "_transformForRollUnderForView:withHeight:layoutOffset:", v10, v6, a3);
      }
      v55 = v56;
      if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v10, &v55, v23, a3, v8, v6, v24))
      {
        aBlock[0] = v30;
        aBlock[1] = 3221225472;
        aBlock[2] = __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_2;
        aBlock[3] = &unk_1E8D1D000;
        aBlock[4] = self;
        v45 = v10;
        v46 = v23;
        v47 = a3;
        v48 = v8;
        v49 = v6;
        v50 = v56;
        v51 = v24;
        v42 = _Block_copy(aBlock);
        if (-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")
          && !-[NCNotificationListView _isAnimationStyleDissolve](self, "_isAnimationStyleDissolve")
          || -[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation"))
        {
          -[NCNotificationListView setPerformingHeaderGroupingAnimation:](self, "setPerformingHeaderGroupingAnimation:", -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation"));
          v43[0] = v30;
          v43[1] = 3221225472;
          v43[2] = __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_3;
          v43[3] = &unk_1E8D1B568;
          v43[4] = self;
          -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v42, v43);
        }
        else
        {
          +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v42);
        }

      }
      return;
    }
    -[NCNotificationListView _headerViewFromDataSource](self, "_headerViewFromDataSource");
    v13 = (UIView *)objc_claimAutoreleasedReturnValue();
    v14 = self->_headerView;
    self->_headerView = v13;

    -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight");
    v6 = v15;
    -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
    v17 = v16;
    v18 = -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation");
    v19 = 0.0;
    if (v18)
    {
      -[NCListAnimationSettings headerViewInitialOffsetHeightPercentage](self->_animationSettings, "headerViewInitialOffsetHeightPercentage", 0.0);
      v19 = v6 * v20;
    }
    -[NCNotificationListView _updateTransformedView:toFrame:](self, "_updateTransformedView:toFrame:", self->_headerView, v17, v19 + a3, v8, v6);
    -[UIView setAlpha:](self->_headerView, "setAlpha:", 0.0);
    -[NCNotificationListView addSubview:](self, "addSubview:", self->_headerView);
    v10 = self->_headerView;
    if (v10)
      goto LABEL_9;
  }
  else
  {
    v11 = self->_headerView;
    if (v11)
    {
      -[UIView removeFromSuperview](v11, "removeFromSuperview");
      -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", self->_headerView);
      v12 = self->_headerView;
      self->_headerView = 0;

    }
  }
}

uint64_t __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  if ((objc_msgSend(*(id *)(a1 + 32), "isPerformingBottomMarginAdjustmentAnimation") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isPerformingRevealAnimation") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isPerformingGroupingAnimation") & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(_OWORD *)(a1 + 64);
    v5[0] = *(_OWORD *)(a1 + 48);
    v5[1] = v3;
    v5[2] = *(_OWORD *)(a1 + 80);
    objc_msgSend(v2, "setTransform:", v5);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateBlurFilterForHeaderView:translation:", *(_QWORD *)(a1 + 40), fabs(*(double *)(a1 + 88)));
}

uint64_t __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  _OWORD v10[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 128));
}

uint64_t __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPerformingHeaderGroupingAnimation:", 0);
}

- (void)_updateBlurFilterForHeaderView:(id)a3 translation:(double)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder");
  v8 = a4 < 0.0 || !v7;
  if (v8 || !-[NCNotificationListView count](self, "count"))
  {
    objc_msgSend(v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    -[NCListAnimationSettings headerViewRevealBlurTranslationDistance](self->_animationSettings, "headerViewRevealBlurTranslationDistance");
    v10 = a4 / v9;
    -[NCListAnimationSettings headerViewRevealBlurRadiusMax](self->_animationSettings, "headerViewRevealBlurRadiusMax");
    v12 = v10 * v11;
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("inputRadius"));

    objc_msgSend(v6, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFilters:", v16);

  }
}

- (void)_layoutFooterViewIfNecessaryAtLayoutOffset:(double)a3
{
  double v5;
  double v6;
  _BOOL4 v7;
  UIView *footerView;
  UIView *v9;
  UIView *v10;
  UIView *v11;
  UIView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  UIView *v20;
  UIView *v21;
  _QWORD v22[5];
  UIView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  -[NCNotificationListView _footerViewHeight](self, "_footerViewHeight");
  v6 = v5;
  v7 = -[NCNotificationListView _isViewWithinVisibleRectForHeight:layoutOffset:](self, "_isViewWithinVisibleRectForHeight:layoutOffset:");
  footerView = self->_footerView;
  if (v7)
  {
    if (footerView)
    {
      v9 = footerView;
    }
    else
    {
      -[NCNotificationListView _footerViewFromDataSource](self, "_footerViewFromDataSource");
      v11 = (UIView *)objc_claimAutoreleasedReturnValue();
      v12 = self->_footerView;
      self->_footerView = v11;

      -[NCNotificationListView addSubview:](self, "addSubview:", self->_footerView);
      v9 = self->_footerView;
      if (!v9)
        return;
    }
    -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v9);
    -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
    v14 = v13;
    -[NCNotificationListView bounds](self, "bounds");
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    v16 = v15;
    if (-[NCNotificationListView _shouldRollUnderView:withHeight:layoutOffset:](self, "_shouldRollUnderView:withHeight:layoutOffset:", v9, v6, a3))
    {
      -[NCNotificationListView _alphaForRollUnderForView:withHeight:layoutOffset:](self, "_alphaForRollUnderForView:withHeight:layoutOffset:", v9, v6, a3);
      v18 = v17;
      v36 = 0u;
      v37 = 0u;
      v35 = 0u;
      -[NCNotificationListView _transformForRollUnderForView:withHeight:layoutOffset:](self, "_transformForRollUnderForView:withHeight:layoutOffset:", v9, v6, a3);
    }
    else
    {
      v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v35 = *MEMORY[0x1E0C9BAA8];
      v36 = v19;
      v37 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v18 = 1.0;
    }
    v20 = self->_footerView;
    v32 = v35;
    v33 = v36;
    v34 = v37;
    if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v20, &v32, v14, a3, v16, v6, v18))
    {
      if (-[NCNotificationListView isPerformingVisibleRectAdjustment](self, "isPerformingVisibleRectAdjustment"))
      {
        v21 = self->_footerView;
        v32 = v35;
        v33 = v36;
        v34 = v37;
        -[NCNotificationListView _updateTransformedView:toFrame:withTransform:](self, "_updateTransformedView:toFrame:withTransform:", v21, &v32, v14, a3, v16, v6);
        -[UIView setAlpha:](v9, "setAlpha:", v18);
      }
      else
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __69__NCNotificationListView__layoutFooterViewIfNecessaryAtLayoutOffset___block_invoke;
        v22[3] = &unk_1E8D1D000;
        v22[4] = self;
        v23 = v9;
        v24 = v14;
        v25 = a3;
        v26 = v16;
        v27 = v6;
        v28 = v35;
        v29 = v36;
        v30 = v37;
        v31 = v18;
        -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v22, 0);

      }
    }

  }
  else if (footerView)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", self->_footerView);
    v10 = self->_footerView;
    self->_footerView = 0;

  }
}

uint64_t __69__NCNotificationListView__layoutFooterViewIfNecessaryAtLayoutOffset___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  _OWORD v10[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 128));
}

- (double)_layoutViewIfNecessaryAtIndex:(unint64_t)a3 layoutOffset:(double)a4 startingLayoutOffset:(double)a5
{
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  int v35;
  id v36;
  double v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  double v43;
  double v44;
  _BOOL4 v45;
  __int128 *v46;
  __int128 v47;
  void *v48;
  double v49;
  double v50;
  int v51;
  unint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  BOOL v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  BOOL v68;
  double v69;
  double v70;
  __int128 v71;
  _BOOL8 v72;
  unint64_t v73;
  _BOOL4 v74;
  void *v75;
  _BOOL4 v76;
  double v77;
  double v78;
  double v79;
  int v80;
  unint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double MaxY;
  double v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  __int128 v91;
  BOOL v92;
  char v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  void *v98;
  void *v99;
  int v100;
  double v101;
  dispatch_time_t v102;
  void *v103;
  void *v104;
  int v105;
  _BOOL4 v106;
  uint64_t v107;
  id *v108;
  void *v109;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BOOL4 v115;
  _QWORD v116[5];
  id v117;
  unint64_t v118;
  _QWORD v119[5];
  id v120[5];
  CGAffineTransform v121;
  _QWORD v122[5];
  _QWORD v123[5];
  CGAffineTransform v124;
  unint64_t v125;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v128;
  _QWORD block[5];
  id v130;
  id v131;
  _QWORD aBlock[5];
  id v133;
  __int128 v134;
  __int128 v135;
  CGAffineTransform v136;
  CGFloat a;
  char v138;
  _QWORD v139[5];
  id v140;
  __int128 v141;
  __int128 v142;
  BOOL v143;
  CGAffineTransform v144;
  CGAffineTransform v145;
  _QWORD v146[4];
  id v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;

  -[NCNotificationListView dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NCNotificationListView _isFeaturedLeadingViewAtIndex:](self, "_isFeaturedLeadingViewAtIndex:", a3);
  if (v10)
  {
    -[NCNotificationListView _widthForFeaturedLeadingView](self, "_widthForFeaturedLeadingView");
    v12 = v11;
    -[NCNotificationListView _heightForFeaturedLeadingView](self, "_heightForFeaturedLeadingView");
  }
  else
  {
    -[NCNotificationListView bounds](self, "bounds");
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    v12 = v14;
    objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, a3);
  }
  v15 = v13;
  v16 = -[NCNotificationListView _isViewWithinVisibleRectForHeight:layoutOffset:](self, "_isViewWithinVisibleRectForHeight:layoutOffset:");
  -[NCNotificationListView visibleViewAtIndex:](self, "visibleViewAtIndex:", a3);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v16)
  {
    v19 = objc_opt_class();
    v20 = v18;
    v18 = v20;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v36 = v21;

    v37 = 0.0;
    if (v36)
    {
      objc_msgSend(v36, "purpose");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "isEqualToString:", CFSTR("clock")))
      {

LABEL_21:
        objc_msgSend(v36, "setUserInteractionEnabled:", 0);
        goto LABEL_27;
      }
      objc_msgSend(v36, "purpose");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("AdjunctTopSticky"));

      if ((v40 & 1) != 0)
        goto LABEL_21;
      -[NCNotificationListView additionalYOffset](self, "additionalYOffset");
      v37 = v43;
    }
LABEL_27:
    v44 = v37 + a4;
    v45 = -[NCNotificationListView _isAnimationStyleDissolve](self, "_isAnimationStyleDissolve");
    v115 = -[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder");
    v46 = (__int128 *)MEMORY[0x1E0C9BAA8];
    if (v20)
    {
      if (v10)
        goto LABEL_30;
    }
    else
    {
      -[NCNotificationListView _viewForItemAtIndex:](self, "_viewForItemAtIndex:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListView _setHiddenBelowStackForView:hiddenBelowStack:](self, "_setHiddenBelowStackForView:hiddenBelowStack:", v18, 0);
      objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, a3, *(double *)&v12);
      v15 = v75;
      -[NCNotificationListView _setVisibleView:atIndex:](self, "_setVisibleView:atIndex:", v18, a3);
      -[NCNotificationListView addSubview:](self, "addSubview:", v18);
      if (-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation"))
      {
        v146[0] = MEMORY[0x1E0C809B0];
        v146[1] = 3221225472;
        v146[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke;
        v146[3] = &unk_1E8D1B568;
        v147 = v18;
        +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v146);

      }
      v76 = -[NCNotificationListView isRevealed](self, "isRevealed");
      v77 = 0.0;
      if (v76)
        v77 = 1.0;
      -[NCNotificationListView _setRevealAlphaForView:desiredAlpha:](self, "_setRevealAlphaForView:desiredAlpha:", v18, v77);
      -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
      v79 = v78;
      if (v10)
      {
        v80 = -[NCNotificationListView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
        v81 = a3;
        if (v80)
          v81 = -[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") + ~a3;
        v82 = (double)v81;
        -[NCListAnimationSettings featuredLeadingViewSpacing](self->_animationSettings, "featuredLeadingViewSpacing");
        v79 = v79 + v82 * (*(double *)&v12 + v83);
      }
      v113 = v46[1];
      v114 = *v46;
      *(_OWORD *)&v145.a = *v46;
      *(_OWORD *)&v145.c = v113;
      v112 = v46[2];
      *(_OWORD *)&v145.tx = v112;
      if (a3 && -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation"))
      {
        v84 = 1.0;
        v85 = v44;
        if (!v45)
        {
          objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, 0, *(double *)&v12);
          -[NCNotificationListView _scaleTransformForGroupingAnimationForViewAtIndex:leadingViewHeight:](self, "_scaleTransformForGroupingAnimationForViewAtIndex:leadingViewHeight:", a3);
          v84 = 0.0;
          v85 = a5;
        }
      }
      else
      {
        v84 = 1.0;
        v85 = v44;
        if (!v45)
        {
          if (-[NCNotificationListView isSubviewPerformingGroupingAnimation](self, "isSubviewPerformingGroupingAnimation")&& (-[NCNotificationListView visibleRect](self, "visibleRect"), v44 < CGRectGetMaxY(v151)))
          {
            -[NCNotificationListView visibleRect](self, "visibleRect");
            MaxY = CGRectGetMaxY(v152);
            v87 = (double)a3 * 100.0;
            v84 = 0.0;
            if (v115)
              v87 = 0.0;
            v85 = v87 + MaxY;
            if (v115)
            {
              -[NCListAnimationSettings rollUnderScaleMinimum](self->_animationSettings, "rollUnderScaleMinimum");
              v89 = v88;
              -[NCListAnimationSettings rollUnderScaleMinimum](self->_animationSettings, "rollUnderScaleMinimum");
              CGAffineTransformMakeScale(&v144, v89, v90);
              *(_OWORD *)&v145.a = *(_OWORD *)&v144.a;
              *(_OWORD *)&v145.c = *(_OWORD *)&v144.c;
              v91 = *(_OWORD *)&v144.tx;
            }
            else
            {
              *(_OWORD *)&v145.a = v114;
              *(_OWORD *)&v145.c = v113;
              v91 = v112;
            }
            *(_OWORD *)&v145.tx = v91;
          }
          else
          {
            v84 = 0.0;
            if (v115
              && (-[NCNotificationListView _isAnimatingForParentNotificationListView](self, "_isAnimatingForParentNotificationListView")|| -[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation")|| -[NCNotificationListView isPerformingRevealTransitionAnimation](self, "isPerformingRevealTransitionAnimation")|| -[NCNotificationListView isRevealTransitionScrolling](self, "isRevealTransitionScrolling")))
            {
              -[NCNotificationListView _transformForRollUnderForView:withHeight:layoutOffset:](self, "_transformForRollUnderForView:withHeight:layoutOffset:", v18, *(double *)&v15, v44);
              v145 = v144;
            }
            v85 = v44;
          }
        }
      }
      *(_OWORD *)&v144.a = v114;
      *(_OWORD *)&v144.c = v113;
      *(_OWORD *)&v144.tx = v112;
      objc_msgSend(v18, "setTransform:", &v144);
      objc_msgSend(v18, "setFrame:", v79, v85, *(double *)&v12, *(double *)&v15);
      v144 = v145;
      objc_msgSend(v18, "setTransform:", &v144);
      objc_msgSend(v18, "setAlpha:", v84);
      *(_OWORD *)&v144.a = v114;
      *(_OWORD *)&v144.c = v113;
      *(_OWORD *)&v144.tx = v112;
      -[NCNotificationListView _configureStackDimmingForGroupedView:transform:](self, "_configureStackDimmingForGroupedView:transform:", v18, &v144);
      if (v10)
      {
LABEL_30:
        -[NCNotificationListView _setHiddenBelowStackForView:hiddenBelowStack:](self, "_setHiddenBelowStackForView:hiddenBelowStack:", v18, 0);
        -[NCNotificationListView _setContentHiddenForView:contentHidden:](self, "_setContentHiddenForView:contentHidden:", v18, 0);
        if (-[NCNotificationListView isReactiveLayout](self, "isReactiveLayout"))
        {
          v47 = v46[1];
          *(_OWORD *)&v145.a = *v46;
          *(_OWORD *)&v145.c = v47;
          *(_OWORD *)&v145.tx = v46[2];
          objc_msgSend(v18, "setTransform:", &v145);
        }
        if (v10)
        {
          -[NCNotificationListView _heightForFeaturedLeadingView](self, "_heightForFeaturedLeadingView");
          v15 = v48;
          -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
          v50 = v49;
          v51 = -[NCNotificationListView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
          v52 = a3;
          if (v51)
            v52 = -[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") + ~a3;
          v53 = (double)v52;
          -[NCListAnimationSettings featuredLeadingViewSpacing](self->_animationSettings, "featuredLeadingViewSpacing");
          v55 = (*(double *)&v12 + v54) * v53;
        }
        else
        {
          -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
          v50 = v56;
          v55 = 0.0;
        }
        v57 = -[NCNotificationListView isRevealed](self, "isRevealed");
        v58 = 0.0;
        v59 = 0.0;
        if (!v57)
          -[NCNotificationListView _positionOffsetForRevealHintingForItemAtIndex:](self, "_positionOffsetForRevealHintingForItemAtIndex:", a3, 0.0);
        v60 = v50 + v55;
        v61 = v44 + v59;
        -[NCNotificationListView interactionTranslationPercentage](self, "interactionTranslationPercentage");
        v63 = v62;
        -[NCNotificationListView interactionTranslationFocalPointY](self, "interactionTranslationFocalPointY");
        v65 = -(v63 * (v64 - v44));
        -[NCListAnimationSettings interactionTranslationCollapseVerticalOffsetFactor](self->_animationSettings, "interactionTranslationCollapseVerticalOffsetFactor");
        v67 = v61 + v65 * v66;
        if (!-[NCNotificationListView isRevealed](self, "isRevealed"))
        {
          if (-[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation"))
            v58 = 150.0;
          else
            v58 = 0.0;
        }
        v128.a = v60;
        v128.b = v67 + v58;
        *(_QWORD *)&v128.c = v12;
        *(_QWORD *)&v128.d = v15;
        v68 = -[NCNotificationListView isRevealed](self, "isRevealed");
        v69 = 1.0;
        if (!v68)
        {
          -[NCNotificationListView revealPercentage](self, "revealPercentage", 1.0);
          v69 = v70 / ((double)a3 * 0.5 + 1.0);
        }
        t1.a = v69;
        v71 = v46[1];
        *(_OWORD *)&v145.a = *v46;
        *(_OWORD *)&v145.c = v71;
        *(_OWORD *)&v145.tx = v46[2];
        v72 = -[NCNotificationListView _isPerformingRollUnderListLayoutForView:atIndex:viewHeight:atLayoutOffset:targetTransform:targetAlpha:viewFrame:](self, "_isPerformingRollUnderListLayoutForView:atIndex:viewHeight:atLayoutOffset:targetTransform:targetAlpha:viewFrame:", v18, a3, &v145, &t1, &v128, *(double *)&v15, v44);
        -[NCNotificationListView _updateBottomMarginAdjustmentAnimationForView:isPerformingRollUnderLayout:](self, "_updateBottomMarginAdjustmentAnimationForView:isPerformingRollUnderLayout:", v18, v72);
        -[NCNotificationListView _updateLayoutParametersForHiddenGroupListViewAnimationForView:targetTransform:targetAlpha:](self, "_updateLayoutParametersForHiddenGroupListViewAnimationForView:targetTransform:targetAlpha:", v18, &v145, &t1);
        if (-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation") && v45)
        {
          v139[0] = MEMORY[0x1E0C809B0];
          v139[1] = 3221225472;
          v139[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_2;
          v139[3] = &unk_1E8D1D028;
          v139[4] = self;
          v140 = v18;
          v141 = *(_OWORD *)&v128.a;
          v142 = *(_OWORD *)&v128.c;
          v143 = v20 != 0;
          +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v139);

        }
        v144 = v145;
        v73 = 0x1E0CB3000;
        if (!-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v18, &v144, v128.a, v128.b, v128.c, v128.d, t1.a))goto LABEL_84;
        v74 = -[NCNotificationListView _shouldAnimateListLayoutForView:atIndex:isExistingView:isPerformingRollUnderLayout:shouldUpdateTransformedView:](self, "_shouldAnimateListLayoutForView:atIndex:isExistingView:isPerformingRollUnderLayout:shouldUpdateTransformedView:", v18, a3, v20 != 0, v72, 1);
        v111 = v36;
        if (-[NCNotificationListView isPerformingContentRevealAnimation](self, "isPerformingContentRevealAnimation"))
        {
          if (!a3)
          {
LABEL_72:
            v93 = 1;
LABEL_74:
            v96 = MEMORY[0x1E0C809B0];
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_3;
            aBlock[3] = &unk_1E8D1D050;
            aBlock[4] = self;
            v97 = v18;
            v133 = v97;
            v134 = *(_OWORD *)&v128.a;
            v135 = *(_OWORD *)&v128.c;
            v136 = v145;
            a = t1.a;
            v138 = v93;
            v98 = _Block_copy(aBlock);
            if (v74)
            {
              v73 = 0x1E0CB3000;
              if (!-[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation") || v115)
              {
                -[NCNotificationListView _performRetargetableAnimationForView:animationBlock:completionBlock:](self, "_performRetargetableAnimationForView:animationBlock:completionBlock:", v97, v98, 0);
              }
              else
              {
                -[NCNotificationListView _revealAnimationDelayForObjectAtIndex:](self, "_revealAnimationDelayForObjectAtIndex:", a3);
                v102 = dispatch_time(0, (uint64_t)(v101 * 1000000000.0));
                block[0] = v96;
                block[1] = 3221225472;
                block[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_4;
                block[3] = &unk_1E8D1CC28;
                block[4] = self;
                v130 = v97;
                v131 = v98;
                dispatch_after(v102, MEMORY[0x1E0C80D38], block);

              }
              v36 = v111;
            }
            else
            {
              -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_msgSend(v99, "containsObject:", v97);

              if (v100)
                -[NCNotificationListView _performRetargetableAnimationForView:animationBlock:completionBlock:](self, "_performRetargetableAnimationForView:animationBlock:completionBlock:", v97, v98, 0);
              else
                +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v98);
              v36 = v111;
              v73 = 0x1E0CB3000uLL;
            }

LABEL_84:
            -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v73 + 2024), "numberWithUnsignedInteger:", a3);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v103, "containsObject:", v104);

            if (v105)
              -[NCNotificationListView _performInsertionAnimationForView:](self, "_performInsertionAnimationForView:", v18);
            if (!v10
              || -[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") - 1 <= a3)
            {
              v44 = v44 + *(double *)&v15;
            }
            a4 = v44 - v37;

            goto LABEL_100;
          }
        }
        else
        {
          v92 = -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation");
          if (!a3 && v92)
            goto LABEL_72;
        }
        -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v94, "containsObject:", v95);

        goto LABEL_74;
      }
    }
    -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v18);
    goto LABEL_30;
  }
  if (v17)
  {
    -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListView visibleRect](self, "visibleRect");
    if (CGRectGetMinY(v148) < a4
      && (-[NCNotificationListView _isAnimatingForParentNotificationListView](self, "_isAnimatingForParentNotificationListView")|| objc_msgSend(v22, "isGrouped")&& (objc_msgSend(v18, "center"), (BSFloatApproximatelyEqualToFloat() & 1) == 0)))
    {
      v23 = v9;
      -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v18);
      -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
      v25 = v24;
      v26 = a4;
      if (-[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder"))
      {
        -[NCNotificationListView visibleRect](self, "visibleRect");
        v27 = CGRectGetMaxY(v149);
        -[NCListAnimationSettings notRevealedPlacementOffset](self->_animationSettings, "notRevealedPlacementOffset");
        v26 = v27 + v28;
      }
      -[NCNotificationListView _visibleRect](self, "_visibleRect");
      v29 = v26 - CGRectGetMaxY(v150);
      -[NCListAnimationSettings rollUnderNotVisibleTranslation](self->_animationSettings, "rollUnderNotVisibleTranslation");
      memset(&v145, 0, sizeof(v145));
      CGAffineTransformMakeTranslation(&v145, 0.0, v29 - v30);
      memset(&v144, 0, sizeof(v144));
      -[NCListAnimationSettings rollUnderScaleMinimum](self->_animationSettings, "rollUnderScaleMinimum");
      v32 = v31;
      -[NCListAnimationSettings rollUnderScaleMinimum](self->_animationSettings, "rollUnderScaleMinimum");
      CGAffineTransformMakeScale(&v144, v32, v33);
      t1 = v144;
      memset(&v128, 0, sizeof(v128));
      t2 = v145;
      CGAffineTransformConcat(&v128, &t1, &t2);
      if (_NCReactiveListUI())
      {
        +[NCUserNotificationsUIKitDefaults standardDefaults](NCUserNotificationsUIKitDefaults, "standardDefaults");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "shouldUseReactiveList");

      }
      else
      {
        v35 = 0;
      }
      v106 = -[NCNotificationListView isPerformingVisibleRectAdjustment](self, "isPerformingVisibleRectAdjustment");
      if (v35 || v106)
      {
        v109 = (void *)MEMORY[0x1E0DC3F10];
        v122[0] = MEMORY[0x1E0C809B0];
        v122[1] = 3221225472;
        v122[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_5;
        v122[3] = &unk_1E8D1D000;
        v122[4] = self;
        v108 = (id *)v123;
        v123[0] = v18;
        v123[1] = v25;
        *(double *)&v123[2] = v26;
        v123[3] = v12;
        v123[4] = v15;
        v124 = v128;
        v125 = a3;
        objc_msgSend(v109, "_performWithoutRetargetingAnimations:", v122);
      }
      else
      {
        v107 = MEMORY[0x1E0C809B0];
        v119[0] = MEMORY[0x1E0C809B0];
        v119[1] = 3221225472;
        v119[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_6;
        v119[3] = &unk_1E8D1D078;
        v119[4] = self;
        v108 = v120;
        v120[0] = v18;
        v120[1] = v25;
        v120[2] = *(id *)&v26;
        v120[3] = v12;
        v120[4] = v15;
        v121 = v128;
        v116[0] = v107;
        v116[1] = 3221225472;
        v116[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_7;
        v116[3] = &unk_1E8D1D0A0;
        v116[4] = self;
        v117 = v120[0];
        v118 = a3;
        -[NCNotificationListView _performRetargetableAnimationForView:animationBlock:completionBlock:](self, "_performRetargetableAnimationForView:animationBlock:completionBlock:", v117, v119, v116);

      }
      v9 = v23;
    }
    else
    {
      -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "containsObject:", v18);

      if ((v42 & 1) == 0)
        -[NCNotificationListView _removeStoredVisibleViewAtIndex:](self, "_removeStoredVisibleViewAtIndex:", a3);
    }

  }
  if (!-[NCNotificationListView _isShowingFeaturedLeadingViews](self, "_isShowingFeaturedLeadingViews")
    || -[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") - 1 <= a3)
  {
    a4 = *(double *)&v15 + a4;
  }
LABEL_100:

  return a4;
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  UIRectRoundToScale();
  objc_msgSend(v2, "_updateTransformedView:toFrame:", v3);

  result = objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  if (!*(_BYTE *)(a1 + 80))
    return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  return result;
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v13 = *(_OWORD *)(a1 + 80);
  v14 = v8;
  v15 = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v13, v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "_setRevealAlphaForView:desiredAlpha:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 128));
  if (*(_BYTE *)(a1 + 136))
    objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13 = *MEMORY[0x1E0C9BAA8];
  v14 = v11;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v9, "_configureStackDimmingForGroupedView:transform:", v10, &v13);
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRetargetableAnimationForView:animationBlock:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  _OWORD v10[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_removeStoredVisibleViewAtIndex:", *(_QWORD *)(a1 + 128));
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  _OWORD v10[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_7(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "viewsPerformingAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_removeStoredVisibleViewAtIndex:", *(_QWORD *)(a1 + 48));
}

- (BOOL)_isPerformingRollUnderListLayoutForView:(id)a3 atIndex:(unint64_t)a4 viewHeight:(double)a5 atLayoutOffset:(double)MinY targetTransform:(CGAffineTransform *)a7 targetAlpha:(double *)a8 viewFrame:(CGRect *)a9
{
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double height;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGRect v37;

  v16 = a3;
  -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView visibleViewAtIndex:](self, "visibleViewAtIndex:", a4 - 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NCNotificationListView _shouldRollUnderView:withHeight:layoutOffset:](self, "_shouldRollUnderView:withHeight:layoutOffset:", v16, a5, MinY);
  if (v19)
  {
    v20 = a5;
    if (!-[NCNotificationListView _isLayoutFromBottomUp](self, "_isLayoutFromBottomUp"))
    {
      -[NCListAnimationSettings rollUnderLimitHeightMax](self->_animationSettings, "rollUnderLimitHeightMax");
      if (v21 <= a5)
        v20 = v21;
      else
        v20 = a5;
    }
    v22 = *a8;
    -[NCNotificationListView _alphaForRollUnderForView:withHeight:layoutOffset:](self, "_alphaForRollUnderForView:withHeight:layoutOffset:", v16, v20, MinY);
    *a8 = v22 * v23;
    -[NCNotificationListView _transformForRollUnderForView:withHeight:layoutOffset:](self, "_transformForRollUnderForView:withHeight:layoutOffset:", v16, v20, MinY);
    *(_OWORD *)&a7->a = v34;
    *(_OWORD *)&a7->c = v35;
    *(_OWORD *)&a7->tx = v36;
    -[NCNotificationListView _verticalTranslationProgressForView:withHeight:layoutOffset:](self, "_verticalTranslationProgressForView:withHeight:layoutOffset:", v16, v20, MinY);
    -[NCNotificationListView _updateShadowForOverlappingRollUnderView:withProgress:](self, "_updateShadowForOverlappingRollUnderView:withProgress:", v18);
    height = 0.0;
    if (v20 < a5)
    {
      -[NCNotificationListView _rollUnderThresholdOffset](self, "_rollUnderThresholdOffset", 0.0);
      height = v25 - (a7->ty + MinY);
    }
    if (height > a5)
      height = a5;
    if (v17)
    {
      objc_msgSend(v17, "setOverrideLeadingViewHeight:", height);
    }
    else
    {
      if (height <= 0.0)
        height = a9->size.height;
      a9->size.height = height;
    }
  }
  else
  {
    objc_msgSend(v17, "setOverrideLeadingViewHeight:", 0.0);
    -[NCNotificationListView _updateShadowForOverlappingRollUnderView:withProgress:](self, "_updateShadowForOverlappingRollUnderView:withProgress:", v18, 0.0);
  }
  v26 = 0.0;
  if (-[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder"))
  {
    -[NCNotificationListView maximumLeadingViewHeight](self, "maximumLeadingViewHeight");
    if (v27 <= 0.0)
    {
      if (!-[NCNotificationListView shouldLimitViewHeightForRollUnder](self, "shouldLimitViewHeightForRollUnder"))
        goto LABEL_27;
      -[NCNotificationListView _rollUnderThresholdOffset](self, "_rollUnderThresholdOffset");
      v31 = v30;
      if ((objc_msgSend(v17, "isGrouped") & 1) == 0)
      {
        -[NCNotificationListView visibleRect](self, "visibleRect");
        MinY = CGRectGetMinY(v37);
      }
      v29 = v31 - MinY;
    }
    else
    {
      -[NCNotificationListView maximumLeadingViewHeight](self, "maximumLeadingViewHeight");
      v29 = v28;
    }
    if (v29 > 0.0)
    {
      -[NCListAnimationSettings rollUnderLimitHeightMax](self->_animationSettings, "rollUnderLimitHeightMax");
      if (v29 >= v32)
        v26 = v29;
      else
        v26 = v32;
    }
  }
LABEL_27:
  objc_msgSend(v17, "setMaximumLeadingViewHeight:", v26);

  return v19;
}

- (BOOL)_wasPerformingRollUnderLayoutForView:(id)a3 isPerformingRollUnderLayout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a4;
  v6 = a3;
  -[NCNotificationListView viewsPerformingRollUnderLayout](self, "viewsPerformingRollUnderLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6) & !v4;

  -[NCNotificationListView viewsPerformingRollUnderLayout](self, "viewsPerformingRollUnderLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "removeObject:", v6);
LABEL_6:

    goto LABEL_7;
  }
  v11 = objc_msgSend(v9, "containsObject:", v6);

  if (!v11 && v4)
  {
    -[NCNotificationListView viewsPerformingRollUnderLayout](self, "viewsPerformingRollUnderLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (void)_updateBottomMarginAdjustmentAnimationForView:(id)a3 isPerformingRollUnderLayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if (v4)
  {
    if (-[NCNotificationListView isPerformingBottomMarginAdjustmentAnimation](self, "isPerformingBottomMarginAdjustmentAnimation"))
    {
      -[NCNotificationListView viewsPerformingBottomMarginAdjustmentAnimation](self, "viewsPerformingBottomMarginAdjustmentAnimation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);
LABEL_6:

    }
  }
  else
  {
    -[NCNotificationListView viewsPerformingBottomMarginAdjustmentAnimation](self, "viewsPerformingBottomMarginAdjustmentAnimation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v10);

    if (v8)
    {
      -[NCNotificationListView viewsPerformingBottomMarginAdjustmentAnimation](self, "viewsPerformingBottomMarginAdjustmentAnimation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v10);
      goto LABEL_6;
    }
  }
  -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && -[NCNotificationListView isPerformingBottomMarginAdjustmentAnimation](self, "isPerformingBottomMarginAdjustmentAnimation"))
  {
    objc_msgSend(v9, "setPerformingBottomMarginAdjustmentAnimation:", 1);
  }

}

- (void)_updateLayoutParametersForHiddenGroupListViewAnimationForView:(id)a3 targetTransform:(CGAffineTransform *)a4 targetAlpha:(double *)a5
{
  void *v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  double v14;
  double MinY;
  double Height;
  void *v17;
  double v18;
  double v19;
  NSNumber *footerCenterY;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  uint64_t v26;
  CGAffineTransform v27;
  CGAffineTransform t1;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[NCNotificationListView _listViewForView:](self, "_listViewForView:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationListView isReactiveLayout](self, "isReactiveLayout")
    && (objc_msgSend(v8, "shouldBottomViewsRollUnder") & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(v8, "revealPercentage");
      if (v14 < 1.0)
      {
        if (-[NSString isEqualToString:](self->_purpose, "isEqualToString:", CFSTR("TopLevel")))
        {
          objc_msgSend(v8, "revealPercentage");
          objc_msgSend(v8, "frame");
          MinY = CGRectGetMinY(v32);
          objc_msgSend(v8, "frame");
          Height = CGRectGetHeight(v33);
          -[NCNotificationListView traitCollection](self, "traitCollection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "displayScale");
          UIRoundToScale();
          v19 = v18;

          memset(&v31, 0, sizeof(v31));
          CGAffineTransformMakeScale(&v31, v19 / Height, v19 / Height);
          footerCenterY = self->_footerCenterY;
          if (footerCenterY)
          {
            v21 = MinY + v19;
            -[NSNumber bs_CGFloatValue](footerCenterY, "bs_CGFloatValue");
            v23 = v22;
            -[NCNotificationListView visibleRect](self, "visibleRect");
            v24 = fmin(v23 + fmax(CGRectGetMinY(v34), 0.0) - v21, 0.0);
          }
          else
          {
            v24 = 0.0;
          }
          memset(&v30, 0, sizeof(v30));
          CGAffineTransformMakeTranslation(&v30, 0.0, v24);
          t1 = v31;
          v27 = v30;
          CGAffineTransformConcat(&v29, &t1, &v27);
          v25 = *(_OWORD *)&v29.c;
          *(_OWORD *)&a4->a = *(_OWORD *)&v29.a;
          *(_OWORD *)&a4->c = v25;
          *(_OWORD *)&a4->tx = *(_OWORD *)&v29.tx;
          objc_msgSend(v8, "revealPercentage");
          *(_QWORD *)a5 = v26;
        }
      }
    }
  }
  else if (v8
         && (objc_msgSend(v8, "isRevealed") & 1) == 0
         && objc_msgSend(v8, "isGrouped")
         && -[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder"))
  {
    memset(&v31, 0, sizeof(v31));
    -[NCListAnimationSettings rollUnderNotRevealedTranslationY](self->_animationSettings, "rollUnderNotRevealedTranslationY");
    CGAffineTransformMakeTranslation(&v31, 0.0, v9);
    memset(&v30, 0, sizeof(v30));
    -[NCListAnimationSettings rollUnderNotRevealedScale](self->_animationSettings, "rollUnderNotRevealedScale");
    v11 = v10;
    -[NCListAnimationSettings rollUnderNotRevealedScale](self->_animationSettings, "rollUnderNotRevealedScale");
    CGAffineTransformMakeScale(&v30, v11, v12);
    t1 = v31;
    v27 = v30;
    CGAffineTransformConcat(&v29, &t1, &v27);
    v13 = *(_OWORD *)&v29.c;
    *(_OWORD *)&a4->a = *(_OWORD *)&v29.a;
    *(_OWORD *)&a4->c = v13;
    *(_OWORD *)&a4->tx = *(_OWORD *)&v29.tx;
    *a5 = 0.0;
  }

}

- (BOOL)_shouldAnimateListLayoutForView:(id)a3 atIndex:(unint64_t)a4 isExistingView:(BOOL)a5 isPerformingRollUnderLayout:(BOOL)a6 shouldUpdateTransformedView:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  double v20;
  _BOOL4 v21;
  int v22;
  unsigned int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  char v31;
  double v32;
  BOOL v33;
  int v34;
  BOOL v35;
  void *v36;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "containsObject:", v17);

  v19 = !v9 && -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation");
  if (-[NCNotificationListView isPerformingInteractiveTranslationAnimation](self, "isPerformingInteractiveTranslationAnimation"))
  {
    -[NCNotificationListView interactionTranslation](self, "interactionTranslation");
    v21 = v20 == 0.0;
  }
  else
  {
    v21 = 0;
  }
  if (!-[NCNotificationListView isPerformingVisibleRectAdjustment](self, "isPerformingVisibleRectAdjustment")
    || -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")
    || -[NCNotificationListView _isPerformingContentModification](self, "_isPerformingContentModification"))
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    v22 = !-[NCNotificationListView isListRevealTargetContentOffsetClamped](self, "isListRevealTargetContentOffsetClamped")&& !v21;
  }
  v23 = 0;
  if (((!v9 | v15) & 1) == 0 && (v22 & 1) == 0)
    v23 = v7 & ~-[NCNotificationListView isActiveRevealTransitioning](self, "isActiveRevealTransitioning");
  if (-[NCNotificationListView isPerformingBottomMarginAdjustmentAnimation](self, "isPerformingBottomMarginAdjustmentAnimation"))
  {
    v24 = 1;
  }
  else
  {
    -[NCNotificationListView viewsPerformingBottomMarginAdjustmentAnimation](self, "viewsPerformingBottomMarginAdjustmentAnimation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "containsObject:", v12);

  }
  -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
    v28 = objc_msgSend(v26, "isPerformingRevealAnimation");
  else
    v28 = 0;
  if (-[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation")
    || -[NCNotificationListView isActiveRevealTransitioning](self, "isActiveRevealTransitioning"))
  {
    v29 = !-[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder");
    if (v23)
      goto LABEL_23;
LABEL_26:
    if (v19)
      goto LABEL_28;
    goto LABEL_27;
  }
  v29 = 0;
  if (!v23)
    goto LABEL_26;
LABEL_23:
  if (!-[NCNotificationListView isAnimatingAdditionalYOffset](self, "isAnimatingAdditionalYOffset") || v19)
  {
LABEL_28:
    LOBYTE(v30) = 1;
    if (!v8)
      goto LABEL_33;
    goto LABEL_31;
  }
LABEL_27:
  if (((-[NCNotificationListView isSubviewPerformingGroupingAnimation](self, "isSubviewPerformingGroupingAnimation") | v28 | v18) & 1) != 0)
    goto LABEL_28;
  v30 = objc_msgSend(v27, "isPerformingRemovalAnimation") | v29;
  if (!v8)
  {
LABEL_33:
    v31 = 1;
    goto LABEL_34;
  }
LABEL_31:
  if (-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")
    || ((-[NCNotificationListView isSubviewPerformingGroupingAnimation](self, "isSubviewPerformingGroupingAnimation") | v24) & 1) != 0)
  {
    goto LABEL_33;
  }
  v31 = objc_msgSend(v27, "isPerformingRemovalAnimation");
LABEL_34:
  -[NCNotificationListView contentLayoutOffset](self, "contentLayoutOffset");
  v33 = v32 <= 0.0 || v27 == 0;
  v34 = !v33;
  if (!v33)
  {
    objc_msgSend(v27, "insertedViewIndices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v35 = 0;
LABEL_51:

      goto LABEL_52;
    }
    if (!-[NCNotificationListView _isLayoutFromBottomUp](self, "_isLayoutFromBottomUp"))
    {
      v35 = 1;
      goto LABEL_51;
    }
LABEL_46:
    -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v36, "count") == 0;

    if (!v34)
      goto LABEL_52;
    goto LABEL_51;
  }
  if (-[NCNotificationListView _isLayoutFromBottomUp](self, "_isLayoutFromBottomUp"))
    goto LABEL_46;
  v35 = 1;
LABEL_52:

  return v30 & v31 & v35;
}

- (BOOL)_isPerformingContentModification
{
  void *v3;
  BOOL v4;
  void *v5;

  -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v4 = 1;
    else
      v4 = -[NCNotificationListView removedViewIndex](self, "removedViewIndex") != 0x7FFFFFFFFFFFFFFFLL;

  }
  return v4;
}

- (double)_positionOffsetForRevealHintingForItemAtIndex:(unint64_t)a3
{
  BOOL v5;
  double result;
  long double v7;

  v5 = -[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder");
  result = 0.0;
  if (!v5)
  {
    -[NCNotificationListView revealPercentage](self, "revealPercentage", 0.0);
    return pow(v7, (double)(a3 + 1)) * 8.0;
  }
  return result;
}

- (void)setAnimatingAdditionalYOffset:(BOOL)a3
{
  _BOOL4 animatingAdditionalYOffset;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  animatingAdditionalYOffset = self->_animatingAdditionalYOffset;
  self->_animatingAdditionalYOffset = a3;
  if (animatingAdditionalYOffset != a3)
  {
    v4 = a3;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NCNotificationListView visibleViews](self, "visibleViews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "setAnimatingAdditionalYOffset:", v4);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_layoutForGrouping
{
  void *v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  double Height;
  double MaxY;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  void *v12;
  double v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGRect v21;
  CGRect v22;

  if (!-[NCNotificationListView _isGrouping](self, "_isGrouping"))
    return;
  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notificationListViewNumberOfItems:", self);
  if (!-[NCNotificationListView showStackBelowLeadingView](self, "showStackBelowLeadingView"))
  {
    v6 = 1;
LABEL_10:
    v9 = 0;
    Height = 0.0;
    v10 = (__int128 *)MEMORY[0x1E0C9BAA8];
    while (1)
    {
      -[NCNotificationListView visibleViewAtIndex:](self, "visibleViewAtIndex:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      -[NCNotificationListView _updateShadowForOverlappingRollUnderView:withProgress:](self, "_updateShadowForOverlappingRollUnderView:withProgress:", v11, 0.0);
      if (v11)
      {
        -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v11);
        v12 = (void *)v11;
        if (!v9)
          goto LABEL_22;
      }
      else
      {
        -[NCNotificationListView _viewForItemAtIndex:](self, "_viewForItemAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListView _setHiddenBelowStackForView:hiddenBelowStack:](self, "_setHiddenBelowStackForView:hiddenBelowStack:", v12, v9 != 0);
        -[NCNotificationListView _setVisibleView:atIndex:](self, "_setVisibleView:atIndex:", v12, v9);
        -[NCNotificationListView addSubview:](self, "addSubview:", v12);
        objc_msgSend(v12, "setAlpha:", 0.0);
        v17 = v10[1];
        v18 = *v10;
        v16 = v18;
        v19 = v17;
        v20 = v10[2];
        v15 = v20;
        objc_msgSend(v12, "setTransform:", &v18);
        v18 = v16;
        v19 = v17;
        v20 = v15;
        -[NCNotificationListView _configureStackDimmingForGroupedView:transform:](self, "_configureStackDimmingForGroupedView:transform:", v12, &v18);
        -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v12);
        if (!v9)
        {
          -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
LABEL_22:
          -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:", v12);
          -[NCNotificationListView _layoutLeadingViewForGroupingLayoutIfNecessary:hasShadow:isExistingView:](self, "_layoutLeadingViewForGroupingLayoutIfNecessary:hasShadow:isExistingView:", v12, v4 > 1, v11 != 0);
          objc_msgSend(v12, "frame");
          Height = CGRectGetHeight(v22);
          v14 = 1;
          if (v11)
            goto LABEL_17;
LABEL_16:
          objc_msgSend(v12, "setAlpha:", 1.0);
          goto LABEL_17;
        }
      }
      -[NCNotificationListView groupingViewOverlapAlphaFactor](self, "groupingViewOverlapAlphaFactor");
      -[NCNotificationListView _layoutGroupedViewForGroupingLayout:atIndex:isExistingView:leadingViewHeight:alpha:](self, "_layoutGroupedViewForGroupingLayout:atIndex:isExistingView:leadingViewHeight:alpha:", v12, v9, v11 != 0, Height, v13);
      v14 = 0;
      if (!v11)
        goto LABEL_16;
LABEL_17:
      if ((v14 & 1) == 0)
      {
        -[NCNotificationListView groupingViewOverlapAlphaFactor](self, "groupingViewOverlapAlphaFactor");
        objc_msgSend(v12, "setAlpha:");
      }
      objc_msgSend(v12, "frame");
      MaxY = CGRectGetMaxY(v21);

      if (v6 == ++v9)
        goto LABEL_7;
    }
  }
  -[NCListAnimationSettings groupListMaxViewCount](self->_animationSettings, "groupListMaxViewCount");
  if (v5 > (double)v4)
    v5 = (double)v4;
  v6 = (unint64_t)v5;
  if ((unint64_t)v5)
    goto LABEL_10;
  Height = 0.0;
  MaxY = 0.0;
LABEL_7:
  -[NCNotificationListView _layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset:](self, "_layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset:", Height);
  -[NCNotificationListView _layoutFooterViewForGroupingIfNecessary](self, "_layoutFooterViewForGroupingIfNecessary");
  -[NCNotificationListView _layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight:](self, "_layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight:", Height);
  -[NCNotificationListView _adjustContentSizeHeightIfNecessaryForUpdatedHeight:](self, "_adjustContentSizeHeightIfNecessaryForUpdatedHeight:", MaxY);

}

- (void)_layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset:(double)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGRect v28;
  CGRect v29;

  -[NCNotificationListView headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if ((v7 & 1) == 0)
    {
      -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v5);

      objc_msgSend(v5, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      if (!-[NCNotificationListView _isAnimationStyleDissolve](self, "_isAnimationStyleDissolve"))
      {
        v28.origin.x = v10;
        v28.origin.y = v12;
        v28.size.width = v14;
        v28.size.height = v16;
        v17 = a3 - CGRectGetHeight(v28);
        v29.origin.x = v10;
        v29.origin.y = v12;
        v29.size.width = v14;
        v29.size.height = v16;
        v18 = CGRectGetMaxY(v29) * 0.5;
        if (v17 >= v18)
          v12 = v18;
        else
          v12 = v17;
      }
      -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v5);
      v19 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke;
      v22[3] = &unk_1E8D1BD70;
      v23 = v5;
      v24 = v10;
      v25 = v12;
      v26 = v14;
      v27 = v16;
      v20[0] = v19;
      v20[1] = 3221225472;
      v20[2] = __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke_2;
      v20[3] = &unk_1E8D1B3A0;
      v20[4] = self;
      v21 = v23;
      -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v22, v20);

    }
  }

}

uint64_t __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "viewsPerformingAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "_recycleViewIfNecessary:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setHeaderView:", 0);
}

- (void)_layoutFooterViewForGroupingIfNecessary
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[NCNotificationListView footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    if ((v5 & 1) == 0)
    {
      -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v3);

      objc_msgSend(v3, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:", v3);
      v13 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke;
      v16[3] = &unk_1E8D1BD70;
      v17 = v3;
      v18 = v8;
      v19 = 0;
      v20 = v10;
      v21 = v12;
      v14[0] = v13;
      v14[1] = 3221225472;
      v14[2] = __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke_2;
      v14[3] = &unk_1E8D1B3A0;
      v14[4] = self;
      v15 = v17;
      -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v16, v14);

    }
  }

}

uint64_t __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "viewsPerformingAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "_recycleViewIfNecessary:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setFooterView:", 0);
}

- (CGRect)_frameForViewAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double Height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  v6 = v5;
  -[NCNotificationListView dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationListView:heightForItemAtIndex:withWidth:", self, a3, v6);
  Height = v8;

  if (-[NCNotificationListView leadingContentShouldFillList](self, "leadingContentShouldFillList")
    && -[NCNotificationListView count](self, "count") == 1
    && !-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation"))
  {
    -[NCNotificationListView bounds](self, "bounds");
    Height = CGRectGetHeight(v18);
  }
  if (!a3)
  {
    -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
    if (v10 > 0.0)
    {
      -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
      if (v11 < Height)
        Height = v11;
    }
    -[NCNotificationListView maximumLeadingViewHeight](self, "maximumLeadingViewHeight");
    if (v12 > 0.0)
    {
      -[NCNotificationListView maximumLeadingViewHeight](self, "maximumLeadingViewHeight");
      if (v13 < Height)
        Height = v13;
    }
  }
  -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
  v15 = 0.0;
  v16 = v6;
  v17 = Height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_layoutLeadingViewForGroupingLayoutIfNecessary:(id)a3 hasShadow:(BOOL)a4 isExistingView:(BOOL)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  _OWORD *v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  CGAffineTransform *p_t1;
  unint64_t v42;
  char v43;
  __int128 v44;
  unint64_t v45;
  NCListAnimationSettings *animationSettings;
  CGFloat v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD aBlock[5];
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  char v61;
  char v62;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  _QWORD v68[4];
  id v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v7 = a3;
  -[NCNotificationListView _frameForViewAtIndex:](self, "_frameForViewAtIndex:", 0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = MEMORY[0x1E0C809B0];
  if (!a5)
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke;
    v68[3] = &unk_1E8D1BD70;
    v69 = v7;
    v70 = v9;
    v71 = v11;
    v72 = v13;
    v73 = v15;
    +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v68);

  }
  -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", &unk_1E8D5F920);

  -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", &unk_1E8D5F920);

  if ((v18 & 1) != 0 || v20)
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
  -[NCNotificationListView interactionTranslationPercentage](self, "interactionTranslationPercentage");
  v22 = v21;
  -[NCListAnimationSettings interactionTranslationVerticalOffsetMax](self->_animationSettings, "interactionTranslationVerticalOffsetMax");
  v24 = v23;
  -[NCNotificationListView interactionTranslationPercentage](self, "interactionTranslationPercentage");
  v26 = v25;
  -[NCListAnimationSettings interactionTranslationOffsetMax](self->_animationSettings, "interactionTranslationOffsetMax");
  v28 = -(v26 * v27) - v22 * v24;
  if (v11 != v28)
    goto LABEL_11;
  objc_msgSend(v7, "frame");
  v77.origin.x = v29;
  v77.origin.y = v30;
  v77.size.width = v31;
  v77.size.height = v32;
  v74.origin.x = v9;
  v74.origin.y = v11;
  v74.size.width = v13;
  v74.size.height = v15;
  if (((!CGRectEqualToRect(v74, v77) | v18 | v20) & 1) != 0
    || -[NCNotificationListView isPerformingStackVisibilityAnimation](self, "isPerformingStackVisibilityAnimation")
    || -[NCNotificationListView isPerformingInteractiveTranslationAnimation](self, "isPerformingInteractiveTranslationAnimation")|| (objc_msgSend(v7, "alpha"), v33 != 1.0))
  {
LABEL_11:
    v34 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    if (v18
      && (v75.origin.x = v9,
          v75.origin.y = v28,
          v75.size.width = v13,
          v75.size.height = v15,
          -[NCNotificationListView _isViewWithinVisibleRectForHeight:layoutOffset:](self, "_isViewWithinVisibleRectForHeight:layoutOffset:", CGRectGetHeight(v75), 0.0)))
    {
      objc_msgSend(v7, "setFrame:", v9, v28, v13, v15);
      -[NCListAnimationSettings animationInsertionStartAlpha](self->_animationSettings, "animationInsertionStartAlpha");
      objc_msgSend(v7, "setAlpha:");
      if (-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation"))
      {
        v35 = 1.0;
        if (!-[NCNotificationListView _isAnimationStyleDissolve](self, "_isAnimationStyleDissolve"))
        {
          -[NCListAnimationSettings animationScaleWhileGrouping](self->_animationSettings, "animationScaleWhileGrouping");
          v35 = v36;
        }
        memset(&v67, 0, sizeof(v67));
        CGAffineTransformMakeScale(&v67, v35, v35);
        v37 = -[NCNotificationListView _isAnimationStyleDissolve](self, "_isAnimationStyleDissolve");
        v38 = 0.0;
        if (!v37)
        {
          -[NCListAnimationSettings animationTranslation](self->_animationSettings, "animationTranslation");
          v40 = v39;
          v76.origin.x = v9;
          v76.origin.y = v28;
          v76.size.width = v13;
          v76.size.height = v15;
          v38 = v40 + (1.0 - v35) * -0.5 * CGRectGetHeight(v76);
        }
        memset(&v66, 0, sizeof(v66));
        CGAffineTransformMakeTranslation(&v66, 0.0, v38);
        t1 = v67;
        memset(&v65, 0, sizeof(v65));
        t2 = v66;
        CGAffineTransformConcat(&v65, &t1, &t2);
        t1 = v65;
        p_t1 = &t1;
      }
      else
      {
        v45 = -[NCNotificationListView count](self, "count");
        animationSettings = self->_animationSettings;
        if (v45 < 2)
          -[NCListAnimationSettings animationScale](animationSettings, "animationScale");
        else
          -[NCListAnimationSettings animationScaleGroupInsertion](animationSettings, "animationScaleGroupInsertion");
        memset(&v67, 0, sizeof(v67));
        CGAffineTransformMakeScale(&v67, v47, v47);
        v66 = v67;
        p_t1 = &v66;
      }
      objc_msgSend(v7, "setTransform:", p_t1);
    }
    else
    {
      objc_msgSend(v7, "setAlpha:", 1.0);
      if (!-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")
        && !-[NCNotificationListView isPerformingContentRevealAnimation](self, "isPerformingContentRevealAnimation"))
      {
        v42 = -[NCNotificationListView removedViewIndex](self, "removedViewIndex");
        v43 = v28 == 0.0 ? 1 : v20;
        if (v42 && (v43 & 1) == 0)
        {
          v44 = v34[1];
          *(_OWORD *)&v67.a = *v34;
          *(_OWORD *)&v67.c = v44;
          *(_OWORD *)&v67.tx = v34[2];
          -[NCNotificationListView _updateTransformedView:toFrame:withTransform:](self, "_updateTransformedView:toFrame:withTransform:", v7, &v67, v9, v28, v13, v15);
        }
      }
    }
    if (-[NCNotificationListView isHiddenBelowStack](self, "isHiddenBelowStack"))
      v48 = -[NCNotificationListView showContentForGroupedViews](self, "showContentForGroupedViews") ^ 1;
    else
      v48 = 0;
    if (-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")
      || -[NCNotificationListView isPerformingContentRevealAnimation](self, "isPerformingContentRevealAnimation"))
    {
      LOBYTE(v20) = 1;
    }
    else if (!-[NCNotificationListView removedViewIndex](self, "removedViewIndex"))
    {
      LOBYTE(v20) = 1;
    }
    v51 = v34[1];
    *(_OWORD *)&v67.a = *v34;
    *(_OWORD *)&v67.c = v51;
    *(_OWORD *)&v67.tx = v34[2];
    if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v7, &v67, v9, v28, v13, v15, 1.0, *(_QWORD *)&v67.tx, *(_QWORD *)&v67.ty, v51, *(_QWORD *)&v67.a, *(_QWORD *)&v67.b)|| -[NCNotificationListView isPerformingStackVisibilityAnimation](self, "isPerformingStackVisibilityAnimation")|| -[NCNotificationListView isPerformingInteractiveTranslationAnimation](self, "isPerformingInteractiveTranslationAnimation"))
    {
      aBlock[0] = v16;
      aBlock[1] = 3221225472;
      aBlock[2] = __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke_2;
      aBlock[3] = &unk_1E8D1D0C8;
      aBlock[4] = self;
      v55 = v7;
      v56 = v9;
      v57 = v28;
      v58 = v13;
      v59 = v15;
      v60 = 0x3FF0000000000000;
      v61 = v20;
      v62 = v48;
      v49 = _Block_copy(aBlock);
      if (!-[NCNotificationListView isPerformingOverrideLeadingViewHeightAdjustment](self, "isPerformingOverrideLeadingViewHeightAdjustment")|| -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")|| -[NCNotificationListView isPerformingContentRevealAnimation](self, "isPerformingContentRevealAnimation")|| -[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation")|| -[NCNotificationListView isPerformingBottomMarginAdjustmentAnimation](self, "isPerformingBottomMarginAdjustmentAnimation"))
      {
        -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v49, 0);
      }
      else
      {
        +[NCMigrationGatewayFromCAtoC2 performWithoutAnimation:](NCMigrationGatewayFromCAtoC2, "performWithoutAnimation:", v49);
      }

    }
    else
    {
      -[NCNotificationListView _setContentHiddenForView:contentHidden:](self, "_setContentHiddenForView:contentHidden:", v7, v48);
      *(_OWORD *)&v67.a = v53;
      *(_OWORD *)&v67.c = v52;
      *(_OWORD *)&v67.tx = v50;
      -[NCNotificationListView _configureStackDimmingForGroupedView:transform:](self, "_configureStackDimmingForGroupedView:transform:", v7, &v67);
    }
  }

}

uint64_t __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v14 = *MEMORY[0x1E0C9BAA8];
  v15 = *MEMORY[0x1E0C9BAA8];
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v13 = v8;
  v16 = v8;
  v17 = v12;
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v15, v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 80));
  if (*(_BYTE *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_setContentHiddenForView:contentHidden:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 89));
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v14;
  v16 = v13;
  v17 = v12;
  return objc_msgSend(v9, "_configureStackDimmingForGroupedView:transform:", v10, &v15);
}

- (void)_layoutGroupedViewForGroupingLayout:(id)a3 atIndex:(unint64_t)a4 isExistingView:(BOOL)a5 leadingViewHeight:(double)a6 alpha:(double)a7
{
  _BOOL4 v7;
  id v10;
  double width;
  double height;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  id v33;
  void (**v34)(_QWORD);
  double v35;
  int v36;
  void *v37;
  void *v38;
  double v39;
  uint64_t v40;
  double v41;
  double y;
  double x;
  double v44;
  _QWORD aBlock[4];
  id v46;
  NCNotificationListView *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  unint64_t v55;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGRect v61;

  v7 = a5;
  v10 = a3;
  -[NCNotificationListView _frameForViewAtIndex:](self, "_frameForViewAtIndex:", a4);
  y = v61.origin.y;
  x = v61.origin.x;
  width = v61.size.width;
  height = v61.size.height;
  v13 = CGRectGetHeight(v61);
  -[NCNotificationListView groupedOverlapHeightMultiple](self, "groupedOverlapHeightMultiple");
  v15 = v14;
  -[NCNotificationListView _resolvedViewOverlap](self, "_resolvedViewOverlap");
  v17 = v16;
  -[NCNotificationListView interactionTranslationPercentage](self, "interactionTranslationPercentage");
  v19 = v18;
  -[NCListAnimationSettings interactionTranslationOffsetMax](self->_animationSettings, "interactionTranslationOffsetMax");
  v21 = v20;
  v22 = 0.0;
  if (!-[NCNotificationListView isHiddenBelowStack](self, "isHiddenBelowStack")
    && -[NCNotificationListView showStackBelowLeadingView](self, "showStackBelowLeadingView"))
  {
    v22 = (v19 * v21 + v15 * v17) * (double)a4;
  }
  -[NCNotificationListView interactionTranslationPercentage](self, "interactionTranslationPercentage");
  v24 = v23;
  -[NCListAnimationSettings interactionTranslationVerticalOffsetMax](self->_animationSettings, "interactionTranslationVerticalOffsetMax");
  v26 = dbl_1CFD91880[a4 == 1];
  v27 = v22 - v24 * v25 + v41;
  -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
  if (v28 > 0.0)
  {
    -[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight");
    if (v29 < v27)
      v27 = v29;
  }
  memset(&v60.c, 0, 32);
  if (v27 >= v13)
    v30 = v26;
  else
    v30 = v27 / v13;
  *(_OWORD *)&v60.a = 0uLL;
  CGAffineTransformMakeScale(&v60, v26, v30);
  -[NCNotificationListView groupedTranslation](self, "groupedTranslation");
  v31 = v27 - (v30 * 0.5 + 0.5) * v13;
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeTranslation(&v59, v32, v31);
  t1 = v60;
  memset(&v58, 0, sizeof(v58));
  t2 = v59;
  CGAffineTransformConcat(&v58, &t1, &t2);
  t1 = v58;
  if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v10, &t1, x, y, width, height, 1.0))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__NCNotificationListView__layoutGroupedViewForGroupingLayout_atIndex_isExistingView_leadingViewHeight_alpha___block_invoke;
    aBlock[3] = &unk_1E8D1D0F0;
    v33 = v10;
    v46 = v33;
    v47 = self;
    v48 = v40;
    v49 = x;
    v50 = y;
    v51 = width;
    v52 = height;
    v53 = v58;
    v54 = v60;
    v55 = a4;
    v34 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (!-[NCNotificationListView isPerformingOverrideLeadingViewHeightAdjustment](self, "isPerformingOverrideLeadingViewHeightAdjustment")|| -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")|| -[NCNotificationListView isPerformingContentRevealAnimation](self, "isPerformingContentRevealAnimation")|| (-[NCNotificationListView overrideLeadingViewHeight](self, "overrideLeadingViewHeight"), v35 == 0.0))
    {
      LOBYTE(v36) = 0;
      if (!v7)
        goto LABEL_28;
    }
    else
    {
      v36 = !-[NCNotificationListView isPerformingBottomMarginAdjustmentAnimation](self, "isPerformingBottomMarginAdjustmentAnimation");
      if (!v7)
        goto LABEL_28;
    }
    if ((v36 & 1) == 0)
    {
      if (-[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation")
        || -[NCNotificationListView isPerformingContentRevealAnimation](self, "isPerformingContentRevealAnimation")
        || -[NCNotificationListView isPerformingStackVisibilityAnimation](self, "isPerformingStackVisibilityAnimation")
        || -[NCNotificationListView isPerformingInteractiveTranslationAnimation](self, "isPerformingInteractiveTranslationAnimation")|| -[NCNotificationListView removedViewIndex](self, "removedViewIndex") < 3)
      {
        goto LABEL_26;
      }
      -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "count"))
      {
LABEL_25:

LABEL_26:
        -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v34, 0);
LABEL_29:

        goto LABEL_30;
      }
      -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "count"))
      {

        goto LABEL_25;
      }
      if (v33)
      {
        objc_msgSend(v33, "transform");
        v39 = v44;
      }
      else
      {
        v39 = 0.0;
      }

      if (v31 != v39)
        goto LABEL_26;
    }
LABEL_28:
    v34[2](v34);
    goto LABEL_29;
  }
LABEL_30:

}

uint64_t __109__NCNotificationListView__layoutGroupedViewForGroupingLayout_atIndex_isExistingView_leadingViewHeight_alpha___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 72);
  v7 = *(double *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 104);
  v13 = *(_OWORD *)(a1 + 88);
  v14 = v8;
  v15 = *(_OWORD *)(a1 + 120);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v13, v4, v5, v6, v7);
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 152);
  v13 = *(_OWORD *)(a1 + 136);
  v14 = v11;
  v15 = *(_OWORD *)(a1 + 168);
  objc_msgSend(v9, "_configureStackDimmingForGroupedView:transform:", v10, &v13);
  return objc_msgSend(*(id *)(a1 + 40), "_setContentHiddenForGroupedView:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 184));
}

- (void)_setContentHiddenForView:(id)a3 contentHidden:(BOOL)a4
{
  _BOOL8 v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0;
  v6 = v9;
  if (v5)
    v6 = 0;
  objc_msgSend(v6, "notificationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isNotificationContentViewHidden") != v4)
    objc_msgSend(v8, "setNotificationContentViewHidden:", v4);

}

- (void)_setContentHiddenForGroupedView:(id)a3 atIndex:(unint64_t)a4
{
  -[NCNotificationListView _setContentHiddenForView:contentHidden:](self, "_setContentHiddenForView:contentHidden:", a3, a4 != 0);
}

- (void)revealNotificationContentBelowGroupedViewIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", &unk_1E8D5F920);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9 == v4)
  {
    -[NCNotificationListView visibleViews](self, "visibleViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", &unk_1E8D5F938);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationListView _setContentHiddenForView:contentHidden:](self, "_setContentHiddenForView:contentHidden:", v8, 0);
    v6 = v9;
  }

}

- (void)_configureStackDimmingForGroupedView:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  __int128 v11;
  char isKindOfClass;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v6 = a3;
  -[NCNotificationListView visibleViews](self, "visibleViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", &unk_1E8D5F920);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[NCNotificationListView overrideTopViewDimmingTransform](self, "overrideTopViewDimmingTransform");
    v9 = v18;
    *(_OWORD *)&a4->a = v17;
    *(_OWORD *)&a4->c = v9;
    *(_OWORD *)&a4->tx = v19;
  }
  v10 = v6;
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = *(_OWORD *)&a4->c;
    v17 = *(_OWORD *)&a4->a;
    v18 = v11;
    v19 = *(_OWORD *)&a4->tx;
    objc_msgSend(v10, "configureStackDimmingForTransform:", &v17);
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v10 && (isKindOfClass & 1) != 0)
  {
    v13 = v10;
    if (!-[NCNotificationListView _isGrouping](self, "_isGrouping"))
    {
      v14 = MEMORY[0x1E0C9BAA8];
      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&a4->a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&a4->c = v15;
      *(_OWORD *)&a4->tx = *(_OWORD *)(v14 + 32);
    }
    v16 = *(_OWORD *)&a4->c;
    v17 = *(_OWORD *)&a4->a;
    v18 = v16;
    v19 = *(_OWORD *)&a4->tx;
    objc_msgSend(v13, "setOverrideTopViewDimmingTransform:", &v17);

  }
}

- (void)_layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_92);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_2;
  v8[3] = &unk_1E8D1D158;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGRect v36;

  v3 = a2;
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (objc_msgSend(*(id *)(a1 + 32), "showStackBelowLeadingView"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2448), "groupListMaxViewCount");
    v6 = (unint64_t)v5;
  }
  else
  {
    v6 = 1;
  }
  if (v4 >= v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "visibleViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "horizontalInsetMargin");
    v16 = v15;
    if ((objc_msgSend(*(id *)(a1 + 32), "_isAnimationStyleDissolve") & 1) == 0)
    {
      v36.origin.x = v16;
      v36.origin.y = v10;
      v36.size.width = v12;
      v36.size.height = v14;
      v10 = fmax(*(double *)(a1 + 40) - CGRectGetHeight(v36), 0.0);
    }
    objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", v8);
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    if (objc_msgSend(*(id *)(a1 + 32), "_isAnimationStyleDissolve"))
    {
      v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v33 = *MEMORY[0x1E0C9BAA8];
      v34 = v17;
      v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    else
    {
      v18 = *(void **)(a1 + 32);
      v19 = objc_msgSend(v3, "unsignedIntegerValue");
      if (v18)
      {
        objc_msgSend(v18, "_scaleTransformForGroupingAnimationForViewAtIndex:leadingViewHeight:", v19, *(double *)(a1 + 40));
      }
      else
      {
        v34 = 0u;
        v35 = 0u;
        v33 = 0u;
      }
    }
    v20 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_3;
    v24[3] = &unk_1E8D1D078;
    v24[4] = v20;
    v25 = v8;
    v26 = v16;
    v27 = v10;
    v28 = v12;
    v29 = v14;
    v30 = v33;
    v31 = v34;
    v32 = v35;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_4;
    v22[3] = &unk_1E8D1B3A0;
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v3;
    v21 = v8;
    objc_msgSend(v20, "_performRetargetableAnimationForView:animationBlock:completionBlock:", v21, v24, v22);

  }
}

void __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = v8;
  v16 = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v14, v4, v5, v6, v7);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 96);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = v11;
  v16 = *(_OWORD *)(a1 + 112);
  objc_msgSend(v9, "_configureStackDimmingForGroupedView:transform:", v10, &v14);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isAnimationStyleDissolve") & 1) != 0)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "insertedViewIndices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "isPerformingGroupingAnimation");

    if ((v13 & 1) != 0)
      return;
    goto LABEL_4;
  }

}

uint64_t __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeStoredVisibleViewAtIndex:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
}

- (void)setVisibleRect:(CGRect)a3
{
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  CGRect v12;
  CGRect v13;

  if (self->_visibleRectIsBounds)
  {
    -[NCNotificationListView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    x = v4;
    y = v6;
    width = v8;
    height = v10;
  }
  else
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
  }
  -[NCNotificationListView _visibleRect](self, "_visibleRect");
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v12, v13))
  {
    if (!-[NCNotificationListView _animateVisibleRectAdjustmentIfNecessaryWithVisibleRect:](self, "_animateVisibleRectAdjustmentIfNecessaryWithVisibleRect:", x, y, width, height))-[NCNotificationListView _setVisibleRectWithoutAlteringAnimations:](self, "_setVisibleRectWithoutAlteringAnimations:", x, y, width, height);
    -[NCNotificationListView setPerformingVisibleRectAdjustment:](self, "setPerformingVisibleRectAdjustment:", 1);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
    -[NCNotificationListView _visibleRect](self, "_visibleRect");
    -[NCNotificationListView _updateVisibleViewsForUpdatedVisibleRect:](self, "_updateVisibleViewsForUpdatedVisibleRect:");
  }
}

- (CGRect)visibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  if (self->_visibleRectIsBounds)
    -[NCNotificationListView bounds](self, "bounds");
  else
    -[NCNotificationListView _visibleRect](self, "_visibleRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_setVisibleRectWithoutAlteringAnimations:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NCNotificationListView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("visibleRect"));
  self->__visibleRect.origin.x = x;
  self->__visibleRect.origin.y = y;
  self->__visibleRect.size.width = width;
  self->__visibleRect.size.height = height;
  -[NCNotificationListView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("visibleRect"));
}

- (void)setRevealPercentage:(double)a3
{
  void *v5;
  int v6;

  if (_NCReactiveListUI())
  {
    +[NCUserNotificationsUIKitDefaults standardDefaults](NCUserNotificationsUIKitDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldUseReactiveList");

    if (v6)
      a3 = 1.0;
  }
  if (vabdd_f64(self->_revealPercentage, a3) >= 2.22044605e-16)
  {
    self->_revealPercentage = a3;
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRevealed:(BOOL)a3
{
  if (self->_revealed != a3)
  {
    self->_revealed = a3;
    -[NCNotificationListView setPerformingRevealAnimation:](self, "setPerformingRevealAnimation:", 1);
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPerformingContentRevealAnimation:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[NCNotificationListView isNotificationListViewCurrentlyVisible](self, "isNotificationListViewCurrentlyVisible");
  self->_performingContentRevealAnimation = v5 && v3;
  if (v5 && v3)
  {
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSubviewPerformingGroupingAnimation:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = -[NCNotificationListView isNotificationListViewCurrentlyVisible](self, "isNotificationListViewCurrentlyVisible");
  self->_subviewPerformingGroupingAnimation = v5 && v3;
  if (v5 && v3)
  {
    -[NCNotificationListView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubviewPerformingGroupingAnimation:", 1);

    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGrouped:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;

  if (self->_grouped != a3)
  {
    v3 = a3;
    v5 = -[NCNotificationListView isNotificationListViewCurrentlyVisible](self, "isNotificationListViewCurrentlyVisible");
    -[NCNotificationListView setGroupedTranslation:](self, "setGroupedTranslation:", 0.0);
    -[NCNotificationListView setPerformingGroupingAnimation:](self, "setPerformingGroupingAnimation:", v5);
    -[NCNotificationListView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubviewPerformingGroupingAnimation:", v5);

    self->_grouped = v3;
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView _updateStackedViewsForGrouping:](self, "_updateStackedViewsForGrouping:", v3);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)insertViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  v4 = a4;
  -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "copy");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__NCNotificationListView_insertViewAtIndex_animated___block_invoke;
  v12[3] = &unk_1E8D1D180;
  v12[4] = self;
  v12[5] = a3;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);
  if (v4
    && -[NCNotificationListView isNotificationListViewCurrentlyVisible](self, "isNotificationListViewCurrentlyVisible"))
  {
    -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  -[NCNotificationListView _updateStoredVisibleViewsForViewInsertedAtIndex:](self, "_updateStoredVisibleViewsForViewInsertedAtIndex:", a3);
  -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
  -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  -[NCNotificationListView superview](self, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

void __53__NCNotificationListView_insertViewAtIndex_animated___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v3 > *(_QWORD *)(a1 + 40))
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "insertedViewIndices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v8);

    objc_msgSend(*(id *)(a1 + 32), "insertedViewIndices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)removeViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  -[NCNotificationListView removeViewAtIndex:animated:isHorizontallyDisplaced:](self, "removeViewAtIndex:animated:isHorizontallyDisplaced:", a3, a4, 0);
}

- (void)removeViewAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v9;

  v5 = a5;
  v6 = a4;
  -[NCNotificationListView visibleViewAtIndex:](self, "visibleViewAtIndex:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView _updateStoredVisibleViewsForViewRemovedAtIndex:](self, "_updateStoredVisibleViewsForViewRemovedAtIndex:", a3);
  if (v9)
  {
    if (v6
      && -[NCNotificationListView isNotificationListViewCurrentlyVisible](self, "isNotificationListViewCurrentlyVisible"))
    {
      -[NCNotificationListView _performRemovalAnimationForView:isHorizontallyDisplaced:](self, "_performRemovalAnimationForView:isHorizontallyDisplaced:", v9, v5);
    }
    else
    {
      objc_msgSend(v9, "removeFromSuperview");
      -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", v9);
    }
  }
  -[NCNotificationListView setRemovedViewIndex:](self, "setRemovedViewIndex:", a3);
  if (v5)
    -[NCNotificationListView _configureClippingIfNecessary](self, "_configureClippingIfNecessary");
  -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
  -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");

}

- (void)reloadViewAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[NCNotificationListView isNotificationListViewCurrentlyVisible](self, "isNotificationListViewCurrentlyVisible"))
  {
    -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
  -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  -[NCNotificationListView superview](self, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)invalidateData
{
  UIView *headerView;
  UIView *v4;
  UIView *footerView;
  UIView *v6;
  UIView *backgroundView;
  UIView *v8;
  UIView *hoverView;
  UIView *v10;

  -[NCNotificationListView _removeAllStoredVisibleViews](self, "_removeAllStoredVisibleViews");
  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", self->_headerView);
    v4 = self->_headerView;
    self->_headerView = 0;

  }
  footerView = self->_footerView;
  if (footerView)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", self->_footerView);
    v6 = self->_footerView;
    self->_footerView = 0;

  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    v8 = self->_backgroundView;
    self->_backgroundView = 0;

  }
  hoverView = self->_hoverView;
  if (hoverView)
  {
    -[UIView removeFromSuperview](hoverView, "removeFromSuperview");
    v10 = self->_hoverView;
    self->_hoverView = 0;

  }
  -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
  -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
}

- (void)reloadHeaderView
{
  UIView *v3;
  UIView *headerView;
  uint64_t v5;
  UIView *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(id *);
  void *v10;
  UIView *v11;
  NCNotificationListView *v12;
  id v13;
  _QWORD v14[4];
  UIView *v15;
  NCNotificationListView *v16;
  id location;

  if (self->_headerView)
  {
    -[NCNotificationListView setPerformingHeaderReloadAnimation:](self, "setPerformingHeaderReloadAnimation:", 1);
    v3 = self->_headerView;
    headerView = self->_headerView;
    self->_headerView = 0;

    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__NCNotificationListView_reloadHeaderView__block_invoke;
    v14[3] = &unk_1E8D1B3A0;
    v15 = v3;
    v16 = self;
    v7 = v5;
    v8 = 3221225472;
    v9 = __42__NCNotificationListView_reloadHeaderView__block_invoke_2;
    v10 = &unk_1E8D1D1A8;
    v6 = v15;
    v11 = v6;
    objc_copyWeak(&v13, &location);
    v12 = self;
    -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v14, &v7);
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0, v7, v8, v9, v10);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
}

uint64_t __42__NCNotificationListView_reloadHeaderView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  CGFloat v7;
  CGAffineTransform v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerViewRemoveAnimationTransform");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerViewRemoveAnimationTransform");
  CGAffineTransformMakeScale(&v9, v5, v7);
  objc_msgSend(v2, "setTransform:", &v9);

  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __42__NCNotificationListView_reloadHeaderView__block_invoke_2(id *a1)
{
  id v2;
  id WeakRetained;
  id v4;
  id v5;
  __int128 v6;
  _OWORD v7[3];

  v2 = a1[4];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "headerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 != v4)
  {
    objc_msgSend(a1[4], "removeFromSuperview");
    objc_msgSend(a1[4], "setAlpha:", 1.0);
    v5 = a1[4];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7[0] = *MEMORY[0x1E0C9BAA8];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v5, "setTransform:", v7);
    objc_msgSend(a1[5], "_recycleViewIfNecessary:", a1[4]);
  }
}

- (void)reloadFooterViewAnimated:(BOOL)a3
{
  UIView *footerView;
  _BOOL4 v4;
  UIView *v6;
  UIView *v7;
  uint64_t v8;
  _QWORD v9[4];
  UIView *v10;
  NCNotificationListView *v11;
  id v12;
  _QWORD v13[4];
  UIView *v14;
  id location;

  footerView = self->_footerView;
  if (footerView)
  {
    v4 = a3;
    v6 = footerView;
    v7 = self->_footerView;
    self->_footerView = 0;

    objc_initWeak(&location, self);
    if (v4)
    {
      v8 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke;
      v13[3] = &unk_1E8D1B568;
      v14 = v6;
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke_2;
      v9[3] = &unk_1E8D1D1A8;
      v10 = v14;
      objc_copyWeak(&v12, &location);
      v11 = self;
      -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v13, v9);
      objc_destroyWeak(&v12);

    }
    else
    {
      -[UIView removeFromSuperview](v6, "removeFromSuperview");
      -[UIView setAlpha:](v6, "setAlpha:", 1.0);
      -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", v6);
    }
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
    objc_destroyWeak(&location);

  }
}

uint64_t __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke_2(id *a1)
{
  id v2;
  id WeakRetained;
  id v4;

  v2 = a1[4];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "footerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 != v4)
  {
    objc_msgSend(a1[4], "removeFromSuperview");
    objc_msgSend(a1[4], "setAlpha:", 1.0);
    objc_msgSend(a1[5], "_recycleViewIfNecessary:", a1[4]);
  }
}

- (void)reloadHoverView
{
  UIView *hoverView;
  UIView *v4;

  hoverView = self->_hoverView;
  if (hoverView)
  {
    self->_hoverView = 0;
    v4 = hoverView;

    -[UIView removeFromSuperview](v4, "removeFromSuperview");
    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", v4);

    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)recycleVisibleViews
{
  UIView *headerView;
  UIView *v4;
  UIView *footerView;
  UIView *v6;
  UIView *backgroundView;
  UIView *v8;

  -[NCNotificationListView _removeAllStoredVisibleViews](self, "_removeAllStoredVisibleViews");
  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", self->_headerView);
    v4 = self->_headerView;
    self->_headerView = 0;

  }
  footerView = self->_footerView;
  if (footerView)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", self->_footerView);
    v6 = self->_footerView;
    self->_footerView = 0;

  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", self->_backgroundView);
    v8 = self->_backgroundView;
    self->_backgroundView = 0;

  }
}

- (unint64_t)count
{
  void *v3;
  unint64_t v4;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notificationListViewNumberOfItems:", self);

  return v4;
}

- (void)setActiveRevealTransitioning:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_activeRevealTransitioning != a3)
  {
    v3 = a3;
    self->_activeRevealTransitioning = a3;
    -[NCNotificationListView setPerformingRevealTransitionAnimation:](self, "setPerformingRevealTransitionAnimation:", 1);
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
    if (v3)
      -[NCNotificationListView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (double)layoutOffsetForViewAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;

  -[NCNotificationListView _initialLayoutOffset](self, "_initialLayoutOffset");
  v6 = v5;
  if (-[NCNotificationListView count](self, "count") > a3)
  {
    -[NCNotificationListView dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight");
    v8 = 0.0;
    if (v9 > 0.0)
    {
      -[NCNotificationListView _headerViewHeight](self, "_headerViewHeight");
      v11 = v10;
      -[NCListAnimationSettings viewSpacing](self->_animationSettings, "viewSpacing");
      v8 = v11 + v12;
    }
    v6 = v6 + v8;
    if (-[NCNotificationListView _isShowingFeaturedLeadingViews](self, "_isShowingFeaturedLeadingViews"))
    {
      if (-[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") <= a3)
      {
        -[NCNotificationListView _heightForFeaturedLeadingView](self, "_heightForFeaturedLeadingView");
        v14 = v6 + v13;
        -[NCListAnimationSettings viewSpacing](self->_animationSettings, "viewSpacing");
        v6 = v14 + v15;
      }
      v16 = -[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews");
    }
    else
    {
      v16 = 0;
    }
    -[NCNotificationListView bounds](self, "bounds");
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    if (v16 < a3)
    {
      v18 = v17;
      do
      {
        objc_msgSend(v7, "notificationListView:heightForItemAtIndex:withWidth:", self, v16, v18);
        if (v19 > 0.0)
        {
          v20 = v19;
          if (!v16)
          {
            -[NCNotificationListView _topSpacingForItemAtIndex:](self, "_topSpacingForItemAtIndex:", 0);
            v6 = v6 + v21;
          }
          v22 = -[NCNotificationListView isRevealed](self, "isRevealed");
          v23 = 0.0;
          if (!v22)
            -[NCNotificationListView _positionOffsetForRevealHintingForItemAtIndex:](self, "_positionOffsetForRevealHintingForItemAtIndex:", v16, 0.0);
          v24 = v20 + v6 + v23;
          -[NCNotificationListView _bottomSpacingForItemAtIndex:](self, "_bottomSpacingForItemAtIndex:", v16);
          v6 = v24 + v25;
        }
        ++v16;
      }
      while (a3 != v16);
    }

  }
  return v6;
}

- (BOOL)isVisibleForViewAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  if (-[NCNotificationListView count](self, "count") <= a3)
    return 0;
  -[NCNotificationListView layoutOffsetForViewAtIndex:](self, "layoutOffsetForViewAtIndex:", a3);
  v6 = v5;
  -[NCNotificationListView dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  objc_msgSend(v7, "notificationListView:heightForItemAtIndex:withWidth:", self, a3);
  v9 = v8;

  -[NCNotificationListView visibleRect](self, "visibleRect");
  if (v6 >= CGRectGetMaxY(v11))
    return 0;
  -[NCNotificationListView visibleRect](self, "visibleRect");
  return v6 + v9 > CGRectGetMinY(v12);
}

- (void)updateSubviewTranslation:(double)a3
{
  if (!-[NCNotificationListView isGrouped](self, "isGrouped")
    || -[NCNotificationListView isPerformingGroupingAnimation](self, "isPerformingGroupingAnimation"))
  {
    a3 = 0.0;
  }
  -[NCNotificationListView setGroupedTranslation:](self, "setGroupedTranslation:", a3);
}

- (void)setHiddenBelowStack:(BOOL)a3
{
  if (self->_hiddenBelowStack != a3)
  {
    self->_hiddenBelowStack = a3;
    self->_performingStackVisibilityAnimation = 1;
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0);
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverrideTopViewDimmingTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_overrideTopViewDimmingTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  __int128 v12;
  CGAffineTransform v13;
  CGAffineTransform t1;

  p_overrideTopViewDimmingTransform = &self->_overrideTopViewDimmingTransform;
  v6 = *(_OWORD *)&self->_overrideTopViewDimmingTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_overrideTopViewDimmingTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_overrideTopViewDimmingTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v13))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_overrideTopViewDimmingTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_overrideTopViewDimmingTransform->tx = v9;
    *(_OWORD *)&p_overrideTopViewDimmingTransform->a = v8;
    -[NCNotificationListView visibleViews](self, "visibleViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", &unk_1E8D5F920);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(_OWORD *)&a3->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&t1.c = v12;
      *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
      -[NCNotificationListView _configureStackDimmingForGroupedView:transform:](self, "_configureStackDimmingForGroupedView:transform:", v11, &t1);
    }

  }
}

- (void)setFeaturedLeadingViewOcclusionTranslation:(double)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", &unk_1E8D5F920);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v16;
  if (v16)
  {
    v7 = -[NCNotificationListView _isFeaturedLeadingViewAtIndex:](self, "_isFeaturedLeadingViewAtIndex:", 0);
    v6 = v16;
    if (v7)
    {
      -[NCNotificationListView _widthForFeaturedLeadingView](self, "_widthForFeaturedLeadingView");
      v9 = v8;
      v10 = -[NCNotificationListView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v11 = -a3;
      if (!v10)
        v11 = a3;
      v12 = v9 + v11;
      -[NCListAnimationSettings featuredViewOcclusionMinimumAlpha](self->_animationSettings, "featuredViewOcclusionMinimumAlpha");
      v14 = v13;
      -[NCListAnimationSettings featuredViewOcclusionMinimumAlpha](self->_animationSettings, "featuredViewOcclusionMinimumAlpha");
      objc_msgSend(v16, "setAlpha:", v14 + (1.0 - v15) * (v12 / v9));
      v6 = v16;
    }
  }

}

- (void)setShowContentForGroupedViews:(BOOL)a3
{
  if (self->_showContentForGroupedViews != a3)
  {
    self->_showContentForGroupedViews = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setInteractionTranslationPercentage:(double)a3
{
  if (vabdd_f64(self->_interactionTranslationPercentage, a3) >= 2.22044605e-16)
  {
    -[NCNotificationListView setPerformingInteractiveTranslationAnimation:](self, "setPerformingInteractiveTranslationAnimation:", 1);
    self->_interactionTranslationPercentage = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVisibleRectBottomMarginForRollUnder:(double)a3
{
  if (vabdd_f64(a3, self->_visibleRectBottomMarginForRollUnder) >= 2.22044605e-16)
  {
    -[NCNotificationListView setPerformingBottomMarginAdjustmentAnimation:](self, "setPerformingBottomMarginAdjustmentAnimation:", 1);
    self->_visibleRectBottomMarginForRollUnder = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setInteractionTranslation:(double)a3
{
  if (vabdd_f64(a3, self->_interactionTranslation) >= 2.22044605e-16)
  {
    -[NCNotificationListView setPerformingInteractiveTranslationAnimation:](self, "setPerformingInteractiveTranslationAnimation:", 1);
    self->_interactionTranslation = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setInteractionVelocity:(double)a3
{
  if (vabdd_f64(a3, self->_interactionVelocity) >= 2.22044605e-16)
  {
    -[NCNotificationListView setPerformingInteractionVelocityAnimation:](self, "setPerformingInteractionVelocityAnimation:", 1);
    self->_interactionVelocity = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isRolledUnderView:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v6 = a3;
  -[NCNotificationListView layoutOffsetForViewAtIndex:](self, "layoutOffsetForViewAtIndex:", a4);
  v8 = v7;
  -[NCNotificationListView dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, a4);
  v11 = v10;

  LOBYTE(a4) = -[NCNotificationListView _shouldRollUnderView:withHeight:layoutOffset:](self, "_shouldRollUnderView:withHeight:layoutOffset:", v6, v11, v8);
  return a4;
}

- (void)setSublistsRevealed:(BOOL)a3
{
  if (self->_sublistsRevealed != a3)
  {
    self->_sublistsRevealed = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverrideLeadingViewHeight:(double)a3
{
  if (vabdd_f64(self->_overrideLeadingViewHeight, a3) >= 2.22044605e-16)
  {
    -[NCNotificationListView setPerformingOverrideLeadingViewHeightAdjustment:](self, "setPerformingOverrideLeadingViewHeightAdjustment:", 1);
    self->_overrideLeadingViewHeight = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumLeadingViewHeight:(double)a3
{
  if (vabdd_f64(self->_maximumLeadingViewHeight, a3) >= 2.22044605e-16)
  {
    self->_maximumLeadingViewHeight = a3;
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)visibleViewAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isVisibleView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (void)_setVisibleView:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a3;
    -[NCNotificationListView visibleViews](self, "visibleViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

    -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "updateBottomViewsRollUnder");
  }
}

- (void)_updateStoredVisibleViewsForViewInsertedAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_97_0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__NCNotificationListView__updateStoredVisibleViewsForViewInsertedAtIndex___block_invoke_2;
  v9[3] = &unk_1E8D1D158;
  v9[4] = self;
  v9[5] = a3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

uint64_t __74__NCNotificationListView__updateStoredVisibleViewsForViewInsertedAtIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __74__NCNotificationListView__updateStoredVisibleViewsForViewInsertedAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "unsignedIntegerValue");
  if (v3 >= *(_QWORD *)(a1 + 40))
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "visibleViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "visibleViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v10);

    objc_msgSend(*(id *)(a1 + 32), "visibleViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v9);

  }
}

- (void)_updateStoredVisibleViewsForViewRemovedAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_98);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__NCNotificationListView__updateStoredVisibleViewsForViewRemovedAtIndex___block_invoke_2;
  v11[3] = &unk_1E8D1D158;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __73__NCNotificationListView__updateStoredVisibleViewsForViewRemovedAtIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __73__NCNotificationListView__updateStoredVisibleViewsForViewRemovedAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "unsignedIntegerValue");
  if (v3 >= *(_QWORD *)(a1 + 40))
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "visibleViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "visibleViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v10);

    objc_msgSend(*(id *)(a1 + 32), "visibleViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v9);

  }
}

- (void)_removeStoredVisibleViewAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "removeFromSuperview");
    -[NCNotificationListView visibleViews](self, "visibleViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", v9);
  }

}

- (void)_removeAllStoredVisibleViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NCNotificationListView *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NCNotificationListView visibleViews](self, "visibleViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "superview");
        v10 = (NCNotificationListView *)objc_claimAutoreleasedReturnValue();

        if (v10 == self)
        {
          objc_msgSend(v9, "removeFromSuperview");
          -[NCNotificationListView _recycleViewIfNecessary:](self, "_recycleViewIfNecessary:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (void)_updateVisibleViewsForUpdatedVisibleRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  double MaxY;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double MinY;
  CGFloat rect;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v42 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NCNotificationListView visibleViews](self, "visibleViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        -[NCNotificationListView _listViewForView:](self, "_listViewForView:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "frame");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
          -[NCNotificationListView visibleRectBottomMarginForRollUnder](self, "visibleRectBottomMarginForRollUnder");
          UIRectInset();
          x = v43.origin.x;
          y = v43.origin.y;
          width = v43.size.width;
          height = v43.size.height;
          v52.origin.x = v13;
          v52.origin.y = v15;
          v52.size.width = v17;
          v52.size.height = v19;
          if (CGRectIntersectsRect(v43, v52))
          {
            v44.origin.x = x;
            v44.origin.y = y;
            v44.size.width = width;
            v44.size.height = height;
            v53.origin.x = v13;
            v53.origin.y = v15;
            v53.size.width = v17;
            rect = v19;
            v53.size.height = v19;
            v45 = CGRectIntersection(v44, v53);
            v34 = v45.size.width;
            v35 = v45.origin.x;
            v33 = v45.origin.y;
            v24 = v45.size.height;
            if (objc_msgSend(v11, "isPerformingGroupingAnimation"))
            {
              v46.origin.x = x;
              v46.origin.y = y;
              v46.size.width = width;
              v46.size.height = height;
              MaxY = CGRectGetMaxY(v46);
              v47.origin.x = v13;
              v47.origin.y = v15;
              v47.size.width = v17;
              v47.size.height = rect;
              v26 = MaxY - CGRectGetMinY(v47);
              if (v24 < v26)
                v24 = v26;
            }
            v27 = v34;
            v28 = v33 - v15;
            v29 = v35;
          }
          else
          {
            v48.origin.x = v13;
            v48.origin.y = v15;
            v48.size.width = v17;
            v48.size.height = v19;
            v36 = v17;
            v30 = v19;
            MinY = CGRectGetMinY(v48);
            v49.origin.x = x;
            v49.origin.y = y;
            v49.size.width = width;
            v49.size.height = height;
            v29 = 0.0;
            v28 = 0.0;
            if (MinY <= CGRectGetMaxY(v49))
            {
              v50.origin.x = v13;
              v50.origin.y = v15;
              v50.size.width = v36;
              v50.size.height = v30;
              v28 = CGRectGetHeight(v50);
            }
            v51.origin.x = v13;
            v51.origin.y = v15;
            v51.size.width = v36;
            v51.size.height = v30;
            v27 = CGRectGetWidth(v51);
            v24 = 0.0;
          }
          objc_msgSend(v11, "setVisibleRect:", v29, v28, v27, v24, *(_QWORD *)&rect);
          if (-[NCNotificationListView isPerformingBottomMarginAdjustmentAnimation](self, "isPerformingBottomMarginAdjustmentAnimation"))
          {
            objc_msgSend(v11, "setPerformingBottomMarginAdjustmentAnimation:", 1);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v7);
  }

}

- (BOOL)_isTopSubviewHeightLessThanVisibleRect
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  BOOL v22;
  CGRect v24;
  CGRect v25;

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_1E8D5F920);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NCNotificationListView visibleRect](self, "visibleRect");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v24.origin.x = v6;
    v24.origin.y = v8;
    v24.size.width = v10;
    v24.size.height = v12;
    Height = CGRectGetHeight(v24);
    v25.origin.x = v14;
    v25.origin.y = v16;
    v25.size.width = v18;
    v25.size.height = v20;
    v22 = Height < CGRectGetHeight(v25);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)_setRevealAlphaForView:(id)a3 desiredAlpha:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v9;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isRevealed") & 1) == 0 && objc_msgSend(v7, "_isGrouping"))
  {
    objc_msgSend(v7, "revealPercentage");
    a4 = v8;
  }
  objc_msgSend(v9, "setAlpha:", a4);

}

- (void)_performInsertionAnimationForView:(id)a3
{
  id v4;
  __int128 v5;
  CGAffineTransform *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  _BOOL4 v10;
  double v11;
  NCListAnimationSettings *animationSettings;
  id v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[4];
  id v18;
  NCNotificationListView *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v4 = a3;
  if (-[NCNotificationListView groupingAnimationStyle](self, "groupingAnimationStyle") == 1)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v21.c = v5;
    *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v6 = &v21;
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    -[NCListAnimationSettings animationScale](self->_animationSettings, "animationScale");
    v8 = v7;
    -[NCListAnimationSettings animationScale](self->_animationSettings, "animationScale");
    CGAffineTransformMakeScale(&v21, v8, v9);
    v20 = v21;
    v6 = &v20;
  }
  objc_msgSend(v4, "setTransform:", v6);
  v10 = -[NCNotificationListView isRevealed](self, "isRevealed");
  v11 = 0.0;
  if (v10)
    -[NCListAnimationSettings animationInsertionStartAlpha](self->_animationSettings, "animationInsertionStartAlpha", 0.0);
  objc_msgSend(v4, "setAlpha:", v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__NCNotificationListView__performInsertionAnimationForView___block_invoke;
  v17[3] = &unk_1E8D1B3A0;
  v18 = v4;
  v19 = self;
  animationSettings = self->_animationSettings;
  v13 = v4;
  -[NCListAnimationSettings insertionTension](animationSettings, "insertionTension", v17[0], 3221225472, __60__NCNotificationListView__performInsertionAnimationForView___block_invoke, &unk_1E8D1B3A0);
  v15 = v14;
  -[NCListAnimationSettings insertionFriction](self->_animationSettings, "insertionFriction");
  -[NCNotificationListView _performViewAnimationBlock:completionBlock:withTension:friction:](self, "_performViewAnimationBlock:completionBlock:withTension:friction:", v17, 0, v15, v16);

}

uint64_t __60__NCNotificationListView__performInsertionAnimationForView___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  int v5;
  double v6;
  _OWORD v8[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v8);
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 40), "isRevealed");
  v6 = 0.0;
  if (v5)
    v6 = 1.0;
  return objc_msgSend(v4, "setAlpha:", v6);
}

- (void)_performRemovalAnimationForView:(id)a3 isHorizontallyDisplaced:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NCNotificationListView *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;
  id location;

  v6 = a3;
  -[NCNotificationListView dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView setPerformingRemovalAnimation:](self, "setPerformingRemovalAnimation:", 1);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__NCNotificationListView__performRemovalAnimationForView_isHorizontallyDisplaced___block_invoke;
  v17[3] = &unk_1E8D1D210;
  v9 = v6;
  v18 = v9;
  objc_copyWeak(&v19, &location);
  v20 = a4;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __82__NCNotificationListView__performRemovalAnimationForView_isHorizontallyDisplaced___block_invoke_2;
  v12[3] = &unk_1E8D1D238;
  objc_copyWeak(&v16, &location);
  v10 = v9;
  v13 = v10;
  v14 = self;
  v11 = v7;
  v15 = v11;
  -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v17, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __82__NCNotificationListView__performRemovalAnimationForView_isHorizontallyDisplaced___block_invoke(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  BOOL v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  void *v25;
  CGAffineTransform v26;
  CGAffineTransform t1;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "_isAnimationStyleDissolve") & 1) != 0)
  {
    v11 = *(void **)(a1 + 32);
    v12 = 0.0;
    goto LABEL_25;
  }
  if (!*(_BYTE *)(a1 + 48) || (v13 = 1.0, objc_msgSend(WeakRetained, "isPerformingGroupingAnimation")))
  {
    objc_msgSend(WeakRetained, "animationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "animationScaleWhileGrouping");
    v13 = v15;

  }
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeScale(&v30, v13, v13);
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(WeakRetained, "_isLayoutFromBottomUp"))
  {
    if (!objc_msgSend(WeakRetained, "isGrouped"))
    {
      if ((objc_msgSend(WeakRetained, "isPerformingGroupingAnimation") & 1) != 0)
        goto LABEL_12;
      goto LABEL_17;
    }
    v16 = objc_msgSend(WeakRetained, "count") == 0;
  }
  else
  {
    v16 = 0;
  }
  if ((objc_msgSend(WeakRetained, "isPerformingGroupingAnimation") & 1) != 0)
  {
LABEL_12:
    objc_msgSend(WeakRetained, "animationSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "animationTranslationWhileGrouping");
    v19 = v18;
    v31.origin.x = v3;
    v31.origin.y = v5;
    v31.size.width = v7;
    v31.size.height = v9;
    v20 = v19 + (1.0 - v13) * -0.5 * CGRectGetHeight(v31);
LABEL_15:

    goto LABEL_18;
  }
  if (!v16)
  {
    objc_msgSend(WeakRetained, "animationSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "animationTranslation");
    v20 = -v21;
    goto LABEL_15;
  }
LABEL_17:
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v20 = -CGRectGetHeight(v32);
LABEL_18:
  v22 = 0.0;
  if (*(_BYTE *)(a1 + 48) && (objc_msgSend(WeakRetained, "isPerformingGroupingAnimation") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "bounds");
    v22 = CGRectGetWidth(v33) * 1.5;
  }
  v23 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection");
  v24 = -v22;
  memset(&v29.c, 0, 32);
  if (v23)
    v24 = v22;
  *(_OWORD *)&v29.a = 0uLL;
  CGAffineTransformMakeTranslation(&v29, v24, v20);
  t1 = v30;
  memset(&v28, 0, sizeof(v28));
  v26 = v29;
  CGAffineTransformConcat(&v28, &t1, &v26);
  v25 = *(void **)(a1 + 32);
  t1 = v28;
  objc_msgSend(v25, "setTransform:", &t1);
  v11 = *(void **)(a1 + 32);
  v12 = 1.0;
  if (!*(_BYTE *)(a1 + 48))
    v12 = 0.0;
LABEL_25:
  objc_msgSend(v11, "setAlpha:", v12);

}

void __82__NCNotificationListView__performRemovalAnimationForView_isHorizontallyDisplaced___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  char v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];

  v2 = *MEMORY[0x1E0DC5F90];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F90]))
  {
    LOWORD(v8[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_DISMISSAL_END", " enableTelemetry=YES ", (uint8_t *)v8, 2u);
  }
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == WeakRetained)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "_isVisibleView:", *(_QWORD *)(a1 + 32));

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
      v6 = *(void **)(a1 + 32);
      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v8[0] = *MEMORY[0x1E0C9BAA8];
      v8[1] = v7;
      v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v6, "setTransform:", v8);
      objc_msgSend(*(id *)(a1 + 40), "_recycleViewIfNecessary:withDataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "setPerformingRemovalAnimation:", 0);
  objc_msgSend(WeakRetained, "_configureClippingIfNecessary");

}

- (double)_animationTension
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[NCListAnimationSettings animationTension](self->_animationSettings, "animationTension");
  v4 = v3;
  if (-[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation")
    || -[NCNotificationListView isRevealTransitionScrolling](self, "isRevealTransitionScrolling"))
  {
    -[NCNotificationListView _adjustedTensionForRevealAnimation](self, "_adjustedTensionForRevealAnimation");
  }
  else if (-[NCNotificationListView isPerformingInteractionVelocityAnimation](self, "isPerformingInteractionVelocityAnimation"))
  {
    -[NCListAnimationSettings animationTension](self->_animationSettings, "animationTension");
    v7 = v6;
    -[NCListAnimationSettings animationTensionVelocityFactor](self->_animationSettings, "animationTensionVelocityFactor");
    v9 = v8;
    -[NCNotificationListView interactionVelocity](self, "interactionVelocity");
    return v7 + v9 * v10;
  }
  else
  {
    return v4;
  }
  return result;
}

- (double)_animationFriction
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[NCListAnimationSettings animationFriction](self->_animationSettings, "animationFriction");
  v4 = v3;
  if (-[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation")
    || -[NCNotificationListView isRevealTransitionScrolling](self, "isRevealTransitionScrolling"))
  {
    -[NCNotificationListView _adjustedFrictionForRevealAnimation](self, "_adjustedFrictionForRevealAnimation");
  }
  else if (-[NCNotificationListView isPerformingInteractionVelocityAnimation](self, "isPerformingInteractionVelocityAnimation"))
  {
    -[NCListAnimationSettings animationFriction](self->_animationSettings, "animationFriction");
    v7 = v6;
    -[NCListAnimationSettings animationFrictionVelocityFactor](self->_animationSettings, "animationFrictionVelocityFactor");
    v9 = v8;
    -[NCNotificationListView interactionVelocity](self, "interactionVelocity");
    return v7 + v9 * v10;
  }
  else
  {
    return v4;
  }
  return result;
}

- (void)_performViewAnimationBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v6 = a4;
  v10 = a3;
  -[NCNotificationListView _animationTension](self, "_animationTension");
  v8 = v7;
  -[NCNotificationListView _animationFriction](self, "_animationFriction");
  -[NCNotificationListView _performViewAnimationBlock:completionBlock:withTension:friction:](self, "_performViewAnimationBlock:completionBlock:withTension:friction:", v10, v6, v8, v9);

}

- (void)_performAnimationForView:(id)a3 atIndex:(unint64_t)a4 animationBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[NCNotificationListView isPerformingRevealAnimation](self, "isPerformingRevealAnimation"))
  {
    -[NCNotificationListView _revealAnimationDelayForObjectAtIndex:](self, "_revealAnimationDelayForObjectAtIndex:", a4);
    v14 = v13;
    -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v10);

    v16 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock___block_invoke;
    block[3] = &unk_1E8D1D288;
    block[4] = self;
    v29 = v11;
    v30 = v12;
    v28 = v10;
    dispatch_after(v16, MEMORY[0x1E0C80D38], block);

    v17 = v29;
LABEL_5:

    goto LABEL_6;
  }
  -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v10);

  if ((v19 & 1) == 0)
  {
    -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v10);

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __90__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock___block_invoke_3;
    v24[3] = &unk_1E8D1D260;
    v26 = v12;
    v24[4] = self;
    v25 = v10;
    -[NCListAnimationSettings animationTension](self->_animationSettings, "animationTension");
    v22 = v21;
    -[NCListAnimationSettings animationFriction](self->_animationSettings, "animationFriction");
    -[NCNotificationListView _performViewAnimationBlock:completionBlock:withTension:friction:](self, "_performViewAnimationBlock:completionBlock:withTension:friction:", v11, v24, v22, v23);

    v17 = v26;
    goto LABEL_5;
  }
LABEL_6:

}

void __90__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock___block_invoke_2;
  v10[3] = &unk_1E8D1D260;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v4;
  v10[4] = v5;
  v11 = v6;
  objc_msgSend(*(id *)(a1 + 32), "_adjustedTensionForRevealAnimation");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "_adjustedFrictionForRevealAnimation");
  objc_msgSend(v2, "_performViewAnimationBlock:completionBlock:withTension:friction:", v3, v10, v8, v9);

}

void __90__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "viewsPerformingAnimation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __90__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "viewsPerformingAnimation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)_performViewAnimationBlock:(id)a3 completionBlock:(id)a4 withTension:(double)a5 friction:(double)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v15 = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__NCNotificationListView__performViewAnimationBlock_completionBlock_withTension_friction___block_invoke;
  v16[3] = &unk_1E8D1B808;
  v17 = v9;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__NCNotificationListView__performViewAnimationBlock_completionBlock_withTension_friction___block_invoke_2;
  v14[3] = &unk_1E8D1B148;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v16, v14, a5, a6);

}

void __90__NCNotificationListView__performViewAnimationBlock_completionBlock_withTension_friction___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "nc_applyHighFrameRate:");
    v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v1[2]();

  }
}

uint64_t __90__NCNotificationListView__performViewAnimationBlock_completionBlock_withTension_friction___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performRetargetableAnimationForView:(id)a3 animationBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id *v15;
  id *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  _QWORD v23[2];
  id v24;
  _QWORD v25[4];
  _QWORD v26[2];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(MEMORY[0x1E0DC3F10], "nc_applyHighFrameRate:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__NCNotificationListView__performRetargetableAnimationForView_animationBlock_completionBlock___block_invoke_2;
    v22[3] = &unk_1E8D1D2B0;
    v15 = &v24;
    v23[1] = self;
    v24 = v10;
    v16 = (id *)v23;
    v23[0] = v8;
    v17 = v8;
    v18 = v10;
    objc_msgSend(v13, "_animateByRetargetingAnimations:completion:", v14, v22);

  }
  else
  {
    if (v8)
    {
      -[NCNotificationListView viewsPerformingAnimation](self, "viewsPerformingAnimation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v8);

    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __94__NCNotificationListView__performRetargetableAnimationForView_animationBlock_completionBlock___block_invoke;
    v25[3] = &unk_1E8D1D260;
    v15 = &v27;
    v26[1] = self;
    v27 = v10;
    v16 = (id *)v26;
    v26[0] = v8;
    v20 = v8;
    v21 = v10;
    -[NCNotificationListView _performViewAnimationBlock:completionBlock:](self, "_performViewAnimationBlock:completionBlock:", v9, v25);
  }

}

void __94__NCNotificationListView__performRetargetableAnimationForView_animationBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "viewsPerformingAnimation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

  }
}

void __94__NCNotificationListView__performRetargetableAnimationForView_animationBlock_completionBlock___block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t v4;
  id v5;

  if (a2 && a3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "viewsPerformingAnimation");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (double)_adjustedTensionForRevealAnimation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[NCNotificationListView _verticalVelocityForSuperview](self, "_verticalVelocityForSuperview");
  v4 = v3;
  -[NCListAnimationSettings revealHintingAnimationTension](self->_animationSettings, "revealHintingAnimationTension");
  v6 = v5;
  -[NCListAnimationSettings revealHintingAnimationTensionVelocityFactor](self->_animationSettings, "revealHintingAnimationTensionVelocityFactor");
  return v6 + v7 * v4;
}

- (double)_adjustedFrictionForRevealAnimation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[NCNotificationListView _verticalVelocityForSuperview](self, "_verticalVelocityForSuperview");
  v4 = v3;
  -[NCListAnimationSettings revealHintingAnimationFriction](self->_animationSettings, "revealHintingAnimationFriction");
  v6 = v5;
  -[NCListAnimationSettings revealHintingAnimationFrictionVelocityFactor](self->_animationSettings, "revealHintingAnimationFrictionVelocityFactor");
  return v6 + v7 * v4;
}

- (double)_verticalVelocityForSuperview
{
  void *v2;
  double v3;
  double v4;

  -[NCNotificationListView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "_verticalVelocity");
    v3 = fabs(v4);
  }

  return v3;
}

- (double)_revealAnimationDelayForObjectAtIndex:(unint64_t)a3
{
  double v4;
  double v5;

  v4 = (double)(-[NCNotificationListView revealIndexOffset](self, "revealIndexOffset") + a3);
  -[NCListAnimationSettings revealGestureAnimationRevealDelayStep](self->_animationSettings, "revealGestureAnimationRevealDelayStep");
  return fmin(fmax(v5 * v4, 0.0), 1.0);
}

- (void)_configureClippingIfNecessary
{
  if (-[NCNotificationListView _shouldPerformClipping](self, "_shouldPerformClipping"))
    -[NCNotificationListView _setupClipping](self, "_setupClipping");
  else
    -[NCNotificationListView _resetClipping](self, "_resetClipping");
}

- (void)_setupClipping
{
  void *v3;

  -[NCNotificationListView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", 15);

  -[NCNotificationListView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 13.0);
  -[NCNotificationListView setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (void)_resetClipping
{
  void *v3;

  -[NCNotificationListView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", 0);

  -[NCNotificationListView setClipsToBounds:](self, "setClipsToBounds:", 0);
}

- (BOOL)_shouldPerformClipping
{
  uint64_t v3;
  void *v4;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") != 1 && (unint64_t)(v3 - 3) > 1)
    v9 = 0;
  else
    v9 = -[NCNotificationListView _isGrouping](self, "_isGrouping")
      && (-[NCNotificationListView groupedTranslation](self, "groupedTranslation"),
          v7 = fabs(v6),
          -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin"),
          v7 > v8)
      || -[NCNotificationListView removedViewIndex](self, "removedViewIndex") != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (BOOL)_isGrouping
{
  _BOOL4 v3;

  v3 = -[NCNotificationListView isGrouped](self, "isGrouped");
  if (v3)
    LOBYTE(v3) = -[NCNotificationListView supportsGrouping](self, "supportsGrouping");
  return v3;
}

- (id)_headerViewFromDataSource
{
  void *v3;
  void *v4;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "headerViewForNotificationList:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_footerViewFromDataSource
{
  void *v3;
  void *v4;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "footerViewForNotificationList:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)_headerViewHeight
{
  void *v3;
  double v4;
  double v5;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationListView bounds](self, "bounds");
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    objc_msgSend(v3, "headerViewHeightForNotificationList:withWidth:", self);
    v4 = v5;
  }

  return v4;
}

- (double)_footerViewHeight
{
  void *v3;
  double v4;
  double v5;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationListView bounds](self, "bounds");
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    objc_msgSend(v3, "footerViewHeightForNotificationList:withWidth:", self);
    v4 = v5;
  }

  return v4;
}

- (id)_backgroundViewFromDataSource
{
  void *v3;
  void *v4;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "backgroundViewForNotificationList:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_overlayViewFromDataSource
{
  void *v3;
  void *v4;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "overlayViewForNotificationList:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_hoverViewFromDataSource
{
  void *v3;
  void *v4;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "hoverViewForNotificationList:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_listViewForView:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)_recycleViewIfNecessary:(id)a3
{
  -[NCNotificationListView _recycleViewIfNecessary:withDataSource:](self, "_recycleViewIfNecessary:withDataSource:", a3, 0);
}

- (void)_recycleViewIfNecessary:(id)a3 withDataSource:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[NCNotificationListView dataSource](self, "dataSource");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationListView _listViewForView:](self, "_listViewForView:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recycleVisibleViews");

    objc_msgSend(v8, "recycleView:", v10);
  }
LABEL_6:

}

- (CGAffineTransform)_scaleTransformForGroupingAnimationForViewAtIndex:(SEL)a3 leadingViewHeight:(unint64_t)a4
{
  void *v9;
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

  -[NCNotificationListView dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, a4);
  v11 = v10;

  v12 = 0.0;
  if (!-[NCNotificationListView isHiddenBelowStack](self, "isHiddenBelowStack")
    && -[NCNotificationListView showStackBelowLeadingView](self, "showStackBelowLeadingView"))
  {
    -[NCNotificationListView groupedOverlapHeightMultiple](self, "groupedOverlapHeightMultiple");
    v14 = v13;
    -[NCNotificationListView _resolvedViewOverlap](self, "_resolvedViewOverlap");
    v16 = v14 * v15;
    v17 = 0.0;
    if (a4)
      v17 = 1.0;
    v12 = v16 * v17;
  }
  v18 = pow(0.94, (double)a4);
  if (v12 + a5 >= v11)
    v19 = v18;
  else
    v19 = (v12 + a5) / v11;
  if (v19 >= v18)
    v19 = v18;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return CGAffineTransformMakeScale(retstr, v18, v19);
}

- (BOOL)isNotificationListViewCurrentlyVisible
{
  void *v3;
  BOOL v4;
  double v5;

  -[NCNotificationListView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[NCNotificationListView isRevealed](self, "isRevealed"))
    {
      v4 = 1;
    }
    else
    {
      -[NCNotificationListView revealPercentage](self, "revealPercentage");
      v4 = v5 > 0.0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setHiddenBelowStackForView:(id)a3 hiddenBelowStack:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a4;
  -[NCNotificationListView _listViewForView:](self, "_listViewForView:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setHiddenBelowStack:", v4);
    v5 = v6;
  }

}

- (void)_updateStackedViewsForGrouping:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[NCNotificationListView visibleViews](self, "visibleViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__NCNotificationListView__updateStackedViewsForGrouping___block_invoke;
  v6[3] = &unk_1E8D1D2D8;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __57__NCNotificationListView__updateStackedViewsForGrouping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  BOOL v6;
  double v7;
  double v8;
  _BOOL8 v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (*(_BYTE *)(a1 + 40))
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v9 = 1;
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "_setHiddenBelowStackForView:hiddenBelowStack:", v10, v9);
    goto LABEL_10;
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    v7 = (double)v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2448), "groupListMaxViewCount");
    if (v8 > v7)
    {
      v9 = *(_BYTE *)(a1 + 40) != 0;
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (BOOL)_isAnimationStyleDissolve
{
  return -[NCNotificationListView groupingAnimationStyle](self, "groupingAnimationStyle") == 1;
}

- (double)_widthForListViewInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
  v8 = v7;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v11 = CGRectInset(v10, v8, 0.0);
  return CGRectGetWidth(v11);
}

- (void)setGroupedTranslation:(double)a3
{
  if (self->_groupedTranslation != a3)
  {
    self->_groupedTranslation = a3;
    -[NCNotificationListView _configureClippingIfNecessary](self, "_configureClippingIfNecessary");
    -[NCNotificationListView _giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation](self, "_giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation");
    -[NCNotificationListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;
  CGAffineTransform v9;

  -[NCNotificationListView _directSuperListView](self, "_directSuperListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    memset(&v9, 0, sizeof(v9));
    -[NCNotificationListView groupedTranslation](self, "groupedTranslation");
    CGAffineTransformMakeTranslation(&v9, v5, 0.0);
    memset(&v8, 0, sizeof(v8));
    -[NCNotificationListView transform](self, "transform");
    v6 = v9;
    CGAffineTransformConcat(&v8, &t1, &v6);
    v6 = v8;
    objc_msgSend(v4, "notificationListView:changingTransformOfView:toTransform:", v3, self, &v6);
  }

}

- (BOOL)_isAnimatingForParentNotificationListView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[NCNotificationListView _directSuperListView](self, "_directSuperListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewsPerformingAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", self);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isLayoutFromBottomUp
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[NCNotificationListView _anySuperNotificationListView](self, "_anySuperNotificationListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "contentLayoutOffset");
    v5 = v4 > 0.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_anySuperNotificationListView
{
  void *v2;
  void *v3;
  id v4;

  -[NCNotificationListView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
    do
    {
      v4 = v2;

      objc_msgSend(v4, "superview");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v3 = v4;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_directSuperListView
{
  void *v2;
  void *v3;
  id v4;

  -[NCNotificationListView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)_animateVisibleRectAdjustmentIfNecessaryWithVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  double v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[NCNotificationListView isListRevealTargetContentOffsetClamped](self, "isListRevealTargetContentOffsetClamped");
  if (v8)
  {
    -[NCNotificationListView _visibleRect](self, "_visibleRect");
    v9 = CGRectGetHeight(v13);
    -[NCNotificationListView _setVisibleRectWithoutAlteringAnimations:](self, "_setVisibleRectWithoutAlteringAnimations:", x, y, width, height);
    -[NCNotificationListView _setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue:](self, "_setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue:", v9);
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    -[NCNotificationListView _animateVisibleRectHeight:](self, "_animateVisibleRectHeight:", CGRectGetHeight(v14));
  }
  else
  {
    -[NCNotificationListView visibleRectHeightAnimatableProperty](self, "visibleRectHeightAnimatableProperty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NCNotificationListView visibleRectHeightAnimatableProperty](self, "visibleRectHeightAnimatableProperty");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[NCNotificationListView setVisibleRectHeightAnimatableProperty:](self, "setVisibleRectHeightAnimatableProperty:", 0);
    }
  }
  return v8;
}

- (void)_animateVisibleRectHeight:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  _QWORD v13[6];

  -[NCNotificationListView visibleRectHeightAnimatableProperty](self, "visibleRectHeightAnimatableProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NCNotificationListView visibleRectHeightAnimatableProperty](self, "visibleRectHeightAnimatableProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v8 = v7;

    if (v8 != a3)
    {
      v12[4] = self;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __52__NCNotificationListView__animateVisibleRectHeight___block_invoke;
      v13[3] = &unk_1E8D1BCF8;
      v13[4] = self;
      *(double *)&v13[5] = a3;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__NCNotificationListView__animateVisibleRectHeight___block_invoke_2;
      v12[3] = &unk_1E8D1B568;
      -[NCNotificationListView _adjustedTensionForRevealAnimation](self, "_adjustedTensionForRevealAnimation");
      v10 = v9;
      -[NCNotificationListView _adjustedFrictionForRevealAnimation](self, "_adjustedFrictionForRevealAnimation");
      -[NCNotificationListView _performViewAnimationBlock:completionBlock:withTension:friction:](self, "_performViewAnimationBlock:completionBlock:withTension:friction:", v13, v12, v10, v11);
    }
  }
}

void __52__NCNotificationListView__animateVisibleRectHeight___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "visibleRectHeightAnimatableProperty");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:", *(double *)(a1 + 40));

}

uint64_t __52__NCNotificationListView__animateVisibleRectHeight___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setListRevealTargetContentOffsetClamped:", 0);
}

- (void)_setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue:(double)a3
{
  UIViewFloatAnimatableProperty *visibleRectHeightAnimatableProperty;
  UIViewFloatAnimatableProperty *v6;
  UIViewFloatAnimatableProperty *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  visibleRectHeightAnimatableProperty = self->_visibleRectHeightAnimatableProperty;
  if (!visibleRectHeightAnimatableProperty)
  {
    v6 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
    v7 = self->_visibleRectHeightAnimatableProperty;
    self->_visibleRectHeightAnimatableProperty = v6;

    visibleRectHeightAnimatableProperty = self->_visibleRectHeightAnimatableProperty;
  }
  -[UIViewFloatAnimatableProperty setValue:](visibleRectHeightAnimatableProperty, "setValue:", a3);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = self->_visibleRectHeightAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__NCNotificationListView__setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue___block_invoke;
  v10[3] = &unk_1E8D1B278;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __90__NCNotificationListView__setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v2 = WeakRetained[304];
    if (v2 && objc_msgSend(v11, "isRevealed"))
    {
      objc_msgSend(v2, "presentationValue");
      v4 = v3;
      objc_msgSend(v11, "visibleRect");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      objc_msgSend(v11, "_setVisibleRectWithoutAlteringAnimations:");
      objc_msgSend(v11, "setPerformingVisibleRectAdjustment:", 1);
      objc_msgSend(v11, "setNeedsLayout");
      objc_msgSend(v11, "_updateVisibleViewsForUpdatedVisibleRect:", v6, v8, v10, v4);
    }

    WeakRetained = v11;
  }

}

- (BOOL)_isFeaturedLeadingViewAtIndex:(unint64_t)a3
{
  return -[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") > a3
      && -[NCNotificationListView _isShowingFeaturedLeadingViews](self, "_isShowingFeaturedLeadingViews");
}

- (BOOL)_isShowingFeaturedLeadingViews
{
  void *v3;
  char v4;

  -[NCNotificationListView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isShowingFeaturedLeadingViewsForNotificationListView:", self);
  else
    v4 = 0;

  return v4;
}

- (double)_widthForFeaturedLeadingViewInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NCNotificationListView horizontalInsetMargin](self, "horizontalInsetMargin");
  v9 = v8;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v15 = CGRectInset(v14, v9, 0.0);
  v10 = CGRectGetWidth(v15);
  v11 = (double)(-[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") - 1);
  -[NCListAnimationSettings featuredLeadingViewSpacing](self->_animationSettings, "featuredLeadingViewSpacing");
  return (v10 - v11 * v12)
       / (double)-[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews");
}

- (double)_widthForFeaturedLeadingView
{
  double result;

  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _widthForFeaturedLeadingViewInRect:](self, "_widthForFeaturedLeadingViewInRect:");
  return result;
}

- (double)_heightForFeaturedLeadingViewInRect:(CGRect)a3
{
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;

  -[NCNotificationListView _widthForFeaturedLeadingViewInRect:](self, "_widthForFeaturedLeadingViewInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[NCNotificationListView dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews"))
  {
    v7 = 0;
    v8 = 0.0;
    do
    {
      objc_msgSend(v6, "notificationListView:heightForItemAtIndex:withWidth:", self, v7, v5);
      if (v8 < v9)
        v8 = v9;
      ++v7;
    }
    while (-[NCNotificationListView numberOfFeaturedLeadingViews](self, "numberOfFeaturedLeadingViews") > v7);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)_heightForFeaturedLeadingView
{
  double result;

  -[NCNotificationListView bounds](self, "bounds");
  -[NCNotificationListView _heightForFeaturedLeadingViewInRect:](self, "_heightForFeaturedLeadingViewInRect:");
  return result;
}

- (void)_updateTransformedView:(id)a3 toFrame:(CGRect)a4
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v19;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  v19 = a3;
  UIRectGetCenter();
  v8 = v7;
  v10 = v9;
  objc_msgSend(v19, "frame");
  UIRectGetCenter();
  if (v8 != v12 || v10 != v11)
  {
    -[NCNotificationListView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");
    UIPointRoundToScale();
    objc_msgSend(v19, "setCenter:");

  }
  objc_msgSend(v19, "bounds");
  v21.origin.x = v15;
  v21.origin.y = v16;
  v21.size.width = v17;
  v21.size.height = v18;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = width;
  v20.size.height = height;
  if (!CGRectEqualToRect(v20, v21))
    objc_msgSend(v19, "setBounds:", 0.0, 0.0, width, height);

}

- (void)_updateTransformedView:(id)a3 toFrame:(CGRect)a4 withTransform:(CGAffineTransform *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform t1;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  -[NCNotificationListView _updateTransformedView:toFrame:](self, "_updateTransformedView:toFrame:", v11, x, y, width, height);
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v12 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v14.c = v12;
  *(_OWORD *)&v14.tx = *(_OWORD *)&a5->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v14))
  {
    v13 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v14.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v14.c = v13;
    *(_OWORD *)&v14.tx = *(_OWORD *)&a5->tx;
    objc_msgSend(v11, "setTransform:", &v14);
  }

}

- (BOOL)_shouldUpdateTransformedView:(id)a3 toFrame:(CGRect)a4 alpha:(double)a5 transform:(CGAffineTransform *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform t1;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  objc_msgSend(v12, "bounds");
  v13 = CGRectGetWidth(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (v13 == CGRectGetWidth(v28)
    && (objc_msgSend(v12, "bounds"),
        v14 = CGRectGetHeight(v29),
        v30.origin.x = x,
        v30.origin.y = y,
        v30.size.width = width,
        v30.size.height = height,
        v14 == CGRectGetHeight(v30)))
  {
    objc_msgSend(v12, "center");
    v18 = v17;
    v20 = v19;
    UIRectGetCenter();
    LOBYTE(v15) = 1;
    if (v18 == v22 && v20 == v21)
    {
      objc_msgSend(v12, "alpha");
      if (v23 == a5)
      {
        if (v12)
          objc_msgSend(v12, "transform");
        else
          memset(&t1, 0, sizeof(t1));
        v24 = *(_OWORD *)&a6->c;
        *(_OWORD *)&v25.a = *(_OWORD *)&a6->a;
        *(_OWORD *)&v25.c = v24;
        *(_OWORD *)&v25.tx = *(_OWORD *)&a6->tx;
        v15 = !CGAffineTransformEqualToTransform(&t1, &v25);
      }
    }
  }
  else
  {
    LOBYTE(v15) = 1;
  }

  return v15;
}

- (double)_rollUnderThresholdOffset
{
  double MaxY;
  double v4;
  CGRect v6;

  -[NCNotificationListView visibleRect](self, "visibleRect");
  MaxY = CGRectGetMaxY(v6);
  -[NCNotificationListView visibleRectBottomMarginForRollUnder](self, "visibleRectBottomMarginForRollUnder");
  return MaxY - v4;
}

- (BOOL)_shouldRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  CGRect v17;

  -[NCNotificationListView _listViewForView:](self, "_listViewForView:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListView insertedViewIndices](self, "insertedViewIndices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = 1;
  }
  else
  {
    -[NCNotificationListView reloadedViewIndices](self, "reloadedViewIndices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v8, "reloadedViewIndices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "count") != 0;

    }
  }

  v13 = 0;
  if (-[NCNotificationListView shouldBottomViewsRollUnder](self, "shouldBottomViewsRollUnder") && !v10)
  {
    -[NCNotificationListView _visibleRect](self, "_visibleRect");
    if (CGRectGetMinY(v17) > a5 + 0.001)
    {
      v13 = 0;
      goto LABEL_18;
    }
    -[NCNotificationListView _rollUnderTranslationTopMargin](self, "_rollUnderTranslationTopMargin");
    -[NCNotificationListView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");
    UIFloorToScale();
    if (a4 + a5 + 0.001 <= v15)
      goto LABEL_15;
    if (!v8)
    {
      v13 = 1;
      goto LABEL_17;
    }
    if (objc_msgSend(v8, "isGrouped"))
      v13 = objc_msgSend(v8, "isRevealed");
    else
LABEL_15:
      v13 = 0;
LABEL_17:

  }
LABEL_18:

  return v13;
}

- (double)_rollUnderTranslationTopMargin
{
  double MaxY;
  double v4;
  double v5;
  double v6;
  CGRect v8;
  CGRect v9;

  -[NCNotificationListView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v8);
  -[NCNotificationListView _visibleRect](self, "_visibleRect");
  v4 = MaxY - CGRectGetMaxY(v9);
  if (v4 >= 104.0)
    v5 = 1.0;
  else
    v5 = v4 / 104.0;
  -[NCNotificationListView _rollUnderThresholdOffset](self, "_rollUnderThresholdOffset");
  return v6 + v5 * v5 * -52.0;
}

- (double)_rollUnderTranslationBottomMargin
{
  double v2;

  -[NCNotificationListView _rollUnderTranslationTopMargin](self, "_rollUnderTranslationTopMargin");
  return v2 + 156.0;
}

- (double)_unclampedTranslationProgressForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  v6 = a4 + a5;
  -[NCNotificationListView _rollUnderTranslationTopMargin](self, "_rollUnderTranslationTopMargin", a3);
  v8 = v7;
  -[NCNotificationListView _rollUnderTranslationBottomMargin](self, "_rollUnderTranslationBottomMargin");
  v10 = v9;
  result = 0.0;
  if (v6 > v8)
    return (v6 - v8) / (v10 - v8);
  return result;
}

- (double)_verticalTranslationProgressForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[NCNotificationListView _unclampedTranslationProgressForView:withHeight:layoutOffset:](self, "_unclampedTranslationProgressForView:withHeight:layoutOffset:", a3, a4, a5);
  v6 = v5;
  v7 = sin(v5 * 3.14159265 * 0.5);
  v8 = 0.0;
  if (v6 >= 0.0)
    v8 = v6;
  if (v8 > 1.0)
    v8 = 1.0;
  return v7 + (v8 - v7) * 0.4;
}

- (double)_scaleForRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  long double v5;

  -[NCNotificationListView _unclampedTranslationProgressForView:withHeight:layoutOffset:](self, "_unclampedTranslationProgressForView:withHeight:layoutOffset:", a3, a4, a5);
  return (1.0 - cos(v5)) * -0.3 + 1.0;
}

- (double)_verticalTranslationForRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5 scale:(double)a6
{
  double v10;
  double v11;
  double result;
  double v13;
  double v14;
  double v15;

  -[NCNotificationListView _verticalTranslationProgressForView:withHeight:layoutOffset:](self, "_verticalTranslationProgressForView:withHeight:layoutOffset:", a3);
  v11 = v10;
  result = 0.0;
  if (v11 > 0.0)
  {
    -[NCNotificationListView _rollUnderTranslationTopMargin](self, "_rollUnderTranslationTopMargin", 0.0);
    v14 = v13;
    -[NCNotificationListView _rollUnderThresholdOffset](self, "_rollUnderThresholdOffset");
    return a4 + a5 - (v14 + v11 * (v15 - v14)) + (1.0 - a6) * a4 * -0.5;
  }
  return result;
}

- (double)_alphaForRollUnderForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  double v6;
  double v7;
  double v8;
  CGRect v10;

  -[NCNotificationListView _unclampedTranslationProgressForView:withHeight:layoutOffset:](self, "_unclampedTranslationProgressForView:withHeight:layoutOffset:", a3, a4, a5);
  v7 = (v6 + -1.2) / -0.2 + 1.0;
  if (v7 < 0.0)
    v7 = 0.0;
  if (v7 <= 1.0)
    v8 = v7;
  else
    v8 = 1.0;
  -[NCNotificationListView _visibleRect](self, "_visibleRect");
  if (CGRectGetHeight(v10) == 0.0)
    return 0.0;
  else
    return v8;
}

- (CGAffineTransform)_transformForRollUnderForView:(SEL)a3 withHeight:(id)a4 layoutOffset:(double)a5
{
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v10 = a4;
  -[NCNotificationListView _scaleForRollUnderView:withHeight:layoutOffset:](self, "_scaleForRollUnderView:withHeight:layoutOffset:", v10, a5, a6);
  v12 = v11;
  -[NCNotificationListView _verticalTranslationForRollUnderView:withHeight:layoutOffset:scale:](self, "_verticalTranslationForRollUnderView:withHeight:layoutOffset:scale:", v10, a5, a6, v11);
  v14 = v13;

  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, 0.0, -v14);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v12, v12);
  t1 = v18;
  v16 = v19;
  return CGAffineTransformConcat(retstr, &t1, &v16);
}

- (void)_updateShadowForOverlappingRollUnderView:(id)a3 withProgress:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  id v12;

  v12 = a3;
  -[NCNotificationListView _listViewForView:](self, "_listViewForView:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count") != 1 && objc_msgSend(v7, "showStackBelowLeadingView"))
    a4 = 0.0;
  v8 = a4 * 0.15;
  objc_msgSend(v12, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shadowOpacity");
  if (v8 != v10)
  {
    objc_msgSend(v9, "setShadowRadius:", 10.0);
    objc_msgSend(v9, "setShadowOffset:", 0.0, 5.0);
    *(float *)&v11 = v8;
    objc_msgSend(v9, "setShadowOpacity:", v11);
    objc_msgSend(v9, "setShadowPathIsBounds:", 1);
  }

}

- (double)_topSpacingForItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  double v10;

  -[NCNotificationListView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v5, "notificationListView:topSpacingForItemAtIndex:", self, a3),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "floatValue");
    v9 = v8;

  }
  else if (a3)
  {
    -[NCListAnimationSettings viewSpacing](self->_animationSettings, "viewSpacing");
    v9 = v10;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)_bottomSpacingForItemAtIndex:(unint64_t)a3
{
  double result;

  if (-[NCNotificationListView count](self, "count") - 1 <= a3)
    return 0.0;
  -[NCNotificationListView _topSpacingForItemAtIndex:](self, "_topSpacingForItemAtIndex:", a3 + 1);
  return result;
}

- (id)_viewForItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  -[NCNotificationListView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationListView:viewForItemAtIndex:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setIndex:", a3);
  return v8;
}

- (BOOL)visibleRectIsBounds
{
  return self->_visibleRectIsBounds;
}

- (void)setVisibleRectIsBounds:(BOOL)a3
{
  self->_visibleRectIsBounds = a3;
}

- (BOOL)isAnimatingAdditionalYOffset
{
  return self->_animatingAdditionalYOffset;
}

- (BOOL)isReactiveLayout
{
  return self->_reactiveLayout;
}

- (void)setReactiveLayout:(BOOL)a3
{
  self->_reactiveLayout = a3;
}

- (BOOL)isGrouped
{
  return self->_grouped;
}

- (double)featuredLeadingViewOcclusionTranslation
{
  return self->_featuredLeadingViewOcclusionTranslation;
}

- (BOOL)isSubviewPerformingGroupingAnimation
{
  return self->_subviewPerformingGroupingAnimation;
}

- (BOOL)isPerformingContentRevealAnimation
{
  return self->_performingContentRevealAnimation;
}

- (BOOL)isHiddenBelowStack
{
  return self->_hiddenBelowStack;
}

- (BOOL)showStackBelowLeadingView
{
  return self->_showStackBelowLeadingView;
}

- (void)setShowStackBelowLeadingView:(BOOL)a3
{
  self->_showStackBelowLeadingView = a3;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  self->_supportsGrouping = a3;
}

- (double)additionalBottomSpace
{
  return self->_additionalBottomSpace;
}

- (void)setAdditionalBottomSpace:(double)a3
{
  self->_additionalBottomSpace = a3;
}

- (double)minimumContentHeight
{
  return self->_minimumContentHeight;
}

- (void)setMinimumContentHeight:(double)a3
{
  self->_minimumContentHeight = a3;
}

- (unint64_t)groupingAnimationStyle
{
  return self->_groupingAnimationStyle;
}

- (void)setGroupingAnimationStyle:(unint64_t)a3
{
  self->_groupingAnimationStyle = a3;
}

- (BOOL)leadingContentShouldFillList
{
  return self->_leadingContentShouldFillList;
}

- (void)setLeadingContentShouldFillList:(BOOL)a3
{
  self->_leadingContentShouldFillList = a3;
}

- (BOOL)showContentForGroupedViews
{
  return self->_showContentForGroupedViews;
}

- (BOOL)layoutFromBottom
{
  return self->_layoutFromBottom;
}

- (void)setLayoutFromBottom:(BOOL)a3
{
  self->_layoutFromBottom = a3;
}

- (BOOL)supportsBottomViewsRollUnder
{
  return self->_supportsBottomViewsRollUnder;
}

- (double)visibleRectBottomMarginForRollUnder
{
  return self->_visibleRectBottomMarginForRollUnder;
}

- (BOOL)shouldLimitViewHeightForRollUnder
{
  return self->_shouldLimitViewHeightForRollUnder;
}

- (void)setShouldLimitViewHeightForRollUnder:(BOOL)a3
{
  self->_shouldLimitViewHeightForRollUnder = a3;
}

- (double)groupingViewOverlapCompressionFactor
{
  return self->_groupingViewOverlapCompressionFactor;
}

- (double)groupingViewOverlapAlphaFactor
{
  return self->_groupingViewOverlapAlphaFactor;
}

- (void)setGroupingViewOverlapAlphaFactor:(double)a3
{
  self->_groupingViewOverlapAlphaFactor = a3;
}

- (double)horizontalInsetMargin
{
  return self->_horizontalInsetMargin;
}

- (void)setHorizontalInsetMargin:(double)a3
{
  self->_horizontalInsetMargin = a3;
}

- (double)backgroundViewHorizontalOutsetMargin
{
  return self->_backgroundViewHorizontalOutsetMargin;
}

- (void)setBackgroundViewHorizontalOutsetMargin:(double)a3
{
  self->_backgroundViewHorizontalOutsetMargin = a3;
}

- (double)footerViewVerticalMargin
{
  return self->_footerViewVerticalMargin;
}

- (void)setFooterViewVerticalMargin:(double)a3
{
  self->_footerViewVerticalMargin = a3;
}

- (unint64_t)numberOfFeaturedLeadingViews
{
  return self->_numberOfFeaturedLeadingViews;
}

- (void)setNumberOfFeaturedLeadingViews:(unint64_t)a3
{
  self->_numberOfFeaturedLeadingViews = a3;
}

- (double)groupedOverlapHeightMultiple
{
  return self->_groupedOverlapHeightMultiple;
}

- (void)setGroupedOverlapHeightMultiple:(double)a3
{
  self->_groupedOverlapHeightMultiple = a3;
}

- (double)overrideLeadingViewHeight
{
  return self->_overrideLeadingViewHeight;
}

- (double)maximumLeadingViewHeight
{
  return self->_maximumLeadingViewHeight;
}

- (double)additionalYOffset
{
  return self->_additionalYOffset;
}

- (unint64_t)indexForReveal
{
  return self->_indexForReveal;
}

- (void)setIndexForReveal:(unint64_t)a3
{
  self->_indexForReveal = a3;
}

- (BOOL)areSublistsRevealed
{
  return self->_sublistsRevealed;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (BOOL)isLeadingRevealView
{
  return self->_leadingRevealView;
}

- (void)setLeadingRevealView:(BOOL)a3
{
  self->_leadingRevealView = a3;
}

- (BOOL)isActiveRevealTransitioning
{
  return self->_activeRevealTransitioning;
}

- (BOOL)isRevealTransitionScrolling
{
  return self->_revealTransitionScrolling;
}

- (void)setRevealTransitionScrolling:(BOOL)a3
{
  self->_revealTransitionScrolling = a3;
}

- (BOOL)isListRevealTargetContentOffsetClamped
{
  return self->_listRevealTargetContentOffsetClamped;
}

- (void)setListRevealTargetContentOffsetClamped:(BOOL)a3
{
  self->_listRevealTargetContentOffsetClamped = a3;
}

- (double)revealPercentage
{
  return self->_revealPercentage;
}

- (unint64_t)revealIndexOffset
{
  return self->_revealIndexOffset;
}

- (void)setRevealIndexOffset:(unint64_t)a3
{
  self->_revealIndexOffset = a3;
}

- (double)interactionTranslation
{
  return self->_interactionTranslation;
}

- (double)interactionTranslationPercentage
{
  return self->_interactionTranslationPercentage;
}

- (double)interactionVelocity
{
  return self->_interactionVelocity;
}

- (double)interactionTranslationFocalPointY
{
  return self->_interactionTranslationFocalPointY;
}

- (void)setInteractionTranslationFocalPointY:(double)a3
{
  self->_interactionTranslationFocalPointY = a3;
}

- (NCNotificationListViewDataSource)dataSource
{
  return (NCNotificationListViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSNumber)footerCenterY
{
  return self->_footerCenterY;
}

- (void)setFooterCenterY:(id)a3
{
  objc_storeStrong((id *)&self->_footerCenterY, a3);
}

- (NCNotificationListDebugView)debugView
{
  return self->_debugView;
}

- (NSMutableDictionary)visibleViews
{
  return self->_visibleViews;
}

- (void)setVisibleViews:(id)a3
{
  objc_storeStrong((id *)&self->_visibleViews, a3);
}

- (NSMutableSet)insertedViewIndices
{
  return self->_insertedViewIndices;
}

- (void)setInsertedViewIndices:(id)a3
{
  objc_storeStrong((id *)&self->_insertedViewIndices, a3);
}

- (NSMutableSet)reloadedViewIndices
{
  return self->_reloadedViewIndices;
}

- (void)setReloadedViewIndices:(id)a3
{
  objc_storeStrong((id *)&self->_reloadedViewIndices, a3);
}

- (unint64_t)removedViewIndex
{
  return self->_removedViewIndex;
}

- (void)setRemovedViewIndex:(unint64_t)a3
{
  self->_removedViewIndex = a3;
}

- (BOOL)shouldBottomViewsRollUnder
{
  return self->_shouldBottomViewsRollUnder;
}

- (void)setShouldBottomViewsRollUnder:(BOOL)a3
{
  self->_shouldBottomViewsRollUnder = a3;
}

- (BOOL)isPerformingGroupingAnimation
{
  return self->_performingGroupingAnimation;
}

- (void)setPerformingGroupingAnimation:(BOOL)a3
{
  self->_performingGroupingAnimation = a3;
}

- (BOOL)isPerformingRevealAnimation
{
  return self->_performingRevealAnimation;
}

- (void)setPerformingRevealAnimation:(BOOL)a3
{
  self->_performingRevealAnimation = a3;
}

- (BOOL)isPerformingRemovalAnimation
{
  return self->_performingRemovalAnimation;
}

- (void)setPerformingRemovalAnimation:(BOOL)a3
{
  self->_performingRemovalAnimation = a3;
}

- (BOOL)isPerformingHeaderReloadAnimation
{
  return self->_performingHeaderReloadAnimation;
}

- (void)setPerformingHeaderReloadAnimation:(BOOL)a3
{
  self->_performingHeaderReloadAnimation = a3;
}

- (BOOL)isPerformingVisibleRectAdjustment
{
  return self->_performingVisibleRectAdjustment;
}

- (void)setPerformingVisibleRectAdjustment:(BOOL)a3
{
  self->_performingVisibleRectAdjustment = a3;
}

- (BOOL)isPerformingStackVisibilityAnimation
{
  return self->_performingStackVisibilityAnimation;
}

- (void)setPerformingStackVisibilityAnimation:(BOOL)a3
{
  self->_performingStackVisibilityAnimation = a3;
}

- (BOOL)isPerformingInteractiveTranslationAnimation
{
  return self->_performingInteractiveTranslationAnimation;
}

- (void)setPerformingInteractiveTranslationAnimation:(BOOL)a3
{
  self->_performingInteractiveTranslationAnimation = a3;
}

- (BOOL)isPerformingHeaderGroupingAnimation
{
  return self->_performingHeaderGroupingAnimation;
}

- (void)setPerformingHeaderGroupingAnimation:(BOOL)a3
{
  self->_performingHeaderGroupingAnimation = a3;
}

- (BOOL)isPerformingRevealTransitionAnimation
{
  return self->_performingRevealTransitionAnimation;
}

- (void)setPerformingRevealTransitionAnimation:(BOOL)a3
{
  self->_performingRevealTransitionAnimation = a3;
}

- (BOOL)isPerformingBottomMarginAdjustmentAnimation
{
  return self->_performingBottomMarginAdjustmentAnimation;
}

- (void)setPerformingBottomMarginAdjustmentAnimation:(BOOL)a3
{
  self->_performingBottomMarginAdjustmentAnimation = a3;
}

- (BOOL)isPerformingInteractionVelocityAnimation
{
  return self->_performingInteractionVelocityAnimation;
}

- (void)setPerformingInteractionVelocityAnimation:(BOOL)a3
{
  self->_performingInteractionVelocityAnimation = a3;
}

- (BOOL)isPerformingOverrideLeadingViewHeightAdjustment
{
  return self->_performingOverrideLeadingViewHeightAdjustment;
}

- (void)setPerformingOverrideLeadingViewHeightAdjustment:(BOOL)a3
{
  self->_performingOverrideLeadingViewHeightAdjustment = a3;
}

- (NSHashTable)viewsPerformingAnimation
{
  return self->_viewsPerformingAnimation;
}

- (void)setViewsPerformingAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_viewsPerformingAnimation, a3);
}

- (NSHashTable)viewsPerformingBottomMarginAdjustmentAnimation
{
  return self->_viewsPerformingBottomMarginAdjustmentAnimation;
}

- (void)setViewsPerformingBottomMarginAdjustmentAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_viewsPerformingBottomMarginAdjustmentAnimation, a3);
}

- (NSHashTable)viewsPerformingRollUnderLayout
{
  return self->_viewsPerformingRollUnderLayout;
}

- (void)setViewsPerformingRollUnderLayout:(id)a3
{
  objc_storeStrong((id *)&self->_viewsPerformingRollUnderLayout, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (UIView)hoverView
{
  return self->_hoverView;
}

- (void)setHoverView:(id)a3
{
  objc_storeStrong((id *)&self->_hoverView, a3);
}

- (BOOL)isHoverViewHidden
{
  return self->_hoverViewHidden;
}

- (void)setHoverViewHidden:(BOOL)a3
{
  self->_hoverViewHidden = a3;
}

- (BOOL)hasPerformedFirstLayout
{
  return self->_performedFirstLayout;
}

- (void)setPerformedFirstLayout:(BOOL)a3
{
  self->_performedFirstLayout = a3;
}

- (BOOL)isCachedSizeValid
{
  return self->_cachedSizeValid;
}

- (void)setCachedSizeValid:(BOOL)a3
{
  self->_cachedSizeValid = a3;
}

- (CGSize)cachedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedSize.width;
  height = self->_cachedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedSize:(CGSize)a3
{
  self->_cachedSize = a3;
}

- (CGAffineTransform)overrideTopViewDimmingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[53].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[52].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[53].c;
  return self;
}

- (UIViewFloatAnimatableProperty)visibleRectHeightAnimatableProperty
{
  return self->_visibleRectHeightAnimatableProperty;
}

- (void)setVisibleRectHeightAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_visibleRectHeightAnimatableProperty, a3);
}

- (double)groupedTranslation
{
  return self->_groupedTranslation;
}

- (NCListAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  self->_animationSettings = (NCListAnimationSettings *)a3;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
  objc_storeStrong((id *)&self->_purpose, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (CGRect)_visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__visibleRect.origin.x;
  y = self->__visibleRect.origin.y;
  width = self->__visibleRect.size.width;
  height = self->__visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_visibleRectHeightAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_hoverView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_viewsPerformingRollUnderLayout, 0);
  objc_storeStrong((id *)&self->_viewsPerformingBottomMarginAdjustmentAnimation, 0);
  objc_storeStrong((id *)&self->_viewsPerformingAnimation, 0);
  objc_storeStrong((id *)&self->_reloadedViewIndices, 0);
  objc_storeStrong((id *)&self->_insertedViewIndices, 0);
  objc_storeStrong((id *)&self->_visibleViews, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_footerCenterY, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
