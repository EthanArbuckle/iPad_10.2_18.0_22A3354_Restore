@implementation UIScrollView

- (BOOL)_supportsContentDimensionVariables
{
  return 1;
}

- (void)_faultInContentOffsetGuide
{
  id v2;

  v2 = -[UIScrollView _layoutGuideOfType:createIfNecessary:](self, "_layoutGuideOfType:createIfNecessary:", 2, 1);
}

- (BOOL)_canSkipTraitsAndOverlayUpdatesForViewControllerToNotifyOnLayoutResetState:(BOOL)a3
{
  unint64_t v3;
  int v4;

  v3 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if (a3)
  {
    v4 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v3 | 0x80000000000000;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4;
  }
  return (v3 >> 55) & 1;
}

- (void)_switchToLayoutEngine:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UIView _layoutEngine](self, "_layoutEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  -[UIView _switchToLayoutEngine:](&v6, sel__switchToLayoutEngine_, v4);

  if (v4
    && !v5
    && (*(_QWORD *)&self->super._viewFlags & 0x800000000000000) != 0
    && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20000000000) == 0)
  {
    if (dyld_program_sdk_at_least())
      -[UIView _setNeedsUpdateConstraints](self, "_setNeedsUpdateConstraints");
  }
}

- (BOOL)_requiresExplicitLayoutMarginsGuideForAttribute:(int64_t)a3 getAttributeForGuide:(int *)a4
{
  BOOL result;
  int v6;
  objc_super v7;
  int v8;

  v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  result = -[UIView _requiresExplicitLayoutMarginsGuideForAttribute:getAttributeForGuide:](&v7, sel__requiresExplicitLayoutMarginsGuideForAttribute_getAttributeForGuide_, a3, &v8);
  v6 = v8;
  if (a4)
    *a4 = v8;
  if ((v6 - 9) < 2)
    return 1;
  return result;
}

- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIScrollView;
  -[UIView _viewDidMoveFromScreen:toScreen:](&v4, sel__viewDidMoveFromScreen_toScreen_, a3, a4);
}

- (id)_actingParentScrollView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[UIScrollView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIScrollView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_actingParentScrollViewForScrollView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIScrollViewPinchGestureRecognizer *v6;
  BOOL v7;

  v6 = (UIScrollViewPinchGestureRecognizer *)a4;
  v7 = self->_pan == a3
    && (self->_pinch == v6
     || (UIScrollViewPinchGestureRecognizer *)self->_knobLongPressGestureRecognizer == v6
     || self->_knobPointerLongPressGestureRecognizer == (UIScrollViewKnobLongPressGestureRecognizer *)v6);

  return v7;
}

- (UIScrollView)_temporaryCoordinatingReplacement
{
  return self->_temporaryCoordinatingReplacement;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  if ((*(_QWORD *)&self->_scrollViewFlags & 0x300000) == 0x100000)
    return 15;
  else
    return ~-[UIScrollView _edgesApplyingSafeAreaInsetsToContentInset](self, "_edgesApplyingSafeAreaInsetsToContentInset") & 0xF;
}

- (UIEdgeInsets)_systemContentInsetIncludingAccessories:(BOOL)a3
{
  _BOOL4 v3;
  UIEdgeInsets *p_contentScrollInset;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char v14;
  double left;
  double right;
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
  double width;
  double height;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UIEdgeInsets result;

  v3 = a3;
  p_contentScrollInset = &self->_contentScrollInset;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[UIScrollView _edgesApplyingSafeAreaInsetsToContentInset](self, "_edgesApplyingSafeAreaInsetsToContentInset");
  left = p_contentScrollInset->left;
  right = p_contentScrollInset->right;
  if ((v14 & 1) != 0)
    v17 = v7;
  else
    v17 = -0.0;
  v18 = p_contentScrollInset->top + v17;
  if ((v14 & 2) == 0)
    v9 = -0.0;
  if ((v14 & 4) != 0)
    v19 = v11;
  else
    v19 = -0.0;
  v20 = p_contentScrollInset->bottom + v19;
  if ((v14 & 8) == 0)
    v13 = -0.0;
  if (!dyld_program_sdk_at_least()
    || self->_contentInsetAdjustmentBehavior != 2
    || (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x8000) != 0)
  {
    v20 = v20 + self->_keyboardBottomInsetAdjustment;
  }
  v21 = left + v9;
  v22 = v13 + right;
  -[UIScrollView _systemInsetAdjustmentSum](self, "_systemInsetAdjustmentSum");
  v24 = v18 + v23 + self->_refreshControlContentInsetHeight;
  if (v3)
  {
    if (-[UIScrollView _contentScrollsAlongXAxis](self, "_contentScrollsAlongXAxis"))
    {
      -[UIScrollView accessoryInsets](self, "accessoryInsets");
      v21 = v21 + v25;
      v22 = v22 + v26;
    }
    if (-[UIScrollView _contentScrollsAlongYAxis](self, "_contentScrollsAlongYAxis"))
    {
      -[UIScrollView accessoryInsets](self, "accessoryInsets");
      v24 = v24 + v27;
      v20 = v20 + v28;
    }
  }
  -[UIView bounds](self, "bounds");
  v30 = v29 - (v21 + self->_contentInset.left + v22 + self->_contentInset.right);
  v32 = v31 - (v24 + self->_contentInset.top + v20 + self->_contentInset.bottom);
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  -[UIScrollView contentAlignmentPoint](self, "contentAlignmentPoint");
  v37 = (v30 - width) * v36;
  if (width >= v30)
    v37 = -0.0;
  v38 = v21 + v37;
  v39 = (v32 - height) * v35;
  if (height >= v32)
    v39 = -0.0;
  v40 = v24 + v39;
  v41 = v38;
  v42 = v20;
  v43 = v22;
  result.right = v43;
  result.bottom = v42;
  result.left = v41;
  result.top = v40;
  return result;
}

- (unint64_t)_edgesApplyingSafeAreaInsetsToContentInsetForContentSize:(CGSize)a3
{
  unint64_t contentInsetAdjustmentBehavior;
  unint64_t v5;
  double height;
  double width;
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  CGFloat v11;
  CGRect v13;
  CGRect v14;

  contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  if (contentInsetAdjustmentBehavior >= 2)
  {
    if (contentInsetAdjustmentBehavior == 3)
      return 15;
    else
      return 0;
  }
  else
  {
    if ((*(_QWORD *)&self->_scrollViewFlags & 0x300000) == 0x100000)
    {
      v5 = 0;
    }
    else
    {
      height = a3.height;
      width = a3.width;
      -[UIView bounds](self, "bounds");
      x = v13.origin.x;
      y = v13.origin.y;
      v10 = v13.size.width;
      v11 = v13.size.height;
      if (width <= CGRectGetWidth(v13))
      {
        if (-[UIScrollView _contentScrollsAlongXAxis](self, "_contentScrollsAlongXAxis"))
          v5 = 15;
        else
          v5 = 5;
      }
      else
      {
        v5 = 15;
      }
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = v10;
      v14.size.height = v11;
      a3.width = CGRectGetHeight(v14);
      if (height <= a3.width && !-[UIScrollView _contentScrollsAlongYAxis](self, "_contentScrollsAlongYAxis"))
        v5 &= 0xAAAAAAAAAAAAAAAALL;
    }
    if (-[UIScrollView _applyVerticalSafeAreaInsetsToNonscrollingContent](self, "_applyVerticalSafeAreaInsetsToNonscrollingContent", a3.width, a3.height)&& !self->_contentInsetAdjustmentBehavior)
    {
      v5 |= 5uLL;
    }
  }
  return v5;
}

- (BOOL)_contentScrollsAlongXAxis
{
  uint64_t v2;

  v2 = (uint64_t)(int)(*((_DWORD *)&self->_scrollViewFlags + 5) << 27) >> 30;
  if (v2 == -1)
    return -[UIScrollView alwaysBounceHorizontal](self, "alwaysBounceHorizontal");
  else
    return v2 == 1;
}

- (unint64_t)_edgesApplyingSafeAreaInsetsToContentInset
{
  return -[UIScrollView _edgesApplyingSafeAreaInsetsToContentInsetForContentSize:](self, "_edgesApplyingSafeAreaInsetsToContentInsetForContentSize:", self->_contentSize.width, self->_contentSize.height);
}

- (BOOL)_contentScrollsAlongYAxis
{
  uint64_t v2;

  v2 = (uint64_t)(int)(*((_DWORD *)&self->_scrollViewFlags + 5) << 25) >> 30;
  if (v2 == -1)
    return -[UIScrollView alwaysBounceVertical](self, "alwaysBounceVertical");
  else
    return v2 == 1;
}

- (BOOL)_applyVerticalSafeAreaInsetsToNonscrollingContent
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 60) & 1;
}

- (UIEdgeInsets)accessoryInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_accessoryInsets.top;
  left = self->_accessoryInsets.left;
  bottom = self->_accessoryInsets.bottom;
  right = self->_accessoryInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)contentAlignmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentAlignmentPoint.x;
  y = self->_contentAlignmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)_systemInsetAdjustmentSum
{
  int v3;
  double result;
  NSMutableDictionary *contentInsetAdjustments;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = dyld_program_sdk_at_least();
  result = 0.0;
  if (v3)
  {
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x8000000000000000) == 0)
    {
      contentInsetAdjustments = self->_contentInsetAdjustments;
      if (contentInsetAdjustments)
      {
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v6 = contentInsetAdjustments;
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v15;
          v10 = 0.0;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v15 != v9)
                objc_enumerationMutation(v6);
              -[NSMutableDictionary objectForKey:](self->_contentInsetAdjustments, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "doubleValue");
              v10 = v10 + v13;

            }
            v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v8);
        }
        else
        {
          v10 = 0.0;
        }

        self->_contentInsetAdjustmentsSum = v10;
        *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x8000000000000000;
      }
    }
    return self->_contentInsetAdjustmentsSum;
  }
  return result;
}

- (BOOL)alwaysBounceHorizontal
{
  return *((_BYTE *)&self->_scrollViewFlags + 1) & 1;
}

- (BOOL)alwaysBounceVertical
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 1) >> 1) & 1;
}

- (UIEdgeInsets)_contentInsetIncludingDecorations
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView _refreshControl](self, "_refreshControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "_areInsetsBeingApplied")
    && (objc_msgSend(v11, "_hostAdjustsContentOffset") & 1) == 0)
  {
    objc_msgSend(v11, "_appliedInsets");
    v4 = v4 - v12;
    v8 = v8 - v13;
    v10 = v10 - v14;
    v6 = v6 - v15;
  }

  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (UIRefreshControl)_refreshControl
{
  void *v2;
  id v3;

  -[UIScrollView refreshControl](self, "refreshControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (UIRefreshControl *)v3;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (BOOL)_hasContentForBarInteractions
{
  double v2;
  double v3;

  -[UIScrollView contentSize](self, "contentSize");
  return v3 > 0.0 && v2 > 0.0;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setApplyVerticalSafeAreaInsetsToNonscrollingContent:(BOOL)a3
{
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;

  p_scrollViewFlags = &self->_scrollViewFlags;
  if (((((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x1000000000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    -[UIScrollView _systemContentInset](self, "_systemContentInset");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
    v15 = 0x1000000000000000;
    if (!v4)
      v15 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xEFFFFFFFFFFFFFFFLL | v15;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v14, 0, v7, v9, v11, v13);
  }
}

- (void)_resizeWithOldSuperviewSize:(CGSize)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  -[UIView _resizeWithOldSuperviewSize:](&v6, sel__resizeWithOldSuperviewSize_, a3.width, a3.height);
  if ((dyld_program_sdk_at_least() & 1) == 0
    && (*(_QWORD *)&self->super._viewFlags & 0x800000000000000) != 0
    && -[UIScrollView _wantsConstrainedContentSize](self, "_wantsConstrainedContentSize"))
  {
    -[UIView superview](self, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (!v4 || (*(_QWORD *)(v4 + 104) & 0x1000000000000000) != 0)
    {
      -[UIScrollView _nsis_contentSize](self, "_nsis_contentSize");
      -[UIScrollView setContentSize:](self, "setContentSize:");
    }

  }
}

- (void)_setSubviewWantsAutolayoutTripWantsAutolayout:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIScrollView;
  -[UIView _setSubviewWantsAutolayoutTripWantsAutolayout:](&v5, sel__setSubviewWantsAutolayoutTripWantsAutolayout_, a3);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIScrollView _automaticContentConstraints](self, "_automaticContentConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      if (-[UIScrollView _wantsConstrainedContentSize](self, "_wantsConstrainedContentSize"))
        return;
      -[UIScrollView _constraintsFromContentSize](self, "_constraintsFromContentSize");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView _setAutomaticContentConstraints:](self, "_setAutomaticContentConstraints:", v4);
    }

  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  -[UIView center](self, "center");
  v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)UIScrollView;
  -[UIView setCenter:](&v8, sel_setCenter_, x, y);
  if (v7 != y)
    -[UIScrollView _sendGeometryAffectingContentBottomChangedToScrollObservers](self, "_sendGeometryAffectingContentBottomChangedToScrollObservers");
}

- (NSISVariable)_contentXOffsetVariable
{
  return self->_contentXOffsetVariable;
}

- (NSISVariable)_contentYOffsetVariable
{
  return self->_contentYOffsetVariable;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  char HasDescendant;
  id v10;
  id v11;
  UIScrollView *v12;
  unint64_t v13;
  NSObject *v14;
  UIScrollView *v15;
  NSObject *v17;
  _QWORD v18[5];
  objc_super v19;
  uint8_t buf[4];
  UIScrollView *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)UIScrollView;
  -[UIView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_lastScrollInterruptionByPointerEventTime != 0.0)
    {
      v6 = (void *)UIApp;
      -[UIView _window](self, "_window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __34__UIScrollView_hitTest_withEvent___block_invoke;
      v18[3] = &unk_1E16EA9E8;
      v18[4] = self;
      LODWORD(v6) = objc_msgSend(v6, "_eatCurrentTouchForWindow:ifPredicate:", v7, v18);

      if ((_DWORD)v6)
        goto LABEL_16;
    }
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x100000000000) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_draggingChildScrollView);
      HasDescendant = _ViewHasDescendant(self, WeakRetained);

      if ((HasDescendant & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)&self->_draggingChildScrollView);
        if ((objc_msgSend(v5, "isDescendantOfView:", v10) & 1) == 0)
        {
          v11 = v10;

          v5 = v11;
        }

        goto LABEL_9;
      }
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = self;
          _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "Scroll view %@ thinks it's being dragged by a child that no longer exists. Please file a bug against UIKit | ScrollView", buf, 0xCu);
        }

      }
      else
      {
        v13 = hitTest_withEvent____s_category_0;
        if (!hitTest_withEvent____s_category_0)
        {
          v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&hitTest_withEvent____s_category_0);
        }
        v14 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = self;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Scroll view %@ thinks it's being dragged by a child that no longer exists. Please file a bug against UIKit | ScrollView", buf, 0xCu);
        }
      }
      objc_storeWeak((id *)&self->_draggingChildScrollView, 0);
      *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x100000000000uLL;
LABEL_16:
      v12 = self;
      goto LABEL_17;
    }
  }
LABEL_9:
  v12 = v5;
  v5 = v12;
LABEL_17:
  v15 = v12;

  return v15;
}

- (void)stopScrollingAndZooming
{
  -[UIScrollView _stopScrollingAndZoomingAnimationsPinningToContentViewport:](self, "_stopScrollingAndZoomingAnimationsPinningToContentViewport:", 1);
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  _UIPressGestureRecognizer *keyboardScrollingGestureRecognizer;
  int v7;

  keyboardScrollingGestureRecognizer = self->_keyboardScrollingGestureRecognizer;
  v7 = objc_msgSend(a4, "_isGestureType:", 17);
  if (keyboardScrollingGestureRecognizer != a3 || v7 == 0)
    return 0;
  else
    return _UIFocusEnvironmentIsFocusedOrContainsFocus(self);
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  _UIPressGestureRecognizer *keyboardScrollingGestureRecognizer;
  int v7;
  int v9;

  keyboardScrollingGestureRecognizer = self->_keyboardScrollingGestureRecognizer;
  v7 = objc_msgSend(a4, "_isGestureType:", 17);
  if (keyboardScrollingGestureRecognizer != a3 || v7 == 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = -[UIView isFirstResponder](self, "isFirstResponder");
    if (v9)
      LOBYTE(v9) = _UIFocusEnvironmentIsFocusedOrContainsFocus(self) ^ 1;
  }
  return v9;
}

uint64_t __72__UIScrollView__flashScrollIndicatorsForAxes_persistingPreviousFlashes___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 56))
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1536), "setAlpha:", *(double *)(result + 40));
  if (*(_BYTE *)(v1 + 57))
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 1528), "setAlpha:", *(double *)(v1 + 48));
  return result;
}

uint64_t __37__UIScrollView__hideScrollIndicators__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1528), "setAlpha:", 0.0);
}

- (void)_traitCollectionDidChangeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  double v5;
  objc_super v6;

  if (a3->var4.var0)
  {
    objc_msgSend(a3->var1, "displayScale");
    if (v5 != 0.0)
      self->_accuracy = v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  -[UIView _traitCollectionDidChangeInternal:](&v6, sel__traitCollectionDidChangeInternal_, a3);
}

- (void)_accumulateViewConstraintsIntoArray:(id)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  -[UIView _accumulateViewConstraintsIntoArray:](&v7, sel__accumulateViewConstraintsIntoArray_);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIScrollView _automaticContentConstraints](self, "_automaticContentConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIScrollView _automaticContentConstraints](self, "_automaticContentConstraints");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "addObjectsFromArray:", v6);

    }
  }
}

- (void)_createGestureRecognizersForCurrentTouchLevel
{
  UIScrollViewDelayedTouchesBeganGestureRecognizer *v3;
  UIScrollViewDelayedTouchesBeganGestureRecognizer *touchDelayGestureRecognizer;
  UIScrollViewPanGestureRecognizer *v5;
  UIScrollViewPanGestureRecognizer *pan;
  UIScrollViewKnobLongPressGestureRecognizer *v7;
  UIScrollViewKnobLongPressGestureRecognizer *knobLongPressGestureRecognizer;
  UIScrollViewKnobLongPressGestureRecognizer *v9;
  UIScrollViewKnobLongPressGestureRecognizer *knobPointerLongPressGestureRecognizer;
  UIHoverGestureRecognizer *v11;
  UIHoverGestureRecognizer *knobHoverGestureRecognizer;
  void (**v13)(void *, uint64_t);
  _UIDragAutoScrollGestureRecognizer *v14;
  _UIDragAutoScrollGestureRecognizer *dragAutoScrollGestureRecognizer;
  _UIPressGestureRecognizer *v16;
  _UIPressGestureRecognizer *keyboardScrollingGestureRecognizer;
  _QWORD aBlock[5];

  if (self->_touchLevel != 2)
  {
    if (!self->_touchDelayGestureRecognizer)
    {
      v3 = -[UIGestureRecognizer initWithTarget:action:]([UIScrollViewDelayedTouchesBeganGestureRecognizer alloc], "initWithTarget:action:", self, sel_delayed_);
      touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
      self->_touchDelayGestureRecognizer = v3;

      -[UIGestureRecognizer setDelegate:](self->_touchDelayGestureRecognizer, "setDelegate:", self);
      -[UIGestureRecognizer setDelaysTouchesBegan:](self->_touchDelayGestureRecognizer, "setDelaysTouchesBegan:", 1);
      -[UIGestureRecognizer setEnabled:](self->_touchDelayGestureRecognizer, "setEnabled:", (*(_QWORD *)&self->_scrollViewFlags & 0x100000) == 0);
      -[UIGestureRecognizer setAllowedTouchTypes:](self->_touchDelayGestureRecognizer, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
      -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](self->_touchDelayGestureRecognizer, "_setRequiresSystemGesturesToFail:", 1);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_touchDelayGestureRecognizer);
    }
    if (!self->_pan)
    {
      v5 = -[UIScrollViewPanGestureRecognizer initWithTarget:action:]([UIScrollViewPanGestureRecognizer alloc], "initWithTarget:action:", self, objc_msgSend((id)objc_opt_class(), "_panGestureAction"));
      pan = self->_pan;
      self->_pan = v5;

      -[UIScrollViewPanGestureRecognizer setScrollView:](self->_pan, "setScrollView:", self);
      -[UIScrollView _updateScrollGestureRecognizersEnabled](self, "_updateScrollGestureRecognizersEnabled");
      -[UIScrollViewPanGestureRecognizer setDelegate:](self->_pan, "setDelegate:", self);
      -[UIGestureRecognizer setDelaysTouchesEnded:](self->_pan, "setDelaysTouchesEnded:", 0);
      -[UIScrollViewPanGestureRecognizer setAllowedTouchTypes:](self->_pan, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_pan);
      -[UIScrollView _updatePinchGesture](self, "_updatePinchGesture");
      -[UIScrollView _updatePagingGestures](self, "_updatePagingGestures");
    }
    if (!self->_knobLongPressGestureRecognizer)
    {
      v7 = -[UIScrollViewKnobLongPressGestureRecognizer initWithTarget:action:]([UIScrollViewKnobLongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleKnobLongPressGesture_);
      knobLongPressGestureRecognizer = self->_knobLongPressGestureRecognizer;
      self->_knobLongPressGestureRecognizer = v7;

      -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_knobLongPressGestureRecognizer, "setMinimumPressDuration:", 0.1);
      -[UIGestureRecognizer setDelegate:](self->_knobLongPressGestureRecognizer, "setDelegate:", self);
      -[UIGestureRecognizer setAllowedTouchTypes:](self->_knobLongPressGestureRecognizer, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_knobLongPressGestureRecognizer);
    }
    if (!self->_knobPointerLongPressGestureRecognizer)
    {
      v9 = -[UIScrollViewKnobLongPressGestureRecognizer initWithTarget:action:]([UIScrollViewKnobLongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleKnobLongPressGesture_);
      knobPointerLongPressGestureRecognizer = self->_knobPointerLongPressGestureRecognizer;
      self->_knobPointerLongPressGestureRecognizer = v9;

      -[UIScrollViewKnobLongPressGestureRecognizer setForPointer:](self->_knobPointerLongPressGestureRecognizer, "setForPointer:", 1);
      -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_knobPointerLongPressGestureRecognizer, "setMinimumPressDuration:", 0.0);
      -[UIGestureRecognizer setDelegate:](self->_knobPointerLongPressGestureRecognizer, "setDelegate:", self);
      -[UIGestureRecognizer setAllowedTouchTypes:](self->_knobPointerLongPressGestureRecognizer, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_knobPointerLongPressGestureRecognizer);
    }
    if (!self->_knobHoverGestureRecognizer)
    {
      v11 = -[UIHoverGestureRecognizer initWithTarget:action:]([UIHoverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleKnobHoverGesture_);
      knobHoverGestureRecognizer = self->_knobHoverGestureRecognizer;
      self->_knobHoverGestureRecognizer = v11;

      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_knobHoverGestureRecognizer);
    }
  }
  if (-[UIScrollView _usesLowFidelityPanning](self, "_usesLowFidelityPanning")
    && !self->_lowFidelitySwipeGestureRecognizers[0])
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__UIScrollView__createGestureRecognizersForCurrentTouchLevel__block_invoke;
    aBlock[3] = &unk_1E16C3F48;
    aBlock[4] = self;
    v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v13[2](v13, 2);
    v13[2](v13, 1);
    v13[2](v13, 4);
    v13[2](v13, 8);
    -[UIScrollView _updateScrollGestureRecognizersEnabled](self, "_updateScrollGestureRecognizersEnabled");

  }
  if (!self->_dragAutoScrollGestureRecognizer)
  {
    v14 = -[UIDragGestureRecognizer initWithTarget:action:]([_UIDragAutoScrollGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleAutoScroll_);
    dragAutoScrollGestureRecognizer = self->_dragAutoScrollGestureRecognizer;
    self->_dragAutoScrollGestureRecognizer = v14;

    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_dragAutoScrollGestureRecognizer);
  }
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling"))
  {
    if (!self->_keyboardScrollingGestureRecognizer)
    {
      v16 = -[UIGestureRecognizer initWithTarget:action:]([_UIPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleKeyboardScrollingPressGesture_);
      keyboardScrollingGestureRecognizer = self->_keyboardScrollingGestureRecognizer;
      self->_keyboardScrollingGestureRecognizer = v16;

      -[_UIPressGestureRecognizer setDelegate:](self->_keyboardScrollingGestureRecognizer, "setDelegate:", self);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_keyboardScrollingGestureRecognizer);
    }
  }
}

- (BOOL)_platformUsesGestureRecognizersForKeyboardScrolling
{
  return 1;
}

- (void)_updatePinchGesture
{
  UIScrollViewPinchGestureRecognizer *pinch;
  UIScrollViewPinchGestureRecognizer *v4;
  UIScrollViewPinchGestureRecognizer *v5;
  UIScrollViewPinchGestureRecognizer *v6;
  void *v7;
  UIScrollViewPinchGestureRecognizer *v8;

  pinch = self->_pinch;
  if (self->_minimumZoomScale == self->_maximumZoomScale)
  {
    if (pinch)
    {
      -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:");
      v8 = self->_pinch;
      self->_pinch = 0;

    }
  }
  else if (!pinch)
  {
    v4 = -[UIScrollViewPinchGestureRecognizer initWithTarget:action:]([UIScrollViewPinchGestureRecognizer alloc], "initWithTarget:action:", self, objc_msgSend((id)objc_opt_class(), "_pinchGestureAction"));
    v5 = self->_pinch;
    self->_pinch = v4;

    -[UIScrollViewPinchGestureRecognizer setScrollView:](self->_pinch, "setScrollView:", self);
    -[UIScrollViewPinchGestureRecognizer setDelegate:](self->_pinch, "setDelegate:", self);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_pinch, "setDelaysTouchesEnded:", 0);
    v6 = self->_pinch;
    if (objc_msgSend((id)UIApp, "_supportsIndirectInputEvents"))
      v7 = &unk_1E1A95300;
    else
      v7 = &unk_1E1A952E8;
    -[UIGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", v7);
    -[UIView _addGestureRecognizer:atEnd:]((uint64_t)self, self->_pinch, 0);
  }
  -[UIScrollView _updatePanGestureConfiguration](self, "_updatePanGestureConfiguration");
}

+ (SEL)_panGestureAction
{
  return sel_handlePan_;
}

+ (SEL)_pinchGestureAction
{
  return sel_handlePinch_;
}

- (BOOL)isDragging
{
  return *((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 7;
}

- (void)_sendDelayedTouchesIfNecessary
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  -[UIScrollView _scrollViewTouchDelayGesture](self, "_scrollViewTouchDelayGesture");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "state");
  v3 = v4;
  if (v4 && !v2 && (v4[1] & 0x200000000) != 0)
  {
    objc_msgSend(v4, "sendDelayedTouches");
    v3 = v4;
  }

}

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;

  v3 = scrollEnabled;
  -[UIScrollView _scrollViewTouchDelayGesture](self, "_scrollViewTouchDelayGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[UIScrollView _systemContentInset](self, "_systemContentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
  v15 = 0x100000;
  if (v3)
    v15 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFEFFFFFLL | v15;
  -[UIScrollView _updateScrollGestureRecognizersEnabled](self, "_updateScrollGestureRecognizersEnabled");
  -[UIScrollView _updateUsesStaticScrollBar](self, "_updateUsesStaticScrollBar");
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v14, 0, v7, v9, v11, v13);
}

- (id)_scrollViewTouchDelayGesture
{
  return self->_touchDelayGestureRecognizer;
}

- (void)setContentSize:(CGSize)contentSize
{
  double height;
  double width;
  CGSize *p_contentSize;
  double v6;
  double v7;
  _BOOL4 v10;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double accuracy;
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
  double v38;
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
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  unint64_t v70;
  double v71;
  double v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  uint64_t j;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  id WeakRetained;
  double v89;
  double v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint64_t v96;

  height = contentSize.height;
  width = contentSize.width;
  v96 = *MEMORY[0x1E0C80C00];
  p_contentSize = &self->_contentSize;
  v7 = self->_contentSize.width;
  v6 = self->_contentSize.height;
  if (width == v7 && height == v6)
    return;
  v10 = v6 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v7 == *MEMORY[0x1E0C9D820];
  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(_BYTE *)&self->_scrollViewFlags & 1) == 0)
    goto LABEL_41;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v13 = v12;
  v15 = v14;
  v89 = v16;
  v18 = v17;
  -[UIView bounds](self, "bounds");
  v20 = v19;
  v90 = v21;
  -[UIScrollView contentOffset](self, "contentOffset");
  v24 = v23;
  v25 = p_contentSize->width;
  if (width != p_contentSize->width)
  {
    v26 = v22;
    accuracy = self->_accuracy;
    v28 = self->_firstPageOffset.horizontal - v15;
    if (accuracy == 1.0)
    {
      v30 = round(v28);
      if (v26 >= v30)
      {
        v36 = round(v18 + v25) - v20;
        if (v30 >= v36)
          v36 = v30;
        if (v26 > v36)
        {
          v35 = round(width + v18);
          goto LABEL_21;
        }
      }
    }
    else
    {
      v29 = floor(v28);
      v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
      if (v26 >= v30)
      {
        v31 = v18 + v25;
        v32 = floor(v31);
        v33 = v32 + round((v31 - v32) * accuracy) / accuracy - v20;
        if (v30 >= v33)
          v33 = v30;
        if (v26 > v33)
        {
          v34 = floor(width + v18);
          v35 = v34 + round((width + v18 - v34) * accuracy) / accuracy;
LABEL_21:
          v37 = v35 - v20;
          if (v30 < v37)
            v30 = v37;
          if (v26 <= v30)
          {
            -[UIScrollViewPanGestureRecognizer translationInView:](self->_pan, "translationInView:", self);
            self->_startOffsetX = v26 + v38;
          }
        }
      }
    }
  }
  v39 = p_contentSize->height;
  if (height != v39)
  {
    v40 = self->_accuracy;
    v41 = self->_firstPageOffset.vertical - v13;
    if (v40 == 1.0)
    {
      v43 = round(v41);
      if (v24 < v43)
        goto LABEL_41;
      v49 = round(v89 + v39) - v90;
      if (v43 >= v49)
        v49 = v43;
      if (v24 <= v49)
        goto LABEL_41;
      v48 = round(height + v89);
    }
    else
    {
      v42 = floor(v41);
      v43 = v42 + round(v40 * (v41 - v42)) / v40;
      if (v24 < v43)
        goto LABEL_41;
      v44 = v89 + v39;
      v45 = floor(v44);
      v46 = v45 + round((v44 - v45) * v40) / v40 - v90;
      if (v43 >= v46)
        v46 = v43;
      if (v24 <= v46)
        goto LABEL_41;
      v47 = floor(height + v89);
      v48 = v47 + round((height + v89 - v47) * v40) / v40;
    }
    v50 = v48 - v90;
    if (v43 < v50)
      v43 = v50;
    if (v24 <= v43)
    {
      -[UIScrollViewPanGestureRecognizer translationInView:](self->_pan, "translationInView:", self);
      self->_startOffsetY = v24 + v51;
    }
  }
LABEL_41:
  if (-[UIScrollView _effectiveShouldPreventFocusScrollPastContentSize](self, "_effectiveShouldPreventFocusScrollPastContentSize"))
  {
    -[UIView _focusSystem](self, "_focusSystem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:](_UIFocusSystemSceneComponent, "sceneComponentForFocusSystem:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "scrollManager");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "isScrollingScrollableContainer:", self))
      {
        objc_msgSend(v54, "targetContentOffsetForScrollableContainer:", self);
        v56 = v55;
        v58 = v57;
        -[UIScrollView _maximumContentOffsetForContentSize:](self, "_maximumContentOffsetForContentSize:", width, height);
        if (v60 < v56 || v59 < v58)
          objc_msgSend(v54, "cancelScrollingForScrollableContainer:", self);
      }

    }
  }
  -[UIScrollView _systemContentInset](self, "_systemContentInset");
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v70 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
  v72 = p_contentSize->width;
  v71 = p_contentSize->height;
  p_contentSize->width = width;
  p_contentSize->height = height;
  -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
  -[UIScrollView _setNeedsUsesStaticScrollBarUpdate](self, "_setNeedsUsesStaticScrollBarUpdate");
  -[UIScrollView _updateGradientMaskView](self, "_updateGradientMaskView");
  if (v10)
  {
    if (self->_verticalScrollIndicator)
      -[UIView bringSubviewToFront:](self, "bringSubviewToFront:");
    if (self->_horizontalScrollIndicator)
      -[UIView bringSubviewToFront:](self, "bringSubviewToFront:");
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_accessoryViews, "objectEnumerator");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v75; ++i)
        {
          if (*(_QWORD *)v92 != v76)
            objc_enumerationMutation(v73);
          -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i));
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
      }
      while (v75);
    }

    if (self->_shadows)
    {
      for (j = 0; j != 10; ++j)
        -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", self->_shadows[j]);
    }
  }
  -[UIScrollView _old_updateAutomaticContentSizeConstraintsIfNecessaryWithContentSize:](self, "_old_updateAutomaticContentSizeConstraintsIfNecessaryWithContentSize:", width, height);
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
  {
    if (-[UIScrollView _shouldScrollToContentBeginningInRightToLeft](self, "_shouldScrollToContentBeginningInRightToLeft"))
    {
      if ((*(_QWORD *)((char *)p_scrollViewFlags + 12) & 0x200000000000000) == 0
        || (-[UIScrollView contentOffset](self, "contentOffset"),
            v80 = v79,
            -[UIView frame](self, "frame"),
            v80 == v72 - v81))
      {
        v82 = p_contentSize->width;
        -[UIView frame](self, "frame");
        v84 = v82 - v83;
        -[UIScrollView contentOffset](self, "contentOffset");
        v86 = v85;
        if (dyld_program_sdk_at_least())
        {
          -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
          v84 = v84 + v87;
        }
        -[UIScrollView setContentOffset:](self, "setContentOffset:", v84, v86);
      }
    }
  }
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v70, 1, v63, v65, v67, v69);
  if ((*(_QWORD *)((char *)p_scrollViewFlags + 12) & 0x800000) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "scrollViewDidChangeContentSize:", self);

  }
  if (v71 != p_contentSize->height)
    -[UIScrollView _sendGeometryAffectingContentBottomChangedToScrollObservers](self, "_sendGeometryAffectingContentBottomChangedToScrollObservers");
  *(_QWORD *)((char *)p_scrollViewFlags + 12) |= 0x200000000000000uLL;
  -[UIScrollView _updateLayoutMarginsGuideConstraintsIfNecessary](self, "_updateLayoutMarginsGuideConstraintsIfNecessary");
}

- (void)_updateLayoutMarginsGuideConstraintsIfNecessary
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIScrollView;
  -[UIView _updateLayoutMarginsGuideConstraintsIfNecessary](&v17, sel__updateLayoutMarginsGuideConstraintsIfNecessary);
  -[UIScrollView _contentMarginsGuideIfExists](self, "_contentMarginsGuideIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView layoutMargins](self, "layoutMargins");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "_systemConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v5);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v7);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConstant:", v9);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", v11);

  }
}

- (id)_contentMarginsGuideIfExists
{
  return self->_contentMarginsGuide;
}

- (void)_scrollViewDidLayoutSubviews
{
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x2000000) != 0)
    -[UIScrollView _updateUsesStaticScrollBar](self, "_updateUsesStaticScrollBar");
  -[UIScrollView _updateGradientMaskView](self, "_updateGradientMaskView");
  -[_UIScrollViewLayoutObserver _scrollViewDidLayoutSubviews:](self->_layoutObserver, "_scrollViewDidLayoutSubviews:", self);
}

- (void)_updateGradientMaskView
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000000) != 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v4 = 0u;
    v5 = 0u;
    -[UIScrollView _getGradientMaskBounds:startInsets:endInsets:intensities:](self, "_getGradientMaskBounds:startInsets:endInsets:intensities:", &v4, &v10, &v8, &v6);
    -[UIView _safeMaskView](self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateWithFrame:gradientStartInsets:gradientEndInsets:gradientIntensities:", v4, v5, v10, v11, v8, v9, v6, v7);

  }
}

- (void)_old_updateAutomaticContentSizeConstraintsIfNecessaryWithContentSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIView superview](self, "superview");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      if ((*(_QWORD *)(v6 + 104) & 0x1000000000000000) == 0
        && (*(_QWORD *)&self->super._viewFlags & 0x800000000000000) != 0)
      {
        v13 = (void *)v6;
        v8 = -[UIScrollView _wantsConstrainedContentSize](self, "_wantsConstrainedContentSize");
        v7 = v13;
        if (!v8)
        {
          -[UIScrollView _automaticContentConstraints](self, "_automaticContentConstraints");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "objectAtIndex:", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndex:", 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setConstant:", width);
            objc_msgSend(v12, "setConstant:", height);

          }
          else
          {
            -[UIScrollView _constraintsFromContentSize](self, "_constraintsFromContentSize");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIScrollView _setAutomaticContentConstraints:](self, "_setAutomaticContentConstraints:", v11);
          }

          v7 = v13;
        }
      }
    }

  }
}

- (void)_setNeedsUsesStaticScrollBarUpdate
{
  _BOOL4 v3;

  v3 = self->_staticScrollBar == 0;
  if (((v3 ^ -[UIScrollView _shouldUseStaticScrollBar](self, "_shouldUseStaticScrollBar")) & 1) == 0)
  {
    *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x2000000u;
    -[UIScrollView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_effectiveShouldPreventFocusScrollPastContentSize
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000000 | *((_DWORD *)&self->_scrollViewFlags + 5) & 0x8000000) != 0;
}

- (void)_adjustContentOffsetIfNecessary
{
  double v3;
  double v4;

  -[UIScrollView contentOffset](self, "contentOffset");
  -[UIScrollView _adjustedContentOffsetForContentOffset:skipsAdjustmentIfScrolling:](self, "_adjustedContentOffsetForContentOffset:skipsAdjustmentIfScrolling:", -[UIScrollView _skipsContentOffsetAdjustmentsIfScrolling](self, "_skipsContentOffsetAdjustmentsIfScrolling"), v3, v4);
  -[UIScrollView _applyAutomaticAdjustedContentOffset:](self, "_applyAutomaticAdjustedContentOffset:");
  -[UIScrollView _adjustShadowsIfNecessary](self, "_adjustShadowsIfNecessary");
  -[UIScrollView _updateContentFitDisableScrolling](self, "_updateContentFitDisableScrolling");
}

- (BOOL)_skipsContentOffsetAdjustmentsIfScrolling
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 46) & 1;
}

- (void)_adjustShadowsIfNecessary
{
  if (self->_shadows)
    -[UIScrollView _adjustBackgroundShadowsForContentSizeForcedVisible:](self, "_adjustBackgroundShadowsForContentSizeForcedVisible:", 0);
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 skipsAdjustmentIfScrolling:(BOOL)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[UIScrollView _adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:](self, "_adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:", a4, a3.x, a3.y, self->_contentSize.width, self->_contentSize.height);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_applyAutomaticAdjustedContentOffset:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[UIScrollView isAutomaticContentOffsetAdjustmentsAnimated](self, "isAutomaticContentOffsetAdjustmentsAnimated"))
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, x, y);
  else
    -[UIScrollView setContentOffset:](self, "setContentOffset:", x, y);
}

- (BOOL)isAutomaticContentOffsetAdjustmentsAnimated
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 18) & 1;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _BOOL4 v8;
  _BOOL8 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  char v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  objc_super v51;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = -[UIScrollView _shouldContentOffsetMaintainRelativeDistanceFromSafeArea](self, "_shouldContentOffsetMaintainRelativeDistanceFromSafeArea");
  v9 = -[UIScrollView _isAutomaticContentOffsetAdjustmentEnabled](self, "_isAutomaticContentOffsetAdjustmentEnabled");
  if (v8)
    -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](self, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v51.receiver = self;
  v51.super_class = (Class)UIScrollView;
  -[UIView setSafeAreaInsets:](&v51, sel_setSafeAreaInsets_, top, left, bottom, right);
  if (v8)
    -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](self, "_setAutomaticContentOffsetAdjustmentEnabled:", v9);
  v18 = -[UIScrollView _edgesApplyingSafeAreaInsetsToContentInset](self, "_edgesApplyingSafeAreaInsetsToContentInset");
  v49 = v11 + 0.0;
  if ((v18 & 1) != 0)
    v19 = v11 + 0.0;
  else
    v19 = 0.0;
  v46 = top + 0.0;
  if ((v18 & 1) != 0)
    v20 = top + 0.0;
  else
    v20 = 0.0;
  v48 = v13 + 0.0;
  if ((v18 & 2) != 0)
    v21 = v13 + 0.0;
  else
    v21 = 0.0;
  v44 = left + 0.0;
  if ((v18 & 2) != 0)
    v22 = left + 0.0;
  else
    v22 = 0.0;
  v47 = v15 + 0.0;
  if ((v18 & 4) != 0)
    v23 = v15 + 0.0;
  else
    v23 = 0.0;
  v43 = bottom + 0.0;
  if ((v18 & 4) != 0)
    v24 = bottom + 0.0;
  else
    v24 = 0.0;
  v45 = v17 + 0.0;
  if ((v18 & 8) != 0)
    v25 = v17 + 0.0;
  else
    v25 = 0.0;
  v50 = v20;
  if ((v18 & 8) != 0)
    v26 = right + 0.0;
  else
    v26 = 0.0;
  v27 = v19;
  _UIScrollViewAdjustForOverlayInsetsChangeIfNecessary(self, 0, v20, v22, v24, v26, v19, v21, v23, v25);
  if (v21 == v22 && v27 == v50 && v25 == v26 && v23 == v24)
  {
    v31 = -[UIScrollView _edgesApplyingBaseInsetsToScrollIndicatorInsets](self, "_edgesApplyingBaseInsetsToScrollIndicatorInsets");
    v33 = v48;
    v32 = v49;
    if ((v31 & 1) == 0)
      v32 = 0.0;
    v34 = v46;
    v35 = v47;
    if ((v31 & 1) == 0)
      v34 = 0.0;
    if ((v31 & 2) == 0)
      v33 = 0.0;
    v37 = v43;
    v36 = v44;
    if ((v31 & 2) == 0)
      v36 = 0.0;
    if ((v31 & 4) == 0)
    {
      v35 = 0.0;
      v37 = 0.0;
    }
    v38 = v45;
    if ((v31 & 8) == 0)
      v38 = 0.0;
    v39 = right + 0.0;
    if ((v31 & 8) == 0)
      v39 = 0.0;
    if (v33 != v36 || v32 != v34 || v38 != v39 || v35 != v37)
      -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets", v32, v34);
  }
}

- (void)_setAutomaticContentOffsetAdjustmentEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)_isAutomaticContentOffsetAdjustmentEnabled
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20000) == 0;
}

- (unint64_t)_edgesApplyingBaseInsetsToScrollIndicatorInsets
{
  int v2;

  v2 = (*((_DWORD *)&self->_scrollViewFlags + 5) >> 7) & 3;
  if (v2 == 1)
    return 15;
  if (v2 == 2)
    return 0;
  return -[UIScrollView _edgesApplyingSafeAreaInsetsToScrollAccessoryInsets](self, "_edgesApplyingSafeAreaInsetsToScrollAccessoryInsets");
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 contentSize:(CGSize)a4 skipsAdjustmentIfScrolling:(BOOL)a5
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double accuracy;
  UIOffset *p_firstPageOffset;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  unsigned __int8 v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v62;
  double v63;
  double v64;
  CGPoint result;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v63 = v12;
  v64 = v11;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[UIScrollView isTracking](self, "isTracking")
     || -[UIScrollView isDecelerating](self, "isDecelerating")
     || -[UIScrollView isScrollAnimating](self, "isScrollAnimating");
  accuracy = self->_accuracy;
  p_firstPageOffset = &self->_firstPageOffset;
  v24 = self->_firstPageOffset.vertical - v14;
  if (accuracy == 1.0)
  {
    if (y >= round(v24))
    {
      v28 = round(p_firstPageOffset->horizontal - v16);
      goto LABEL_11;
    }
LABEL_9:
    v29 = 1;
    goto LABEL_12;
  }
  v25 = floor(v24);
  if (y < v25 + round(accuracy * (v24 - v25)) / accuracy)
    goto LABEL_9;
  v26 = p_firstPageOffset->horizontal - v16;
  v27 = floor(v26);
  v28 = v27 + round(accuracy * (v26 - v27)) / accuracy;
LABEL_11:
  v29 = x < v28;
LABEL_12:
  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20000) != 0)
  {
    -[UIScrollView contentAlignmentPoint](self, "contentAlignmentPoint");
    v31 = v32 == *MEMORY[0x1E0C9D538];
    if (v33 != *(double *)(MEMORY[0x1E0C9D538] + 8))
      v31 = 0;
  }
  else
  {
    v31 = 0;
  }
  if ((*(_QWORD *)p_scrollViewFlags & 0x80) == 0
    && (*(_QWORD *)p_scrollViewFlags >> 30) & 1 | (v31 || v5 && v21 && v29))
  {
    v34 = x;
    goto LABEL_51;
  }
  v35 = *(uint64_t *)&self->_accuracy;
  if (*(double *)&v35 == 1.0)
  {
    if (round(v64) < round(v20 + width + v16))
    {
      v34 = round(p_firstPageOffset->horizontal - v16);
      v43 = v63;
      if (x >= v34)
      {
        v42 = round(width + v20);
        v34 = x;
        if (x + v64 > v42)
        {
LABEL_27:
          v34 = v42 - v64;
          goto LABEL_38;
        }
      }
      goto LABEL_42;
    }
  }
  else
  {
    v36.f64[0] = v64;
    v36.f64[1] = v20 + width + v16;
    v37 = vrndmq_f64(v36);
    v38 = vaddq_f64(v37, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v36, v37), *(double *)&v35)), (float64x2_t)vdupq_lane_s64(v35, 0)));
    if ((vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(v38, (float64x2_t)vdupq_laneq_s64((int64x2_t)v38, 1)))).u32[0] & 1) != 0)
    {
      v39 = p_firstPageOffset->horizontal - v16;
      v40 = floor(v39);
      v34 = v40 + round(*(double *)&v35 * (v39 - v40)) / *(double *)&v35;
      if (x >= v34)
      {
        v41 = floor(width + v20);
        v42 = v41 + round((width + v20 - v41) * *(double *)&v35) / *(double *)&v35;
        v43 = v63;
        if (x + v64 <= v42)
        {
          v34 = x;
          goto LABEL_38;
        }
        goto LABEL_27;
      }
      goto LABEL_34;
    }
  }
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0
    || (v44 = -[UIScrollView _shouldScrollToContentBeginningInRightToLeft](self, "_shouldScrollToContentBeginningInRightToLeft"), v35 = *(uint64_t *)&self->_accuracy, !v44))
  {
    v50 = p_firstPageOffset->horizontal - v16;
    if (*(double *)&v35 != 1.0)
    {
      v51 = floor(v50);
      v34 = v51 + round(*(double *)&v35 * (v50 - v51)) / *(double *)&v35;
LABEL_34:
      v43 = v63;
      goto LABEL_38;
    }
    v34 = round(v50);
    v43 = v63;
LABEL_42:
    v60 = round(self->_firstPageOffset.vertical - v14);
    if (round(v43) >= round(v18 + height + v14) || y < v60)
    {
      y = v60;
      goto LABEL_51;
    }
    v57 = y + v43;
    v59 = round(height + v18);
    goto LABEL_48;
  }
  v45 = v20 + width + v16;
  if (*(double *)&v35 == 1.0)
  {
    v47 = round(v45);
    v49 = round(v64);
  }
  else
  {
    v46 = floor(v45);
    v47 = v46 + round((v45 - v46) * *(double *)&v35) / *(double *)&v35;
    v48 = floor(v64);
    v49 = v48 + round((v64 - v48) * *(double *)&v35) / *(double *)&v35;
  }
  v43 = v63;
  v34 = v47 - v49;
LABEL_38:
  if (*(double *)&v35 == 1.0)
    goto LABEL_42;
  v52.f64[0] = v43;
  v52.f64[1] = v18 + height + v14;
  v53 = vrndmq_f64(v52);
  v54 = vaddq_f64(v53, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v52, v53), *(double *)&v35)), (float64x2_t)vdupq_lane_s64(v35, 0)));
  v55 = vmovn_s64(vcgeq_f64(v54, (float64x2_t)vdupq_laneq_s64((int64x2_t)v54, 1))).u8[0];
  v54.f64[0] = self->_firstPageOffset.vertical - v14;
  v52.f64[0] = floor(v54.f64[0]);
  v56 = v52.f64[0] + round(*(double *)&v35 * (v54.f64[0] - v52.f64[0])) / *(double *)&v35;
  if ((v55 & 1) != 0 || y < v56)
  {
    y = v56;
    goto LABEL_51;
  }
  v57 = y + v43;
  v58 = floor(height + v18);
  v59 = v58 + round((height + v18 - v58) * *(double *)&v35) / *(double *)&v35;
LABEL_48:
  if (v57 > v59)
    y = v59 - v43;
LABEL_51:
  v62 = y;
  result.y = v62;
  result.x = v34;
  return result;
}

- (BOOL)_shouldContentOffsetMaintainRelativeDistanceFromSafeArea
{
  _BOOL4 v4;
  _BOOL4 deferredUpdateTargetIsValid;

  if (-[UIScrollView _shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange](self, "_shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange"))
  {
    return 0;
  }
  if (-[UIScrollView isTracking](self, "isTracking")
    || -[UIScrollView isDecelerating](self, "isDecelerating")
    || -[UIScrollView isScrollAnimating](self, "isScrollAnimating"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = !-[UIScrollView _isScrollingToTop](self, "_isScrollingToTop");
  }
  deferredUpdateTargetIsValid = self->_deferredUpdateTargetIsValid;
  if ((-[_UIScrollViewScrollableAncestor _descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:](self->_scrollableAncestor, "_descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:", self) & 1) != 0)return 1;
  if (deferredUpdateTargetIsValid)
    return 0;
  return v4;
}

- (BOOL)isScrollAnimating
{
  id WeakRetained;
  BOOL scrollAnimatingViaAssertion;

  WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained)
    scrollAnimatingViaAssertion = 1;
  else
    scrollAnimatingViaAssertion = self->_scrollAnimatingViaAssertion;

  return scrollAnimatingViaAssertion;
}

- (BOOL)isTracking
{
  return *(_DWORD *)&self->_scrollViewFlags & 1;
}

- (BOOL)_shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 26) & 1;
}

- (BOOL)_isScrollingToTop
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 13) & 1;
}

- (void)setContentOffset:(CGPoint)contentOffset
{
  double y;
  double x;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v21;
  double v22;
  UIScrollView *v23;
  void *v25;
  CFTimeInterval v26;
  double telemetryOffsetChangeTime;
  double v28;
  CGFloat v29;
  id v30;
  _QWORD *v31;
  uint32_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  double v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[2];
  uint64_t (*v66)();
  void *v67;
  UIScrollView *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  _BYTE v73[128];
  uint64_t v74;

  y = contentOffset.y;
  x = contentOffset.x;
  v74 = *MEMORY[0x1E0C80C00];
  p_scrollViewFlags = &self->_scrollViewFlags;
  v7 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v7 | 0x40000000000000;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIScrollView _roundedProposedContentOffset:](self, "_roundedProposedContentOffset:", x, y);
  if ((*((_BYTE *)p_scrollViewFlags + 2) & 8) == 0)
  {
    v18 = v16;
    v19 = v17;
    if (v9 != v16 || v11 != v17)
    {
      v59 = v9;
      v60 = v11;
      v21 = vabdd_f64(v16, v9);
      v22 = vabdd_f64(v17, v11);
      v23 = self;
      if (v21 >= 2.22044605e-16 || v22 >= 2.22044605e-16)
      {
        _UIMainBundleIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = CACurrentMediaTime();
          telemetryOffsetChangeTime = v23->_telemetryOffsetChangeTime;
          v23->_telemetryOffsetChangeTime = v26;
          ++v23->_telemetryOffsetChangeCount;
          v28 = v26 - telemetryOffsetChangeTime;
          v29 = v22 + v23->_telemetryOffsetChange.height;
          v23->_telemetryOffsetChange.width = v21 + v23->_telemetryOffsetChange.width;
          v23->_telemetryOffsetChange.height = v29;
          if (v28 < 0.018)
            v23->_telemetryOffsetChangeHighRateDuration = v28 + v23->_telemetryOffsetChangeHighRateDuration;
          v57 = v28;
          if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ScrollViewOffsetChangeLogging, (uint64_t)CFSTR("ScrollViewOffsetChangeLogging"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1ECD769E4)
          {
            v65[0] = MEMORY[0x1E0C809B0];
            v65[1] = 3221225472;
            v66 = ___telemetryReportOffsetChange_block_invoke;
            v67 = &unk_1E16E2EC0;
            v68 = v23;
            v69 = v25;
            v70 = v57;
            v71 = v21;
            v72 = v22;
            v31 = v65;
            v32 = _telemetryDownsample_sample;
            if (!_telemetryDownsample_sample)
              v32 = arc4random_uniform(0x80u) + 1;
            _telemetryDownsample_sample = v32 + 1;
            if (v32 >= 0x80)
            {
              ((void (*)(_QWORD *))v66)(v31);
              _telemetryDownsample_sample = 1;
            }

          }
          else
          {
            v30 = _telemetryOffsetChangeEvent(v23, v25, 1, v57, v21, v22);
          }
        }

      }
      v33 = (void *)MEMORY[0x186DC9484]();
      v23->_lastSetContentOffsetUnrounded.x = x;
      v23->_lastSetContentOffsetUnrounded.y = y;
      -[UIView layer](v23, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "superlayer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_msgSend(v35, "needsLayoutOnGeometryChange");
      objc_msgSend(v35, "setNeedsLayoutOnGeometryChange:", 0);
      -[_UIScrollViewVFD updateBounds:scale:]((unint64_t)v23->_vfd, v18, v19, v13, v15, v23->_accuracy);
      -[UIScrollView setBounds:](v23, "setBounds:", v18, v19, v13, v15);
      -[UIScrollView _layoutGuideOfType:createIfNecessary:](v23, "_layoutGuideOfType:createIfNecessary:", 2, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v54 = v36;
        v56 = v35;
        v58 = v7;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v55 = v37;
        objc_msgSend(v37, "_systemConstraints");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v62 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              objc_msgSend(v44, "identifier");
              v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v46 = v45;
              v47 = v18;
              if (v45 == CFSTR("UIScrollView-contentOffsetLayoutGuide-xOffset")
                || (v47 = v19, v45 == CFSTR("UIScrollView-contentOffsetLayoutGuide-yOffset")))
              {
                objc_msgSend(v44, "setConstant:", v47);
              }

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          }
          while (v41);
        }

        v7 = v58;
        v38 = v55;
        v35 = v56;
        v36 = v54;
      }
      objc_msgSend(v35, "setNeedsLayoutOnGeometryChange:", v36);
      -[UIScrollView _notifyDidScroll](v23, "_notifyDidScroll");
      -[_UIScrollViewScrollingAnimator cancelInteractiveScroll](v23->_keyboardScrollingAnimator, "cancelInteractiveScroll");
      v48 = *(_QWORD *)((char *)p_scrollViewFlags + 12);
      if ((v48 & 0x10000) != 0
        || -[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)v23)
        || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)v23))
      {
        -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](v23, "_adjustScrollerIndicators:alwaysShowingThem:", 1, (v48 >> 16) & 1);
      }
      if (p_scrollViewFlags->shouldRevealScrollIndicators)
      {
        if (v19 == v60)
          v49 = v18 != v59;
        else
          v49 = (v18 != v59) | 2;
        -[UIScrollView _flashScrollIndicatorsForAxes:persistingPreviousFlashes:](v23, "_flashScrollIndicatorsForAxes:persistingPreviousFlashes:", v49, 1);
      }
      -[UIScrollView _updateAccessories](v23, "_updateAccessories");
      if (v23->_shadows)
        -[UIScrollView _adjustBackgroundShadowsForContentSizeForcedVisible:](v23, "_adjustBackgroundShadowsForContentSizeForcedVisible:", 0);
      -[UIView _focusSystem](v23, "_focusSystem");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        -[UIView _window](v23, "_window");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "_isTextEffectsWindow");

        if ((v52 & 1) == 0)
        {
          objc_msgSend(v50, "_focusMovementCache");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "scrollableContainerDidScroll:", v23);

        }
      }

      objc_autoreleasePoolPop(v33);
    }
  }
  *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFBFFFFFFFF7FFFFLL | v7 & 0x40000000000000;
}

- (CGPoint)_roundedProposedContentOffset:(CGPoint)result
{
  CGFloat x;
  uint64_t v4;
  float64x2_t v5;
  double v6;
  double v7;

  x = result.x;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x3000000000) == 0)
  {
    v4 = *(uint64_t *)&self->_accuracy;
    if (fabs(*(double *)&v4) >= 2.22044605e-16)
    {
      if (*(double *)&v4 == 1.0)
      {
        *(CGPoint *)&result.y = (CGPoint)vrndaq_f64(*(float64x2_t *)&result.y);
      }
      else
      {
        v5 = vrndmq_f64(*(float64x2_t *)&result.y);
        *(CGPoint *)&result.y = (CGPoint)vaddq_f64(v5, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)&result.y, v5), *(double *)&v4)), (float64x2_t)vdupq_lane_s64(v4, 0)));
      }
    }
  }
  v7 = v6;
  result.x = v7;
  return result;
}

- (CGRect)visibleBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  id v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  v23.receiver = self;
  v23.super_class = (Class)UIScrollView;
  -[UIView visibleBounds](&v23, sel_visibleBounds);
  v4 = v3;
  v6 = v5;
  width = v7;
  height = v9;
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x1000000) != 0)
  {
    v11 = -[UIView _window](self, "_window");
    if (!v11)
      goto LABEL_4;
    v12 = v11;
    objc_msgSend(v11, "bounds");
    objc_msgSend(v12, "convertRect:toView:", self);
    v27.origin.x = v13;
    v27.origin.y = v14;
    v27.size.width = v15;
    v27.size.height = v16;
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = width;
    v24.size.height = height;
    v25 = CGRectIntersection(v24, v27);
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    if (!CGRectIsEmpty(v25))
    {
      v6 = y;
      v4 = x;
    }
    else
    {
LABEL_4:
      width = *MEMORY[0x1E0C9D820];
      height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  v19 = v4;
  v20 = v6;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)isDecelerating
{
  char v2;
  void *v4;
  void *v5;
  void *v6;

  if (self->_scrollHeartbeat)
    return 1;
  +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scrollManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v6, "isScrollingScrollableContainer:", self);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_needsLayoutOnVisibleBoundsChange
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 24) & 1;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  double v22;
  double v23;
  id WeakRetained;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIScrollView _systemContentInset](self, "_systemContentInset");
  v41 = v17;
  v42 = v16;
  v39 = v19;
  v40 = v18;
  v20 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
  v43.receiver = self;
  v43.super_class = (Class)UIScrollView;
  -[UIView setFrame:](&v43, sel_setFrame_, x, y, width, height);
  if (v13 != width || v15 != height)
  {
    v37 = v11;
    v38 = v9;
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x400000) != 0)
    {
      -[UIScrollView contentSize](self, "contentSize");
      v35 = v22;
      v36 = v23;
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      -[UIScrollView zoomScale](self, "zoomScale");
      objc_msgSend(WeakRetained, "scrollView:contentSizeForZoomScale:withProposedSize:", self);
      v26 = v25;
      v28 = v27;

      if (v35 != v26 || v36 != v28)
        -[UIScrollView setContentSize:](self, "setContentSize:", v26, v28);
    }
    -[UIView bounds](self, "bounds", *(_QWORD *)&v35);
    v31 = v30 * -0.000000184659091 + 0.000359090909;
    if (v30 > 1024.0)
      v31 = 0.00017;
    self->_pagingSpringPull = v31;
    -[UIView bounds](self, "bounds");
    v33 = v32 * 0.00000994318182 + 0.966818182;
    if (v32 > 1024.0)
      v33 = 0.977;
    self->_pagingFriction = v33;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v20, 0, v42, v41, v40, v39);
    v11 = v37;
    v9 = v38;
  }
  -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
  -[UIScrollView _updateUsesStaticScrollBar](self, "_updateUsesStaticScrollBar");
  v44.origin.x = v9;
  v44.origin.y = v11;
  v44.size.width = v13;
  v44.size.height = v15;
  MaxY = CGRectGetMaxY(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  if (MaxY != CGRectGetMaxY(v45))
    -[UIScrollView _sendGeometryAffectingContentBottomChangedToScrollObservers](self, "_sendGeometryAffectingContentBottomChangedToScrollObservers");
}

- (void)_updateContentFitDisableScrolling
{
  unsigned int v3;

  if (-[UIScrollView _canScrollX](self, "_canScrollX"))
  {
    v3 = 0;
  }
  else if (-[UIScrollView _canScrollY](self, "_canScrollY"))
  {
    v3 = 0;
  }
  else
  {
    v3 = ~(*(_DWORD *)&self->_scrollViewFlags >> 26) & 0x10;
  }
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)_canScrollX
{
  _BOOL4 v3;

  if (-[UIScrollView _canScrollIgnoringAncestorPermissionX](self, "_canScrollIgnoringAncestorPermissionX"))
    LOBYTE(v3) = 1;
  else
    return (*((unsigned __int8 *)&self->_scrollViewFlags + 1) >> 4) & 1;
  return v3;
}

- (BOOL)_canScrollIgnoringAncestorPermissionX
{
  _BOOL4 v3;

  if (-[UIScrollView _canScrollWithoutBouncingX](self, "_canScrollWithoutBouncingX"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[UIScrollView alwaysBounceHorizontal](self, "alwaysBounceHorizontal");
    if (v3)
      return (*(_BYTE *)&self->_scrollViewFlags >> 3) & 1;
  }
  return v3;
}

- (void)_updateUsesStaticScrollBar
{
  *((_DWORD *)&self->_scrollViewFlags + 5) &= ~0x2000000u;
  -[UIScrollView _setUsesStaticScrollBar:](self, "_setUsesStaticScrollBar:", -[UIScrollView _shouldUseStaticScrollBar](self, "_shouldUseStaticScrollBar"));
}

- (BOOL)_shouldUseStaticScrollBar
{
  double v3;
  uint64_t v4;
  double v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  float v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  double v18;

  -[UIView bounds](self, "bounds");
  v18 = v3;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v4 = *(uint64_t *)&self->_accuracy;
  v6.f64[0] = v5 + v6.f64[0] + self->_contentSize.height;
  if (*(double *)&v4 == 1.0)
  {
    v6.f64[0] = round(v6.f64[0]);
    v8 = round(v18);
  }
  else
  {
    v6.f64[1] = v18;
    v7 = vrndmq_f64(v6);
    v6 = vaddq_f64(v7, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v6, v7), *(double *)&v4)), (float64x2_t)vdupq_lane_s64(v4, 0)));
    v8 = v6.f64[1];
  }
  if (v6.f64[0] <= v8)
  {
    v10 = 1;
  }
  else
  {
    v9 = v8 / v6.f64[0];
    v10 = v9 > 0.99;
  }
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") == 3 && !-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
  {
    -[UIView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_capabilityForKey:", CFSTR("UIScreenCapabilityTouchLevelsKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue") == 2 || v10;
    v12 = (v16 & 1) == 0 && -[UIScrollView isScrollEnabled](self, "isScrollEnabled");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_setUsesStaticScrollBar:(BOOL)a3
{
  _UIStaticScrollBar *staticScrollBar;
  _UIStaticScrollBar *v5;
  _UIStaticScrollBar *v6;
  _UIStaticScrollBar *v7;

  staticScrollBar = self->_staticScrollBar;
  if (a3)
  {
    if (staticScrollBar)
      return;
    -[UIScrollView _createStaticScrollBar](self, "_createStaticScrollBar");
    v5 = (_UIStaticScrollBar *)objc_claimAutoreleasedReturnValue();
    v6 = self->_staticScrollBar;
    self->_staticScrollBar = v5;

    -[UIScrollView setAccessoryView:atEdge:](self, "setAccessoryView:atEdge:", self->_staticScrollBar, -[_UIStaticScrollBar desiredAccessoryEdge](self->_staticScrollBar, "desiredAccessoryEdge"));
  }
  else
  {
    if (!staticScrollBar)
      return;
    -[UIScrollView setAccessoryView:atEdge:](self, "setAccessoryView:atEdge:", 0, -[_UIStaticScrollBar edge](staticScrollBar, "edge"));
    v7 = self->_staticScrollBar;
    self->_staticScrollBar = 0;

  }
  -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 0);
}

- (BOOL)__canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIScrollView _contentFitCanScrollThreshold](self, "_contentFitCanScrollThreshold");
  v6 = v5;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v9 = v8 + v7 + self->_contentSize.height + a3;
  -[UIView bounds](self, "bounds");
  return v9 > v6 + v10 + 0.0001;
}

- (BOOL)_canScrollWithoutBouncingX
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[UIScrollView _contentFitCanScrollThreshold](self, "_contentFitCanScrollThreshold");
  v4 = v3;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v7 = v6 + v5 + self->_contentSize.width;
  -[UIView bounds](self, "bounds");
  return v7 > v4 + v8 + 0.0001;
}

- (double)_contentFitCanScrollThreshold
{
  return 0.0;
}

- (BOOL)_canScrollY
{
  _BOOL4 v3;

  if (-[UIScrollView _canScrollIgnoringAncestorPermissionY](self, "_canScrollIgnoringAncestorPermissionY"))
    LOBYTE(v3) = 1;
  else
    return (*((unsigned __int8 *)&self->_scrollViewFlags + 1) >> 5) & 1;
  return v3;
}

- (BOOL)_canScrollIgnoringAncestorPermissionY
{
  _BOOL4 v3;

  if (-[UIScrollView _canScrollWithoutBouncingY](self, "_canScrollWithoutBouncingY"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[UIScrollView alwaysBounceVertical](self, "alwaysBounceVertical");
    if (v3)
      return (*(_BYTE *)&self->_scrollViewFlags >> 2) & 1;
  }
  return v3;
}

- (BOOL)_canScrollWithoutBouncingY
{
  return -[UIScrollView __canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:](self, "__canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:", 0.0);
}

- (void)_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:(UIEdgeInsets)a3 oldEdgesPropagatingSafeAreaInsets:(unint64_t)a4 adjustContentOffsetIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  double right;
  double bottom;
  double left;
  double top;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  _UIScrollViewScrollIndicator *verticalScrollIndicator;
  _BOOL8 v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  id v23;

  v5 = a5;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIScrollView _systemContentInset](self, "_systemContentInset", a4);
  v15 = left == v12 && top == v11;
  if (!v15 || right != v14 || bottom != v13)
  {
    if (v5)
    {
      _UIScrollViewAdjustForOverlayInsetsChangeIfNecessary(self, 0, v11, v12, v13, v14, top, left, bottom, right);
    }
    else
    {
      -[UIScrollView _updateForChangedScrollRelatedInsets](self, "_updateForChangedScrollRelatedInsets");
      -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
    }
    verticalScrollIndicator = self->_verticalScrollIndicator;
    v15 = verticalScrollIndicator == 0;
    v19 = verticalScrollIndicator != 0;
    v20 = 1;
    if (!v15)
      v20 = 2;
    if (self->_horizontalScrollIndicator)
      v21 = v20;
    else
      v21 = v19;
    -[UIView subviews](self, "subviews");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count") <= v21)
    {

    }
    else
    {
      v22 = -[UIView _isInLayoutSubviews](self, "_isInLayoutSubviews");

      if (!v22)
        -[UIScrollView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (UIEdgeInsets)adjustedContentInset
{
  UIEdgeInsets *p_contentInset;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  p_contentInset = &self->_contentInset;
  -[UIScrollView _systemContentInset](self, "_systemContentInset");
  v4 = p_contentInset->top + v3;
  v6 = v5 + p_contentInset->left;
  v8 = v7 + p_contentInset->bottom;
  v10 = v9 + p_contentInset->right;
  result.right = v10;
  result.bottom = v8;
  result.left = v6;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)_systemContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIScrollView _systemContentInsetIncludingAccessories:](self, "_systemContentInsetIncludingAccessories:", 1);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  UIScrollViewPanGestureRecognizer *v4;
  BOOL v5;
  UIScrollViewPanGestureRecognizer *pan;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *swipe;
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
  double v23;
  uint64_t v24;
  double accuracy;
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
  double v37;
  double v38;
  double v39;
  double v40;
  UIScrollViewPanGestureRecognizer *v41;

  v4 = (UIScrollViewPanGestureRecognizer *)a3;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0 && self->_swipe == v4)
  {
    v41 = v4;
    v5 = -[UIGestureRecognizer state](self->_pan, "state") <= UIGestureRecognizerStateChanged;
    v4 = v41;
    if (v5)
    {
      pan = self->_pan;
      if (pan && (unint64_t)(pan->super.super._state - 1) <= 2)
        -[UIPanGestureRecognizer setTranslation:inView:](pan, "setTranslation:inView:", self, 0.0, 0.0);
      v7 = (void *)UIApp;
      -[UIView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v7, "_touchesEventForWindow:", v8);

      -[UIGestureRecognizer _activeTouchesForEvent:](self->_pan, "_activeTouchesForEvent:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
        -[UIScrollView _beginTrackingWithEvent:](self, "_beginTrackingWithEvent:", v9);

      goto LABEL_32;
    }
  }
  if (self->_pan == v4)
  {
    v41 = v4;
    swipe = self->_swipe;
    if (!swipe || (unint64_t)(swipe[9] - 1) >= 3)
      -[UIScrollView _handlePanFailure](self, "_handlePanFailure");
    -[UIScrollView _sendDelayedTouchesIfNecessary](self, "_sendDelayedTouchesIfNecessary");
    -[UIView bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    -[UIScrollView contentOffset](self, "contentOffset");
    v17 = v16;
    v19 = v18;
    -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
    v24 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
    v4 = v41;
    if ((v24 & 0x100000000000) != 0)
      goto LABEL_33;
    accuracy = self->_accuracy;
    v26 = self->_firstPageOffset.horizontal - v21;
    if (accuracy == 1.0)
    {
      v38 = round(v26);
      if (v17 >= v38)
      {
        v31 = round(self->_firstPageOffset.vertical - v20);
        if (v19 >= v31)
        {
          v39 = round(v23 + self->_contentSize.width) - v13;
          if (v38 < v39)
            v38 = v39;
          if (v17 <= v38)
          {
            v37 = round(v22 + self->_contentSize.height);
LABEL_35:
            v40 = v37 - v15;
            if (v31 < v40)
              v31 = v40;
            if ((v24 & 0x10000000000) == 0 || v19 <= v31)
              goto LABEL_33;
LABEL_31:
            -[UIScrollView _pushTrackingRunLoopModeIfNecessaryForReason:](self, "_pushTrackingRunLoopModeIfNecessaryForReason:", CFSTR("Pan failed while rubber-banding"));
            -[UIScrollView _updateDecelerationLastOffsetScrollViewPoint:](self, "_updateDecelerationLastOffsetScrollViewPoint:", v17, v19);
            -[UIScrollView _startTimer:](self, "_startTimer:", 1);
            goto LABEL_32;
          }
        }
      }
    }
    else
    {
      v27 = floor(v26);
      v28 = v27 + round(accuracy * (v26 - v27)) / accuracy;
      if (v17 >= v28)
      {
        v29 = self->_firstPageOffset.vertical - v20;
        v30 = floor(v29);
        v31 = v30 + round(accuracy * (v29 - v30)) / accuracy;
        if (v19 >= v31)
        {
          v32 = v23 + self->_contentSize.width;
          v33 = floor(v32);
          v34 = v33 + round(accuracy * (v32 - v33)) / accuracy - v13;
          if (v28 < v34)
            v28 = v34;
          if (v17 <= v28)
          {
            v35 = v22 + self->_contentSize.height;
            v36 = floor(v35);
            v37 = v36 + round(accuracy * (v35 - v36)) / accuracy;
            goto LABEL_35;
          }
        }
      }
    }
    if ((v24 & 0x10000000000) == 0)
      goto LABEL_33;
    goto LABEL_31;
  }
  if ((UIScrollViewPanGestureRecognizer *)self->_knobLongPressGestureRecognizer == v4)
  {
    v41 = v4;
    -[UIScrollView _sendDelayedTouchesIfNecessary](self, "_sendDelayedTouchesIfNecessary");
LABEL_32:
    v4 = v41;
  }
LABEL_33:

}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIScrollViewPanGestureRecognizer *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  UISwipeGestureRecognizer *v12;
  UISwipeGestureRecognizer *v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIFeedbackGeneratorUserInteractionDriven *knobFeedbackGenerator;
  void *v22;
  void *v23;
  UIFeedbackGeneratorUserInteractionDriven *v24;
  UIFeedbackGeneratorUserInteractionDriven *v25;
  BOOL v26;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t v31[16];
  uint8_t buf[16];

  v6 = (UIScrollViewPanGestureRecognizer *)a3;
  v7 = a4;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0
    || self->_pan != v6
    || (*(_BYTE *)&self->_scrollViewFlags & 1) != 0)
  {
    if (self->_lowFidelitySwipeGestureRecognizers[0])
    {
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = self->_lowFidelitySwipeGestureRecognizers[v11];

        if (v13 == (UISwipeGestureRecognizer *)v6)
          break;
        ++v11;
        v12 = v13;
        if (v11 == 4)
          goto LABEL_9;
      }
      v14 = -[UIScrollViewPanGestureRecognizer direction](v6, "direction");
      if ((unint64_t)(v14 - 1) >= 2)
      {
        if (v14 != 8)
        {
          v13 = (UISwipeGestureRecognizer *)v6;
          if (v14 != 4)
          {
LABEL_9:

            goto LABEL_16;
          }
        }
        v15 = -[UIScrollView _canScrollY](self, "_canScrollY");
      }
      else
      {
        v15 = -[UIScrollView _canScrollX](self, "_canScrollX");
      }
      v16 = v15;

      if (!v16)
        goto LABEL_27;
    }
  }
  else
  {
    v8 = (void *)UIApp;
    -[UIView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "_touchesEventForWindow:", v9);

    -[UIScrollView _beginTrackingWithEvent:](self, "_beginTrackingWithEvent:", v10);
  }
LABEL_16:
  if ((UIScrollViewPanGestureRecognizer *)self->_knobLongPressGestureRecognizer == v6
    || (UIScrollViewPanGestureRecognizer *)self->_knobPointerLongPressGestureRecognizer == v6)
  {
    objc_msgSend(v7, "locationInView:", self);
    v18 = v17;
    v20 = v19;
    if ((unint64_t)(-[UIScrollView _scrubbingForPoint:touch:](self, "_scrubbingForPoint:touch:", v7) - 1) <= 3)
    {
      knobFeedbackGenerator = self->_knobFeedbackGenerator;
      if (!knobFeedbackGenerator)
      {
        -[UIView traitCollection](self, "traitCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:](_UIScrollViewScrollIndicator, "visualStyleForTraitCollection:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v23, "feedbackGeneratorWithView:", self);
          v24 = (UIFeedbackGeneratorUserInteractionDriven *)objc_claimAutoreleasedReturnValue();
          v25 = self->_knobFeedbackGenerator;
          self->_knobFeedbackGenerator = v24;

        }
        if (!self->_knobFeedbackGenerator)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "_UIScrollViewScrollIndicatorVisualStyle should provide a feedback generator.", buf, 2u);
            }

          }
          else
          {
            v28 = _gestureRecognizer_shouldReceiveTouch____s_category;
            if (!_gestureRecognizer_shouldReceiveTouch____s_category)
            {
              v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v28, (unint64_t *)&_gestureRecognizer_shouldReceiveTouch____s_category);
            }
            v29 = *(NSObject **)(v28 + 8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v31 = 0;
              _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "_UIScrollViewScrollIndicatorVisualStyle should provide a feedback generator.", v31, 2u);
            }
          }
        }

        knobFeedbackGenerator = self->_knobFeedbackGenerator;
      }
      if ((-[UIFeedbackGeneratorUserInteractionDriven isActive](knobFeedbackGenerator, "isActive") & 1) == 0)
        -[UIFeedbackGeneratorUserInteractionDriven userInteractionStartedAtLocation:](self->_knobFeedbackGenerator, "userInteractionStartedAtLocation:", v18, v20);
      goto LABEL_26;
    }
LABEL_27:
    v26 = 0;
    goto LABEL_28;
  }
LABEL_26:
  v26 = 1;
LABEL_28:

  return v26;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (void)_trackingDidEnd
{
  *(_QWORD *)&self->_scrollViewFlags &= ~1uLL;
}

uint64_t __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_4(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_zoomAnimationDidStop");
  return result;
}

uint64_t __72__UIScrollView__adjustForAutomaticKeyboardInfo_animated_lastAdjustment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, a2, a3, 0.25, 0.0);
}

- (double)horizontalScrollDecelerationFactor
{
  return self->_decelerationFactor.width;
}

- (void)_updateScrollGestureRecognizersEnabled
{
  _BOOL4 v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _BOOL8 v8;

  v3 = -[UIScrollView _usesLowFidelityPanning](self, "_usesLowFidelityPanning");
  v4 = !v3;
  if ((*(_QWORD *)&self->_scrollViewFlags & 0x100000) != 0)
    v5 = 0;
  else
    v5 = v4;
  -[UIGestureRecognizer setEnabled:](self->_pan, "setEnabled:", v5);
  if ((*(_QWORD *)&self->_scrollViewFlags & 0x100000) != 0)
    v6 = 0;
  else
    v6 = v4;
  objc_msgSend(self->_swipe, "setEnabled:", v6);
  for (i = 0; i != 4; ++i)
  {
    v8 = (*(_QWORD *)&self->_scrollViewFlags & 0x100000) == 0 && v3;
    -[UIGestureRecognizer setEnabled:](self->_lowFidelitySwipeGestureRecognizers[i], "setEnabled:", v8);
  }
}

- (BOOL)_usesLowFidelityPanning
{
  if (-[UIView _userInterfaceIdiom](self, "_userInterfaceIdiom") == 3 && self->_touchLevel == 1)
    return !-[UIScrollView isPagingEnabled](self, "isPagingEnabled");
  else
    return 0;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  UIScrollView *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UIScrollView;
  -[UIView _didMoveFromWindow:toWindow:](&v18, sel__didMoveFromWindow_toWindow_, v6, v7);
  if (!v7)
    -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 0, 1);
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x1000) == 0)
  {
    objc_msgSend(v6, "_unregisterScrollToTopView:", self);
    -[UIScrollView _registerAsScrollToTopViewIfPossible](self, "_registerAsScrollToTopViewIfPossible");
  }
  if (v7)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    self->_accuracy = v8;
    if (dyld_program_sdk_at_least())
    {
      -[UIScrollView _enclosingViewController](self, "_enclosingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_viewSubtreeDidGainScrollView:enclosingViewController:", self, v9);

    }
    if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x200) == 0)
    {
      objc_msgSend(v7, "screen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UIView _shouldSkipObservingBoundingPathChangesForScreen:]((_BOOL8)self, v10);

      if (!v11)
      {
        *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x200u;
        -[UIView _addBoundingPathChangeObserver:](self, "_addBoundingPathChangeObserver:", self);
      }
    }
  }
  else
  {
    dyld_program_sdk_at_least();
  }
  if (objc_opt_class())
  {
    v12 = (void *)MEMORY[0x1E0D8CA10];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke;
    v15[3] = &unk_1E16B2218;
    v16 = v7;
    v17 = self;
    objc_msgSend(v12, "isMediaEventsCollectionEnabledFor:completionHandler:", v14, v15);

  }
}

- (void)setProgrammaticScrollEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)_isScrollViewScrollObserver:(id)a3
{
  return a3 && -[NSHashTable containsObject:](self->_scrollNotificationObservers, "containsObject:");
}

- (void)_setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (void)_setTopScrollIndicatorFollowsContentOffset:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (void)_setAlternativeVerticalScrollIndicatorTopSafeAreaInset:(double)a3
{
  self->__alternativeVerticalScrollIndicatorTopSafeAreaInset = a3;
}

- (void)_setShouldAdjustLayoutToDrawTopSeparator:(BOOL)a3
{
  int v3;
  unsigned int v4;
  int v5;

  v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if (((((*(_QWORD *)&v3 & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    v4 = v3 & 0xFFFDFFFF;
    if (a3)
      v5 = 0x20000;
    else
      v5 = 0;
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4 | v5;
    -[UIScrollView _layoutAdjustmentsDidChange](self, "_layoutAdjustmentsDidChange");
  }
}

- (void)_setShouldAdjustLayoutToCollapseTopSpacing:(BOOL)a3
{
  int v3;
  unsigned int v4;
  int v5;

  v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if (((((*(_QWORD *)&v3 & 0x10000) == 0) ^ a3) & 1) == 0)
  {
    v4 = v3 & 0xFFFEFFFF;
    if (a3)
      v5 = 0x10000;
    else
      v5 = 0;
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4 | v5;
    -[UIScrollView _layoutAdjustmentsDidChange](self, "_layoutAdjustmentsDidChange");
  }
}

- (int64_t)_compatibleContentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (double)_contentBottomForScrollObservation
{
  return self->_contentSize.height;
}

void __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  char v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke_2;
  block[3] = &unk_1E16B4008;
  v8 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id __53__UIScrollView__layoutGuideOfType_createIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "leftAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leftAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", CFSTR("-minX"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v10);

  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", CFSTR("-minY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v11);

  v14[0] = v6;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_isVerticalBouncing
{
  return (*(_BYTE *)&self->_scrollViewFlags >> 4) & 1;
}

- (BOOL)isScrollEnabled
{
  return (*((_BYTE *)&self->_scrollViewFlags + 2) & 0x10) == 0;
}

- (void)_didSetBounces
{
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x800000000000000uLL;
  -[UIScrollView _updateContentFitDisableScrolling](self, "_updateContentFitDisableScrolling");
}

- (void)setBounces:(BOOL)bounces
{
  uint64_t v3;

  v3 = 12;
  if (!bounces)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFF3 | v3;
  -[UIScrollView _didSetBounces](self, "_didSetBounces");
}

- (BOOL)_isHorizontalBouncing
{
  return (*(_BYTE *)&self->_scrollViewFlags >> 5) & 1;
}

- (void)setRefreshControl:(UIRefreshControl *)refreshControl
{
  UIRefreshControl *v4;

  v4 = refreshControl;
  if (v4)
    -[UIScrollView setAlwaysBounceVertical:](self, "setAlwaysBounceVertical:", 1);
  -[UIScrollView _setRefreshControl:](self, "_setRefreshControl:", v4);

}

- (void)_setRefreshControl:(id)a3
{
  UIRefreshControl *v5;
  UIRefreshControl **p_refreshControl;
  UIRefreshControl *refreshControl;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  UIRefreshControl *v13;

  v5 = (UIRefreshControl *)a3;
  p_refreshControl = &self->_refreshControl;
  refreshControl = self->_refreshControl;
  v13 = v5;
  if (refreshControl)
  {
    v8 = -[UIRefreshControl refreshControlState](refreshControl, "refreshControlState");
    v5 = v13;
    if (v8)
    {
      if (_setRefreshControl__once != -1)
      {
        dispatch_once(&_setRefreshControl__once, &__block_literal_global_516_0);
        v5 = v13;
      }
    }
  }
  if (*p_refreshControl != v5)
  {
    if (-[UIRefreshControl _areInsetsBeingApplied](*p_refreshControl, "_areInsetsBeingApplied")
      && !-[UIRefreshControl _hostAdjustsContentOffset](*p_refreshControl, "_hostAdjustsContentOffset"))
    {
      -[UIRefreshControl _removeInsets](*p_refreshControl, "_removeInsets");
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
    -[UIView removeFromSuperview](*p_refreshControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_refreshControl, a3);
    if (*p_refreshControl)
    {
      -[UIView setAutoresizingMask:](*p_refreshControl, "setAutoresizingMask:", 2);
      -[UIRefreshControl _update](*p_refreshControl, "_update");
      -[UIScrollView _addContentSubview:atBack:](self, "_addContentSubview:atBack:", *p_refreshControl, 1);
    }
    if (v9)
      -[UIRefreshControl _addInsets](*p_refreshControl, "_addInsets");
    -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setUpHostedRefreshControlForScrollView:", self);
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutSubviews");

    v5 = v13;
  }

}

- (void)_addContentSubview:(id)a3 atBack:(BOOL)a4
{
  _BOOL4 v4;
  id *shadows;
  _UIScrollViewScrollIndicator *v7;
  _UIScrollViewScrollIndicator *v8;
  UIScrollView *v9;
  id v10;
  uint64_t v11;
  _UIScrollViewScrollIndicator *verticalScrollIndicator;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a4;
  v22 = a3;
  if (v4)
  {
    shadows = self->_shadows;
    if (!shadows || (v7 = (_UIScrollViewScrollIndicator *)*shadows) == 0)
    {
      -[UIView layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sublayers");
      v8 = (_UIScrollViewScrollIndicator *)objc_claimAutoreleasedReturnValue();

      if (!-[_UIScrollViewScrollIndicator count](v8, "count")
        || (-[_UIScrollViewScrollIndicator objectAtIndex:](v8, "objectAtIndex:", 0),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v22, "layer"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v15,
            v14,
            v14 != v15))
      {
        -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v22, 0);
      }
      goto LABEL_13;
    }
    v8 = v7;
    v9 = self;
    v10 = v22;
    v11 = -2;
LABEL_9:
    -[UIView _addSubview:positioned:relativeTo:](v9, "_addSubview:positioned:relativeTo:", v10, v11, v8);
LABEL_13:

    goto LABEL_14;
  }
  verticalScrollIndicator = self->_verticalScrollIndicator;
  if (verticalScrollIndicator || (verticalScrollIndicator = self->_horizontalScrollIndicator) != 0)
  {
    v8 = verticalScrollIndicator;
LABEL_8:
    v9 = self;
    v10 = v22;
    v11 = -3;
    goto LABEL_9;
  }
  -[NSMutableDictionary allValues](self->_accessoryViews, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v8 = (_UIScrollViewScrollIndicator *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_8;
  -[UIView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sublayers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  if (v20 == v21)
    goto LABEL_15;
  -[UIView addSubview:](self, "addSubview:", v22);
LABEL_14:
  v16 = v22;
LABEL_15:

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (BOOL)_subviewPreventsSkipLayout:(id)a3
{
  _UIScrollViewScrollIndicator *v4;
  _UIScrollViewScrollIndicator *v5;
  BOOL v6;
  objc_super v8;

  v4 = (_UIScrollViewScrollIndicator *)a3;
  v5 = v4;
  if (self->_horizontalScrollIndicator == v4 || self->_verticalScrollIndicator == v4)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollView;
    v6 = -[UIView _subviewPreventsSkipLayout:](&v8, sel__subviewPreventsSkipLayout_, v4);
  }

  return v6;
}

- (BOOL)isZoomBouncing
{
  return *(_BYTE *)&self->_scrollViewFlags >> 7;
}

- (void)setNeedsLayout
{
  uint64_t v2;
  int v3;
  objc_super v4;

  v2 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v2 & 0x40000000000000) == 0)
  {
    v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v2 & 0xFF7FFFFFFFFFFFFFLL;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v3;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIScrollView;
  -[UIView setNeedsLayout](&v4, sel_setNeedsLayout);
}

- (void)_notifyAlignedContentMarginChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__UIScrollView__notifyAlignedContentMarginChanged__block_invoke;
  v2[3] = &unk_1E16EAA10;
  v2[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v2);
}

- (void)_sendGeometryAffectingContentBottomChangedToScrollObservers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __75__UIScrollView__sendGeometryAffectingContentBottomChangedToScrollObservers__block_invoke;
  v2[3] = &unk_1E16EAA10;
  v2[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v2);
}

- (void)_enumerateAllScrollObserversWithBlock:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(id *)(a1 + 936);
    v13 = 0;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(uint64_t, _QWORD, char *))(a2 + 16))(a2, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), &v13);
        if (v13)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

uint64_t __75__UIScrollView__sendGeometryAffectingContentBottomChangedToScrollObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollViewGeometryAffectingContentBottomDidChange:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __50__UIScrollView__notifyAlignedContentMarginChanged__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollViewAlignedContentMarginDidChange:", *(_QWORD *)(a1 + 32));
  return result;
}

void __32__UIScrollView__notifyDidScroll__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a2, "_observeScrollViewDidScroll:", *(_QWORD *)(a1 + 32));
  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_didScroll");

}

void __58__UIScrollView__observerImplementingWillEndDraggingMethod__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

double __79__UIScrollView__revealableContentPaddingIncludingContentWithCollapsedAffinity___block_invoke(uint64_t a1, void *a2)
{
  double result;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a2, "_revealableContentPaddingForObservedScrollView:includeContentWithCollapsedAffinity:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    v5 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
    result = v6 + v5[4];
    v8 = v7 + v5[5];
    v10 = v9 + v5[6];
    v12 = v11 + v5[7];
    v5[4] = result;
    v5[5] = v8;
    v5[6] = v10;
    v5[7] = v12;
  }
  return result;
}

uint64_t __44__UIScrollView__didMoveFromWindow_toWindow___block_invoke_2(uint64_t result)
{
  void *v1;
  uint64_t v2;

  if (*(_BYTE *)(result + 48))
  {
    v2 = *(_QWORD *)(result + 32);
    v1 = *(void **)(result + 40);
    if (v2)
      return objc_msgSend(v1, "startScrollViewMonitoring");
    else
      return objc_msgSend(v1, "stopScrollViewMonitoring");
  }
  return result;
}

- (BOOL)_shouldAdjustLayoutToDrawTopSeparator
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 17) & 1;
}

- (CGFloat)minimumZoomScale
{
  return self->_minimumZoomScale;
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 0, 1);
  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIScrollView;
  -[UIView traitCollectionDidChange:](&v18, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;
  v10 = objc_msgSend(v5, "userInterfaceStyle");
  if (v10 != objc_msgSend(v4, "userInterfaceStyle"))
  {
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 1);
    -[UIScrollView _updateAccessories](self, "_updateAccessories");
    -[UIScrollView _updateAccessoriesInset](self, "_updateAccessoriesInset");
  }
  if (v7 != v9)
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    v12 = v11;
    v14 = v13;
    -[UIScrollView _roundedProposedContentOffset:](self, "_roundedProposedContentOffset:");
    if (v12 != v16 || v14 != v15)
      -[UIScrollView setContentOffset:](self, "setContentOffset:");
  }
  v17 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v17 != objc_msgSend(v4, "userInterfaceIdiom"))
    -[UIScrollView _allowsKeyboardScrollingDidUpdate](self, "_allowsKeyboardScrollingDidUpdate");

}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIScrollView;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v8, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  -[UIView _screen](self, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_capabilityForKey:", CFSTR("UIScreenCapabilityTouchLevelsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_touchLevel = objc_msgSend(v7, "integerValue");

  -[UIScrollView _updateUsesStaticScrollBar](self, "_updateUsesStaticScrollBar");
  -[UIScrollView _enableOnlyGestureRecognizersForCurrentTouchLevel](self, "_enableOnlyGestureRecognizersForCurrentTouchLevel");
  -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 1);
  -[UIScrollView _updateAccessories](self, "_updateAccessories");
  -[UIScrollView _updateAccessoriesInset](self, "_updateAccessoriesInset");
}

- (void)_updateAccessoriesInset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_accessoryViews, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        objc_msgSend(v12, "alpha");
        if (v13 > 0.0 && (objc_msgSend(v12, "overlay") & 1) == 0)
        {
          switch(objc_msgSend(v12, "edge"))
          {
            case 2:
              objc_msgSend(v12, "frame");
              v10 = v10 + CGRectGetHeight(v28);
              break;
            case 3:
              objc_msgSend(v12, "frame");
              v9 = v9 + CGRectGetWidth(v29);
              break;
            case 4:
              objc_msgSend(v12, "frame");
              v8 = v8 + CGRectGetHeight(v30);
              break;
            case 5:
              objc_msgSend(v12, "frame");
              v7 = v7 + CGRectGetWidth(v31);
              break;
            default:
              break;
          }
        }
        ++v11;
      }
      while (v5 != v11);
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v5 = v14;
    }
    while (v14);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
  }

  -[UIScrollView accessoryInsets](self, "accessoryInsets");
  self->_accessoryInsets.top = v10;
  self->_accessoryInsets.left = v9;
  self->_accessoryInsets.bottom = v8;
  self->_accessoryInsets.right = v7;
  if (v18 != v9 || v15 != v10 || v17 != v7 || v16 != v8)
    -[UIScrollView accessoryInsetsDidChange:](self, "accessoryInsetsDidChange:");
}

- (void)_enableOnlyGestureRecognizersForCurrentTouchLevel
{
  -[UIScrollView _createGestureRecognizersForCurrentTouchLevel](self, "_createGestureRecognizersForCurrentTouchLevel");
  -[UIScrollView _updateZoomGestureRecognizersEnabled](self, "_updateZoomGestureRecognizersEnabled");
  -[UIScrollView _updateScrollGestureRecognizersEnabled](self, "_updateScrollGestureRecognizersEnabled");
}

- (void)_updateZoomGestureRecognizersEnabled
{
  UIScrollViewPinchGestureRecognizer *pinch;
  _BOOL8 v4;

  pinch = self->_pinch;
  v4 = (*((_BYTE *)&self->_scrollViewFlags + 2) & 0x40) == 0 && self->_touchLevel == 0;
  -[UIGestureRecognizer setEnabled:](pinch, "setEnabled:", v4);
}

- (void)_updateForChangedScrollIndicatorRelatedInsets
{
  -[UIScrollView _setCachedVerticalScrollIndicatorBaseInsets:](self, "_setCachedVerticalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
  -[UIScrollView _setCachedHorizontalScrollIndicatorBaseInsets:](self, "_setCachedHorizontalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
  {
    -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 1, 0);
  }
  -[UIScrollView _updateAccessories](self, "_updateAccessories");
  -[UIScrollView _updateAccessoriesInset](self, "_updateAccessoriesInset");
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGRect *p_lastVisibleBounds;
  CGRect v14;

  if (a4 && (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x1000000) != 0)
  {
    -[UIScrollView visibleBounds](self, "visibleBounds", a3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    p_lastVisibleBounds = &self->_lastVisibleBounds;
    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    if (!CGRectEqualToRect(self->_lastVisibleBounds, v14))
    {
      -[UIScrollView _invalidateLayoutForVisibleBounds:oldVisibleBounds:](self, "_invalidateLayoutForVisibleBounds:oldVisibleBounds:", v6, v8, v10, v12, p_lastVisibleBounds->origin.x, self->_lastVisibleBounds.origin.y, self->_lastVisibleBounds.size.width, self->_lastVisibleBounds.size.height);
      p_lastVisibleBounds->origin.x = v6;
      self->_lastVisibleBounds.origin.y = v8;
      self->_lastVisibleBounds.size.width = v10;
      self->_lastVisibleBounds.size.height = v12;
    }
  }
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v20 = a3;
  if (!a4)
  {
    -[UIScrollView _setCachedVerticalScrollIndicatorBaseInsets:](self, "_setCachedVerticalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
    -[UIScrollView _setCachedHorizontalScrollIndicatorBaseInsets:](self, "_setCachedHorizontalScrollIndicatorBaseInsets:", 1.79769313e308, 1.79769313e308, 1.79769313e308, 1.79769313e308);
  }
  objc_getAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "boundingRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[UIView bounds](self, "bounds");
    v22.origin.x = v16;
    v22.origin.y = v17;
    v22.size.width = v18;
    v22.size.height = v19;
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    if (!CGRectEqualToRect(v21, v22))
      objc_setAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey, 0, (void *)1);
  }

}

- (void)_setCachedVerticalScrollIndicatorBaseInsets:(UIEdgeInsets)a3
{
  self->_cachedVerticalScrollIndicatorBaseInsets = a3;
}

- (void)_setCachedHorizontalScrollIndicatorBaseInsets:(UIEdgeInsets)a3
{
  self->_cachedHorizontalScrollIndicatorBaseInsets = a3;
}

- (void)setPagingEnabled:(BOOL)pagingEnabled
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v6;

  v3 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if (((((v3 & 0x20) == 0) ^ pagingEnabled) & 1) == 0)
  {
    v4 = pagingEnabled;
    v6 = 32;
    if (!pagingEnabled)
      v6 = 0;
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFFFFFFFFFFFFDFLL | v6;
    -[UIScrollView _updatePagingGestures](self, "_updatePagingGestures");
    if (v4)
      -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", 0.0, 0.0);
  }
}

- (void)_handlePanFailure
{
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFC3FLL;
  -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", 0.0, 0.0);
  -[UIScrollView _endPanNormal:](self, "_endPanNormal:", 0);
  -[UIScrollView _trackingDidEnd](self, "_trackingDidEnd");
}

- (void)_endPanNormal:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;
  BOOL v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  uint64_t scrollViewFlags;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double accuracy;
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
  double v38;
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
  uint64_t v50;
  BOOL v53;
  double v54;
  _BOOL4 v55;
  int v56;
  _BOOL4 v57;
  double v58;
  uint64_t v59;
  double v60;
  unint64_t v61;
  uint64_t v62;
  UIFeedbackGeneratorUserInteractionDriven *knobFeedbackGenerator;
  double v64;
  unint64_t v65;
  double v66;
  double v67;
  double v68;
  int *v69;
  double v70;
  uint64_t v71;
  double v72;
  UIScrollViewKeyboardDismissMode v73;
  void *v74;
  _BOOL8 v75;
  uint64_t v76;
  id WeakRetained;
  double previousHorizontalVelocity;
  CGSize v79;
  unint64_t v80;
  NSObject *v81;
  int v82;
  _BOOL8 v83;
  const __CFString *v84;
  const __CFString *v85;
  void *v86;
  double v87;
  double v88;
  _UIScrollViewAsyncScrollDecelerationState *asyncScrollDecelerationState;
  void *v90;
  void *v91;
  id v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  CGSize v103;

  v3 = a3;
  if (a3
    && ((v5 = CACurrentMediaTime() - self->_lastUpdateTime,
         -[UIView _screen](self, "_screen"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = 1.0 / (double)objc_msgSend(v6, "_maximumFramesPerSecond") * 0.8,
         v6,
         v5 > v7)
      ? (v8 = v5 < v7 * 3.0)
      : (v8 = 0),
        v8))
  {
    kdebug_trace();
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  -[UIScrollView contentOffset](self, "contentOffset");
  v15 = v14;
  v17 = v16;
  -[UIScrollView _updateDecelerationLastOffsetScrollViewPoint:](self, "_updateDecelerationLastOffsetScrollViewPoint:");
  p_scrollViewFlags = &self->_scrollViewFlags;
  scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x800000) == 0)
    goto LABEL_62;
  v102 = v13;
  v100 = v17;
  -[UIScrollView contentOffset](self, "contentOffset");
  v21 = v20;
  v23 = v22;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  v29 = self->_firstPageOffset.horizontal - v28;
  v101 = v15;
  if (accuracy == 1.0)
  {
    v31 = round(v29);
    v32 = v24;
    v35 = round(self->_firstPageOffset.vertical - v24);
    v38 = round(v26 + self->_contentSize.width);
    v39 = v25;
    v42 = round(v25 + self->_contentSize.height);
  }
  else
  {
    v30 = floor(v29);
    v31 = v30 + round(accuracy * (v29 - v30)) / accuracy;
    v32 = v24;
    v33 = self->_firstPageOffset.vertical - v24;
    v34 = floor(v33);
    v35 = v34 + round(accuracy * (v33 - v34)) / accuracy;
    v36 = v26 + self->_contentSize.width;
    v37 = floor(v36);
    v38 = v37 + round(accuracy * (v36 - v37)) / accuracy;
    v39 = v25;
    v40 = v25 + self->_contentSize.height;
    v41 = floor(v40);
    v42 = v41 + round(accuracy * (v40 - v41)) / accuracy;
  }
  v43 = v38 - v11;
  v44 = v42 - v102;
  if (v31 >= v43)
    v45 = v31;
  else
    v45 = v43;
  if (v35 >= v44)
    v46 = v35;
  else
    v46 = v44;
  -[UIScrollViewPanGestureRecognizer velocityInView:](self->_pan, "velocityInView:", self);
  if (v48 == *MEMORY[0x1E0C9D538] && v47 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    self->_verticalVelocity = 0.0;
    self->_horizontalVelocity = 0.0;
  }
  v50 = *(_QWORD *)p_scrollViewFlags;
  v53 = v21 >= v31 && v23 >= v35 && v21 <= v45 && v23 <= v46;
  v54 = v39;
  v99 = 424;
  if (!v53)
  {
    v55 = v3;
    v56 = v9;
    *(_QWORD *)p_scrollViewFlags = v50 & 0xFFFFFFFFFF7FFFFFLL;
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
    v57 = (*((_BYTE *)&self->_scrollViewFlags + 3) & 0x40) == 0;
    v17 = v100;
    v15 = v101;
    v58 = v32;
    goto LABEL_42;
  }
  v15 = v101;
  v58 = v32;
  if ((v50 & 2) == 0)
  {
    v55 = v3;
    v56 = v9;
    v57 = 0;
    self->_verticalVelocity = 0.0;
    v59 = 744;
LABEL_40:
    *(Class *)((char *)&self->super.super.super.isa + v59) = 0;
    *(_QWORD *)p_scrollViewFlags &= ~0x800000uLL;
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
LABEL_41:
    v17 = v100;
    goto LABEL_42;
  }
  if (self->_currentScrollDeviceCategory == 6
    || (v60 = self->_horizontalVelocity * self->_horizontalVelocity + self->_verticalVelocity * self->_verticalVelocity,
        v60 < 0.0625))
  {
    v55 = v3;
    v56 = v9;
    v57 = 0;
    self->_verticalVelocity = 0.0;
    self->_horizontalVelocity = 0.0;
    self->_previousVerticalVelocity = 0.0;
    v59 = 760;
    goto LABEL_40;
  }
  if (v60 < 0.36)
  {
    v55 = v3;
    v56 = v9;
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
LABEL_112:
    v57 = 1;
    goto LABEL_41;
  }
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    v55 = v3;
    v56 = v9;
    goto LABEL_112;
  }
  v94 = v39;
  v55 = v3;
  v56 = v9;
  ++self->_fastScrollCount;
  -[UIGestureRecognizer _activeEventOfType:](self->_pan, "_activeEventOfType:", 10);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v95)
  {
    -[UIGestureRecognizer _activeEventOfType:](self->_pan, "_activeEventOfType:", 0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v95)
    {
      v96 = (void *)UIApp;
      -[UIView window](self, "window");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_touchesEventForWindow:", v97);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v95, "timestamp", 424);
  self->_fastScrollEndTime = v98;

  v57 = 1;
  v17 = v100;
  v54 = v94;
LABEL_42:
  v61 = *((unsigned int *)&self->_scrollViewFlags + 5);
  v62 = (v61 >> 11) & 0xF;
  if ((unint64_t)(v62 - 1) > 3)
  {
    v9 = v56;
    v3 = v55;
  }
  else
  {
    if (!v57)
    {
      knobFeedbackGenerator = self->_knobFeedbackGenerator;
      v64 = v54;
      -[UIPanGestureRecognizer locationInView:](self->_pan, "locationInView:", self);
      -[UIFeedbackGeneratorUserInteractionDriven pressedUpAtLocation:](knobFeedbackGenerator, "pressedUpAtLocation:");
      v54 = v64;
    }
    v65 = v61 >> 11;
    v66 = self->_accuracy;
    if (v66 == 1.0)
    {
      v68 = round(v102);
    }
    else
    {
      v67 = floor(v102);
      v68 = v67 + round((v102 - v67) * v66) / v66;
    }
    v9 = v56;
    v3 = v55;
    if ((v65 & 0xD) == 1)
    {
      v69 = &OBJC_IVAR___UIScrollView__verticalVelocity;
    }
    else
    {
      v69 = &OBJC_IVAR___UIScrollView__horizontalVelocity;
      if (v62 != 4 && v62 != 2)
      {
        v57 = 0;
        goto LABEL_57;
      }
    }
    v70 = (v54 + v58 + *(double *)((char *)&self->super.super._responderFlags + (int)v99)) / v68;
    *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x40000u;
    v71 = *v69;
    v72 = *(double *)((char *)&self->super.super.super.isa + v71);
    if (v72 > 3.0)
      v72 = 3.0;
    *(double *)((char *)&self->super.super.super.isa + v71) = v70 * -0.66 * fmax(v72, -3.0);
    self->_previousVerticalVelocity = 0.0;
    self->_previousHorizontalVelocity = 0.0;
    v57 = 1;
  }
LABEL_57:
  v73 = -[UIScrollView keyboardDismissMode](self, "keyboardDismissMode", v99);
  if (v73 == UIScrollViewKeyboardDismissModeInteractiveWithAccessory
    || v73 == UIScrollViewKeyboardDismissModeInteractive)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "scrollView:didFinishPanGesture:", self, self->_pan);

  }
  if (v57)
  {
    v75 = 1;
    goto LABEL_70;
  }
LABEL_62:
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    if (-[UIScrollView _contentOffsetIsAtPagingBoundary:](self, "_contentOffsetIsAtPagingBoundary:", v15, v17))
    {
LABEL_65:
      v75 = 0;
      goto LABEL_70;
    }
  }
  else if (!-[UIScrollView _isBouncing](self, "_isBouncing") || (*((_BYTE *)&self->_scrollViewFlags + 3) & 0x40) != 0)
  {
    goto LABEL_65;
  }
  v76 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  v75 = (v76 & 0x100000000000) == 0;
  if ((v76 & 0x100000000000) == 0 && !v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
    v75 = WeakRetained == 0;

  }
LABEL_70:
  previousHorizontalVelocity = self->_previousHorizontalVelocity;
  if (previousHorizontalVelocity != 0.0 || self->_previousVerticalVelocity != 0.0)
  {
    self->_horizontalVelocity = previousHorizontalVelocity * 0.75 + self->_horizontalVelocity * 0.25;
    self->_verticalVelocity = self->_verticalVelocity * 0.25 + self->_previousVerticalVelocity * 0.75;
  }
  v79 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_adjustedDecelerationFactor = (CGSize)*MEMORY[0x1E0C9D820];
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= 0xFFFFFF3FFFFFFFFFLL;
  v103 = v79;
  if ((scrollViewFlags & 0x800000) != 0)
  {
    v83 = -[UIScrollView _scrollViewWillEndDraggingWithDeceleration:](self, "_scrollViewWillEndDraggingWithDeceleration:", v75);
    -[UIScrollView _scrollViewDidEndDraggingForDelegateWithDeceleration:](self, "_scrollViewDidEndDraggingForDelegateWithDeceleration:", v83);
    if (!v83)
      goto LABEL_75;
LABEL_87:
    if (v3)
      v84 = CFSTR("endPanNormal:YES will smooth scroll");
    else
      v84 = CFSTR("endPanNormal:NO will smooth scroll");
    -[UIScrollView _pushTrackingRunLoopModeIfNecessaryForReason:](self, "_pushTrackingRunLoopModeIfNecessaryForReason:", v84);
    v82 = 1;
    -[UIScrollView _startTimer:](self, "_startTimer:", 1);
    goto LABEL_91;
  }
  -[_UIScrollViewScrollableAncestor _descendentScrollViewDidCancelDragging:](self->_scrollableAncestor, "_descendentScrollViewDidCancelDragging:", self);
  if (v75)
    goto LABEL_87;
LABEL_75:
  if (self->_scrollHeartbeat)
  {
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = v103;
    v80 = _endPanNormal____s_category;
    if (!_endPanNormal____s_category)
    {
      v80 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v80, (unint64_t *)&_endPanNormal____s_category);
    }
    v81 = *(id *)(v80 + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(v80 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v81))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    -[CADisplayLink setPaused:](self->_scrollHeartbeat, "setPaused:", 0);
  }
  *(_QWORD *)p_scrollViewFlags &= ~0x800000uLL;
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
  {
    -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 0, 0);
  }
  v82 = 0;
LABEL_91:
  -[UIScrollView _updateAccessories](self, "_updateAccessories");
  if (!self->_scrollHeartbeat)
  {
    if (v3)
      v85 = CFSTR("endPanNormal:YES has no timer");
    else
      v85 = CFSTR("endPanNormal:NO has no timer");
    -[UIScrollView _popTrackingRunLoopModeIfNecessaryForReason:](self, "_popTrackingRunLoopModeIfNecessaryForReason:", v85);
  }
  if (((v9 | v82 ^ 1) & 1) == 0 && self->_scrollHeartbeat)
  {
    -[UIView _screen](self, "_screen");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = -1.0 / (double)objc_msgSend(v86, "_maximumFramesPerSecond");

    v88 = CACurrentMediaTime();
    self->_lastUpdateTime = v88 + v87;
    asyncScrollDecelerationState = self->_asyncScrollDecelerationState;
    if (asyncScrollDecelerationState)
      asyncScrollDecelerationState->_lastUpdateTime = v88 + v87;
    -[UIScrollView _trackingDidEnd](self, "_trackingDidEnd");
    -[UIScrollView _smoothScrollWithUpdateTime:](self, "_smoothScrollWithUpdateTime:", v88);
  }
  if ((v82 & 1) == 0)
    -[UIScrollView _setKnobInteractionGestureDelayed:](self, "_setKnobInteractionGestureDelayed:", 0);
  v90 = (void *)UIApp;
  -[UIView window](self, "window");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (id)objc_msgSend(v90, "_touchesEventForWindow:", v91);

  objc_msgSend(v92, "timestamp");
  self->_lastPanGestureEndTime = v93;
}

- (void)_updateAccessories
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSMutableDictionary *accessoryViews;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[9];

  if (-[NSMutableDictionary count](self->_accessoryViews, "count"))
  {
    -[UIScrollView _contentInsetForAccessories](self, "_contentInsetForAccessories");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView bounds](self, "bounds");
    accessoryViews = self->_accessoryViews;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __34__UIScrollView__updateAccessories__block_invoke;
    v16[3] = &unk_1E16EAA38;
    v16[4] = self;
    *(double *)&v16[5] = v6 + v12;
    *(double *)&v16[6] = v4 + v13;
    *(double *)&v16[7] = v14 - (v6 + v10);
    *(double *)&v16[8] = v15 - (v4 + v8);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryViews, "enumerateKeysAndObjectsUsingBlock:", v16);
  }
}

- (void)_popTrackingRunLoopModeIfNecessaryForReason:(id)a3
{
  uint64_t scrollViewFlags;
  NSTimer *trackingWatchdogTimer;
  NSTimer *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 *v11;
  int v12;
  id v13;

  v13 = a3;
  scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x100000000) != 0)
  {
    *(_QWORD *)&self->_scrollViewFlags = scrollViewFlags & 0xFFFFFFFEFFFFFFFFLL;
    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    {
      trackingWatchdogTimer = self->_trackingWatchdogTimer;
      if (trackingWatchdogTimer)
      {
        -[NSTimer invalidate](trackingWatchdogTimer, "invalidate");
        v6 = self->_trackingWatchdogTimer;
        self->_trackingWatchdogTimer = 0;

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystemHoldingLock);
    objc_msgSend(WeakRetained, "_unlockEnvironment:", self);

    objc_storeWeak((id *)&self->_focusSystemHoldingLock, 0);
    objc_storeStrong((id *)&GScrollerPoppingRunLoopMode, self);
    objc_msgSend((id)UIApp, "_popRunLoopMode:requester:reason:", CFSTR("UITrackingRunLoopMode"), self, v13);
    v8 = (void *)GScrollerPoppingRunLoopMode;
    GScrollerPoppingRunLoopMode = 0;

    v9 = objc_loadWeakRetained((id *)&self->_animation);
    if (!v9
      || (v10 = v9,
          v11 = (unsigned __int8 *)objc_loadWeakRetained((id *)&self->_animation),
          v12 = v11[152],
          v11,
          v10,
          !v12))
    {
      -[UIScrollView _endScrollingCursorOverrideIfNecessary](self, "_endScrollingCursorOverrideIfNecessary");
    }
  }

}

- (BOOL)isZoomAnimating
{
  return self->_zoomAnimation != 0;
}

- (BOOL)isPagingEnabled
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 5) & 1;
}

- (void)_didEndDirectManipulationWithScrubbingDirection:(int64_t)a3
{
  unint64_t v4;
  int *v5;
  double startOffsetY;
  double v7;
  double v8;
  double startOffsetX;
  double v10;
  double v11;

  v4 = a3 - 1;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v5 = &OBJC_IVAR___UIScrollView__horizontalScrollIndicator;
    startOffsetX = self->_startOffsetX;
    -[UIScrollView contentOffset](self, "contentOffset");
    v8 = vabdd_f64(startOffsetX, v10);
    if (v4 > 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = &OBJC_IVAR___UIScrollView__verticalScrollIndicator;
  startOffsetY = self->_startOffsetY;
  -[UIScrollView contentOffset](self, "contentOffset");
  v8 = vabdd_f64(startOffsetY, v7);
  if (v4 < 2)
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setExpandedForDirectManipulation:", 0);
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v11 - self->_knobInteractionBeginTime < 0.1 && v8 < 10.0)
    -[UIScrollView _setKnobInteractionGestureDelayed:](self, "_setKnobInteractionGestureDelayed:", 1);
  *((_DWORD *)&self->_scrollViewFlags + 5) &= 0xFFFF87FF;
  if (-[UIFeedbackGeneratorUserInteractionDriven isActive](self->_knobFeedbackGenerator, "isActive"))
    -[UIFeedbackGeneratorUserInteractionDriven userInteractionEnded](self->_knobFeedbackGenerator, "userInteractionEnded");
}

- (void)_commitScrollBounceStatisticsTrackingState
{
  id v2;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x100000000000000) != 0)
  {
    +[_UIStatistics scrollBounceCount](_UIStatistics, "scrollBounceCount");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "incrementValueBy:", 1);

  }
}

- (void)_clearScrollBounceStatisticsTrackingState
{
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x100000000000000uLL;
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
  -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:nudgingBoundsWithVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:nudgingBoundsWithVelocity:", 0, a3, a4);
}

- (CGSize)_interpageSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interpageSpacing.width;
  height = self->_interpageSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)_pagingOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_pagingOrigin.x;
  y = self->_pagingOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setKnobInteractionGestureDelayed:(BOOL)a3
{
  UIScrollViewKnobLongPressGestureRecognizer *knobLongPressGestureRecognizer;
  double v4;

  knobLongPressGestureRecognizer = self->_knobLongPressGestureRecognizer;
  v4 = 0.1;
  if (a3)
    v4 = 0.25;
  -[UILongPressGestureRecognizer setMinimumPressDuration:](knobLongPressGestureRecognizer, "setMinimumPressDuration:", v4);
}

- (void)_updateDecelerationLastOffsetScrollViewPoint:(CGPoint)a3
{
  *(CGPoint *)&self->_lastUpdateOffsetX = a3;
  self->_lastUpdateTime = CACurrentMediaTime();
}

- (void)setDecelerationRate:(UIScrollViewDecelerationRate)decelerationRate
{
  CGFloat v3;

  v3 = dbl_186685480[decelerationRate < 0.994];
  self->_decelerationFactor.width = v3;
  self->_decelerationFactor.height = v3;
}

- (void)_setPagingOrigin:(CGPoint)a3
{
  if (a3.x != self->_pagingOrigin.x || a3.y != self->_pagingOrigin.y)
  {
    self->_pagingOrigin = a3;
    -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", 0.0, 0.0);
  }
}

- (void)_setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (BOOL)_shouldPreventFocusScrollPastContentSize
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 27) & 1;
}

- (void)_setShouldPreventFocusScrollPastContentSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xF7FFFFFF | v3;
}

- (UIEdgeInsets)scrollIndicatorInsets
{
  double v3;
  double top;
  double v5;
  double left;
  double v7;
  double bottom;
  double v9;
  double right;
  double v11;
  double v12;
  double v13;
  double v14;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  if (dyld_program_sdk_at_least())
  {
    -[UIScrollView verticalScrollIndicatorInsets](self, "verticalScrollIndicatorInsets");
    top = v3;
    left = v5;
    bottom = v7;
    right = v9;
    -[UIScrollView horizontalScrollIndicatorInsets](self, "horizontalScrollIndicatorInsets");
    if (left != v14 || top != v11 || right != v13 || bottom != v12)
    {
      left = 0.0;
      top = 0.0;
      bottom = 0.0;
      right = 0.0;
    }
  }
  else
  {
    top = self->_scrollIndicatorInset.top;
    left = self->_scrollIndicatorInset.left;
    bottom = self->_scrollIndicatorInset.bottom;
    right = self->_scrollIndicatorInset.right;
  }
  v18 = top;
  v19 = left;
  v20 = bottom;
  v21 = right;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (UIEdgeInsets)_computeBaseInsetsForHorizontalScrollIndicatorWithClientInsets:(UIEdgeInsets)a3
{
  _BOOL4 v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v4 = a3.bottom != 0.0;
  if (a3.right != 0.0)
    v4 = 1;
  if (a3.top != 0.0)
    v4 = 1;
  v5 = a3.left != 0.0 || v4;
  -[UIScrollView _horizontalScrollIndicatorHeight](self, "_horizontalScrollIndicatorHeight");
  v7 = v6;
  -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
  -[UIScrollView _baseInsetsForAccessoryOnEdge:hasCustomClientInsets:accessorySize:additionalInsetFromEdge:](self, "_baseInsetsForAccessoryOnEdge:hasCustomClientInsets:accessorySize:additionalInsetFromEdge:", 4, v5, v7, v8);
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)_computeBaseInsetsForVerticalScrollIndicatorWithClientInsets:(UIEdgeInsets)a3
{
  _BOOL4 v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v4 = a3.bottom != 0.0;
  if (a3.right != 0.0)
    v4 = 1;
  if (a3.top != 0.0)
    v4 = 1;
  v5 = a3.left != 0.0 || v4;
  -[UIScrollView _verticalScrollIndicatorWidth](self, "_verticalScrollIndicatorWidth");
  v7 = v6;
  -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
  -[UIScrollView _baseInsetsForAccessoryOnEdge:hasCustomClientInsets:accessorySize:additionalInsetFromEdge:](self, "_baseInsetsForAccessoryOnEdge:hasCustomClientInsets:accessorySize:additionalInsetFromEdge:", 1, v5, v7, v8);
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (void)_adjustScrollerIndicators:(BOOL)a3 alwaysShowingThem:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  _UIScrollViewScrollIndicator *v9;
  _UIScrollViewScrollIndicator *horizontalScrollIndicator;
  _UIScrollViewScrollIndicator *v11;
  _UIScrollViewScrollIndicator *verticalScrollIndicator;
  uint64_t v13;
  NSTimer *verticalScrollIndicatorHideDelayTimer;
  NSTimer *horizontalScrollIndicatorHideDelayTimer;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  double v28;
  double v29;
  uint64_t v30;
  float64x2_t v31;
  float64x2_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t scrollViewFlags;
  _BOOL4 v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unsigned int v53;
  double v54;
  double v55;
  BOOL v56;
  double v57;
  double accuracy;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id WeakRetained;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;

  if (self->_staticScrollBar)
    return;
  v5 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
    return;
  if (!self->_horizontalScrollIndicator && -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
  {
    CreateScrollIndicator(self, 0);
    v9 = (_UIScrollViewScrollIndicator *)objc_claimAutoreleasedReturnValue();
    horizontalScrollIndicator = self->_horizontalScrollIndicator;
    self->_horizontalScrollIndicator = v9;

    -[UIView setAutoresizingMask:](self->_horizontalScrollIndicator, "setAutoresizingMask:", 8);
    v5 = 1;
  }
  if (!self->_verticalScrollIndicator && -[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self))
  {
    v5 = 1;
    CreateScrollIndicator(self, 1u);
    v11 = (_UIScrollViewScrollIndicator *)objc_claimAutoreleasedReturnValue();
    verticalScrollIndicator = self->_verticalScrollIndicator;
    self->_verticalScrollIndicator = v11;

    if (-[UIScrollView _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis](self, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis"))
    {
      v13 = 4;
    }
    else
    {
      v13 = 1;
    }
    -[UIView setAutoresizingMask:](self->_verticalScrollIndicator, "setAutoresizingMask:", v13);
  }
  -[NSTimer invalidate](self->_verticalScrollIndicatorHideDelayTimer, "invalidate");
  verticalScrollIndicatorHideDelayTimer = self->_verticalScrollIndicatorHideDelayTimer;
  self->_verticalScrollIndicatorHideDelayTimer = 0;

  -[NSTimer invalidate](self->_horizontalScrollIndicatorHideDelayTimer, "invalidate");
  horizontalScrollIndicatorHideDelayTimer = self->_horizontalScrollIndicatorHideDelayTimer;
  self->_horizontalScrollIndicatorHideDelayTimer = 0;

  -[UIView bounds](self, "bounds");
  v70 = v17;
  v71 = v16;
  v19 = v18;
  v72 = v20;
  -[UIScrollView contentOffset](self, "contentOffset");
  v66 = v22;
  v67 = v21;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v27.f64[0] = v72;
  v28 = v25;
  v29 = v26;
  v30 = *(uint64_t *)&self->_accuracy;
  v68 = v24;
  v69 = v23;
  if (*(double *)&v30 == 1.0)
  {
    v33 = fmin(round(v72) / round(v25 + v23 + self->_contentSize.height), 1.0);
    v35 = round(v19);
    v37 = round(v26 + v24 + self->_contentSize.width);
  }
  else
  {
    v27.f64[1] = v25 + v23 + self->_contentSize.height;
    v31 = vrndmq_f64(v27);
    v32 = vaddq_f64(v31, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v27, v31), *(double *)&v30)), (float64x2_t)vdupq_lane_s64(v30, 0)));
    v33 = fmin(vdivq_f64(v32, (float64x2_t)vdupq_laneq_s64((int64x2_t)v32, 1)).f64[0], 1.0);
    v34 = floor(v19);
    v35 = v34 + round((v19 - v34) * *(double *)&v30) / *(double *)&v30;
    v32.f64[0] = v26 + v24 + self->_contentSize.width;
    v36 = floor(v32.f64[0]);
    v37 = v36 + round(*(double *)&v30 * (v32.f64[0] - v36)) / *(double *)&v30;
  }
  v38 = v35 / v37;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  v41 = (scrollViewFlags & 0x40000080) != 0 && (int)scrollViewFlags < 0;
  v42 = -[_UIScrollViewScrollableAncestor _descendentScrollViewShouldScrollVertically:](self->_scrollableAncestor, "_descendentScrollViewShouldScrollVertically:", self);
  v43 = -[_UIScrollViewScrollableAncestor _descendentScrollViewShouldScrollHorizontally:](self->_scrollableAncestor, "_descendentScrollViewShouldScrollHorizontally:", self);
  if ((~*(_DWORD *)&self->_scrollViewFlags & 0x800003) == 0)
  {
    v44 = 1;
LABEL_31:
    v45 = 1;
    goto LABEL_32;
  }
  v44 = 1;
  if (self->_scrollHeartbeat)
    goto LABEL_31;
  v45 = 1;
  v46 = 1;
  if (a4)
    goto LABEL_33;
  v47 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v47 & 0x2000) != 0)
    goto LABEL_33;
  if ((v47 & 2) == 0)
  {
    v44 = objc_msgSend(WeakRetained, "revealsVerticalScrollIndicator");
    v47 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  }
  if ((v47 & 1) == 0)
  {
    v46 = objc_msgSend(WeakRetained, "revealsHorizontalScrollIndicator");
    v45 = 0;
    goto LABEL_33;
  }
  v45 = 0;
LABEL_32:
  v46 = 1;
LABEL_33:
  v48 = fmin(v38, 1.0);
  if (v33 <= 0.99)
    v49 = v44 & ~(v41 | v42);
  else
    v49 = 0;
  if (((v41 | v43) & 1) == 0)
  {
    if (v48 <= 0.99)
      v50 = v46;
    else
      v50 = 0;
    if (!v41)
      goto LABEL_44;
    goto LABEL_43;
  }
  v50 = 0;
  if (v41)
  {
LABEL_43:
    -[UIView layer](self->_horizontalScrollIndicator, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "removeAnimationForKey:", CFSTR("opacity"));

    -[UIView layer](self->_verticalScrollIndicator, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "removeAnimationForKey:", CFSTR("opacity"));

  }
LABEL_44:
  if (v45 && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 3) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideScrollIndicators, 0);
    v53 = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFBFFFFF;
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFFFCLL;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v53;
  }
  -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
  v55 = v54;
  v56 = v48 > 0.99 || v33 > 0.99;
  v57 = 0.0;
  if (!v56)
    v57 = 6.5 - v54;
  accuracy = self->_accuracy;
  if (accuracy == 1.0)
  {
    v60 = round(v57);
  }
  else
  {
    v59 = floor(v57);
    v60 = v59 + round(accuracy * (v57 - v59)) / accuracy;
  }
  -[UIScrollView _layoutVerticalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:](self, "_layoutVerticalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:", v33 <= 0.99, v49, v5, v71, v70, v19, v72, v69, v68, v28, v29, v67, v66, *(_QWORD *)&v33, *(_QWORD *)&v55, *(_QWORD *)&v60);
  if (v33 > 0.99)
  {
    v61 = *MEMORY[0x1E0C9D628];
    v62 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
    v63 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
    v64 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  }
  -[UIScrollView _layoutHorizontalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:verticalIndicatorFrame:](self, "_layoutHorizontalScrollIndicatorWithBounds:effectiveInset:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:verticalIndicatorFrame:", v48 <= 0.99, v50, v5, v71, v70, v19, v72, v69, v68, v28, v29, v67, v66, *(_QWORD *)&v48, *(_QWORD *)&v55, *(_QWORD *)&v60,
    v61,
    v62,
    v63,
    v64);

}

- (double)_scrollIndicatorAdditionalInset
{
  int64_t v3;
  double v4;
  double accuracy;
  double v6;

  v3 = -[UIView _userInterfaceIdiom](self, "_userInterfaceIdiom");
  v4 = 3.0;
  if (v3 == 3)
    UIRoundToViewScale(self);
  accuracy = self->_accuracy;
  if (accuracy == 1.0)
    return round(v4);
  v6 = floor(v4);
  return v6 + round((v4 - v6) * accuracy) / accuracy;
}

- (CGRect)_layoutVerticalScrollIndicatorWithBounds:(CGRect)a3 effectiveInset:(UIEdgeInsets)a4 contentOffset:(CGPoint)a5 fraction:(double)a6 additionalInset:(double)a7 cornerAdjust:(double)a8 needsIndicator:(BOOL)a9 showing:(BOOL)a10 recalcSize:(BOOL)a11
{
  _BOOL8 v11;
  CGFloat y;
  CGFloat x;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  CGFloat v20;
  CGFloat v21;
  double v23;
  _BOOL8 v24;
  double v25;
  UIScrollView *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
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
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  CGRect v61;
  CGRect result;

  v11 = a9;
  y = a5.y;
  x = a5.x;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.size.height;
  width = a3.size.width;
  v20 = a3.origin.y;
  v21 = a3.origin.x;
  if ((LOBYTE(a5.y) & 1) != 0)
    goto LABEL_10;
  -[UIView alpha](self->_verticalScrollIndicator, "alpha");
  if (v23 > 0.05)
  {
    if (LODWORD(x))
    {
      v24 = *(_DWORD *)&self->_scrollViewFlags >= 0;
      v25 = 1.0;
      v26 = self;
    }
    else
    {
      v25 = 0.0;
      v26 = self;
      v24 = 0;
    }
    -[UIScrollView _hideScrollIndicator:afterDelay:animated:](v26, "_hideScrollIndicator:afterDelay:animated:", self->_verticalScrollIndicator, v24, v25);
  }
  if (v11 || (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 4) != 0)
  {
LABEL_10:
    v51 = v21;
    v52 = v20;
    v53 = width;
    v54 = height;
    v55 = top;
    v56 = left;
    v57 = bottom;
    v58 = right;
    -[UIView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "flipsHorizontalAxis");
    -[UIView layer](self->_verticalScrollIndicator, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFlipsHorizontalAxis:", v32);

    -[UIScrollView _effectiveVerticalScrollIndicatorInsets](self, "_effectiveVerticalScrollIndicatorInsets");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v27 = *MEMORY[0x1E0C9D628];
    v28 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v29 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v30 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v61.origin.x = *(CGFloat *)MEMORY[0x1E0C9D628];
    v61.origin.y = v28;
    v61.size.width = v29;
    v61.size.height = v30;
    if (CGRectIsNull(v61))
    {
      -[UIScrollView _iOS_frameForLayoutVerticalScrollIndicatorWithBounds:effectiveInset:indicatorInsets:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:](self, "_iOS_frameForLayoutVerticalScrollIndicatorWithBounds:effectiveInset:indicatorInsets:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:", *(_QWORD *)&x, *(_QWORD *)&y, v11, v51, v52, v53, v54, v55, v56, v57, v58, v35 + v59, v37 + v59, v39 + v59, v41 + v59, *(_QWORD *)&a6,
        *(_QWORD *)&a7,
        *(_QWORD *)&a8,
        *(_QWORD *)&v59,
        v60);
      v27 = v42;
      v28 = v43;
      v29 = v44;
      v30 = v45;
    }
    -[UIView setFrame:](self->_verticalScrollIndicator, "setFrame:", v27, v28, v29, v30);
    if (LODWORD(y))
    {
      -[UIView alpha](self->_verticalScrollIndicator, "alpha");
      if (v46 < 1.0)
      {
        -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", self->_verticalScrollIndicator);
        -[UIView setAlpha:](self->_verticalScrollIndicator, "setAlpha:", 1.0);
      }
    }
  }
  else
  {
    v27 = *MEMORY[0x1E0C9D628];
    v28 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v29 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v30 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v47 = v27;
  v48 = v28;
  v49 = v29;
  v50 = v30;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

- (uint64_t)_layoutHorizontalScrollIndicatorWithBounds:(double)a3 effectiveInset:(double)a4 contentOffset:(double)a5 fraction:(double)a6 additionalInset:(double)a7 cornerAdjust:(double)a8 needsIndicator:(double)a9 showing:(uint64_t)a10 recalcSize:(uint64_t)a11 verticalIndicatorFrame:(uint64_t)a12
{
  uint64_t result;
  double v38;
  _BOOL8 v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
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
  double v56;
  double v57;
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
  double v68;
  double v69;
  CGRect v70;

  if ((a12 & 1) != 0)
    goto LABEL_9;
  result = objc_msgSend(*(id *)(a1 + 1536), "alpha");
  if (v38 > 0.05)
  {
    if ((_DWORD)a11)
    {
      v39 = *(_DWORD *)(a1 + 1768) >= 0;
      v40 = 1.0;
      v41 = (void *)a1;
    }
    else
    {
      v40 = 0.0;
      v41 = (void *)a1;
      v39 = 0;
    }
    result = objc_msgSend(v41, "_hideScrollIndicator:afterDelay:animated:", *(_QWORD *)(a1 + 1536), v39, v40);
  }
  if ((a13 & 1) != 0 || (*(_QWORD *)(a1 + 1780) & 8) != 0)
  {
LABEL_9:
    v62 = a2;
    v63 = a3;
    v64 = a4;
    v65 = a5;
    v66 = a6;
    v67 = a7;
    v68 = a8;
    v69 = a9;
    objc_msgSend((id)a1, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "flipsHorizontalAxis");
    objc_msgSend(*(id *)(a1 + 1536), "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFlipsHorizontalAxis:", v43);

    objc_msgSend((id)a1, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis");
    objc_msgSend((id)a1, "_effectiveHorizontalScrollIndicatorInsets");
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v53 = *MEMORY[0x1E0C9D628];
    v54 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v55 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v56 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v70.origin.x = *(CGFloat *)MEMORY[0x1E0C9D628];
    v70.origin.y = v54;
    v70.size.width = v55;
    v70.size.height = v56;
    if (CGRectIsNull(v70))
    {
      objc_msgSend((id)a1, "_iOS_frameForLayoutHorizontalScrollIndicatorWithBounds:effectiveInset:indicatorInsets:contentOffset:fraction:additionalInset:cornerAdjust:needsIndicator:showing:recalcSize:verticalIndicatorFrame:", a11, a12, a13, v62, v63, v64, v65, v66, v67, v68, v69, v46 + a20, v48 + a20, v50 + a20, v52 + a20, a17,
        a18,
        a19,
        *(_QWORD *)&a20,
        a21,
        a22,
        a23,
        a24,
        a25);
      v53 = v57;
      v54 = v58;
      v55 = v59;
      v56 = v60;
    }
    result = objc_msgSend(*(id *)(a1 + 1536), "setFrame:", v53, v54, v55, v56);
    if ((_DWORD)a12)
    {
      result = objc_msgSend(*(id *)(a1 + 1536), "alpha");
      if (v61 < 1.0)
      {
        objc_msgSend((id)a1, "bringSubviewToFront:", *(_QWORD *)(a1 + 1536));
        return objc_msgSend(*(id *)(a1 + 1536), "setAlpha:", 1.0);
      }
    }
  }
  return result;
}

- (double)_iOS_frameForLayoutVerticalScrollIndicatorWithBounds:(double)a3 effectiveInset:(double)a4 indicatorInsets:(double)a5 contentOffset:(double)a6 fraction:(double)a7 additionalInset:(double)a8 cornerAdjust:(uint64_t)a9 needsIndicator:(uint64_t)a10 showing:(uint64_t)a11 recalcSize:(char)a12
{
  int v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
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
  int v50;
  unint64_t v51;
  double v53;

  v28 = objc_msgSend((id)a1, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis");
  v29 = dyld_program_sdk_at_least() | v28 ^ 1;
  if (v29)
    v30 = a15;
  else
    v30 = a17;
  if (v29)
    v31 = a17;
  else
    v31 = a15;
  v53 = v31;
  v32 = v30 + v31;
  objc_msgSend(*(id *)(a1 + 1528), "frame");
  objc_msgSend((id)a1, "_verticalScrollIndicatorWidth");
  if ((a12 & 1) != 0 || (*(_QWORD *)(a1 + 1780) & 4) != 0)
  {
    v34 = *(double *)(a1 + 1208);
    v35 = a6;
    v36 = a5;
    v37 = a3;
  }
  else
  {
    v34 = *(double *)(a1 + 1208);
    v35 = a6;
    v36 = a5;
    v37 = a3;
  }
  v38 = a2 + v30;
  v39 = a4 - v32;
  v40 = *(double *)(a1 + 1304) - v35;
  if (v34 != 1.0)
  {
    v41 = floor(v40);
    v42 = v41 + round(v34 * (v40 - v41)) / v34;
    v43 = v38 + v39 - v33 + a22;
    if (v28)
      v43 = v38 - a22;
    if (v37 >= v42)
    {
      v44 = v37 + v36;
      v45 = a8 + *(double *)(a1 + 432);
      v46 = floor(v45);
      v47 = v46 + round(v34 * (v45 - v46)) / v34;
      goto LABEL_21;
    }
LABEL_19:
    v49 = v53;
LABEL_22:
    v50 = *(_DWORD *)(a1 + 1788);
    v51 = *(_QWORD *)(a1 + 1780) | 4;
    goto LABEL_24;
  }
  v48 = round(v40);
  v43 = v38 + v39 - v33 + a22;
  if (v28)
    v43 = v38 - a22;
  if (v37 < v48)
    goto LABEL_19;
  v44 = v37 + v36;
  v47 = round(a8 + *(double *)(a1 + 432));
LABEL_21:
  v49 = v53;
  if (v44 > v47)
    goto LABEL_22;
  v50 = *(_DWORD *)(a1 + 1788);
  v51 = *(_QWORD *)(a1 + 1780) & 0xFFFFFFFFFFFFFFFBLL;
LABEL_24:
  *(_QWORD *)(a1 + 1780) = v51;
  *(_DWORD *)(a1 + 1788) = v50;
  if (v43 < v38)
    v43 = a2 + v30;
  if (v43 >= a2 + a4 - v33 - v49)
    v43 = a2 + a4 - v33 - v49;
  return v43 - *(double *)(a1 + 1088);
}

- (BOOL)_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis
{
  int v2;
  void *v3;

  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
  {
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "flipsHorizontalAxis") ^ 1;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (double)_iOS_frameForLayoutHorizontalScrollIndicatorWithBounds:(CGFloat)a3 effectiveInset:(CGFloat)a4 indicatorInsets:(CGFloat)a5 contentOffset:(double)a6 fraction:(double)a7 additionalInset:(double)a8 cornerAdjust:(double)a9 needsIndicator:(uint64_t)a10 showing:(uint64_t)a11 recalcSize:(uint64_t)a12 verticalIndicatorFrame:(char)a13
{
  int v32;
  double MaxX;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
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
  double v56;
  float64x2_t v57;
  double v58;
  float64x2_t v59;
  float64x2_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  int v70;
  unint64_t v71;
  double rect_16;
  double rect_24;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  rect_16 = a17;
  rect_24 = a15;
  v32 = objc_msgSend((id)a1, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis");
  v80.origin.x = a23;
  v80.origin.y = a24;
  v80.size.width = a25;
  v80.size.height = a26;
  if (!CGRectIsNull(v80))
  {
    if ((v32 & 1) != 0)
    {
      v81.origin.x = a23;
      v81.origin.y = a24;
      v81.size.width = a25;
      v81.size.height = a26;
      MaxX = CGRectGetMaxX(v81);
      v82.origin.x = a2;
      v82.origin.y = a3;
      v82.size.width = a4;
      v82.size.height = a5;
      v34 = MaxX - CGRectGetMinX(v82);
      v35 = a15;
      if (a15 < v34)
        v35 = v34;
      rect_24 = v35;
    }
    else
    {
      v83.origin.x = a2;
      v83.origin.y = a3;
      v83.size.width = a4;
      v83.size.height = a5;
      v36 = CGRectGetMaxX(v83);
      v84.origin.x = a23;
      v84.origin.y = a24;
      v84.size.width = a25;
      v84.size.height = a26;
      v37 = v36 - CGRectGetMinX(v84);
      v38 = a17;
      if (a17 < v37)
        v38 = v37;
      rect_16 = v38;
    }
  }
  v39 = dyld_program_sdk_at_least() | v32 ^ 1;
  if (v39)
    v40 = rect_24;
  else
    v40 = rect_16;
  if (v39)
    v41 = rect_16;
  else
    v41 = rect_24;
  objc_msgSend(*(id *)(a1 + 1536), "frame");
  v43 = v42;
  objc_msgSend((id)a1, "_horizontalScrollIndicatorHeight");
  if ((a13 & 1) != 0 || (*(_QWORD *)(a1 + 1780) & 8) != 0)
  {
    v44 = *(uint64_t *)(a1 + 1208);
    v47 = a4 - (v40 + v41);
    v48 = v47 * a20;
    v45 = a7;
    v46 = a2;
    if (*(double *)&v44 == 1.0)
    {
      v50 = round(v48);
    }
    else
    {
      v49 = floor(v48);
      v50 = v49 + round((v48 - v49) * *(double *)&v44) / *(double *)&v44;
    }
    if (v50 >= 36.0)
      v43 = v50;
    else
      v43 = 36.0;
  }
  else
  {
    v44 = *(uint64_t *)(a1 + 1208);
    v45 = a7;
    v46 = a2;
    v47 = a4 - (v40 + v41);
  }
  v51 = v46 + v40;
  v52 = v47 - v43;
  v53 = *(double *)(a1 + 1296) - v45;
  if (*(double *)&v44 != 1.0)
  {
    v54 = floor(v53);
    v55 = v54 + round(*(double *)&v44 * (v53 - v54)) / *(double *)&v44;
    v56 = *(double *)(a1 + 424);
    v57.f64[0] = a9 + v45 + v56;
    v58 = a4;
    v57.f64[1] = a4;
    v59 = vrndmq_f64(v57);
    v60 = vaddq_f64(v59, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v57, v59), *(double *)&v44)), (float64x2_t)vdupq_lane_s64(v44, 0)));
    v61 = v51 + v52 * ((a18 - v55) / vsubq_f64(v60, (float64x2_t)vdupq_laneq_s64((int64x2_t)v60, 1)).f64[0]);
    v62 = floor(v61);
    v63 = v62 + round(*(double *)&v44 * (v61 - v62)) / *(double *)&v44;
    if (v46 >= v55)
    {
      v64 = v46 + a4;
      v65 = a9 + v56;
      v66 = floor(v65);
      v67 = v66 + round(*(double *)&v44 * (v65 - v66)) / *(double *)&v44;
      goto LABEL_32;
    }
LABEL_28:
    if (v43 - (v55 - v46) >= 7.0)
      v43 = v43 - (v55 - v46);
    else
      v43 = 7.0;
    goto LABEL_36;
  }
  v55 = round(v53);
  v68 = *(double *)(a1 + 424);
  v58 = a4;
  v63 = round(v51 + v52 * ((a18 - v55) / (round(a9 + v45 + v68) - round(a4))));
  if (v46 < v55)
    goto LABEL_28;
  v64 = v46 + a4;
  v67 = round(a9 + v68);
LABEL_32:
  if (v64 > v67)
  {
    v69 = v64 - v67;
    v63 = v63 + v69;
    if (v43 - v69 >= 7.0)
      v43 = v43 - v69;
    else
      v43 = 7.0;
LABEL_36:
    v70 = *(_DWORD *)(a1 + 1788);
    v71 = *(_QWORD *)(a1 + 1780) | 8;
    goto LABEL_38;
  }
  v70 = *(_DWORD *)(a1 + 1788);
  v71 = *(_QWORD *)(a1 + 1780) & 0xFFFFFFFFFFFFFFF7;
LABEL_38:
  *(_QWORD *)(a1 + 1780) = v71;
  *(_DWORD *)(a1 + 1788) = v70;
  if (v63 < v51)
    v63 = v51;
  if (v63 >= v46 + v58 - v43 - v41 - a22)
    v63 = v46 + v58 - v43 - v41 - a22;
  return v63 - *(double *)(a1 + 1088);
}

- (UIEdgeInsets)_effectiveHorizontalScrollIndicatorInsets
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
  char v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  UIEdgeInsets result;

  -[UIScrollView horizontalScrollIndicatorInsets](self, "horizontalScrollIndicatorInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView _cachedHorizontalScrollIndicatorBaseInsets](self, "_cachedHorizontalScrollIndicatorBaseInsets");
  if (v14 == 1.79769313e308 && v11 == 1.79769313e308 && v13 == 1.79769313e308 && v12 == 1.79769313e308)
  {
    -[UIScrollView _computeBaseInsetsForHorizontalScrollIndicatorWithClientInsets:](self, "_computeBaseInsetsForHorizontalScrollIndicatorWithClientInsets:", v4, v6, v8, v10);
    v19 = v26;
    v21 = v27;
    v23 = v28;
    v25 = v29;
    -[UIScrollView _setCachedHorizontalScrollIndicatorBaseInsets:](self, "_setCachedHorizontalScrollIndicatorBaseInsets:");
  }
  else
  {
    -[UIScrollView _cachedHorizontalScrollIndicatorBaseInsets](self, "_cachedHorizontalScrollIndicatorBaseInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  v30 = -[UIScrollView _edgesApplyingBaseInsetsToScrollIndicatorInsets](self, "_edgesApplyingBaseInsetsToScrollIndicatorInsets");
  v31 = -0.0;
  if ((v30 & 1) != 0)
    v32 = v19;
  else
    v32 = -0.0;
  v33 = v4 + v32;
  if ((v30 & 2) != 0)
    v34 = v21;
  else
    v34 = -0.0;
  v35 = v6 + v34;
  if ((v30 & 4) != 0)
    v36 = v23;
  else
    v36 = -0.0;
  v37 = v8 + v36;
  if ((v30 & 8) != 0)
    v31 = v25;
  v38 = v10 + v31;
  -[UIView layer](self, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "flipsHorizontalAxis");
  if (v40)
    v41 = v35;
  else
    v41 = v38;
  if (v40)
    v35 = v38;

  v42 = v33;
  v43 = v35;
  v44 = v37;
  v45 = v41;
  result.right = v45;
  result.bottom = v44;
  result.left = v43;
  result.top = v42;
  return result;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  UIEdgeInsets *p_horizontalScrollIndicatorInsets;
  float64x2_t v3;
  float64x2_t v4;
  double bottom;
  double right;
  double left;
  UIEdgeInsets result;

  p_horizontalScrollIndicatorInsets = &self->_horizontalScrollIndicatorInsets;
  v3 = *(float64x2_t *)&self->_horizontalScrollIndicatorInsets.top;
  v4 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v3, v4), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_horizontalScrollIndicatorInsets.bottom, v4))))) & 1) == 0)
  {
    p_horizontalScrollIndicatorInsets = &self->_scrollIndicatorInset;
    v3.f64[0] = self->_scrollIndicatorInset.top;
  }
  bottom = p_horizontalScrollIndicatorInsets->bottom;
  right = p_horizontalScrollIndicatorInsets->right;
  left = p_horizontalScrollIndicatorInsets->left;
  result.top = v3.f64[0];
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  return result;
}

- (UIEdgeInsets)_cachedHorizontalScrollIndicatorBaseInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cachedHorizontalScrollIndicatorBaseInsets.top;
  left = self->_cachedHorizontalScrollIndicatorBaseInsets.left;
  bottom = self->_cachedHorizontalScrollIndicatorBaseInsets.bottom;
  right = self->_cachedHorizontalScrollIndicatorBaseInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)_effectiveVerticalScrollIndicatorInsets
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
  char v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  UIEdgeInsets result;

  -[UIScrollView verticalScrollIndicatorInsets](self, "verticalScrollIndicatorInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView _cachedVerticalScrollIndicatorBaseInsets](self, "_cachedVerticalScrollIndicatorBaseInsets");
  if (v14 == 1.79769313e308 && v11 == 1.79769313e308 && v13 == 1.79769313e308 && v12 == 1.79769313e308)
  {
    -[UIScrollView _computeBaseInsetsForVerticalScrollIndicatorWithClientInsets:](self, "_computeBaseInsetsForVerticalScrollIndicatorWithClientInsets:", v4, v6, v8, v10);
    v19 = v26;
    v21 = v27;
    v23 = v28;
    v25 = v29;
    -[UIScrollView _setCachedVerticalScrollIndicatorBaseInsets:](self, "_setCachedVerticalScrollIndicatorBaseInsets:");
  }
  else
  {
    -[UIScrollView _cachedVerticalScrollIndicatorBaseInsets](self, "_cachedVerticalScrollIndicatorBaseInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  v30 = -[UIScrollView _edgesApplyingBaseInsetsToScrollIndicatorInsets](self, "_edgesApplyingBaseInsetsToScrollIndicatorInsets");
  v31 = -0.0;
  if ((v30 & 1) != 0)
    v32 = v19;
  else
    v32 = -0.0;
  v33 = v4 + v32;
  if ((v30 & 2) != 0)
    v34 = v21;
  else
    v34 = -0.0;
  v35 = v6 + v34;
  if ((v30 & 4) != 0)
    v36 = v23;
  else
    v36 = -0.0;
  v37 = v8 + v36;
  if ((v30 & 8) != 0)
    v31 = v25;
  v38 = v10 + v31;
  -[UIView layer](self, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "flipsHorizontalAxis");
  if (v40)
    v41 = v35;
  else
    v41 = v38;
  if (v40)
    v35 = v38;

  v42 = v33;
  v43 = v35;
  v44 = v37;
  v45 = v41;
  result.right = v45;
  result.bottom = v44;
  result.left = v43;
  result.top = v42;
  return result;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  UIEdgeInsets *p_verticalScrollIndicatorInsets;
  float64x2_t v3;
  float64x2_t v4;
  double bottom;
  double right;
  double left;
  UIEdgeInsets result;

  p_verticalScrollIndicatorInsets = &self->_verticalScrollIndicatorInsets;
  v3 = *(float64x2_t *)&self->_verticalScrollIndicatorInsets.top;
  v4 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v3, v4), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_verticalScrollIndicatorInsets.bottom, v4))))) & 1) == 0)
  {
    p_verticalScrollIndicatorInsets = &self->_scrollIndicatorInset;
    v3.f64[0] = self->_scrollIndicatorInset.top;
  }
  bottom = p_verticalScrollIndicatorInsets->bottom;
  right = p_verticalScrollIndicatorInsets->right;
  left = p_verticalScrollIndicatorInsets->left;
  result.top = v3.f64[0];
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  return result;
}

- (UIEdgeInsets)_cachedVerticalScrollIndicatorBaseInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cachedVerticalScrollIndicatorBaseInsets.top;
  left = self->_cachedVerticalScrollIndicatorBaseInsets.left;
  bottom = self->_cachedVerticalScrollIndicatorBaseInsets.bottom;
  right = self->_cachedVerticalScrollIndicatorBaseInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)_baseInsetsForAccessoryOnEdge:(int64_t)a3 hasCustomClientInsets:(BOOL)a4 accessorySize:(double)a5 additionalInsetFromEdge:(double)a6
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
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
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  unint64_t v48;
  char v49;
  double x;
  CGFloat width;
  CGFloat height;
  void *v53;
  int v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat MinX;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  double MaxY;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  CGFloat v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double MinY;
  double v97;
  CGFloat v98;
  double v99;
  double v100;
  CGFloat rect;
  double rectb;
  double recta;
  CGFloat v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  CGFloat v108;
  double MaxX;
  CGFloat v110;
  CGFloat v111;
  CGFloat y;
  CGFloat v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  UIEdgeInsets result;
  CGRect v135;

  if (a3 == 1)
    -[UIScrollView _safeAreaInsetsConsultingAlternativeTopInsetIfApplicable](self, "_safeAreaInsetsConsultingAlternativeTopInsetIfApplicable");
  else
    -[UIView safeAreaInsets](self, "safeAreaInsets");
  v16 = v12;
  v17 = v13;
  v18 = v15;
  v19 = v14 + self->_keyboardBottomInsetAdjustment;
  if (!a4 && (v13 != 0.0 || v12 != 0.0 || v15 != 0.0 || v19 != 0.0))
  {
    -[UIView window](self, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_sceneSafeAreaInsetsIncludingStatusBar:", 0);
    if (v20
      && (v22 != 0.0 || v21 != 0.0 || v24 != 0.0 || v23 != 0.0)
      && (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x200) != 0)
    {
      v84 = v22;
      v86 = v24;
      v88 = v21;
      v90 = v23;
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v94 = v25;
      if (v25 <= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView.m"), 14878, CFSTR("Invalid screen scale: %f"), *(_QWORD *)&v94);

      }
      -[UIView bounds](self, "bounds");
      v27 = v26;
      v91 = v29;
      v92 = v28;
      v31 = v30;
      v82 = v30;
      v83 = v26;
      if (objc_msgSend(v20, "_isHostedInAnotherProcess"))
      {
        -[UIView convertRect:toView:](self, "convertRect:toView:", v20, v27, v92, v31, v91);
        v106 = v32;
        v108 = v34;
        v111 = v33;
        v104 = v35;
        objc_msgSend(v20, "bounds");
      }
      else
      {
        v106 = __UIViewConvertRectInViewToSceneSpace(self, v20, v27, v92, v31, v91);
        v108 = v41;
        v111 = v40;
        v104 = v42;
        objc_msgSend(v20, "_sceneBounds");
      }
      v93 = 1.0 / v94;
      v43 = v36;
      v95 = v37;
      v98 = v39;
      rect = v38;
      v114 = CGRectInset(*(CGRect *)&v36, -(1.0 / v94), -(1.0 / v94));
      v135.size.height = v104;
      v135.origin.x = v106;
      v135.size.width = v108;
      v135.origin.y = v111;
      if (CGRectContainsRect(v114, v135))
      {
        v115.origin.x = v43;
        v115.origin.y = v95;
        v115.size.height = v98;
        v115.size.width = rect;
        v85 = v84 + CGRectGetMinX(v115);
        v116.origin.x = v106;
        v116.size.width = v108;
        v116.origin.y = v111;
        v116.size.height = v104;
        v44 = vabdd_f64(v85, v17 + CGRectGetMinX(v116)) < v93;
        v117.origin.x = v43;
        v117.origin.y = v95;
        v117.size.height = v98;
        v117.size.width = rect;
        v87 = CGRectGetMaxX(v117) - v86;
        v118.size.height = v104;
        v118.origin.x = v106;
        v118.origin.y = v111;
        v118.size.width = v108;
        if (vabdd_f64(v87, CGRectGetMaxX(v118) - v18) >= v93)
          v45 = 2 * v44;
        else
          v45 = (2 * v44) | 8;
        v119.origin.x = v43;
        v119.origin.y = v95;
        v119.size.height = v98;
        v119.size.width = rect;
        v89 = v88 + CGRectGetMinY(v119);
        v120.origin.y = v111;
        v120.size.width = v108;
        v120.origin.x = v106;
        v120.size.height = v104;
        v46 = v45 | (vabdd_f64(v89, v16 + CGRectGetMinY(v120)) < v93);
        v121.origin.x = v43;
        v121.origin.y = v95;
        v121.size.height = v98;
        v121.size.width = rect;
        v47 = CGRectGetMaxY(v121) - v90;
        v122.origin.x = v106;
        v122.size.width = v108;
        v122.origin.y = v111;
        v122.size.height = v104;
        if (vabdd_f64(v47, CGRectGetMaxY(v122) - v19) < v93)
          v46 |= 4uLL;
        v48 = -[UIScrollView _edgesAllowingScrollAccessoriesExtendedToBoundingPath](self, "_edgesAllowingScrollAccessoriesExtendedToBoundingPath");
        v49 = v46 & v48;
        if ((v46 & v48) != 0)
        {
          -[UIView _rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:](self, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", _edgeForScrollAccessoryEdge(a3, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1), a5, a5 * 0.5, a5 * 0.5, a5 * 0.5, a5 * 0.5, a6);
          x = v123.origin.x;
          width = v123.size.width;
          height = v123.size.height;
          y = v123.origin.y;
          if (!CGRectIsNull(v123))
          {
            -[UIView layer](self, "layer");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "flipsHorizontalAxis");

            if (v54)
            {
              -[UIView bounds](self, "bounds");
              MaxX = CGRectGetMaxX(v124);
              v125.origin.x = x;
              v125.origin.y = y;
              v125.size.width = width;
              v125.size.height = height;
              v55 = CGRectGetMaxX(v125);
              v56 = y;
              x = MaxX - v55;
            }
            else
            {
              v56 = y;
            }
            v57 = x;
            v58 = width;
            v59 = height;
            v126 = CGRectInset(*(CGRect *)(&v56 - 1), -a6, -a6);
            v110 = v126.origin.y;
            v113 = v126.origin.x;
            v105 = v126.size.height;
            v107 = v126.size.width;
            rectb = CGRectGetMinX(v126);
            v127.origin.x = v83;
            v127.origin.y = v92;
            v127.size.width = v82;
            v127.size.height = v91;
            MinX = CGRectGetMinX(v127);
            UIRoundToScale(rectb - MinX, v94);
            recta = v61;
            v128.origin.x = v83;
            v128.origin.y = v92;
            v128.size.width = v82;
            v128.size.height = v91;
            v99 = CGRectGetMaxX(v128);
            v129.origin.x = v113;
            v129.origin.y = v110;
            v129.size.width = v107;
            v129.size.height = v105;
            v62 = CGRectGetMaxX(v129);
            UIRoundToScale(v99 - v62, v94);
            v100 = v63;
            v130.origin.x = v113;
            v130.origin.y = v110;
            v130.size.width = v107;
            v130.size.height = v105;
            MinY = CGRectGetMinY(v130);
            v131.origin.x = v83;
            v131.origin.y = v92;
            v131.size.width = v82;
            v131.size.height = v91;
            v64 = CGRectGetMinY(v131);
            UIRoundToScale(MinY - v64, v94);
            v97 = v65;
            v132.origin.x = v83;
            v132.origin.y = v92;
            v132.size.width = v82;
            v132.size.height = v91;
            MaxY = CGRectGetMaxY(v132);
            v133.origin.y = v110;
            v133.origin.x = v113;
            v133.size.height = v105;
            v133.size.width = v107;
            v67 = CGRectGetMaxY(v133);
            UIRoundToScale(MaxY - v67, v94);
            v69 = v68;
            if ((v49 & 1) != 0)
              v70 = v97;
            else
              v70 = v16;
            if ((v49 & 2) != 0)
              v71 = recta;
            else
              v71 = v17;
            if ((v49 & 4) != 0)
              v72 = v69;
            else
              v72 = v19;
            if ((v49 & 8) != 0)
              v73 = v100;
            else
              v73 = v18;
            v16 = UIEdgeInsetsMax(~v49, v70, v71, v72, v73, v97);
            v17 = v74;
            v19 = v75;
            v18 = v76;
          }
        }
      }
    }

  }
  v77 = v16;
  v78 = v17;
  v79 = v19;
  v80 = v18;
  result.right = v80;
  result.bottom = v79;
  result.left = v78;
  result.top = v77;
  return result;
}

- (double)_horizontalScrollIndicatorHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:](_UIScrollViewScrollIndicator, "visualStyleForTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "staticDimensionSize");
  v5 = v4;

  return v5;
}

- (double)_verticalScrollIndicatorWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:](_UIScrollViewScrollIndicator, "visualStyleForTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "staticDimensionSize");
  v5 = v4;

  return v5;
}

- (int64_t)_effectiveIndicatorStyle
{
  int64_t v2;
  void *v3;
  _BOOL4 v4;

  v2 = (*(_QWORD *)&self->_scrollViewFlags >> 28) & 3;
  if (!v2)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle") == 2;

    return 2 * v4;
  }
  return v2;
}

- (UIEdgeInsets)_safeAreaInsetsConsultingAlternativeTopInsetIfApplicable
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  int v33;
  UIScrollView *v34;
  uint64_t v35;
  UIEdgeInsets result;

  v35 = *MEMORY[0x1E0C80C00];
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000000000) != 0)
  {
    -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_outermostNavigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v11, "presentingViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_outermostNavigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UIView superview](self, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && v13 && -[UIScrollView _isScrollViewScrollObserver:](self, "_isScrollViewScrollObserver:", v13))
    {
      v17 = objc_msgSend(v13, "isViewLoaded");

      if (v17)
      {
        -[UIView superview](self, "superview");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView frame](self, "frame");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v13, "_existingView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "convertPoint:toView:", v23, v20, v22);
        v25 = v24;

        -[UIScrollView _alternativeVerticalScrollIndicatorTopSafeAreaInset](self, "_alternativeVerticalScrollIndicatorTopSafeAreaInset");
        v4 = fmax(fmin(v26 - v25, v26), 0.0);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {

    }
    v27 = _safeAreaInsetsConsultingAlternativeTopInsetIfApplicable___s_category;
    if (!_safeAreaInsetsConsultingAlternativeTopInsetIfApplicable___s_category)
    {
      v27 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&_safeAreaInsetsConsultingAlternativeTopInsetIfApplicable___s_category);
    }
    if ((*(_BYTE *)v27 & 1) != 0)
    {
      v32 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = 138412290;
        v34 = self;
        _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "%@ abandoned with _scrollViewFlags.verticalScrollIndicatorUsesAlternativeTopSafeAreaInset on. Turning it off now.", (uint8_t *)&v33, 0xCu);
      }
    }
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x4000000000000000uLL;
    goto LABEL_14;
  }
LABEL_15:
  v28 = v4;
  v29 = v6;
  v30 = v8;
  v31 = v10;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (unint64_t)_edgesAllowingScrollAccessoriesExtendedToBoundingPath
{
  return self->_edgesAllowingScrollAccessoriesExtendedToBoundingPath;
}

- (double)_alternativeVerticalScrollIndicatorTopSafeAreaInset
{
  return self->__alternativeVerticalScrollIndicatorTopSafeAreaInset;
}

- (id)_relativePanView
{
  return objc_loadWeakRetained((id *)&self->_relativePanView);
}

- (double)_topLayoutInsetForSidebar
{
  return self->_topLayoutInsetForSidebar;
}

- (void)_updatePanGestureConfiguration
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_minimumZoomScale == self->_maximumZoomScale)
  {
    v5 = 1;
    v4 = 0xFFFFFFFFLL;
  }
  else
  {
    v3 = -[UIGestureRecognizer isEnabled](self->_pinch, "isEnabled");
    v4 = 0xFFFFFFFFLL;
    if (v3)
      v4 = 2;
    v5 = !v3;
  }
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x8000) != 0)
    v6 = 1;
  else
    v6 = v4;
  -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_pan, "setMaximumNumberOfTouches:", v6);
  -[UIPanGestureRecognizer _setIgnoresStationaryTouches:](self->_pan, "_setIgnoresStationaryTouches:", v5);
}

void __34__UIScrollView__updateAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinX;
  double Width;
  uint64_t v20;
  double v21;
  double v22;
  double MaxX;
  double MinY;
  double Height;
  double v26;
  double v27;
  double MaxY;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v29 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = v5;
  if (v5 <= 1)
  {
    if ((v5 == 1) != objc_msgSend(*(id *)(a1 + 32), "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis"))v6 = 5;
    else
      v6 = 3;
  }
  objc_msgSend(v29, "setEdge:", v6);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "flipsHorizontalAxis");

  objc_msgSend(v29, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "flipsHorizontalAxis");

  if ((_DWORD)v8 != v10)
  {
    objc_msgSend(v29, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFlipsHorizontalAxis:", v8);

  }
  v13 = *(double *)(a1 + 40);
  v12 = *(double *)(a1 + 48);
  objc_msgSend(v29, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v15 = v14;
  v17 = v16;
  if (!(_DWORD)v8)
    goto LABEL_10;
  if (v5 == 3)
  {
LABEL_13:
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
    v32.origin.x = v13;
    v32.origin.y = v12;
    v32.size.width = v15;
    v32.size.height = v17;
    v13 = MaxX - CGRectGetWidth(v32);
    MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
    Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
    v33.origin.x = v13;
    v33.origin.y = v12;
    v33.size.width = v15;
    v33.size.height = v17;
    v12 = MinY + (Height - CGRectGetHeight(v33)) * 0.5;
    v20 = 17;
    goto LABEL_16;
  }
  if (v5 == 5)
  {
LABEL_12:
    v21 = CGRectGetMinY(*(CGRect *)(a1 + 40));
    v22 = CGRectGetHeight(*(CGRect *)(a1 + 40));
    v31.origin.x = v13;
    v31.origin.y = v12;
    v31.size.width = v15;
    v31.size.height = v17;
    v12 = v21 + (v22 - CGRectGetHeight(v31)) * 0.5;
    v20 = 20;
  }
  else
  {
LABEL_10:
    switch(v6)
    {
      case 2:
        MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
        Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
        v30.origin.x = v13;
        v30.origin.y = v12;
        v30.size.width = v15;
        v30.size.height = v17;
        v13 = MinX + (Width - CGRectGetWidth(v30)) * 0.5;
        v20 = 34;
        break;
      case 3:
        goto LABEL_12;
      case 4:
        v26 = CGRectGetMinX(*(CGRect *)(a1 + 40));
        v27 = CGRectGetWidth(*(CGRect *)(a1 + 40));
        v34.origin.x = v13;
        v34.origin.y = v12;
        v34.size.width = v15;
        v34.size.height = v17;
        v13 = v26 + (v27 - CGRectGetWidth(v34)) * 0.5;
        MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 40));
        v35.origin.x = v13;
        v35.origin.y = v12;
        v35.size.width = v15;
        v35.size.height = v17;
        v12 = MaxY - CGRectGetHeight(v35);
        v20 = 10;
        break;
      case 5:
        goto LABEL_13;
      default:
        v20 = 0;
        break;
    }
  }
LABEL_16:
  objc_msgSend(v29, "setFrame:", v13, v12, v15, v17);
  objc_msgSend(v29, "setAutoresizingMask:", v20);
  objc_msgSend(v29, "update");

}

- (BOOL)isZooming
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 3) >> 6) & 1;
}

- (BOOL)_isAnimatingScrollTest
{
  void *v2;
  BOOL v3;

  -[UIScrollView scrollTestParameters](self, "scrollTestParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)scrollTestParameters
{
  return self->_scrollTestParameters;
}

- (void)_addScrollViewScrollObserver:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSHashTable *scrollNotificationObservers;
  NSHashTable *v12;
  NSHashTable *v13;
  int v14;
  void *v15;
  __int16 v16;
  UIScrollView *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_18;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIScrollView _observerImplementingWillEndDraggingMethod](self, "_observerImplementingWillEndDraggingMethod");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (!v5 || (id)v5 == v4)
      goto LABEL_13;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
      NSStringFromSelector(sel__observeScrollView_willEndDraggingWithVelocity_targetContentOffset_unclampedOriginalTarget_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138413058;
      v15 = v10;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v6;
      _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "UIScrollView does not support multiple observers implementing %@. Scroll view %@, new observer %@, removing old observer %@", (uint8_t *)&v14, 0x2Au);
    }
    else
    {
      v7 = _addScrollViewScrollObserver____s_category;
      if (!_addScrollViewScrollObserver____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_addScrollViewScrollObserver____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v9 = v8;
      NSStringFromSelector(sel__observeScrollView_willEndDraggingWithVelocity_targetContentOffset_unclampedOriginalTarget_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138413058;
      v15 = v10;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "UIScrollView does not support multiple observers implementing %@. Scroll view %@, new observer %@, removing old observer %@", (uint8_t *)&v14, 0x2Au);
    }

LABEL_11:
LABEL_12:
    -[UIScrollView _removeScrollViewScrollObserver:](self, "_removeScrollViewScrollObserver:", v6);
LABEL_13:

  }
  scrollNotificationObservers = self->_scrollNotificationObservers;
  if (scrollNotificationObservers)
  {
    v12 = (NSHashTable *)-[NSHashTable copy](scrollNotificationObservers, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  }
  v13 = self->_scrollNotificationObservers;
  self->_scrollNotificationObservers = v12;

  -[NSHashTable addObject:](self->_scrollNotificationObservers, "addObject:", v4);
LABEL_18:

}

- (id)_observerImplementingWillEndDraggingMethod
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__236;
  v9 = __Block_byref_object_dispose__236;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__UIScrollView__observerImplementingWillEndDraggingMethod__block_invoke;
  v4[3] = &unk_1E16EAA80;
  v4[4] = &v5;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)_isScrubbing
{
  return (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x7800) != 0;
}

- (void)_skipNextStartOffsetAdjustment
{
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x80000uLL;
}

- (BOOL)_showsBackgroundShadow
{
  return self->_shadows != 0;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  id WeakRetained;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  unint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
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
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v13 = v8;
  v15 = v14;
  v16 = v14 == height && v8 == width;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  v57.origin.x = v10;
  v57.origin.y = v12;
  v57.size.width = v13;
  v57.size.height = v15;
  if (!CGRectEqualToRect(v54, v57))
  {
    -[UIScrollView _systemContentInset](self, "_systemContentInset");
    v51 = v18;
    v52 = v17;
    v49 = v20;
    v50 = v19;
    v21 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
    if (!v16)
    {
      v47 = v10;
      if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x400000) != 0)
      {
        -[UIScrollView contentSize](self, "contentSize");
        v44 = v22;
        v45 = v12;
        v24 = v23;
        WeakRetained = objc_loadWeakRetained(&self->_delegate);
        -[UIScrollView zoomScale](self, "zoomScale");
        objc_msgSend(WeakRetained, "scrollView:contentSizeForZoomScale:withProposedSize:", self);
        v43 = v26;
        v28 = v27;

        v29 = v44 == v43 && v24 == v28;
        v12 = v45;
        if (!v29)
          -[UIScrollView setContentSize:](self, "setContentSize:", v43, v28, v44);
      }
      -[UIView bounds](self, "bounds", *(_QWORD *)&v43);
      v31 = v30 * -0.000000184659091 + 0.000359090909;
      if (v30 > 1024.0)
        v31 = 0.00017;
      self->_pagingSpringPull = v31;
      -[UIView bounds](self, "bounds");
      v33 = v32 * 0.00000994318182 + 0.966818182;
      if (v32 > 1024.0)
        v33 = 0.977;
      self->_pagingFriction = v33;
      v10 = v47;
    }
    -[UIView _containingScrollView](self, "_containingScrollView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView _attemptToDragParent:forNewBounds:oldBounds:](self, "_attemptToDragParent:forNewBounds:oldBounds:", v34, x, y, width, height, v10, v12, v13, v15);
    v35 = (unint64_t)objc_loadWeakRetained((id *)&self->_animation);
    v36 = (void *)v35;
    if (((*((_BYTE *)&self->_scrollViewFlags + 2) & 0x80) != 0 || (unint64_t)self->_scrollHeartbeat | v35)
      && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x200000080000) == 0x200000000000
      && (-[_UIScrollViewScrollableAncestor _descendentScrollView:shouldPreserveStartOffset:](self->_scrollableAncestor, "_descendentScrollView:shouldPreserveStartOffset:", self, self->_startOffsetX, self->_startOffsetY) & 1) == 0)
    {
      v37 = v12;
      v38 = x - v10;
      v46 = v37;
      v39 = y - v37;
      self->_startOffsetX = x - v10 + self->_startOffsetX;
      self->_startOffsetY = v39 + self->_startOffsetY;
      v40 = v39 + self->_pageDecelerationTarget.y;
      self->_pageDecelerationTarget.x = x - v10 + self->_pageDecelerationTarget.x;
      self->_pageDecelerationTarget.y = v40;
      v48 = v39;
      objc_msgSend(v36, "adjustForContentOffsetDelta:", x - v10);
      v41 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
      if ((v41 & 0x4000000000) != 0)
      {
        self->_adjustedDecelerationTarget.x = v38 + self->_adjustedDecelerationTarget.x;
        v41 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
      }
      if ((v41 & 0x8000000000) != 0)
        self->_adjustedDecelerationTarget.y = v48 + self->_adjustedDecelerationTarget.y;
      self->_lastUpdateOffsetX = v38 + self->_lastUpdateOffsetX;
      self->_lastUpdateOffsetY = v48 + self->_lastUpdateOffsetY;
      v12 = v46;
    }
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x80000uLL;
    kdebug_trace();
    v53.receiver = self;
    v53.super_class = (Class)UIScrollView;
    -[UIView setBounds:](&v53, sel_setBounds_, x, y, width, height);
    if (!v16)
    {
      if ((((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 11) & 0xF) - 1 <= 3)
        -[UIScrollView _forcePanGestureToEndImmediately](self, "_forcePanGestureToEndImmediately");
      -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
      -[UIScrollView _updateUsesStaticScrollBar](self, "_updateUsesStaticScrollBar");
      -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v21, 0, v52, v51, v50, v49);
      v55.origin.x = v10;
      v55.origin.y = v12;
      v55.size.width = v13;
      v55.size.height = v15;
      v42 = CGRectGetHeight(v55);
      v56.origin.x = x;
      v56.origin.y = y;
      v56.size.width = width;
      v56.size.height = height;
      if (v42 != CGRectGetHeight(v56))
        -[UIScrollView _sendGeometryAffectingContentBottomChangedToScrollObservers](self, "_sendGeometryAffectingContentBottomChangedToScrollObservers");
    }

  }
}

- (void)_attemptToDragParent:(id)a3 forNewBounds:(CGRect)a4 oldBounds:(CGRect)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t scrollViewFlags;
  float64_t v17;
  float64x2_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  int8x16_t v33;
  double v34;
  double v35;
  int v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  double accuracy;
  double v52;
  double v53;
  double v54;
  BOOL v55;
  BOOL v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat height;
  CGFloat width;
  int8x16_t v64;
  double v65;
  CATransform3D v66;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v7 = a4.origin.y;
  v8 = a4.origin.x;
  v10 = a3;
  if (!objc_msgSend(v10, "isPagingEnabled")
    || !objc_msgSend(v10, "isScrollEnabled")
    || !-[UIScrollView _transfersScrollToContainer](self, "_transfersScrollToContainer"))
  {
    goto LABEL_71;
  }
  objc_msgSend(v10, "contentOffset");
  v13 = v12;
  v14 = v11;
  scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x800000) != 0)
  {
    if ((scrollViewFlags & 0x40000080) != 0)
      goto LABEL_68;
  }
  else if ((scrollViewFlags & 0x40000080) != 0 || self->_scrollHeartbeat == 0)
  {
    goto LABEL_68;
  }
  v61 = v11;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v20 = v19;
  v22 = v21;
  v23 = *(uint64_t *)&self->_accuracy;
  v24.f64[0] = self->_firstPageOffset.horizontal - v21;
  v24.f64[1] = self->_firstPageOffset.vertical - v20;
  v60 = v13;
  if (*(double *)&v23 == 1.0)
  {
    v27 = vrndaq_f64(v24);
    v18.f64[1] = v17;
    v30 = vrndaq_f64(vaddq_f64(v18, (float64x2_t)self->_contentSize));
  }
  else
  {
    v25 = vrndmq_f64(v24);
    v26 = (float64x2_t)vdupq_lane_s64(v23, 0);
    v27 = vaddq_f64(v25, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v24, v25), *(double *)&v23)), v26));
    v18.f64[1] = v17;
    v28 = vaddq_f64(v18, (float64x2_t)self->_contentSize);
    v29 = vrndmq_f64(v28);
    v30 = vaddq_f64(v29, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v28, v29), *(double *)&v23)), v26));
  }
  v31.f64[0] = width;
  v31.f64[1] = height;
  v32 = vsubq_f64(v30, v31);
  v33 = vbslq_s8((int8x16_t)vcgtq_f64(v32, v27), (int8x16_t)v32, (int8x16_t)v27);
  v34 = v8 - x;
  if (v8 >= v27.f64[0] || v34 + self->_parentAdjustment.x > 0.0)
  {
    v35 = 0.0;
    if (v8 <= *(double *)v33.i64 || v34 + self->_parentAdjustment.x < 0.0)
    {
      v36 = 1;
      v13 = v60;
      goto LABEL_39;
    }
  }
  v64 = v33;
  v37 = objc_msgSend(v10, "_canScrollX", *(_QWORD *)&v60);
  v23 = *(uint64_t *)&self->_accuracy;
  if (v37)
  {
    v38 = self->_firstPageOffset.horizontal - v22;
    if (*(double *)&v23 == 1.0)
    {
      v40 = round(v38);
    }
    else
    {
      v39 = floor(v38);
      v40 = v39 + round(*(double *)&v23 * (v38 - v39)) / *(double *)&v23;
    }
    if (v8 >= v40 || x <= v40)
    {
      if (v8 <= *(double *)v64.i64 || x >= *(double *)v64.i64)
        goto LABEL_37;
      v43 = x - *(double *)v64.i64;
    }
    else
    {
      v43 = x - v40;
    }
    v34 = v34 + v43;
LABEL_37:
    objc_msgSend(v10, "_adjustedHorizontalOffsetPinnedToScrollableBounds:", v34);
    v35 = v44;
    v36 = 0;
    self->_parentAdjustment.x = v44 + self->_parentAdjustment.x;
    v23 = *(uint64_t *)&self->_accuracy;
    goto LABEL_38;
  }
  v36 = 1;
  v35 = 0.0;
LABEL_38:
  v13 = v60;
  v33.i64[1] = v64.i64[1];
LABEL_39:
  v45 = self->_firstPageOffset.vertical - v20;
  if (*(double *)&v23 == 1.0)
  {
    v47 = round(v45);
  }
  else
  {
    v46 = floor(v45);
    v47 = v46 + round(*(double *)&v23 * (v45 - v46)) / *(double *)&v23;
  }
  v48 = v7 - y;
  if (v7 < v47 && v48 + self->_parentAdjustment.y <= 0.0
    || (v49 = 0.0, v7 > *(double *)&v33.i64[1]) && v48 + self->_parentAdjustment.y >= 0.0)
  {
    v65 = *(double *)&v33.i64[1];
    v50 = objc_msgSend(v10, "_canScrollY", *(_QWORD *)&v60);
    v49 = 0.0;
    if (v50)
    {
      accuracy = self->_accuracy;
      v52 = self->_firstPageOffset.vertical - v20;
      if (accuracy == 1.0)
      {
        v54 = round(v52);
      }
      else
      {
        v53 = floor(v52);
        v54 = v53 + round(accuracy * (v52 - v53)) / accuracy;
      }
      v55 = v7 >= v54 || y <= v54;
      if (!v55 || ((v54 = v65, v7 > v65) ? (v56 = y < v65) : (v56 = 0), v56))
        v48 = v48 + y - v54;
      objc_msgSend(v10, "_adjustedVerticalOffsetPinnedToScrollableBounds:", v48);
      v36 = 0;
      self->_parentAdjustment.y = v49 + self->_parentAdjustment.y;
    }
  }
  v14 = v61;
  if (v35 == 0.0 && v49 == 0.0)
  {
LABEL_67:
    if (!v36)
      goto LABEL_71;
    goto LABEL_68;
  }
  objc_msgSend(v10, "setContentOffset:", v13 + v35, v61 + v49, *(_QWORD *)&v60);
  -[UIView layer](self, "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeTranslation(&v66, self->_parentAdjustment.x, self->_parentAdjustment.y, 0.0);
  objc_msgSend(v57, "setSublayerTransform:", &v66);

  v58 = self->_parentAdjustment.x;
  if (v58 != 0.0 || (v58 = self->_parentAdjustment.y, v58 != 0.0))
  {
    -[UIScrollView _startDraggingParent:](self, "_startDraggingParent:", v10, v58);
    goto LABEL_67;
  }
  -[UIScrollView _stopDraggingParent:](self, "_stopDraggingParent:", v10);
  if (!v36)
    goto LABEL_71;
LABEL_68:
  v59 = self->_parentAdjustment.y;
  if (self->_parentAdjustment.x != 0.0 || v59 != 0.0)
  {
    objc_msgSend(v10, "setContentOffset:", v13 - self->_parentAdjustment.x, v14 - v59, *(_QWORD *)&v60);
    -[UIScrollView _stopDraggingParent:](self, "_stopDraggingParent:", v10);
  }
LABEL_71:

}

- (BOOL)_shouldAdjustLayoutToCollapseTopSpacing
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 16) & 1;
}

- (UIScrollView)initWithFrame:(CGRect)a3
{
  UIScrollView *v3;
  UIScrollView *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIScrollView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    _UIScrollViewSharedInit(v3);
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    *(_QWORD *)&v4->_scrollViewFlags |= 0x4CuLL;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 2 || v6 == 8)
    {
      v8 = 393216;
    }
    else
    {
      v8 = 17170432;
      if (v6 == 4)
        v8 = 393216;
    }
    if (v6 == 2 || v6 == 8)
      v10 = 0;
    else
      v10 = (unint64_t)(v6 != 4) << 25;
    *(_QWORD *)&v4->_scrollViewFlags = v8 | *(_QWORD *)&v4->_scrollViewFlags & 0xFFFFFFFFF0F9FFFFLL | v10;
    if (!objc_msgSend((id)objc_opt_class(), "_defaultEdgesScrollingContentIntoSafeArea"))
      v4->_contentInsetAdjustmentBehavior = 101;
    v4->_contentOffsetAnimationDuration = 0.3;
    -[UIView setMultipleTouchEnabled:](v4, "setMultipleTouchEnabled:", 1);
    v4->_minimumZoomScale = 1.0;
    v4->_maximumZoomScale = 1.0;
    v4->_decelerationFactor = (CGSize)vdupq_n_s64(0x3FEFEF9DB22D0E56uLL);
    v4->_fastScrollMultiplier = 1.0;
    -[UIView bounds](v4, "bounds");
    v12 = v11 * -0.000000184659091 + 0.000359090909;
    if (v11 > 1024.0)
      v12 = 0.00017;
    v4->_pagingSpringPull = v12;
    -[UIView bounds](v4, "bounds");
    v14 = v13 * 0.00000994318182 + 0.966818182;
    if (v13 > 1024.0)
      v14 = 0.977;
    v4->_pagingFriction = v14;
    -[UIView _currentScreenScale](v4, "_currentScreenScale");
    v4->_accuracy = v15;
    v4->_savedKeyboardAdjustmentDelta = 0.0;
    -[UIScrollView _createGestureRecognizersForCurrentTouchLevel](v4, "_createGestureRecognizersForCurrentTouchLevel");
  }
  return v4;
}

+ (unint64_t)_defaultEdgesScrollingContentIntoSafeArea
{
  if (_scrollViewConvertSafeAreaToContentInset_onceToken != -1)
    dispatch_once(&_scrollViewConvertSafeAreaToContentInset_onceToken, &__block_literal_global_1784);
  if (_scrollViewConvertSafeAreaToContentInset_convert)
    return 15;
  else
    return 0;
}

- (void)_setContentScrollsAlongXAxis:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  int v14;

  v3 = a3;
  -[UIScrollView _systemContentInset](self, "_systemContentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
  if (v3)
    v14 = 8;
  else
    v14 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFFE7 | v14;
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
}

- (void)_setContentScrollsAlongYAxis:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  int v14;

  v3 = a3;
  -[UIScrollView _systemContentInset](self, "_systemContentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
  if (v3)
    v14 = 32;
  else
    v14 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFF9F | v14;
  -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
}

- (void)setAlwaysBounceHorizontal:(BOOL)alwaysBounceHorizontal
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;

  if (((((*((_BYTE *)&self->_scrollViewFlags + 1) & 1) == 0) ^ alwaysBounceHorizontal) & 1) == 0)
  {
    v3 = alwaysBounceHorizontal;
    -[UIScrollView _systemContentInset](self, "_systemContentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
    v14 = 256;
    if (!v3)
      v14 = 0;
    *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFEFFLL | v14;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
    -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
  }
}

- (void)setAlwaysBounceVertical:(BOOL)alwaysBounceVertical
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;

  if (((((*((_BYTE *)&self->_scrollViewFlags + 1) & 2) == 0) ^ alwaysBounceVertical) & 1) == 0)
  {
    v3 = alwaysBounceVertical;
    -[UIScrollView _systemContentInset](self, "_systemContentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
    v14 = 512;
    if (!v3)
      v14 = 0;
    *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFDFFLL | v14;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
    -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
  }
}

- (void)_stopScrollingNotify:(BOOL)a3 pin:(BOOL)a4
{
  -[UIScrollView _stopScrollingNotify:pin:tramplingAnimationDependentFlags:](self, "_stopScrollingNotify:pin:tramplingAnimationDependentFlags:", a3, a4, 1);
}

- (BOOL)_beginTrackingWithEvent:(id)a3
{
  id v4;
  unint64_t v5;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  uint64_t scrollViewFlags;
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
  double accuracy;
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
  double v33;
  id WeakRetained;
  double v35;
  double fastScrollMultiplier;
  double v37;
  double v38;
  double discreteFastScrollEndTime;
  int v40;
  double v41;
  double v43;
  double v44;
  _UIScrollViewAsyncScrollDecelerationState *asyncScrollDecelerationState;
  double v46;
  unint64_t v47;
  NSObject *v48;
  unint64_t v49;
  NSObject *v50;
  double v51;
  _BYTE v52[24];
  CGFloat width;
  __int128 v54;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "_scrollDeviceCategory");
  else
    v5 = 0;
  self->_currentScrollDeviceCategory = v5;
  p_scrollViewFlags = &self->_scrollViewFlags;
  scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x100000) != 0 || (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x10) != 0)
  {
    LOBYTE(WeakRetained) = 0;
LABEL_17:
    *(_QWORD *)p_scrollViewFlags = scrollViewFlags & 0xFFFFFFFFFF7FFFFFLL;
    goto LABEL_18;
  }
  +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAnimationsForTarget:ofKind:", self, objc_opt_class());

  -[UIScrollView _trackingDidBegin](self, "_trackingDidBegin");
  *(_QWORD *)p_scrollViewFlags &= 0xFFFFFFFFBFFFFFCDLL;
  self->_previousVerticalVelocity = 0.0;
  self->_previousHorizontalVelocity = 0.0;
  if (self->_horizontalVelocity == 0.0 && self->_verticalVelocity == 0.0)
    *(_QWORD *)p_scrollViewFlags &= ~0x800000uLL;
  -[UIView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  -[UIScrollView contentOffset](self, "contentOffset");
  v14 = v13;
  v16 = v15;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  v22 = self->_firstPageOffset.horizontal - v21;
  if (accuracy == 1.0)
  {
    v43 = round(v22);
    if (v14 >= v43)
    {
      v27 = round(self->_firstPageOffset.vertical - v17);
      if (v16 >= v27)
      {
        v44 = round(v19 + self->_contentSize.width) - v10;
        if (v43 < v44)
          v43 = v44;
        if (v14 <= v43)
        {
          v33 = round(v18 + self->_contentSize.height);
          goto LABEL_51;
        }
      }
    }
LABEL_33:
    LODWORD(WeakRetained) = 1;
    goto LABEL_34;
  }
  v23 = floor(v22);
  v24 = v23 + round(accuracy * (v22 - v23)) / accuracy;
  if (v14 < v24)
    goto LABEL_33;
  v25 = self->_firstPageOffset.vertical - v17;
  v26 = floor(v25);
  v27 = v26 + round(accuracy * (v25 - v26)) / accuracy;
  if (v16 < v27)
    goto LABEL_33;
  v28 = v19 + self->_contentSize.width;
  v29 = floor(v28);
  v30 = v29 + round(accuracy * (v28 - v29)) / accuracy - v10;
  if (v24 < v30)
    v24 = v30;
  if (v14 > v24)
    goto LABEL_33;
  v31 = v18 + self->_contentSize.height;
  v32 = floor(v31);
  v33 = v32 + round(accuracy * (v31 - v32)) / accuracy;
LABEL_51:
  v51 = v33 - v12;
  if (v27 < v51)
    v27 = v51;
  LODWORD(WeakRetained) = v16 > v27;
LABEL_34:
  if (!self->_scrollHeartbeat)
    goto LABEL_18;
  if ((_DWORD)WeakRetained)
  {
    LOBYTE(WeakRetained) = 1;
    -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 0);
    scrollViewFlags = *(_QWORD *)p_scrollViewFlags;
    goto LABEL_17;
  }
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x8000000000000uLL;
  asyncScrollDecelerationState = self->_asyncScrollDecelerationState;
  self->_asyncScrollDecelerationState = 0;

  objc_msgSend(v4, "timestamp");
  self->_lastScrollInterruptionByPointerEventTime = v46;
  -[CADisplayLink setPaused:](self->_scrollHeartbeat, "setPaused:", 1);
  v47 = qword_1EDDB0C18;
  if (!qword_1EDDB0C18)
  {
    v47 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v47, (unint64_t *)&qword_1EDDB0C18);
  }
  v48 = *(id *)(v47 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v47 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v48))
  {
    *(_DWORD *)v52 = 134349824;
    *(_QWORD *)&v52[4] = self->_telemetryOffsetChangeCount;
    *(_WORD *)&v52[12] = 2050;
    *(double *)&v52[14] = self->_telemetryOffsetChangeHighRateDuration;
    *(_WORD *)&v52[22] = 2050;
    width = self->_telemetryOffsetChange.width;
    LOWORD(v54) = 2050;
    *(CGFloat *)((char *)&v54 + 2) = self->_telemetryOffsetChange.height;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  v49 = qword_1EDDB0C20;
  if (!qword_1EDDB0C20)
  {
    v49 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v49, (unint64_t *)&qword_1EDDB0C20);
  }
  v50 = *(id *)(v49 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v49 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v50))
  {
    *(_DWORD *)v52 = 134349824;
    *(_QWORD *)&v52[4] = self->_telemetryOffsetChangeCount;
    *(_WORD *)&v52[12] = 2050;
    *(double *)&v52[14] = self->_telemetryOffsetChangeHighRateDuration;
    *(_WORD *)&v52[22] = 2050;
    width = self->_telemetryOffsetChange.width;
    LOWORD(v54) = 2050;
    *(CGFloat *)((char *)&v54 + 2) = self->_telemetryOffsetChange.height;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
  kdebug_trace();
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_scrollViewDidInterruptDecelerating:", self);
  kdebug_trace();
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 3);
  _UIQOSManagedCommitsEnd(self, CFSTR("Deceleration"));
  -[UIScrollView _endActivityTrackingIfNeededForReason:](self, "_endActivityTrackingIfNeededForReason:", 0);

  LOBYTE(WeakRetained) = 0;
LABEL_18:
  -[UIScrollView _resetScrollingWithUIEvent:](self, "_resetScrollingWithUIEvent:", v4, *(_OWORD *)v52, *(_QWORD *)&v52[16], *(_QWORD *)&width, v54);
  if ((*((_BYTE *)&self->_scrollViewFlags + 2) & 0x80) != 0
    && (objc_msgSend(v4, "timestamp"), v35 <= self->_fastScrollEndTime + 1.0))
  {
    fastScrollMultiplier = self->_fastScrollMultiplier;
  }
  else
  {
    self->_fastScrollMultiplier = 1.0;
    self->_fastScrollCount = 0;
    fastScrollMultiplier = 1.0;
  }
  self->_fastScrollStartMultiplier = fastScrollMultiplier;
  if (self->_discreteFastScrollEndTime == 0.0)
    goto LABEL_26;
  objc_msgSend(v4, "timestamp");
  v38 = v37;
  discreteFastScrollEndTime = self->_discreteFastScrollEndTime;
  v40 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DiscreteFastScrollTimeout, (uint64_t)CFSTR("DiscreteFastScrollTimeout"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v41 = *(double *)&qword_1EDDA8450;
  if (v40)
    v41 = 1.5;
  if (v38 > discreteFastScrollEndTime + v41)
LABEL_26:
    -[UIScrollView _resetDiscreteFastScroll](self, "_resetDiscreteFastScroll");
  self->_discreteFastScrollStartMultiplier = self->_discreteFastScrollMultiplier;

  return (char)WeakRetained;
}

- (void)_trackingDidBegin
{
  *(_QWORD *)&self->_scrollViewFlags |= 1uLL;
}

- (void)_resetScrollingWithUIEvent:(id)a3
{
  double v4;
  double v5;

  -[UIScrollView contentOffset](self, "contentOffset", a3);
  self->_startOffsetX = v4;
  -[UIScrollView contentOffset](self, "contentOffset");
  self->_startOffsetY = v5;
}

- (void)_resetDiscreteFastScroll
{
  self->_discreteFastScrollCount = 0;
  self->_discreteFastScrollMultiplier = 1.0;
  self->_discreteFastScrollEndTime = 0.0;
}

- (void)setZoomEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  -[UIScrollView _updatePanGestureConfiguration](self, "_updatePanGestureConfiguration");
  v5 = 0x400000;
  if (v3)
    v5 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFBFFFFFLL | v5;
  -[UIScrollView _updateZoomGestureRecognizersEnabled](self, "_updateZoomGestureRecognizersEnabled");
}

- (void)_setAlwaysBounceVertical:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (CGPoint)_contentOffsetOrDeferredContentOffset
{
  double x;
  double y;
  CGPoint result;

  if (self->_deferredUpdateTargetIsValid)
  {
    x = self->_deferredUpdateTargetContentOffset.x;
    y = self->_deferredUpdateTargetContentOffset.y;
  }
  else
  {
    -[UIScrollView contentOffset](self, "contentOffset");
  }
  result.y = y;
  result.x = x;
  return result;
}

- (double)_allowedNavigationOverlapAmount
{
  return self->_allowedNavigationOverlapAmount;
}

- (UIEdgeInsets)_autoScrollTouchInsets
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

  -[UIScrollView _autoScrollAssistant](self, "_autoScrollAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchInsets");
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

- (void)_setAutoScrollTouchInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIScrollView _autoScrollAssistant](self, "_autoScrollAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTouchInsets:", top, left, bottom, right);

}

- (void)setContentInsetAdjustmentBehavior:(UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;

  if (self->_contentInsetAdjustmentBehavior != contentInsetAdjustmentBehavior)
  {
    -[UIScrollView _systemContentInset](self, "_systemContentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
    self->_contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
  }
}

- (void)setDelaysContentTouches:(BOOL)delaysContentTouches
{
  uint64_t v3;

  v3 = 0x40000;
  if (!delaysContentTouches)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
{
  *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x20000000u;
  -[UIScrollView _setShowsVerticalScrollIndicator:](self, showsVerticalScrollIndicator);
}

- (_UIAutoScrollAssistant)_autoScrollAssistant
{
  _UIAutoScrollAssistant *autoScrollAssistant;
  _UIAutoScrollAssistant *v4;
  _UIAutoScrollAssistant *v5;

  autoScrollAssistant = self->_autoScrollAssistant;
  if (!autoScrollAssistant)
  {
    v4 = -[_UIAutoScrollAssistant initWithScrollView:]([_UIAutoScrollAssistant alloc], "initWithScrollView:", self);
    v5 = self->_autoScrollAssistant;
    self->_autoScrollAssistant = v4;

    autoScrollAssistant = self->_autoScrollAssistant;
  }
  return autoScrollAssistant;
}

- (void)performWhileAnimatingAutomaticContentOffsetAdjustments:(id)a3
{
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  unint64_t v4;

  p_scrollViewFlags = &self->_scrollViewFlags;
  v4 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v4 | 0x40000;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFFBFFFFLL | (((v4 >> 18) & 1) << 18);
}

- (void)_setAdjustsTargetsOnContentOffsetChanges:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)_adjustsTargetsOnContentOffsetChanges
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 45) & 1;
}

- (void)_setShowsVerticalScrollIndicator:(_QWORD *)a1
{
  uint64_t v2;

  if (a1 && ((((a1[221] & 0x2000000) == 0) ^ a2) & 1) == 0)
  {
    v2 = 0x2000000;
    if (!a2)
      v2 = 0;
    a1[221] = a1[221] & 0xFFFFFFFFFDFFFFFFLL | v2;
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](a1, 2, 0);
  }
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator
{
  *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x40000000u;
  -[UIScrollView _setShowsHorizontalScrollIndicator:](self, showsHorizontalScrollIndicator);
}

- (void)_setShowsHorizontalScrollIndicator:(_QWORD *)a1
{
  uint64_t v2;

  if (a1 && ((((a1[221] & 0x1000000) == 0) ^ a2) & 1) == 0)
  {
    v2 = 0x1000000;
    if (!a2)
      v2 = 0;
    a1[221] = a1[221] & 0xFFFFFFFFFEFFFFFFLL | v2;
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](a1, 1, 0);
  }
}

- (void)_setDefaultShowsVerticalScrollIndicator:(BOOL)a3
{
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x20000000) == 0)
    -[UIScrollView _setShowsVerticalScrollIndicator:](self, a3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    -[UIResponder touchesCancelled:withEvent:](&v4, sel_touchesCancelled_withEvent_, a3, a4);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    -[UIResponder touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIScrollView;
  -[UIView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_, a3);
  if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    -[UIScrollView _registerAsScrollToTopViewIfPossible](self, "_registerAsScrollToTopViewIfPossible");
  }
  else
  {
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_unregisterScrollToTopView:", self);

  }
}

- (void)_registerAsScrollToTopViewIfPossible
{
  id v3;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x1000) == 0)
  {
    if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    {
      -[UIView window](self, "window");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_registerScrollToTopView:", self);

    }
  }
}

- (BOOL)_pagingUp
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 8) & 1;
}

- (BOOL)_pagingRight
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 7) & 1;
}

- (BOOL)_pagingLeft
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 6) & 1;
}

- (BOOL)_pagingDown
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 9) & 1;
}

- (BOOL)_isBouncing
{
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
  double accuracy;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double width;
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
  double v37;
  double v38;
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
  double height;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
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
  double v68;
  double v69;
  double v70;
  double v71;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x10000000000) == 0)
    return 0;
  -[UIScrollView contentOffset](self, "contentOffset");
  v5 = v4;
  v7 = v6;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = v8;
  accuracy = self->_accuracy;
  v17 = self->_firstPageOffset.horizontal - v11;
  if (accuracy == 1.0)
  {
    if (v5 < round(v17))
      return 1;
    v32 = round(v8 + self->_contentSize.width);
    -[UIView bounds](self, "bounds");
    v34 = self->_accuracy;
    v35 = v15 + v12 + self->_contentSize.width;
    if (v34 == 1.0)
    {
      v37 = round(v35);
    }
    else
    {
      v36 = floor(v35);
      v37 = v36 + round(v34 * (v35 - v36)) / v34;
    }
    if (v33 < v37)
      v37 = v33;
    v43 = round(v32 - v37);
  }
  else
  {
    v18 = floor(v17);
    if (v5 < v18 + round(accuracy * (v17 - v18)) / accuracy)
      return 1;
    v19 = v8 + self->_contentSize.width;
    v20 = floor(v19);
    v21 = v20 + round(accuracy * (v19 - v20)) / accuracy;
    -[UIView bounds](self, "bounds");
    v23 = self->_accuracy;
    width = self->_contentSize.width;
    v25 = v15 + v12 + width;
    if (v23 == 1.0)
    {
      v38 = round(v25);
      if (v22 < v38)
        v38 = v22;
      v28 = floor(v21 - v38);
      v31 = round(v15 + width);
    }
    else
    {
      v26 = floor(v25);
      v27 = v26 + round(v23 * (v25 - v26)) / v23;
      if (v22 >= v27)
        v22 = v27;
      v28 = floor(v21 - v22);
      v29 = v15 + width;
      v30 = floor(v29);
      v31 = v30 + round(v23 * (v29 - v30)) / v23;
    }
    -[UIView bounds](self, "bounds");
    v34 = self->_accuracy;
    v40 = v15 + v12 + self->_contentSize.width;
    if (v34 == 1.0)
    {
      v42 = round(v40);
    }
    else
    {
      v41 = floor(v40);
      v42 = v41 + round(v34 * (v40 - v41)) / v34;
    }
    if (v39 < v42)
      v42 = v39;
    v43 = v28 + round(v34 * (v31 - v42 - v28)) / v34;
  }
  if (v5 > v43)
    return 1;
  v44 = self->_firstPageOffset.vertical - v10;
  if (v34 == 1.0)
  {
    if (v7 >= round(v44))
    {
      v59 = round(v14 + self->_contentSize.height);
      -[UIView bounds](self, "bounds");
      v61 = self->_accuracy;
      v62 = v14 + v10 + self->_contentSize.height;
      if (v61 == 1.0)
      {
        v64 = round(v62);
      }
      else
      {
        v63 = floor(v62);
        v64 = v63 + round(v61 * (v62 - v63)) / v61;
      }
      if (v60 < v64)
        v64 = v60;
      v71 = round(v59 - v64);
      return v7 > v71;
    }
    return 1;
  }
  v45 = floor(v44);
  if (v7 < v45 + round(v34 * (v44 - v45)) / v34)
    return 1;
  v46 = v14 + self->_contentSize.height;
  v47 = floor(v46);
  v48 = v47 + round(v34 * (v46 - v47)) / v34;
  -[UIView bounds](self, "bounds");
  v50 = self->_accuracy;
  height = self->_contentSize.height;
  v52 = v14 + v10 + height;
  if (v50 == 1.0)
  {
    v65 = round(v52);
    if (v49 < v65)
      v65 = v49;
    v55 = floor(v48 - v65);
    v58 = round(v14 + height);
  }
  else
  {
    v53 = floor(v52);
    v54 = v53 + round(v50 * (v52 - v53)) / v50;
    if (v49 < v54)
      v54 = v49;
    v55 = floor(v48 - v54);
    v56 = v14 + height;
    v57 = floor(v56);
    v58 = v57 + round(v50 * (v56 - v57)) / v50;
  }
  -[UIView bounds](self, "bounds");
  v67 = self->_accuracy;
  v68 = v14 + v10 + self->_contentSize.height;
  if (v67 == 1.0)
  {
    v70 = round(v68);
  }
  else
  {
    v69 = floor(v68);
    v70 = v69 + round(v67 * (v68 - v69)) / v67;
  }
  if (v66 < v70)
    v70 = v66;
  v71 = v55 + round(v67 * (v58 - v70 - v55)) / v67;
  return v7 > v71;
}

- (void)_setAllowedTouchTypesForScrolling:(id)a3
{
  NSArray *v4;
  NSArray *allowedTouchTypesForScrolling;
  uint64_t i;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  allowedTouchTypesForScrolling = self->__allowedTouchTypesForScrolling;
  self->__allowedTouchTypesForScrolling = v4;

  -[UIScrollViewPanGestureRecognizer setAllowedTouchTypes:](self->_pan, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
  -[UIGestureRecognizer setAllowedTouchTypes:](self->_touchDelayGestureRecognizer, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
  objc_msgSend(self->_swipe, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
  if (self->_lowFidelitySwipeGestureRecognizers[0])
  {
    for (i = 0; i != 4; ++i)
      -[UIGestureRecognizer setAllowedTouchTypes:](self->_lowFidelitySwipeGestureRecognizers[i], "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
  }
}

- (BOOL)_canScrubWithTouch:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  char v7;
  UIGestureRecognizerState v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v5 = -[UIScrollView _scrubbingForPoint:touch:](self, "_scrubbingForPoint:touch:", v4);
  v6 = v5 != 0;
  v7 = objc_msgSend(v4, "_isPointerTouch");

  if ((v7 & 1) == 0)
  {
    v8 = -[UIGestureRecognizer state](self->_knobLongPressGestureRecognizer, "state");
    if (v5)
      v9 = v8 <= UIGestureRecognizerStatePossible;
    else
      v9 = 1;
    return !v9;
  }
  return v6;
}

- (int64_t)_scrubbingForPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  CGFloat y;
  CGFloat x;
  double knobLastFadeTime;
  double v9;
  _BOOL4 v10;
  double v11;
  _UIScrollViewScrollIndicator *verticalScrollIndicator;
  _BOOL4 v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  _UIScrollViewScrollIndicator *horizontalScrollIndicator;
  BOOL v21;
  int64_t v22;
  int64_t result;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  knobLastFadeTime = self->_knobLastFadeTime;
  v10 = v9 - knobLastFadeTime < 0.4 && knobLastFadeTime > 0.0;
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self))
  {
    if (!v10)
    {
      -[UIView alpha](self->_verticalScrollIndicator, "alpha");
      if (v11 <= 0.0)
      {
        if (!-[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
          return 0;
        v13 = 0;
        goto LABEL_16;
      }
    }
    verticalScrollIndicator = self->_verticalScrollIndicator;
    if (a4 == 3)
    {
      v13 = -[_UIScrollViewScrollIndicator hasPointer](verticalScrollIndicator, "hasPointer");
    }
    else
    {
      -[UIView frame](verticalScrollIndicator, "frame");
      UIDistanceBetweenPointAndRect(x, y, v14, v15, v16, v17);
      v13 = v18 < 20.0;
    }
  }
  else
  {
    v13 = 0;
  }
  if (!-[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
    goto LABEL_20;
  if (!v10)
  {
LABEL_16:
    -[UIView alpha](self->_horizontalScrollIndicator, "alpha");
    if (v19 > 0.0)
      goto LABEL_17;
LABEL_20:
    if (a4 == 3)
      v22 = 3;
    else
      v22 = 1;
    if (v13)
      return v22;
    return 0;
  }
LABEL_17:
  horizontalScrollIndicator = self->_horizontalScrollIndicator;
  if (a4 == 3)
  {
    v21 = -[_UIScrollViewScrollIndicator hasPointer](horizontalScrollIndicator, "hasPointer");
    v22 = 3;
    if (v21)
    {
      result = 4;
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  -[UIView frame](horizontalScrollIndicator, "frame");
  UIDistanceBetweenPointAndRect(x, y, v24, v25, v26, v27);
  v22 = 1;
  if (v28 >= 20.0)
  {
LABEL_29:
    if (v13)
      return v22;
    return 0;
  }
  result = 2;
LABEL_27:
  if (v13)
    return v22;
  return result;
}

- (BOOL)showsVerticalScrollIndicator
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 3) >> 1) & 1;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return *((_BYTE *)&self->_scrollViewFlags + 3) & 1;
}

- (int64_t)_scrubbingForPoint:(CGPoint)a3 touch:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = objc_msgSend(v7, "type");
  v9 = objc_msgSend(v7, "_isPointerTouch");

  if (v9)
    v10 = 3;
  else
    v10 = v8;
  return -[UIScrollView _scrubbingForPoint:touchType:](self, "_scrubbingForPoint:touchType:", v10, x, y);
}

- (id)_parentScrollView
{
  id v2;
  void *v3;

  v2 = -[UIView superview](self, "superview");
  if (v2)
  {
    v3 = v2;
    while (!objc_msgSend(v3, "__isKindOfUIScrollView"))
    {
      v2 = (id)objc_msgSend(v3, "superview");
      v3 = v2;
      if (!v2)
        return v2;
    }
    v2 = v3;
  }
  return v2;
}

- (BOOL)__isKindOfUIScrollView
{
  return 1;
}

- (BOOL)_forwardsToParentScroller
{
  return 0;
}

- (BOOL)_transfersScrollToContainer
{
  return (*((_BYTE *)&self->_scrollViewFlags + 2) & 1) == 0;
}

- (unint64_t)_currentlyAbuttedContentEdges
{
  -[UIView bounds](self, "bounds");
  return -[UIScrollView _abuttedEdgesForContentOffset:](self, "_abuttedEdgesForContentOffset:");
}

- (unint64_t)_abuttedEdgesForContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIScrollView _contentInsetIncludingDecorations](self, "_contentInsetIncludingDecorations");
  if (x + v7 >= floor(v13 + self->_contentSize.width))
    v14 = (2 * (x <= -v11)) | 8;
  else
    v14 = 2 * (x <= -v11);
  v15 = v14 | (y <= -v10);
  if (y + v9 >= floor(v12 + self->_contentSize.height))
    return v15 | 4;
  else
    return v15;
}

- (void)_setFirstPageOffset:(UIOffset)a3
{
  self->_firstPageOffset = a3;
}

- (void)_resetScrollableAncestor
{
  _UIScrollViewScrollableAncestor *scrollableAncestor;

  scrollableAncestor = self->_scrollableAncestor;
  self->_scrollableAncestor = 0;

  *(_QWORD *)&self->_scrollViewFlags &= ~0x4000uLL;
}

- (void)layoutSubviews
{
  objc_super v3;

  if (dyld_program_sdk_at_least())
    -[UIScrollView _applyConstrainedContentSizeIfNecessary](self, "_applyConstrainedContentSizeIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIScrollView _applyConstrainedContentSizeIfNecessary](self, "_applyConstrainedContentSizeIfNecessary");
  -[UIScrollView _centerContentIfNecessary](self, "_centerContentIfNecessary");
  -[UIScrollView _scrollViewDidLayoutSubviews](self, "_scrollViewDidLayoutSubviews");
}

- (void)_applyConstrainedContentSizeIfNecessary
{
  if (dyld_program_sdk_at_least()
    && (*(_QWORD *)&self->super._viewFlags & 0x800000000000000) != 0
    && (~*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x60000000000) == 0)
  {
    -[UIScrollView _nsis_contentSize](self, "_nsis_contentSize");
    -[UIScrollView setContentSize:](self, "setContentSize:");
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x40000000000uLL;
  }
}

- (void)_centerContentIfNecessaryAdjustingContentOffset:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double width;
  double v31;
  BOOL v32;
  double height;
  double v34;
  double v35;
  id v36;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x4000000) != 0)
  {
    v3 = a3;
    -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v36 = v5;
      objc_msgSend(v5, "frame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[UIView bounds](self, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[UIScrollView _contentInsetIncludingDecorations](self, "_contentInsetIncludingDecorations");
      v24 = v23 + v13 + v22;
      v27 = v26 + v25 + self->_contentSize.width;
      v28 = v23 + v22 + self->_contentSize.height;
      v29 = v26 + v11 + v25;
      if (v27 >= v19)
        width = self->_contentSize.width;
      else
        width = v19;
      if (v27 >= v19)
        v29 = v11;
      v31 = width * 0.5 - v29 * 0.5;
      v32 = v28 < v21;
      if (v28 >= v21)
        height = self->_contentSize.height;
      else
        height = v21;
      if (v32)
        v34 = v24;
      else
        v34 = v13;
      v35 = height * 0.5 - v34 * 0.5;
      if (v3)
      {
        if (-[UIScrollView isZooming](self, "isZooming"))
          -[UIScrollView setContentOffset:](self, "setContentOffset:", v15 + v31 - v7, v17 + v35 - v9);
      }
      objc_msgSend(v36, "setFrame:", v31, v35, v11, v13);
      v5 = v36;
    }

  }
}

- (void)_centerContentIfNecessary
{
  -[UIScrollView _centerContentIfNecessaryAdjustingContentOffset:](self, "_centerContentIfNecessaryAdjustingContentOffset:", 1);
}

- (_UIStaticScrollBar)_staticScrollBar
{
  return self->_staticScrollBar;
}

- (id)_indexBarEntries
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
  return 1;
}

- (BOOL)delaysContentTouches
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 2) & 1;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  char v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  unsigned int v15;
  _UIWeakHelper *v16;
  _UIWeakHelper *v17;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  unint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD block[4];
  id v38;
  UIScrollView *v39;

  v4 = delegate;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = dyld_program_sdk_at_least();
  v6 = v4;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v4, sel_allowsWeakReference);
    v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__UIScrollView_setDelegate___block_invoke;
      block[3] = &unk_1E16B1B50;
      v8 = v4;
      v38 = v8;
      v39 = self;
      if (setDelegate__once_3 != -1)
      {
        dispatch_once(&setDelegate__once_3, block);
        v8 = v38;
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  v9 = v6;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v11 = WeakRetained;
  if (v9 != WeakRetained || !v9 && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x2000000) != 0)
  {
    if (WeakRetained)
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
    objc_storeWeak(&self->_delegate, v9);
    v12 = v9;
    -[UIScrollView delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v15 = -[UIScrollView allowsWeakReference](self, sel_allowsWeakReference);

      v14 = (unint64_t)(v12 != 0) << 25;
      if (v12 && v15)
      {
        objc_initWeak(&location, self);
        v16 = [_UIWeakHelper alloc];
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __28__UIScrollView_setDelegate___block_invoke_137;
        v34[3] = &unk_1E16B3F40;
        objc_copyWeak(&v35, &location);
        v17 = -[_UIWeakHelper initWithDeallocationBlock:](v16, "initWithDeallocationBlock:", v34);
        objc_setAssociatedObject(v12, (char *)&self->super.super.super.isa + 1, v17, (void *)1);

        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
        v14 = 0x2000000;
      }
    }
    else
    {

      v14 = (unint64_t)(v12 != 0) << 25;
    }

    p_scrollViewFlags = &self->_scrollViewFlags;
    v19 = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFDFFFFFFLL | v14;
    *((_DWORD *)p_scrollViewFlags + 5) = *((_DWORD *)p_scrollViewFlags + 5);
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = v19;
    v20 = objc_opt_respondsToSelector();
    v21 = 0x100000;
    if ((v20 & 1) == 0)
      v21 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFEFFFFFLL | v21;
    v22 = objc_opt_respondsToSelector();
    v23 = 0x200000;
    if ((v22 & 1) == 0)
      v23 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFDFFFFFLL | v23;
    v24 = objc_opt_respondsToSelector();
    v25 = 0x400000;
    if ((v24 & 1) == 0)
      v25 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFBFFFFFLL | v25;
    v26 = objc_opt_respondsToSelector();
    v27 = 0x800000;
    if ((v26 & 1) == 0)
      v27 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFF7FFFFFLL | v27;
    v28 = objc_opt_respondsToSelector();
    v29 = 0x1000000;
    if ((v28 & 1) == 0)
      v29 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFEFFFFFFLL | v29;
    v30 = objc_opt_respondsToSelector();
    v31 = 0x10000000000000;
    if ((v30 & 1) == 0)
      v31 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFEFFFFFFFFFFFFFLL | v31;
    v32 = objc_opt_respondsToSelector();
    v33 = 0x20000000000000;
    if ((v32 & 1) == 0)
      v33 = 0;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFDFFFFFFFFFFFFFLL | v33;
  }

}

- (CGPoint)_maximumContentOffsetForContentSize:(CGSize)a3
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
  double v13;
  double v14;
  double accuracy;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;

  height = a3.height;
  width = a3.width;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
  v11 = v10;
  v13 = v12;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  v17 = width + v16;
  if (accuracy == 1.0)
  {
    v19 = round(v17);
    v22 = round(height + v14);
  }
  else
  {
    v18 = floor(v17);
    v19 = v18 + round(accuracy * (v17 - v18)) / accuracy;
    v20 = height + v14;
    v21 = floor(v20);
    v22 = v21 + round(accuracy * (v20 - v21)) / accuracy;
  }
  v23 = v19 - v7;
  if (v11 >= v23)
    v23 = v11;
  v24 = v22 - v9;
  if (v13 >= v24)
    v24 = v13;
  result.y = v24;
  result.x = v23;
  return result;
}

- (CGPoint)_minimumContentOffset
{
  double v3;
  double accuracy;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  v6 = self->_firstPageOffset.horizontal - v5;
  if (accuracy == 1.0)
  {
    v8 = round(v6);
    v11 = round(self->_firstPageOffset.vertical - v3);
  }
  else
  {
    v7 = floor(v6);
    v8 = v7 + round(accuracy * (v6 - v7)) / accuracy;
    v9 = self->_firstPageOffset.vertical - v3;
    v10 = floor(v9);
    v11 = v10 + round(accuracy * (v9 - v10)) / accuracy;
  }
  v12 = v8;
  result.y = v11;
  result.x = v12;
  return result;
}

- (UIEdgeInsets)_contentScrollInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentScrollInset.top;
  left = self->_contentScrollInset.left;
  bottom = self->_contentScrollInset.bottom;
  right = self->_contentScrollInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setIndicatorStyle:(UIScrollViewIndicatorStyle)indicatorStyle
{
  unint64_t scrollViewFlags;

  scrollViewFlags = (unint64_t)self->_scrollViewFlags;
  if (((scrollViewFlags >> 28) & 3) != indicatorStyle)
  {
    *(_QWORD *)&self->_scrollViewFlags = scrollViewFlags & 0xFFFFFFFFCFFFFFFFLL | ((unint64_t)(indicatorStyle & 3) << 28);
    -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 1);
  }
}

- (void)setScrollsToTop:(BOOL)scrollsToTop
{
  unint64_t v3;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if (((v3 >> 12) & 1) == scrollsToTop)
  {
    v5 = 4096;
    if (scrollsToTop)
      v5 = 0;
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFFFFFFFFFFEFFFLL | v5;
    if (scrollsToTop)
    {
      -[UIScrollView _registerAsScrollToTopViewIfPossible](self, "_registerAsScrollToTopViewIfPossible");
    }
    else
    {
      -[UIView window](self, "window");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_unregisterScrollToTopView:", self);

    }
  }
}

- (CGFloat)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (void)setHorizontalScrollDecelerationFactor:(double)a3
{
  self->_decelerationFactor.width = a3;
}

- (id)nsli_contentHeightVariable
{
  NSISVariable *contentHeightVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  contentHeightVariable = self->_contentHeightVariable;
  if (!contentHeightVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 1, 0);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentHeightVariable;
    self->_contentHeightVariable = v4;

    contentHeightVariable = self->_contentHeightVariable;
  }
  return contentHeightVariable;
}

- (void)_notifyDidScroll
{
  id WeakRetained;
  _QWORD v4[5];

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x100000) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "scrollViewDidScroll:", self);

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__UIScrollView__notifyDidScroll__block_invoke;
  v4[3] = &unk_1E16EAA10;
  v4[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
}

- (void)_adjustForAutomaticKeyboardInfo:(id)a3 animated:(BOOL)a4 lastAdjustment:(double *)a5
{
  _BOOL8 v6;
  id v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[7];

  v6 = a4;
  v8 = a3;
  if (-[UIScrollView _isFirstResponderKeyboardAvoidanceEnabled](self, "_isFirstResponderKeyboardAvoidanceEnabled"))
  {
    v9 = *a5;
    -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "verticalOverlapForView:usingKeyboardInfo:", self, v8);
    v12 = v11;

    if ((-[UIScrollView _edgesApplyingSafeAreaInsetsToContentInset](self, "_edgesApplyingSafeAreaInsetsToContentInset") & 4) != 0)
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v12 = fmax(v12 - v13, 0.0);
    }
    if (v9 != v12)
    {
      *a5 = v12;
      self->_savedKeyboardAdjustmentDelta = v12 - v9 + self->_savedKeyboardAdjustmentDelta;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72__UIScrollView__adjustForAutomaticKeyboardInfo_animated_lastAdjustment___block_invoke_2;
      v14[3] = &unk_1E16B4E70;
      v14[4] = self;
      *(double *)&v14[5] = v12;
      *(double *)&v14[6] = v12 - v9;
      +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v6, &__block_literal_global_554_0, v14, 0);
    }
  }

}

- (BOOL)_isFirstResponderKeyboardAvoidanceEnabled
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x1000000000000) == 0;
}

_QWORD *__103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD *result;
  double v54;
  double v55;
  CGAffineTransform v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "_animationStarted");
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216);
    +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "transform");
    v6 = *(double *)&v57;
    v5 = *(void **)(a1 + 40);
  }
  else
  {
    v58 = 0u;
    v59 = 0u;
    v57 = 0u;
    v6 = 0.0;
  }
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  v9 = v8;
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromView:", *(_QWORD *)(a1 + 40));
  v54 = v21;
  v55 = v20;
  v22 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v56, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  objc_msgSend(v22, "setTransform:", &v56);
  v23 = *(double *)(a1 + 64);
  v24 = v9 - v6 * v17 * 0.5 + v17 * v23 * 0.5;
  v25 = v11 - v6 * v19 * 0.5 + v19 * v23 * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPosition:", v24, v25);

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromView:", *(_QWORD *)(a1 + 40), v13, v15);
  v28 = v27 - v55;
  v30 = v29 - v54;
  if (v27 - v55 != 0.0 || v30 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "layer", *(_QWORD *)&v54, *(_QWORD *)&v55);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setPosition:", v24 - v28, v25 - v30);

  }
  objc_msgSend(*(id *)(a1 + 32), "_adjustContentSizeForView:atScale:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(_QWORD *)&v54, *(_QWORD *)&v55);
  objc_msgSend(*(id *)(a1 + 32), "_centerContentIfNecessaryAdjustingContentOffset:", 0);
  v32 = *(void **)(a1 + 32);
  objc_msgSend(v32, "_zoomAnchorPoint");
  objc_msgSend(v32, "convertPoint:fromView:", *(_QWORD *)(a1 + 40));
  v34 = v33;
  v36 = v35;
  objc_msgSend(*(id *)(a1 + 32), "window");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *(void **)(a1 + 32);
  objc_msgSend(v38, "window");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(v39, "_convertDoublePointFromSceneReferenceSpace:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    v41 = v40;
    v43 = v42;
    objc_msgSend(*(id *)(a1 + 32), "window");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "convertPoint:fromView:", v44, v41, v43);
    v46 = v45;
    v48 = v47;

  }
  else
  {
    objc_msgSend(v38, "convertPoint:fromView:", v39, *(double *)(a1 + 72), *(double *)(a1 + 80));
    v46 = v49;
    v48 = v50;
  }

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "_rubberBandContentOffsetForOffset:outsideX:outsideY:", 0, 0, v34 - (v46 - v51), v36 - (v48 - v52));
  objc_msgSend(*(id *)(a1 + 32), "setContentOffset:");
  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_adjustContentOffsetIfNecessary");
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1780) & 0x200000) != 0)
    result = (_QWORD *)objc_msgSend(*(id *)(a1 + 48), "scrollViewDidZoom:");
  if (*(_BYTE *)(a1 + 88))
  {
    result = *(_QWORD **)(a1 + 32);
    if (result[116])
      return (_QWORD *)objc_msgSend(result, "_adjustBackgroundShadowsForContentSizeForcedVisible:", 1);
  }
  return result;
}

- (CGPoint)_zoomAnchorPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    v6 = self->_zoomAnchorPoint.x * v5;
    v8 = v7 * self->_zoomAnchorPoint.y;
  }
  else
  {
    v6 = 0.0;
    v8 = 0.0;
  }

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_adjustContentSizeForView:(id)a3 atScale:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;

  objc_msgSend(a3, "frame");
  v7 = v6;
  v9 = v8;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x400000) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "scrollView:contentSizeForZoomScale:withProposedSize:", self, a4, v7, v9);
    v7 = v11;
    v9 = v12;

  }
  -[UIScrollView setContentSize:](self, "setContentSize:", v7, v9);
}

- (void)setZoomScale:(CGFloat)scale animated:(BOOL)animated
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  v4 = animated;
  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v29 = v7;
    -[UIScrollView _centerContentIfNecessary](self, "_centerContentIfNecessary");
    v8 = *(_QWORD *)&self->_scrollViewFlags & 0x40000040;
    if (v8 == 1073741888)
    {
      -[UIScrollView _zoomScaleForRubberBandScale:](self, "_zoomScaleForRubberBandScale:", scale);
      scale = v9;
    }
    -[UIScrollView _centeredZoomAnchorPointInScene](self, "_centeredZoomAnchorPointInScene");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v29, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "_convertDoublePointFromSceneReferenceSpace:", v11, v13);
      v18 = v17;
      v20 = v19;
      objc_msgSend(v29, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "convertPoint:fromView:", v21, v18, v20);
      v23 = v22;
      v25 = v24;

    }
    else
    {
      objc_msgSend(v29, "convertPoint:fromView:", v15, v11, v13);
      v23 = v26;
      v25 = v27;
    }

    if (v4)
      v28 = -1.0;
    else
      v28 = 0.0;
    -[UIScrollView _zoomToCenterInternal:scale:duration:allowRubberbanding:force:](self, "_zoomToCenterInternal:scale:duration:allowRubberbanding:force:", v8 == 1073741888, 0, v23, v25, scale, v28);
    v7 = v29;
  }

}

- (void)_zoomToCenterInternal:(CGPoint)a3 scale:(double)a4 duration:(double)a5 allowRubberbanding:(BOOL)a6 force:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double y;
  double x;
  void *v14;
  _BOOL8 v15;
  double v16;
  double v17;
  id v18;
  CGPoint zoomAnchorPoint;

  v7 = a7;
  v8 = a6;
  y = a3.y;
  x = a3.x;
  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v18 = v14;
    zoomAnchorPoint = self->_zoomAnchorPoint;
    -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:", x, y);
    v15 = a5 == -1.0 || a5 > 0.0;
    -[UIScrollView _centeredZoomAnchorPointInScene](self, "_centeredZoomAnchorPointInScene");
    -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:", v8, v15, 1, v7, a4, v16, v17, a5);
    if ((*((_BYTE *)&self->_scrollViewFlags + 3) & 0x40) != 0)
    {
      self->_zoomAnchorPoint = zoomAnchorPoint;
      -[UIPinchGestureRecognizer setScale:](self->_pinch, "setScale:", a4);
    }
    v14 = v18;
  }

}

- (CGPoint)_centeredZoomAnchorPointInScene
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  -[UIView bounds](self, "bounds");
  v5 = v4 + v3 * 0.5;
  v8 = v7 + v6 * 0.5;
  -[UIView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UIView window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UIView window](self, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "convertPoint:fromView:", self, v5, v8);
      objc_msgSend(v10, "_convertDoublePointToSceneReferenceSpace:");
      v5 = v13;
      v8 = v14;

LABEL_8:
      goto LABEL_9;
    }
    objc_msgSend(v10, "_convertDoublePointToSceneReferenceSpace:", v5, v8);
LABEL_7:
    v5 = v15;
    v8 = v16;
    goto LABEL_8;
  }
  -[UIView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[UIView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:fromView:", self, v5, v8);
    goto LABEL_7;
  }
LABEL_9:

  v17 = v5;
  v18 = v8;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)setZoomScale:(double)a3 withAnchorPoint:(CGPoint)a4 allowRubberbanding:(BOOL)a5 animated:(BOOL)a6 duration:(double)a7 notifyDelegate:(BOOL)a8 force:(BOOL)a9
{
  _BOOL4 v10;
  _BOOL8 v12;
  _BOOL8 v13;
  double y;
  double x;
  void *v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  NSObject *v23;
  double v24;
  id WeakRetained;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id zoomAnimation;
  double v32;
  double v33;
  _UIZoomEdgeFeedbackGenerator *zoomFeedbackGenerator;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  BOOL v42;
  _QWORD v43[5];
  id v44;
  id v45;
  __int128 *p_buf;
  double v47;
  double v48;
  double v49;
  BOOL v50;
  _QWORD v51[7];
  const __CFString *v52;
  void *v53;
  __int128 buf;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v10 = a8;
  v12 = a6;
  v13 = a5;
  y = a4.y;
  x = a4.x;
  v59 = *MEMORY[0x1E0C80C00];
  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView _clampedZoomScale:allowRubberbanding:](self, "_clampedZoomScale:allowRubberbanding:", v13, a3);
  v20 = v19;
  v21 = fabs(v19);
  if (v21 < INFINITY || v21 > INFINITY)
  {
    if (v18)
    {
      if (!a9 && (-[UIScrollView zoomScale](self, "zoomScale"), v20 == v24))
      {
        v52 = CFSTR("UITextSelectionZoomScaleDidChange");
        v36 = (void *)MEMORY[0x1E0CB37E8];
        -[UIScrollView zoomScale](self, "zoomScale");
        objc_msgSend(v36, "numberWithInt:", v37 != v20);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("UITextSelectionWillZoom"), self, v39);
        -[UIScrollView _adjustContentSizeForView:atScale:](self, "_adjustContentSizeForView:atScale:", v18, v20);
        objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("UITextSelectionDidZoom"), self, v39);

      }
      else
      {
        if (self->_scrollHeartbeat)
          -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 1);
        WeakRetained = objc_loadWeakRetained(&self->_delegate);
        if (v12 && (*(_BYTE *)&self->_scrollViewFlags & 0x80) == 0)
        {
          -[UIScrollView _scrollViewWillBeginZooming](self, "_scrollViewWillBeginZooming");
          if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "scrollViewWillBeginZooming:withView:", self, v18);
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v55 = 0x3032000000;
        v56 = __Block_byref_object_copy__236;
        v57 = __Block_byref_object_dispose__236;
        v58 = 0;
        v26 = MEMORY[0x1E0C809B0];
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke;
        v51[3] = &unk_1E16EAB20;
        v51[4] = self;
        *(double *)&v51[5] = a7;
        *(double *)&v51[6] = v20;
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_3;
        v43[3] = &unk_1E16EAB48;
        v50 = v12;
        v43[4] = self;
        p_buf = &buf;
        v27 = v18;
        v44 = v27;
        v47 = v20;
        v48 = x;
        v49 = y;
        v28 = WeakRetained;
        v45 = v28;
        v41[0] = v26;
        v41[1] = 3221225472;
        v41[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_4;
        v41[3] = &unk_1E16B7F38;
        v42 = v12;
        v41[4] = self;
        +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v12, v51, v43, v41);
        if (v12)
        {
          -[UIScrollView _markScrollViewAnimationForKey:ofView:](self, "_markScrollViewAnimationForKey:ofView:", CFSTR("transform"), v27);
          -[UIScrollView _markScrollViewAnimationForKey:ofView:](self, "_markScrollViewAnimationForKey:ofView:", CFSTR("position"), v27);
          -[UIScrollView _markScrollViewAnimationForKey:ofView:](self, "_markScrollViewAnimationForKey:ofView:", CFSTR("bounds"), self);
          -[UIScrollView _markScrollViewAnimationForKey:ofView:](self, "_markScrollViewAnimationForKey:ofView:", CFSTR("bounds.origin"), self);
          -[UIScrollView _markScrollViewAnimationForKey:ofView:](self, "_markScrollViewAnimationForKey:ofView:", CFSTR("bounds.size"), self);
          objc_msgSend(v27, "layer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "animationForKey:", CFSTR("transform"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          zoomAnimation = self->_zoomAnimation;
          self->_zoomAnimation = v30;

          if (self->_zoomAnimation)
            objc_storeStrong((id *)&self->_zoomAnimationState, *(id *)(*((_QWORD *)&buf + 1) + 40));
        }
        if (-[UIGestureRecognizer state](self->_pan, "state") >= UIGestureRecognizerStateBegan)
        {
          -[UIScrollView contentOffset](self, "contentOffset");
          self->_startOffsetX = v32;
          -[UIScrollView contentOffset](self, "contentOffset");
          self->_startOffsetY = v33;
          -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, 0.0, 0.0);
        }
        if ((*((_BYTE *)&self->_scrollViewFlags + 3) & 0x40) != 0)
        {
          zoomFeedbackGenerator = self->_zoomFeedbackGenerator;
          -[UIPinchGestureRecognizer velocity](self->_pinch, "velocity");
          -[_UIZoomEdgeFeedbackGenerator _zoomScaleUpdated:withVelocity:atLocation:](zoomFeedbackGenerator, "_zoomScaleUpdated:withVelocity:atLocation:", v20, v35, x, y);
        }
        if (v13 && v12 && (v20 < self->_minimumZoomScale || v20 > self->_maximumZoomScale))
          *(_QWORD *)&self->_scrollViewFlags |= 0x80uLL;

        _Block_object_dispose(&buf, 8);
      }
    }
  }
  else
  {
    v22 = setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force____s_category;
    if (!setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force____s_category)
    {
      v22 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force____s_category);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "UIScrollView is ignoring an attempt to set zoomScale to a non-finite value: %g", (uint8_t *)&buf, 0xCu);
    }
  }

}

- (CGFloat)zoomScale
{
  CGFloat result;

  -[UIScrollView _zoomScaleFromPresentationLayer:](self, "_zoomScaleFromPresentationLayer:", 0);
  return result;
}

- (void)_setZoomAnchorPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  y = a3.y;
  x = a3.x;
  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    objc_msgSend(v6, "bounds");
    v9 = x / v8;
    if (v8 == 0.0)
      v9 = 0.0;
    self->_zoomAnchorPoint.x = v9;
    if (v7 == 0.0)
      self->_zoomAnchorPoint.y = 0.0;
    else
      self->_zoomAnchorPoint.y = y / v7;
    v6 = v10;
  }
  else
  {
    self->_zoomAnchorPoint.x = 0.0;
    self->_zoomAnchorPoint.y = 0.0;
  }

}

- (double)_clampedZoomScale:(double)a3 allowRubberbanding:(BOOL)a4
{
  _BOOL4 v4;
  double result;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = 136315138;
        v12 = "-[UIScrollView _clampedZoomScale:allowRubberbanding:]";
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "%s: Must be called with non-zero scale", (uint8_t *)&v11, 0xCu);
      }

    }
    else
    {
      v8 = qword_1EDDB0BF0;
      if (!qword_1EDDB0BF0)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&qword_1EDDB0BF0);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315138;
        v12 = "-[UIScrollView _clampedZoomScale:allowRubberbanding:]";
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%s: Must be called with non-zero scale", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  if (v4)
  {
    -[UIScrollView _zoomRubberBandScaleForScale:](self, "_zoomRubberBandScaleForScale:", a3);
  }
  else
  {
    result = self->_minimumZoomScale;
    if (result <= a3)
      result = a3;
    if (result > self->_maximumZoomScale)
      return self->_maximumZoomScale;
  }
  return result;
}

- (UILayoutGuide)contentLayoutGuide
{
  return (UILayoutGuide *)-[UIScrollView _layoutGuideOfType:createIfNecessary:](self, "_layoutGuideOfType:createIfNecessary:", 0, 1);
}

- (CGSize)_nsis_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  -[UIView nsli_engineToUserScalingCoefficients](self, "nsli_engineToUserScalingCoefficients");
  v4 = v3;
  v6 = v5;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v8 = v7;
  -[UIView _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView _contentWidthVariable](self, "_contentWidthVariable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForVariable:", v10);
  v12 = v11;
  -[UIScrollView _contentHeightVariable](self, "_contentHeightVariable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForVariable:", v13);
  v15 = v14;

  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v9, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((dyld_program_sdk_at_least() & 1) != 0
      || (v18 = 1.0, v17) && objc_msgSend(v17, "_forceLayoutEngineSolutionInRationalEdges"))
    {
      objc_msgSend(v16, "transform");
      v18 = v21;
    }

  }
  else
  {
    v18 = 1.0;
  }

  v19 = round(v8 * v4 * round(v12)) * v18 / v8;
  v20 = round(v8 * v6 * round(v15)) * v18 / v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGRect)_layoutGuide:(id)a3 adjustedLayoutFrameForFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[UIScrollView _contentLayoutGuideIfExists](self, "_contentLayoutGuideIfExists");
  v10 = objc_claimAutoreleasedReturnValue();
  if ((id)v10 == v9)
  {

  }
  else
  {
    v11 = (void *)v10;
    -[UIScrollView _contentMarginsGuideIfExists](self, "_contentMarginsGuideIfExists");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v9)
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      x = x + v13;
      y = y + v14;
    }
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_contentLayoutGuideIfExists
{
  return -[UIScrollView _layoutGuideOfType:createIfNecessary:](self, "_layoutGuideOfType:createIfNecessary:", 0, 0);
}

- (void)nsis_valueOfVariable:(id)a3 didChangeInEngine:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (!dyld_program_sdk_at_least())
    goto LABEL_4;
  -[UIScrollView _contentHeightVariable](self, "_contentHeightVariable");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v6)
  {

  }
  else
  {
    v9 = (void *)v8;
    -[UIScrollView _contentWidthVariable](self, "_contentWidthVariable");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v6)
    {
LABEL_4:
      v15.receiver = self;
      v15.super_class = (Class)UIScrollView;
      -[UIView nsis_valueOfVariable:didChangeInEngine:](&v15, sel_nsis_valueOfVariable_didChangeInEngine_, v6, v7);
      -[UIScrollView _frameLayoutGuideIfExists](self, "_frameLayoutGuideIfExists");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_invalidateLayoutFrame");

      goto LABEL_11;
    }
  }
  -[UIView _layoutEngine](self, "_layoutEngine");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v7)
  {
    v13 = -[UIScrollView _evaluateWantsConstrainedContentSize](self, "_evaluateWantsConstrainedContentSize");

    if (v13)
    {
      *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x40000000000uLL;
      -[UIScrollView _contentLayoutGuideIfExists](self, "_contentLayoutGuideIfExists");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_invalidateLayoutFrame");

      if ((*(_QWORD *)&self->super._viewFlags & 0x8000000000000000) == 0)
        -[UIScrollView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {

  }
LABEL_11:

}

- (id)_layoutGuideOfType:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  UIScrollView *v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UILayoutGuide *v24;
  void *contentLayoutGuide;
  void *v26;
  void *v27;
  void *v28;
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
  double v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  objc_class *v50;
  UIScrollView *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[2];
  id (*v61)(uint64_t, void *);
  void *v62;
  UIScrollView *v63;
  __CFString *v64;
  _BYTE v65[128];
  _QWORD v66[2];
  _QWORD v67[4];
  _BYTE v68[128];
  uint64_t v69;

  v4 = a4;
  v6 = self;
  v69 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 2)
  {
    v7 = 0;
    v10 = 0;
LABEL_5:
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v61 = __53__UIScrollView__layoutGuideOfType_createIfNecessary___block_invoke;
    v62 = &unk_1E16EAAF8;
    v63 = v6;
    v64 = v7;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    -[UIView layoutGuides](v6, "layoutGuides");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v8)
    {
      v50 = v10;
      v51 = v6;
      v12 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v12)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "identifier", v50, v51);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
          {
            v17 = v14;
            v8 = v17;
            if (!a3)
            {
              objc_msgSend(v17, "_systemConstraints");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "count");

              if (!v19)
              {
                v61((uint64_t)v60, v8);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "_setSystemConstraints:", v20);

              }
            }
            v21 = (void *)MEMORY[0x1E0D156E0];
            objc_msgSend(v8, "_systemConstraints");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "activateConstraints:", v22);

            goto LABEL_18;
          }
        }
        v8 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v8)
          continue;
        break;
      }
LABEL_18:
      v10 = v50;
      v6 = v51;
    }

    if (v8 || !v4)
      goto LABEL_35;
    v8 = objc_alloc_init(v10);
    -[UIView addLayoutGuide:](v6, "addLayoutGuide:", v8);
    objc_msgSend(v8, "setIdentifier:", v7);
    objc_msgSend(v8, "_setLockedToOwningView:", 1);
    if (a3 == 2)
    {
      objc_msgSend(v8, "_setShouldBeArchived:", 0);
      objc_msgSend(v8, "widthAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView contentOffset](v6, "contentOffset");
      objc_msgSend(v41, "constraintEqualToConstant:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "heightAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView contentOffset](v6, "contentOffset");
      objc_msgSend(v42, "constraintEqualToConstant:", v43);
      contentLayoutGuide = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setIdentifier:", CFSTR("UIScrollView-contentOffsetLayoutGuide-xOffset"));
      objc_msgSend(contentLayoutGuide, "setIdentifier:", CFSTR("UIScrollView-contentOffsetLayoutGuide-yOffset"));
      v66[0] = v23;
      v66[1] = contentLayoutGuide;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v46; ++j)
          {
            if (*(_QWORD *)v53 != v47)
              objc_enumerationMutation(v44);
            objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "setShouldBeArchived:", 0);
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        }
        while (v46);
      }

      objc_msgSend(v8, "_setSystemConstraints:", v44);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v44);
      objc_storeStrong((id *)&v6->_contentOffsetLayoutGuide, v8);

    }
    else if (a3 == 1)
    {
      objc_msgSend(v8, "leftAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leftAnchor](v6, "leftAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v6, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      contentLayoutGuide = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "widthAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](v6, "widthAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView heightAnchor](v6, "heightAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("-minX"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIdentifier:", v36);

      -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("-minY"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(contentLayoutGuide, "setIdentifier:", v37);

      -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("-width"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setIdentifier:", v38);

      -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("-height"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setIdentifier:", v39);

      v67[0] = v23;
      v67[1] = contentLayoutGuide;
      v67[2] = v32;
      v67[3] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setSystemConstraints:", v40);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v40);
      objc_storeStrong((id *)&v6->_frameLayoutGuide, v8);

    }
    else
    {
      if (a3)
      {
LABEL_35:

        return v8;
      }
      v61((uint64_t)v60, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setSystemConstraints:", v23);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v23);
      v24 = (UILayoutGuide *)v8;
      contentLayoutGuide = v6->_contentLayoutGuide;
      v6->_contentLayoutGuide = v24;
    }

    goto LABEL_35;
  }
  v7 = off_1E16EACC0[a3];
  v8 = *(id *)((char *)&self->super.super.super.isa + *off_1E16EAC90[a3]);
  v9 = objc_opt_class();
  if (!v8)
  {
    v10 = (objc_class *)v9;
    goto LABEL_5;
  }
  return v8;
}

- (NSISVariable)_contentHeightVariable
{
  return self->_contentHeightVariable;
}

- (NSISVariable)_contentWidthVariable
{
  return self->_contentWidthVariable;
}

- (id)_frameLayoutGuideIfExists
{
  return -[UIScrollView _layoutGuideOfType:createIfNecessary:](self, "_layoutGuideOfType:createIfNecessary:", 1, 0);
}

- (double)_zoomScaleFromPresentationLayer:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v11;

  v3 = a3;
  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v9 = 1.0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v6;
  if (v3)
  {
    objc_msgSend(v6, "presentationLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v8)
  {
    v9 = 0.0;
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v8, "affineTransform");
  v9 = v11;
  if (v3)
LABEL_6:

LABEL_7:
LABEL_9:

  return v9;
}

- (UIOffset)_offsetForCenterOfPossibleZoomView:(id)a3 withIncomingBoundsSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIOffset result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = 0.0;
  if (v8 == v7)
  {
    if (v7)
    {
      objc_msgSend(v7, "transform");
      v11 = v15;
      v10 = 0.0;
      if (v15 == 1.0)
        goto LABEL_8;
    }
    else
    {
      v11 = 0.0;
    }
    v12 = v11 + -1.0;
    v10 = width * 0.5 * v12;
    v9 = height * 0.5 * v12;
  }
  else
  {
    v10 = 0.0;
  }
LABEL_8:

  v13 = v10;
  v14 = v9;
  result.vertical = v14;
  result.horizontal = v13;
  return result;
}

- (id)_getDelegateZoomView
{
  UIView *zoomView;
  UIScrollView *v3;
  id WeakRetained;

  zoomView = self->_zoomView;
  if (zoomView)
  {
    v3 = zoomView;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "viewForZoomingInScrollView:", self);
      v3 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
      if (v3 == self)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("The view returned from viewForZoomingInScrollView: must be a subview of the scroll view. It can not be the scroll view itself."));
        v3 = self;
      }
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (BOOL)_evaluateWantsConstrainedContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if ((*(_QWORD *)&self->super._viewFlags & 0x800000000000000) != 0
    && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20000000000) == 0)
  {
    -[UIScrollView _contentWidthVariable](self, "_contentWidthVariable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

      goto LABEL_6;
    }
    -[UIScrollView _contentHeightVariable](self, "_contentHeightVariable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
LABEL_6:
      -[UIView _layoutEngine](self, "_layoutEngine");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView nsli_contentWidthVariable](self, "nsli_contentWidthVariable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "hasValue:forVariable:", 0, v6))
      {

      }
      else
      {
        -[UIScrollView nsli_contentHeightVariable](self, "nsli_contentHeightVariable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v5, "hasValue:forVariable:", 0, v7);

        if (!v8)
        {
LABEL_10:

          return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 41) & 1;
        }
      }
      -[UIScrollView _setWantsConstrainedContentSize:](self, "_setWantsConstrainedContentSize:", 1);
      goto LABEL_10;
    }
  }
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 41) & 1;
}

- (id)nsli_contentWidthVariable
{
  NSISVariable *contentWidthVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  contentWidthVariable = self->_contentWidthVariable;
  if (!contentWidthVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 1, 0);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentWidthVariable;
    self->_contentWidthVariable = v4;

    contentWidthVariable = self->_contentWidthVariable;
  }
  return contentWidthVariable;
}

- (void)_setWantsConstrainedContentSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (void)_setSkipsContentOffsetAdjustmentsIfScrolling:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (UIEdgeInsets)_contentInsetForAccessories
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
  double v18;
  char v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIEdgeInsets result;

  -[UIScrollView _systemContentInsetIncludingAccessories:](self, "_systemContentInsetIncludingAccessories:", 0);
  v4 = v3 + self->_contentInset.top;
  v6 = v5 + self->_contentInset.left;
  v8 = v7 + self->_contentInset.bottom;
  v10 = v9 + self->_contentInset.right;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[UIScrollView _edgesApplyingSafeAreaInsetsToScrollAccessoryInsets](self, "_edgesApplyingSafeAreaInsetsToScrollAccessoryInsets");
  v20 = fmax(v4, v12);
  if ((v19 & 1) != 0)
    v21 = v20;
  else
    v21 = v4;
  v22 = fmax(v6, v14);
  if ((v19 & 2) != 0)
    v23 = v22;
  else
    v23 = v6;
  v24 = fmax(v8, v16);
  if ((v19 & 4) != 0)
    v25 = v24;
  else
    v25 = v8;
  v26 = fmax(v10, v18);
  if ((v19 & 8) != 0)
    v27 = v26;
  else
    v27 = v10;
  -[UIView layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "flipsHorizontalAxis");

  if (v29)
    v30 = v23;
  else
    v30 = v27;
  if (v29)
    v31 = v27;
  else
    v31 = v23;
  v32 = v21;
  v33 = v25;
  result.right = v30;
  result.bottom = v33;
  result.left = v31;
  result.top = v32;
  return result;
}

- (unint64_t)_edgesApplyingSafeAreaInsetsToScrollAccessoryInsets
{
  int64_t contentInsetAdjustmentBehavior;

  contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  if (contentInsetAdjustmentBehavior == 101 || contentInsetAdjustmentBehavior == 2)
    return 0;
  else
    return 15;
}

- (BOOL)isZoomEnabled
{
  return (*((_BYTE *)&self->_scrollViewFlags + 2) & 0x40) == 0;
}

- (id)_scrollDetentOffsets
{
  UIScrollView *v2;
  UIScrollView *v3;
  id *p_isa;
  id *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL4 v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  void *v27;
  _QWORD v29[2];
  CGRect v30;
  CGRect v31;

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  v3 = v2;
  if (v2)
  {
    p_isa = (id *)&v2->super.super.super.isa;
    while (1)
    {
      v5 = (id *)p_isa[12];
      if (v5)
        break;
      objc_msgSend(p_isa, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(p_isa, "frame");
      v31.origin.x = v15;
      v31.origin.y = v16;
      v31.size.width = v17;
      v31.size.height = v18;
      v30.origin.x = v8;
      v30.origin.y = v10;
      v30.size.width = v12;
      v30.size.height = v14;
      v19 = CGRectEqualToRect(v30, v31);

      if (!v19)
        goto LABEL_8;
      objc_msgSend(p_isa, "superview");
      v20 = (id *)objc_claimAutoreleasedReturnValue();

      p_isa = v20;
      if (!v20)
        goto LABEL_10;
    }
    v20 = v5;
  }
  else
  {
    p_isa = 0;
LABEL_8:
    v20 = 0;
  }
LABEL_10:
  objc_msgSend(v20, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_scrollDetentOffsetsForScrollView:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[UIScrollView _minimumContentOffset](v3, "_minimumContentOffset");
    objc_msgSend(v25, "numberWithDouble:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v24;
}

- (unint64_t)_contentScrollableAxes
{
  _BOOL4 v3;
  _BOOL4 v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[UIScrollView _contentScrollsAlongXAxis](self, "_contentScrollsAlongXAxis");
  v4 = -[UIScrollView _contentScrollsAlongYAxis](self, "_contentScrollsAlongYAxis");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = 3;
  if (!v4)
    v6 = 1;
  if (v3)
    return v6;
  else
    return v5;
}

- (UIScrollViewContentInsetAdjustmentBehavior)contentInsetAdjustmentBehavior
{
  UIScrollViewContentInsetAdjustmentBehavior result;

  result = self->_contentInsetAdjustmentBehavior;
  if (result == 101)
    return 2;
  if (result == 102)
    return 0;
  return result;
}

- (BOOL)_scrollToTopIfPossible:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double accuracy;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  id WeakRetained;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  v3 = a3;
  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  v6 = v5;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x1000) != 0)
    return 0;
  v8 = v7;
  if (!-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled")
    || (*((_BYTE *)&self->_scrollViewFlags + 2) & 0x10) != 0
    || (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x10) != 0)
  {
    return 0;
  }
  -[UIScrollView contentOffset](self, "contentOffset");
  accuracy = self->_accuracy;
  v11 = self->_firstPageOffset.vertical - v8;
  if (accuracy == 1.0)
  {
    v13 = round(v11);
  }
  else
  {
    v12 = floor(v11);
    v13 = v12 + round(accuracy * (v11 - v12)) / accuracy;
  }
  if (v9 == v13 - v6 || -[UIScrollView isTracking](self, "isTracking") || -[UIScrollView isZooming](self, "isZooming"))
    return 0;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained
    && (objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(WeakRetained, "scrollViewShouldScrollToTop:", self))
  {
    v14 = 0;
  }
  else
  {
    +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAnimationsForTarget:ofKind:", self, objc_opt_class());

    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x2000uLL;
    -[UIScrollView _contentOffsetForScrollingToTop](self, "_contentOffsetForScrollingToTop");
    v19 = v18;
    v21 = v20;
    _smoothDecelerationAnimation();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", v3, 3, 0, v22, v19, v21);

    if (!v3)
      *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x2000uLL;
    v14 = 1;
    -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 0, 1);
    -[UIScrollView _updateAccessories](self, "_updateAccessories");
  }

  return v14;
}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6 animation:(id)a7 animationConfigurator:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  _BOOL4 v11;
  double y;
  double x;
  id v15;
  void *v16;
  void *v17;
  id WeakRetained;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v9 = a6;
  v10 = *(_QWORD *)&a5;
  v11 = a4;
  y = a3.y;
  x = a3.x;
  v28 = a7;
  v15 = a8;
  if ((*((_BYTE *)&self->_scrollViewFlags + 2) & 8) == 0)
  {
    if (self->_scrollHeartbeat)
      -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 0);
    +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scrollManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelScrollingForScrollableContainer:", self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
    if (WeakRetained)
      -[UIScrollView _stopScrollingAndZoomingAnimationsPinningToContentViewport:tramplingAnimationDependentFlags:](self, "_stopScrollingAndZoomingAnimationsPinningToContentViewport:tramplingAnimationDependentFlags:", 0, 0);
    if (dyld_program_sdk_at_least())
    {
      -[UIScrollView _roundedProposedContentOffset:](self, "_roundedProposedContentOffset:", x, y);
      v20 = v19;
      v22 = v21;
    }
    else
    {
      v22 = y;
      v20 = x;
    }
    -[UIScrollView contentOffset](self, "contentOffset");
    if (v20 != v24 || v22 != v23)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v11)
      {
        -[UIView window](self, "window");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[UIScrollView _animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:](self, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:", v10, v9, v28, v15, x, y);
        }
        else
        {
          objc_msgSend(v26, "postNotificationName:object:", CFSTR("UITextSelectionWillScroll"), self);
          -[UIScrollView setContentOffset:](self, "setContentOffset:", x, y);
          -[UIScrollView _scrollViewAnimationEnded:finished:](self, "_scrollViewAnimationEnded:finished:", 0, 1);
        }
      }
      else
      {
        objc_msgSend(v25, "postNotificationName:object:", CFSTR("UITextSelectionWillScroll"), self);
        -[UIScrollView setContentOffset:](self, "setContentOffset:", x, y);
        objc_msgSend(v26, "postNotificationName:object:", CFSTR("UITextSelectionDidScroll"), self);
      }

    }
  }

}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6 animation:(id)a7
{
  -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:", a4, *(_QWORD *)&a5, a6, a7, 0, a3.x, a3.y);
}

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated
{
  -[UIScrollView _setContentOffset:animated:animationCurve:](self, "_setContentOffset:animated:animationCurve:", animated, 0, contentOffset.x, contentOffset.y);
}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5 animationAdjustsForContentOffsetDelta:(BOOL)a6
{
  -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", a4, *(_QWORD *)&a5, a6, 0, a3.x, a3.y);
}

- (void)_setContentOffset:(CGPoint)a3 animated:(BOOL)a4 animationCurve:(int)a5
{
  -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:", a4, *(_QWORD *)&a5, 1, a3.x, a3.y);
}

- (CGPoint)_contentOffsetForScrollingToTop
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double accuracy;
  double v12;
  double v13;
  double v14;
  double Width;
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
  CGPoint result;
  CGRect v30;

  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  v10 = v9;
  accuracy = self->_accuracy;
  v12 = v8 + self->_contentSize.width;
  if (accuracy == 1.0)
  {
    v14 = round(v12);
  }
  else
  {
    v13 = floor(v12);
    v14 = v13 + round(accuracy * (v12 - v13)) / accuracy;
  }
  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v30);
  v16 = self->_accuracy;
  v17 = self->_firstPageOffset.horizontal - v6;
  if (v16 == 1.0)
  {
    v19 = round(v17);
  }
  else
  {
    v18 = floor(v17);
    v19 = v18 + round(v16 * (v17 - v18)) / v16;
  }
  v20 = self->_contentSize.width;
  -[UIScrollView contentOffset](self, "contentOffset");
  v22 = self->_accuracy;
  v23 = self->_firstPageOffset.vertical - v4;
  if (v22 == 1.0)
  {
    v25 = round(v23);
  }
  else
  {
    v24 = floor(v23);
    v25 = v24 + round(v22 * (v23 - v24)) / v22;
  }
  if (Width <= v20)
    v26 = Width;
  else
    v26 = v20;
  v27 = v14 - v26;
  if (v19 >= v21)
    v21 = v19;
  if (v27 <= v21)
    v21 = v27;
  v28 = v25 - v10;
  result.y = v28;
  result.x = v21;
  return result;
}

- (UIEdgeInsets)_revealableContentPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIScrollView _revealableContentPaddingIncludingContentWithCollapsedAffinity:](self, "_revealableContentPaddingIncludingContentWithCollapsedAffinity:", 1);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_revealableContentPaddingIncludingContentWithCollapsedAffinity:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  BOOL v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  UIEdgeInsets result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = &unk_18685B0AF;
  v17 = 0u;
  v18 = 0u;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__UIScrollView__revealableContentPaddingIncludingContentWithCollapsedAffinity___block_invoke;
  v11[3] = &unk_1E16EAAA8;
  v12 = a3;
  v11[4] = self;
  v11[5] = &v13;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v11);
  v3 = v14[4];
  v4 = v14[5];
  v5 = v14[6];
  v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)_animateScrollToContentOffset:(CGPoint)a3 animationCurve:(int)a4 animationAdjustsForContentOffsetDelta:(BOOL)a5 animation:(id)a6 animationConfigurator:(id)a7
{
  uint64_t v10;
  double y;
  double x;
  void (**v14)(id, UIScrollViewScrollAnimation *);
  UIScrollViewScrollAnimation *v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double contentOffsetAnimationDuration;
  void *v23;
  void *v24;
  id v25;

  v10 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v25 = a6;
  v14 = (void (**)(id, UIScrollViewScrollAnimation *))a7;
  v15 = -[UIAnimation initWithTarget:]([UIScrollViewScrollAnimation alloc], "initWithTarget:", self);
  -[UIScrollView _originalOffsetForAnimatedSetContentOffset](self, "_originalOffsetForAnimatedSetContentOffset");
  v15->_originalOffset.x = v16;
  v15->_originalOffset.y = v17;
  v15->_targetOffset.x = x;
  v15->_targetOffset.y = y;
  -[UIScrollView _adjustedContentOffsetForContentOffset:](self, "_adjustedContentOffsetForContentOffset:", x, y);
  v19 = x == v18;
  if (y != v20)
    v19 = 0;
  v15->_targetOffsetValidAtStart = v19;
  v15->_accuracy = self->_accuracy;
  v15->_adjustsForContentOffsetDelta = a5;
  if (self->_scrollViewFlags.shouldRevealScrollIndicators)
  {
    -[UIScrollViewScrollAnimation setRevealsHorizontalScrollIndicator:](v15, "setRevealsHorizontalScrollIndicator:", v15->_originalOffset.x != v15->_targetOffset.x);
    -[UIScrollViewScrollAnimation setRevealsVerticalScrollIndicator:](v15, "setRevealsVerticalScrollIndicator:", v15->_originalOffset.y != v15->_targetOffset.y);
  }
  -[UIAnimation setDelegate:](v15, "setDelegate:", self);
  if (!v25)
  {
    contentOffsetAnimationDuration = self->_contentOffsetAnimationDuration;
    -[UIAnimation setAnimationCurve:](v15, "setAnimationCurve:", v10);
    if (!v14)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v25, "duration");
  contentOffsetAnimationDuration = v21;
  objc_storeStrong((id *)&v15->_customAnimation, a6);
  if (v14)
LABEL_7:
    v14[2](v14, v15);
LABEL_8:
  +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAnimation:withDuration:start:", v15, 1, contentOffsetAnimationDuration);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:", CFSTR("UITextSelectionWillScroll"), self);

  objc_storeWeak((id *)&self->_animation, v15);
}

- (void)_resetContentScrollableAxes
{
  *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x78u;
}

- (void)setMinimumZoomScale:(CGFloat)minimumZoomScale
{
  if (self->_minimumZoomScale != minimumZoomScale)
  {
    self->_minimumZoomScale = minimumZoomScale;
    -[UIScrollView _updatePinchGesture](self, "_updatePinchGesture");
  }
}

- (void)setMaximumZoomScale:(CGFloat)maximumZoomScale
{
  if (self->_maximumZoomScale != maximumZoomScale)
  {
    self->_maximumZoomScale = maximumZoomScale;
    -[UIScrollView _updatePinchGesture](self, "_updatePinchGesture");
  }
}

- (void)setDirectionalLockEnabled:(BOOL)directionalLockEnabled
{
  -[UIScrollViewPanGestureRecognizer setDirectionalLockEnabled:](self->_pan, "setDirectionalLockEnabled:", directionalLockEnabled);
}

- (void)setAutomaticallyAdjustsScrollIndicatorInsets:(BOOL)automaticallyAdjustsScrollIndicatorInsets
{
  uint64_t v3;

  if (automaticallyAdjustsScrollIndicatorInsets)
    v3 = 1;
  else
    v3 = 2;
  -[UIScrollView _setIndicatorInsetAdjustmentBehavior:](self, "_setIndicatorInsetAdjustmentBehavior:", v3);
}

- (void)setBouncesVertically:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFFBLL | v3;
  -[UIScrollView _didSetBounces](self, "_didSetBounces");
}

- (void)setBouncesHorizontally:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFF7 | v3;
  -[UIScrollView _didSetBounces](self, "_didSetBounces");
}

- (void)_clearContentOffsetAnimation:(id)a3
{
  UIScrollViewScrollAnimation **p_animation;
  id v5;
  id WeakRetained;
  id v7;
  _QWORD v8[5];

  p_animation = &self->_animation;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_animation);

  if (WeakRetained == v5)
    objc_storeWeak((id *)p_animation, 0);
  v7 = objc_loadWeakRetained((id *)p_animation);

  if (!v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__UIScrollView__clearContentOffsetAnimation___block_invoke;
    v8[3] = &unk_1E16EAA10;
    v8[4] = self;
    -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v8);
  }
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UIScrollView _adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:](self, "_adjustedContentOffsetForContentOffset:contentSize:skipsAdjustmentIfScrolling:", 0, a3.x, a3.y, self->_contentSize.width, self->_contentSize.height);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)dealloc
{
  void *v3;
  id *shadows;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  UIScrollViewPanGestureRecognizer *pan;
  UIScrollViewPinchGestureRecognizer *pinch;
  UIScrollViewDelayedTouchesBeganGestureRecognizer *touchDelayGestureRecognizer;
  UIScrollViewKnobLongPressGestureRecognizer *knobLongPressGestureRecognizer;
  UIScrollViewKnobLongPressGestureRecognizer *knobPointerLongPressGestureRecognizer;
  UIHoverGestureRecognizer *knobHoverGestureRecognizer;
  _UIDragAutoScrollGestureRecognizer *dragAutoScrollGestureRecognizer;
  _UIAutoScrollAssistant *autoScrollAssistant;
  UISwipeGestureRecognizer **lowFidelitySwipeGestureRecognizers;
  uint64_t j;
  UISwipeGestureRecognizer *v21;
  NSISVariable *contentWidthVariable;
  NSISVariable *contentHeightVariable;
  NSISVariable *contentXOffsetVariable;
  NSISVariable *contentYOffsetVariable;
  NSArray *automaticContentConstraints;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  -[UIScrollView setDelegate:](self, "setDelegate:", 0);
  -[UIScrollView _stopScrollingAndZoomingAnimationsPinningToContentViewport:](self, "_stopScrollingAndZoomingAnimationsPinningToContentViewport:", 0);
  -[UIScrollView setScrollTestParameters:](self, "setScrollTestParameters:", 0);
  shadows = self->_shadows;
  if (shadows)
    free(shadows);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIScrollViewSpringBoardBlankedScreenNotification"), 0);

  -[UIScrollViewPanGestureRecognizer setScrollView:](self->_pan, "setScrollView:", 0);
  -[UIScrollViewPinchGestureRecognizer setScrollView:](self->_pinch, "setScrollView:", 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIView gestureRecognizers](self, "gestureRecognizers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "removeTarget:action:", self, 0);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  pan = self->_pan;
  self->_pan = 0;

  pinch = self->_pinch;
  self->_pinch = 0;

  touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
  self->_touchDelayGestureRecognizer = 0;

  knobLongPressGestureRecognizer = self->_knobLongPressGestureRecognizer;
  self->_knobLongPressGestureRecognizer = 0;

  knobPointerLongPressGestureRecognizer = self->_knobPointerLongPressGestureRecognizer;
  self->_knobPointerLongPressGestureRecognizer = 0;

  knobHoverGestureRecognizer = self->_knobHoverGestureRecognizer;
  self->_knobHoverGestureRecognizer = 0;

  dragAutoScrollGestureRecognizer = self->_dragAutoScrollGestureRecognizer;
  self->_dragAutoScrollGestureRecognizer = 0;

  autoScrollAssistant = self->_autoScrollAssistant;
  self->_autoScrollAssistant = 0;

  lowFidelitySwipeGestureRecognizers = self->_lowFidelitySwipeGestureRecognizers;
  if (self->_lowFidelitySwipeGestureRecognizers[0])
  {
    for (j = 0; j != 4; ++j)
    {
      v21 = lowFidelitySwipeGestureRecognizers[j];
      if (v21)
      {
        lowFidelitySwipeGestureRecognizers[j] = 0;

      }
    }
  }
  -[NSISVariable setDelegate:](self->_contentWidthVariable, "setDelegate:", 0);
  contentWidthVariable = self->_contentWidthVariable;
  self->_contentWidthVariable = 0;

  -[NSISVariable setDelegate:](self->_contentHeightVariable, "setDelegate:", 0);
  contentHeightVariable = self->_contentHeightVariable;
  self->_contentHeightVariable = 0;

  -[NSISVariable setDelegate:](self->_contentXOffsetVariable, "setDelegate:", 0);
  contentXOffsetVariable = self->_contentXOffsetVariable;
  self->_contentXOffsetVariable = 0;

  -[NSISVariable setDelegate:](self->_contentYOffsetVariable, "setDelegate:", 0);
  contentYOffsetVariable = self->_contentYOffsetVariable;
  self->_contentYOffsetVariable = 0;

  automaticContentConstraints = self->_automaticContentConstraints;
  self->_automaticContentConstraints = 0;

  objc_autoreleasePoolPop(v3);
  v27.receiver = self;
  v27.super_class = (Class)UIScrollView;
  -[UIView dealloc](&v27, sel_dealloc);
}

- (void)_stopScrollingAndZoomingAnimationsPinningToContentViewport:(BOOL)a3
{
  -[UIScrollView _stopScrollingAndZoomingAnimationsPinningToContentViewport:tramplingAnimationDependentFlags:](self, "_stopScrollingAndZoomingAnimationsPinningToContentViewport:tramplingAnimationDependentFlags:", a3, 1);
}

- (void)setScrollTestParameters:(id)a3
{
  objc_storeStrong(&self->_scrollTestParameters, a3);
}

- (void)animator:(id)a3 stopAnimation:(id)a4 fraction:(float)a5
{
  unint64_t v6;
  NSObject *v7;

  -[UIScrollView _scrollViewAnimationEnded:finished:](self, "_scrollViewAnimationEnded:finished:", a4, a5 >= 1.0);
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 4);
  _UIQOSManagedCommitsEnd(self, CFSTR("Animation"));
  -[UIScrollView _endActivityTrackingIfNeededForReason:](self, "_endActivityTrackingIfNeededForReason:", 1);
  v6 = animator_stopAnimation_fraction____s_category;
  if (!animator_stopAnimation_fraction____s_category)
  {
    v6 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&animator_stopAnimation_fraction____s_category);
  }
  v7 = *(id *)(v6 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v6 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v7))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->__allowedTouchTypesForScrolling, 0);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->__scrollViewMonitor, 0);
  objc_storeStrong((id *)&self->_automaticContentConstraints, 0);
  objc_storeStrong((id *)&self->_contentYOffsetVariable, 0);
  objc_storeStrong((id *)&self->_contentXOffsetVariable, 0);
  objc_storeStrong((id *)&self->_contentHeightVariable, 0);
  objc_storeStrong((id *)&self->_contentWidthVariable, 0);
  objc_storeStrong((id *)&self->_temporaryCoordinatingReplacement, 0);
  objc_storeStrong(&self->_scrollTestParameters, 0);
  objc_storeStrong((id *)&self->_asyncScrollDecelerationState, 0);
  objc_storeStrong((id *)&self->_scrollingPointerRegion, 0);
  objc_storeStrong((id *)&self->_trackingWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_contentInsetAdjustments, 0);
  objc_destroyWeak((id *)&self->_focusSystemHoldingLock);
  objc_storeStrong((id *)&self->_keyboardScrollingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_keyboardScrollingAnimator, 0);
  objc_storeStrong((id *)&self->_vfd, 0);
  objc_storeStrong((id *)&self->_trackpadScrollInterruptionDelayedAction, 0);
  objc_storeStrong((id *)&self->_knobHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobPointerLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_horizontalScrollIndicator, 0);
  objc_storeStrong((id *)&self->_verticalScrollIndicator, 0);
  objc_storeStrong((id *)&self->_horizontalScrollIndicatorHideDelayTimer, 0);
  objc_storeStrong((id *)&self->_verticalScrollIndicatorHideDelayTimer, 0);
  objc_storeStrong((id *)&self->_contentOffsetLayoutGuide, 0);
  objc_storeStrong((id *)&self->_frameLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentMarginsGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_scrollableAncestor, 0);
  objc_storeStrong((id *)&self->_zoomFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_layoutObserver, 0);
  objc_destroyWeak((id *)&self->_relativePanView);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_destroyWeak((id *)&self->_draggingChildScrollView);
  objc_storeStrong((id *)&self->_autoScrollAssistant, 0);
  objc_storeStrong((id *)&self->_dragAutoScrollGestureRecognizer, 0);
  for (i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_lowFidelitySwipeGestureRecognizers[i], 0);
  objc_storeStrong((id *)&self->_directionalPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchDelayGestureRecognizer, 0);
  objc_storeStrong(&self->_swipe, 0);
  objc_storeStrong((id *)&self->_pan, 0);
  objc_storeStrong((id *)&self->_pinch, 0);
  objc_storeStrong((id *)&self->_zoomAnimationState, 0);
  objc_storeStrong(&self->_zoomAnimation, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_destroyWeak((id *)&self->_animation);
  objc_storeStrong((id *)&self->_scrollNotificationObservers, 0);
  for (j = 1; j != -1; --j)
    objc_storeStrong((id *)&self->_activityTrackingTokens[j], 0);
  objc_storeStrong((id *)&self->_interactionActivityTrackingBaseName, 0);
  objc_storeStrong((id *)&self->_scrollHeartbeat, 0);
  objc_storeStrong((id *)&self->_zoomView, 0);
  objc_storeStrong((id *)&self->_staticScrollBar, 0);
  objc_destroyWeak(&self->_delegate);
}

- (void)_willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x4000000) != 0)
  {
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView _registerForRotation:ofWindow:](self, "_registerForRotation:ofWindow:", 0, v5);

    -[UIScrollView _registerForRotation:ofWindow:](self, "_registerForRotation:ofWindow:", 1, v4);
  }
  if (!v4 && (*((_DWORD *)&self->_scrollViewFlags + 5) & 0x200) != 0)
  {
    -[UIView _removeBoundingPathChangeObserver:](self, "_removeBoundingPathChangeObserver:", self);
    *((_DWORD *)&self->_scrollViewFlags + 5) &= ~0x200u;
  }
  -[_UIScrollViewVFD reset]((unint64_t)self->_vfd);
  _UIQOSManagedCommitsEnd(self, 0);
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  -[UIView _willMoveToWindow:](&v6, sel__willMoveToWindow_, v4);

}

- (void)_endActivityTrackingIfNeededForReason:(int64_t)a3
{
  NSObject **activityTrackingTokens;
  void *v5;
  NSObject *v6;

  activityTrackingTokens = self->_activityTrackingTokens;
  if (self->_activityTrackingTokens[a3])
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endActivity:", activityTrackingTokens[a3]);

    v6 = activityTrackingTokens[a3];
    activityTrackingTokens[a3] = 0;

  }
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  _BYTE *v5;
  uint64_t v6;
  int v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int64_t touchLevel;
  _BYTE *v12;

  v5 = a3;
  v6 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  v12 = v5;
  if ((v6 & 3) == 0)
  {
    -[UIScrollView _hideScrollIndicators](self, "_hideScrollIndicators");
    v6 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  }
  v7 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if ((v6 & 0x2000) != 0)
  {
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v6 & 0xFFFFFFFFFFFFDFFFLL;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v7;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "scrollViewDidScrollToTop:", self);

  }
  else
  {
    if ((v6 & 0x4000) != 0)
    {
      *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v6 & 0xFFFFFFFFFFFFBFFFLL;
      *((_DWORD *)&self->_scrollViewFlags + 5) = v7;
      -[UIView traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "userInterfaceIdiom") == 3 && !-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
      {
        touchLevel = self->_touchLevel;

        if (touchLevel != 2 && -[UIScrollView _bounceForCarPlayIfNecessary](self, "_bounceForCarPlayIfNecessary"))
          goto LABEL_20;
      }
      else
      {

      }
      -[UIScrollView _scrollViewDidEndDeceleratingForDelegate](self, "_scrollViewDidEndDeceleratingForDelegate");
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v12[152])
    {
      if (!v12[153] && (*((_BYTE *)&self->_scrollViewFlags + 4) & 1) == 0)
        -[UIScrollView _endScrollingCursorOverrideIfNecessary](self, "_endScrollingCursorOverrideIfNecessary");
    }
    else if (!self->_scrollAnimatingViaAssertion)
    {
      -[UIScrollView _delegateScrollViewAnimationEnded](self, "_delegateScrollViewAnimationEnded");
    }
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("UITextSelectionDidScroll"), self);

}

- (void)_hideScrollIndicators
{
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  int v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  p_scrollViewFlags = &self->_scrollViewFlags;
  v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  *((_DWORD *)&self->_scrollViewFlags + 5) = v3 & 0xFFBFFFFF;
  if ((*(_QWORD *)&v3 & 0x300000) == 0)
  {
    -[UIScrollView _setKnobInteractionGestureDelayed:](self, "_setKnobInteractionGestureDelayed:", 0);
    *(_QWORD *)((char *)p_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFFFCLL;
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 3)
      v7 = 0;
    else
      v7 = 251658240;
    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__UIScrollView__hideScrollIndicators__block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__UIScrollView__hideScrollIndicators__block_invoke_2;
    v8[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v7, v9, v8, 0.5, 0.0);
  }
}

- (void)_delegateScrollViewAnimationEnded
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewDidEndScrollingAnimation:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIScrollViewAnimationEndedNotification"), self);

}

- (BOOL)_adjustsContentInsetWhenScrollDisabled
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 5) & 1;
}

- (id)_uili_existingObservationEligibleLayoutVariables
{
  uint64_t v3;
  void *v4;
  NSISVariable *contentWidthVariable;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  -[UIView _uili_existingObservationEligibleLayoutVariables](&v7, sel__uili_existingObservationEligibleLayoutVariables);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  contentWidthVariable = self->_contentWidthVariable;
  if (!contentWidthVariable && !self->_contentHeightVariable)
    return v4;
  if (v3)
  {
    if (!contentWidthVariable)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contentWidthVariable)
LABEL_5:
    objc_msgSend(v4, "addObject:");
LABEL_6:
  if (self->_contentHeightVariable)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (void)accessoryInsetsDidChange:(UIEdgeInsets)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_scrollViewAccessoryInsetsDidChange:", self);

}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)verticalScrollIndicatorInsets
{
  if (verticalScrollIndicatorInsets.left != self->_verticalScrollIndicatorInsets.left
    || verticalScrollIndicatorInsets.top != self->_verticalScrollIndicatorInsets.top
    || verticalScrollIndicatorInsets.right != self->_verticalScrollIndicatorInsets.right
    || verticalScrollIndicatorInsets.bottom != self->_verticalScrollIndicatorInsets.bottom)
  {
    self->_verticalScrollIndicatorInsets = verticalScrollIndicatorInsets;
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
  }
}

- (double)_horizontalVelocity
{
  return self->_horizontalVelocity;
}

uint64_t __72__UIScrollView__adjustForAutomaticKeyboardInfo_animated_lastAdjustment___block_invoke_2(uint64_t a1)
{
  if (dyld_program_sdk_at_least())
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256) = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_updateForChangedScrollRelatedInsets");
    return objc_msgSend(*(id *)(a1 + 32), "_updateForChangedScrollIndicatorRelatedInsets");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "contentInset");
    objc_msgSend(*(id *)(a1 + 32), "setContentInset:");
    objc_msgSend(*(id *)(a1 + 32), "scrollIndicatorInsets");
    return objc_msgSend(*(id *)(a1 + 32), "setScrollIndicatorInsets:");
  }
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  void *v11;
  char v12;
  id v13;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  if (contentInset.left != left
    || contentInset.top != top
    || contentInset.right != right
    || contentInset.bottom != bottom)
  {
    self->_contentInset = contentInset;
    -[UIScrollView _updateForChangedScrollRelatedInsets](self, "_updateForChangedScrollRelatedInsets");
    -[UIView _layoutEngine](self, "_layoutEngine");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
    {

      return;
    }
    if (v11)
    {
      v12 = objc_msgSend(v11, "_forceLayoutEngineSolutionInRationalEdges");

      if ((v12 & 1) != 0)
        return;
    }
    else
    {

    }
    -[UIScrollView _adjustCrossingConstraintsIfNecessaryForOldContentInset:](self, "_adjustCrossingConstraintsIfNecessaryForOldContentInset:", top, left, bottom, right);
  }
}

- (void)_notifyAdjustedContentInsetDidChange
{
  id WeakRetained;

  -[UIScrollView adjustedContentInsetDidChange](self, "adjustedContentInsetDidChange");
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x1000000) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "scrollViewDidChangeAdjustedContentInset:", self);

  }
}

- (void)_updateForChangedScrollRelatedInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double x;
  double accuracy;
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
  double v23;
  double y;
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
  double v37;

  -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
  -[UIScrollView _updateUsesStaticScrollBar](self, "_updateUsesStaticScrollBar");
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v5 = v4;
  v7 = v6;
  v8 = v3;
  x = self->_pageDecelerationTarget.x;
  accuracy = self->_accuracy;
  v12 = self->_firstPageOffset.horizontal - v11;
  if (accuracy == 1.0)
  {
    v14 = round(v12);
    if (x < v14)
      goto LABEL_11;
    v17 = round(v3 + self->_contentSize.width);
  }
  else
  {
    v13 = floor(v12);
    v14 = v13 + round(accuracy * (v12 - v13)) / accuracy;
    if (x < v14)
      goto LABEL_11;
    v15 = v3 + self->_contentSize.width;
    v16 = floor(v15);
    v17 = v16 + round(accuracy * (v15 - v16)) / accuracy;
  }
  -[UIView bounds](self, "bounds");
  if (x <= v17 - v18)
    goto LABEL_12;
  v19 = self->_accuracy;
  v20 = v8 + self->_contentSize.width;
  if (v19 == 1.0)
  {
    v22 = round(v20);
  }
  else
  {
    v21 = floor(v20);
    v22 = v21 + round(v19 * (v20 - v21)) / v19;
  }
  -[UIView bounds](self, "bounds");
  v14 = v22 - v23;
LABEL_11:
  self->_pageDecelerationTarget.x = v14;
LABEL_12:
  y = self->_pageDecelerationTarget.y;
  v25 = self->_accuracy;
  v26 = self->_firstPageOffset.vertical - v5;
  if (v25 != 1.0)
  {
    v27 = floor(v26);
    v28 = v27 + round(v25 * (v26 - v27)) / v25;
    if (y >= v28)
    {
      v29 = v7 + self->_contentSize.height;
      v30 = floor(v29);
      v31 = v30 + round(v25 * (v29 - v30)) / v25;
      goto LABEL_17;
    }
LABEL_22:
    self->_pageDecelerationTarget.y = v28;
    goto LABEL_23;
  }
  v28 = round(v26);
  if (y < v28)
    goto LABEL_22;
  v31 = round(v7 + self->_contentSize.height);
LABEL_17:
  -[UIView bounds](self, "bounds");
  if (y > v31 - v32)
  {
    v33 = self->_accuracy;
    v34 = v7 + self->_contentSize.height;
    if (v33 == 1.0)
    {
      v36 = round(v34);
    }
    else
    {
      v35 = floor(v34);
      v36 = v35 + round(v33 * (v34 - v35)) / v33;
    }
    -[UIView bounds](self, "bounds");
    v28 = v36 - v37;
    goto LABEL_22;
  }
LABEL_23:
  -[UIScrollView _notifyAdjustedContentInsetDidChange](self, "_notifyAdjustedContentInsetDidChange");
}

- (void)flashScrollIndicators
{
  -[UIScrollView _flashScrollIndicatorsForAxes:persistingPreviousFlashes:](self, "_flashScrollIndicatorsForAxes:persistingPreviousFlashes:", 3, 0);
}

- (void)_flashScrollIndicatorsForAxes:(unint64_t)a3 persistingPreviousFlashes:(BOOL)a4
{
  unsigned int v5;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  _QWORD v17[7];
  char v18;
  char v19;
  _QWORD v20[2];

  v5 = a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3 & -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self);
  v8 = -[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self) & (v5 >> 1);
  if (((v7 & 1) != 0 || v8) && (*((_BYTE *)&self->_scrollViewFlags + 2) & 0x10) == 0)
  {
    -[UIView superview](self, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      while (1)
      {
        v16 = v9;
        if (!objc_msgSend(v9, "_shouldEnclosedScrollViewFlashIndicators:", self))
          break;
        objc_msgSend(v16, "superview");
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
        if (!v10)
          goto LABEL_7;
      }

    }
    else
    {
LABEL_7:
      objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideScrollIndicators, 0);
      *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFFFCLL | (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) | v5) & 3;
      -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 1, 0);
      v11 = 1.0;
      v12 = 1.0;
      if (!a4)
      {
        -[UIView alpha](self->_horizontalScrollIndicator, "alpha");
        v12 = v13;
        -[UIView alpha](self->_verticalScrollIndicator, "alpha");
        v11 = v14;
        if (v7)
          -[UIView setAlpha:](self->_horizontalScrollIndicator, "setAlpha:", 0.0);
        if (v8)
          -[UIView setAlpha:](self->_verticalScrollIndicator, "setAlpha:", 0.0);
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__UIScrollView__flashScrollIndicatorsForAxes_persistingPreviousFlashes___block_invoke;
      v17[3] = &unk_1E16EA9C0;
      v18 = v7;
      v17[4] = self;
      v19 = v8;
      *(double *)&v17[5] = v12;
      *(double *)&v17[6] = v11;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, 0.5);
      v20[0] = *MEMORY[0x1E0C99860];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__hideScrollIndicators, 0, v15, 1.0);

      *((_DWORD *)&self->_scrollViewFlags + 5) |= 0x400000u;
    }
  }
}

- (CGPoint)_rubberBandContentOffsetForOffset:(CGPoint)a3 outsideX:(BOOL *)a4 outsideY:(BOOL *)a5
{
  CGFloat y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double accuracy;
  CGSize *p_contentSize;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t scrollViewFlags;
  double v43;
  double v44;
  double v45;
  int v46;
  uint64_t v47;
  double v48;
  double v49;
  double width;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
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
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double height;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = -[UIScrollView alwaysBounceHorizontal](self, "alwaysBounceHorizontal");
  v19 = -[UIScrollView alwaysBounceVertical](self, "alwaysBounceVertical");
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  accuracy = self->_accuracy;
  p_contentSize = &self->_contentSize;
  v30 = v26 + v22 + self->_contentSize.width;
  if (accuracy == 1.0)
  {
    v32 = round(v30);
    v34 = round(v15);
  }
  else
  {
    v31 = floor(v30);
    v32 = v31 + round(accuracy * (v30 - v31)) / accuracy;
    v33 = floor(v15);
    v34 = v33 + round((v15 - v33) * accuracy) / accuracy;
  }
  if (v32 <= v34)
  {
    v35 = (~*(_DWORD *)&self->_scrollViewFlags & 0x40000040) != 0 ? v11 : x;
    if (!v18 || (*(_QWORD *)&self->_scrollViewFlags & 8) == 0)
      x = v35;
  }
  v36 = v25 + v21 + self->_contentSize.height;
  if (accuracy == 1.0)
  {
    v38 = round(v36);
    v40 = round(v17);
  }
  else
  {
    v37 = floor(v36);
    v38 = v37 + round(accuracy * (v36 - v37)) / accuracy;
    v39 = floor(v17);
    v40 = v39 + round((v17 - v39) * accuracy) / accuracy;
  }
  v41 = y;
  if (v38 <= v40)
  {
    scrollViewFlags = (uint64_t)self->_scrollViewFlags;
    if ((!v19 || (scrollViewFlags & 4) == 0) && (~(_DWORD)scrollViewFlags & 0x40000040) != 0)
      v41 = v13;
  }
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v43 = 1.0;
  if (self->_currentScrollDeviceCategory == 6)
  {
    v44 = v21;
    v45 = v25;
    v46 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_GamePadRubberBandingLimitPercentage, (uint64_t)CFSTR("GamePadRubberBandingLimitPercentage"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v25 = v45;
    v21 = v44;
    if (v46)
      v43 = 0.5;
    else
      v43 = *(double *)&qword_1EDDA8440;
  }
  if ((*(_BYTE *)&self->_scrollViewFlags & 8) != 0)
  {
    v57 = v21;
    v58 = self->_accuracy;
    v59 = v27 + p_contentSize->width;
    v60 = v25;
    if (v58 == 1.0)
    {
      v62 = round(v59);
      v65 = round(self->_firstPageOffset.horizontal - v23);
      v67 = round(v15);
    }
    else
    {
      v61 = floor(v59);
      v62 = v61 + round(v58 * (v59 - v61)) / v58;
      v63 = self->_firstPageOffset.horizontal - v23;
      v64 = floor(v63);
      v65 = v64 + round(v58 * (v63 - v64)) / v58;
      v66 = floor(v15);
      v67 = v66 + round((v15 - v66) * v58) / v58;
    }
    -[UIScrollView _rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:](self, "_rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:", a4, x, v62 - v15, v65, v43 * v67);
    v53 = v68;
    v47 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
    if ((v47 & 0x3000000000) != 0)
    {
      v21 = v57;
      v25 = v60;
    }
    else
    {
      v69 = self->_accuracy;
      v21 = v57;
      v25 = v60;
      if (v69 == 1.0)
      {
        v53 = round(v53);
      }
      else
      {
        v70 = floor(v53);
        v53 = v70 + round((v53 - v70) * v69) / v69;
      }
    }
    goto LABEL_47;
  }
  v47 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  v48 = self->_accuracy;
  if ((v47 & 0x3000000000) == 0)
  {
    if (v48 == 1.0)
    {
      x = round(x);
      width = p_contentSize->width;
      goto LABEL_39;
    }
    v49 = floor(x);
    x = v49 + round((x - v49) * v48) / v48;
  }
  width = p_contentSize->width;
  if (v48 != 1.0)
  {
    v51 = self->_firstPageOffset.horizontal - v23;
    v52 = floor(v51);
    v53 = v52 + round(v48 * (v51 - v52)) / v48;
    v54 = v27 + width;
    v55 = floor(v54);
    v56 = v55 + round(v48 * (v54 - v55)) / v48;
    goto LABEL_40;
  }
LABEL_39:
  v53 = round(self->_firstPageOffset.horizontal - v23);
  v56 = round(v27 + width);
LABEL_40:
  if (x >= v53)
  {
    v71 = v56 - v15;
    if (x <= v71)
    {
      v53 = x;
    }
    else if (v71 > v53)
    {
      v53 = v71;
    }
  }
LABEL_47:
  if ((*(_BYTE *)&self->_scrollViewFlags & 4) == 0)
  {
    v72 = self->_accuracy;
    if ((v47 & 0x3000000000) == 0)
    {
      if (v72 == 1.0)
      {
        v41 = round(v41);
        height = self->_contentSize.height;
        goto LABEL_60;
      }
      v73 = floor(v41);
      v41 = v73 + round((v41 - v73) * v72) / v72;
    }
    height = self->_contentSize.height;
    if (v72 != 1.0)
    {
      v75 = self->_firstPageOffset.vertical - v21;
      v76 = floor(v75);
      v77 = v76 + round(v72 * (v75 - v76)) / v72;
      v78 = v25 + height;
      v79 = floor(v78);
      v80 = v79 + round(v72 * (v78 - v79)) / v72;
      goto LABEL_61;
    }
LABEL_60:
    v77 = round(self->_firstPageOffset.vertical - v21);
    v80 = round(v25 + height);
LABEL_61:
    if (v41 >= v77)
    {
      v93 = v80 - v17;
      if (v93 > v77)
        v77 = v93;
      if (v41 <= v93)
        v77 = v41;
    }
    goto LABEL_68;
  }
  v81 = self->_accuracy;
  v82 = v25 + self->_contentSize.height;
  if (v81 == 1.0)
  {
    v84 = round(v82);
    v87 = round(self->_firstPageOffset.vertical - v21);
    v89 = round(v17);
  }
  else
  {
    v83 = floor(v82);
    v84 = v83 + round(v81 * (v82 - v83)) / v81;
    v85 = self->_firstPageOffset.vertical - v21;
    v86 = floor(v85);
    v87 = v86 + round(v81 * (v85 - v86)) / v81;
    v88 = floor(v17);
    v89 = v88 + round((v17 - v88) * v81) / v81;
  }
  -[UIScrollView _rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:](self, "_rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:", a5, v41, v84 - v17, v87, v43 * v89);
  v77 = v90;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x3000000000) == 0)
  {
    v91 = self->_accuracy;
    if (v91 == 1.0)
    {
      v77 = round(v77);
    }
    else
    {
      v92 = floor(v77);
      v77 = v92 + round((v77 - v92) * v91) / v91;
    }
  }
LABEL_68:
  v94 = v53;
  result.y = v77;
  result.x = v94;
  return result;
}

- (double)_rubberBandOffsetForOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7
{
  void *v13;
  void *v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  -[UIScrollView _refreshControl](self, "_refreshControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a3 >= a5 || v13 == 0)
  {
    -[UIScrollView _rubberBandOffsetWithoutDecorationForOffset:maxOffset:minOffset:range:outside:](self, "_rubberBandOffsetWithoutDecorationForOffset:maxOffset:minOffset:range:outside:", a7, a3, a4, a5, a6);
    a3 = v16;
  }
  else if (objc_msgSend(v13, "_hostAdjustsContentOffset")
         && (objc_msgSend(v14, "_areInsetsBeingApplied") & 1) != 0
         || (objc_msgSend(v14, "_refreshControlHeight"), a5 - v17 >= a3))
  {
    if ((objc_msgSend(v14, "_areInsetsBeingApplied") & 1) == 0)
    {
      objc_msgSend(v14, "_refreshControlHeight");
      a3 = v18 + a3;
    }
    -[UIScrollView _rubberBandOffsetWithoutDecorationForOffset:maxOffset:minOffset:range:outside:](self, "_rubberBandOffsetWithoutDecorationForOffset:maxOffset:minOffset:range:outside:", a7, a3, a4, a5, a6);
    a3 = v19;
    if ((objc_msgSend(v14, "_areInsetsBeingApplied") & 1) == 0)
    {
      objc_msgSend(v14, "_refreshControlHeight");
      a3 = a3 - v20;
    }
  }

  return a3;
}

- (double)_rubberBandOffsetWithoutDecorationForOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7
{
  double result;

  -[UIScrollView _currentRubberBandCoefficient](self, "_currentRubberBandCoefficient");
  _UIScrollViewRubberBandOffsetWithoutDecorationForOffset(a7, a3, a4, a5, a6);
  return result;
}

- (double)_currentRubberBandCoefficient
{
  return _UIScrollViewRubberBandCoefficient(self->_currentScrollDeviceCategory);
}

- (double)_verticalVelocity
{
  return self->_verticalVelocity;
}

- (void)animator:(id)a3 startAnimation:(id)a4
{
  unint64_t v5;
  NSObject *v6;

  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
  _UIQOSManagedCommitsBegin(self, CFSTR("Animation"));
  -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 4);
  v5 = animator_startAnimation____s_category;
  if (!animator_startAnimation____s_category)
  {
    v5 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&animator_startAnimation____s_category);
  }
  v6 = *(id *)(v5 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v5 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v6))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  -[UIScrollView _beginActivityTrackingIfNeededForReason:](self, "_beginActivityTrackingIfNeededForReason:", 1);
}

- (void)_beginActivityTrackingIfNeededForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject **activityTrackingTokens;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;

  if (_UIViewControllerSupportsInteractionActivityTracking())
  {
    -[UIScrollView _effectiveInteractionActivityTrackingBaseName](self, "_effectiveInteractionActivityTrackingBaseName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E1A952D0, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v12;
    if (v12)
    {
      activityTrackingTokens = self->_activityTrackingTokens;
      if (!self->_activityTrackingTokens[a3])
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "beginActivityWithOptions:reason:", 0x200000000000, v12);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = activityTrackingTokens[a3];
        activityTrackingTokens[a3] = v10;

        v7 = v12;
      }
    }

  }
}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIScrollView interactionActivityTrackingBaseName](self, "interactionActivityTrackingBaseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIScrollView _enclosingViewController](self, "_enclosingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_effectiveInteractionActivityTrackingBaseName");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_enclosingViewController
{
  UIScrollView *v2;
  UIScrollView *v3;
  uint64_t v4;
  UIScrollView *v5;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    while (1)
    {
      +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
        break;
      -[UIView superview](v3, "superview");
      v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
      if (!v5)
        return v5;
    }
    v5 = (UIScrollView *)v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)interactionActivityTrackingBaseName
{
  return self->_interactionActivityTrackingBaseName;
}

- (void)setScrollIndicatorInsets:(UIEdgeInsets)scrollIndicatorInsets
{
  int64x2_t v6;

  if (scrollIndicatorInsets.left != self->_scrollIndicatorInset.left
    || scrollIndicatorInsets.top != self->_scrollIndicatorInset.top
    || scrollIndicatorInsets.right != self->_scrollIndicatorInset.right
    || scrollIndicatorInsets.bottom != self->_scrollIndicatorInset.bottom)
  {
    self->_scrollIndicatorInset = scrollIndicatorInsets;
    v6 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&self->_verticalScrollIndicatorInsets.top = v6;
    *(int64x2_t *)&self->_verticalScrollIndicatorInsets.bottom = v6;
    *(int64x2_t *)&self->_horizontalScrollIndicatorInsets.top = v6;
    *(int64x2_t *)&self->_horizontalScrollIndicatorInsets.bottom = v6;
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
  }
}

- (void)setKeyboardDismissMode:(UIScrollViewKeyboardDismissMode)keyboardDismissMode
{
  self->_keyboardDismissMode = keyboardDismissMode;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return &self->_pan->super;
}

- (void)_setTemporaryCoordinatingReplacement:(id)a3
{
  UIScrollView *v5;
  UIScrollView *v6;
  NSHashTable *scrollNotificationObservers;
  NSHashTable *v8;
  NSHashTable *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (UIScrollView *)a3;
  v6 = self->_temporaryCoordinatingReplacement;
  if (v6 != v5)
  {
    objc_storeStrong((id *)&self->_temporaryCoordinatingReplacement, a3);
    scrollNotificationObservers = self->_scrollNotificationObservers;
    if (scrollNotificationObservers)
    {
      v8 = scrollNotificationObservers;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (v6 && v6->_scrollNotificationObservers)
      -[NSHashTable unionHashTable:](v8, "unionHashTable:");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v9;
    v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "_observeScrollView:temporaryCoordinatingReplacementDidChange:", self, v5, (_QWORD)v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (UIScrollViewKeyboardDismissMode)keyboardDismissMode
{
  return self->_keyboardDismissMode;
}

- (void)_setContentOffsetPinned:(CGPoint)a3
{
  -[UIScrollView setContentOffset:](self, "setContentOffset:", a3.x, a3.y);
  -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)horizontalScrollIndicatorInsets
{
  if (horizontalScrollIndicatorInsets.left != self->_horizontalScrollIndicatorInsets.left
    || horizontalScrollIndicatorInsets.top != self->_horizontalScrollIndicatorInsets.top
    || horizontalScrollIndicatorInsets.right != self->_horizontalScrollIndicatorInsets.right
    || horizontalScrollIndicatorInsets.bottom != self->_horizontalScrollIndicatorInsets.bottom)
  {
    self->_horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets;
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
  }
}

- (void)_removeScrollViewScrollObserver:(id)a3
{
  NSHashTable *scrollNotificationObservers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  scrollNotificationObservers = self->_scrollNotificationObservers;
  if (scrollNotificationObservers)
  {
    v7 = a3;
    v5 = (NSHashTable *)-[NSHashTable copy](scrollNotificationObservers, "copy");
    v6 = self->_scrollNotificationObservers;
    self->_scrollNotificationObservers = v5;

    -[NSHashTable removeObject:](self->_scrollNotificationObservers, "removeObject:", v7);
  }
}

- (UIOffset)_firstPageOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_firstPageOffset.horizontal;
  vertical = self->_firstPageOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setTracksImmediatelyWhileDecelerating:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (void)_setIndicatorInsetAdjustmentBehavior:(int64_t)a3
{
  unint64_t v3;

  v3 = *((unsigned int *)&self->_scrollViewFlags + 5);
  if (((v3 >> 7) & 3) != a3)
  {
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v3 & 0xFFFFFE7F | ((a3 & 3) << 7);
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
  }
}

- (void)_setAvoidsJumpOnInterruptedBounce:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (void)setBouncesZoom:(BOOL)bouncesZoom
{
  uint64_t v3;

  v3 = 64;
  if (!bouncesZoom)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)setZoomScale:(CGFloat)zoomScale
{
  -[UIScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 0, zoomScale);
}

- (void)setAllowsKeyboardScrolling:(BOOL)allowsKeyboardScrolling
{
  int v3;

  if (allowsKeyboardScrolling)
    v3 = 2;
  else
    v3 = 1;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFFFC | v3;
  -[UIScrollView _allowsKeyboardScrollingDidUpdate](self, "_allowsKeyboardScrollingDidUpdate");
}

- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated
{
  _BOOL8 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double accuracy;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  uint64_t v46;
  double *WeakRetained;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v4 = animated;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v13 = v12;
  v15 = v14;
  v16 = v10;
  v17 = v11;
  accuracy = self->_accuracy;
  v19 = self->_firstPageOffset.horizontal - v14;
  if (accuracy == 1.0)
  {
    v21 = round(v19);
    v24 = round(self->_firstPageOffset.vertical - v13);
    v27 = round(v11 + v15 + self->_contentSize.width);
    v30 = round(v10 + v13 + self->_contentSize.height);
  }
  else
  {
    v20 = floor(v19);
    v21 = v20 + round(accuracy * (v19 - v20)) / accuracy;
    v22 = self->_firstPageOffset.vertical - v13;
    v23 = floor(v22);
    v24 = v23 + round(accuracy * (v22 - v23)) / accuracy;
    v25 = v11 + v15 + self->_contentSize.width;
    v26 = floor(v25);
    v27 = v26 + round(accuracy * (v25 - v26)) / accuracy;
    v28 = v16 + v13 + self->_contentSize.height;
    v29 = floor(v28);
    v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
  }
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v49 = CGRectIntersection(v48, *(CGRect *)&v21);
  v31 = v49.origin.x;
  v32 = v49.origin.y;
  v33 = v49.size.width;
  v34 = v49.size.height;
  if (!CGRectIsEmpty(v49))
  {
    v35 = fmin(-v13, 0.0);
    v36 = fmin(-v15, 0.0);
    v37 = fmin(-v16, 0.0);
    v38 = fmin(-v17, 0.0);
    v39 = v36 + v31;
    v40 = v35 + v32;
    v41 = v33 - (v36 + v38);
    v42 = v34 - (v35 + v37);
    WeakRetained = (double *)objc_loadWeakRetained((id *)&self->_animation);
    if (WeakRetained && dyld_program_sdk_at_least())
    {
      v43 = WeakRetained[13];
      v44 = WeakRetained[14];
      -[UIView bounds](self, "bounds");
      v50.origin.x = v43;
      v50.origin.y = v44;
      v52.origin.x = v39;
      v52.origin.y = v40;
      v52.size.width = v41;
      v52.size.height = v42;
      if (!CGRectContainsRect(v50, v52))
      {
        -[UIScrollView _contentOffsetForScrollingToRect:](self, "_contentOffsetForScrollingToRect:", v39, v40, v41, v42);
        *((_QWORD *)WeakRetained + 13) = v45;
        *((_QWORD *)WeakRetained + 14) = v46;
      }
    }
    else
    {
      -[UIView bounds](self, "bounds");
      v53.origin.x = v39;
      v53.origin.y = v40;
      v53.size.width = v41;
      v53.size.height = v42;
      if (!CGRectContainsRect(v51, v53))
      {
        -[UIScrollView _contentOffsetForScrollingToRect:](self, "_contentOffsetForScrollingToRect:", v39, v40, v41, v42);
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v4);
      }
    }

  }
}

- (id)nsli_contentYOffsetVariable
{
  NSISVariable *contentYOffsetVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  contentYOffsetVariable = self->_contentYOffsetVariable;
  if (!contentYOffsetVariable)
  {
    objc_msgSend(MEMORY[0x1E0D156D8], "variableWithDelegate:valueRestriction:shouldBeMinimized:", self, 0, 0);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentYOffsetVariable;
    self->_contentYOffsetVariable = v4;

    contentYOffsetVariable = self->_contentYOffsetVariable;
  }
  return contentYOffsetVariable;
}

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *accessoryViews;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!self->_accessoryViews)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    accessoryViews = self->_accessoryViews;
    self->_accessoryViews = v6;

  }
  -[UIScrollView accessoryViewAtEdge:](self, "accessoryViewAtEdge:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");
  if (v11)
  {
    objc_msgSend(v11, "setScrollView:", self);
    -[UIScrollView _addContentSubview:atBack:](self, "_addContentSubview:atBack:", v11, 0);
  }
  v9 = self->_accessoryViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

  -[UIScrollView _adjustScrollIndicatorsIfNeeded:forceRebuild:](self, 3, 0);
  -[UIScrollView _updateAccessories](self, "_updateAccessories");
  -[UIScrollView _updateAccessoriesInset](self, "_updateAccessoriesInset");

}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  NSMutableDictionary *accessoryViews;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  uint64_t v14;

  accessoryViews = self->_accessoryViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accessoryViews, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if ((unint64_t)a3 > 1)
    {
      v7 = 0;
    }
    else
    {
      if ((a3 == 1) != -[UIScrollView _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis](self, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis"))v8 = 5;
      else
        v8 = 3;
      v9 = self->_accessoryViews;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = _UIScrollAccessorySemanticEdge(a3, self);
    if (v11 != a3)
    {
      v12 = self->_accessoryViews;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v14;
    }
  }
  return v7;
}

- (void)_setMaskView:(id)a3
{
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIScrollView;
  -[UIView _setMaskView:](&v7, sel__setMaskView_, a3);
  -[UIView _safeMaskView](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0x2000000000000;
  if ((isKindOfClass & 1) == 0)
    v6 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFDFFFFFFFFFFFFLL | v6;

}

- (void)_setZoomFeedbackGenerator:(id)a3
{
  _UIZoomEdgeFeedbackGenerator *v5;
  _UIZoomEdgeFeedbackGenerator *zoomFeedbackGenerator;
  void *v7;

  v5 = (_UIZoomEdgeFeedbackGenerator *)a3;
  if (-[UIFeedbackGenerator isActive](self->_zoomFeedbackGenerator, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView.m"), 9022, CFSTR("Zoom feedback behavior should not be changed while active."));

  }
  zoomFeedbackGenerator = self->_zoomFeedbackGenerator;
  self->_zoomFeedbackGenerator = v5;

}

- (id)nsli_contentXOffsetVariable
{
  NSISVariable *contentXOffsetVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  contentXOffsetVariable = self->_contentXOffsetVariable;
  if (!contentXOffsetVariable)
  {
    objc_msgSend(MEMORY[0x1E0D156D8], "variableWithDelegate:valueRestriction:shouldBeMinimized:", self, 0, 0);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentXOffsetVariable;
    self->_contentXOffsetVariable = v4;

    contentXOffsetVariable = self->_contentXOffsetVariable;
  }
  return contentXOffsetVariable;
}

- (void)_allowsKeyboardScrollingDidUpdate
{
  _UIScrollViewScrollingAnimator *keyboardScrollingAnimator;

  if (self->_keyboardScrollingAnimator)
  {
    if (!-[UIScrollView allowsKeyboardScrolling](self, "allowsKeyboardScrolling"))
    {
      -[_UIScrollViewScrollingAnimator invalidate](self->_keyboardScrollingAnimator, "invalidate");
      keyboardScrollingAnimator = self->_keyboardScrollingAnimator;
      self->_keyboardScrollingAnimator = 0;

    }
  }
}

- (void)setInteractionActivityTrackingBaseName:(id)a3
{
  NSString *v4;
  NSString *interactionActivityTrackingBaseName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  interactionActivityTrackingBaseName = self->_interactionActivityTrackingBaseName;
  self->_interactionActivityTrackingBaseName = v4;

}

- (void)_setSupportsPointerDragScrolling:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFF7FFFFF | v3;
}

- (void)_setAutoScrollEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0;
  else
    v3 = 4;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFFFB | v3;
}

- (void)setTransfersVerticalScrollingToParent:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (void)setTransfersHorizontalScrollingToParent:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (void)setCanCancelContentTouches:(BOOL)canCancelContentTouches
{
  uint64_t v3;

  v3 = 0x20000;
  if (!canCancelContentTouches)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (void)_setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;

  if (((((*((_BYTE *)&self->_scrollViewFlags + 2) & 0x20) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UIScrollView _systemContentInset](self, "_systemContentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](self, "_edgesPropagatingSafeAreaInsetsToSubviews");
    v14 = 0x200000;
    if (!v3)
      v14 = 0;
    *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFDFFFFFLL | v14;
    -[UIScrollView _updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:](self, "_updateForChangedEdgesConvertingSafeAreaToContentInsetWithOldSystemContentInset:oldEdgesPropagatingSafeAreaInsets:adjustContentOffsetIfNecessary:", v13, 0, v6, v8, v10, v12);
  }
}

- (void)_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFBFFFFFF | v3;
}

- (void)_setFocusFastScrollingDisabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFF7FFFF | v3;
}

- (void)_setAlwaysAppliesKeyboardBottomInsetAdjustment:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFF7FFF | v3;
}

uint64_t __37__UIScrollView__hideScrollIndicators__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "setExpandedForDirectManipulation:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1528), "setExpandedForDirectManipulation:", 0);
}

- (void)_setEdgesAllowingScrollAccessoriesExtendedToBoundingPath:(unint64_t)a3
{
  if (self->_edgesAllowingScrollAccessoriesExtendedToBoundingPath != a3)
  {
    self->_edgesAllowingScrollAccessoriesExtendedToBoundingPath = a3;
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
  }
}

uint64_t __45__UIScrollView__clearContentOffsetAnimation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollViewHasClearedContentOffsetAnimation:", *(_QWORD *)(a1 + 32));
  return result;
}

- (CGSize)visibleSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UILayoutGuide)frameLayoutGuide
{
  return (UILayoutGuide *)-[UIScrollView _layoutGuideOfType:createIfNecessary:](self, "_layoutGuideOfType:createIfNecessary:", 1, 1);
}

- (void)_setLayoutObserver:(id)a3
{
  objc_storeStrong((id *)&self->_layoutObserver, a3);
}

- (CGRect)_intelligenceVisibleBounds
{
  UIScrollView *v2;
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
  double v33;
  CGRect result;

  v2 = self;
  -[UIScrollView adjustedContentInset](v2, sel_adjustedContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView safeAreaInsets](v2, sel_safeAreaInsets);
  v12 = UIEdgeInsetsMax(15, v4, v6, v8, v10, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIView bounds](v2, sel_bounds);
  v23 = UIRectInset(v19, v20, v21, v22, v12, v18, v16, v14);
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (void)startScrollViewMonitoring
{
  UIScrollViewMonitor *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (objc_opt_class())
  {
    v3 = -[UIScrollViewMonitor initWithScrollView:]([UIScrollViewMonitor alloc], "initWithScrollView:", self);
    -[UIScrollView set_scrollViewMonitor:](self, "set_scrollViewMonitor:", v3);

    -[UIScrollView _scrollViewMonitor](self, "_scrollViewMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      kdebug_trace();
      v5 = qword_1ECD81A90;
      if (!qword_1ECD81A90)
      {
        v5 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD81A90);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Did start scroll view monitoring", v13, 2u);
      }
      v7 = objc_alloc(MEMORY[0x1E0D8CA18]);
      -[UIScrollView _scrollViewMonitor](self, "_scrollViewMonitor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithScrollView:scrollMonitor:", self, v8);

      -[UIScrollView _scrollViewMonitor](self, "_scrollViewMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDelegate:", v9);

    }
  }
  else
  {
    v11 = _MergedGlobals_1251;
    if (!_MergedGlobals_1251)
    {
      v11 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_MergedGlobals_1251);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Can not find SRHMediaEventsCollector. Stop monitoring", buf, 2u);
    }
  }
}

- (void)stopScrollViewMonitoring
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  -[UIScrollView _scrollViewMonitor](self, "_scrollViewMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoring");

  -[UIScrollView set_scrollViewMonitor:](self, "set_scrollViewMonitor:", 0);
  kdebug_trace();
  v4 = stopScrollViewMonitoring___s_category;
  if (!stopScrollViewMonitoring___s_category)
  {
    v4 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&stopScrollViewMonitoring___s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Did stop scroll view monitoring", v6, 2u);
  }
}

- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3
{
  -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", -[UIScrollView isPagingEnabled](self, "isPagingEnabled"), a3.x, a3.y);
}

- (void)_adjustCrossingConstraintsIfNecessaryForOldContentInset:(UIEdgeInsets)a3
{
  double left;
  double top;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  UIScrollView *v28;
  UIScrollView *v29;
  UIScrollView *v30;
  _BOOL4 v32;
  int v33;
  unsigned int v34;
  double v35;
  int v36;
  double v37;
  unsigned int v38;
  double v39;
  uint64_t v40;
  id obj;
  id obja;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  left = a3.left;
  top = a3.top;
  v48 = *MEMORY[0x1E0C80C00];
  -[UIScrollView contentInset](self, "contentInset", a3.top, a3.left, a3.bottom, a3.right);
  v8 = left == v7 && top == v6;
  if (!v8 && (*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    v9 = v6;
    v10 = v7;
    -[UIView subviews](self, "subviews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(obj, "count"))
    {
      v11 = -[UIView _hostsLayoutEngine](self, "_hostsLayoutEngine");

      if (!v11)
      {
        v12 = (void *)MEMORY[0x1E0C99DE8];
        -[UIView _constraintsExceptingSubviewAutoresizingConstraints](self, "_constraintsExceptingSubviewAutoresizingConstraints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayWithArray:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIView superview](self, "superview");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          do
          {
            objc_msgSend(v16, "_constraintsExceptingSubviewAutoresizingConstraints");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObjectsFromArray:", v17);

            if ((objc_msgSend(v16, "_hostsLayoutEngine") & 1) != 0)
              break;
            objc_msgSend(v16, "superview");
            v18 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v18;
          }
          while (v18);

        }
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        obja = v14;
        v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v44;
          v22 = top - v9;
          v23 = left - v10;
          v24 = v9 - top;
          v25 = v10 - left;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v44 != v21)
                objc_enumerationMutation(obja);
              v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v26);
              objc_msgSend(v27, "firstItem");
              v28 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "secondItem");
              v29 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v28 == self || v29 == self)
                goto LABEL_39;
              v32 = -[UIView isDescendantOfView:](v28, "isDescendantOfView:", self);
              v33 = !-[UIView isDescendantOfView:](v30, "isDescendantOfView:", self);
              if ((v32 & v33) == 1
                && !-[UIView translatesAutoresizingMaskIntoConstraints](v28, "translatesAutoresizingMaskIntoConstraints"))
              {
                goto LABEL_27;
              }
              if (((v33 | v32) & 1) != 0
                || -[UIView translatesAutoresizingMaskIntoConstraints](v30, "translatesAutoresizingMaskIntoConstraints"))
              {
                goto LABEL_39;
              }
              if ((v32 & v33) != 0)
              {
LABEL_27:
                v34 = objc_msgSend(v27, "firstAttribute");
                v35 = 0.0;
                if (v34 > 0xA)
                  goto LABEL_37;
                v36 = 1 << v34;
                v37 = v25;
                if (((1 << v34) & 0x266) == 0)
                {
                  v37 = v24;
                  goto LABEL_34;
                }
              }
              else
              {
                v38 = objc_msgSend(v27, "secondAttribute");
                v35 = 0.0;
                if (v38 > 0xA)
                  goto LABEL_37;
                v36 = 1 << v38;
                if (((1 << v38) & 0x266) == 0)
                {
                  v37 = v22;
LABEL_34:
                  if ((v36 & 0x418) == 0)
                    goto LABEL_37;
                  goto LABEL_35;
                }
                v37 = v23;
              }
LABEL_35:
              if (v37 == 0.0)
              {
                v35 = v37;
LABEL_37:
                v37 = v35;
                if (*MEMORY[0x1E0D15688] > 0.0)
                  goto LABEL_39;
LABEL_38:
                objc_msgSend(v27, "constant");
                objc_msgSend(v27, "setConstant:", v37 + v39);
                goto LABEL_39;
              }
              if (fabs(v37) >= *MEMORY[0x1E0D15688])
                goto LABEL_38;
LABEL_39:

              ++v26;
            }
            while (v20 != v26);
            v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            v20 = v40;
          }
          while (v40);
        }

      }
    }
    else
    {

    }
  }
}

- (BOOL)_constraintAffectsContentSize:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "firstItem");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondItem");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v6 && v5 && v5 != v6)
  {
    -[UIView subviews](self, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v7 = (UIScrollView *)v5 == self
      && (*(_QWORD *)(v6 + 104) & 0x20000000000000) != 0
      && (objc_msgSend(v8, "containsObject:", v6) & 1) != 0
      || (UIScrollView *)v6 == self
      && (*(_QWORD *)(v5 + 104) & 0x20000000000000) != 0
      && objc_msgSend(v9, "containsObject:", v5);

  }
  return v7;
}

- (void)_didAddDependentConstraint:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  v4 = a3;
  -[UIView _didAddDependentConstraint:](&v6, sel__didAddDependentConstraint_, v4);
  v5 = -[UIScrollView _constraintAffectsContentSize:](self, "_constraintAffectsContentSize:", v4, v6.receiver, v6.super_class);

  if (v5 && !-[UIScrollView _wantsConstrainedContentSize](self, "_wantsConstrainedContentSize"))
  {
    -[UIScrollView _setAutomaticContentConstraints:](self, "_setAutomaticContentConstraints:", 0);
    -[UIScrollView _setWantsConstrainedContentSize:](self, "_setWantsConstrainedContentSize:", 1);
  }
}

- (void)_didRemoveDependentConstraint:(id)a3
{
  id v4;
  UIScrollView *v5;
  UIScrollView *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIScrollView;
  -[UIView _didRemoveDependentConstraint:](&v15, sel__didRemoveDependentConstraint_, v4);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = self;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = v5;
    while (1)
    {
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __82__UIScrollView__UIOldConstraintBasedLayoutSupport___didRemoveDependentConstraint___block_invoke;
      v10[3] = &unk_1E16E98B8;
      v10[4] = v6;
      v10[5] = &v11;
      _UIViewEnumerateConstraints(v8, (uint64_t)v10);
      if (*((_BYTE *)v12 + 24) || (objc_msgSend(v8, "_hostsLayoutEngine") & 1) != 0)
        break;
      objc_msgSend(v8, "superview");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
      if (!v9)
        goto LABEL_8;
    }

  }
LABEL_8:
  -[UIScrollView _setWantsConstrainedContentSize:](v6, "_setWantsConstrainedContentSize:", *((unsigned __int8 *)v12 + 24));
  _Block_object_dispose(&v11, 8);

}

uint64_t __82__UIScrollView__UIOldConstraintBasedLayoutSupport___didRemoveDependentConstraint___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_constraintAffectsContentSize:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)_constraintsFromContentSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIScrollView contentSize](self, "contentSize");
  v4 = v3;
  +[_UIScrollViewAutomaticContentSizeConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](_UIScrollViewAutomaticContentSizeConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 101, 0, 0, 0, 1.0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIScrollViewAutomaticContentSizeConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](_UIScrollViewAutomaticContentSizeConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 102, 0, 0, 0, 1.0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIScrollView)initWithCoder:(id)a3
{
  id v4;
  UIScrollView *v5;
  UIScrollView *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  int v23;
  unint64_t *p_scrollViewFlags;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat v35;
  CGFloat v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  int v55;
  uint64_t v56;
  void *v57;
  float v58;
  float v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  NSString *interactionActivityTrackingBaseName;
  objc_super v69;

  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)UIScrollView;
  v5 = -[UIView initWithCoder:](&v69, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_77;
  _UIScrollViewSharedInit(v5);
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIContentInset"));
  v6->_contentInset.top = v7;
  v6->_contentInset.left = v8;
  v6->_contentInset.bottom = v9;
  v6->_contentInset.right = v10;
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIScrollIndicatorInsets"));
  v6->_scrollIndicatorInset.top = v11;
  v6->_scrollIndicatorInset.left = v12;
  v6->_scrollIndicatorInset.bottom = v13;
  v6->_scrollIndicatorInset.right = v14;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIVerticalScrollIndicatorInsets")))
  {
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIVerticalScrollIndicatorInsets"));
    v6->_verticalScrollIndicatorInsets.top = v15;
    v6->_verticalScrollIndicatorInsets.left = v16;
    v6->_verticalScrollIndicatorInsets.bottom = v17;
    v6->_verticalScrollIndicatorInsets.right = v18;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIHorizontalScrollIndicatorInsets")))
  {
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIHorizontalScrollIndicatorInsets"));
    v6->_horizontalScrollIndicatorInsets.top = v19;
    v6->_horizontalScrollIndicatorInsets.left = v20;
    v6->_horizontalScrollIndicatorInsets.bottom = v21;
    v6->_horizontalScrollIndicatorInsets.right = v22;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIScrollViewIndicatorInsetAdjustmentBehavior")))
    *((_DWORD *)&v6->_scrollViewFlags + 5) = *((_DWORD *)&v6->_scrollViewFlags + 5) & 0xFFFFFE7F | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIScrollViewIndicatorInsetAdjustmentBehavior")) & 3) << 7);
  v23 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIScrollDisabled"));
  p_scrollViewFlags = (unint64_t *)&v6->_scrollViewFlags;
  v25 = 0x100000;
  if (!v23)
    v25 = 0;
  *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFEFFFFFLL | v25;
  v26 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIPagingEnabled"));
  v27 = 32;
  if (!v26)
    v27 = 0;
  *(_QWORD *)((char *)&v6->_scrollViewFlags + 12) = *(_QWORD *)((char *)&v6->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFFDFLL | v27;
  v28 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIBouncesZoom"));
  v29 = 64;
  if (!v28)
    v29 = 0;
  *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFFBFLL | v29;
  v30 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAlwaysBounceVertical"));
  v31 = 512;
  if (!v30)
    v31 = 0;
  *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFDFFLL | v31;
  v32 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAlwaysBounceHorizontal"));
  v33 = 256;
  if (!v32)
    v33 = 0;
  *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFEFFLL | v33;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIScrollViewContentInsetAdjustmentBehavior")))
  {
    v34 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIScrollViewContentInsetAdjustmentBehavior"));
LABEL_22:
    v6->_contentInsetAdjustmentBehavior = v34;
    goto LABEL_23;
  }
  if (!objc_msgSend((id)objc_opt_class(), "_defaultEdgesScrollingContentIntoSafeArea"))
  {
    v34 = 101;
    goto LABEL_22;
  }
LABEL_23:
  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UIContentSize"));
  v6->_contentSize.width = v35;
  v6->_contentSize.height = v36;
  *p_scrollViewFlags &= 0xFFFFFFFFCFFFFFFFLL;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UIIndicatorStyle")) & 1) != 0)
    v37 = *p_scrollViewFlags & 0xFFFFFFFFCFFFFFFFLL | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIIndicatorStyle")) & 3) << 28);
  else
    v37 = *p_scrollViewFlags;
  *p_scrollViewFlags = v37 | 8;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBounceEnabled")) & 1) != 0)
  {
    v38 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIBounceEnabled"));
    v39 = 8;
    if (!v38)
      v39 = 0;
    v40 = *p_scrollViewFlags & 0xFFFFFFFFFFFFFFF7 | v39;
  }
  else
  {
    v40 = *p_scrollViewFlags;
  }
  *p_scrollViewFlags = v40 | 4;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBounceEnabled")))
  {
    v41 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIBounceEnabled"));
    v42 = 4;
    if (!v41)
      v42 = 0;
    *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFFFFFBLL | v42;
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "userInterfaceIdiom") == 2)
  {
    *p_scrollViewFlags &= ~0x1000000uLL;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)(objc_msgSend(v44, "userInterfaceIdiom") != 8) << 24);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIShowsHorizontalScrollIndicator")))
  {
    v45 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIShowsHorizontalScrollIndicator"));
    v46 = 0x1000000;
    if (!v45)
      v46 = 0;
    *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFEFFFFFFLL | v46;
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "userInterfaceIdiom") == 2)
  {
    *p_scrollViewFlags &= ~0x2000000uLL;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)(objc_msgSend(v48, "userInterfaceIdiom") != 8) << 25);

  }
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UIShowsVerticalScrollIndicator")) & 1) != 0)
  {
    v49 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIShowsVerticalScrollIndicator"));
    v50 = 0x2000000;
    if (!v49)
      v50 = 0;
    v51 = *p_scrollViewFlags & 0xFFFFFFFFFDFFFFFFLL | v50;
  }
  else
  {
    v51 = *p_scrollViewFlags;
  }
  *p_scrollViewFlags = v51 | 0x40000;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UIDelaysContentTouches")) & 1) != 0)
  {
    v52 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDelaysContentTouches"));
    v53 = 0x40000;
    if (!v52)
      v53 = 0;
    v54 = *p_scrollViewFlags & 0xFFFFFFFFFFFBFFFFLL | v53;
  }
  else
  {
    v54 = *p_scrollViewFlags;
  }
  *p_scrollViewFlags = v54 | 0x20000;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UICanCancelContentTouches")))
  {
    v55 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UICanCancelContentTouches"));
    v56 = 0x20000;
    if (!v55)
      v56 = 0;
    *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFFFFDFFFFLL | v56;
  }
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&v6->_delegate, v57);

  v6->_minimumZoomScale = 1.0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMinimumZoomScale")))
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIMinimumZoomScale"));
    v6->_minimumZoomScale = v58;
  }
  v6->_maximumZoomScale = 1.0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMaximumZoomScale")))
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIMaximumZoomScale"));
    v6->_maximumZoomScale = v59;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIKeyboardDismissMode")))
    v6->_keyboardDismissMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIKeyboardDismissMode"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIRefreshControl")))
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIRefreshControl"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView _setRefreshControl:](v6, "_setRefreshControl:", v60);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIIndexDisplayMode")))
    *p_scrollViewFlags = *p_scrollViewFlags & 0xFFFFFFFFF3FFFFFFLL | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIIndexDisplayMode")) & 3) << 26);
  v6->_contentOffsetAnimationDuration = 0.3;
  v6->_decelerationFactor = (CGSize)vdupq_n_s64(0x3FEFEF9DB22D0E56uLL);
  v6->_fastScrollMultiplier = 1.0;
  -[UIView bounds](v6, "bounds");
  v62 = v61 * -0.000000184659091 + 0.000359090909;
  if (v61 > 1024.0)
    v62 = 0.00017;
  v6->_pagingSpringPull = v62;
  -[UIView bounds](v6, "bounds");
  v64 = v63 * 0.00000994318182 + 0.966818182;
  if (v63 > 1024.0)
    v64 = 0.977;
  v6->_pagingFriction = v64;
  -[UIView _currentScreenScale](v6, "_currentScreenScale");
  v6->_accuracy = v65;
  v6->_savedKeyboardAdjustmentDelta = 0.0;
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)v6)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)v6))
  {
    -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](v6, "_adjustScrollerIndicators:alwaysShowingThem:", 1, 0);
  }
  -[UIScrollView _createGestureRecognizersForCurrentTouchLevel](v6, "_createGestureRecognizersForCurrentTouchLevel");
  -[UIScrollViewPanGestureRecognizer setDirectionalLockEnabled:](v6->_pan, "setDirectionalLockEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDirectionalLockEnabled")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIScrollViewInteractionActivityTrackingBaseName"));
  v66 = objc_claimAutoreleasedReturnValue();
  interactionActivityTrackingBaseName = v6->_interactionActivityTrackingBaseName;
  v6->_interactionActivityTrackingBaseName = (NSString *)v66;

  -[UIScrollView _updateContentFitDisableScrolling](v6, "_updateContentFitDisableScrolling");
LABEL_77:

  return v6;
}

- (BOOL)_effectiveShowsVerticalScrollIndicator
{
  id v1;
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  if (result)
  {
    if ((*(_BYTE *)(result + 1771) & 2) != 0 && !*(_QWORD *)(result + 512))
    {
      v1 = *(id *)(result + 1920);
      if (objc_msgSend(v1, "count"))
      {
        objc_msgSend(v1, "objectForKeyedSubscript:", &unk_1E1A9AE48);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        if (v2)
        {
          v3 = 1;
        }
        else
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", &unk_1E1A9AE60);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4)
          {
            v3 = 1;
          }
          else
          {
            objc_msgSend(v1, "objectForKeyedSubscript:", &unk_1E1A9AE78);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if (v5)
            {
              v3 = 1;
            }
            else
            {
              objc_msgSend(v1, "objectForKeyedSubscript:", &unk_1E1A9AE90);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = v6 != 0;

            }
          }

        }
      }
      else
      {
        v3 = 0;
      }

      return !v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)_effectiveShowsHorizontalScrollIndicator
{
  id v1;
  void *v2;
  _BOOL4 v3;
  void *v4;

  if (result)
  {
    if ((*(_BYTE *)(result + 1771) & 1) != 0 && !*(_QWORD *)(result + 512))
    {
      v1 = *(id *)(result + 1920);
      if (objc_msgSend(v1, "count"))
      {
        objc_msgSend(v1, "objectForKeyedSubscript:", &unk_1E1A9AE18);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        if (v2)
        {
          v3 = 1;
        }
        else
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", &unk_1E1A9AE30);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v4 != 0;

        }
      }
      else
      {
        v3 = 0;
      }

      return !v3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_layoutObserver
{
  return self->_layoutObserver;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *accessoryViews;
  id v7;
  uint64_t i;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  objc_super v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIScrollView;
  -[UIView _populateArchivedSubviews:](&v15, sel__populateArchivedSubviews_, v4);
  v16[0] = self->_zoomView;
  v16[1] = self->_horizontalScrollIndicator;
  v16[2] = self->_verticalScrollIndicator;
  v5 = 0;
  v16[3] = self->_refreshControl;
  do
  {
    if (v16[v5])
      objc_msgSend(v4, "removeObject:");
    ++v5;
  }
  while (v5 != 4);
  accessoryViews = self->_accessoryViews;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __42__UIScrollView__populateArchivedSubviews___block_invoke;
  v13 = &unk_1E16EA998;
  v7 = v4;
  v14 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryViews, "enumerateKeysAndObjectsUsingBlock:", &v10);
  if (self->_shadows)
  {
    for (i = 0; i != 10; ++i)
    {
      if (self->_shadows[i])
        objc_msgSend(v7, "removeObject:", v10, v11, v12, v13);
    }
  }

  for (j = 3; j != -1; --j)
}

uint64_t __42__UIScrollView__populateArchivedSubviews___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double top;
  double v9;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  unint64_t scrollViewFlags;
  uint64_t v15;
  unint64_t v16;
  double minimumZoomScale;
  double maximumZoomScale;
  id WeakRetained;
  int64_t keyboardDismissMode;
  UIRefreshControl *refreshControl;
  uint64_t v22;
  NSString *interactionActivityTrackingBaseName;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIScrollView;
  -[UIView encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  if (self->_contentInset.top != 0.0
    || self->_contentInset.bottom != 0.0
    || self->_contentInset.left != 0.0
    || self->_contentInset.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIContentInset"));
  }
  if (self->_scrollIndicatorInset.top != 0.0
    || self->_scrollIndicatorInset.bottom != 0.0
    || self->_scrollIndicatorInset.left != 0.0
    || self->_scrollIndicatorInset.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIScrollIndicatorInsets"));
  }
  top = self->_verticalScrollIndicatorInsets.top;
  if (self->_verticalScrollIndicatorInsets.left != 1.79769313e308
    || top != 1.79769313e308
    || self->_verticalScrollIndicatorInsets.right != 1.79769313e308
    || self->_verticalScrollIndicatorInsets.bottom != 1.79769313e308)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIVerticalScrollIndicatorInsets"), top);
  }
  v9 = self->_horizontalScrollIndicatorInsets.top;
  if (self->_horizontalScrollIndicatorInsets.left != 1.79769313e308
    || v9 != 1.79769313e308
    || self->_horizontalScrollIndicatorInsets.right != 1.79769313e308
    || self->_horizontalScrollIndicatorInsets.bottom != 1.79769313e308)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIHorizontalScrollIndicatorInsets"), v9);
  }
  p_scrollViewFlags = &self->_scrollViewFlags;
  objc_msgSend(v4, "encodeInteger:forKey:", ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 7) & 3, CFSTR("UIScrollViewIndicatorInsetAdjustmentBehavior"));
  scrollViewFlags = (unint64_t)self->_scrollViewFlags;
  v15 = (scrollViewFlags >> 28) & 3;
  if (v15)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v15, CFSTR("UIIndicatorStyle"));
    scrollViewFlags = *(_QWORD *)p_scrollViewFlags;
  }
  if ((scrollViewFlags & 0xC) != 0)
  {
    if ((scrollViewFlags & 0x1000000) != 0)
      goto LABEL_37;
  }
  else
  {
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIBounceEnabled"));
    scrollViewFlags = *(_QWORD *)p_scrollViewFlags;
    if ((*(_QWORD *)p_scrollViewFlags & 0x1000000) != 0)
    {
LABEL_37:
      if ((scrollViewFlags & 0x2000000) != 0)
        goto LABEL_38;
      goto LABEL_73;
    }
  }
  objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIShowsHorizontalScrollIndicator"));
  scrollViewFlags = *(_QWORD *)p_scrollViewFlags;
  if ((*(_QWORD *)p_scrollViewFlags & 0x2000000) != 0)
  {
LABEL_38:
    if ((scrollViewFlags & 0x100000) == 0)
      goto LABEL_39;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIShowsVerticalScrollIndicator"));
  scrollViewFlags = *(_QWORD *)p_scrollViewFlags;
  if ((*(_QWORD *)p_scrollViewFlags & 0x100000) == 0)
  {
LABEL_39:
    if ((scrollViewFlags & 0x40000) != 0)
      goto LABEL_40;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIScrollDisabled"));
  scrollViewFlags = *(_QWORD *)p_scrollViewFlags;
  if ((*(_QWORD *)p_scrollViewFlags & 0x40000) != 0)
  {
LABEL_40:
    if ((scrollViewFlags & 0x20000) != 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_75:
  objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIDelaysContentTouches"));
  if ((*(_QWORD *)p_scrollViewFlags & 0x20000) == 0)
LABEL_41:
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UICanCancelContentTouches"));
LABEL_42:
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIPagingEnabled"));
  v16 = *(_QWORD *)p_scrollViewFlags;
  if ((*(_QWORD *)p_scrollViewFlags & 0x40) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIBouncesZoom"));
    v16 = *(_QWORD *)p_scrollViewFlags;
    if ((*(_QWORD *)p_scrollViewFlags & 0x200) == 0)
    {
LABEL_46:
      if ((v16 & 0x100) == 0)
        goto LABEL_48;
      goto LABEL_47;
    }
  }
  else if ((v16 & 0x200) == 0)
  {
    goto LABEL_46;
  }
  objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAlwaysBounceVertical"));
  if ((*(_QWORD *)p_scrollViewFlags & 0x100) != 0)
LABEL_47:
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAlwaysBounceHorizontal"));
LABEL_48:
  if (-[UIScrollViewPanGestureRecognizer isDirectionalLockEnabled](self->_pan, "isDirectionalLockEnabled"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UIScrollViewPanGestureRecognizer isDirectionalLockEnabled](self->_pan, "isDirectionalLockEnabled"), CFSTR("UIDirectionalLockEnabled"));
  minimumZoomScale = self->_minimumZoomScale;
  if (minimumZoomScale != 1.0)
  {
    *(float *)&minimumZoomScale = minimumZoomScale;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIMinimumZoomScale"), minimumZoomScale);
  }
  maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale != 1.0)
  {
    *(float *)&maximumZoomScale = maximumZoomScale;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIMaximumZoomScale"), maximumZoomScale);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  if (self->_contentSize.width != *MEMORY[0x1E0C9D820]
    || self->_contentSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("UIContentSize"));
  }
  keyboardDismissMode = self->_keyboardDismissMode;
  if (keyboardDismissMode)
    objc_msgSend(v4, "encodeInteger:forKey:", keyboardDismissMode, CFSTR("UIKeyboardDismissMode"));
  refreshControl = self->_refreshControl;
  if (refreshControl)
    objc_msgSend(v4, "encodeObject:forKey:", refreshControl, CFSTR("UIRefreshControl"));
  v22 = (*(_QWORD *)p_scrollViewFlags >> 26) & 3;
  if (v22)
    objc_msgSend(v4, "encodeInteger:forKey:", v22, CFSTR("UIIndexDisplayMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contentInsetAdjustmentBehavior, CFSTR("UIScrollViewContentInsetAdjustmentBehavior"));
  interactionActivityTrackingBaseName = self->_interactionActivityTrackingBaseName;
  if (interactionActivityTrackingBaseName)
    objc_msgSend(v4, "encodeObject:forKey:", interactionActivityTrackingBaseName, CFSTR("UIScrollViewInteractionActivityTrackingBaseName"));

}

void __28__UIScrollView_setDelegate___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_ScrollViewOffsetChangeLogging_block_invoke___s_category;
  if (!_UIInternalPreference_ScrollViewOffsetChangeLogging_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_ScrollViewOffsetChangeLogging_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a delegate. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __28__UIScrollView_setDelegate___block_invoke_137(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      objc_msgSend(v3, "setDelegate:", 0);

    WeakRetained = v3;
  }

}

- (id)_createStaticScrollBar
{
  _UIStaticScrollBar *v2;

  v2 = [_UIStaticScrollBar alloc];
  return -[_UIStaticScrollBar initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)_adjustScrollIndicatorsIfNeeded:(int)a3 forceRebuild:
{
  _BOOL4 v6;
  void *v7;
  BOOL v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  BOOL v12;
  void *v13;

  if (!a1)
    return;
  if ((a2 & 2) == 0)
  {
    if ((a2 & 1) == 0)
      return;
    v6 = 0;
    goto LABEL_13;
  }
  v6 = -[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)a1);
  v7 = (void *)a1[191];
  if (v7)
    v8 = (!v6 | a3) == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v7, "removeFromSuperview");
    v9 = (void *)a1[191];
    a1[191] = 0;

  }
  if ((a2 & 1) != 0)
  {
LABEL_13:
    v10 = -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)a1);
    v11 = (void *)a1[192];
    if (v11)
      v12 = (!v10 | a3) == 0;
    else
      v12 = 1;
    if (!v12)
    {
      objc_msgSend(v11, "removeFromSuperview");
      v13 = (void *)a1[192];
      a1[192] = 0;

    }
    if (v6 || v10)
      goto LABEL_19;
    return;
  }
  if (v6)
LABEL_19:
    objc_msgSend(a1, "_adjustScrollerIndicators:alwaysShowingThem:", 1, 0);
}

- (CGPoint)_maximumContentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UIScrollView _maximumContentOffsetForContentSize:](self, "_maximumContentOffsetForContentSize:", self->_contentSize.width, self->_contentSize.height);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_maximumContentPoint
{
  double v3;
  double accuracy;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  v6 = v5 + self->_contentSize.width;
  if (accuracy == 1.0)
  {
    v8 = round(v6);
    v11 = round(v3 + self->_contentSize.height);
  }
  else
  {
    v7 = floor(v6);
    v8 = v7 + round(accuracy * (v6 - v7)) / accuracy;
    v9 = v3 + self->_contentSize.height;
    v10 = floor(v9);
    v11 = v10 + round(accuracy * (v9 - v10)) / accuracy;
  }
  result.y = v11;
  result.x = v8;
  return result;
}

- (void)_setVelocityScaleFactor:(double)a3
{
  self->_velocityScaleFactor = a3;
}

- (double)_velocityScaleFactor
{
  return self->_velocityScaleFactor;
}

- (BOOL)_topScrollIndicatorFollowsContentOffset
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 61) & 1;
}

- (BOOL)_verticalScrollIndicatorUsesAlternativeTopSafeAreaInset
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 62) & 1;
}

- (void)_setUpdateRequestRecord:(const _UIUpdateRequestRecord *)a3
{
  -[_UIScrollViewVFD setUpdateRequestRecord:]((uint64_t)self->_vfd, a3);
}

- (id)_panGestureRecognizer
{
  return self->_pan;
}

- (id)_swipeGestureRecognizer
{
  return self->_swipe;
}

- (id)_touchesDelayedGestureRecognizer
{
  return self->_touchDelayGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pan, a3);
}

- (void)_setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinch, a3);
}

- (void)_updatePagingGestures
{
  -[UIScrollView _updatePagingSwipeGesture](self, "_updatePagingSwipeGesture");
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
    -[UIScrollView _updateScrollGestureRecognizersEnabled](self, "_updateScrollGestureRecognizersEnabled");
}

- (void)_updatePagingSwipeGesture
{
  id swipe;
  id v4;
  UIScrollViewPagingSwipeGestureRecognizer *v5;
  id v6;
  UIScrollViewPagingSwipeGestureRecognizer *v7;

  swipe = self->_swipe;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    if (!swipe)
    {
      v5 = -[UIGestureRecognizer initWithTarget:action:]([UIScrollViewPagingSwipeGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleSwipe_);
      v6 = self->_swipe;
      self->_swipe = v5;
      v7 = v5;

      -[UIScrollViewPagingSwipeGestureRecognizer setScrollView:](v7, "setScrollView:", self);
      -[UIGestureRecognizer setDelegate:](v7, "setDelegate:", self);
      -[UIGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", self->__allowedTouchTypesForScrolling);
      -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_swipe);
      -[UIGestureRecognizer requireGestureRecognizerToFail:](self->_pan, "requireGestureRecognizerToFail:", self->_swipe);
      v4 = v7;
      goto LABEL_7;
    }
  }
  else if (swipe)
  {
    -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    v4 = self->_swipe;
    self->_swipe = 0;
LABEL_7:

  }
}

- (BOOL)_startBeingDraggedByChild:(id)a3
{
  uint64_t v3;
  int v4;

  v3 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v3 & 0x100000000000) == 0)
  {
    v4 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v3 | 0x100000000000;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4;
    objc_storeWeak((id *)&self->_draggingChildScrollView, a3);
  }
  return (v3 & 0x100000000000) == 0;
}

- (BOOL)_stopBeingDraggedByChild:(id)a3
{
  id v4;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  UIScrollView **p_draggingChildScrollView;
  id WeakRetained;
  BOOL v8;

  v4 = a3;
  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x100000000000) != 0
    && (p_draggingChildScrollView = &self->_draggingChildScrollView,
        WeakRetained = objc_loadWeakRetained((id *)p_draggingChildScrollView),
        WeakRetained,
        WeakRetained == v4))
  {
    *(_QWORD *)((char *)p_scrollViewFlags + 12) &= ~0x100000000000uLL;
    objc_storeWeak((id *)p_draggingChildScrollView, 0);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_startDraggingParent:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  if ((objc_msgSend(v4, "_startBeingDraggedByChild:", self) & 1) == 0)

}

- (void)_stopDraggingParent:(id)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  objc_msgSend(a3, "_stopBeingDraggedByChild:", self);
  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v9[5] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v9[7] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v9[0] = *MEMORY[0x1E0CD2610];
  v9[1] = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v9[3] = v8;
  objc_msgSend(v4, "setSublayerTransform:", v9);

  self->_parentAdjustment.x = 0.0;
  self->_parentAdjustment.y = 0.0;
}

BOOL __34__UIScrollView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;

  v3 = a2;
  if (objc_msgSend(v3, "_isTapToClick")
    && (objc_msgSend(v3, "timestamp"), v4 >= *(double *)(*(_QWORD *)(a1 + 32) + 1664)))
  {
    objc_msgSend(v3, "timestamp");
    v7 = v6;
    v8 = *(double *)(*(_QWORD *)(a1 + 32) + 1664);
    v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ScrollInterruptToAllowTapToClickDuration, (uint64_t)CFSTR("ScrollInterruptToAllowTapToClickDuration"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v10 = *(double *)&qword_1EDDA8410;
    if (v9)
      v10 = 0.25;
    v5 = v7 < v8 + v10;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_adjustedHorizontalOffsetPinnedToScrollableBounds:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double accuracy;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double result;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v10 = v6 + a3;
  accuracy = self->_accuracy;
  v13 = self->_firstPageOffset.horizontal - v12;
  if (accuracy == 1.0)
  {
    v22 = round(v13);
    v23 = v6 + v22 - v6;
    if (v10 < v22)
    {
      result = v22 - v6;
    }
    else
    {
      v23 = v6 + a3;
      result = a3;
    }
    v21 = round(v9 + self->_contentSize.width) - v8;
    if (v23 > v21)
      return v21 - v6;
  }
  else
  {
    v14 = floor(v13);
    v15 = v14 + round(accuracy * (v13 - v14)) / accuracy;
    v16 = v6 + v15 - v6;
    v17 = v10 < v15;
    if (v10 >= v15)
      result = a3;
    else
      result = v15 - v6;
    if (v17)
      v10 = v16;
    v19 = v9 + self->_contentSize.width;
    v20 = floor(v19);
    v21 = v20 + round(accuracy * (v19 - v20)) / accuracy - v8;
    if (v10 > v21)
      return v21 - v6;
  }
  return result;
}

- (double)_adjustedVerticalOffsetPinnedToScrollableBounds:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double accuracy;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double result;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v10 = v6 + a3;
  accuracy = self->_accuracy;
  v13 = self->_firstPageOffset.vertical - v12;
  if (accuracy == 1.0)
  {
    v22 = round(v13);
    if (v10 >= v22)
    {
      result = a3;
    }
    else
    {
      v10 = v6 + v22 - v6;
      result = v22 - v6;
    }
    v21 = round(v9 + self->_contentSize.height);
  }
  else
  {
    v14 = floor(v13);
    v15 = v14 + round(accuracy * (v13 - v14)) / accuracy;
    v16 = v6 + v15 - v6;
    v17 = v10 < v15;
    if (v10 >= v15)
      result = a3;
    else
      result = v15 - v6;
    if (v17)
      v10 = v16;
    v19 = v9 + self->_contentSize.height;
    v20 = floor(v19);
    v21 = v20 + round(accuracy * (v19 - v20)) / accuracy;
  }
  v23 = v21 - v8;
  if (v10 > v23)
    return v23 - v6;
  return result;
}

- (void)_setEdgesScrollingContentIntoSafeArea:(unint64_t)a3
{
  uint64_t v3;

  if ((a3 & 0xF) != 0)
    v3 = 0;
  else
    v3 = 101;
  -[UIScrollView setContentInsetAdjustmentBehavior:](self, "setContentInsetAdjustmentBehavior:", v3);
}

- (unint64_t)_edgesScrollingContentIntoSafeArea
{
  int64_t contentInsetAdjustmentBehavior;

  contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  if (contentInsetAdjustmentBehavior == 101 || contentInsetAdjustmentBehavior == 2)
    return 0;
  else
    return 15;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 0;
}

- (void)_setAllowedNavigationOverlapAmount:(double)a3
{
  _QWORD v3[5];

  self->_allowedNavigationOverlapAmount = ceil(a3);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__UIScrollView__setAllowedNavigationOverlapAmount___block_invoke;
  v3[3] = &unk_1E16EAA10;
  v3[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __51__UIScrollView__setAllowedNavigationOverlapAmount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollViewDidScroll:", *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)_isInSetContentOffset
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 54) & 1;
}

- (void)setContentAlignmentPoint:(CGPoint)a3
{
  if (self->_contentAlignmentPoint.x != a3.x || self->_contentAlignmentPoint.y != a3.y)
  {
    self->_contentAlignmentPoint = a3;
    -[UIScrollView _updateForChangedScrollRelatedInsets](self, "_updateForChangedScrollRelatedInsets");
  }
}

- (BOOL)_isRectFullyVisible:(CGRect)a3
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
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v17 = v11 + v16;
  v20 = v13 - (v18 + v19);
  v23.size.height = v15 - (v16 + v21);
  v23.origin.x = v9 + v18;
  v23.origin.y = v17;
  v23.size.width = v20;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  return CGRectContainsRect(v23, v24);
}

- (NSDirectionalEdgeInsets)_directionalAccessoryEdgeInsets
{
  _BOOL4 v3;
  double top;
  double left;
  double bottom;
  double right;
  NSDirectionalEdgeInsets result;

  v3 = -[UIScrollView _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis](self, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis");
  top = self->_accessoryInsets.top;
  left = self->_accessoryInsets.left;
  bottom = self->_accessoryInsets.bottom;
  if (v3)
    right = self->_accessoryInsets.right;
  else
    right = self->_accessoryInsets.left;
  if (!v3)
    left = self->_accessoryInsets.right;
  result.trailing = left;
  result.bottom = bottom;
  result.leading = right;
  result.top = top;
  return result;
}

- (CGPoint)indexBarAccessoryView:(id)a3 contentOffsetForEntry:(id)a4 atIndex:(int64_t)a5
{
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  objc_msgSend(a3, "displayEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
  v10 = v9;
  v12 = v11;
  -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset");
  v14 = v12 + (double)a5 / (double)(v8 - 1) * (v13 - v12);
  v15 = v10;
  result.y = v14;
  result.x = v15;
  return result;
}

- (UIView)_horizontalScrollIndicator
{
  return (UIView *)self->_horizontalScrollIndicator;
}

- (UIView)_verticalScrollIndicator
{
  return (UIView *)self->_verticalScrollIndicator;
}

- (void)_setFlipsHorizontalAxis:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIView _flipsHorizontalAxis](self, "_flipsHorizontalAxis");
  v6.receiver = self;
  v6.super_class = (Class)UIScrollView;
  -[UIView _setFlipsHorizontalAxis:](&v6, sel__setFlipsHorizontalAxis_, v3);
  if (v5 != v3)
  {
    -[UIScrollView _updateAccessories](self, "_updateAccessories");
    -[UIScrollView _updateAccessoriesInset](self, "_updateAccessoriesInset");
  }
}

- (void)_webCustomViewWillBeRemovedFromSuperview
{
  objc_super v3;

  -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 0, 1);
  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  -[UIView _webCustomViewWillBeRemovedFromSuperview](&v3, sel__webCustomViewWillBeRemovedFromSuperview);
}

- (id)_boundingPathForSubtree
{
  void *v3;
  _UIRectangularBoundingPath *v4;
  _UIRectangularBoundingPath *v5;
  objc_super v7;

  if (-[UIScrollView _resetsBoundingPathForSubtree](self, "_resetsBoundingPathForSubtree"))
  {
    objc_getAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [_UIRectangularBoundingPath alloc];
      -[UIView bounds](self, "bounds");
      v5 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v4, "initWithCoordinateSpace:boundingRect:", self);
      objc_setAssociatedObject(self, &_UIScrollViewBoundingPathForSubtreeKey, v5, (void *)1);
      return v5;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIScrollView;
    -[UIView _boundingPathForSubtree](&v7, sel__boundingPathForSubtree);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_resetsBoundingPathForSubtree
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 10) & 1;
}

- (void)_setResetsBoundingPathForSubtree:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFFFBFF | v3;
}

- (void)_setNeedsLayoutOnVisibleBoundsChange:(BOOL)a3
{
  int v3;
  unsigned int v4;
  int v5;

  v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
  if (((((v3 & 0x1000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = v3 & 0xFEFFFFFF;
    if (a3)
      v5 = 0x1000000;
    else
      v5 = 0;
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
    *((_DWORD *)&self->_scrollViewFlags + 5) = v4 | v5;
    if (a3)
      -[UIView _registerForGeometryChanges](self, "_registerForGeometryChanges");
    else
      -[UIView _unregisterForGeometryChanges](self, "_unregisterForGeometryChanges");
  }
}

- (CGPoint)_contentOffsetForScrollingToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIScrollView contentOffset](self, "contentOffset");
  v18 = x + width;
  if (x < v9)
    v16 = x;
  if (v18 >= v9 + v13)
    v16 = v18 - v13;
  v19 = y + height;
  if (y < v11)
    v17 = y;
  if (v19 >= v11 + v15)
    v17 = v19 - v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)isDirectionalLockEnabled
{
  return -[UIScrollViewPanGestureRecognizer isDirectionalLockEnabled](self->_pan, "isDirectionalLockEnabled");
}

- (void)_setFirstResponderKeyboardAvoidanceEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)isProgrammaticScrollEnabled
{
  return (*((_BYTE *)&self->_scrollViewFlags + 2) & 8) == 0;
}

- (unint64_t)_abuttedPagingEdges
{
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) == 0)
    return 0;
  if (-[UIScrollView isDecelerating](self, "isDecelerating"))
    return -[UIScrollView _abuttedEdgesForContentOffset:](self, "_abuttedEdgesForContentOffset:", self->_pageDecelerationTarget.x, self->_pageDecelerationTarget.y);
  return -[UIScrollView _currentlyAbuttedContentEdges](self, "_currentlyAbuttedContentEdges");
}

- (BOOL)bounces
{
  return (~*(_DWORD *)&self->_scrollViewFlags & 0xCLL) == 0;
}

- (BOOL)bouncesHorizontally
{
  return (*(_BYTE *)&self->_scrollViewFlags >> 3) & 1;
}

- (BOOL)bouncesVertically
{
  return (*(_BYTE *)&self->_scrollViewFlags >> 2) & 1;
}

- (BOOL)_applicationHasExplicitlySetBounces
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 59) & 1;
}

- (void)setUpdateInsetBottomDuringKeyboardDismiss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)updateInsetBottomDuringKeyboardDismiss
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 43) & 1;
}

- (double)keyboardBottomInsetAdjustmentDelta
{
  return self->_savedKeyboardAdjustmentDelta;
}

- (BOOL)_alwaysAppliesKeyboardBottomInsetAdjustment
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 15) & 1;
}

- (BOOL)transfersHorizontalScrollingToParent
{
  return (*((_BYTE *)&self->_scrollViewFlags + 1) & 4) == 0;
}

- (BOOL)transfersVerticalScrollingToParent
{
  return (*((_BYTE *)&self->_scrollViewFlags + 1) & 8) == 0;
}

- (void)_setTransfersScrollToContainer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (void)_setDefaultShowsHorizontalScrollIndicator:(BOOL)a3
{
  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x40000000) == 0)
    -[UIScrollView _setShowsHorizontalScrollIndicator:](self, a3);
}

- (UIScrollViewIndexDisplayMode)indexDisplayMode
{
  return (*(_QWORD *)&self->_scrollViewFlags >> 26) & 3;
}

- (void)setIndexDisplayMode:(UIScrollViewIndexDisplayMode)indexDisplayMode
{
  unint64_t scrollViewFlags;

  scrollViewFlags = (unint64_t)self->_scrollViewFlags;
  if (((scrollViewFlags >> 26) & 3) != indexDisplayMode)
    *(_QWORD *)&self->_scrollViewFlags = scrollViewFlags & 0xFFFFFFFFF3FFFFFFLL | ((unint64_t)(indexDisplayMode & 3) << 26);
}

- (UIScrollViewDecelerationRate)decelerationRate
{
  return self->_decelerationFactor.width;
}

- (UIScrollViewIndicatorStyle)indicatorStyle
{
  return (*(_QWORD *)&self->_scrollViewFlags >> 28) & 3;
}

- (double)verticalScrollDecelerationFactor
{
  return self->_decelerationFactor.height;
}

- (void)setVerticalScrollDecelerationFactor:(double)a3
{
  self->_decelerationFactor.height = a3;
}

- (void)setAllowsMultipleFingers:(BOOL)a3
{
  uint64_t v4;

  v4 = 0x8000;
  if (a3)
    v4 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFF7FFFLL | v4;
  -[UIPanGestureRecognizer setFailsPastMaxTouches:](self->_pan, "setFailsPastMaxTouches:", !a3);
  -[UIScrollView _updatePanGestureConfiguration](self, "_updatePanGestureConfiguration");
}

- (BOOL)allowsMultipleFingers
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x8000) == 0;
}

- (BOOL)tracksImmediatelyWhileDecelerating
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x8000000) == 0;
}

- (BOOL)_avoidsJumpOnInterruptedBounce
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 28) & 1;
}

- (BOOL)_contentOffsetRoundingEnabled
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000) == 0;
}

- (void)_setContentOffsetRoundingEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFDFFFFFFFFFLL | v3;
  if (a3)
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    -[UIScrollView setContentOffset:](self, "setContentOffset:");
  }
}

- (unint64_t)_allowedFocusBounceEdges
{
  return 0;
}

- (void)_setAllowedFocusBounceEdges:(unint64_t)a3
{
  unint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _setAllowedFocusBounceEdges____s_category;
  if (!_setAllowedFocusBounceEdges____s_category)
  {
    v3 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&_setAllowedFocusBounceEdges____s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UIScrollView _allowedFocusBounceEdges is deprecated: please remove any references to this property.", v5, 2u);
  }
}

- (double)_scrollHysteresis
{
  double result;

  -[UIScrollViewPanGestureRecognizer _hysteresis](self->_pan, "_hysteresis");
  return result;
}

void __61__UIScrollView__createGestureRecognizersForCurrentTouchLevel__block_invoke(uint64_t a1, uint64_t a2)
{
  UISwipeGestureRecognizer *v4;
  uint64_t v5;
  signed int v6;
  void *v7;

  v4 = -[UISwipeGestureRecognizer initWithTarget:action:]([UISwipeGestureRecognizer alloc], "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel__handleLowFidelitySwipe_);
  -[UISwipeGestureRecognizer setDirection:](v4, "setDirection:", a2);
  -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[UIGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1936));
  objc_msgSend(*(id *)(a1 + 32), "addGestureRecognizer:", v4);
  v5 = *(_QWORD *)(a1 + 32) + 1032;
  v6 = __clz(__rbit32(a2));
  if (!(_DWORD)a2)
    v6 = -1;
  v7 = *(void **)(v5 + 8 * v6);
  *(_QWORD *)(v5 + 8 * v6) = v4;

}

- (void)willRotateToInterfaceOrientation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double accuracy;
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

  -[UIScrollView contentOffset](self, "contentOffset", a3);
  v5 = v4;
  v7 = v6;
  -[UIView bounds](self, "bounds");
  self->_rotationCenterPoint.x = v5 + v8 * 0.5;
  -[UIView bounds](self, "bounds");
  self->_rotationCenterPoint.y = v7 + v9 * 0.5;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = ((unint64_t)(v5 == 0.0) << 30) | ((unint64_t)(v7 == 0.0) << 31) | *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFF3FFFFFFFLL;
  accuracy = self->_accuracy;
  -[UIScrollView contentSize](self, "contentSize");
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v14 = v12 - v13;
  if (accuracy == 1.0)
  {
    v19 = round(v14);
  }
  else
  {
    v15 = floor(v14);
    -[UIScrollView contentSize](self, "contentSize");
    v17 = v16;
    -[UIView bounds](self, "bounds");
    v19 = v15 + round(self->_accuracy * (v17 - v18 - v15)) / self->_accuracy;
  }
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFEFFFFFFFFLL | ((unint64_t)(v5 == v19) << 32);
  v20 = self->_accuracy;
  -[UIScrollView contentSize](self, "contentSize");
  v22 = v21;
  -[UIView bounds](self, "bounds");
  v24 = v22 - v23;
  if (v20 == 1.0)
  {
    v29 = round(v24);
  }
  else
  {
    v25 = floor(v24);
    -[UIScrollView contentSize](self, "contentSize");
    v27 = v26;
    -[UIView bounds](self, "bounds");
    v29 = v25 + round(self->_accuracy * (v27 - v28 - v25)) / self->_accuracy;
  }
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(v7 == v29) << 33);
  -[UIScrollView zoomScale](self, "zoomScale");
  v31 = v30;
  -[UIScrollView minimumZoomScale](self, "minimumZoomScale");
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)(vabdd_f64(v31, v32) < 0.00000011920929) << 29);
}

- (void)willAnimateRotationToInterfaceOrientation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  double v13;
  double v14;
  int v15;
  double x;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  double y;
  double v27;
  double v28;
  double v29;
  double v30;
  double accuracy;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;

  v36 = a3;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20000000) != 0)
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    v9 = v13;
    v11 = v14;
  }
  else
  {
    -[UIScrollView zoomScale](self, "zoomScale");
    v5 = v4;
    -[UIScrollView minimumZoomScale](self, "minimumZoomScale");
    v7 = v6;
    -[UIScrollView contentOffset](self, "contentOffset");
    v9 = v8;
    v11 = v10;
    if (v5 >= v7)
    {
      v12 = 1;
      goto LABEL_7;
    }
  }
  if (!-[UIScrollView _canScrollX](self, "_canScrollX"))
  {
    v18 = v9;
    goto LABEL_15;
  }
  v12 = 0;
LABEL_7:
  v15 = *((_DWORD *)&self->_scrollViewFlags + 4) & 1;
  if (((*((_DWORD *)&self->_scrollViewFlags + 3) >> 30) & 1) == v15)
  {
    x = self->_rotationCenterPoint.x;
    -[UIView bounds](self, "bounds");
    v18 = x + v17 * -0.5;
    if ((v12 & 1) != 0)
      goto LABEL_16;
LABEL_15:
    v22 = -[UIScrollView _canScrollY](self, "_canScrollY");
    v23 = v11;
    if (!v22)
      goto LABEL_21;
    goto LABEL_16;
  }
  if (v15)
  {
    -[UIScrollView contentSize](self, "contentSize");
    v20 = v19;
    -[UIView bounds](self, "bounds");
    v18 = v20 - v21;
    if ((v12 & 1) != 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v18 = v9;
  if ((v12 & 1) == 0)
    goto LABEL_15;
LABEL_16:
  v24 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  v25 = (v24 >> 33) & 1;
  if ((_DWORD)v25 == v24 >> 31)
  {
    y = self->_rotationCenterPoint.y;
    -[UIView bounds](self, "bounds");
    v23 = y + v27 * -0.5;
  }
  else if ((_DWORD)v25)
  {
    -[UIScrollView contentSize](self, "contentSize");
    v29 = v28;
    -[UIView bounds](self, "bounds");
    v23 = v29 - v30;
  }
  else
  {
    v23 = v11;
  }
LABEL_21:
  if (v9 != v18 || v11 != v23)
  {
    accuracy = self->_accuracy;
    if (accuracy == 1.0)
    {
      v33 = round(v18);
      v35 = round(v23);
    }
    else
    {
      v32 = floor(v18);
      v33 = v32 + round((v18 - v32) * accuracy) / accuracy;
      v34 = floor(v23);
      v35 = v34 + round((v23 - v34) * accuracy) / accuracy;
    }
    -[UIScrollView setContentOffset:](self, "setContentOffset:", v33, v35);
    -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
  }

}

- (void)_registerForRotation:(BOOL)a3 ofWindow:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    v9 = v6;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
    {
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_willRotateToInterfaceOrientation_, CFSTR("UIWindowWillRotateNotification"), v9);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_willAnimateRotationToInterfaceOrientation_, CFSTR("UIWindowWillAnimateRotationNotification"), v9);
    }
    else
    {
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("UIWindowWillRotateNotification"), v9);
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("UIWindowWillAnimateRotationNotification"), v9);
    }

    v6 = v9;
  }

}

- (BOOL)preservesCenterDuringRotation
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 26) & 1;
}

- (void)setPreservesCenterDuringRotation:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if (((((v3 & 0x4000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    v6 = 0x4000000;
    if (!a3)
      v6 = 0;
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFFFFFFFBFFFFFFLL | v6;
    -[UIView window](self, "window");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIScrollView _registerForRotation:ofWindow:](self, "_registerForRotation:ofWindow:", v4, v7);

  }
}

- (void)_flashScrollIndicatorsPersistingPreviousFlashes
{
  -[UIScrollView _flashScrollIndicatorsForAxes:persistingPreviousFlashes:](self, "_flashScrollIndicatorsForAxes:persistingPreviousFlashes:", 3, 1);
}

- (void)withScrollIndicatorsShownForContentOffsetChanges:(id)a3
{
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  _BOOL4 v4;

  p_scrollViewFlags = &self->_scrollViewFlags;
  v4 = self->_scrollViewFlags.shouldRevealScrollIndicators != 0;
  self->_scrollViewFlags.shouldRevealScrollIndicators = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  p_scrollViewFlags->shouldRevealScrollIndicators = v4;
}

- (void)_setShowsBackgroundShadow:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  UIImageView *v12;
  void *v13;
  uint64_t v14;
  id *shadows;
  id v16;
  id v17;
  uint64_t i;
  const __CFString *v19;
  CGAffineTransform v20;

  if ((((self->_shadows == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      self->_shadows = (id *)malloc_type_calloc(8uLL, 0xAuLL, 0xBA5D8A51uLL);
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceIdiom");

      v6 = 0;
      if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v7 = CFSTR("UIScrollerShadowEdgeFill.png");
      else
        v7 = CFSTR("UIScrollerShadowFill.png");
      v8 = CFSTR("UIScrollerContentShadowFill.png");
      if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        v8 = CFSTR("UIScrollerShadowFill.png");
      v19 = v8;
      if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v9 = CFSTR("UIScrollerContentShadowCorner.png");
      else
        v9 = CFSTR("UIScrollerShadowCorner.png");
      do
      {
        v10 = (__CFString *)v7;
        if (v6 >= 2)
        {
          v11 = (__CFString *)v19;
          if (v6 >= 6)
            v11 = (__CFString *)v9;
          v10 = v11;
        }
        v12 = [UIImageView alloc];
        _UIImageWithName(v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[UIImageView initWithImage:](v12, "initWithImage:", v13);
        shadows = self->_shadows;
        v16 = shadows[v6];
        shadows[v6] = (id)v14;

        v17 = self->_shadows[v6];
        CGAffineTransformMakeRotation(&v20, __shadowRotations[v6]);
        objc_msgSend(v17, "setTransform:", &v20);
        -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadows[v6], 0);

        ++v6;
      }
      while (v6 != 10);
      -[UIScrollView _adjustBackgroundShadowsForContentSizeForcedVisible:](self, "_adjustBackgroundShadowsForContentSizeForcedVisible:", 0);
    }
    else
    {
      for (i = 0; i != 10; ++i)
        objc_msgSend(self->_shadows[i], "removeFromSuperview");
      free(self->_shadows);
      self->_shadows = 0;
    }
  }
}

- (CGPoint)_clampScrollOffsetToBounds:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double accuracy;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double height;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  v15 = self->_firstPageOffset.horizontal - v14;
  if (accuracy == 1.0)
  {
    v19 = round(v15);
    v25 = round(round(v12 + self->_contentSize.width) - v7);
    v30 = round(self->_firstPageOffset.vertical - v10);
    v34 = round(round(v11 + self->_contentSize.height) - v9);
  }
  else
  {
    v16 = floor(v15);
    v17 = v16 + round(accuracy * (v15 - v16)) / accuracy;
    v18 = floor(v17);
    v19 = v18 + round(accuracy * (v17 - v18)) / accuracy;
    height = self->_contentSize.height;
    v21 = v12 + self->_contentSize.width;
    v22 = floor(v21);
    v23 = v22 + round(accuracy * (v21 - v22)) / accuracy - v7;
    v24 = floor(v23);
    v25 = v24 + round(accuracy * (v23 - v24)) / accuracy;
    v26 = self->_firstPageOffset.vertical - v10;
    v27 = floor(v26);
    v28 = v27 + round(accuracy * (v26 - v27)) / accuracy;
    v29 = floor(v28);
    v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
    v31 = floor(v11 + height);
    v32 = v31 + round(accuracy * (v11 + height - v31)) / accuracy - v9;
    v33 = floor(v32);
    v34 = v33 + round(accuracy * (v32 - v33)) / accuracy;
  }
  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  v36 = v35;
  v38 = v19 - v37;
  v40 = v30 - v39;
  -[UIScrollView _maxTopOffsetAdjustedForRevealableContentPadding:](self, "_maxTopOffsetAdjustedForRevealableContentPadding:", v34 + v41);
  if (x >= v38)
  {
    if (x > v25 + v36)
    {
      if (v25 + v36 <= v38)
        x = v38;
      else
        x = v25 + v36;
    }
  }
  else
  {
    x = v38;
  }
  if (y >= v40)
  {
    if (y > v42)
    {
      if (v42 <= v40)
        y = v40;
      else
        y = v42;
    }
  }
  else
  {
    y = v40;
  }
  v43 = x;
  v44 = y;
  result.y = v44;
  result.x = v43;
  return result;
}

- (CGPoint)_newScrollOffsetForScrubReturningAnimated:(BOOL *)a3
{
  unint64_t v4;
  uint64_t v5;
  double startOffsetX;
  double startOffsetY;
  double v8;
  double v9;
  double v10;
  double left;
  double right;
  double v13;
  double v14;
  double top;
  double bottom;
  double v17;
  double v18;
  double accuracy;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double height;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double width;
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
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  CGPoint result;

  v4 = *((unsigned int *)&self->_scrollViewFlags + 5);
  v5 = (v4 >> 11) & 0xF;
  startOffsetX = self->_startOffsetX;
  startOffsetY = self->_startOffsetY;
  *a3 = 0;
  -[UIView bounds](self, "bounds");
  v10 = v8;
  left = self->_knobRelativeContentInsets.left;
  right = self->_knobRelativeContentInsets.right;
  v62 = self->_knobRelativeIndicatorInsets.left;
  v13 = self->_knobRelativeIndicatorInsets.right;
  if (((v4 >> 11) & 0xD) == 1)
  {
    v14 = v9;
    v58 = self->_knobRelativeIndicatorInsets.right;
    v59 = self->_knobRelativeContentInsets.right;
    v60 = self->_knobRelativeContentInsets.left;
    v61 = v8;
    top = self->_knobRelativeContentInsets.top;
    bottom = self->_knobRelativeContentInsets.bottom;
    v17 = self->_knobRelativeIndicatorInsets.top;
    v18 = self->_knobRelativeIndicatorInsets.bottom;
    accuracy = self->_accuracy;
    if (accuracy == 1.0)
    {
      v21 = round(v9);
    }
    else
    {
      v20 = floor(v9);
      v21 = v20 + round((v9 - v20) * accuracy) / accuracy;
    }
    -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
    v23 = v21 - (v17 + v22);
    -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
    v25 = v23 - (v18 + v24);
    -[UIScrollViewPanGestureRecognizer translationInView:](self->_pan, "translationInView:", self);
    height = self->_contentSize.height;
    v28 = startOffsetY + v27 / v25 * (bottom + top + height);
    v29 = self->_accuracy;
    v30 = bottom + height;
    if (v29 == 1.0)
    {
      v32 = round(v30);
      v35 = round(self->_firstPageOffset.vertical - top);
    }
    else
    {
      v31 = floor(v30);
      v32 = v31 + round(v29 * (v30 - v31)) / v29;
      v33 = self->_firstPageOffset.vertical - top;
      v34 = floor(v33);
      v35 = v34 + round(v29 * (v33 - v34)) / v29;
    }
    left = v60;
    v10 = v61;
    -[UIScrollView _rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:](self, "_rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:", 0, v28, v32 - v14, v35, v25 * 0.8);
    startOffsetY = v36;
    v13 = v58;
    right = v59;
  }
  if (v5 == 4 || v5 == 2)
  {
    v38 = self->_accuracy;
    if (v38 == 1.0)
    {
      v40 = round(v10);
    }
    else
    {
      v39 = floor(v10);
      v40 = v39 + round((v10 - v39) * v38) / v38;
    }
    -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
    v42 = v40 - (v62 + v41);
    -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
    v44 = v42 - (v13 + v43);
    -[UIScrollViewPanGestureRecognizer translationInView:](self->_pan, "translationInView:", self);
    width = self->_contentSize.width;
    v47 = startOffsetX + v46 / v44 * (right + left + width);
    v48 = self->_accuracy;
    v49 = right + width;
    if (v48 == 1.0)
    {
      v51 = round(v49);
      v54 = round(self->_firstPageOffset.horizontal - left);
    }
    else
    {
      v50 = floor(v49);
      v51 = v50 + round(v48 * (v49 - v50)) / v48;
      v52 = self->_firstPageOffset.horizontal - left;
      v53 = floor(v52);
      v54 = v53 + round(v48 * (v52 - v53)) / v48;
    }
    -[UIScrollView _rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:](self, "_rubberBandOffsetForOffset:maxOffset:minOffset:range:outside:", 0, v47, v51 - v10, v54, v44 * 0.8);
    startOffsetX = v55;
  }
  v56 = startOffsetX;
  v57 = startOffsetY;
  result.y = v57;
  result.x = v56;
  return result;
}

- (void)_updatePanGesture
{
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  unsigned int v18;
  double startOffsetX;
  double v20;
  double startOffsetY;
  double *p_horizontalVelocity;
  double *p_verticalVelocity;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _UIScrollViewScrollableAncestor *scrollableAncestor;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double accuracy;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  BOOL v71;
  double v72;
  long double v73;
  double velocityScaleFactor;
  double v75;
  double v76;
  double v77;
  double v78;
  float v79;
  double v80;
  double v81;
  double v82;
  int v83;
  int64_t fastScrollCount;
  double v85;
  int v86;
  _BOOL4 v87;
  int v88;
  double v89;
  double discreteFastScrollLastHighVelocityEventTime;
  int v91;
  double v92;
  float v93;
  int64_t discreteFastScrollCount;
  uint64_t v95;
  double v96;
  int v97;
  double v98;
  double v99;
  double v100;
  UIScrollViewPinchGestureRecognizer *pinch;
  void *v102;
  int v103;
  unint64_t v104;
  NSObject *v105;
  objc_class *v106;
  id v107;
  UIGestureRecognizerState v108;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  double v113;
  id WeakRetained;
  double v115;
  double v116;
  char v117;
  id v118;
  double *v119;
  double v120;
  double v121;
  _BYTE *v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  _BOOL4 v129;
  _BOOL4 v130;
  float v131;
  float v132;
  double v133;
  double v134;
  int v135;
  _QWORD v136[7];
  id v137;
  BOOL v138;
  __int16 v139;
  uint8_t buf[4];
  id v141;
  __int16 v142;
  UIScrollView *v143;
  __int16 v144;
  UIGestureRecognizerState v145;
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*((_BYTE *)&self->_scrollViewFlags + 2) & 0x10) == 0
    && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x10) == 0)
  {
    -[UIGestureRecognizer _activeEventOfType:](self->_pan, "_activeEventOfType:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIPanGestureRecognizer numberOfTouches](self->_pan, "numberOfTouches"))
    {
      -[UIPanGestureRecognizer _activeTouches]((id *)&self->_pan->super.super.super.isa);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "_isPointerTouch"))
      {
        if ((*((_DWORD *)p_scrollViewFlags + 5) & 0x7800) == 0
          && -[UIGestureRecognizer state](self->_pan, "state") == UIGestureRecognizerStateBegan
          && -[UIGestureRecognizer state](self->_knobPointerLongPressGestureRecognizer, "state") == UIGestureRecognizerStateBegan)
        {
          -[UIScrollView _beginDirectManipulationIfNecessaryWithGestureRecognizer:](self, "_beginDirectManipulationIfNecessaryWithGestureRecognizer:", self->_knobPointerLongPressGestureRecognizer);
        }
        v7 = -[UIScrollView _supportsPointerDragScrolling](self, "_supportsPointerDragScrolling");
        if ((*((_DWORD *)p_scrollViewFlags + 5) & 0x7800) == 0 && !v7)
          goto LABEL_173;
      }

    }
    if ((*(_QWORD *)p_scrollViewFlags & 2) == 0)
    {
      v9 = *(_QWORD *)((char *)p_scrollViewFlags + 12);
      *(_QWORD *)p_scrollViewFlags |= 2uLL;
      *(_QWORD *)((char *)p_scrollViewFlags + 12) = v9 & 0xFFF7FEFFFFFFFFFFLL | 0x10000000000;
      if (!-[UIPanGestureRecognizer numberOfTouches](self->_pan, "numberOfTouches"))
        *((_DWORD *)p_scrollViewFlags + 5) &= 0xFFFF87FF;
    }
    -[UIView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    *(_QWORD *)p_scrollViewFlags |= 0x800000uLL;
    if (-[UIGestureRecognizer state](self->_pan, "state") == UIGestureRecognizerStateBegan)
    {
      if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self)
        || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
      {
        -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 1, 0);
      }
      -[UIScrollView _updateAccessories](self, "_updateAccessories");
      -[UIScrollView _scrollViewWillBeginDragging](self, "_scrollViewWillBeginDragging");
      -[_UIScrollViewScrollingAnimator cancelInteractiveScroll](self->_keyboardScrollingAnimator, "cancelInteractiveScroll");
      -[UIScrollView _setKnobInteractionGestureDelayed:](self, "_setKnobInteractionGestureDelayed:", 1);
      if ((*(_BYTE *)p_scrollViewFlags & 2) == 0)
        goto LABEL_174;
    }
    if (!self->_scrollHeartbeat)
      -[UIScrollView _pushTrackingRunLoopModeIfNecessaryForReason:](self, "_pushTrackingRunLoopModeIfNecessaryForReason:", CFSTR("updatePanGesture starting to drag"));
    -[UIScrollView _bumpTrackingWatchdogTimer](self, "_bumpTrackingWatchdogTimer");
    if (-[UIScrollViewPanGestureRecognizer _beganCaughtDeceleratingScrollViewAndMoved](self->_pan, "_beganCaughtDeceleratingScrollViewAndMoved"))
    {
      -[UIScrollView _adjustStartOffsetForGrabbedBouncingScrollView](self, "_adjustStartOffsetForGrabbedBouncingScrollView");
    }
    -[UIScrollViewPanGestureRecognizer translationInView:](self->_pan, "translationInView:", self);
    v127 = v15;
    v128 = v14;
    v16 = v14;
    *(float *)&v14 = v15;
    v132 = *(float *)&v14;
    v17 = *(float *)&v14;
    v18 = *(_BYTE *)p_scrollViewFlags;
    v129 = -[UIScrollView alwaysBounceHorizontal](self, "alwaysBounceHorizontal");
    v130 = -[UIScrollView alwaysBounceVertical](self, "alwaysBounceVertical");
    v139 = 0;
    startOffsetX = self->_startOffsetX;
    v131 = v16;
    v20 = v16;
    startOffsetY = self->_startOffsetY;
    v138 = 0;
    p_horizontalVelocity = &self->_horizontalVelocity;
    self->_previousHorizontalVelocity = self->_horizontalVelocity;
    p_verticalVelocity = &self->_verticalVelocity;
    self->_previousVerticalVelocity = self->_verticalVelocity;
    -[UIScrollViewPanGestureRecognizer velocityInView:](self->_pan, "velocityInView:", self);
    v25 = v24;
    v27 = v26;
    self->_horizontalVelocity = -(v24 * self->_velocityScaleFactor);
    self->_verticalVelocity = -(v26 * self->_velocityScaleFactor);
    v133 = v11;
    v134 = v13;
    if (v4 && !objc_msgSend(v4, "_scrollType"))
    {
      if (((_UIInternalPreferenceUsesDefault(&_MergedGlobals_117, (uint64_t)CFSTR("DiscreteScrollAnimationEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD769EC)&& !_AXSReduceMotionEnabled())
      {
        -[UIView window](self, "window");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v126 != 0;

      }
      else
      {
        v138 = 0;
      }
      v135 = 1;
    }
    else
    {
      v135 = 0;
    }
    v28 = startOffsetX - v20;
    v29 = startOffsetY - v17;
    scrollableAncestor = self->_scrollableAncestor;
    if (scrollableAncestor)
    {
      v31 = self->_startOffsetX;
      v32 = self->_startOffsetY;
      v137 = 0;
      -[_UIScrollViewScrollableAncestor _scrollView:adjustedUnconstrainedOffsetForUnconstrainedOffset:startOffset:horizontalVelocity:verticalVelocity:animator:](scrollableAncestor, "_scrollView:adjustedUnconstrainedOffsetForUnconstrainedOffset:startOffset:horizontalVelocity:verticalVelocity:animator:", self, &self->_horizontalVelocity, &self->_verticalVelocity, &v137, v28, v29, v31, v32);
      v34 = v33;
      v36 = v35;
      v37 = v137;
      v28 = v34 - (v31 - self->_startOffsetX);
      v29 = v36 - (v32 - self->_startOffsetY);
    }
    else
    {
      v37 = 0;
    }
    v38 = (v18 >> 2) & 1;
    v39 = (v18 >> 3) & 1;
    if (!-[UIScrollViewPanGestureRecognizer _caughtDeceleratingScrollView](self->_pan, "_caughtDeceleratingScrollView"))
    {
      if ((*((_DWORD *)p_scrollViewFlags + 5) & 0x7800) != 0)
      {
        -[UIScrollView _newScrollOffsetForScrubReturningAnimated:](self, "_newScrollOffsetForScrubReturningAnimated:", &v138);
        v28 = v40;
        v29 = v41;
      }
      else
      {
        if (-[UIScrollViewPanGestureRecognizer _allowsBounce](self->_pan, "_allowsBounce"))
        {
          if (self->_currentScrollDeviceCategory == 6)
          {
            -[UIScrollView _rubberBandingReversalOffsetForOriginalOffset:velocity:currentPanTranslation:](self, "_rubberBandingReversalOffsetForOriginalOffset:velocity:currentPanTranslation:", v28, v29, v25, v27, v128, v127);
            v28 = v28 - v42;
            v29 = v29 - v43;
            v44 = v42 + v20;
            v45 = v43 + v17;
            -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, v44, v45);
          }
          else
          {
            v44 = v131;
            v45 = v132;
          }
          -[UIScrollView _rubberBandContentOffsetForOffset:outsideX:outsideY:](self, "_rubberBandContentOffsetForOffset:outsideX:outsideY:", (char *)&v139 + 1, &v139, v28, v29);
          v28 = v124;
          v29 = v125;
LABEL_46:
          -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
          accuracy = self->_accuracy;
          v53 = v52 + v51 + self->_contentSize.width;
          if (accuracy == 1.0)
          {
            v55 = round(v53);
            v57 = round(v133);
          }
          else
          {
            v54 = floor(v53);
            v55 = v54 + round(accuracy * (v53 - v54)) / accuracy;
            v56 = floor(v133);
            v57 = v56 + round((v133 - v56) * accuracy) / accuracy;
          }
          if (v55 <= v57 && (v129 & v39 & 1) == 0)
          {
            *p_horizontalVelocity = 0.0;
            accuracy = self->_accuracy;
          }
          v58 = v49 + v48 + self->_contentSize.height;
          if (accuracy == 1.0)
          {
            v60 = round(v58);
            v62 = round(v134);
          }
          else
          {
            v59 = floor(v58);
            v60 = v59 + round(accuracy * (v58 - v59)) / accuracy;
            v61 = floor(v134);
            v62 = v61 + round((v134 - v61) * accuracy) / accuracy;
          }
          if (v60 <= v62 && (v130 & v38 & 1) == 0)
            *p_verticalVelocity = 0.0;
          v63 = *((_DWORD *)p_scrollViewFlags + 5);
          v64 = *(_QWORD *)((char *)p_scrollViewFlags + 12);
          if ((v64 & 0x20) == 0)
          {
            v6 = v37;
            goto LABEL_70;
          }
          v6 = v37;
          if (v44 >= 0.0)
          {
            if (v44 <= 0.0)
              goto LABEL_65;
            v65 = -129;
          }
          else
          {
            v65 = -65;
          }
          v64 &= v65;
          *(_QWORD *)((char *)p_scrollViewFlags + 12) = v64;
          *((_DWORD *)p_scrollViewFlags + 5) = v63;
LABEL_65:
          if (v45 >= 0.0)
          {
            if (v45 <= 0.0)
              goto LABEL_70;
            v66 = -513;
          }
          else
          {
            v66 = -257;
          }
          v64 &= v66;
          *(_QWORD *)((char *)p_scrollViewFlags + 12) = v64;
          *((_DWORD *)p_scrollViewFlags + 5) = v63;
LABEL_70:
          v67 = *p_horizontalVelocity;
          if (*p_horizontalVelocity == 0.0)
          {
            v69 = *p_verticalVelocity;
            if (*p_verticalVelocity == 0.0)
              goto LABEL_86;
          }
          else
          {
            if (HIBYTE(v139))
              goto LABEL_83;
            v68 = 1.0;
            if (v67 < 0.0)
              v68 = 0.0;
            if (v68 != (double)((v64 >> 10) & 1))
              goto LABEL_83;
            v69 = *p_verticalVelocity;
            if (*p_verticalVelocity == 0.0)
              goto LABEL_82;
          }
          if (!(_BYTE)v139)
          {
            v70 = 1.0;
            if (v69 < 0.0)
              v70 = 0.0;
            if (v70 == (double)((v64 >> 11) & 1))
            {
LABEL_82:
              if (v67 * v67 + v69 * v69 >= 0.0169)
                goto LABEL_86;
            }
          }
LABEL_83:
          if (self->_fastScrollCount >= 1)
          {
            self->_fastScrollCount = 0;
            self->_fastScrollMultiplier = 1.0;
            v64 = *(_QWORD *)((char *)p_scrollViewFlags + 12);
            v63 = *((_DWORD *)p_scrollViewFlags + 5);
          }
          v64 &= 0xFFFFFFFFFFFFFC3FLL;
          *(_QWORD *)((char *)p_scrollViewFlags + 12) = v64;
          *((_DWORD *)p_scrollViewFlags + 5) = v63;
          v67 = *p_horizontalVelocity;
LABEL_86:
          v71 = v67 < 0.0;
          if (v67 != 0.0)
          {
            v72 = 1.0;
            if (v71)
              v72 = 0.0;
            v64 = v64 & 0xFFFFFFFFFFFFFBFFLL | ((v72 & 1) << 10);
            *((_DWORD *)p_scrollViewFlags + 5) = v63;
            *(_QWORD *)((char *)p_scrollViewFlags + 12) = v64;
          }
          v73 = *p_verticalVelocity;
          if (*p_verticalVelocity != 0.0)
          {
            v73 = 1.0;
            if (*p_verticalVelocity < 0.0)
              v73 = 0.0;
            *((_DWORD *)p_scrollViewFlags + 5) = v63;
            *(_QWORD *)((char *)p_scrollViewFlags + 12) = v64 & 0xFFFFFFFFFFFFF7FFLL | ((v73 & 1) << 11);
          }
          if (!v135)
          {
            fastScrollCount = self->_fastScrollCount;
            if (fastScrollCount < 3)
              goto LABEL_145;
            goto LABEL_138;
          }
          -[UIScrollViewPanGestureRecognizer _velocityIncludingDiscreteScrollInView:](self->_pan, "_velocityIncludingDiscreteScrollInView:", self, (double)v73);
          velocityScaleFactor = self->_velocityScaleFactor;
          v76 = v75 * velocityScaleFactor;
          v78 = v77 * velocityScaleFactor;
          *(float *)&v75 = v75 * velocityScaleFactor;
          *(float *)&v77 = v77 * velocityScaleFactor;
          v79 = hypotf(*(float *)&v75, *(float *)&v77);
          if (v76 == 0.0)
            v80 = v44;
          else
            v80 = v76;
          if (v78 == 0.0)
            v78 = v45;
          if (v78 >= 0.0)
            v81 = 1.0;
          else
            v81 = 0.0;
          if (v80 >= 0.0)
            v82 = 1.0;
          else
            v82 = 0.0;
          if (v80 == 0.0)
          {
            v83 = 0;
          }
          else if (HIBYTE(v139))
          {
            v83 = 1;
          }
          else
          {
            v83 = (v82 != 0.0) ^ (*(_QWORD *)((char *)p_scrollViewFlags + 12) >> 10) & 1;
          }
          v85 = v79;
          if (v78 == 0.0)
          {
            v86 = 0;
          }
          else
          {
            if ((_BYTE)v139)
              goto LABEL_121;
            v86 = (v81 != 0.0) ^ (*(_QWORD *)((char *)p_scrollViewFlags + 12) >> 11) & 1;
          }
          v87 = v79 > 0.0;
          if (v85 >= 0.13)
            v87 = 0;
          if (((v83 | v86) & 1) == 0 && !v87)
          {
LABEL_122:
            if (v80 != 0.0)
              *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(v82 != 0.0) << 10);
            if (v78 != 0.0)
              *(_QWORD *)((char *)p_scrollViewFlags + 12) = *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(v81 != 0.0) << 11);
            if ((_UIInternalPreferenceUsesDefault(&dword_1ECD769F0, (uint64_t)CFSTR("DiscreteFastScrollEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD769F4)
            {
              v88 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76A78, (uint64_t)CFSTR("DiscreteFastScrollTriggerVelocity"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
              v73 = *(double *)&qword_1ECD76A80;
              if (v88)
                v73 = 0.6;
              if (v73 <= v85)
              {
                objc_msgSend(v4, "timestamp");
                v89 = v73;
                discreteFastScrollLastHighVelocityEventTime = self->_discreteFastScrollLastHighVelocityEventTime;
                if (discreteFastScrollLastHighVelocityEventTime != 0.0)
                {
                  v91 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76A68, (uint64_t)CFSTR("DiscreteFastScrollIntervalBetweenEvents"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
                  v92 = *(double *)&qword_1ECD76A70;
                  if (v91)
                    v92 = 0.075;
                  v73 = discreteFastScrollLastHighVelocityEventTime + v92;
                  if (v89 >= v73)
                  {
                    ++self->_discreteFastScrollCount;
                    self->_discreteFastScrollEndTime = v89;
                  }
                }
                self->_discreteFastScrollLastHighVelocityEventTime = v89;
              }
            }
            fastScrollCount = self->_fastScrollCount;
            if (fastScrollCount <= 2)
            {
              discreteFastScrollCount = self->_discreteFastScrollCount;
              v95 = discreteFastScrollCount - 3;
              if (discreteFastScrollCount >= 3)
              {
                v73 = hypot(v28 - self->_startOffsetX, v29 - self->_startOffsetY);
                if (v73 > 0.0)
                {
                  v96 = v73;
                  v97 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76A88, (uint64_t)CFSTR("DiscreteFastScrollDistanceScale"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
                  v98 = *(double *)&qword_1ECD76A90;
                  if (v97)
                    v98 = 240.0;
                  v73 = fmin(self->_discreteFastScrollStartMultiplier + ((double)v95 * 0.5 + 1.0) * fmin(v96 / v98, 0.9), 16.0);
                  if (self->_discreteFastScrollMultiplier != v73)
                  {
                    self->_discreteFastScrollMultiplier = v73;
                    -[UIScrollView contentOffset](self, "contentOffset");
                    self->_startOffsetX = v99;
                    -[UIScrollView contentOffset](self, "contentOffset");
                    self->_startOffsetY = v100;
                    -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
                    -[UIScrollViewPanGestureRecognizer _setDiscreteFastScrollMultiplier:](self->_pan, "_setDiscreteFastScrollMultiplier:", self->_discreteFastScrollMultiplier);
                  }
                }
              }
LABEL_145:
              pinch = self->_pinch;
              if (pinch
                && -[UIGestureRecognizer state](pinch, "state", (double)v73)
                && -[UIGestureRecognizer numberOfTouches](self->_pinch, "numberOfTouches") > 1)
              {
                goto LABEL_172;
              }
              -[UIView window](self, "window", (double)v73);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = objc_msgSend(v102, "_systemGestureRecognitionIsPossible");

              if (v103)
              {
                v104 = _updatePanGesture___s_category;
                if (!_updatePanGesture___s_category)
                {
                  v104 = __UILogCategoryGetNode("EventDispatch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v104, (unint64_t *)&_updatePanGesture___s_category);
                }
                v105 = *(id *)(v104 + 8);
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  v106 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v106);
                  v107 = (id)objc_claimAutoreleasedReturnValue();
                  v108 = -[UIGestureRecognizer state](self->_pan, "state");
                  *(_DWORD *)buf = 138543874;
                  v141 = v107;
                  v142 = 2048;
                  v143 = self;
                  v144 = 2048;
                  v145 = v108;
                  _os_log_impl(&dword_185066000, v105, OS_LOG_TYPE_DEFAULT, "Scroll view <%{public}@ %p> ignoring pan gesture (state %ld) because system gestures are possible", buf, 0x20u);

                }
                goto LABEL_171;
              }
              v109 = *(_QWORD *)((char *)p_scrollViewFlags + 12);
              *(_QWORD *)((char *)p_scrollViewFlags + 12) = v109 | 0x80000;
              if ((v109 & 0x10000000000000) != 0)
              {
                -[UIPanGestureRecognizer locationInView:](self->_pan, "locationInView:", self);
                v111 = v110;
                v113 = v112;
                WeakRetained = objc_loadWeakRetained(&self->_delegate);
                objc_msgSend(WeakRetained, "_scrollView:adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:", self, &self->_horizontalVelocity, &self->_verticalVelocity, v28, v29, v128, v127, self->_startOffsetX, self->_startOffsetY, v111, v113);
                v28 = v115;
                v29 = v116;

              }
              if (v6)
              {
                v136[0] = MEMORY[0x1E0C809B0];
                v136[1] = 3221225472;
                v136[2] = __33__UIScrollView__updatePanGesture__block_invoke;
                v136[3] = &unk_1E16B4E70;
                v136[4] = self;
                *(double *)&v136[5] = v28;
                *(double *)&v136[6] = v29;
                objc_msgSend(v6, "addAnimations:", v136);
                objc_msgSend(v6, "startAnimation");
              }
              else
              {
                v117 = v135 ^ 1;
                if (!v138)
                  v117 = 1;
                if ((v117 & 1) == 0)
                {
                  v118 = objc_loadWeakRetained((id *)&self->_animation);

                  if (v118)
                  {
                    v119 = (double *)objc_loadWeakRetained((id *)&self->_animation);
                    v121 = v119[13];
                    v120 = v119[14];

                    if (v28 == v121 && v29 == v120)
                      goto LABEL_169;
                    v122 = objc_loadWeakRetained((id *)&self->_animation);
                    v122[153] = 1;

                  }
                  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76A58, (uint64_t)CFSTR("DiscreteScrollAnimationDuration"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v123 = 0.067;
                  else
                    v123 = *(double *)&qword_1ECD76A60;
                  -[UIScrollView _setContentOffset:duration:animationCurve:animationConfigurator:](self, "_setContentOffset:duration:animationCurve:animationConfigurator:", 0, &__block_literal_global_654, v28, v29, v123);
                  goto LABEL_169;
                }
                -[UIScrollView setContentOffset:](self, "setContentOffset:", v28, v29);
              }
LABEL_169:
              if ((unint64_t)(-[UIScrollView keyboardDismissMode](self, "keyboardDismissMode") - 1) > 3)
              {
LABEL_172:
                self->_lastUpdateTime = CACurrentMediaTime();
LABEL_173:

LABEL_174:
                return;
              }
              +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
              v105 = objc_claimAutoreleasedReturnValue();
              -[NSObject scrollView:didPanWithGesture:](v105, "scrollView:didPanWithGesture:", self, self->_pan);
LABEL_171:

              goto LABEL_172;
            }
LABEL_138:
            v93 = (v28 - self->_startOffsetX) * (v28 - self->_startOffsetX)
                + (v29 - self->_startOffsetY) * (v29 - self->_startOffsetY);
            v73 = fmin(self->_fastScrollStartMultiplier+ ((double)(fastScrollCount - 3) * 0.5 + 1.0) * fmin(sqrtf(v93) / 240.0, 0.9), 16.0);
            self->_fastScrollMultiplier = v73;
            goto LABEL_145;
          }
LABEL_121:
          -[UIScrollView _resetDiscreteFastScroll](self, "_resetDiscreteFastScroll");
          goto LABEL_122;
        }
        -[UIScrollView _clampScrollOffsetToBounds:](self, "_clampScrollOffsetToBounds:", v28, v29);
        v28 = v46;
        v29 = v47;
        -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, self->_startOffsetX - v46, self->_startOffsetY - v47);
      }
      v38 = 0;
      v39 = 0;
    }
    v44 = v131;
    v45 = v132;
    goto LABEL_46;
  }
}

uint64_t __33__UIScrollView__updatePanGesture__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __33__UIScrollView__updatePanGesture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 152) = 1;
}

- (CGPoint)_rubberBandingReversalOffsetForOriginalOffset:(CGPoint)a3 velocity:(CGPoint)a4 currentPanTranslation:(CGPoint)a5
{
  double v5;
  double v6;
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
  double v23;
  double v24;
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  CGPoint result;

  y = a4.y;
  v29 = a5.y;
  x = a5.x;
  v27 = a3.y;
  v5 = a4.x;
  v6 = a3.x;
  -[UIScrollView contentOffset](self, "contentOffset");
  v9 = v8;
  v25 = v10;
  -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
  v12 = v11;
  v14 = v13;
  -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset");
  v16 = v15;
  v18 = v17;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_GamePadRubberBandingReversalAccelerationCoefficient, (uint64_t)CFSTR("GamePadRubberBandingReversalAccelerationCoefficient"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v19 = 0.1;
  else
    v19 = *(double *)&qword_1EDDA8430;
  -[UIScrollView _rubberBandingReversalOffsetForOriginalOffset:contentMin:contentMax:contentOffset:velocity:currentDelta:rubberBandingCoefficient:](self, "_rubberBandingReversalOffsetForOriginalOffset:contentMin:contentMax:contentOffset:velocity:currentDelta:rubberBandingCoefficient:", v6, v12, v16, v9, v5, x, v19);
  v21 = v20;
  -[UIScrollView _rubberBandingReversalOffsetForOriginalOffset:contentMin:contentMax:contentOffset:velocity:currentDelta:rubberBandingCoefficient:](self, "_rubberBandingReversalOffsetForOriginalOffset:contentMin:contentMax:contentOffset:velocity:currentDelta:rubberBandingCoefficient:", v27, v14, v18, v25, y, v29, v19);
  v23 = v22;
  v24 = v21;
  result.y = v23;
  result.x = v24;
  return result;
}

- (double)_rubberBandingReversalOffsetForOriginalOffset:(double)a3 contentMin:(double)a4 contentMax:(double)a5 contentOffset:(double)a6 velocity:(double)a7 currentDelta:(double)a8 rubberBandingCoefficient:(double)a9
{
  double v9;
  BOOL v10;

  if (a6 >= a4 || a7 >= 0.0)
  {
    v10 = a7 <= 0.0 || a6 <= a5;
    v9 = a3 - a5;
    if (v10)
      v9 = 0.0;
  }
  else
  {
    v9 = a3 - a4;
  }
  return v9 * a9;
}

- (BOOL)_hasScrollViewWillEndDraggingInvocationsToPerform
{
  void *v3;
  char v4;
  id WeakRetained;

  if ((objc_opt_respondsToSelector() & 1) != 0
    || (-[UIScrollView _observerImplementingWillEndDraggingMethod](self, "_observerImplementingWillEndDraggingMethod"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)_performScrollViewWillEndDraggingInvocationsWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4 unclampedOriginalTarget:(CGPoint)a5
{
  double y;
  double x;
  double v8;
  double v9;
  _BOOL8 v11;
  id WeakRetained;
  char v13;
  id v14;
  id v15;

  y = a5.y;
  x = a5.x;
  v8 = a3.y;
  v9 = a3.x;
  v11 = -[UIScrollView _isAutomaticContentOffsetAdjustmentEnabled](self, "_isAutomaticContentOffsetAdjustmentEnabled");
  -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](self, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIScrollView _scrollViewWillEndDraggingWithVelocity:targetContentOffset:](self, "_scrollViewWillEndDraggingWithVelocity:targetContentOffset:", a4, v9, v8);
  -[UIScrollView _observerImplementingWillEndDraggingMethod](self, "_observerImplementingWillEndDraggingMethod");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v15, "_observeScrollView:willEndDraggingWithVelocity:targetContentOffset:unclampedOriginalTarget:", self, a4, v9, v8, x, y);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v14, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, a4, v9, v8);

  }
  -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](self, "_setAutomaticContentOffsetAdjustmentEnabled:", v11);

}

- (UIEdgeInsets)_collapsableContentPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  UIEdgeInsets result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = &unk_18685B0AF;
  v15 = 0u;
  v16 = 0u;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__UIScrollView__collapsableContentPadding__block_invoke;
  v10[3] = &unk_1E16EAAD0;
  v10[4] = self;
  v10[5] = &v11;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v10);
  v2 = v12[4];
  v3 = v12[5];
  v4 = v12[6];
  v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

double __42__UIScrollView__collapsableContentPadding__block_invoke(uint64_t a1, void *a2)
{
  double result;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(a2, "_collapsableContentPaddingForObservedScrollView:", *(_QWORD *)(a1 + 32));
    result = v5[4] + v6;
    v8 = v7 + v5[5];
    v10 = v9 + v5[6];
    v12 = v11 + v5[7];
    v13 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
    v13[4] = result;
    v13[5] = v8;
    v13[6] = v10;
    v13[7] = v12;
  }
  return result;
}

- (double)_maxTopOffsetAdjustedForRevealableContentPadding:(double)a3
{
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
  double accuracy;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double result;
  double v27;

  -[UIScrollView _revealableContentPaddingIncludingContentWithCollapsedAffinity:](self, "_revealableContentPaddingIncludingContentWithCollapsedAffinity:", 0);
  v6 = v5;
  v8 = v7;
  -[UIScrollView _collapsableContentPadding](self, "_collapsableContentPadding");
  v10 = v9;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v12 = v11;
  v14 = v13;
  -[UIView bounds](self, "bounds");
  accuracy = self->_accuracy;
  v17 = v14 + self->_contentSize.height;
  if (accuracy == 1.0)
  {
    v27 = v12 + v8 + round(v17);
    if (v6 + v27 > v15 && v27 - v10 < v15)
      v21 = v10 - v12;
    else
      v21 = a3;
    result = round(round(self->_firstPageOffset.vertical - v12) - v6);
  }
  else
  {
    v18 = floor(v17);
    v19 = v12 + v8 + v18 + round(accuracy * (v17 - v18)) / accuracy;
    v20 = v6 + v19 > v15 && v19 - v10 < v15;
    v21 = v10 - v12;
    if (!v20)
      v21 = a3;
    v22 = self->_firstPageOffset.vertical - v12;
    v23 = floor(v22);
    v24 = v23 + round(accuracy * (v22 - v23)) / accuracy - v6;
    v25 = floor(v24);
    result = v25 + round(accuracy * (v24 - v25)) / accuracy;
  }
  if (v21 >= result)
    return v21;
  return result;
}

- (double)_maxTopOffset
{
  double v3;
  double v4;
  double accuracy;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  v4 = v3;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  v7 = self->_firstPageOffset.vertical - v6;
  if (accuracy == 1.0)
    return round(round(v7) - v4);
  v8 = floor(v7);
  v9 = v8 + round(accuracy * (v7 - v8)) / accuracy - v4;
  v10 = floor(v9);
  return v10 + round(accuracy * (v9 - v10)) / accuracy;
}

- (BOOL)_scrollViewWillEndDraggingWithDeceleration:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
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
  double accuracy;
  UIOffset *p_firstPageOffset;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double height;
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
  double v38;
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
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  int *v51;
  long double v52;
  double fastScrollMultiplier;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double y;
  double x;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  float64x2_t v100;
  _BOOL4 v101;
  double v102;
  uint64_t v103;
  float64x2_t v104;
  double v105;
  double v106;
  BOOL v107;
  BOOL v108;
  double v109;
  double v110;
  double v111;
  double v112;
  BOOL v113;
  BOOL v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  int v121;
  double v122;
  int v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double horizontalVelocity;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double vertical;
  double verticalVelocity;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double horizontal;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  uint64_t v157;
  CGSize *p_adjustedDecelerationFactor;
  CGFloat v159;
  double v160;
  CGFloat width;
  CGFloat v162;
  double v163;
  uint64_t v164;
  unint64_t v165;
  double v166;
  double v167;
  double v168;
  double v169;
  long double v171;
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
  double v184;
  float64x2_t v185;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (!-[UIScrollView _hasScrollViewWillEndDraggingInvocationsToPerform](self, "_hasScrollViewWillEndDraggingInvocationsToPerform"))goto LABEL_181;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIScrollView contentOffset](self, "contentOffset");
  v11 = v10;
  v180 = v12;
  if (self->_horizontalVelocity >= 0.0)
    v13 = 0.01;
  else
    v13 = -0.01;
  if (self->_verticalVelocity >= 0.0)
    v14 = 0.01;
  else
    v14 = -0.01;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  p_firstPageOffset = &self->_firstPageOffset;
  v21 = self->_firstPageOffset.horizontal - v20;
  v182 = v9;
  v183 = v7;
  if (accuracy == 1.0)
  {
    v25 = round(v21);
    v31 = round(round(v17 + self->_contentSize.width) - v7);
    v36 = round(self->_firstPageOffset.vertical - v15);
    v40 = round(round(v16 + self->_contentSize.height) - v9);
  }
  else
  {
    v22 = floor(v21);
    v23 = v22 + round(accuracy * (v21 - v22)) / accuracy;
    v24 = floor(v23);
    v25 = v24 + round(accuracy * (v23 - v24)) / accuracy;
    height = self->_contentSize.height;
    v27 = v17 + self->_contentSize.width;
    v28 = floor(v27);
    v29 = v28 + round(accuracy * (v27 - v28)) / accuracy - v7;
    v30 = floor(v29);
    v31 = v30 + round(accuracy * (v29 - v30)) / accuracy;
    v32 = self->_firstPageOffset.vertical - v15;
    v33 = floor(v32);
    v34 = v33 + round(accuracy * (v32 - v33)) / accuracy;
    v35 = floor(v34);
    v36 = v35 + round(accuracy * (v34 - v35)) / accuracy;
    v37 = floor(v16 + height);
    v38 = v37 + round(accuracy * (v16 + height - v37)) / accuracy - v9;
    v39 = floor(v38);
    v40 = v39 + round(accuracy * (v38 - v39)) / accuracy;
  }
  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  v42 = v25 - v41;
  v44 = v31 + v43;
  v46 = v36 - v45;
  -[UIScrollView _maxTopOffsetAdjustedForRevealableContentPadding:](self, "_maxTopOffsetAdjustedForRevealableContentPadding:", v40 + v47);
  v49 = v48;
  p_scrollViewFlags = &self->_scrollViewFlags;
  v51 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    y = self->_pageDecelerationTarget.y;
    x = self->_pageDecelerationTarget.x;
  }
  else
  {
    self->_decelerationLnFactorH = log(self->_decelerationFactor.width);
    v52 = log(self->_decelerationFactor.height);
    self->_decelerationLnFactorV = v52;
    if (v3)
    {
      v51 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
      fastScrollMultiplier = self->_fastScrollMultiplier;
      v54 = v11 - (self->_horizontalVelocity - v13) / self->_decelerationLnFactorH * fastScrollMultiplier;
      v55 = v180 - fastScrollMultiplier * ((self->_verticalVelocity - v14) / v52);
      v56 = self->_accuracy;
      if (v56 == 1.0)
      {
        v58 = round(v54);
        v60 = round(v55);
      }
      else
      {
        v57 = floor(v54);
        v58 = v57 + round(v56 * (v54 - v57)) / v56;
        v59 = floor(v55);
        v60 = v59 + round(v56 * (v55 - v59)) / v56;
      }
      p_scrollViewFlags = &self->_scrollViewFlags;
      if (v44 <= v42)
        v66 = v42;
      else
        v66 = v44;
      if (v58 <= v44)
        v66 = v58;
      if (v58 >= v42)
        x = v66;
      else
        x = v42;
      if (v60 >= v46)
      {
        if (v60 <= v49)
        {
          y = v60;
        }
        else if (v49 <= v46)
        {
          y = v46;
        }
        else
        {
          y = v49;
        }
      }
      else
      {
        y = v46;
      }
    }
    else
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v64 = v63;
      y = v65;
      x = v64;
      p_scrollViewFlags = &self->_scrollViewFlags;
      v51 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
    }
  }
  v185.f64[0] = x;
  v185.f64[1] = y;
  v181 = y;
  -[UIScrollView _performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:](self, "_performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:", &v185, self->_horizontalVelocity, self->_verticalVelocity);
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v70 = self->_accuracy;
  v72 = p_firstPageOffset->horizontal - v71;
  v172 = v14;
  v173 = v13;
  v177 = v46;
  v179 = v11;
  v175 = v49;
  v176 = v44;
  if (v70 == 1.0)
  {
    v76 = round(v72);
    v82 = round(round(v69 + self->_contentSize.width) - v183);
    v87 = round(self->_firstPageOffset.vertical - v67);
    v91 = round(round(v68 + self->_contentSize.height) - v182);
  }
  else
  {
    v73 = floor(v72);
    v74 = v73 + round(v70 * (v72 - v73)) / v70;
    v75 = floor(v74);
    v76 = v75 + round(v70 * (v74 - v75)) / v70;
    v77 = self->_contentSize.height;
    v78 = v69 + self->_contentSize.width;
    v79 = floor(v78);
    v80 = v79 + round(v70 * (v78 - v79)) / v70 - v183;
    v81 = floor(v80);
    v82 = v81 + round(v70 * (v80 - v81)) / v70;
    v83 = self->_firstPageOffset.vertical - v67;
    v84 = floor(v83);
    v85 = v84 + round(v70 * (v83 - v84)) / v70;
    v86 = floor(v85);
    v87 = v86 + round(v70 * (v85 - v86)) / v70;
    v88 = floor(v68 + v77);
    v89 = v88 + round(v70 * (v68 + v77 - v88)) / v70 - v182;
    v90 = floor(v89);
    v91 = v90 + round(v70 * (v89 - v90)) / v70;
  }
  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  v93 = v92;
  v95 = v94;
  v97 = v76 - v96;
  -[UIScrollView _maxTopOffsetAdjustedForRevealableContentPadding:](self, "_maxTopOffsetAdjustedForRevealableContentPadding:", v91 + v98);
  v100.f64[0] = v185.f64[0];
  v101 = x != v185.f64[0];
  v102 = v185.f64[1];
  if (v181 != v185.f64[1])
    v101 = 1;
  if (v101)
  {
    v103 = *(uint64_t *)&self->_accuracy;
    if (*(double *)&v103 == 1.0)
    {
      v100 = vrndaq_f64(v185);
    }
    else
    {
      v104 = vrndmq_f64(v185);
      v100 = vaddq_f64(v104, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v185, v104), *(double *)&v103)), (float64x2_t)vdupq_lane_s64(v103, 0)));
    }
    v185 = v100;
    v102 = v100.f64[1];
  }
  v105 = v82 + v95;
  v106 = v87 - v93;
  if (v97 != v42)
    LOBYTE(v101) = 1;
  v174 = v99;
  if (!v101 && (v105 == v176 ? (v107 = v106 == v177) : (v107 = 0), v107 ? (v108 = v99 == v175) : (v108 = 0), v108))
  {
    v109 = v100.f64[0];
  }
  else
  {
    v109 = v97;
    if (v100.f64[0] >= v97)
    {
      v109 = v100.f64[0];
      if (v100.f64[0] > v105)
      {
        if (v105 <= v97)
          v109 = v97;
        else
          v109 = v105;
      }
    }
    v185.f64[0] = v109;
    v110 = v87 - v93;
    if (v102 >= v106)
    {
      v110 = v102;
      if (v102 > v99)
      {
        if (v99 <= v106)
          v110 = v87 - v93;
        else
          v110 = v99;
      }
    }
    v185.f64[1] = v110;
    v102 = v110;
  }
  v111 = *(double *)((char *)&self->super.super.super.isa + v51[346]);
  v112 = (v109 - v179) / v111;
  v113 = vabdd_f64(v109, x) < 0.00000011920929;
  v114 = vabdd_f64(v102, v181) < 0.00000011920929 && v113;
  v178 = (v102 - v180) / v111;
  -[UIScrollView _interpageSpacing](self, "_interpageSpacing");
  v116 = v183 + v115;
  v184 = v182 + v117;
  -[UIScrollView _pagingOrigin](self, "_pagingOrigin");
  v120 = v119;
  if (fabs(v112) >= 0.00000011920929)
  {
    v121 = 0;
    if (v114)
    {
      v123 = 0;
      v124 = v178;
      v125 = fabs(v178);
      if (v125 >= 0.00000011920929)
        goto LABEL_151;
      goto LABEL_99;
    }
    if (v185.f64[0] < v97)
      goto LABEL_72;
    v122 = v181;
    if (v185.f64[0] <= v105)
    {
      if ((*(_QWORD *)((char *)p_scrollViewFlags + 12) & 0x20) != 0)
      {
        v144 = floor((v185.f64[0] - v118) / v116 + 0.5);
        v145 = v118 + v116 * v144;
        if (v144 == 0.0)
          horizontal = p_firstPageOffset->horizontal;
        else
          horizontal = 0.0;
        v150 = v145 + horizontal;
        self->_pageDecelerationTarget.x = v150;
        v151 = self->_accuracy;
        if (v151 == 1.0)
        {
          v153 = round(v150);
        }
        else
        {
          v152 = floor(v150);
          v153 = v152 + round(v151 * (v150 - v152)) / v151;
        }
        if (v153 >= v97)
        {
          if (v153 > v105)
          {
            if (v105 <= v97)
              v153 = v97;
            else
              v153 = v105;
          }
        }
        else
        {
          v153 = v97;
        }
        self->_pageDecelerationTarget.x = v153;
        v121 = 1;
      }
      else
      {
        horizontalVelocity = self->_horizontalVelocity;
        if ((horizontalVelocity > 0.0 || v185.f64[0] >= x) && (horizontalVelocity < 0.0 || v185.f64[0] <= x))
        {
          v130 = v119;
          v171 = exp(-(horizontalVelocity - v173) / v112);
          self->_adjustedDecelerationFactor.width = v171;
          if (v171 > 0.999)
            self->_adjustedDecelerationFactor.width = 0.999;
        }
        else
        {
          v130 = v119;
          v131 = v112 * log(self->_decelerationFactor.width);
          self->_horizontalVelocity = v173 - v131;
          if (vabdd_f64(v173, v131) < 0.25)
          {
            self->_adjustedDecelerationFactor.width = 0.985;
            self->_horizontalVelocity = v173 + v112 * 0.0151136378;
          }
        }
        v121 = 1;
        v122 = v181;
        v120 = v130;
      }
    }
  }
  else
  {
    self->_horizontalVelocity = 0.0;
    if ((*(_QWORD *)((char *)p_scrollViewFlags + 12) & 0x20) == 0)
    {
      v121 = 0;
LABEL_72:
      v122 = v181;
      goto LABEL_98;
    }
    v126 = floor((v179 - v118) / v116 + 0.5);
    v127 = v118 + v116 * v126;
    v122 = v181;
    if (v126 == 0.0)
      v128 = p_firstPageOffset->horizontal;
    else
      v128 = 0.0;
    v132 = v127 + v128;
    self->_pageDecelerationTarget.x = v132;
    v133 = self->_accuracy;
    if (v133 == 1.0)
    {
      v135 = round(v132);
    }
    else
    {
      v134 = floor(v132);
      v135 = v134 + round(v133 * (v132 - v134)) / v133;
    }
    if (v135 >= v97)
    {
      if (v135 > v105)
      {
        if (v105 <= v97)
          v135 = v97;
        else
          v135 = v105;
      }
    }
    else
    {
      v135 = v97;
    }
    v121 = 0;
    self->_pageDecelerationTarget.x = v135;
  }
LABEL_98:
  v124 = v178;
  v125 = fabs(v178);
  if (v125 < 0.00000011920929)
  {
LABEL_99:
    self->_verticalVelocity = 0.0;
    if ((*(_QWORD *)((char *)p_scrollViewFlags + 12) & 0x20) != 0)
    {
      v136 = floor((v180 - v120) / v184 + 0.5);
      v137 = v120 + v184 * v136;
      if (v136 == 0.0)
        vertical = self->_firstPageOffset.vertical;
      else
        vertical = 0.0;
      v141 = v137 + vertical;
      self->_pageDecelerationTarget.y = v141;
      v142 = self->_accuracy;
      if (v142 == 1.0)
      {
        v125 = round(v141);
      }
      else
      {
        v143 = floor(v141);
        v125 = v143 + round(v142 * (v141 - v143)) / v142;
      }
      if (v125 >= v106)
      {
        if (v125 > v174)
        {
          if (v174 <= v106)
            v125 = v106;
          else
            v125 = v174;
        }
      }
      else
      {
        v125 = v106;
      }
      v123 = 0;
      self->_pageDecelerationTarget.y = v125;
      goto LABEL_151;
    }
    goto LABEL_103;
  }
  if (!v114)
  {
    v123 = 0;
    v125 = v185.f64[1];
    if (v185.f64[1] >= v106 && v185.f64[1] <= v174)
    {
      if ((*(_QWORD *)((char *)p_scrollViewFlags + 12) & 0x20) != 0)
      {
        v147 = floor((v185.f64[1] - v120) / v184 + 0.5);
        v148 = v120 + v184 * v147;
        if (v147 == 0.0)
          v149 = self->_firstPageOffset.vertical;
        else
          v149 = 0.0;
        v154 = v148 + v149;
        self->_pageDecelerationTarget.y = v154;
        v155 = self->_accuracy;
        if (v155 == 1.0)
        {
          v125 = round(v154);
        }
        else
        {
          v156 = floor(v154);
          v125 = v156 + round(v155 * (v154 - v156)) / v155;
        }
        if (v125 >= v106)
        {
          if (v125 > v174)
          {
            if (v174 <= v106)
              v125 = v106;
            else
              v125 = v174;
          }
        }
        else
        {
          v125 = v106;
        }
        self->_pageDecelerationTarget.y = v125;
      }
      else
      {
        verticalVelocity = self->_verticalVelocity;
        if ((verticalVelocity > 0.0 || v185.f64[1] >= v122) && (verticalVelocity < 0.0 || v185.f64[1] <= v122))
        {
          v125 = exp(-(verticalVelocity - v172) / v178);
          self->_adjustedDecelerationFactor.height = v125;
          if (v125 > 0.999)
            self->_adjustedDecelerationFactor.height = 0.999;
        }
        else
        {
          v140 = v178 * log(self->_decelerationFactor.height);
          self->_verticalVelocity = v172 - v140;
          v125 = vabdd_f64(v172, v140);
          if (v125 < 0.25)
          {
            self->_adjustedDecelerationFactor.height = 0.985;
            v125 = v172 + v178 * 0.0151136378;
            self->_verticalVelocity = v125;
          }
        }
      }
      v123 = 1;
    }
    goto LABEL_151;
  }
LABEL_103:
  v123 = 0;
LABEL_151:
  if ((*(_QWORD *)((char *)p_scrollViewFlags + 12) & 0x20) == 0)
  {
    v157 = 0x4000000000;
    if (!v121)
      v157 = 0;
    if ((v121 & v123) == 1)
    {
      p_adjustedDecelerationFactor = &self->_adjustedDecelerationFactor;
      v159 = self->_adjustedDecelerationFactor.height;
      v160 = v159;
      if (v159 == 0.0)
        v160 = self->_decelerationFactor.height;
      width = p_adjustedDecelerationFactor->width;
      if (p_adjustedDecelerationFactor->width == 0.0)
        width = self->_decelerationFactor.width;
      if (v160 >= width)
      {
        if (v159 == 0.0)
          v159 = self->_decelerationFactor.height;
        if (width < v159)
        {
          self->_horizontalVelocity = v173 - v112 * log(v159);
          v163 = self->_adjustedDecelerationFactor.height;
          if (v163 == 0.0)
            v163 = self->_decelerationFactor.height;
          p_adjustedDecelerationFactor->width = v163;
        }
      }
      else
      {
        self->_verticalVelocity = v172 - v124 * log(width);
        v162 = p_adjustedDecelerationFactor->width;
        if (p_adjustedDecelerationFactor->width == 0.0)
          v162 = self->_decelerationFactor.width;
        self->_adjustedDecelerationFactor.height = v162;
      }
      v157 = 0x4000000000;
    }
    v125 = v185.f64[0];
    self->_adjustedDecelerationTarget = (CGPoint)v185;
    v164 = 0x8000000000;
    if (!v123)
      v164 = 0;
    v165 = v157 | v164 | *(_QWORD *)((char *)p_scrollViewFlags + 12) & 0xFFFFFF3FFFFFFFFFLL;
    *((_DWORD *)p_scrollViewFlags + 5) = *((_DWORD *)p_scrollViewFlags + 5);
    *(_QWORD *)((char *)p_scrollViewFlags + 12) = v165;
  }
  -[UIScrollView contentOffset](self, "contentOffset", v125);
  LOBYTE(v3) = 1;
  if (v167 == v185.f64[0] && v166 == v185.f64[1])
  {
    if (-[UIScrollView _canPerformAsyncScrollDecelerationReturningEvent:](self, "_canPerformAsyncScrollDecelerationReturningEvent:", 0))
    {
      -[UIScrollViewPanGestureRecognizer velocityInView:](self->_pan, "velocityInView:", self);
      LOBYTE(v3) = v169 != *(double *)(MEMORY[0x1E0C9D538] + 8) || v168 != *MEMORY[0x1E0C9D538];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
LABEL_181:

  return v3;
}

- (BOOL)_contentOffsetIsAtPagingBoundary:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  double v16;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIScrollView _interpageSpacing](self, "_interpageSpacing");
  v11 = v10;
  v13 = v7 + v12;
  -[UIScrollView _pagingOrigin](self, "_pagingOrigin");
  v15 = v14;
  return fabs(fmod(x - v16, v13)) <= 0.00000011920929 && fabs(fmod(y - v15, v9 + v11)) <= 0.00000011920929;
}

- (BOOL)_staysCenteredDuringPinch
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 34) & 1;
}

- (void)_setStaysCenteredDuringPinch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (void)_updatePinchGestureForState:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id WeakRetained;
  UIView *v23;
  UIView *v24;
  UIScrollViewPinchGestureRecognizer *pinch;
  void *v26;
  void *v27;
  UIView *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  uint64_t scrollViewFlags;
  double *p_minimumZoomScale;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  UIView *zoomView;
  void *v44;
  void *v45;
  _BOOL4 v46;
  uint64_t v47;
  UIScrollView *v48;
  uint64_t v49;
  char v50;
  void *v51;
  int v52;
  uint64_t v53;
  int v54;
  UIScrollViewPinchGestureRecognizer *v55;
  void *v56;
  UIView *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  _QWORD v65[5];

  if (!-[UIScrollView _staysCenteredDuringPinch](self, "_staysCenteredDuringPinch"))
  {
    -[UIPinchGestureRecognizer anchorPoint](self->_pinch, "anchorPoint");
    v7 = v18;
    -[UIPinchGestureRecognizer anchorPoint](self->_pinch, "anchorPoint");
    v10 = v19;
    goto LABEL_12;
  }
  -[UIView bounds](self, "bounds");
  v7 = v6 + v5 * 0.5;
  v10 = v9 + v8 * 0.5;
  -[UIView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self, "window");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    -[UIView window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[UIView window](self, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertPoint:fromView:", self, v7, v10);
      objc_msgSend(v13, "_convertDoublePointToSceneReferenceSpace:");
      v7 = v16;
      v10 = v17;

LABEL_10:
      goto LABEL_11;
    }
    objc_msgSend(v13, "_convertDoublePointToSceneReferenceSpace:", v7, v10);
LABEL_9:
    v7 = v20;
    v10 = v21;
    goto LABEL_10;
  }
  if (v12)
  {
    -[UIView window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:fromView:", self, v7, v10);
    goto LABEL_9;
  }
LABEL_11:

LABEL_12:
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((unint64_t)(a3 - 3) < 2)
  {
    p_scrollViewFlags = &self->_scrollViewFlags;
    scrollViewFlags = (uint64_t)self->_scrollViewFlags;
    if ((scrollViewFlags & 0x40000000) != 0)
    {
      *(_QWORD *)p_scrollViewFlags = scrollViewFlags & 0xFFFFFFFFBFFFFF7FLL;
      *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x1000000000uLL;
      self->_verticalVelocity = 0.0;
      self->_horizontalVelocity = 0.0;
      if ((*(_BYTE *)p_scrollViewFlags & 0x40) != 0)
      {
        -[UIScrollView zoomScale](self, "zoomScale");
        p_minimumZoomScale = &self->_minimumZoomScale;
        if (v39 < self->_minimumZoomScale
          || (-[UIScrollView zoomScale](self, "zoomScale"),
              p_minimumZoomScale = &self->_maximumZoomScale,
              v40 > self->_maximumZoomScale))
        {
          *(_QWORD *)p_scrollViewFlags |= 0x80uLL;
          -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:", 0, 1, 0, *p_minimumZoomScale, v7, v10, -1.0);
        }
      }
      v41 = *(_QWORD *)p_scrollViewFlags;
      if ((*(_QWORD *)p_scrollViewFlags & 0x80) == 0)
      {
        -[UIScrollView contentOffset](self, "contentOffset");
        -[UIScrollView setContentOffset:](self, "setContentOffset:");
        -[UIScrollView _scrollViewDidEndZooming](self, "_scrollViewDidEndZooming");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIScrollView zoomScale](self, "zoomScale");
          objc_msgSend(WeakRetained, "scrollViewDidEndZooming:withView:atScale:", self, v42);

        }
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __44__UIScrollView__updatePinchGestureForState___block_invoke;
        v65[3] = &unk_1E16B1B28;
        v65[4] = self;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v65, 0.2);
        v41 = *(_QWORD *)p_scrollViewFlags;
      }
      if ((v41 & 0x800000) == 0 && !self->_scrollHeartbeat)
        -[UIScrollView _popTrackingRunLoopModeIfNecessaryForReason:](self, "_popTrackingRunLoopModeIfNecessaryForReason:", CFSTR("Pinch gesture ended"));
    }
    zoomView = self->_zoomView;
    self->_zoomView = 0;

    -[UIScrollViewPanGestureRecognizer _scrollViewDidEndZooming](self->_pan, "_scrollViewDidEndZooming");
    -[_UIEdgeFeedbackGenerator userInteractionEnded](self->_zoomFeedbackGenerator, "userInteractionEnded");
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
        v23 = (UIView *)objc_claimAutoreleasedReturnValue();
        v24 = self->_zoomView;
        self->_zoomView = v23;

        pinch = self->_pinch;
        -[UIScrollView _zoomScaleFromPresentationLayer:](self, "_zoomScaleFromPresentationLayer:", 1);
        -[UIPinchGestureRecognizer setScale:](pinch, "setScale:");
        if (self->_zoomAnimationCount)
        {
          -[UIScrollView _scrollViewDidEndZooming](self, "_scrollViewDidEndZooming");
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIScrollView zoomScale](self, "zoomScale");
            objc_msgSend(WeakRetained, "scrollViewDidEndZooming:withView:atScale:", self, v26);

          }
        }
        *(_QWORD *)&self->_scrollViewFlags |= 0xC0000000uLL;
        *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x1000000000uLL;
        -[UIView window](self->_zoomView, "window");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = self->_zoomView;
        -[UIView window](v28, "window");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v27)
        {
          objc_msgSend(v29, "_convertDoublePointFromSceneReferenceSpace:", v7, v10);
          v32 = v31;
          v34 = v33;
          -[UIView window](self->_zoomView, "window");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView convertPoint:fromView:](v28, "convertPoint:fromView:", v35, v32, v34);
          -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");

        }
        else
        {
          -[UIView convertPoint:fromView:](v28, "convertPoint:fromView:", v29, v7, v10);
          -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");
        }

        if (self->_scrollHeartbeat)
          -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 1);
        -[UIScrollView _scrollViewWillBeginZooming](self, "_scrollViewWillBeginZooming");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "scrollViewWillBeginZooming:withView:", self, self->_zoomView);
        if (!self->_scrollHeartbeat)
          -[UIScrollView _pushTrackingRunLoopModeIfNecessaryForReason:](self, "_pushTrackingRunLoopModeIfNecessaryForReason:", CFSTR("Pinch gesture began"));
        -[UIScrollView _activateZoomFeedback](self, "_activateZoomFeedback");
      }
      goto LABEL_56;
    }
    -[UIGestureRecognizer _activeTouchesEvent](self->_pinch);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[UIGestureRecognizer _allActiveTouches](self->_pinch, "_allActiveTouches");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count") == 2;

    }
    else
    {
      v46 = 1;
    }
    v47 = (uint64_t)self->_scrollViewFlags;
    if ((v47 & 0x40000000) == 0 && v46)
    {
      v48 = self;
      v49 = 1;
LABEL_55:
      -[UIScrollView _updatePinchGestureForState:](v48, "_updatePinchGestureForState:", v49);
      goto LABEL_56;
    }
    v50 = (v47 & 0x40000000) == 0 || v46;
    if ((v50 & 1) == 0)
    {
      v48 = self;
      v49 = 3;
      goto LABEL_55;
    }
    if (self->_zoomView)
    {
      -[UIView window](self, "window");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "_systemGestureRecognitionIsPossible");

      v53 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
      v54 = *((_DWORD *)&self->_scrollViewFlags + 5);
      if (v52)
      {
        *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v53 | 0x800000000;
        *((_DWORD *)&self->_scrollViewFlags + 5) = v54;
      }
      else
      {
        if ((v53 & 0x800000000) != 0)
        {
          *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v53 & 0xFFFFFFF7FFFFFFFFLL;
          *((_DWORD *)&self->_scrollViewFlags + 5) = v54;
          v55 = self->_pinch;
          -[UIScrollView _zoomScaleFromPresentationLayer:](self, "_zoomScaleFromPresentationLayer:", 1);
          -[UIPinchGestureRecognizer setScale:](v55, "setScale:");
          -[UIView window](self->_zoomView, "window");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = self->_zoomView;
          -[UIView window](v57, "window");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v58;
          if (v56)
          {
            objc_msgSend(v58, "_convertDoublePointFromSceneReferenceSpace:", v7, v10);
            v61 = v60;
            v63 = v62;
            -[UIView window](self->_zoomView, "window");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView convertPoint:fromView:](v57, "convertPoint:fromView:", v64, v61, v63);
            -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");

          }
          else
          {
            -[UIView convertPoint:fromView:](v57, "convertPoint:fromView:", v58, v7, v10);
            -[UIScrollView _setZoomAnchorPoint:](self, "_setZoomAnchorPoint:");
          }

        }
        -[UIPinchGestureRecognizer scale](self->_pinch, "scale");
        -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:", (*(_QWORD *)&self->_scrollViewFlags >> 6) & 1, 0, 0, 1);
      }
    }
  }
LABEL_56:

}

uint64_t __44__UIScrollView__updatePinchGestureForState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_adjustContentOffsetIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_centerContentIfNecessary");
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  id v6;
  UIScrollViewPinchGestureRecognizer *v7;
  id v8;
  BOOL v9;
  char isKindOfClass;

  v6 = a3;
  v7 = (UIScrollViewPinchGestureRecognizer *)a4;
  -[UIScrollView _scrollViewTouchDelayGesture](self, "_scrollViewTouchDelayGesture");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    if (self->_pinch == v7 || (UIScrollViewPinchGestureRecognizer *)self->_pan == v7)
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_3;
    }
    v9 = 0;
    goto LABEL_10;
  }

LABEL_3:
  v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  return self->_keyboardScrollingGestureRecognizer != a3
      || -[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll");
}

- (BOOL)pressGestureRecognizer:(id)a3 shouldAllowPress:(id)a4
{
  id v6;
  void *v7;
  char v8;

  if (self->_keyboardScrollingGestureRecognizer != a3)
    return 1;
  v6 = a4;
  -[UIScrollView _scrollingAnimator](self, "_scrollingAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInterestedInPress:", v6);

  return v8;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4
{
  int v5;
  uint64_t v6;

  if (self->_pan == a3)
  {
    -[UIScrollView _findScrollableAncestorIfNeededWithEvent:](self, "_findScrollableAncestorIfNeededWithEvent:", a4);
    v5 = -[_UIScrollViewScrollableAncestor _descendentScrollViewShouldScrollHorizontally:](self->_scrollableAncestor, "_descendentScrollViewShouldScrollHorizontally:", self);
    v6 = 4096;
    if (!v5)
      v6 = 0;
    *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFEFFFLL | v6;
    -[UIScrollView _updateContentFitDisableScrolling](self, "_updateContentFitDisableScrolling");
  }
  return 1;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4
{
  int v5;
  uint64_t v6;

  if (self->_pan == a3)
  {
    -[UIScrollView _findScrollableAncestorIfNeededWithEvent:](self, "_findScrollableAncestorIfNeededWithEvent:", a4);
    v5 = -[_UIScrollViewScrollableAncestor _descendentScrollViewShouldScrollVertically:](self->_scrollableAncestor, "_descendentScrollViewShouldScrollVertically:", self);
    v6 = 0x2000;
    if (!v5)
      v6 = 0;
    *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFFDFFFLL | v6;
    -[UIScrollView _updateContentFitDisableScrolling](self, "_updateContentFitDisableScrolling");
  }
  return 1;
}

- (void)_findScrollableAncestorIfNeededWithEvent:(id)a3
{
  double v4;
  void *v5;
  _UIScrollViewScrollableAncestor *v6;
  _UIScrollViewScrollableAncestor *scrollableAncestor;

  if ((*((_BYTE *)&self->_scrollViewFlags + 1) & 0x40) == 0)
  {
    objc_msgSend(a3, "timestamp");
    self->_intervalBetweenPanGestures = v4 - self->_lastPanGestureEndTime;
    if (-[UIScrollView _shouldScrollAncestors](self, "_shouldScrollAncestors"))
    {
      -[UIScrollView _parentScrollView](self, "_parentScrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        -[UIView _firstAncestorInteractionConformingToProtocol:](self, "_firstAncestorInteractionConformingToProtocol:", &unk_1EDE36AD0);
        v6 = (_UIScrollViewScrollableAncestor *)objc_claimAutoreleasedReturnValue();
        scrollableAncestor = self->_scrollableAncestor;
        self->_scrollableAncestor = v6;

      }
    }
    *(_QWORD *)&self->_scrollViewFlags |= 0x4000uLL;
  }
}

- (void)_setShouldScrollAncestors:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)_shouldScrollAncestors
{
  return (*((_BYTE *)&self->_scrollViewFlags + 1) & 0x80) == 0;
}

- (void)_handleSwipe:(id)a3
{
  double v4;

  v4 = 1.0;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x80) == 0)
    v4 = -1.0;
  -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", a3, v4, 0.0);
  -[UIScrollView _trackingDidEnd](self, "_trackingDidEnd");
}

- (void)handlePinch:(id)a3
{
  -[UIScrollView _updatePinchGestureForState:](self, "_updatePinchGestureForState:", objc_msgSend(a3, "state"));
}

- (void)handlePan:(id)a3
{
  uint64_t v4;
  void *v5;
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
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v4 = objc_msgSend(v21, "state");
  if (v4 == 1)
  {
    v14 = (void *)UIApp;
    -[UIView window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "_touchesEventForWindow:", v15);

    -[UIScrollView _resetScrollingWithUIEvent:](self, "_resetScrollingWithUIEvent:", v16);
    self->_horizontalVelocity = 0.0;
    self->_verticalVelocity = 0.0;
    self->_previousHorizontalVelocity = 0.0;
    self->_previousVerticalVelocity = 0.0;
    goto LABEL_8;
  }
  if (v4 == 3)
    goto LABEL_5;
  if (v4 != 4)
  {
LABEL_8:
    -[UIScrollView _updatePanGesture](self, "_updatePanGesture");
    goto LABEL_13;
  }
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView:didFinishPanGesture:", self, self->_pan);

LABEL_5:
  -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", self->_horizontalVelocity, self->_verticalVelocity);
  -[UIScrollView _endPanNormal:](self, "_endPanNormal:", 1);
  -[UIScrollView _trackingDidEnd](self, "_trackingDidEnd");
  objc_msgSend(v21, "_activeEventOfType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_activeEventOfType:", 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "allTouches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didScroll:withSource:", self, +[_UIEventSessionAction getUIEventSourceForUITouchType:](_UIEventSessionAction, "getUIEventSourceForUITouchType:", objc_msgSend(v13, "type")));

  }
  else
  {
    v17 = objc_msgSend(v7, "_trackpadFingerDownCount");
    +[UIEventSessionActionAnalytics sharedInstance](UIEventSessionActionAnalytics, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 < 1)
      v20 = 0;
    else
      v20 = 4;
    objc_msgSend(v18, "didScroll:withSource:", self, v20);

  }
LABEL_13:

}

- (double)_intervalBetweenPanGestures
{
  return self->_intervalBetweenPanGestures;
}

- (BOOL)_allowsAsyncScrollEvent
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 28) & 1;
}

- (void)_setAllowsAsyncScrollEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xEFFFFFFF | v3;
}

- (BOOL)_canHandleAsyncScrollEvent
{
  uint64_t v2;

  v2 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v2 & 0x20) != 0)
    return 0;
  if ((v2 & 0x20000000000000) != 0)
    return 1;
  return -[UIScrollView _subclassHandlesAsyncScrollEvent](self, "_subclassHandlesAsyncScrollEvent");
}

- (BOOL)_canPerformAsyncScrollDecelerationReturningEvent:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[UIScrollView _canHandleAsyncScrollEvent](self, "_canHandleAsyncScrollEvent"))
  {
    -[UIGestureRecognizer _activeEventOfType:](self->_pan, "_activeEventOfType:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3 && v5)
    {
      v7 = objc_retainAutorelease(v5);
      *a3 = v7;

      return 1;
    }

    if (v6)
      return 1;
  }
  return 0;
}

- (id)_asyncDeliveryTargetForScrollEvent:(id)a3
{
  UIScrollView *v4;

  if (-[UIScrollView _canHandleAsyncScrollEvent](self, "_canHandleAsyncScrollEvent", a3))
    v4 = self;
  else
    v4 = 0;
  return v4;
}

- (void)_asynchronouslyDeliverScrollEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  dispatch_time_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  _QWORD handler[4];
  NSObject *v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_AsyncScrollEventHandlerTimeout, (uint64_t)CFSTR("AsyncScrollEventHandlerTimeout"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v9 = 2000000000;
  else
    v9 = (uint64_t)(*(double *)&qword_1EDDA83F0 * 1000000000.0);
  v10 = dispatch_time(0, v9);
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_AsyncScrollEventHandlerTimeout, (uint64_t)CFSTR("AsyncScrollEventHandlerTimeout"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v11 = 100000000;
  else
    v11 = (unint64_t)(*(double *)&qword_1EDDA83F0 * 0.05 * 1000000000.0);
  dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, v11);
  v12 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke;
  handler[3] = &unk_1E16BAD68;
  v13 = v8;
  v24 = v13;
  v14 = v6;
  v25 = v14;
  v15 = v7;
  v26 = v15;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_activate(v13);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke_2;
  v19[3] = &unk_1E16C9138;
  v20 = v13;
  v21 = v14;
  v22 = v15;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  -[UIScrollView _sendAsynchronouslyHandleScrollEvent:completion:](self, "_sendAsynchronouslyHandleScrollEvent:completion:", v17, v19);

}

uint64_t __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

intptr_t __61__UIScrollView__asynchronouslyDeliverScrollEvent_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  intptr_t result;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v2 = *(NSObject **)(a1 + 32);
  result = dispatch_source_testcancel(v2);
  if (!result)
  {
    dispatch_source_cancel(v2);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

- (void)_sendAsynchronouslyHandleScrollEvent:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[UIScrollView _subclassHandlesAsyncScrollEvent](self, "_subclassHandlesAsyncScrollEvent"))
  {
    -[UIScrollView _asynchronouslyHandleScrollEvent:completion:](self, "_asynchronouslyHandleScrollEvent:completion:", v8, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "_scrollView:asynchronouslyHandleScrollEvent:completion:", self, v8, v6);

  }
}

- (BOOL)_subclassHandlesAsyncScrollEvent
{
  return 0;
}

- (void)_handleKnobLongPressGesture:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
      -[UIScrollView _beginDirectManipulationIfNecessaryWithGestureRecognizer:](self, "_beginDirectManipulationIfNecessaryWithGestureRecognizer:", v5);
  }
  else
  {
    -[UIScrollView _didEndDirectManipulationWithScrubbingDirection:](self, "_didEndDirectManipulationWithScrubbingDirection:", ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 11) & 0xF);
  }

}

- (void)_beginDirectManipulationIfNecessaryWithGestureRecognizer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int64_t v10;
  id v11;

  if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x7800) == 0)
  {
    v4 = a3;
    objc_msgSend(v4, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "touches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v10 = -[UIScrollView _scrubbingForPoint:touch:](self, "_scrubbingForPoint:touch:", v11, v6, v8);
    if ((unint64_t)(v10 - 1) <= 3)
    {
      -[UIScrollView _didBeginDirectManipulationWithScrubbingDirection:](self, "_didBeginDirectManipulationWithScrubbingDirection:", v10);
      -[UIFeedbackGeneratorUserInteractionDriven pressedDownAtLocation:](self->_knobFeedbackGenerator, "pressedDownAtLocation:", v6, v8);
    }

  }
}

- (void)_didBeginDirectManipulationWithScrubbingDirection:(int64_t)a3
{
  NSTimer *verticalScrollIndicatorHideDelayTimer;
  NSTimer *horizontalScrollIndicatorHideDelayTimer;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  int *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  int64_t v17;

  -[NSTimer invalidate](self->_verticalScrollIndicatorHideDelayTimer, "invalidate");
  verticalScrollIndicatorHideDelayTimer = self->_verticalScrollIndicatorHideDelayTimer;
  self->_verticalScrollIndicatorHideDelayTimer = 0;

  -[NSTimer invalidate](self->_horizontalScrollIndicatorHideDelayTimer, "invalidate");
  horizontalScrollIndicatorHideDelayTimer = self->_horizontalScrollIndicatorHideDelayTimer;
  self->_horizontalScrollIndicatorHideDelayTimer = 0;

  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFFF87FF | ((a3 & 0xF) << 11);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_knobInteractionBeginTime = v7;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  self->_knobRelativeContentInsets.top = v8;
  self->_knobRelativeContentInsets.left = v9;
  self->_knobRelativeContentInsets.bottom = v10;
  self->_knobRelativeContentInsets.right = v11;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v12 = &OBJC_IVAR___UIScrollView__verticalScrollIndicator;
    -[UIScrollView _effectiveVerticalScrollIndicatorInsets](self, "_effectiveVerticalScrollIndicatorInsets");
LABEL_5:
    self->_knobRelativeIndicatorInsets.top = v13;
    self->_knobRelativeIndicatorInsets.left = v14;
    self->_knobRelativeIndicatorInsets.bottom = v15;
    self->_knobRelativeIndicatorInsets.right = v16;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v12), "setExpandedForDirectManipulation:", 1);
  }
  else
  {
    v17 = a3 - 1;
    v12 = &OBJC_IVAR___UIScrollView__horizontalScrollIndicator;
    switch(v17)
    {
      case 0:
      case 2:
        goto LABEL_6;
      case 1:
      case 3:
        -[UIScrollView _effectiveHorizontalScrollIndicatorInsets](self, "_effectiveHorizontalScrollIndicatorInsets");
        goto LABEL_5;
      default:
        return;
    }
  }
}

- (void)_trackpadInterruptScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  UIDelayedAction *trackpadScrollInterruptionDelayedAction;

  v4 = a3;
  -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 1);
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  self->_lastScrollInterruptionByPointerEventTime = v6;
  trackpadScrollInterruptionDelayedAction = self->_trackpadScrollInterruptionDelayedAction;
  self->_trackpadScrollInterruptionDelayedAction = 0;

}

- (void)_handleKnobHoverGesture:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  UIDelayedAction *trackpadScrollInterruptionDelayedAction;
  unint64_t v7;
  NSTimer *verticalScrollIndicatorHideDelayTimer;
  NSTimer *v9;
  NSTimer *horizontalScrollIndicatorHideDelayTimer;
  NSTimer *v11;
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
  double v23;
  int v24;
  _BOOL4 v25;
  int v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  UIDelayedAction *v31;
  void *v32;
  int v33;
  double v34;
  UIDelayedAction *v35;
  UIDelayedAction *v36;
  id v37;

  v37 = a3;
  v4 = objc_msgSend(v37, "state");
  v5 = objc_msgSend(v37, "_trackpadFingerDownCount");
  if (v5 != objc_msgSend(v37, "_previousTrackpadFingerDownCount"))
  {
    trackpadScrollInterruptionDelayedAction = self->_trackpadScrollInterruptionDelayedAction;
    if (trackpadScrollInterruptionDelayedAction)
      -[UIDelayedAction cancel](trackpadScrollInterruptionDelayedAction, "cancel");
  }
  v7 = v4 - 1;
  if (objc_msgSend(v37, "_trackpadFingerDownCount") == 1 && v7 <= 1)
  {
    if (!objc_msgSend(v37, "_previousTrackpadFingerDownCount")
      && self->_scrollHeartbeat
      && !-[UIScrollView _isBouncing](self, "_isBouncing")
      && !-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
    {
      objc_msgSend(v37, "_activeEventOfType:", 11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timestamp");
      v30 = v29;
      v31 = [UIDelayedAction alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_TrackpadInterruptScrollDelay, (uint64_t)CFSTR("TrackpadInterruptScrollDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v34 = *(double *)&qword_1EDDA8420;
      if (v33)
        v34 = 0.01;
      v35 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v31, "initWithTarget:action:userInfo:delay:mode:", self, sel__trackpadInterruptScroll_, v32, *MEMORY[0x1E0C99860], v34);
      v36 = self->_trackpadScrollInterruptionDelayedAction;
      self->_trackpadScrollInterruptionDelayedAction = v35;

    }
    verticalScrollIndicatorHideDelayTimer = self->_verticalScrollIndicatorHideDelayTimer;
    if (verticalScrollIndicatorHideDelayTimer)
    {
      -[NSTimer invalidate](verticalScrollIndicatorHideDelayTimer, "invalidate");
      v9 = self->_verticalScrollIndicatorHideDelayTimer;
      self->_verticalScrollIndicatorHideDelayTimer = 0;

      -[UIScrollView _hideScrollIndicator:afterDelay:animated:](self, "_hideScrollIndicator:afterDelay:animated:", self->_verticalScrollIndicator, 1, 1.0);
    }
    horizontalScrollIndicatorHideDelayTimer = self->_horizontalScrollIndicatorHideDelayTimer;
    if (horizontalScrollIndicatorHideDelayTimer)
    {
      -[NSTimer invalidate](horizontalScrollIndicatorHideDelayTimer, "invalidate");
      v11 = self->_horizontalScrollIndicatorHideDelayTimer;
      self->_horizontalScrollIndicatorHideDelayTimer = 0;

      -[UIScrollView _hideScrollIndicator:afterDelay:animated:](self, "_hideScrollIndicator:afterDelay:animated:", self->_horizontalScrollIndicator, 1, 1.0);
    }
    if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x400000) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideScrollIndicators, 0);
      -[UIScrollView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideScrollIndicators, 0, 1.0);
    }
  }
  if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self)
    || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
  {
    if (v7 > 1)
    {
      *((_DWORD *)&self->_scrollViewFlags + 5) &= 0xFFCFFFFF;
      -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 0, 0);
    }
    else
    {
      objc_msgSend(v37, "locationInView:", self);
      v13 = v12;
      v15 = v14;
      -[UIScrollView _scrollIndicatorContainerRect](self, "_scrollIndicatorContainerRect");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      if (-[UIScrollView _isPoint:inExpandedIndicatorForAxis:containerRect:](self, "_isPoint:inExpandedIndicatorForAxis:containerRect:", 2, v13, v15, v16, v18, v20, v22))
      {
        v24 = 0x100000;
      }
      else
      {
        v24 = 0;
      }
      *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5) & 0xFFEFFFFF | v24;
      v25 = -[UIScrollView _isPoint:inExpandedIndicatorForAxis:containerRect:](self, "_isPoint:inExpandedIndicatorForAxis:containerRect:", 1, v13, v15, v17, v19, v21, v23);
      v26 = *((_DWORD *)&self->_scrollViewFlags + 5);
      v27 = 0x200000;
      if (!v25)
        v27 = 0;
      *((_DWORD *)&self->_scrollViewFlags + 5) = v26 & 0xFFDFFFFF | v27;
      if ((v26 & 0x100000) != 0)
      {
        -[_UIScrollViewScrollIndicator setExpandedForDirectManipulation:](self->_verticalScrollIndicator, "setExpandedForDirectManipulation:", 1);
        v27 = *((_DWORD *)&self->_scrollViewFlags + 5) & 0x200000;
      }
      if (v27)
        -[_UIScrollViewScrollIndicator setExpandedForDirectManipulation:](self->_horizontalScrollIndicator, "setExpandedForDirectManipulation:", 1);
    }
  }

}

- (BOOL)_isPoint:(CGPoint)a3 inExpandedIndicatorForAxis:(unint64_t)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a3.y;
  x = a3.x;
  -[UIScrollView _scrollIndicatorContainerRect](self, "_scrollIndicatorContainerRect");
  return -[UIScrollView _isPoint:inExpandedIndicatorForAxis:containerRect:](self, "_isPoint:inExpandedIndicatorForAxis:containerRect:", a4, x, y, v8, v9, v10, v11);
}

- (BOOL)_isPoint:(CGPoint)a3 inExpandedIndicatorForAxis:(unint64_t)a4 containerRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  void *v13;
  void *v14;
  int v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRectEdge v22;
  double v23;
  BOOL v24;
  CGRect v26;
  CGRect slice;
  CGPoint v28;
  CGRect v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.y;
  v11 = a3.x;
  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:](_UIScrollViewScrollIndicator, "visualStyleForTraitCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 1)
  {
    if (a4 == 2 && -[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self))
    {
      memset(&slice, 0, sizeof(slice));
      if (-[UIScrollView _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis](self, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis", 0, 0, 0, 0))
      {
        v15 = 0;
      }
      else
      {
        v15 = 2;
      }
      objc_msgSend(v14, "staticDimensionExpandedSize");
      v17 = v16;
      v18 = x;
      v19 = y;
      v20 = width;
      v21 = height;
      v22 = v15;
      goto LABEL_10;
    }
LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  if (!-[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
    goto LABEL_11;
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v14, "staticDimensionExpandedSize", 0, 0, 0, 0);
  v17 = v23;
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  v22 = CGRectMaxYEdge;
LABEL_10:
  CGRectDivide(*(CGRect *)&v18, &slice, &v26, v17, v22);
  objc_msgSend(v14, "hitTestingRectForIndicatorRect:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  slice = v29;
  v28.x = v11;
  v28.y = v10;
  v24 = CGRectContainsPoint(v29, v28);
LABEL_12:

  return v24;
}

- (BOOL)_shouldAutoScroll
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  id WeakRetained;

  if (-[UIScrollView _isAutoScrollEnabled](self, "_isAutoScrollEnabled"))
    v3 = -[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  else
    v3 = 0;
  -[UIScrollView _panGestureRecognizer](self, "_panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  v6 = 0;
  v7 = (unint64_t)(v5 - 4) < 0xFFFFFFFFFFFFFFFDLL || !v3;
  if (v3 && v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
    v6 = WeakRetained == 0;

  }
  return v6;
}

- (void)_stopAutoScrollAssistant
{
  _UIAutoScrollAssistant *autoScrollAssistant;

  autoScrollAssistant = self->_autoScrollAssistant;
  if (autoScrollAssistant)
    -[_UIAutoScrollAssistant stop](autoScrollAssistant, "stop");
}

- (void)_handleAutoScroll:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "state");
  if ((unint64_t)(v4 - 3) < 2)
    goto LABEL_5;
  if ((unint64_t)(v4 - 1) <= 1)
  {
    if (-[UIScrollView _shouldAutoScroll](self, "_shouldAutoScroll"))
    {
      objc_msgSend(v10, "locationInView:", self);
      v6 = v5;
      v8 = v7;
      -[UIScrollView _autoScrollAssistant](self, "_autoScrollAssistant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "autoScrollFromPoint:", v6, v8);

      goto LABEL_6;
    }
LABEL_5:
    -[UIScrollView _stopAutoScrollAssistant](self, "_stopAutoScrollAssistant");
  }
LABEL_6:

}

- (BOOL)_isAutoScrollEnabled
{
  return (*((_DWORD *)&self->_scrollViewFlags + 5) & 4) == 0;
}

- (BOOL)_supportsPointerDragScrolling
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 23) & 1;
}

- (void)_handleDirectionalPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
  -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:nudgingBoundsWithVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:nudgingBoundsWithVelocity:", 1, a3, a4);
  -[UIScrollView _handleDirectionalScrollToOffset:clampingToBounds:](self, "_handleDirectionalScrollToOffset:clampingToBounds:", 1, self->_pageDecelerationTarget.x, self->_pageDecelerationTarget.y);
}

- (void)_handleDirectionalPress:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == 1 || objc_msgSend(v12, "changeCount"))
  {
    v4 = -[UIGestureRecognizer isEnabled](self->_pan, "isEnabled");
    -[UIGestureRecognizer setEnabled:](self->_pan, "setEnabled:", 0);
    -[UIGestureRecognizer setEnabled:](self->_pan, "setEnabled:", v4);
    v5 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
    v6 = objc_msgSend(v12, "activePressType");
    if ((v5 & 0x20) != 0)
    {
      if (v6 == 3)
        v7 = 1.0;
      else
        v7 = 0.0;
      if (v6 == 2)
        v8 = -1.0;
      else
        v8 = v7;
      v9 = objc_msgSend(v12, "activePressType", v6, v7);
      if (v9 == 1)
        v10 = 1.0;
      else
        v10 = 0.0;
      if (v9)
        v11 = v10;
      else
        v11 = -1.0;
      -[UIScrollView _handleDirectionalPageWithHorizontalVelocity:verticalVelocity:](self, "_handleDirectionalPageWithHorizontalVelocity:verticalVelocity:", v8, v11);
    }
    else
    {
      -[UIScrollView _offsetToScrollToForArrowPressType:](self, "_offsetToScrollToForArrowPressType:", v6);
      -[UIScrollView _handleDirectionalScrollToOffset:clampingToBounds:](self, "_handleDirectionalScrollToOffset:clampingToBounds:", 1);
    }
  }

}

- (void)_handleDirectionalScrollToOffset:(CGPoint)a3 clampingToBounds:(BOOL)a4
{
  -[UIScrollView _handleDirectionalScrollToOffset:clampingToBounds:duration:](self, "_handleDirectionalScrollToOffset:clampingToBounds:duration:", a4, a3.x, a3.y, self->_contentOffsetAnimationDuration);
}

- (void)_handleDirectionalScrollToOffset:(CGPoint)a3 clampingToBounds:(BOOL)a4 duration:(double)a5
{
  double y;
  double x;
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
  double v23;
  double v24;
  void *v26;
  double v27;
  double v28;
  CGPoint v29;

  y = a3.y;
  x = a3.x;
  v29 = a3;
  -[UIScrollView contentOffset](self, "contentOffset");
  v11 = v10;
  v13 = v12;
  -[UIScrollView _velocityForAnimatedScrollFromOffset:toOffset:duration:](self, "_velocityForAnimatedScrollFromOffset:toOffset:duration:");
  v15 = v14;
  v17 = v16;
  -[UIScrollView _scrollViewWillBeginDragging](self, "_scrollViewWillBeginDragging");
  -[UIScrollView _performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:](self, "_performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:", &v29, v15, v17, x, y);
  if (a4)
  {
    -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset");
    v19 = v18;
    -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
    if (v20 < v29.x)
      v20 = v29.x;
    if (v19 <= v20)
      v20 = v19;
    -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset", *(_QWORD *)&v20);
    v22 = v21;
    -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
    v24 = v29.y;
    if (v23 >= v29.y)
      v24 = v23;
    if (v22 <= v24)
      v24 = v22;
    v29.y = v24;
  }
  else
  {
    v24 = v29.y;
  }
  if (v11 == v29.x && v13 == v24)
  {
    -[UIScrollView _scrollViewDidEndDraggingForDelegateWithDeceleration:](self, "_scrollViewDidEndDraggingForDelegateWithDeceleration:", 0);
  }
  else
  {
    -[UIScrollView _scrollViewDidEndDraggingForDelegateWithDeceleration:](self, "_scrollViewDidEndDraggingForDelegateWithDeceleration:", 1);
    +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeAnimationsForTarget:ofKind:", self, objc_opt_class());

    -[UIScrollView _adjustedContentOffsetForContentOffset:](self, "_adjustedContentOffsetForContentOffset:", v29.x, v29.y);
    if (v29.x == v28 && v29.y == v27)
      -[UIScrollView _performDirectionalScrollAnimationToTargetOffset:duration:](self, "_performDirectionalScrollAnimationToTargetOffset:duration:", v29.x, v29.y, a5);
    else
      -[UIScrollView _performDirectionalBounceFromOffset:toTargetOffset:](self, "_performDirectionalBounceFromOffset:toTargetOffset:", v11, v13, v29.x, v29.y);
  }
}

- (void)_performDirectionalScrollAnimationToTargetOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;

  y = a3.y;
  x = a3.x;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DirectionalScrollAnimationDuration, (uint64_t)CFSTR("DirectionalScrollAnimationDuration"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v6 = 0.3;
  else
    v6 = *(double *)&qword_1EDDA8460;
  -[UIScrollView _performDirectionalScrollAnimationToTargetOffset:duration:](self, "_performDirectionalScrollAnimationToTargetOffset:duration:", x, y, v6);
}

- (void)_performDirectionalScrollAnimationToTargetOffset:(CGPoint)a3 duration:(double)contentOffsetAnimationDuration
{
  double y;
  double x;
  id v8;
  int v9;
  double v10;
  void *v11;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewWillBeginDecelerating:", self);
  if (contentOffsetAnimationDuration < 0.0)
    contentOffsetAnimationDuration = self->_contentOffsetAnimationDuration;
  v8 = objc_alloc(MEMORY[0x1E0CD2848]);
  v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DirectionalScrollAnimationBounce, (uint64_t)CFSTR("DirectionalScrollAnimationBounce"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v10 = 0.0;
  if (!v9)
    v10 = *(double *)&qword_1EDDA8470;
  v11 = (void *)objc_msgSend(v8, "initWithPerceptualDuration:bounce:", contentOffsetAnimationDuration, v10);
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x4000uLL;
  -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 1, 3, 0, v11, x, y);

}

- (void)_performDirectionalBounceFromOffset:(CGPoint)a3 toTargetOffset:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double accuracy;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[UIScrollView _pushTrackingRunLoopModeIfNecessaryForReason:](self, "_pushTrackingRunLoopModeIfNecessaryForReason:", CFSTR("Directional bounce for CarPlay"));
  -[UIScrollView _updateDecelerationLastOffset:](self, "_updateDecelerationLastOffset:", v7, v6);
  self->_previousHorizontalVelocity = 0.0;
  self->_previousVerticalVelocity = 0.0;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DirectionalScrollBounceVelocityMagnitude, (uint64_t)CFSTR("DirectionalScrollBounceVelocityMagnitude"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v9 = 0.8;
  else
    v9 = *(double *)&qword_1EDDA8480;
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  self->_horizontalVelocity = 0.0;
  accuracy = self->_accuracy;
  v19 = self->_firstPageOffset.horizontal - v18;
  if (accuracy == 1.0)
  {
    if (x >= round(v19))
    {
      v23 = round(v16 + self->_contentSize.width);
      v25 = round(v11);
LABEL_10:
      v27 = x <= v23 - v25;
      v26 = v9;
      if (v27)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v20 = floor(v19);
    if (x >= v20 + round(accuracy * (v19 - v20)) / accuracy)
    {
      v21 = v16 + self->_contentSize.width;
      v22 = floor(v21);
      v23 = v22 + round(accuracy * (v21 - v22)) / accuracy;
      v24 = floor(v11);
      v25 = v24 + round((v11 - v24) * accuracy) / accuracy;
      goto LABEL_10;
    }
  }
  v26 = -v9;
LABEL_11:
  self->_horizontalVelocity = v26;
LABEL_12:
  self->_verticalVelocity = 0.0;
  v28 = self->_accuracy;
  v29 = self->_firstPageOffset.vertical - v14;
  if (v28 != 1.0)
  {
    v30 = floor(v29);
    if (y >= v30 + round(v28 * (v29 - v30)) / v28)
    {
      v31 = v15 + self->_contentSize.height;
      v32 = floor(v31);
      v33 = v32 + round(v28 * (v31 - v32)) / v28;
      v34 = floor(v13);
      v35 = v34 + round((v13 - v34) * v28) / v28;
      goto LABEL_18;
    }
LABEL_16:
    v9 = -v9;
LABEL_19:
    self->_verticalVelocity = v9;
    goto LABEL_20;
  }
  if (y < round(v29))
    goto LABEL_16;
  v33 = round(v15 + self->_contentSize.height);
  v35 = round(v13);
LABEL_18:
  if (y > v33 - v35)
    goto LABEL_19;
LABEL_20:
  -[UIScrollView _startTimer:](self, "_startTimer:", 1);
}

- (CGPoint)_offsetToScrollToForArrowPressType:(int64_t)a3
{
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
  double v23;
  double v24;
  CGPoint result;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[UIScrollView contentOffset](self, "contentOffset");
  v10 = v9;
  v12 = v11;
  v13 = v6 * 0.5;
  v14 = v8 * 0.5;
  switch(a3)
  {
    case 0:
      v12 = v12 - v14;
      break;
    case 1:
      v12 = v12 + v14;
      break;
    case 2:
      v10 = v10 - v13;
      break;
    case 3:
      v10 = v10 + v13;
      break;
    default:
      break;
  }
  -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset", v13, v14);
  v16 = v15;
  -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
  if (v17 < v10)
    v17 = v10;
  if (v16 <= v17)
    v18 = v16;
  else
    v18 = v17;
  -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset");
  v20 = v19;
  -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
  if (v21 >= v12)
    v22 = v21;
  else
    v22 = v12;
  if (v20 <= v22)
    v23 = v20;
  else
    v23 = v22;
  v24 = v18;
  result.y = v23;
  result.x = v24;
  return result;
}

- (CGPoint)_velocityForAnimatedScrollFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4 duration:(double)a5
{
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v5 = a5 * 1000.0;
  v6 = (a4.x - a3.x) / v5;
  v7 = (a4.y - a3.y) / v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)allowsKeyboardScrolling
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  char v5;
  BOOL v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t);
  void *v13;
  UIScrollView *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *((_DWORD *)&self->_scrollViewFlags + 5) & 3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __39__UIScrollView_allowsKeyboardScrolling__block_invoke;
  v13 = &unk_1E16B2268;
  v14 = self;
  v3 = v11;
  v4 = v3;
  if (v2 == 2)
  {
    v6 = 1;
  }
  else if (v2 == 1)
  {
    v6 = 0;
  }
  else
  {
    if (v2)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v16 = v2;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
        }

      }
      else
      {
        v7 = _UITriStateToBool___s_category_2;
        if (!_UITriStateToBool___s_category_2)
        {
          v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&_UITriStateToBool___s_category_2);
        }
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v16 = v2;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
        }
      }
      v5 = v12((uint64_t)v4);
    }
    else
    {
      v5 = __39__UIScrollView_allowsKeyboardScrolling__block_invoke((uint64_t)v3);
    }
    v6 = v5;
  }

  return v6;
}

uint64_t __39__UIScrollView_allowsKeyboardScrolling__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  result = dyld_program_sdk_at_least();
  if ((_DWORD)result)
    return v2 == 6 || (v2 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  return result;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    -[UIResponder touchesMoved:withEvent:](&v4, sel_touchesMoved_withEvent_, a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x800000000000) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIScrollView;
    -[UIResponder touchesEnded:withEvent:](&v4, sel_touchesEnded_withEvent_, a3, a4);
  }
}

- (_UIScrollViewScrollingAnimator)_scrollingAnimator
{
  _UIScrollViewScrollingAnimator *keyboardScrollingAnimator;
  _UIScrollViewScrollingAnimator *v4;
  _UIScrollViewScrollingAnimator *v5;

  keyboardScrollingAnimator = self->_keyboardScrollingAnimator;
  if (!keyboardScrollingAnimator)
  {
    v4 = -[_UIScrollViewScrollingAnimator initWithScrollView:]([_UIScrollViewScrollingAnimator alloc], "initWithScrollView:", self);
    v5 = self->_keyboardScrollingAnimator;
    self->_keyboardScrollingAnimator = v4;

    keyboardScrollingAnimator = self->_keyboardScrollingAnimator;
  }
  return keyboardScrollingAnimator;
}

- (BOOL)_allowsKeyboardEventsToScroll
{
  _BOOL4 v3;

  v3 = -[UIScrollView allowsKeyboardScrolling](self, "allowsKeyboardScrolling");
  if (v3)
    LOBYTE(v3) = -[UIScrollView _canScrollX](self, "_canScrollX") || -[UIScrollView _canScrollY](self, "_canScrollY");
  return v3;
}

- (void)_handleKeyboardScrollingPressGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIGestureRecognizer _activePressesEvent](v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v6, "_activeEventOfType:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v6, "state") == 1)
  {
    -[UIScrollView _scrollingAnimator](self, "_scrollingAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlePressEventIfInterested:", v4);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v6, "state") >= 3)
  {
    -[UIScrollView _scrollingAnimator](self, "_scrollingAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishHandlingPressEvent:", v4);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "handlePressEventIfInterested:", v7), v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    -[UIResponder pressesBegan:withEvent:](&v10, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "isHandlingPressEvent:", v7), v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    -[UIResponder pressesChanged:withEvent:](&v10, sel_pressesChanged_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "finishHandlingPressEvent:", v7), v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    -[UIResponder pressesEnded:withEvent:](&v10, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIScrollView _platformUsesGestureRecognizersForKeyboardScrolling](self, "_platformUsesGestureRecognizersForKeyboardScrolling")|| !-[UIScrollView _allowsKeyboardEventsToScroll](self, "_allowsKeyboardEventsToScroll")|| (-[UIScrollView _scrollingAnimator](self, "_scrollingAnimator"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "finishHandlingPressEvent:", v7), v8, (v9 & 1) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)UIScrollView;
    -[UIResponder pressesCancelled:withEvent:](&v10, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (BOOL)_forwardsTouchesUpResponderChain
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 47) & 1;
}

- (void)_setForwardsTouchesUpResponderChain:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)_forcePanGestureToEndImmediately
{
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;

  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(_QWORD *)&self->_scrollViewFlags & 3) == 1
    && -[UIGestureRecognizer state](self->_pan, "state") == UIGestureRecognizerStateCancelled)
  {
    -[UIScrollView _handlePanFailure](self, "_handlePanFailure");
  }
  *(_QWORD *)((char *)p_scrollViewFlags + 12) |= 0x400000000000000uLL;
  -[UIGestureRecognizer setEnabled:](self->_pan, "setEnabled:", 0);
  -[UIGestureRecognizer setEnabled:](self->_pan, "setEnabled:", 1);
  *(_QWORD *)((char *)p_scrollViewFlags + 12) &= ~0x400000000000000uLL;
}

- (BOOL)cancelTouchTracking
{
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;

  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(_BYTE *)&self->_scrollViewFlags & 1) != 0
    && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x400000000000000) == 0)
  {
    -[UIScrollView _trackingDidEnd](self, "_trackingDidEnd");
    *(_QWORD *)p_scrollViewFlags &= ~2uLL;
    -[UIScrollView _didEndDirectManipulationWithScrubbingDirection:](self, "_didEndDirectManipulationWithScrubbingDirection:", ((unint64_t)*((unsigned int *)p_scrollViewFlags + 5) >> 11) & 0xF);
    *((_DWORD *)p_scrollViewFlags + 5) &= 0xFFFF87FF;
    v4 = *(_QWORD *)p_scrollViewFlags;
    -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, (v4 >> 23) & 1);
    if (!self->_scrollHeartbeat)
      -[UIScrollView _popTrackingRunLoopModeIfNecessaryForReason:](self, "_popTrackingRunLoopModeIfNecessaryForReason:", CFSTR("Cancel touch tracking"));
    if ((v4 & 0x800000) != 0)
      -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
    if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self)
      || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
    {
      -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 0, 0);
    }
    -[UIScrollView _updateAccessories](self, "_updateAccessories");
    if ((v4 & 0x800000) != 0)
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v10 = v5;
      v11 = v6;
      -[UIScrollView _performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:](self, "_performScrollViewWillEndDraggingInvocationsWithVelocity:targetContentOffset:unclampedOriginalTarget:", &v10, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v5, v6);
      -[UIScrollView contentOffset](self, "contentOffset");
      if (v10 != v8 || v11 != v7)
        -[UIScrollView setContentOffset:](self, "setContentOffset:", v10, v11, v7);
      -[UIScrollView _scrollViewDidEndDraggingForDelegateWithDeceleration:](self, "_scrollViewDidEndDraggingForDelegateWithDeceleration:", 0);
    }
  }
  return 1;
}

- (BOOL)_touchMayChangeSelection
{
  return !-[UIScrollView isDragging](self, "isDragging");
}

- (BOOL)_isInterruptingDeceleration
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 51) & 1;
}

- (BOOL)bouncesZoom
{
  return (*(_BYTE *)&self->_scrollViewFlags >> 6) & 1;
}

- (BOOL)canCancelContentTouches
{
  return (*((unsigned __int8 *)&self->_scrollViewFlags + 2) >> 1) & 1;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
  UIView *v3;
  char v4;

  v3 = view;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[UIView isEnabled](v3, "isEnabled"))
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;
  }

  return v4 & 1;
}

- (BOOL)scrollsToTop
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x1000) == 0;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = -[UIScrollView _scrollToTopIfPossible:](self, "_scrollToTopIfPossible:", 1);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _BOOL8))v7 + 2))(v7, v5);
    v6 = v7;
  }

}

- (double)_pagingFriction
{
  return self->_pagingFriction;
}

- (void)_setPagingFriction:(double)a3
{
  if (self->_pagingFriction != a3)
    self->_pagingFriction = a3;
}

- (double)_defaultPagingFriction
{
  double v2;
  double result;

  -[UIView bounds](self, "bounds");
  result = v2 * 0.00000994318182 + 0.966818182;
  if (v2 > 1024.0)
    return 0.977;
  return result;
}

- (void)_setPageDecelerationTarget:(CGPoint)a3
{
  self->_pageDecelerationTarget = a3;
}

- (id)_assertionController
{
  _UIAssertionController *assertionController;
  _UIAssertionController *v4;
  _UIAssertionController *v5;

  assertionController = self->_assertionController;
  if (!assertionController)
  {
    v4 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", self);
    v5 = self->_assertionController;
    self->_assertionController = v4;

    assertionController = self->_assertionController;
  }
  return assertionController;
}

- (id)_takeScrollAnimatingAssertionWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIScrollView _assertionController](self, "_assertionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vendAssertionOfType:initialState:reason:", 1, 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  CGPoint v10;
  CGSize v11;
  UIEdgeInsets v12;

  v9.receiver = self;
  v9.super_class = (Class)UIScrollView;
  -[UIView description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  -[UIScrollView contentOffset](self, "contentOffset");
  NSStringFromCGPoint(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView contentSize](self, "contentSize");
  NSStringFromCGSize(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView adjustedContentInset](self, "adjustedContentInset");
  NSStringFromUIEdgeInsets(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("; contentOffset: %@; contentSize: %@; adjustedContentInset: %@>"),
    v5,
    v6,
    v7);

  return (NSString *)v4;
}

- (void)_setRelativePanView:(id)a3
{
  objc_storeWeak((id *)&self->_relativePanView, a3);
}

- (BOOL)_wantsConstrainedContentSize
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 41) & 1;
}

- (void)_setAutomaticContentConstraints:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView.m"), 8642, CFSTR("automatic scroll view content size constraints not used on Okemo and later"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__UIScrollView__setAutomaticContentConstraints___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  v6 = v9;
  if (self)
  {
    v7 = -[UIView _layoutEngineCreateIfNecessary](self, "_layoutEngineCreateIfNecessary");
    if (v7)
    {
      objc_msgSend(v7, "withAutomaticOptimizationDisabled:", v10);
      v6 = v11;
    }
    else
    {
      __48__UIScrollView__setAutomaticContentConstraints___block_invoke((uint64_t)v10);
      v6 = v9;
    }
  }

}

void __48__UIScrollView__setAutomaticContentConstraints___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1896);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        -[UIView _layoutEngine_willRemoveLayoutConstraint:](*(void **)(a1 + 32), *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1896);
  *(_QWORD *)(v8 + 1896) = v7;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 1896);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[UIView _layoutEngine_didAddLayoutConstraint:roundingAdjustment:mutuallyExclusiveConstraints:](*(void **)(a1 + 32), *(void **)(*((_QWORD *)&v15 + 1) + 8 * v14++), 0, 0.0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)_setContentMarginsGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentMarginsGuide, a3);
}

- (id)nsli_layoutMarginsItem
{
  UILayoutGuide *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  -[UIScrollView _contentMarginsGuideIfExists](self, "_contentMarginsGuideIfExists");
  v3 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(UILayoutGuide);
    -[UILayoutGuide setIdentifier:](v3, "setIdentifier:", CFSTR("UIScrollViewContentMarginsGuide"));
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v3);
    -[UILayoutGuide _setLockedToOwningView:](v3, "_setLockedToOwningView:", 1);
    -[UILayoutGuide _setAllowsNegativeDimensions:](v3, "_setAllowsNegativeDimensions:", 1);
    -[UIView layoutMargins](self, "layoutMargins");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIScrollView contentLayoutGuide](self, "contentLayoutGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIdentifier:", CFSTR("UIScrollView-content-margins-top"));
    -[UILayoutGuide leftAnchor](v3, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setIdentifier:", CFSTR("UIScrollView-content-margins-left"));
    objc_msgSend(v12, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setIdentifier:", CFSTR("UIScrollView-content-margins-bottom"));
    objc_msgSend(v12, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide rightAnchor](v3, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setIdentifier:", CFSTR("UIScrollView-content-margins-right"));
    v29[0] = v15;
    v29[1] = v18;
    v29[2] = v21;
    v29[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](v3, "_setSystemConstraints:", v25);

    v26 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](v3, "_systemConstraints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v27);

    -[UIScrollView _setContentMarginsGuide:](self, "_setContentMarginsGuide:", v3);
  }
  return v3;
}

- (id)_layoutVariablesWithAmbiguousValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)UIScrollView;
  -[UIView _layoutVariablesWithAmbiguousValue](&v19, sel__layoutVariablesWithAmbiguousValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_QWORD *)&self->super._viewFlags & 0x800000000000000) != 0
    && (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20000000000) != 0)
  {
    -[UIView _layoutEngine](self, "_layoutEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIScrollView nsli_contentWidthVariable](self, "nsli_contentWidthVariable", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    -[UIScrollView nsli_contentHeightVariable](self, "nsli_contentHeightVariable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v4, "valueOfVariableIsAmbiguous:", v12))
          {
            objc_msgSend(v3, "arrayByAddingObject:", v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v3 = (void *)v13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v9);
    }

  }
  return v3;
}

- (id)_zoomFeedbackGenerator
{
  return self->_zoomFeedbackGenerator;
}

- (void)_activateZoomFeedback
{
  _UIZoomEdgeFeedbackGenerator *zoomFeedbackGenerator;

  zoomFeedbackGenerator = self->_zoomFeedbackGenerator;
  if (zoomFeedbackGenerator)
  {
    -[_UIZoomEdgeFeedbackGenerator setMinimumZoomScale:](zoomFeedbackGenerator, "setMinimumZoomScale:", self->_minimumZoomScale);
    -[_UIZoomEdgeFeedbackGenerator setMaximumZoomScale:](self->_zoomFeedbackGenerator, "setMaximumZoomScale:", self->_maximumZoomScale);
    -[UIScrollView _zoomRubberBandScaleForScale:](self, "_zoomRubberBandScaleForScale:", 0.0);
    -[_UIZoomEdgeFeedbackGenerator setMinimumTemporaryZoomScale:](self->_zoomFeedbackGenerator, "setMinimumTemporaryZoomScale:");
    -[UIScrollView _zoomRubberBandScaleForScale:](self, "_zoomRubberBandScaleForScale:", INFINITY);
    -[_UIZoomEdgeFeedbackGenerator setMaximumTemporaryZoomScale:](self->_zoomFeedbackGenerator, "setMaximumTemporaryZoomScale:");
    -[_UIEdgeFeedbackGenerator userInteractionStarted](self->_zoomFeedbackGenerator, "userInteractionStarted");
  }
}

- (void)_zoomToCenter:(CGPoint)a3 scale:(double)a4 duration:(double)a5
{
  -[UIScrollView _zoomToCenterInternal:scale:duration:allowRubberbanding:force:](self, "_zoomToCenterInternal:scale:duration:allowRubberbanding:force:", (*(_QWORD *)&self->_scrollViewFlags >> 6) & 1, 0, a3.x, a3.y, a4, a5);
}

- (void)_zoomToCenter:(CGPoint)a3 scale:(double)a4 duration:(double)a5 force:(BOOL)a6
{
  -[UIScrollView _zoomToCenterInternal:scale:duration:allowRubberbanding:force:](self, "_zoomToCenterInternal:scale:duration:allowRubberbanding:force:", (*(_QWORD *)&self->_scrollViewFlags >> 6) & 1, a6, a3.x, a3.y, a4, a5);
}

- (double)_zoomRubberBandScaleForScale:(double)result
{
  double maximumZoomScale;
  double v4;

  maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale >= result)
  {
    maximumZoomScale = self->_minimumZoomScale;
    if (maximumZoomScale <= result)
      return result;
    v4 = 1.0 / (2.0 - result / maximumZoomScale);
  }
  else
  {
    v4 = -1.0 / (result / maximumZoomScale) + 2.0;
  }
  return maximumZoomScale * v4;
}

- (double)_zoomScaleForRubberBandScale:(double)result
{
  double maximumZoomScale;
  double v4;
  double v5;

  maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale >= result)
  {
    maximumZoomScale = self->_minimumZoomScale;
    if (maximumZoomScale <= result)
      return result;
    v4 = -1.0 / (result / maximumZoomScale);
    v5 = 2.0;
  }
  else
  {
    v4 = (result / maximumZoomScale + -1.0) / (2.0 - result / maximumZoomScale);
    v5 = 1.0;
  }
  return maximumZoomScale * (v4 + v5);
}

- (void)_markScrollViewAnimationForKey:(id)a3 ofView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationForKey:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v10, &__animatingScrollViewKey, self, 0);

  }
}

- (BOOL)_ownsAnimationForKey:(id)a3 ofView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIScrollView *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(v11, &__animatingScrollViewKey);
    v12 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == self;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (float)_zoomAnimationDurationForScale:(double)a3
{
  long double v4;
  double v5;

  -[UIScrollView zoomScale](self, "zoomScale");
  v5 = log(v4);
  return fmin(vabdd_f64(v5, log(a3)) * 0.3 + 0.1, 0.4);
}

- (void)_zoomAnimationDidStop
{
  unint64_t zoomAnimationCount;
  id zoomAnimation;
  UIViewAnimationState *zoomAnimationState;
  double v6;
  double v7;
  id WeakRetained;
  void *v9;

  zoomAnimationCount = self->_zoomAnimationCount;
  if (zoomAnimationCount)
    self->_zoomAnimationCount = zoomAnimationCount - 1;
  zoomAnimation = self->_zoomAnimation;
  self->_zoomAnimation = 0;

  zoomAnimationState = self->_zoomAnimationState;
  self->_zoomAnimationState = 0;

  -[UIScrollView zoomScale](self, "zoomScale");
  v7 = v6;
  if (v6 >= self->_minimumZoomScale && v6 <= self->_maximumZoomScale)
  {
    if (!self->_zoomAnimationCount)
    {
      *(_QWORD *)&self->_scrollViewFlags &= 0xFFFFFFFF7FFFFF7FLL;
      -[UIScrollView _scrollViewDidEndZooming](self, "_scrollViewDidEndZooming");
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "scrollViewDidEndZooming:withView:atScale:", self, v9, v7);

      }
      if (self->_shadows)
        -[UIScrollView _adjustBackgroundShadowsForContentSizeForcedVisible:](self, "_adjustBackgroundShadowsForContentSizeForcedVisible:", 0);

    }
  }
  else
  {
    -[UIScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
  -[_UIEdgeFeedbackGenerator _animationEnded](self->_zoomFeedbackGenerator, "_animationEnded");
}

- (void)setZoomScale:(double)a3 withAnchorPoint:(CGPoint)a4 allowRubberbanding:(BOOL)a5 animated:(BOOL)a6 duration:(double)a7 notifyDelegate:(BOOL)a8
{
  -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:force:", a5, a6, a8, 0, a3, a4.x, a4.y, a7);
}

void __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  float v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(double *)(a1 + 40);
  if (v7 == -1.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_zoomAnimationDurationForScale:", *(double *)(a1 + 48));
    v7 = v8;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_2;
  v10[3] = &unk_1E16B1BF8;
  v11 = v5;
  v9 = v5;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, v6, v7, 0.0);

}

uint64_t __103__UIScrollView_setZoomScale_withAnchorPoint_allowRubberbanding_animated_duration_notifyDelegate_force___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048624, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

- (void)zoomToRect:(CGRect)rect animated:(BOOL)animated
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
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
  double accuracy;
  double v37;
  double v38;
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
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float v58;
  double v59;
  double v60;
  id v61;

  v4 = animated;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v61 = v10;
    -[UIView bounds](self, "bounds");
    v13 = v11;
    v14 = v12;
    if (height * (v11 / width) <= v12)
      v15 = v11 / width;
    else
      v15 = v12 / height;
    if (v15 != 0.0)
    {
      -[UIScrollView _clampedZoomScale:allowRubberbanding:](self, "_clampedZoomScale:allowRubberbanding:", 0, v15);
      v15 = v16;
    }
    -[UIScrollView zoomScale](self, "zoomScale");
    v18 = v17;
    v19 = x + width * 0.5;
    v20 = y + height * 0.5;
    if (v15 == v18)
    {
      v60 = v13;
      objc_msgSend(v61, "convertPoint:toView:", self, v19, v20);
      v22 = v21;
      v24 = v23;
      -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
      v26 = v25;
      v28 = v27;
      v59 = v29;
      v31 = v30;
      -[UIView bounds](self, "bounds");
      v33 = v22 - v32 * 0.5;
      -[UIView bounds](self, "bounds");
      v35 = v24 - v34 * 0.5;
      accuracy = self->_accuracy;
      v37 = self->_firstPageOffset.horizontal - v28;
      if (accuracy == 1.0)
      {
        v51 = round(v37);
        if (v33 >= v51)
          v51 = v33;
        v52 = round(v31 + self->_contentSize.width) - v60;
        if (v51 >= v52)
          v44 = v52;
        else
          v44 = v51;
        v53 = round(self->_firstPageOffset.vertical - v26);
        if (v35 < v53)
          v35 = v53;
        v49 = round(v59 + self->_contentSize.height);
      }
      else
      {
        v38 = floor(v37);
        v39 = v38 + round(accuracy * (v37 - v38)) / accuracy;
        if (v33 >= v39)
          v39 = v33;
        v40 = self->_contentSize.height;
        v41 = v31 + self->_contentSize.width;
        v42 = floor(v41);
        v43 = v42 + round(accuracy * (v41 - v42)) / accuracy - v60;
        if (v39 >= v43)
          v44 = v43;
        else
          v44 = v39;
        v45 = self->_firstPageOffset.vertical - v26;
        v46 = floor(v45);
        v47 = v46 + round(accuracy * (v45 - v46)) / accuracy;
        if (v35 < v47)
          v35 = v47;
        v48 = floor(v59 + v40);
        v49 = v48 + round(accuracy * (v59 + v40 - v48)) / accuracy;
      }
      v54 = v49 - v14;
      if (v35 >= v54)
        v55 = v54;
      else
        v55 = v35;
      if (v4 || (dyld_program_sdk_at_least() & 1) == 0)
      {
        -[UIScrollView _contentOffsetAnimationDuration](self, "_contentOffsetAnimationDuration");
        v57 = v56;
        -[UIScrollView _zoomAnimationDurationForScale:](self, "_zoomAnimationDurationForScale:", v15);
        -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v58);
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v44, v55);
        -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v57);
      }
      else
      {
        -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v44, v55);
      }
    }
    else
    {
      v50 = -1.0;
      if (!v4)
        v50 = 0.0;
      -[UIScrollView _zoomToCenterInternal:scale:duration:allowRubberbanding:force:](self, "_zoomToCenterInternal:scale:duration:allowRubberbanding:force:", 0, 0, v19, v20, v15, v50);
    }
    v10 = v61;
  }

}

- (BOOL)_getPagingDecelerationOffset:(CGPoint *)a3 forTimeInterval:(double)a4
{
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double accuracy;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint *p_pageDecelerationTarget;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void (**v39)(_QWORD);
  void (**v40)(_QWORD);
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
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  _BOOL4 v62;
  _BOOL4 v63;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v70;
  _BOOL4 v71;
  _BOOL4 v72;
  _QWORD v73[7];
  _QWORD aBlock[7];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;

  -[UIScrollView contentOffset](self, "contentOffset");
  v9 = v7;
  v10 = v8;
  if (a4 <= 0.0)
  {
    v13 = 0;
    a3->x = v7;
    a3->y = v8;
    goto LABEL_98;
  }
  p_scrollViewFlags = &self->_scrollViewFlags;
  v12 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v12 & 0x40) != 0 && a3->x >= self->_pageDecelerationTarget.x)
  {
    v14 = 1;
LABEL_10:
    v72 = v14;
    if ((v12 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  if ((v12 & 0x80) != 0)
  {
    v14 = a3->x <= self->_pageDecelerationTarget.x;
    goto LABEL_10;
  }
  v72 = 0;
  if ((v12 & 0x100) == 0)
    goto LABEL_12;
LABEL_11:
  if (a3->y >= self->_pageDecelerationTarget.y)
  {
    v15 = 1;
    goto LABEL_16;
  }
LABEL_12:
  if ((v12 & 0x200) == 0)
  {
    v71 = 0;
    goto LABEL_17;
  }
  v15 = a3->y <= self->_pageDecelerationTarget.y;
LABEL_16:
  v71 = v15;
LABEL_17:
  v16 = (uint64_t)a4;
  if ((uint64_t)a4 < 1)
  {
    v21 = 0.0;
    v18 = 0.0;
    v17 = v7;
  }
  else
  {
    v17 = v7;
    do
    {
      v18 = self->_pageDecelerationTarget.x - v17;
      v19 = self->_horizontalVelocity + v18 * self->_pagingSpringPull;
      self->_horizontalVelocity = v19;
      v20 = v19 * self->_pagingFriction;
      self->_horizontalVelocity = v20;
      v21 = self->_pageDecelerationTarget.y - v8;
      v22 = self->_verticalVelocity + v21 * self->_pagingSpringPull;
      self->_verticalVelocity = v22;
      v17 = v17 + v20;
      v23 = self->_pagingFriction * v22;
      self->_verticalVelocity = v23;
      v8 = v8 + v23;
      --v16;
    }
    while (v16);
  }
  accuracy = self->_accuracy;
  if (accuracy == 1.0)
  {
    v26 = round(v17);
    v28 = round(v8);
  }
  else
  {
    v25 = floor(v17);
    v26 = v25 + round((v17 - v25) * accuracy) / accuracy;
    v27 = floor(v8);
    v28 = v27 + round((v8 - v27) * accuracy) / accuracy;
  }
  p_pageDecelerationTarget = &self->_pageDecelerationTarget;
  v30 = v26 != self->_pageDecelerationTarget.x && v9 == v26;
  if (v30 && self->_horizontalVelocity < 0.5)
  {
    v31 = -1.0;
    if (v18 < 0.0)
      v31 = 1.0;
    v32 = v26 - v31 / accuracy;
    if (accuracy == 1.0)
    {
      v9 = round(v32);
    }
    else
    {
      v33 = floor(v32);
      v9 = v33 + round(accuracy * (v32 - v33)) / accuracy;
    }
  }
  else
  {
    v9 = v26;
  }
  v34 = v28 != self->_pageDecelerationTarget.y && v10 == v28;
  if (v34 && self->_verticalVelocity < 0.5)
  {
    v35 = -1.0;
    if (v21 < 0.0)
      v35 = 1.0;
    v36 = v28 - v35 / accuracy;
    if (accuracy == 1.0)
    {
      v10 = round(v36);
    }
    else
    {
      v37 = floor(v36);
      v10 = v37 + round(accuracy * (v36 - v37)) / accuracy;
    }
  }
  else
  {
    v10 = v28;
  }
  a3->x = v9;
  a3->y = v10;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v38 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke;
  aBlock[3] = &unk_1E16C8D08;
  aBlock[5] = &v79;
  aBlock[6] = a3;
  aBlock[4] = self;
  v39 = (void (**)(_QWORD))_Block_copy(aBlock);
  v73[0] = v38;
  v73[1] = 3221225472;
  v73[2] = __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke_2;
  v73[3] = &unk_1E16C8D08;
  v73[5] = &v75;
  v73[6] = a3;
  v73[4] = self;
  v40 = (void (**)(_QWORD))_Block_copy(v73);
  if (fabs(self->_horizontalVelocity) < 0.01 && fabs(v18) <= 1.0 && vabdd_f64(v9, p_pageDecelerationTarget->x) < 5.0)
    v39[2](v39);
  if (fabs(self->_verticalVelocity) < 0.01 && fabs(v21) <= 1.0 && vabdd_f64(v10, self->_pageDecelerationTarget.y) < 5.0)
    v40[2](v40);
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset", 1208);
  v44 = v43;
  v46 = v45;
  if (*((_BYTE *)v80 + 24) || (*(_BYTE *)p_scrollViewFlags & 8) != 0)
    goto LABEL_66;
  v47 = *(double *)((char *)&self->super.super.super.isa + v70);
  v48 = self->_firstPageOffset.horizontal - v41;
  if (v47 != 1.0)
  {
    v49 = floor(v48);
    if (v9 >= v49 + round(v47 * (v48 - v49)) / v47)
    {
      v50 = v42 + self->_contentSize.width;
      v51 = floor(v50);
      v52 = v51 + round(v47 * (v50 - v51)) / v47;
      goto LABEL_64;
    }
LABEL_65:
    v39[2](v39);
    goto LABEL_66;
  }
  if (v9 < round(v48))
    goto LABEL_65;
  v52 = round(v42 + self->_contentSize.width);
LABEL_64:
  -[UIView bounds](self, "bounds");
  if (v9 > v52 - v53)
    goto LABEL_65;
LABEL_66:
  if (*((_BYTE *)v76 + 24) || (*(_BYTE *)p_scrollViewFlags & 4) != 0)
    goto LABEL_75;
  v54 = *(double *)((char *)&self->super.super.super.isa + v70);
  v55 = self->_firstPageOffset.vertical - v44;
  if (v54 != 1.0)
  {
    v56 = floor(v55);
    if (v10 >= v56 + round(v54 * (v55 - v56)) / v54)
    {
      v57 = v46 + self->_contentSize.height;
      v58 = floor(v57);
      v59 = v58 + round(v54 * (v57 - v58)) / v54;
      goto LABEL_73;
    }
LABEL_74:
    v40[2](v40);
    goto LABEL_75;
  }
  if (v10 < round(v55))
    goto LABEL_74;
  v59 = round(v46 + self->_contentSize.height);
LABEL_73:
  -[UIView bounds](self, "bounds");
  if (v10 > v59 - v60)
    goto LABEL_74;
LABEL_75:
  v61 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v61 & 0x40) != 0 && a3->x >= p_pageDecelerationTarget->x)
  {
    v62 = 1;
    if ((v61 & 0x100) == 0)
      goto LABEL_84;
  }
  else if ((v61 & 0x80) != 0)
  {
    v62 = a3->x <= p_pageDecelerationTarget->x;
    if ((v61 & 0x100) == 0)
    {
LABEL_84:
      v63 = (v61 & 0x200) != 0 && a3->y <= self->_pageDecelerationTarget.y;
      goto LABEL_88;
    }
  }
  else
  {
    v62 = 0;
    if ((v61 & 0x100) == 0)
      goto LABEL_84;
  }
  if (a3->y < self->_pageDecelerationTarget.y)
    goto LABEL_84;
  v63 = 1;
LABEL_88:
  if (v72 && !v62 && fabs(self->_horizontalVelocity) < 0.1)
    v39[2](v39);
  if (v71 && !v63 && fabs(self->_verticalVelocity) < 0.1)
    v40[2](v40);
  if (*((_BYTE *)v80 + 24))
    v13 = *((_BYTE *)v76 + 24) != 0;
  else
    v13 = 0;

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
LABEL_98:
  v64 = &self->_scrollViewFlags;
  v65 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v65 & 0x100) != 0 && v10 < self->_pageDecelerationTarget.y)
  {
    v66 = 16;
  }
  else if ((v65 & 0x200) != 0)
  {
    v66 = 16 * (v10 > self->_pageDecelerationTarget.y);
  }
  else
  {
    v66 = 0;
  }
  v67 = *(_QWORD *)v64 & 0xFFFFFFFFFFFFFFEFLL | v66;
  *(_QWORD *)v64 = v67;
  if ((v65 & 0x40) != 0 && v9 < self->_pageDecelerationTarget.x)
  {
    v68 = 32;
  }
  else if ((v65 & 0x80) != 0)
  {
    v68 = 32 * (v9 > self->_pageDecelerationTarget.x);
  }
  else
  {
    v68 = 0;
  }
  *(_QWORD *)v64 = v68 | v67 & 0xFFFFFFFFFFFFFFDFLL;
  return v13;
}

double __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 848);
  **(double **)(a1 + 48) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1780) &= ~0x40uLL;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1780) &= ~0x80uLL;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 744) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

double __61__UIScrollView__getPagingDecelerationOffset_forTimeInterval___block_invoke_2(_QWORD *a1)
{
  double result;

  result = *(double *)(a1[4] + 856);
  *(double *)(a1[6] + 8) = result;
  *(_QWORD *)(a1[4] + 1780) &= ~0x100uLL;
  *(_QWORD *)(a1[4] + 1780) &= ~0x200uLL;
  *(_QWORD *)(a1[4] + 752) = 0;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  return result;
}

- (CGPoint)_pageDecelerationTarget
{
  double x;
  double y;
  CGPoint result;

  x = self->_pageDecelerationTarget.x;
  y = self->_pageDecelerationTarget.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)_getBouncingDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 lastUpdateOffset:(double)a5 min:(double)a6 max:(double)a7 decelerationFactor:(double)a8 decelerationLnFactor:(double)a9 velocity:(double *)a10
{
  double v10;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
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
  double v38;
  double v39;
  BOOL v40;
  double accuracy;
  double v42;
  double v43;
  BOOL v44;

  if (a6 >= a7)
    v10 = a6;
  else
    v10 = a7;
  if (!a10)
    return 0;
  if (a5 < a6 || v10 < a5)
  {
    v20 = a4;
  }
  else
  {
    v21 = *a10;
    if (*a10 == 0.0)
      goto LABEL_47;
    v22 = a4 * a9;
    if (a4 * a9 >= -0.5)
      v23 = v22 * (v22 * 0.5 + 1.0) + 1.0;
    else
      v23 = exp(v22);
    v24 = (1.0 - v23) / (1.0 - a8) * a8;
    v25 = *a3 + self->_fastScrollMultiplier * (v21 * v24);
    *a3 = v25;
    v20 = 0.0;
    v26 = v25 < a6 || v25 > v10;
    v27 = a4;
    if (v26)
    {
      if (v25 >= a6)
      {
        v28 = (v10 - a5) * a4;
        v29 = v25 - a5;
      }
      else
      {
        v28 = (a5 - a6) * a4;
        v29 = a5 - v25;
      }
      v27 = v28 / v29;
      v20 = a4 - v27;
    }
    if (v27 > 0.0)
    {
      if (v27 != a4)
      {
        v30 = v27 * a9;
        if (v27 * a9 >= -0.5)
          v23 = v30 * (v30 * 0.5 + 1.0) + 1.0;
        else
          v23 = exp(v30);
        v24 = (1.0 - v23) / (1.0 - a8) * a8;
      }
      *a3 = v24 * *a10 * self->_fastScrollMultiplier + a5;
      *a10 = v23 * *a10;
    }
  }
  if (v20 > 0.0)
  {
    v31 = v20 * a9;
    if (v20 * a9 >= -0.5)
      v32 = v31 * (v31 * 0.5 + 1.0) + 1.0;
    else
      v32 = exp(v31);
    v33 = v20 * -0.01005;
    if (v20 * -0.01005 >= -0.5)
      v34 = v33 * (v33 * 0.5 + 1.0) + 1.0;
    else
      v34 = exp(v33);
    if ((*((_DWORD *)&self->_scrollViewFlags + 5) & 0x40000) != 0)
    {
      *a10 = fmax(fmin(*a10, 3.0), -3.0);
      *((_DWORD *)&self->_scrollViewFlags + 5) &= ~0x40000u;
    }
    if (*a3 >= a6)
      v35 = v34 * (*a3 - v10);
    else
      v35 = a6;
    if (*a3 >= a6)
      v36 = v10;
    else
      v36 = v34 * (*a3 - a6);
    v37 = v36 + v35;
    *a3 = v37;
    *a3 = v37 + (1.0 - v32) * (v34 * a8 * *a10) / (1.0 - a8);
    *a10 = v32 * v34 * *a10;
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
    -[UIScrollView _resetDiscreteFastScroll](self, "_resetDiscreteFastScroll");
  }
LABEL_47:
  v38 = *a3;
  v39 = v10 + 0.5;
  v40 = v10 > 0.0 || v38 < v39;
  if (!v40
    && ((accuracy = self->_accuracy, accuracy == 1.0)
      ? (v43 = round(v38))
      : (v42 = floor(v38), v43 = v42 + round((v38 - v42) * accuracy) / accuracy),
        v43 != 0.0)
    || (v38 > a6 + -0.5 ? (v44 = v38 < v39) : (v44 = 0), !v44))
  {
    self->_fastScrollCount = 0;
    self->_fastScrollMultiplier = 1.0;
    -[UIScrollView _resetDiscreteFastScroll](self, "_resetDiscreteFastScroll");
    return 1;
  }
  return 0;
}

- (void)_getStandardDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 min:(double)a5 max:(double)a6 decelerationFactor:(double)a7 decelerationLnFactor:(double)a8 velocity:(double *)a9
{
  double v11;
  double v14;
  double v15;
  double v16;

  v11 = a5;
  if (a5 >= a6)
    v14 = a5;
  else
    v14 = a6;
  v15 = a4 * a8;
  if (v15 >= -0.5)
    v16 = v15 * (v15 * 0.5 + 1.0) + 1.0;
  else
    v16 = exp(v15);
  *a3 = *a3 + self->_fastScrollMultiplier * (*a9 * ((1.0 - v16) / (1.0 - a7) * a7));
  *a9 = v16 * *a9;
  if (*a3 < v11 || (v11 = v14, *a3 > v14))
  {
    *a3 = v11;
    *a9 = 0.0;
  }
}

- (BOOL)_smoothScrollApplyPendingAsyncCompletionResultWithUpdateTime:(uint64_t)a1 outFinishedDecelerating:(_BYTE *)a2
{
  id *v4;
  id *v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;

  if (!a1)
    return 0;
  if (a2)
    *a2 = 0;
  v4 = (id *)*(id *)(a1 + 1824);
  v5 = v4;
  v6 = v4 != 0;
  if (v4)
  {
    v7 = v4[5];
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "removeObjectAtIndex:", 0);
      v9 = objc_msgSend(v8, "finishedDecelerating");
      if (v9)
      {
        v10 = *(void **)(a1 + 1824);
        *(_QWORD *)(a1 + 1824) = 0;

        if (a2)
          *a2 = 1;
      }
      v11 = objc_msgSend(v8, "handled");
      objc_msgSend(v8, "updateTime");
      if (v11)
      {
        *(_QWORD *)(a1 + 656) = v12;
        if (v9)
          objc_msgSend((id)a1, "_stopScrollingNotify:pin:", 1, 1);
      }
      else
      {
        objc_msgSend((id)a1, "_smoothScrollSyncWithUpdateTime:");
      }
    }

  }
  return v6;
}

- (void)_smoothScrollWithUpdateTime:(double)a3
{
  void *v5;
  _BOOL4 v6;
  char v7;

  if ((*(_BYTE *)&self->_scrollViewFlags & 1) == 0)
  {
    v5 = (void *)MEMORY[0x186DC9484]();
    v7 = 0;
    v6 = -[UIScrollView _smoothScrollApplyPendingAsyncCompletionResultWithUpdateTime:outFinishedDecelerating:]((uint64_t)self, &v7);
    if (!v7)
    {
      if (v6)
        -[UIScrollView _smoothScrollAsyncWithUpdateTime:state:](self, "_smoothScrollAsyncWithUpdateTime:state:", self->_asyncScrollDecelerationState, a3);
      else
        -[UIScrollView _smoothScrollSyncWithUpdateTime:](self, "_smoothScrollSyncWithUpdateTime:", a3);
    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)_smoothScrollAsyncWithUpdateTime:(double)a3 state:(id)a4
{
  char *v7;
  double v8;
  double width;
  double height;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  double v22;
  double v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  __int128 v29;

  v7 = (char *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView.m"), 9973, CFSTR("Must have async scroll event state"));

  }
  v8 = *((double *)v7 + 1);
  *((double *)v7 + 1) = a3;
  if ((a3 - v8) * 1000.0 >= 1.0 && !v7[48])
  {
    v29 = *MEMORY[0x1E0C9D538];
    width = self->_adjustedDecelerationFactor.width;
    if (width == 0.0)
      width = self->_decelerationFactor.width;
    -[UIScrollView _getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:", &v29, v7 + 24, (a3 - v8) * 1000.0, -1.79769313e308, 1.79769313e308, width, self->_decelerationLnFactorH);
    height = self->_adjustedDecelerationFactor.height;
    if (height == 0.0)
      height = self->_decelerationFactor.height;
    -[UIScrollView _getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:", (char *)&v29 + 8, v7 + 32, (a3 - v8) * 1000.0, -1.79769313e308, 1.79769313e308, height, self->_decelerationLnFactorV);
    v11 = hypot(*((long double *)v7 + 3), *((long double *)v7 + 4));
    v12 = (void *)objc_msgSend(*((id *)v7 + 2), "_cloneEvent");
    objc_msgSend(v12, "_simulateMomentumWithDelta:inView:", self, -*(double *)&v29, -*((double *)&v29 + 1));
    if (v11 < 0.01)
      v7[48] = 1;
    v13 = (void *)*((_QWORD *)v7 + 5);
    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = (void *)*((_QWORD *)v7 + 5);
      *((_QWORD *)v7 + 5) = v14;

      v13 = (void *)*((_QWORD *)v7 + 5);
    }
    v16 = v13;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__UIScrollView__smoothScrollAsyncWithUpdateTime_state___block_invoke;
    v19[3] = &unk_1E16EAB70;
    v22 = v8;
    v23 = a3;
    v24 = v11 < 0.01;
    v17 = v16;
    v20 = v17;
    v21 = &v25;
    -[UIScrollView _asynchronouslyDeliverScrollEvent:completion:](self, "_asynchronouslyDeliverScrollEvent:completion:", v12, v19);
    if (*((_BYTE *)v26 + 24))
      -[UIScrollView _smoothScrollApplyPendingAsyncCompletionResultWithUpdateTime:outFinishedDecelerating:]((uint64_t)self, 0);

    _Block_object_dispose(&v25, 8);
  }

}

void __55__UIScrollView__smoothScrollAsyncWithUpdateTime_state___block_invoke(uint64_t a1, uint64_t a2)
{
  _UIScrollViewAsyncScrollEventCompletionResult *v4;

  v4 = objc_alloc_init(_UIScrollViewAsyncScrollEventCompletionResult);
  -[_UIScrollViewAsyncScrollEventCompletionResult setHandled:](v4, "setHandled:", a2);
  -[_UIScrollViewAsyncScrollEventCompletionResult setLastUpdateTime:](v4, "setLastUpdateTime:", *(double *)(a1 + 48));
  -[_UIScrollViewAsyncScrollEventCompletionResult setUpdateTime:](v4, "setUpdateTime:", *(double *)(a1 + 56));
  -[_UIScrollViewAsyncScrollEventCompletionResult setFinishedDecelerating:](v4, "setFinishedDecelerating:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

- (void)_smoothScrollSyncWithUpdateTime:(double)a3
{
  double v5;
  CGPoint lastSetContentOffsetUnrounded;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double lastUpdateOffsetX;
  double lastUpdateOffsetY;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BOOL4 v34;
  double accuracy;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  BOOL v45;
  double x;
  double v47;
  double v48;
  double width;
  _BOOL4 v50;
  uint64_t v51;
  double verticalVelocity;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
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
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  BOOL v73;
  double y;
  double v75;
  double v76;
  double v77;
  _BOOL4 v78;
  uint64_t v79;
  double height;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  unsigned __int8 v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGSize v99;
  CGSize lastOffsetUpdateOffset;
  double v101;
  double v102;
  CGPoint v103;
  CGPoint v104;
  float64_t v105;
  double v106;

  v5 = (a3 - self->_lastUpdateTime) * 1000.0;
  lastSetContentOffsetUnrounded = self->_lastSetContentOffsetUnrounded;
  if (v5 < 1.0)
    goto LABEL_106;
  v103 = self->_lastSetContentOffsetUnrounded;
  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  v102 = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView bounds](self, "bounds");
  lastUpdateOffsetX = self->_lastUpdateOffsetX;
  lastUpdateOffsetY = self->_lastUpdateOffsetY;
  v105 = lastUpdateOffsetX;
  v106 = lastUpdateOffsetY;
  p_scrollViewFlags = &self->_scrollViewFlags;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    v34 = -[UIScrollView _getPagingDecelerationOffset:forTimeInterval:](self, "_getPagingDecelerationOffset:forTimeInterval:", &v105, v5);
    goto LABEL_97;
  }
  v19 = v14;
  v20 = v15;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v101 = v23;
  v25 = v24;
  v26 = *(_QWORD *)p_scrollViewFlags;
  if ((*(_QWORD *)p_scrollViewFlags & 8) != 0)
  {
    accuracy = self->_accuracy;
    v36 = self->_firstPageOffset.horizontal - v21;
    if (accuracy == 1.0)
    {
      v38 = round(v36);
      v41 = round(v22 + self->_contentSize.width);
    }
    else
    {
      v37 = floor(v36);
      v38 = v37 + round(accuracy * (v36 - v37)) / accuracy;
      v39 = v22 + self->_contentSize.width;
      v40 = floor(v39);
      v41 = v40 + round(accuracy * (v39 - v40)) / accuracy;
    }
    v42 = v38 - v9;
    v43 = v13 + v41 - v19;
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000) != 0)
    {
      v44 = v25;
      if ((v26 & 0x30) != 0 || (lastUpdateOffsetX >= v42 ? (v45 = lastUpdateOffsetX <= v43) : (v45 = 0), !v45))
      {
        x = self->_adjustedDecelerationTarget.x;
        if (x >= v42)
          v47 = self->_adjustedDecelerationTarget.x;
        else
          v47 = v42;
        if (lastUpdateOffsetX >= x)
          v47 = v42;
        if (x >= v43)
          v48 = v43;
        else
          v48 = self->_adjustedDecelerationTarget.x;
        if (lastUpdateOffsetX <= x)
          v42 = v47;
        else
          v43 = v48;
      }
    }
    else
    {
      v44 = v25;
    }
    width = self->_adjustedDecelerationFactor.width;
    if (width == 0.0)
      width = self->_decelerationFactor.width;
    v50 = -[UIScrollView _getBouncingDecelerationOffset:forTimeInterval:lastUpdateOffset:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getBouncingDecelerationOffset:forTimeInterval:lastUpdateOffset:min:max:decelerationFactor:decelerationLnFactor:velocity:", &v105, &self->_horizontalVelocity, v5, self->_lastUpdateOffsetX, v42, v43, width, self->_decelerationLnFactorH);
    v51 = 32;
    if (!v50)
      v51 = 0;
    v26 = *(_QWORD *)p_scrollViewFlags & 0xFFFFFFFFFFFFFFDFLL | v51;
    *(_QWORD *)p_scrollViewFlags = v26;
    v25 = v44;
  }
  else if (self->_horizontalVelocity != 0.0)
  {
    *(_QWORD *)p_scrollViewFlags = v26 & 0xFFFFFFFFFFFFFFDFLL;
    v27 = self->_accuracy;
    v28 = self->_firstPageOffset.horizontal - v21;
    if (v27 == 1.0)
    {
      v30 = round(v28);
      v33 = round(v22 + self->_contentSize.width);
    }
    else
    {
      v29 = floor(v28);
      v30 = v29 + round(v27 * (v28 - v29)) / v27;
      v31 = v22 + self->_contentSize.width;
      v32 = floor(v31);
      v33 = v32 + round(v27 * (v31 - v32)) / v27;
    }
    v60 = v25;
    v61 = self->_adjustedDecelerationFactor.width;
    if (v61 == 0.0)
      v61 = self->_decelerationFactor.width;
    -[UIScrollView _getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:", &v105, v5, v30, v33 - v19, v61, self->_decelerationLnFactorH);
    v26 = *(_QWORD *)p_scrollViewFlags;
    v25 = v60;
    if ((*(_QWORD *)p_scrollViewFlags & 4) != 0)
      goto LABEL_42;
LABEL_35:
    verticalVelocity = self->_verticalVelocity;
    if (verticalVelocity != 0.0)
    {
      *(_QWORD *)p_scrollViewFlags = v26 & 0xFFFFFFFFFFFFFFEFLL;
      v53 = self->_accuracy;
      v54 = self->_firstPageOffset.vertical - v101;
      if (v53 == 1.0)
      {
        v56 = round(v54);
        v59 = round(v25 + self->_contentSize.height);
      }
      else
      {
        v55 = floor(v54);
        v56 = v55 + round(v53 * (v54 - v55)) / v53;
        v57 = v25 + self->_contentSize.height;
        v58 = floor(v57);
        v59 = v58 + round(v53 * (v57 - v58)) / v53;
      }
      height = self->_adjustedDecelerationFactor.height;
      if (height == 0.0)
        height = self->_decelerationFactor.height;
      -[UIScrollView _getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getStandardDecelerationOffset:forTimeInterval:min:max:decelerationFactor:decelerationLnFactor:velocity:", &v106, v5, v56, v59 - v20, height, self->_decelerationLnFactorV);
      v26 = *(_QWORD *)p_scrollViewFlags;
    }
    goto LABEL_74;
  }
  if ((v26 & 4) == 0)
    goto LABEL_35;
LABEL_42:
  v62 = self->_accuracy;
  v63 = v25 + self->_contentSize.height;
  if (v62 == 1.0)
  {
    v65 = round(v63);
  }
  else
  {
    v64 = floor(v63);
    v65 = v64 + round(v62 * (v63 - v64)) / v62;
  }
  -[UIScrollView _maxTopOffsetAdjustedForRevealableContentPadding:](self, "_maxTopOffsetAdjustedForRevealableContentPadding:", v11 + v65 - v20);
  v67 = v66;
  v68 = self->_accuracy;
  v69 = self->_firstPageOffset.vertical - v101;
  if (v68 == 1.0)
  {
    v71 = round(v69);
  }
  else
  {
    v70 = floor(v69);
    v71 = v70 + round(v68 * (v69 - v70)) / v68;
  }
  v72 = v71 - v102;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x8000000000) != 0)
  {
    if ((*(_BYTE *)p_scrollViewFlags & 0x30) != 0 || (v106 >= v72 ? (v73 = v106 <= v67) : (v73 = 0), !v73))
    {
      y = self->_adjustedDecelerationTarget.y;
      if (y >= v72)
        v75 = self->_adjustedDecelerationTarget.y;
      else
        v75 = v71 - v102;
      if (v106 >= y)
        v75 = v71 - v102;
      if (y >= v67)
        v76 = v67;
      else
        v76 = self->_adjustedDecelerationTarget.y;
      if (v106 <= y)
        v72 = v75;
      else
        v67 = v76;
    }
  }
  v77 = self->_adjustedDecelerationFactor.height;
  if (v77 == 0.0)
    v77 = self->_decelerationFactor.height;
  v78 = -[UIScrollView _getBouncingDecelerationOffset:forTimeInterval:lastUpdateOffset:min:max:decelerationFactor:decelerationLnFactor:velocity:](self, "_getBouncingDecelerationOffset:forTimeInterval:lastUpdateOffset:min:max:decelerationFactor:decelerationLnFactor:velocity:", &v106, &self->_verticalVelocity, v5, self->_lastUpdateOffsetY, v72, v67, v77, self->_decelerationLnFactorV);
  v79 = 16;
  if (!v78)
    v79 = 0;
  v26 = *(_QWORD *)p_scrollViewFlags & 0xFFFFFFFFFFFFFFEFLL | v79;
  *(_QWORD *)p_scrollViewFlags = v26;
LABEL_74:
  if ((v26 & 0x30) != 0)
  {
    v34 = 0;
  }
  else
  {
    verticalVelocity = self->_horizontalVelocity;
    v34 = verticalVelocity * verticalVelocity + self->_verticalVelocity * self->_verticalVelocity < 0.0001;
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000) != 0)
    {
      if (verticalVelocity > 0.0 && (v81 = self->_adjustedDecelerationTarget.x, v105 >= v81)
        || verticalVelocity < 0.0 && (v81 = self->_adjustedDecelerationTarget.x, v105 <= v81))
      {
        v105 = v81;
        self->_horizontalVelocity = 0.0;
        verticalVelocity = fabs(self->_verticalVelocity);
        if (verticalVelocity < 0.01)
          v34 = 1;
      }
      else
      {
        verticalVelocity = fabs(verticalVelocity);
        if (verticalVelocity < 0.01)
        {
          verticalVelocity = v105;
          v82 = self->_adjustedDecelerationTarget.x;
          if (v105 != v82)
          {
            v34 = 0;
            verticalVelocity = dbl_186685490[v105 < v82];
            self->_horizontalVelocity = verticalVelocity;
          }
        }
      }
    }
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x8000000000) != 0)
    {
      v83 = self->_verticalVelocity;
      if (v83 > 0.0 && (v84 = self->_adjustedDecelerationTarget.y, v106 >= v84)
        || v83 < 0.0 && (v84 = self->_adjustedDecelerationTarget.y, v106 <= v84))
      {
        v106 = v84;
        self->_verticalVelocity = 0.0;
        verticalVelocity = fabs(self->_horizontalVelocity);
        if (verticalVelocity < 0.01)
          v34 = 1;
      }
      else
      {
        verticalVelocity = fabs(v83);
        if (verticalVelocity < 0.01)
        {
          verticalVelocity = v106;
          v85 = self->_adjustedDecelerationTarget.y;
          if (v106 != v85)
          {
            v34 = 0;
            verticalVelocity = dbl_186685490[v106 < v85];
            self->_verticalVelocity = verticalVelocity;
          }
        }
      }
    }
  }
  -[UIScrollView _updateRubberbandingStatisticTrackingState](self, "_updateRubberbandingStatisticTrackingState", verticalVelocity);
LABEL_97:
  -[UIScrollView contentOffset](self, "contentOffset");
  v88 = v87;
  v89 = *(uint64_t *)&self->_accuracy;
  if (*(double *)&v89 == 1.0)
  {
    v94 = v106;
    if (round(v105) == round(v86))
    {
      v96 = round(v106);
      v98 = round(v88);
LABEL_102:
      if (v96 == v98)
        goto LABEL_104;
    }
  }
  else
  {
    v90.f64[0] = v105;
    v90.f64[1] = v86;
    v91 = vrndmq_f64(v90);
    v92 = vaddq_f64(v91, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v90, v91), *(double *)&v89)), (float64x2_t)vdupq_lane_s64(v89, 0)));
    v93 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vceqq_f64(v92, (float64x2_t)vdupq_laneq_s64((int64x2_t)v92, 1)))).u8[0];
    v94 = v106;
    if ((v93 & 1) == 0)
    {
      v95 = floor(v106);
      v96 = v95 + round(*(double *)&v89 * (v106 - v95)) / *(double *)&v89;
      v97 = floor(v88);
      v98 = v97 + round(*(double *)&v89 * (v88 - v97)) / *(double *)&v89;
      goto LABEL_102;
    }
  }
  ++dword_1EDDB0BEC;
LABEL_104:
  self->_lastUpdateOffsetX = v105;
  self->_lastUpdateOffsetY = v94;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) |= 0x80000uLL;
  -[UIScrollView setContentOffset:](self, "setContentOffset:");
  lastSetContentOffsetUnrounded = v103;
  if (v34)
  {
    -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 1);
    lastSetContentOffsetUnrounded = v103;
  }
LABEL_106:
  if (qword_1EDDB0C58 != -1)
  {
    v104 = lastSetContentOffsetUnrounded;
    dispatch_once(&qword_1EDDB0C58, &__block_literal_global_1836);
    lastSetContentOffsetUnrounded = v104;
  }
  if (_MergedGlobals_118)
  {
    v99 = (CGSize)vsubq_f64((float64x2_t)lastSetContentOffsetUnrounded, (float64x2_t)self->_lastSetContentOffsetUnrounded);
    lastOffsetUpdateOffset = self->_lastOffsetUpdateOffset;
    self->_lastOffsetUpdateOffset = v99;
    *(int32x2_t *)&v99.width = vmovn_s64(vcltzq_f64(vmulq_f64((float64x2_t)lastOffsetUpdateOffset, (float64x2_t)v99)));
    if (((LODWORD(v99.width) | HIDWORD(v99.width)) & 1) != 0)
      self->_smoothScrollCallbackSkips = -1;
    self->_lastOffsetUpdateTimeInterval = a3 - self->_lastUpdateTime;
  }
  self->_lastUpdateTime = a3;
}

- (void)_smoothScrollDisplayLink:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  int8x16_t v10;
  int64_t v11;
  int64_t smoothScrollCallbackCurrentSkipCount;
  id v13;

  v13 = a3;
  kdebug_trace();
  if (_UIUpdateCycleEnabled())
    v4 = *(double *)&_currentModelMediaTime;
  else
    v4 = 0.0;
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    objc_msgSend(v13, "timestamp");
    v4 = v5;
  }
  objc_msgSend(v13, "targetTimestamp");
  v7 = v6;
  v8 = _UIMachTimeForMediaTime(v4);
  v9 = _UIMachTimeForMediaTime(v7);
  _UIQOSProcessingBegin("UIScrollViewSmoothScrollDisplayLink", 0, v8, v9);
  if (qword_1EDDB0C58 != -1)
    dispatch_once(&qword_1EDDB0C58, &__block_literal_global_1836);
  if (!_MergedGlobals_118)
    goto LABEL_22;
  if (self->_lastOffsetUpdateTimeInterval > 0.0)
  {
    v10 = vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)self->_lastOffsetUpdateOffset), (int8x16_t)vnegq_f64((float64x2_t)self->_lastOffsetUpdateOffset), (int8x16_t)self->_lastOffsetUpdateOffset);
    if (*(double *)v10.i64 < *(double *)&v10.i64[1])
      v10.i64[0] = v10.i64[1];
    if (*(double *)v10.i64 > 0.0 && !self->_smoothScrollCallbackCurrentSkipCount)
    {
      if (*(double *)v10.i64 > 0.75 || self->_smoothScrollCallbackSkips)
      {
        if (*(double *)v10.i64 > 0.5 || self->_smoothScrollCallbackSkips != 1)
          goto LABEL_19;
        v11 = -1;
      }
      else
      {
        v11 = 1;
      }
      self->_smoothScrollCallbackSkips = v11;
    }
  }
LABEL_19:
  smoothScrollCallbackCurrentSkipCount = self->_smoothScrollCallbackCurrentSkipCount;
  if (self->_smoothScrollCallbackSkips > smoothScrollCallbackCurrentSkipCount)
  {
    self->_smoothScrollCallbackCurrentSkipCount = smoothScrollCallbackCurrentSkipCount + 1;
    kdebug_trace();
    goto LABEL_25;
  }
  self->_smoothScrollCallbackCurrentSkipCount = 0;
LABEL_22:
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCommitTime:", v4 + (v7 - v4) * 0.5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setLowLatency:", 0);
  }
  -[UIScrollView _smoothScrollWithUpdateTime:](self, "_smoothScrollWithUpdateTime:", v4);
LABEL_25:
  _UIQOSProcessingEnd();

}

- (void)_pushTrackingRunLoopModeIfNecessaryForReason:(id)a3
{
  uint64_t scrollViewFlags;
  int has_internal_diagnostics;
  id WeakRetained;
  void *v7;
  id v8;
  NSTimer *trackingWatchdogTimer;
  int v10;
  double v11;
  void *v12;
  id v13;
  NSTimer *v14;
  NSTimer *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  uint8_t buf[16];

  scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x100000000) == 0)
  {
    *(_QWORD *)&self->_scrollViewFlags = scrollViewFlags | 0x100000000;
    objc_msgSend((id)UIApp, "_pushRunLoopMode:requester:reason:", CFSTR("UITrackingRunLoopMode"), self, a3);
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystemHoldingLock);

    if (has_internal_diagnostics)
    {
      if (WeakRetained)
      {
        __UIFaultDebugAssertLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "Found a focus system already holding a lock for this scroll view when trying to set a lock.", buf, 2u);
        }

      }
    }
    else if (WeakRetained)
    {
      v18 = _pushTrackingRunLoopModeIfNecessaryForReason____s_category;
      if (!_pushTrackingRunLoopModeIfNecessaryForReason____s_category)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&_pushTrackingRunLoopModeIfNecessaryForReason____s_category);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Found a focus system already holding a lock for this scroll view when trying to set a lock.", buf, 2u);
      }
    }
    -[UIView _focusSystem](self, "_focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_focusSystemHoldingLock, v7);

    v8 = objc_loadWeakRetained((id *)&self->_focusSystemHoldingLock);
    objc_msgSend(v8, "_lockEnvironment:", self);

    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    {
      trackingWatchdogTimer = self->_trackingWatchdogTimer;
      if (trackingWatchdogTimer)
        -[NSTimer invalidate](trackingWatchdogTimer, "invalidate");
      v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SpringBoardTrackingModeWatchdogTimeout, (uint64_t)CFSTR("SpringBoardTrackingModeWatchdogTimeout"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v11 = *(double *)&qword_1EDDA8400;
      if (v10)
        v11 = 60.0;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0C99E88]);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__UIScrollView__pushTrackingRunLoopModeIfNecessaryForReason___block_invoke;
      v20[3] = &unk_1E16C4358;
      v20[4] = self;
      v14 = (NSTimer *)objc_msgSend(v13, "initWithFireDate:interval:repeats:block:", v12, 0, v20, 0.0);
      v15 = self->_trackingWatchdogTimer;
      self->_trackingWatchdogTimer = v14;

      if (self->_trackingWatchdogTimer)
      {
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTimer:forMode:", self->_trackingWatchdogTimer, CFSTR("UITrackingRunLoopMode"));

      }
    }
    -[UIScrollView _beginScrollingCursorOverrideIfNecessary](self, "_beginScrollingCursorOverrideIfNecessary");
  }
}

void __61__UIScrollView__pushTrackingRunLoopModeIfNecessaryForReason___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_popTrackingRunLoopModeIfNecessaryForReason:", CFSTR("WATCHDOG TIMED OUT"));
  v2 = _UIScrollViewContentYOffsetConstraintIdentifier_block_invoke_2___s_category;
  if (!_UIScrollViewContentYOffsetConstraintIdentifier_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("SpringBoardRunLoopMode", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIScrollViewContentYOffsetConstraintIdentifier_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v6;
    v10 = 2050;
    v11 = v7;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "Tracking run loop mode watchdog triggered (42144269) <%{public}@ %{public}p>", (uint8_t *)&v8, 0x16u);

  }
}

- (void)_bumpTrackingWatchdogTimer
{
  int v3;
  double v4;
  id v5;

  if (objc_msgSend((id)UIApp, "_isSpringBoard") && self->_trackingWatchdogTimer)
  {
    v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SpringBoardTrackingModeWatchdogTimeout, (uint64_t)CFSTR("SpringBoardTrackingModeWatchdogTimeout"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v4 = *(double *)&qword_1EDDA8400;
    if (v3)
      v4 = 60.0;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTimer setFireDate:](self->_trackingWatchdogTimer, "setFireDate:", v5);

  }
}

- (void)_runLoopModePopped:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  if (self->_scrollHeartbeat)
  {
    if (GScrollerPoppingRunLoopMode)
      v5 = GScrollerPoppingRunLoopMode == (_QWORD)self;
    else
      v5 = 1;
    if (v5)
    {
      v9 = v4;
      objc_msgSend(v4, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("_UIApplicationRunLoopMode"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("UITrackingRunLoopMode"));

      v4 = v9;
      if (v8)
      {
        -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 1);
        v4 = v9;
      }
    }
  }

}

- (void)_beginScrollingCursorOverrideIfNecessary
{
  UIPointerRegion *v3;
  UIPointerRegion *scrollingPointerRegion;
  void *v5;
  id v6;

  if (((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_OverrideCursorDuringScroll, (uint64_t)CFSTR("OverrideCursorDuringScroll"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD769DC)&& !self->_scrollingPointerRegion)
  {
    -[UIView frame](self, "frame");
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", CFSTR("UIScrollView.scrollingPointerRegion"));
    v3 = (UIPointerRegion *)objc_claimAutoreleasedReturnValue();
    scrollingPointerRegion = self->_scrollingPointerRegion;
    self->_scrollingPointerRegion = v3;

    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPointerRegion setReferenceView:](self->_scrollingPointerRegion, "setReferenceView:", v5);

    ++self->_scrollingPointerRegionGenerationID;
    -[UIPointerRegion setGenerationID:](self->_scrollingPointerRegion, "setGenerationID:");
    +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginScrollingWithRegion:", self->_scrollingPointerRegion);

  }
}

- (void)_endScrollingCursorOverrideIfNecessary
{
  void *v3;
  UIPointerRegion *scrollingPointerRegion;

  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_OverrideCursorDuringScroll, (uint64_t)CFSTR("OverrideCursorDuringScroll"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD769DC)
  {
    if (self->_scrollingPointerRegion)
    {
      +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endScrollingWithRegion:", self->_scrollingPointerRegion);

      scrollingPointerRegion = self->_scrollingPointerRegion;
      self->_scrollingPointerRegion = 0;

    }
  }
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4 nudgingBoundsWithVelocity:(BOOL)a5
{
  -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:nudgingBoundsWithVelocity:performExtraPageIfPastPagingBoundary:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:nudgingBoundsWithVelocity:performExtraPageIfPastPagingBoundary:", a5, 0, a3, a4);
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4 nudgingBoundsWithVelocity:(BOOL)a5 performExtraPageIfPastPagingBoundary:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
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
  BOOL v36;
  double x;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double horizontal;
  double v47;
  double v48;
  double accuracy;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  unint64_t v57;
  BOOL v58;
  char v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double y;
  double v67;
  double v68;
  int v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double vertical;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  unint64_t v87;
  BOOL v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;

  v6 = a6;
  v7 = a5;
  -[UIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v17 = -0.0;
  if (v7)
    v18 = a4;
  else
    v18 = -0.0;
  if (v7)
    v17 = a3;
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    v95 = v18 + v12;
    v19 = v17 + v11;
    -[UIScrollView _interpageSpacing](self, "_interpageSpacing");
    v21 = v14 + v20;
    v94 = v16;
    v96 = v16 + v22;
    -[UIScrollView _pagingOrigin](self, "_pagingOrigin");
    v24 = v23;
    v97 = v25;
    -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
    v91 = v27;
    v92 = v26;
    v93 = v28;
    v30 = v29;
    v31 = v19 - v24;
    v32 = fmod(v19 - v24, v21);
    if (v21 <= 0.0 || v32 == 0.0)
    {
      self->_pageDecelerationTarget.x = v19;
      v35 = v95;
      goto LABEL_59;
    }
    if (a3 > 0.3)
    {
      if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x80) != 0)
      {
        v34 = v21 + self->_pageDecelerationTarget.x;
        v33 = v91;
      }
      else
      {
        self->_pageDecelerationTarget.x = v19;
        if (!v6)
        {
          v33 = v91;
          goto LABEL_22;
        }
        v33 = v91;
        if (v32 / v21 <= 0.5)
        {
LABEL_22:
          v39 = ceil(v31 / v21);
LABEL_31:
          v35 = v95;
LABEL_35:
          v45 = v24 + v21 * v39;
          horizontal = self->_firstPageOffset.horizontal;
          v58 = v39 == 0.0;
          v47 = 0.0;
          if (v58)
            v47 = self->_firstPageOffset.horizontal;
          v48 = v45 + v47;
          self->_pageDecelerationTarget.x = v48;
          accuracy = self->_accuracy;
          v50 = horizontal - v33;
          if (accuracy == 1.0)
          {
            v52 = round(v50);
            v55 = round(v30 + self->_contentSize.width);
          }
          else
          {
            v51 = floor(v50);
            v52 = v51 + round(accuracy * (v50 - v51)) / accuracy;
            v53 = v30 + self->_contentSize.width;
            v54 = floor(v53);
            v55 = v54 + round(accuracy * (v53 - v54)) / accuracy;
          }
          v56 = v55 - v14;
          if (v56 < v48)
            v48 = v56;
          if (v52 >= v48)
            v48 = v52;
          self->_pageDecelerationTarget.x = v48;
          if (a3 <= 0.3)
          {
            if (a3 >= -0.3)
            {
              v58 = v48 < v19 + v24 || a3 == 0.0;
              v59 = v58;
              v60 = 128;
              if (v59)
                v60 = 0;
              v57 = v60 | ((unint64_t)(v48 < v19 + v24) << 6) | *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFF3FLL;
            }
            else
            {
              v57 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFF3FLL | 0x40;
            }
          }
          else
          {
            v57 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFF3FLL | 0x80;
          }
          *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v57;
LABEL_59:
          v61 = v35 - v97;
          v62 = fmod(v35 - v97, v96);
          if (v96 <= 0.0 || v62 == 0.0)
          {
            self->_pageDecelerationTarget.y = v35;
            return;
          }
          if (a4 > 0.3)
          {
            if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x200) != 0)
            {
              v65 = v96 + self->_pageDecelerationTarget.y;
              v64 = v92;
              v63 = v93;
            }
            else
            {
              self->_pageDecelerationTarget.y = v35;
              if (!v6)
              {
                v64 = v92;
                v63 = v93;
                goto LABEL_74;
              }
              v64 = v92;
              v63 = v93;
              if (v62 / v96 <= 0.5)
              {
LABEL_74:
                v68 = ceil(v61 / v96);
LABEL_86:
                v75 = v97 + v96 * v68;
                vertical = self->_firstPageOffset.vertical;
                v58 = v68 == 0.0;
                v77 = 0.0;
                if (v58)
                  v77 = self->_firstPageOffset.vertical;
                v78 = v75 + v77;
                self->_pageDecelerationTarget.y = v78;
                v79 = self->_accuracy;
                v80 = vertical - v64;
                if (v79 == 1.0)
                {
                  v82 = round(v80);
                  v85 = round(v63 + self->_contentSize.height);
                }
                else
                {
                  v81 = floor(v80);
                  v82 = v81 + round(v79 * (v80 - v81)) / v79;
                  v83 = v63 + self->_contentSize.height;
                  v84 = floor(v83);
                  v85 = v84 + round(v79 * (v83 - v84)) / v79;
                }
                v86 = v85 - v94;
                if (v86 < v78)
                  v78 = v86;
                if (v82 >= v78)
                  v78 = v82;
                self->_pageDecelerationTarget.y = v78;
                if (a4 <= 0.3)
                {
                  if (a4 >= -0.3)
                  {
                    v89 = v78 < v35 + v97 || a4 == 0.0;
                    v90 = 512;
                    if (v89)
                      v90 = 0;
                    v87 = v90 | ((unint64_t)(v78 < v35 + v97) << 8) | *(_QWORD *)((char *)&self->_scrollViewFlags
                                                                                       + 12) & 0xFFFFFFFFFFFFFCFFLL;
                  }
                  else
                  {
                    v87 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFCFFLL | 0x100;
                  }
                }
                else
                {
                  v87 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFFFCFFLL | 0x200;
                }
                *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v87;
                return;
              }
              v65 = v35 + v96;
            }
            self->_pageDecelerationTarget.y = v65;
            v61 = v65 - v97;
            goto LABEL_74;
          }
          if (a4 >= -0.3)
          {
            self->_pageDecelerationTarget.y = v35;
            v69 = dyld_program_sdk_at_least();
            v63 = v93;
            if (!v69)
              goto LABEL_79;
            v70 = self->_accuracy;
            v71 = v93 + self->_contentSize.height;
            v58 = v70 == 1.0;
            v72 = round(v71);
            v73 = floor(v71);
            v74 = v73 + round(v70 * (v71 - v73)) / v70;
            if (v58)
              v74 = v72;
            if (v35 >= v74 - v94)
              v68 = ceil((self->_pageDecelerationTarget.y - v97) / v96);
            else
LABEL_79:
              v68 = floor((self->_pageDecelerationTarget.y - v97) / v96 + 0.5);
            v64 = v92;
            goto LABEL_86;
          }
          if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x100) != 0)
          {
            y = self->_pageDecelerationTarget.y;
            v64 = v92;
            v63 = v93;
          }
          else
          {
            if (!v6)
            {
              v67 = v35;
              v64 = v92;
              v63 = v93;
              goto LABEL_82;
            }
            v36 = v62 / v96 < 0.5;
            y = v35;
            v67 = v35;
            v64 = v92;
            v63 = v93;
            if (!v36)
              goto LABEL_82;
          }
          v67 = y - v96;
          v61 = y - v96 - v97;
LABEL_82:
          self->_pageDecelerationTarget.y = v67;
          v68 = floor(v61 / v96);
          goto LABEL_86;
        }
        v34 = v19 + v21;
      }
      self->_pageDecelerationTarget.x = v34;
      v31 = v34 - v24;
      goto LABEL_22;
    }
    if (a3 >= -0.3)
    {
      self->_pageDecelerationTarget.x = v19;
      if (!dyld_program_sdk_at_least())
        goto LABEL_27;
      v40 = self->_accuracy;
      v41 = v30 + self->_contentSize.width;
      v58 = v40 == 1.0;
      v42 = round(v41);
      v43 = floor(v41);
      v44 = v43 + round(v40 * (v41 - v43)) / v40;
      if (v58)
        v44 = v42;
      if (v19 >= v44 - v14)
        v39 = ceil((self->_pageDecelerationTarget.x - v24) / v21);
      else
LABEL_27:
        v39 = floor((self->_pageDecelerationTarget.x - v24) / v21 + 0.5);
      v35 = v95;
      v33 = v91;
      goto LABEL_35;
    }
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x40) != 0)
    {
      x = self->_pageDecelerationTarget.x;
      v33 = v91;
    }
    else
    {
      if (!v6)
      {
        v38 = v19;
        v33 = v91;
        goto LABEL_30;
      }
      v36 = v32 / v21 < 0.5;
      x = v19;
      v38 = v19;
      v33 = v91;
      if (!v36)
        goto LABEL_30;
    }
    v38 = x - v21;
    v31 = x - v21 - v24;
LABEL_30:
    self->_pageDecelerationTarget.x = v38;
    v39 = floor(v31 / v21);
    goto LABEL_31;
  }
}

- (void)_registerForSpringBoardBlankedScreenNotification
{
  id v3;

  if (_registerForSpringBoardBlankedScreenNotification_onceToken != -1)
    dispatch_once(&_registerForSpringBoardBlankedScreenNotification_onceToken, &__block_literal_global_475);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__springBoardBlankedScreenNotification_, CFSTR("_UIScrollViewSpringBoardBlankedScreenNotification"), 0);

}

void __64__UIScrollView__registerForSpringBoardBlankedScreenNotification__block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__SpringBoardBlankedScreen, CFSTR("com.apple.springboard.hasBlankedScreen"), 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_unregisterForSpringBoardBlankedScreenNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIScrollViewSpringBoardBlankedScreenNotification"), 0);

}

- (void)_springBoardBlankedScreenNotification:(id)a3
{
  -[UIScrollView _stopScrollingNotify:pin:](self, "_stopScrollingNotify:pin:", 1, 1);
}

- (void)_startTimer:(BOOL)a3
{
  _BOOL4 v3;
  CADisplayLink *scrollHeartbeat;
  void *v6;
  void *v7;
  void *v8;
  CADisplayLink *v9;
  CADisplayLink *v10;
  CADisplayLink *v11;
  int v12;
  CADisplayLink *v13;
  double v14;
  CADisplayLink *v15;
  void *v16;
  void *v17;
  CGFloat width;
  CGFloat height;
  _BOOL4 v20;
  id v21;
  _UIScrollViewAsyncScrollDecelerationState *v22;
  uint64_t v23;
  UIScrollEvent *scrollEvent;
  double velocityScaleFactor;
  double v26;
  double v27;
  _UIScrollViewAsyncScrollDecelerationState *asyncScrollDecelerationState;
  unint64_t v29;
  NSObject *v30;
  id WeakRetained;
  void *v32;
  id v33;

  v3 = a3;
  if (qword_1EDDB0C58 != -1)
    dispatch_once(&qword_1EDDB0C58, &__block_literal_global_1836);
  if (_MergedGlobals_118)
  {
    self->_smoothScrollCallbackSkips = 0;
    self->_lastOffsetUpdateTimeInterval = 0.0;
  }
  scrollHeartbeat = self->_scrollHeartbeat;
  if (scrollHeartbeat)
  {
    -[CADisplayLink setPaused:](scrollHeartbeat, "setPaused:", 0);
  }
  else
  {
    -[UIView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIView window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayLinkWithTarget:selector:", self, sel__smoothScrollDisplayLink_);
      v9 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v10 = self->_scrollHeartbeat;
      self->_scrollHeartbeat = v9;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__smoothScrollDisplayLink_);
      v11 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v7 = self->_scrollHeartbeat;
      self->_scrollHeartbeat = v11;
    }

    v12 = _UIVariableFrameDurationEnabled();
    v13 = self->_scrollHeartbeat;
    if (v12)
    {
      -[CADisplayLink setHighFrameRateReason:](self->_scrollHeartbeat, "setHighFrameRateReason:", 1048607);
      -[_UIScrollViewVFD updateDisplayLink:]((uint64_t)self->_vfd, self->_scrollHeartbeat);
    }
    else
    {
      -[CADisplayLink maximumRefreshRate](self->_scrollHeartbeat, "maximumRefreshRate");
      if (v14 != 0.0)
        -[CADisplayLink setPreferredFramesPerSecond:](v13, "setPreferredFramesPerSecond:", llround(1.0 / v14));
    }
    v15 = self->_scrollHeartbeat;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v15, "addToRunLoop:forMode:", v16, *MEMORY[0x1E0C99860]);

    -[UIScrollView _registerForSpringBoardBlankedScreenNotification](self, "_registerForSpringBoardBlankedScreenNotification");
    self->_lastUpdateTime = CACurrentMediaTime();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__runLoopModePopped_, CFSTR("_UIApplicationRunLoopModePopNotification"), UIApp);

    dword_1EDDB0BEC = 0;
  }
  width = self->_adjustedDecelerationFactor.width;
  if (width == 0.0)
    width = self->_decelerationFactor.width;
  self->_decelerationLnFactorH = log(width);
  height = self->_adjustedDecelerationFactor.height;
  if (height == 0.0)
    height = self->_decelerationFactor.height;
  self->_decelerationLnFactorV = log(height);
  v33 = 0;
  v20 = -[UIScrollView _canPerformAsyncScrollDecelerationReturningEvent:](self, "_canPerformAsyncScrollDecelerationReturningEvent:", &v33);
  v21 = v33;
  v22 = 0;
  if (v20)
  {
    v22 = objc_alloc_init(_UIScrollViewAsyncScrollDecelerationState);
    v23 = objc_msgSend(v21, "_cloneEvent");
    scrollEvent = v22->_scrollEvent;
    v22->_scrollEvent = (UIScrollEvent *)v23;

    -[UIScrollViewPanGestureRecognizer velocityInView:](self->_pan, "velocityInView:", self);
    velocityScaleFactor = self->_velocityScaleFactor;
    v22->_velocity.dx = -(v26 * velocityScaleFactor);
    v22->_velocity.dy = -(v27 * velocityScaleFactor);
    v22->_lastUpdateTime = self->_lastUpdateTime;
  }

  asyncScrollDecelerationState = self->_asyncScrollDecelerationState;
  self->_asyncScrollDecelerationState = v22;

  if (v3)
  {
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
    _UIQOSManagedCommitsBegin(self, CFSTR("Deceleration"));
    -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 3);
    v29 = qword_1EDDB0C00;
    if (!qword_1EDDB0C00)
    {
      v29 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v29, (unint64_t *)&qword_1EDDB0C00);
    }
    v30 = *(id *)(v29 + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(v29 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v30))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    kdebug_trace();
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "scrollViewWillBeginDecelerating:", self);
    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotificationName:object:", CFSTR("WillStartSmoothScrolling"), self);

  }
}

- (void)_setTopLayoutInsetForSidebar:(double)a3
{
  if (self->_topLayoutInsetForSidebar != a3)
  {
    self->_topLayoutInsetForSidebar = a3;
    -[UIScrollView _layoutAdjustmentsDidChange](self, "_layoutAdjustmentsDidChange");
  }
}

- (CGRect)_scrollIndicatorContainerRect
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
  double v18;
  _BOOL4 v19;
  double v20;
  uint64_t v21;
  BOOL v22;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect result;

  -[UIScrollView _scrollIndicatorAdditionalInset](self, "_scrollIndicatorAdditionalInset");
  v4 = v3;
  -[UIScrollView _effectiveVerticalScrollIndicatorInsets](self, "_effectiveVerticalScrollIndicatorInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIScrollView _effectiveHorizontalScrollIndicatorInsets](self, "_effectiveHorizontalScrollIndicatorInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[UIScrollView _shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis](self, "_shouldReverseLayoutDirectionConsideringFlippedHorizontalAxis");
  v20 = fmax(v6, 0.0);
  v21 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  v22 = (v21 & 0x4000000000000000) != 0 && (*((_BYTE *)&self->_scrollViewFlags + 3) & 1) == 0;
  v23 = v4 + v20;
  if ((v21 & 0x2000000000000000) != 0 && !v22)
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    v23 = fmax(v23, v4 - v24);
  }
  v25 = fmax(v12, 0.0);
  if (v19)
    v25 = 0.0;
  v26 = fmax(v25, v18);
  v27 = fmax(fmax(v10, 0.0), v16);
  v28 = fmax(v8, 0.0);
  if (!v19)
    v28 = 0.0;
  v29 = v4 + v27;
  v30 = v4 + v26;
  v31 = v4 + fmax(v28, v14);
  v32 = fmax(v23, 0.0);
  v33 = fmax(v31, 0.0);
  v34 = fmax(v29, 0.0);
  v35 = fmax(v30, 0.0);
  -[UIView bounds](self, "bounds");
  v37 = v33 + v36;
  v39 = v32 + v38;
  v41 = v40 - (v33 + v35);
  v43 = v42 - (v34 + v32);
  result.size.height = v43;
  result.size.width = v41;
  result.origin.y = v39;
  result.origin.x = v37;
  return result;
}

- (void)_hideScrollIndicator:(id)a3 afterDelay:(double)a4 animated:(BOOL)a5
{
  id v8;
  _UIScrollViewScrollIndicator *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  _UIScrollViewScrollIndicator *v17;
  UIScrollView *v18;
  BOOL v19;

  v8 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke;
  aBlock[3] = &unk_1E16C2A30;
  v9 = (_UIScrollViewScrollIndicator *)v8;
  v17 = v9;
  v18 = self;
  v19 = a5;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (a4 <= 0.0)
  {
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
  }
  else
  {
    if (self->_verticalScrollIndicator == v9)
      v12 = 1512;
    else
      v12 = 1520;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, a4);
    v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v14 = *(Class *)((char *)&self->super.super.super.isa + v12);
    *(Class *)((char *)&self->super.super.super.isa + v12) = v13;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTimer:forMode:", *(Class *)((char *)&self->super.super.super.isa + v12), CFSTR("UITrackingRunLoopMode"));

  }
}

void __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD aBlock[4];
  id v19;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 99;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 1528))
    v5 = 98;
  v6 = OBJC_IVAR___UIScrollViewScrollAnimation__adjustsForContentOffsetDelta[v5];
  v7 = *(void **)(v4 + v6);
  *(_QWORD *)(v4 + v6) = 0;

  if ((*(_DWORD *)(*(_QWORD *)(a1 + 40) + 1788) & 0x300000) == 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_2;
    aBlock[3] = &unk_1E16B1B28;
    v19 = *(id *)(a1 + 32);
    v9 = _Block_copy(aBlock);
    v10 = v9;
    if (*(_BYTE *)(a1 + 48))
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if (v12 == 3)
        v13 = 0;
      else
        v13 = 251658240;
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_3;
      v14[3] = &unk_1E16B7008;
      objc_copyWeak(&v16, &location);
      v15 = *(id *)(a1 + 32);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v13, v10, v14, 0.25, 0.0);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(void *))v9 + 2))(v9);
    }

  }
}

uint64_t __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __57__UIScrollView__hideScrollIndicator_afterDelay_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    WeakRetained[193] = v2;
    objc_msgSend(*(id *)(a1 + 32), "setExpandedForDirectManipulation:", 0);
  }

}

- (void)_hideScrollIndicatorsIfNeededForNewContentSize:(CGSize)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  if (!-[UIScrollView _isAutomaticContentOffsetAdjustmentEnabled](self, "_isAutomaticContentOffsetAdjustmentEnabled"))
  {
    -[UIScrollView _maximumContentOffsetForContentSize:](self, "_maximumContentOffsetForContentSize:", width, height);
    v9 = v8;
    v11 = v10;
    -[UIScrollView contentOffset](self, "contentOffset");
    if (v12 > v11)
      -[UIScrollView _hideScrollIndicator:afterDelay:animated:](self, "_hideScrollIndicator:afterDelay:animated:", self->_verticalScrollIndicator, v4, 0.0);
    -[UIScrollView contentOffset](self, "contentOffset");
    if (v13 > v9)
      -[UIScrollView _hideScrollIndicator:afterDelay:animated:](self, "_hideScrollIndicator:afterDelay:animated:", self->_horizontalScrollIndicator, v4, 0.0);
  }
}

- (CGPoint)_contentOffsetForLowFidelityScrollInDirection:(CGPoint)a3 duration:(double *)a4
{
  double y;
  double x;
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
  double v23;
  double accuracy;
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
  double v37;
  double v38;
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
  double v53;
  double v54;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  -[UIScrollView contentOffset](self, "contentOffset");
  v13 = v12;
  v15 = v14;
  if (-[UIScrollView isScrollAnimating](self, "isScrollAnimating"))
  {
    -[UIScrollView _animatedTargetOffset](self, "_animatedTargetOffset");
    v13 = v16;
    v15 = v17;
  }
  -[UIScrollView _contentOffsetAnimationDuration](self, "_contentOffsetAnimationDuration");
  v19 = v18;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  accuracy = self->_accuracy;
  if (fabs(y) >= 2.22044605e-16)
  {
    v33 = self->_firstPageOffset.vertical - v20;
    if (accuracy != 1.0)
    {
      v34 = floor(v33);
      v27 = v34 + round(accuracy * (v33 - v34)) / accuracy;
      v35 = v22 + self->_contentSize.height;
      v36 = floor(v35);
      v30 = v36 + round(accuracy * (v35 - v36)) / accuracy;
      v31 = floor(v11);
      v32 = v11 - v31;
      goto LABEL_8;
    }
    v27 = round(v33);
    v30 = round(v22 + self->_contentSize.height);
    v37 = round(v11);
  }
  else
  {
    v25 = self->_firstPageOffset.horizontal - v21;
    if (accuracy != 1.0)
    {
      v26 = floor(v25);
      v27 = v26 + round(accuracy * (v25 - v26)) / accuracy;
      v28 = v23 + self->_contentSize.width;
      v29 = floor(v28);
      v30 = v29 + round(accuracy * (v28 - v29)) / accuracy;
      v31 = floor(v9);
      v32 = v9 - v31;
LABEL_8:
      v37 = v31 + round(v32 * accuracy) / accuracy;
      goto LABEL_11;
    }
    v27 = round(v25);
    v30 = round(v23 + self->_contentSize.width);
    v37 = round(v9);
  }
LABEL_11:
  v38 = v30 - v37;
  if (v38 < v27)
    v38 = v27;
  if (y >= 0.0)
  {
    if (y <= 0.0)
    {
      if (x >= 0.0)
      {
        if (x <= 0.0)
          goto LABEL_59;
        if (v13 >= v38)
          v19 = 0.12;
        if (accuracy == 1.0)
        {
          v48 = round(v9);
        }
        else
        {
          v47 = floor(v9);
          v48 = v47 + round((v9 - v47) * accuracy) / accuracy;
        }
        v52 = v13 + v48;
        v13 = v52 <= v38 ? v52 : v38;
        if (v13 != v38)
          goto LABEL_59;
        v51 = 20.0;
      }
      else
      {
        if (v13 <= v27)
          v19 = 0.12;
        if (accuracy == 1.0)
        {
          v44 = round(v9);
        }
        else
        {
          v43 = floor(v9);
          v44 = v43 + round((v9 - v43) * accuracy) / accuracy;
        }
        v50 = v13 - v44;
        if (v50 >= v27)
          v13 = v50;
        else
          v13 = v27;
        if (v13 != v27)
          goto LABEL_59;
        v51 = -20.0;
      }
      v13 = v13 + v51;
      goto LABEL_59;
    }
    if (v15 >= v38)
      v19 = 0.12;
    if (accuracy == 1.0)
    {
      v42 = round(v11);
    }
    else
    {
      v41 = floor(v11);
      v42 = v41 + round((v11 - v41) * accuracy) / accuracy;
    }
    v49 = v15 + v42;
    if (v49 <= v38)
      v15 = v49;
    else
      v15 = v38;
    if (v15 == v38)
    {
      v46 = 20.0;
      goto LABEL_45;
    }
  }
  else
  {
    if (v15 <= v27)
      v19 = 0.12;
    if (accuracy == 1.0)
    {
      v40 = round(v11);
    }
    else
    {
      v39 = floor(v11);
      v40 = v39 + round((v11 - v39) * accuracy) / accuracy;
    }
    v45 = v15 - v40;
    if (v45 >= v27)
      v15 = v45;
    else
      v15 = v27;
    if (v15 == v27)
    {
      v46 = -20.0;
LABEL_45:
      v15 = v15 + v46;
    }
  }
LABEL_59:
  if (a4)
    *a4 = v19;
  v53 = v13;
  v54 = v15;
  result.y = v54;
  result.x = v53;
  return result;
}

- (void)_lowFidelityScrollInDirection:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;

  y = a3.y;
  x = a3.x;
  -[UIScrollView _contentOffsetAnimationDuration](self, "_contentOffsetAnimationDuration");
  v7 = v6;
  v17 = 0.0;
  -[UIScrollView contentOffset](self, "contentOffset");
  v9 = v8;
  v11 = v10;
  -[UIScrollView _contentOffsetForLowFidelityScrollInDirection:duration:](self, "_contentOffsetForLowFidelityScrollInDirection:duration:", &v17, x, y);
  if (v12 != v9 || v13 != v11)
  {
    v15 = v12;
    v16 = v13;
    -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v17);
    -[UIScrollView _handleDirectionalScrollToOffset:clampingToBounds:](self, "_handleDirectionalScrollToOffset:clampingToBounds:", 0, v15, v16);
    -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", v7);
  }
}

- (void)_handleLowFidelitySwipe:(id)a3
{
  UISwipeGestureRecognizer *v4;
  uint64_t v5;
  unint64_t v6;
  UISwipeGestureRecognizer *v7;
  double v8;
  double v9;
  UISwipeGestureRecognizer *v10;

  v4 = (UISwipeGestureRecognizer *)a3;
  v5 = 0;
  v6 = 0;
  v10 = v4;
  do
  {
    if (self->_lowFidelitySwipeGestureRecognizers[v6] == v4)
    {
      v7 = v10;
      v5 = -[UISwipeGestureRecognizer direction](v7, "direction");
      v4 = v10;
    }
    else
    {
      v7 = 0;
    }
    if (v6 > 2)
      break;
    ++v6;
  }
  while (!v7);
  if (v7 && -[UIGestureRecognizer state](v7, "state") == UIGestureRecognizerStateEnded)
  {
    v8 = 0.0;
    if (v5 == 1)
      v9 = -1.0;
    else
      v9 = 0.0;
    if (v5 == 2)
      v9 = 1.0;
    if (v5 == 4)
      v8 = 1.0;
    if (v5 == 8)
      v8 = -1.0;
    -[UIScrollView _lowFidelityScrollInDirection:](self, "_lowFidelityScrollInDirection:", v9, v8);
  }

}

- (BOOL)_bounceForCarPlayIfNecessary
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
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;

  -[UIView bounds](self, "bounds");
  v28 = v3;
  v5 = v4;
  -[UIScrollView contentOffset](self, "contentOffset");
  v7 = v6;
  v9 = v8;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v13 = *(uint64_t *)&self->_accuracy;
  v15 = self->_firstPageOffset.horizontal - v14;
  if (*(double *)&v13 == 1.0)
  {
    if (v7 < round(v15)
      || v7 > round(v12 + self->_contentSize.width) - round(v28)
      || v9 < round(self->_firstPageOffset.vertical - v10))
    {
      goto LABEL_11;
    }
    v24 = round(v11 + self->_contentSize.height);
    v26 = round(v5);
  }
  else
  {
    v16 = floor(v15);
    if (v7 < v16 + round(*(double *)&v13 * (v15 - v16)) / *(double *)&v13)
      goto LABEL_11;
    v17.f64[0] = v12 + self->_contentSize.width;
    v17.f64[1] = v28;
    v18 = vrndmq_f64(v17);
    v19 = vaddq_f64(v18, vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(v17, v18), *(double *)&v13)), (float64x2_t)vdupq_lane_s64(v13, 0)));
    if (v7 > vsubq_f64(v19, (float64x2_t)vdupq_laneq_s64((int64x2_t)v19, 1)).f64[0])
      goto LABEL_11;
    v20 = self->_firstPageOffset.vertical - v10;
    v21 = floor(v20);
    if (v9 < v21 + round(*(double *)&v13 * (v20 - v21)) / *(double *)&v13)
      goto LABEL_11;
    v22 = v11 + self->_contentSize.height;
    v23 = floor(v22);
    v24 = v23 + round(*(double *)&v13 * (v22 - v23)) / *(double *)&v13;
    v25 = floor(v5);
    v26 = v25 + round((v5 - v25) * *(double *)&v13) / *(double *)&v13;
  }
  if (v9 > v24 - v26)
  {
LABEL_11:
    -[UIScrollView _pushTrackingRunLoopModeIfNecessaryForReason:](self, "_pushTrackingRunLoopModeIfNecessaryForReason:", CFSTR("Bounce for CarPlay"));
    -[UIScrollView _updateDecelerationLastOffset:](self, "_updateDecelerationLastOffset:", v7, v9);
    -[UIScrollView _startTimer:](self, "_startTimer:", 0);
    return 1;
  }
  return 0;
}

- (BOOL)_shouldUpdateFocusInContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIScrollView;
  return -[UIView _shouldUpdateFocusInContext:](&v4, sel__shouldUpdateFocusInContext_, a3);
}

- (void)_didUpdateFocusInContext:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIScrollView;
  -[UIView _didUpdateFocusInContext:](&v3, sel__didUpdateFocusInContext_, a3);
}

- (BOOL)_prefersFocusContainment
{
  return !-[UIScrollView _forwardsToParentScroller](self, "_forwardsToParentScroller");
}

- (BOOL)_focusCanScrollX
{
  _BOOL4 v3;

  if (-[UIScrollView _canScrollWithoutBouncingX](self, "_canScrollWithoutBouncingX"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[UIScrollView bouncesHorizontally](self, "bouncesHorizontally");
    if (v3)
      LOBYTE(v3) = -[UIScrollView _applicationHasExplicitlySetBounces](self, "_applicationHasExplicitlySetBounces");
  }
  return v3;
}

- (BOOL)_focusCanScrollY
{
  _BOOL4 v3;

  if (-[UIScrollView _canScrollWithoutBouncingY](self, "_canScrollWithoutBouncingY"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[UIScrollView bouncesVertically](self, "bouncesVertically");
    if (v3)
      LOBYTE(v3) = -[UIScrollView _applicationHasExplicitlySetBounces](self, "_applicationHasExplicitlySetBounces");
  }
  return v3;
}

- (BOOL)_focusIsScrollableContainer
{
  BOOL v3;

  v3 = -[UIScrollView _focusCanScrollX](self, "_focusCanScrollX")
    || -[UIScrollView _focusCanScrollY](self, "_focusCanScrollY");
  return -[UIScrollView isScrollEnabled](self, "isScrollEnabled") && v3;
}

- (CGRect)_focusScrollableContentBounds
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
  CGRect result;

  -[UIScrollView _minimumContentOffset](self, "_minimumContentOffset");
  v4 = v3;
  v6 = v5;
  -[UIScrollView _maximumContentPoint](self, "_maximumContentPoint");
  v8 = v7 - v4;
  v10 = v9 - v6;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_focusScrollBoundaryMetricsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIScrollView _focusTuple](self, "_focusTuple");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusItemScrollableContainerDefaultScrollBoundaryMetricsForItem(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_focusScrollOffsetResolverForFocusMovement:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  if (-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
  {
    v5 = 1;
  }
  else
  {
    -[UIScrollView _focusTuple](self, "_focusTuple");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _UIFocusItemScrollableContainerDefaultScrollOffsetResolverTypeForFocusMovement(v6, v4);

  }
  return v5;
}

- (UIEdgeInsets)_focusScrollableAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_focusTuple
{
  return +[_UIFocusEnvironmentScrollableContainerTuple tupleWithOwningEnvironment:scrollableContainer:](_UIFocusEnvironmentScrollableContainerTuple, "tupleWithOwningEnvironment:scrollableContainer:", self, self);
}

- (BOOL)_isFocusFastScrolling
{
  return 0;
}

- (BOOL)_focusFastScrollingDisabled
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 19) & 1;
}

- (id)_focusFastScrollingIndexBarEntries
{
  objc_class *v2;
  UIScrollView *v3;
  id v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0C99DE8];
  v3 = self;
  v4 = objc_alloc_init(v2);
  -[UIScrollView _minimumContentOffset](v3, "_minimumContentOffset");
  -[UIScrollView _maximumContentOffset](v3, "_maximumContentOffset");

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

- (void)_updateRubberbandingStatisticTrackingState
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if ((v2 & 0x100000000000000) == 0 && (*(_BYTE *)&self->_scrollViewFlags & 0x30) != 0)
  {
    v3 = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v2 | 0x100000000000000;
    *((_DWORD *)&self->_scrollViewFlags + 5) = v3;
  }
}

void __35__UIScrollView__setRefreshControl___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = GScrollerPoppingRunLoopMode_block_invoke_3___s_category;
  if (!GScrollerPoppingRunLoopMode_block_invoke_3___s_category)
  {
    v0 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&GScrollerPoppingRunLoopMode_block_invoke_3___s_category);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Attempting to change the refresh control while it is not idle is strongly discouraged and probably won't work properly.", v2, 2u);
  }
}

- (void)_beginRefreshing
{
  id v2;

  -[UIScrollView _refreshControl](self, "_refreshControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginRefreshing");

}

- (void)_endRefreshingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIScrollView _refreshControl](self, "_refreshControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endRefreshingAnimated:", v3);

}

- (UIEdgeInsets)_gradientMaskLengths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientMaskLengths.top;
  left = self->_gradientMaskLengths.left;
  bottom = self->_gradientMaskLengths.bottom;
  right = self->_gradientMaskLengths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setUpGradientMaskViewIfNecessary
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _UIScrollViewGradientMaskView *v14;
  _UIScrollViewGradientMaskView *v15;
  uint8_t buf[4];
  CGFloat v17;
  __int16 v18;
  CGFloat v19;
  __int16 v20;
  CGFloat v21;
  __int16 v22;
  CGFloat v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[UIView _safeMaskView](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000000) == 0)
    {
      v4 = _setUpGradientMaskViewIfNecessary___s_category;
      if (!_setUpGradientMaskViewIfNecessary___s_category)
      {
        v4 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&_setUpGradientMaskViewIfNecessary___s_category);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        top = self->_gradientMaskLengths.top;
        left = self->_gradientMaskLengths.left;
        bottom = self->_gradientMaskLengths.bottom;
        right = self->_gradientMaskLengths.right;
        v10 = v5;
        -[UIView _safeMaskView](self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v17 = top;
        v18 = 2048;
        v19 = left;
        v20 = 2048;
        v21 = bottom;
        v22 = 2048;
        v23 = right;
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "WARNING: gradientMaskLengths set to {%g, %g, %g, %g}, but the current mask view type, %@, does not support them. Set the maskView property to nil before setting nonzero gradientMaskLengths.", buf, 0x34u);

      }
    }
  }
  else
  {
    v14 = [_UIScrollViewGradientMaskView alloc];
    v15 = -[_UIScrollViewGradientMaskView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView _setSafeMaskView:](self, v15);

  }
}

- (void)_setConfigureForObservingByTVSearchController:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;

  v3 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12);
  if (((((v3 & 0x4000000000000) == 0) ^ a3) & 1) == 0)
  {
    v6 = 0x4000000000000;
    if (!a3)
      v6 = 0;
    *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v3 & 0xFFFBFFFFFFFFFFFFLL | v6;
    if ((v3 & 0x2000000000000) != 0 && a3)
      -[UIView _setSafeMaskView:](self, 0);
    if (!a3
      && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_gradientMaskLengths.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_gradientMaskLengths.bottom))))) & 1) != 0)
    {
      -[UIScrollView _setUpGradientMaskViewIfNecessary](self, "_setUpGradientMaskViewIfNecessary");
    }
  }
}

- (BOOL)_configureForObservingByTVSearchController
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 50) & 1;
}

- (UIEdgeInsets)_effectiveGradientMaskLengths
{
  const UIEdgeInsets *p_gradientMaskLengths;
  double bottom;
  double right;
  double top;
  double left;
  UIEdgeInsets result;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x4000000000000) != 0)
    p_gradientMaskLengths = &UIEdgeInsetsZero;
  else
    p_gradientMaskLengths = &self->_gradientMaskLengths;
  bottom = p_gradientMaskLengths->bottom;
  right = p_gradientMaskLengths->right;
  top = p_gradientMaskLengths->top;
  left = p_gradientMaskLengths->left;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setGradientMaskLengths:(UIEdgeInsets)a3
{
  self->_gradientMaskLengths = a3;
  if (a3.left == 0.0 && a3.top == 0.0 && a3.right == 0.0 && a3.bottom == 0.0)
  {
    if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x2000000000000) != 0)
      -[UIView _setSafeMaskView:](self, 0);
  }
  else
  {
    -[UIScrollView _setUpGradientMaskViewIfNecessary](self, "_setUpGradientMaskViewIfNecessary");
  }
}

- (UIEdgeInsets)_gradientMaskEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientMaskEdgeInsets.top;
  left = self->_gradientMaskEdgeInsets.left;
  bottom = self->_gradientMaskEdgeInsets.bottom;
  right = self->_gradientMaskEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setGradientMaskEdgeInsets:(UIEdgeInsets)a3
{
  self->_gradientMaskEdgeInsets = a3;
}

- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6
{
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
  double accuracy;
  double v35;
  double v36;
  double v37;
  double v38;
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
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double top;
  double left;
  double right;
  double bottom;
  __int128 v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;

  -[UIScrollView _effectiveGradientMaskLengths](self, "_effectiveGradientMaskLengths");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIView bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  v70 = v24;
  v71 = v23;
  -[UIScrollView contentSize](self, "contentSize");
  v66 = v26;
  v67 = v25;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v31 = 1.0;
  v32 = 1.0;
  if (v12 > 0.0)
  {
    v33 = fmin(v12, 15.0);
    accuracy = self->_accuracy;
    v35 = v22 + v27;
    if (accuracy == 1.0)
    {
      v37 = round(v35);
    }
    else
    {
      v36 = floor(v35);
      v37 = v36 + round((v35 - v36) * accuracy) / accuracy;
    }
    if (v37 >= v33)
      v32 = 1.0;
    else
      v32 = v37 / v33;
  }
  if (v14 > 0.0)
  {
    v38 = fmin(v14, 15.0);
    v39 = self->_accuracy;
    v40 = v20 + v28;
    if (v39 == 1.0)
    {
      v42 = round(v40);
    }
    else
    {
      v41 = floor(v40);
      v42 = v41 + round((v40 - v41) * v39) / v39;
    }
    if (v42 >= v38)
      v31 = 1.0;
    else
      v31 = v42 / v38;
  }
  v68 = v32;
  v69 = v31;
  v43 = 1.0;
  v44 = 1.0;
  if (v16 > 0.0)
  {
    v45 = self->_accuracy;
    v46 = fmin(v16, 15.0);
    v47 = v66 - (v22 + v70 - v29);
    if (v45 == 1.0)
    {
      v49 = round(v47);
    }
    else
    {
      v48 = floor(v47);
      v49 = v48 + round((v47 - v48) * v45) / v45;
    }
    if (v49 >= v46)
      v44 = 1.0;
    else
      v44 = v49 / v46;
  }
  if (v18 > 0.0)
  {
    v50 = self->_accuracy;
    v51 = fmin(v18, 15.0);
    v52 = v67 - (v20 + v71 - v30);
    if (v50 == 1.0)
    {
      v54 = round(v52);
    }
    else
    {
      v53 = floor(v52);
      v54 = v53 + round((v52 - v53) * v50) / v50;
    }
    if (v54 >= v51)
      v43 = 1.0;
    else
      v43 = v54 / v51;
  }
  if (-[UIView clipsToBounds](self, "clipsToBounds"))
  {
    v55 = v70;
  }
  else
  {
    v56 = v70 - fmin(v12, 0.0);
    v57 = -0.0;
    if (v12 >= 0.0)
      v58 = -0.0;
    else
      v58 = v12;
    v22 = v22 + v58;
    v59 = v71 - fmin(v14, 0.0);
    if (v14 < 0.0)
      v57 = v14;
    v20 = v20 + v57;
    v55 = v56 - fmin(v16, 0.0);
    v60 = v59 - v18;
    if (v18 >= 0.0)
      v60 = v59;
    v71 = v60;
  }
  top = self->_gradientMaskEdgeInsets.top;
  left = self->_gradientMaskEdgeInsets.left;
  bottom = self->_gradientMaskEdgeInsets.bottom;
  right = self->_gradientMaskEdgeInsets.right;
  if (a3)
  {
    a3->origin.x = v20;
    a3->origin.y = v22;
    a3->size.width = v71;
    a3->size.height = v55;
  }
  if (a4)
  {
    v65 = *(_OWORD *)&self->_gradientMaskEdgeInsets.bottom;
    *(_OWORD *)&a4->top = *(_OWORD *)&self->_gradientMaskEdgeInsets.top;
    *(_OWORD *)&a4->bottom = v65;
  }
  if (a5)
  {
    a5->top = v12 + top;
    a5->left = v14 + left;
    a5->bottom = v16 + bottom;
    a5->right = v18 + right;
  }
  if (a6)
  {
    a6->top = v68;
    a6->left = v69;
    a6->bottom = v44;
    a6->right = v43;
  }
}

- (BOOL)_shouldTrackImmediatelyWhileDecelerating
{
  BOOL v3;

  v3 = -[UIScrollView tracksImmediatelyWhileDecelerating](self, "tracksImmediatelyWhileDecelerating")
    || -[UIScrollView _avoidsJumpOnInterruptedBounce](self, "_avoidsJumpOnInterruptedBounce");
  if (-[UIScrollView _isBouncing](self, "_isBouncing")
    && (self->_parentAdjustment.x != 0.0 || self->_parentAdjustment.y != 0.0))
  {
    return 0;
  }
  return v3;
}

- (void)_clearParentAdjustment
{
  void *v3;

  -[UIView _containingScrollView](self, "_containingScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView _stopDraggingParent:](self, "_stopDraggingParent:", v3);

  -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
}

- (double)_offsetWithoutDecorationForRubberBandOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6
{
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIScrollView _currentRubberBandCoefficient](self, "_currentRubberBandCoefficient");
  if (a5 >= a4)
    v11 = a5;
  else
    v11 = a4;
  if (fabs(a6) >= 2.22044605e-16)
  {
    if (v11 >= a3)
    {
      if (a3 < a5)
      {
        v13 = (a5 - a3) / a6 + -1.0;
        if (fabs(v13) >= 2.22044605e-16)
          return a5 - (-1.0 / v13 + -1.0) / v10 * a6;
      }
    }
    else
    {
      v12 = (a3 - v11) / a6 + -1.0;
      if (fabs(v12) >= 2.22044605e-16)
        return v11 + (-1.0 / v12 + -1.0) / v10 * a6;
    }
  }
  return a3;
}

- (double)_offsetForRubberBandOffset:(double)a3 maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6
{
  void *v11;
  void *v12;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;

  -[UIScrollView _refreshControl](self, "_refreshControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3 >= a5 || v11 == 0)
  {
LABEL_7:
    -[UIScrollView _offsetWithoutDecorationForRubberBandOffset:maxOffset:minOffset:range:](self, "_offsetWithoutDecorationForRubberBandOffset:maxOffset:minOffset:range:", a3, a4, a5, a6);
    a3 = v15;
    goto LABEL_8;
  }
  objc_msgSend(v11, "_refreshControlHeight");
  if (a5 - v14 >= a3)
  {
    if (!objc_msgSend(v12, "_areInsetsBeingApplied"))
    {
      objc_msgSend(v12, "_refreshControlHeight");
      -[UIScrollView _offsetWithoutDecorationForRubberBandOffset:maxOffset:minOffset:range:](self, "_offsetWithoutDecorationForRubberBandOffset:maxOffset:minOffset:range:", v17 + a3, a4, a5, a6);
      v19 = v18;
      objc_msgSend(v12, "_refreshControlHeight");
      a3 = v19 - v20;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return a3;
}

- (double)_shadowHeightOffset
{
  return 0.0;
}

- (void)_addRefreshInset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIScrollView contentOffset](self, "contentOffset");
  v6 = v5;
  v8 = v7;
  if (dyld_program_sdk_at_least() && self->_contentInsetAdjustmentBehavior != 2)
  {
    self->_refreshControlContentInsetHeight = self->_refreshControlContentInsetHeight + a3;
    -[UIScrollView _updateForChangedScrollRelatedInsets](self, "_updateForChangedScrollRelatedInsets");
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
  }
  else
  {
    -[UIScrollView contentInset](self, "contentInset");
    -[UIScrollView setContentInset:](self, "setContentInset:", v9 + a3);
  }
  -[UIScrollView setContentOffset:](self, "setContentOffset:", v6, v8);
}

- (void)_removeRefreshInset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIScrollView contentOffset](self, "contentOffset");
  v6 = v5;
  v8 = v7;
  if (dyld_program_sdk_at_least() && self->_contentInsetAdjustmentBehavior != 2)
  {
    self->_refreshControlContentInsetHeight = self->_refreshControlContentInsetHeight - a3;
    -[UIScrollView _updateForChangedScrollRelatedInsets](self, "_updateForChangedScrollRelatedInsets");
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
  }
  else
  {
    -[UIScrollView contentInset](self, "contentInset");
    -[UIScrollView setContentInset:](self, "setContentInset:", v9 - a3);
  }
  -[UIScrollView setContentOffset:](self, "setContentOffset:", v6, v8);
}

- (void)_adjustStartOffsetForGrabbedBouncingScrollView
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
  double v18;
  double accuracy;
  UIOffset *p_firstPageOffset;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGSize *p_contentSize;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
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
  double v68;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIScrollView contentOffset](self, "contentOffset");
  v8 = v7;
  v10 = v9;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if ((-[_UIScrollViewScrollableAncestor _descendentScrollView:shouldPreserveStartOffset:](self->_scrollableAncestor, "_descendentScrollView:shouldPreserveStartOffset:", self, self->_startOffsetX, self->_startOffsetY) & 1) != 0)return;
  accuracy = self->_accuracy;
  p_firstPageOffset = &self->_firstPageOffset;
  v21 = self->_firstPageOffset.horizontal - v14;
  if (accuracy == 1.0)
  {
    v23 = round(v21);
    if (v8 < v23)
      goto LABEL_29;
    v36 = round(self->_firstPageOffset.vertical - v12);
    if (v10 < v36)
      goto LABEL_21;
    v37 = round(v18 + self->_contentSize.width) - v4;
    if (v23 >= v37)
      v37 = v23;
    if (v8 > v37)
      goto LABEL_21;
    v38 = round(v16 + self->_contentSize.height) - v6;
    if (v36 < v38)
      v36 = v38;
    if (v10 > v36)
    {
LABEL_21:
      if (v8 < v23)
        goto LABEL_29;
      v35 = round(v18 + self->_contentSize.width);
      goto LABEL_23;
    }
  }
  else
  {
    v22 = floor(v21);
    v23 = v22 + round(accuracy * (v21 - v22)) / accuracy;
    if (v8 < v23)
      goto LABEL_29;
    v24 = self->_firstPageOffset.vertical - v12;
    v25 = floor(v24);
    v26 = v25 + round(accuracy * (v24 - v25)) / accuracy;
    if (v10 < v26)
      goto LABEL_12;
    v27 = v18 + self->_contentSize.width;
    v28 = floor(v27);
    v29 = v28 + round(accuracy * (v27 - v28)) / accuracy - v4;
    if (v23 >= v29)
      v29 = v23;
    if (v8 > v29)
      goto LABEL_12;
    v30 = v16 + self->_contentSize.height;
    v31 = floor(v30);
    v32 = v31 + round(accuracy * (v30 - v31)) / accuracy - v6;
    if (v26 < v32)
      v26 = v32;
    if (v10 > v26)
    {
LABEL_12:
      v33 = v18 + self->_contentSize.width;
      v34 = floor(v33);
      v35 = v34 + round(accuracy * (v33 - v34)) / accuracy;
LABEL_23:
      v39 = v35 - v4;
      if (v23 >= v39)
        v40 = v23;
      else
        v40 = v39;
      if (v8 <= v40)
      {
LABEL_30:
        v41 = self->_firstPageOffset.vertical - v12;
        if (accuracy == 1.0)
        {
          v43 = round(v41);
          if (v10 >= v43)
          {
            p_contentSize = &self->_contentSize;
            v48 = round(v16 + self->_contentSize.height) - v6;
            if (v43 < v48)
              v43 = v48;
            if (v10 <= v43)
            {
              v49 = v18 + p_contentSize->width;
              goto LABEL_44;
            }
          }
        }
        else
        {
          v42 = floor(v41);
          v43 = v42 + round(accuracy * (v41 - v42)) / accuracy;
          if (v10 >= v43)
          {
            v44 = v16 + self->_contentSize.height;
            v45 = floor(v44);
            v46 = v45 + round(accuracy * (v44 - v45)) / accuracy - v6;
            if (v43 < v46)
              v43 = v46;
            if (v10 <= v43)
            {
LABEL_41:
              p_contentSize = &self->_contentSize;
              v49 = v18 + self->_contentSize.width;
              if (accuracy != 1.0)
              {
                v50 = floor(v49);
                v51 = v50 + round(accuracy * (v49 - v50)) / accuracy;
                v52 = p_firstPageOffset->horizontal - v14;
                v53 = floor(v52);
                v54 = v53 + round(accuracy * (v52 - v53)) / accuracy;
                v55 = floor(v4);
                v56 = v55 + round((v4 - v55) * accuracy) / accuracy;
LABEL_45:
                -[UIScrollView _offsetForRubberBandOffset:maxOffset:minOffset:range:](self, "_offsetForRubberBandOffset:maxOffset:minOffset:range:", v8, v51 - v4, v54, v56);
                v58 = v57;
                v59 = self->_accuracy;
                v60 = v16 + p_contentSize->height;
                if (v59 == 1.0)
                {
                  v62 = round(v60);
                  v65 = round(self->_firstPageOffset.vertical - v12);
                  v67 = round(v6);
                }
                else
                {
                  v61 = floor(v60);
                  v62 = v61 + round(v59 * (v60 - v61)) / v59;
                  v63 = self->_firstPageOffset.vertical - v12;
                  v64 = floor(v63);
                  v65 = v64 + round(v59 * (v63 - v64)) / v59;
                  v66 = floor(v6);
                  v67 = v66 + round((v6 - v66) * v59) / v59;
                }
                -[UIScrollView _offsetForRubberBandOffset:maxOffset:minOffset:range:](self, "_offsetForRubberBandOffset:maxOffset:minOffset:range:", v10, v62 - v6, v65, v67);
                -[UIPanGestureRecognizer setTranslation:inView:](self->_pan, "setTranslation:inView:", self, self->_startOffsetX - v58, self->_startOffsetY - v68);
                return;
              }
LABEL_44:
              v51 = round(v49);
              v54 = round(p_firstPageOffset->horizontal - v14);
              v56 = round(v4);
              goto LABEL_45;
            }
          }
        }
        self->_startOffsetY = v43;
        accuracy = self->_accuracy;
        goto LABEL_41;
      }
      if (v23 < v39)
        v23 = v39;
LABEL_29:
      self->_startOffsetX = v23;
      accuracy = self->_accuracy;
      goto LABEL_30;
    }
  }
}

- (void)_adjustBackgroundShadowsForContentSizeForcedVisible:(BOOL)a3 withOffset:(double)a4
{
  _BOOL4 v4;
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
  double v23;
  double v24;
  double v25;
  char v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;
  _BOOL4 v32;
  _BOOL4 v33;
  int v34;
  double v35;
  double v36;
  double accuracy;
  double v38;
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
  void *v49;
  uint64_t v50;
  double v51;
  double width;
  double v53;
  double v54;
  double height;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  char v69;
  char v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  uint64_t v80;
  double v81;
  char v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;

  v4 = a3;
  -[UIScrollView contentSize](self, "contentSize");
  v92 = v6;
  v8 = v7;
  -[UIView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v93 = v13;
  v15 = v14;
  -[UIScrollView contentOffset](self, "contentOffset");
  v90 = v17;
  v91 = v16;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = -[UIScrollView _edgesApplyingSafeAreaInsetsToContentInset](self, "_edgesApplyingSafeAreaInsetsToContentInset");
  v27 = 0.0;
  v28 = v21 + 0.0;
  if ((v26 & 2) == 0)
    v28 = 0.0;
  v29 = v23 + 0.0;
  if ((v26 & 4) == 0)
    v29 = 0.0;
  if ((v26 & 8) != 0)
    v27 = v25 + 0.0;
  v30 = 1;
  if (v4 || v8 <= 0.0)
  {
    v32 = v4;
    v33 = v4;
    v34 = v4;
    v35 = v10;
    v31 = v93;
  }
  else
  {
    v31 = v93;
    v32 = v4;
    v33 = v4;
    v34 = v4;
    v35 = v10;
    if (v92 > 0.0)
    {
      v36 = v19 + 0.0;
      if ((v26 & 1) == 0)
        v36 = 0.0;
      accuracy = self->_accuracy;
      v38 = -self->_contentInset.top - v36;
      if (accuracy == 1.0)
      {
        v40 = round(v38);
        v33 = v12 + v15 > round(v29 + self->_contentSize.height + self->_contentInset.bottom) + a4;
        v45 = round(-self->_contentInset.left - v28);
        v48 = round(v27 + self->_contentSize.width + self->_contentInset.right);
      }
      else
      {
        v39 = floor(v38);
        v40 = v39 + round(accuracy * (v38 - v39)) / accuracy;
        v41 = v29 + self->_contentSize.height + self->_contentInset.bottom;
        v42 = floor(v41);
        v33 = v12 + v15 > v42 + round(accuracy * (v41 - v42)) / accuracy + a4;
        v43 = -self->_contentInset.left - v28;
        v44 = floor(v43);
        v45 = v44 + round(accuracy * (v43 - v44)) / accuracy;
        v46 = v27 + self->_contentSize.width + self->_contentInset.right;
        v47 = floor(v46);
        v48 = v47 + round(accuracy * (v46 - v47)) / accuracy;
      }
      v32 = v90 < v40;
      v4 = v91 < v45;
      v30 = v10 + v93 > v48;
      v34 = v30;
    }
  }
  AdjustShadowWithOffset(*self->_shadows, 1, v32 || v4 || v30, v35, v12, v31, v15, 0.0);
  AdjustShadowWithOffset(self->_shadows[1], 4, v33 || v4 || v30, v35, v12, v31, v15, 0.0);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "userInterfaceIdiom");

  v51 = self->_accuracy;
  width = self->_contentSize.width;
  if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v51 == 1.0)
    {
      v54 = round(width);
      v57 = round(self->_contentSize.height);
    }
    else
    {
      v53 = floor(width);
      v54 = v53 + round(v51 * (width - v53)) / v51;
      height = self->_contentSize.height;
      v56 = floor(height);
      v57 = v56 + round(v51 * (height - v56)) / v51;
    }
    v63 = v54 + 20.0 + -6.0;
    v64 = -5.0;
    v65 = v57 + 20.0 + -5.0;
    v66 = -7.0;
  }
  else
  {
    if (v51 == 1.0)
    {
      v59 = round(width);
      v62 = round(self->_contentSize.height);
    }
    else
    {
      v58 = floor(width);
      v59 = v58 + round(v51 * (width - v58)) / v51;
      v60 = self->_contentSize.height;
      v61 = floor(v60);
      v62 = v61 + round(v51 * (v60 - v61)) / v51;
    }
    v63 = v59 + 60.0;
    v65 = v62 + 60.0;
    v66 = -30.0;
    v64 = -30.0;
  }
  AdjustShadowWithOffset(self->_shadows[6], 3, v4 && v32, v66, v64, v63, v65, 0.0);
  AdjustShadowWithOffset(self->_shadows[8], 9, v32 & v34, v66, v64, v63, v65, 0.0);
  AdjustShadowWithOffset(self->_shadows[7], 6, v33 && v4, v66, v64, v63, v65, a4);
  v94 = v63;
  AdjustShadowWithOffset(self->_shadows[9], 12, v34 & v33, v66, v64, v63, v65, a4);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "userInterfaceIdiom");

  v69 = 2;
  if (!v4)
    v69 = 0;
  v70 = 8;
  if (!v34)
    v70 = 0;
  if ((v68 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v71 = 10.0;
  else
    v71 = 54.0;
  v72 = UIRectInsetEdges(v70 | v69, v66, v64, v63, v65, v71);
  v74 = v73;
  v76 = v75;
  v78 = v77;
  AdjustShadowWithOffset(self->_shadows[2], 1, v32, v72, v73, v75, v77, 0.0);
  AdjustShadowWithOffset(self->_shadows[3], 4, v33, v72, v74, v76, v78, a4);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "userInterfaceIdiom");

  if ((v80 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v81 = 10.0;
  else
    v81 = 54.0;
  if (v33)
    v82 = 4;
  else
    v82 = 0;
  v83 = UIRectInsetEdges(v82 | v32, v66, v64, v94, v65, v81);
  v85 = v84;
  v87 = v86;
  v89 = v88;
  AdjustShadowWithOffset(self->_shadows[4], 2, v4, v83, v84, v86, v88, 0.0);
  AdjustShadowWithOffset(self->_shadows[5], 8, v34, v83, v85, v87, v89, 0.0);
}

- (void)_adjustBackgroundShadowsForContentSizeForcedVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIScrollView _shadowHeightOffset](self, "_shadowHeightOffset");
  -[UIScrollView _adjustBackgroundShadowsForContentSizeForcedVisible:withOffset:](self, "_adjustBackgroundShadowsForContentSizeForcedVisible:withOffset:", v3);
}

- (void)_stopScrollDecelerationNotify:(BOOL)a3
{
  CADisplayLink *scrollHeartbeat;
  _BOOL4 v4;
  CADisplayLink *v6;
  CADisplayLink *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;

  scrollHeartbeat = self->_scrollHeartbeat;
  if (scrollHeartbeat)
  {
    v4 = a3;
    v6 = scrollHeartbeat;
    v7 = self->_scrollHeartbeat;
    self->_scrollHeartbeat = 0;

    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x8000000000000uLL;
    if (-[UIScrollView _effectiveShowsVerticalScrollIndicator]((_BOOL8)self)
      || -[UIScrollView _effectiveShowsHorizontalScrollIndicator]((_BOOL8)self))
    {
      -[UIScrollView _adjustScrollerIndicators:alwaysShowingThem:](self, "_adjustScrollerIndicators:alwaysShowingThem:", 0, 0);
    }
    -[UIScrollView _unregisterForSpringBoardBlankedScreenNotification](self, "_unregisterForSpringBoardBlankedScreenNotification");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("_UIApplicationRunLoopModePopNotification"), UIApp);

    -[UIScrollView _popTrackingRunLoopModeIfNecessaryForReason:](self, "_popTrackingRunLoopModeIfNecessaryForReason:", CFSTR("Deceleration stopped"));
    -[CADisplayLink invalidate](v6, "invalidate");
    -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 3);
    _UIQOSManagedCommitsEnd(self, CFSTR("Deceleration"));
    -[UIScrollView _endActivityTrackingIfNeededForReason:](self, "_endActivityTrackingIfNeededForReason:", 0);
    v9 = qword_1EDDB0C08;
    if (!qword_1EDDB0C08)
    {
      v9 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1EDDB0C08);
    }
    v10 = *(id *)(v9 + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(v9 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v10))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    v11 = qword_1EDDB0C10;
    if (!qword_1EDDB0C10)
    {
      v11 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&qword_1EDDB0C10);
    }
    v12 = *(id *)(v11 + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(v11 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v12))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
    kdebug_trace();
    if (v4)
    {
      -[UIScrollView _scrollViewDidEndDeceleratingForDelegate](self, "_scrollViewDidEndDeceleratingForDelegate");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("DidEndSmoothScrolling"), self);

    }
  }
}

- (void)_stopScrollingNotify:(BOOL)a3 pin:(BOOL)a4 tramplingAnimationDependentFlags:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  $2E1E9E4AFFF9795127AB46249B0A5AF9 *p_scrollViewFlags;
  unsigned int v9;

  v5 = a4;
  v6 = a3;
  self->_verticalVelocity = 0.0;
  self->_horizontalVelocity = 0.0;
  if (a5)
  {
    p_scrollViewFlags = &self->_scrollViewFlags;
    *(_QWORD *)&self->_scrollViewFlags &= 0xFFFFFFFFFF7FFFFDLL;
    -[UIScrollView _didEndDirectManipulationWithScrubbingDirection:](self, "_didEndDirectManipulationWithScrubbingDirection:", ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 11) & 0xF);
    v9 = *((_DWORD *)p_scrollViewFlags + 5) & 0xFFFF87FF;
    *(_QWORD *)((char *)p_scrollViewFlags + 12) &= 0xFFFFFFFFFFFFFC3FLL;
    *((_DWORD *)p_scrollViewFlags + 5) = v9;
  }
  *(_QWORD *)&self->_scrollViewFlags &= 0xFFFFFFFFFFFFFFCFLL;
  self->_fastScrollCount = 0;
  self->_fastScrollMultiplier = 1.0;
  -[UIScrollView _commitScrollBounceStatisticsTrackingState](self, "_commitScrollBounceStatisticsTrackingState");
  -[UIScrollView _clearScrollBounceStatisticsTrackingState](self, "_clearScrollBounceStatisticsTrackingState");
  if (v5)
  {
    if (-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
    {
      -[UIView bounds](self, "bounds");
      if (!-[UIScrollView _contentOffsetIsAtPagingBoundary:](self, "_contentOffsetIsAtPagingBoundary:"))
      {
        if (!self->_scrollHeartbeat)
          -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", 0.0, 0.0);
        -[UIScrollView setContentOffset:](self, "setContentOffset:", self->_pageDecelerationTarget.x, self->_pageDecelerationTarget.y);
      }
    }
    -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x10000000000uLL;
  }
  if (self->_scrollHeartbeat)
    -[UIScrollView _stopScrollDecelerationNotify:](self, "_stopScrollDecelerationNotify:", v6);
  else
    -[UIScrollView _popTrackingRunLoopModeIfNecessaryForReason:](self, "_popTrackingRunLoopModeIfNecessaryForReason:", CFSTR("stopScrollingNotify called without timer"));
}

- (void)_stopScrollingAndZoomingAnimationsPinningToContentViewport:(BOOL)a3 tramplingAnimationDependentFlags:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id zoomAnimation;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = a3;
  -[UIScrollView _stopScrollingNotify:pin:tramplingAnimationDependentFlags:](self, "_stopScrollingNotify:pin:tramplingAnimationDependentFlags:", 0, a3, a4);
  if (-[UIScrollView isScrollAnimating](self, "isScrollAnimating"))
  {
    +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAnimationsForTarget:ofKind:", self, objc_opt_class());

    -[UIScrollView _clearContentOffsetAnimation](self, "_clearContentOffsetAnimation");
  }
  if (-[UIScrollView isZoomAnimating](self, "isZoomAnimating"))
  {
    -[UIScrollView _getDelegateZoomView](self, "_getDelegateZoomView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    zoomAnimation = self->_zoomAnimation;
    self->_zoomAnimation = 0;

    if (-[UIScrollView _ownsAnimationForKey:ofView:](self, "_ownsAnimationForKey:ofView:", CFSTR("transform"), v17))
    {
      objc_msgSend(v17, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAnimationForKey:", CFSTR("transform"));

    }
    if (-[UIScrollView _ownsAnimationForKey:ofView:](self, "_ownsAnimationForKey:ofView:", CFSTR("position"), v17))
    {
      objc_msgSend(v17, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAnimationForKey:", CFSTR("position"));

    }
    if (-[UIScrollView _ownsAnimationForKey:ofView:](self, "_ownsAnimationForKey:ofView:", CFSTR("bounds"), self))
    {
      -[UIView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAnimationForKey:", CFSTR("bounds"));

    }
    if (-[UIScrollView _ownsAnimationForKey:ofView:](self, "_ownsAnimationForKey:ofView:", CFSTR("bounds.origin"), self))
    {
      -[UIView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAnimationForKey:", CFSTR("bounds.origin"));

    }
    if (-[UIScrollView _ownsAnimationForKey:ofView:](self, "_ownsAnimationForKey:ofView:", CFSTR("bounds.size"), self))
    {
      -[UIView layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeAnimationForKey:", CFSTR("bounds.size"));

    }
    -[UIViewAnimationState sendDelegateDidStopManually:](self->_zoomAnimationState, "sendDelegateDidStopManually:", 1);
    if (v4)
    {
      -[UIScrollView zoomScale](self, "zoomScale");
      v14 = v13;
      -[UIScrollView _zoomAnchorPoint](self, "_zoomAnchorPoint");
      -[UIScrollView setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:](self, "setZoomScale:withAnchorPoint:allowRubberbanding:animated:duration:notifyDelegate:", 0, 0, 0, v14, v15, v16, 0.0);
    }

  }
}

- (BOOL)_canCancelContentTouches:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  UIScrollView *v13;
  UIScrollView *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_21;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v29;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
      objc_msgSend(v10, "view");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(v10, "view");
        v13 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
        if (v13 != self)
        {
          v14 = v13;
          if ((objc_msgSend(v10, "isDelayed") & 1) != 0)
          {
            v15 = objc_msgSend(v10, "phase");

            if (v15 != 3)
              goto LABEL_14;
            if (v7)
            {
LABEL_11:
              objc_msgSend(v10, "view");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v12);
LABEL_13:

              goto LABEL_14;
            }
          }
          else
          {

            if (v7)
              goto LABEL_11;
          }
          v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          goto LABEL_11;
        }

        goto LABEL_13;
      }
LABEL_14:
      ++v9;
    }
    while (v6 != v9);
    v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    v6 = v16;
  }
  while (v16);
LABEL_21:
  if ((*((_BYTE *)&self->_scrollViewFlags + 2) & 2) != 0 || !objc_msgSend(v7, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          if (!-[UIScrollView touchesShouldCancelInContentView:](self, "touchesShouldCancelInContentView:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), (_QWORD)v24))
          {
            v17 = 0;
            goto LABEL_34;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v20)
          continue;
        break;
      }
    }
    v17 = 1;
LABEL_34:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_setContentOffsetAnimationDuration:(double)a3
{
  self->_contentOffsetAnimationDuration = a3;
}

- (double)_contentOffsetAnimationDuration
{
  return self->_contentOffsetAnimationDuration;
}

- (void)_clearContentOffsetAnimation
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  -[UIScrollView _clearContentOffsetAnimation:](self, "_clearContentOffsetAnimation:", WeakRetained);

}

- (void)_beginDeferredContentOffsetTransitionToOffset:(CGPoint)a3 contentSize:(CGSize)a4
{
  _QWORD v4[5];
  CGPoint v5;

  self->_deferredUpdateTargetIsValid = 1;
  self->_deferredUpdateTargetContentOffset = a3;
  self->_deferredUpdateTargetContentSize = a4;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__UIScrollView__beginDeferredContentOffsetTransitionToOffset_contentSize___block_invoke;
  v4[3] = &unk_1E16EAB98;
  v4[4] = self;
  v5 = a3;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __74__UIScrollView__beginDeferredContentOffsetTransitionToOffset_contentSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollView:didBeginTransitionToDeferredContentOffset:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
  return result;
}

- (void)_commitDeferredContentOffsetTransition
{
  if (self->_deferredUpdateTargetIsValid)
  {
    -[UIScrollView setContentOffset:](self, "setContentOffset:", self->_deferredUpdateTargetContentOffset.x, self->_deferredUpdateTargetContentOffset.y);
    -[UIScrollView setContentSize:](self, "setContentSize:", self->_deferredUpdateTargetContentSize.width, self->_deferredUpdateTargetContentSize.height);
    self->_deferredUpdateTargetIsValid = 0;
  }
}

- (void)_cancelDeferredContentOffsetTransition
{
  self->_deferredUpdateTargetIsValid = 0;
}

- (CGSize)_contentSizeOrDeferredContentSize
{
  double width;
  double height;
  CGSize result;

  if (self->_deferredUpdateTargetIsValid)
  {
    width = self->_deferredUpdateTargetContentSize.width;
    height = self->_deferredUpdateTargetContentSize.height;
  }
  else
  {
    -[UIScrollView contentSize](self, "contentSize");
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5
{
  -[UIScrollView _setContentOffset:duration:animationCurve:animationConfigurator:](self, "_setContentOffset:duration:animationCurve:animationConfigurator:", *(_QWORD *)&a5, 0, a3.x, a3.y, a4);
}

- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5 animationConfigurator:(id)a6
{
  uint64_t v6;
  double y;
  double x;
  double contentOffsetAnimationDuration;
  id v12;

  v6 = *(_QWORD *)&a5;
  y = a3.y;
  x = a3.x;
  v12 = a6;
  if (a4 <= 0.0)
  {
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, x, y);
  }
  else
  {
    contentOffsetAnimationDuration = self->_contentOffsetAnimationDuration;
    -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", a4);
    -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:", 1, v6, 1, 0, v12, x, y);
    -[UIScrollView _setContentOffsetAnimationDuration:](self, "_setContentOffsetAnimationDuration:", contentOffsetAnimationDuration);
  }

}

- (void)_setContentOffsetWithDecelerationAnimation:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  _smoothDecelerationAnimation();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScrollView _setContentOffset:animation:](self, "_setContentOffset:animation:", v6, x, y);

}

- (void)_setContentOffset:(CGPoint)a3 animation:(id)a4
{
  -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 1, 3, 1, a4, a3.x, a3.y);
}

- (void)_setAbsoluteContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:](self, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:", a4, 0, 0, a3.x, a3.y);
}

- (void)_animateScrollToContentOffset:(CGPoint)a3 animationCurve:(int)a4 animationAdjustsForContentOffsetDelta:(BOOL)a5 animation:(id)a6
{
  -[UIScrollView _animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:](self, "_animateScrollToContentOffset:animationCurve:animationAdjustsForContentOffsetDelta:animation:animationConfigurator:", *(_QWORD *)&a4, a5, a6, 0, a3.x, a3.y);
}

- (void)_updateScrollAnimationForChangedTargetOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat *WeakRetained;

  y = a3.y;
  x = a3.x;
  WeakRetained = (CGFloat *)objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained)
  {
    WeakRetained[13] = x;
    WeakRetained[14] = y;
  }

}

- (void)_forceDelegateScrollViewDidZoom:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)_scrollsToMakeFirstResponderVisible
{
  return 1;
}

- (double)_touchDelayForScrollDetection
{
  return 0.15;
}

- (void)_setContentOffsetPinned:(CGPoint)a3 animated:(BOOL)a4
{
  -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", a4, a3.x, a3.y);
  -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
}

- (void)_setContentScrollInset:(UIEdgeInsets)a3
{
  if (self->_contentScrollInset.left != a3.left
    || self->_contentScrollInset.top != a3.top
    || self->_contentScrollInset.right != a3.right
    || self->_contentScrollInset.bottom != a3.bottom)
  {
    self->_contentScrollInset = a3;
    -[UIScrollView _updateForChangedScrollRelatedInsets](self, "_updateForChangedScrollRelatedInsets");
  }
}

- (int64_t)_indicatorInsetAdjustmentBehavior
{
  return ((unint64_t)*((unsigned int *)&self->_scrollViewFlags + 5) >> 7) & 3;
}

- (BOOL)automaticallyAdjustsScrollIndicatorInsets
{
  return -[UIScrollView _edgesApplyingBaseInsetsToScrollIndicatorInsets](self, "_edgesApplyingBaseInsetsToScrollIndicatorInsets") != 0;
}

- (BOOL)_clipsGlyphPathFrame:(CGRect)a3 shouldContinueSuperviewTraversal:(BOOL *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  CGSize *p_contentSize;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  unint64_t v31;
  NSObject *v32;
  double v33;
  CGFloat v34;
  objc_super v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  CGFloat v40;
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)UIScrollView;
  v10 = -[UIView _clipsGlyphPathFrame:shouldContinueSuperviewTraversal:](&v36, sel__clipsGlyphPathFrame_shouldContinueSuperviewTraversal_);
  if (-[UIScrollView isScrollEnabled](self, "isScrollEnabled"))
  {
    *a4 = 0;
    -[UIView _window](self, "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = v10;
    else
      v12 = 0;
    if (v12 == 1)
    {
      p_contentSize = &self->_contentSize;
      if (fabs(self->_contentSize.width) < 2.22044605e-16
        && (-[UIView frame](self, "frame"), fabs(v14) >= 2.22044605e-16)
        || fabs(self->_contentSize.height) < 2.22044605e-16
        && (-[UIView frame](self, "frame"), fabs(v15) >= 2.22044605e-16))
      {
        v31 = _clipsGlyphPathFrame_shouldContinueSuperviewTraversal____s_category;
        if (!_clipsGlyphPathFrame_shouldContinueSuperviewTraversal____s_category)
        {
          v31 = __UILogCategoryGetNode("UIScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v31, (unint64_t *)&_clipsGlyphPathFrame_shouldContinueSuperviewTraversal____s_category);
        }
        v32 = *(NSObject **)(v31 + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = p_contentSize->width;
          v34 = p_contentSize->height;
          *(_DWORD *)buf = 134218240;
          v38 = v33;
          v39 = 2048;
          v40 = v34;
          _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Clipping detection failed because _contentSize has a zero width/height. {%f, %f}", buf, 0x16u);
        }
        LOBYTE(v10) = 0;
      }
      else
      {
        -[UIScrollView contentInset](self, "contentInset");
        v17 = -v16;
        -[UIScrollView contentInset](self, "contentInset");
        v19 = -v18;
        -[UIScrollView contentInset](self, "contentInset");
        v21 = v20;
        -[UIScrollView contentInset](self, "contentInset");
        v23 = p_contentSize->width + v21 + v22;
        -[UIScrollView contentInset](self, "contentInset");
        v25 = v24;
        -[UIScrollView contentInset](self, "contentInset");
        -[UIView convertRect:toView:](self, "convertRect:toView:", v11, v17, v19, v23, self->_contentSize.height + v25 + v26);
        v43.origin.x = v27;
        v43.origin.y = v28;
        v43.size.width = v29;
        v43.size.height = v30;
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        v10 = !CGRectIntersectsRect(v42, v43);
      }
    }

  }
  return v10;
}

- (CGPoint)_animatedOriginalOffset
{
  UIScrollViewScrollAnimation **p_animation;
  id WeakRetained;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  p_animation = &self->_animation;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained)
  {
    v4 = (double *)objc_loadWeakRetained((id *)p_animation);
    v6 = v4[11];
    v5 = v4[12];

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v7 = v6;
  v8 = v5;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)_animatedTargetOffset
{
  UIScrollViewScrollAnimation **p_animation;
  id WeakRetained;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  p_animation = &self->_animation;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animation);
  if (WeakRetained)
  {
    v4 = (double *)objc_loadWeakRetained((id *)p_animation);
    v6 = v4[13];
    v5 = v4[14];

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v7 = v6;
  v8 = v5;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)_focusTargetOffset
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
  double v12;
  double v13;
  CGPoint result;

  -[UIView _focusSystem](self, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[UIScrollView isDecelerating](self, "isDecelerating"))
    {
      +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scrollManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "targetContentOffsetForScrollableContainer:", self);
      v7 = v6;
      v9 = v8;

    }
    else
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v7 = v10;
      v9 = v11;
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v12 = v7;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)_setShowsVerticalScrollIndicatorFlag:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (void)_setShowsHorizontalScrollIndicatorFlag:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_scrollViewFlags = *(_QWORD *)&self->_scrollViewFlags & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)_canScrollWithoutBouncingIncludingRevealableContentPaddingTopY
{
  -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  return -[UIScrollView __canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:](self, "__canScrollWithoutBouncingYIncludingAdditionalContentInsetAmount:");
}

- (BOOL)_canScrollFromEdge:(unint64_t)a3
{
  UIScrollView *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;

  v3 = self;
  LOBYTE(self) = 0;
  switch(a3)
  {
    case 1uLL:
      LODWORD(self) = -[UIScrollView _canScrollY](v3, "_canScrollY");
      if ((_DWORD)self)
      {
        -[UIScrollView contentOffset](v3, "contentOffset");
        v5 = v4;
        -[UIScrollView _minimumContentOffset](v3, "_minimumContentOffset");
        v7 = v5 <= v6;
        goto LABEL_6;
      }
      break;
    case 2uLL:
      LODWORD(self) = -[UIScrollView _canScrollX](v3, "_canScrollX");
      if ((_DWORD)self)
      {
        -[UIScrollView contentOffset](v3, "contentOffset");
        v9 = v8;
        -[UIScrollView _minimumContentOffset](v3, "_minimumContentOffset");
        v7 = v9 <= v10;
LABEL_6:
        LOBYTE(self) = !v7;
      }
      break;
    case 4uLL:
      LODWORD(self) = -[UIScrollView _canScrollY](v3, "_canScrollY");
      if ((_DWORD)self)
      {
        -[UIScrollView contentOffset](v3, "contentOffset");
        v12 = v11;
        -[UIScrollView _maximumContentOffset](v3, "_maximumContentOffset");
        v14 = v12 < v13;
        goto LABEL_13;
      }
      break;
    case 8uLL:
      LODWORD(self) = -[UIScrollView _canScrollX](v3, "_canScrollX");
      if ((_DWORD)self)
      {
        -[UIScrollView contentOffset](v3, "contentOffset");
        v16 = v15;
        -[UIScrollView _maximumContentOffset](v3, "_maximumContentOffset");
        v14 = v16 < v17;
LABEL_13:
        LOBYTE(self) = v14;
      }
      break;
    default:
      return (char)self;
  }
  return (char)self;
}

- (BOOL)_delegateShouldPanGestureTryToBegin
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "_scrollViewShouldPanGestureTryToBegin:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_setAutoscrolling:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;

  if (a3)
  {
    v4 = 0x10000;
  }
  else
  {
    +[UIAnimator sharedAnimator](UIAnimator, "sharedAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationsForTarget:ofKind:", self, objc_opt_class());

    v4 = 0;
    self->_contentOffsetAnimationDuration = 0.3;
  }
  v6 = *(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_DWORD *)&self->_scrollViewFlags + 5) = *((_DWORD *)&self->_scrollViewFlags + 5);
  *(_QWORD *)((char *)&self->_scrollViewFlags + 12) = v6;
}

- (BOOL)_isAutoscrolling
{
  return (*(_QWORD *)((char *)&self->_scrollViewFlags + 12) >> 16) & 1;
}

- (CGRect)contentFrameForView:(id)a3
{
  id v4;
  UIScrollView *v5;
  UIScrollView *v6;
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
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(v4, "frame");
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
  }
  else
  {
    objc_msgSend(v4, "_scroller");
    v6 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    if (v6 == self)
    {
      objc_msgSend(v4, "bounds");
      objc_msgSend(v4, "convertRect:toView:", self);
      v7 = v15;
      v8 = v16;
      v9 = v17;
      v10 = v18;
    }
    else
    {
      v7 = *MEMORY[0x1E0C9D648];
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }

  }
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_adjustShadowsIfNecessaryForOffset:(double)a3
{
  if (self->_shadows)
    -[UIScrollView _adjustBackgroundShadowsForContentSizeForcedVisible:withOffset:](self, "_adjustBackgroundShadowsForContentSizeForcedVisible:withOffset:", 0, a3);
}

- (id)_backgroundShadowForSlideAnimation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  UIImageView *v6;
  void *v7;
  UIImageView *v8;
  CGAffineTransform v10;

  if (!self->_shadows)
    return 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = CFSTR("UIScrollerShadowEdgeFill.png");
  else
    v5 = CFSTR("UIScrollerShadowFill.png");
  v6 = [UIImageView alloc];
  _UIImageWithName(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIImageView initWithImage:](v6, "initWithImage:", v7);

  CGAffineTransformMakeRotation(&v10, 3.14159265);
  -[UIView setTransform:](v8, "setTransform:", &v10);
  objc_msgSend(self->_shadows[3], "frame");
  -[UIImageView setFrame:](v8, "setFrame:");
  return v8;
}

- (void)_scrollViewWillBeginDragging
{
  unint64_t v3;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  _QWORD v9[5];
  __int16 v10;

  self->_telemetryOffsetChangeHighRateDuration = 0.0;
  self->_telemetryOffsetChangeCount = 0;
  self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
  _UIQOSManagedCommitsBegin(self, CFSTR("Dragging"));
  -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 1);
  v3 = qword_1EDDB0C28;
  if (!qword_1EDDB0C28)
  {
    v3 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&qword_1EDDB0C28);
  }
  v4 = *(id *)(v3 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v3 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v4))
  {
    v10 = 0;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  v5 = qword_1EDDB0C30;
  if (!qword_1EDDB0C30)
  {
    v5 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1EDDB0C30);
  }
  v6 = *(id *)(v5 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v5 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v6))
  {
    v10 = 0;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  -[UIScrollView _beginActivityTrackingIfNeededForReason:](self, "_beginActivityTrackingIfNeededForReason:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("UITextSelectionWillScroll"), self);
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("_UIScrollViewWillBeginDraggingNotification"), self);
  kdebug_trace();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__UIScrollView__scrollViewWillBeginDragging__block_invoke;
  v9[3] = &unk_1E16EAA10;
  v9[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v9);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewWillBeginDragging:", self);
  kdebug_trace();

}

uint64_t __44__UIScrollView__scrollViewWillBeginDragging__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollViewWillBeginDragging:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_scrollViewDidEndDraggingWithDeceleration:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("_UIScrollViewDidEndDraggingWillDecelerateUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("_UIScrollViewDidEndDraggingNotification"), self, v8);

  kdebug_trace();
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 1);
  _UIQOSManagedCommitsEnd(self, CFSTR("Dragging"));
  v9 = qword_1EDDB0C38;
  if (!qword_1EDDB0C38)
  {
    v9 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&qword_1EDDB0C38);
  }
  v10 = *(id *)(v9 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v9 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v10))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (v3)
  {
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
  }
  else
  {
    v11 = qword_1EDDB0C40;
    if (!qword_1EDDB0C40)
    {
      v11 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&qword_1EDDB0C40);
    }
    v12 = *(id *)(v11 + 8);
    if (os_signpost_id_make_with_pointer(*(os_log_t *)(v11 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
      && os_signpost_enabled(v12))
    {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    -[UIScrollView _endActivityTrackingIfNeededForReason:](self, "_endActivityTrackingIfNeededForReason:", 0);
    self->_telemetryOffsetChangeHighRateDuration = 0.0;
    self->_telemetryOffsetChangeCount = 0;
    self->_telemetryOffsetChange = (CGSize)*MEMORY[0x1E0C9D820];
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("UITextSelectionDidScroll"), self);
  }

}

- (void)_scrollViewDidEndDraggingForDelegateWithDeceleration:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  _UIScrollViewScrollableAncestor *scrollableAncestor;
  id WeakRetained;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  v5 = -[UIScrollView _isAutomaticContentOffsetAdjustmentEnabled](self, "_isAutomaticContentOffsetAdjustmentEnabled");
  if (v3)
    -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](self, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  -[UIScrollView _scrollViewDidEndDraggingWithDeceleration:](self, "_scrollViewDidEndDraggingWithDeceleration:", v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__UIScrollView__scrollViewDidEndDraggingForDelegateWithDeceleration___block_invoke;
  v8[3] = &unk_1E16EABE8;
  v8[4] = self;
  v9 = v3;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v8);
  scrollableAncestor = self->_scrollableAncestor;
  if (scrollableAncestor)
    -[_UIScrollViewScrollableAncestor _descendentScrollViewDidEndDragging:](scrollableAncestor, "_descendentScrollViewDidEndDragging:", self);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewDidEndDragging:willDecelerate:", self, v3);
  if (v3)
    -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](self, "_setAutomaticContentOffsetAdjustmentEnabled:", v5);

}

uint64_t __69__UIScrollView__scrollViewDidEndDraggingForDelegateWithDeceleration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollViewDidEndDragging:willDecelerate:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_scrollViewDidEndDecelerating
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UITextSelectionDidScroll"), self);
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIScrollViewDidEndDeceleratingNotification"), self);

}

- (void)_scrollViewDidEndDeceleratingForDelegate
{
  id WeakRetained;
  _QWORD v4[5];

  -[UIScrollView _scrollViewDidEndDecelerating](self, "_scrollViewDidEndDecelerating");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__UIScrollView__scrollViewDidEndDeceleratingForDelegate__block_invoke;
  v4[3] = &unk_1E16EAA10;
  v4[4] = self;
  -[UIScrollView _enumerateAllScrollObserversWithBlock:]((uint64_t)self, (uint64_t)v4);
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollViewDidEndDecelerating:", self);
  kdebug_trace();

}

uint64_t __56__UIScrollView__scrollViewDidEndDeceleratingForDelegate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_observeScrollViewDidEndDecelerating:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_scrollViewWillBeginZooming
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  _UIQOSManagedCommitsBegin(self, CFSTR("Zooming"));
  -[_UIScrollViewVFD activateSubreason:]((uint64_t)self->_vfd, 2);
  v3 = _scrollViewWillBeginZooming___s_category;
  if (!_scrollViewWillBeginZooming___s_category)
  {
    v3 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&_scrollViewWillBeginZooming___s_category);
  }
  v4 = *(id *)(v3 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v3 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v4))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("UITextSelectionZoomScaleDidChange");
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UITextSelectionWillZoom"), self, v6);

}

- (void)_scrollViewDidEndZooming
{
  uint64_t scrollViewFlags;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  scrollViewFlags = (uint64_t)self->_scrollViewFlags;
  if ((scrollViewFlags & 0x80) == 0)
    *(_QWORD *)&self->_scrollViewFlags = scrollViewFlags & 0xFFFFFFFF7FFFFFFFLL;
  -[_UIScrollViewVFD deactivateSubreason:]((uint64_t)self->_vfd, 2);
  _UIQOSManagedCommitsEnd(self, CFSTR("Zooming"));
  v4 = _scrollViewDidEndZooming___s_category;
  if (!_scrollViewDidEndZooming___s_category)
  {
    v4 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_scrollViewDidEndZooming___s_category);
  }
  v5 = *(id *)(v4 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v4 + 8), self) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v5))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("UITextSelectionZoomScaleDidChange");
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UITextSelectionDidZoom"), self, v7);

}

- (void)_pinContentOffsetToClosestPageBoundary
{
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    -[UIScrollView _prepareToPageWithHorizontalVelocity:verticalVelocity:](self, "_prepareToPageWithHorizontalVelocity:verticalVelocity:", 0.0, 0.0);
    -[UIScrollView setContentOffset:](self, "setContentOffset:", self->_pageDecelerationTarget.x, self->_pageDecelerationTarget.y);
    self->_horizontalVelocity = 0.0;
    self->_verticalVelocity = 0.0;
  }
}

- (CGRect)_rectForPageContainingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat width;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  unsigned int v16;
  double MinY;
  double MaxY;
  int v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    width = a3.size.width;
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *MEMORY[0x1E0C9D648];
    -[UIView bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v15 = vcvtmd_s64_f64(CGRectGetMinX(v25) / v12);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v16 = vcvtmd_s64_f64((CGRectGetMaxX(v26) + -1.0) / v12);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MinY = CGRectGetMinY(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MaxY = CGRectGetMaxY(v28);
    if (v15 == v16)
    {
      v19 = vcvtmd_s64_f64(MinY / v14);
      v20 = vcvtmd_s64_f64((MaxY + -1.0) / v14);
      v7 = v23;
      v6 = v24;
      v8 = v22;
      if (v19 == v20)
      {
        v6 = v12 * (double)v15;
        v7 = v14 * (double)v19;
        v8 = v14;
        v9 = v12;
      }
    }
    else
    {
      v7 = v23;
      v6 = v24;
      v8 = v22;
    }
  }
  v21 = v9;
  result.size.height = v8;
  result.size.width = v21;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_rectForPageContainingView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if ((*(_QWORD *)((char *)&self->_scrollViewFlags + 12) & 0x20) != 0)
  {
    v8 = a3;
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "convertRect:toView:", self);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[UIScrollView _rectForPageContainingRect:](self, "_rectForPageContainingRect:", v10, v12, v14, v16);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)_systemInsetAdjustmentForAdjustmentTypeIdentifier:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableDictionary objectForKey:](self->_contentInsetAdjustments, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)_setSystemInsetAdjustment:(double)a3 forAdjustmentTypeIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *contentInsetAdjustments;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  double v11;
  double v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v6 = a4;
  contentInsetAdjustments = self->_contentInsetAdjustments;
  v15 = v6;
  if (!contentInsetAdjustments)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_contentInsetAdjustments;
    self->_contentInsetAdjustments = v8;

    v6 = v15;
    contentInsetAdjustments = self->_contentInsetAdjustments;
  }
  -[NSMutableDictionary objectForKey:](contentInsetAdjustments, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v12 != a3)
  {
    v13 = self->_contentInsetAdjustments;
    if (fabs(a3) >= 2.22044605e-16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, v15);

    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_contentInsetAdjustments, "removeObjectForKey:", v15);
    }
    *(_QWORD *)((char *)&self->_scrollViewFlags + 12) &= ~0x8000000000000000;
    -[UIScrollView _updateForChangedScrollRelatedInsets](self, "_updateForChangedScrollRelatedInsets");
    -[UIScrollView _updateForChangedScrollIndicatorRelatedInsets](self, "_updateForChangedScrollIndicatorRelatedInsets");
    -[UIScrollView _adjustContentOffsetIfNecessary](self, "_adjustContentOffsetIfNecessary");
  }

}

- (void)_setIsTransientScrollView:(BOOL)a3
{
  if (self->__isTransientScrollView != a3)
  {
    self->__isTransientScrollView = a3;
    if (!a3)
      -[UIScrollView _notifyDidScroll](self, "_notifyDidScroll");
  }
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 == 1 && self->_scrollAnimatingViaAssertion;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  _BOOL4 v6;

  if (a4 == 1)
  {
    v6 = -[UIScrollView isScrollAnimating](self, "isScrollAnimating");
    self->_scrollAnimatingViaAssertion = a3;
    if (v6 && !-[UIScrollView isScrollAnimating](self, "isScrollAnimating"))
      -[UIScrollView _delegateScrollViewAnimationEnded](self, "_delegateScrollViewAnimationEnded");
  }
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return &self->_pinch->super;
}

- (UIGestureRecognizer)directionalPressGestureRecognizer
{
  return &self->_directionalPressGestureRecognizer->super.super;
}

- (BOOL)_useContentDimensionVariablesForConstraintLowering
{
  return self->_useContentDimensionVariablesForConstraintLowering;
}

- (void)_setUseContentDimensionVariablesForConstraintLowering:(BOOL)a3
{
  self->_useContentDimensionVariablesForConstraintLowering = a3;
}

- (NSArray)_automaticContentConstraints
{
  return self->_automaticContentConstraints;
}

- (UIScrollViewMonitor)_scrollViewMonitor
{
  return self->__scrollViewMonitor;
}

- (void)set_scrollViewMonitor:(id)a3
{
  objc_storeStrong((id *)&self->__scrollViewMonitor, a3);
}

- (NSMutableDictionary)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViews, a3);
}

- (NSArray)_allowedTouchTypesForScrolling
{
  return self->__allowedTouchTypesForScrolling;
}

- (BOOL)_isTransientScrollView
{
  return self->__isTransientScrollView;
}

- (BOOL)_viewIsInsideNavigationController
{
  UIScrollView *v2;
  uint64_t v3;
  UIScrollView *v4;
  void *v5;
  char isKindOfClass;

  v2 = self;
  if (v2)
  {
    while (1)
    {
      +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
        break;
      -[UIView superview](v2, "superview");
      v4 = (UIScrollView *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
      if (!v4)
        goto LABEL_7;
    }
    v4 = (UIScrollView *)v3;
  }
  else
  {
    v4 = 0;
  }
LABEL_7:
  -[UIScrollView parentViewController](v4, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIScrollView;
  v4 = a3;
  -[UIResponder encodeRestorableStateWithCoder:](&v18, sel_encodeRestorableStateWithCoder_, v4);
  -[UIScrollView zoomScale](self, "zoomScale", v18.receiver, v18.super_class);
  *(float *)&v5 = v5;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("kScrollViewZoomScaleKey"), v5);
  -[UIScrollView contentOffset](self, "contentOffset");
  v7 = v6;
  v9 = v8;
  -[UIScrollView contentInset](self, "contentInset");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16 - self->_savedKeyboardAdjustmentDelta;
  -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("kScrollViewEffectiveContentInsetKey"));
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("kScrollViewContentInsetKey"), v11, v13, v17, v15);
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("kScrollViewContentOffsetKey"), v7, v9);

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  float v5;
  int v6;
  double v7;
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
  double v21;
  double v22;
  double v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIScrollView;
  -[UIResponder decodeRestorableStateWithCoder:](&v24, sel_decodeRestorableStateWithCoder_, v4);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("kScrollViewZoomScaleKey")))
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kScrollViewZoomScaleKey"));
    -[UIScrollView setZoomScale:](self, "setZoomScale:", v5);
  }
  v6 = objc_msgSend(v4, "containsValueForKey:", CFSTR("kScrollViewContentOffsetKey"));
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (v6)
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("kScrollViewContentOffsetKey"));
    v9 = v10;
    v8 = v11;
  }
  v12 = objc_msgSend(v4, "containsValueForKey:", CFSTR("kScrollViewContentInsetKey"));
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  if (v12)
  {
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("kScrollViewContentInsetKey"));
    v15 = v16;
    v14 = v17;
    v13 = v18;
    v7 = v19;
  }
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("kScrollViewEffectiveContentInsetKey")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("kScrollViewEffectiveContentInsetKey"));
    v21 = v20;
    if ((v6 & dyld_program_sdk_at_least()) == 1
      && -[UIScrollView _viewIsInsideNavigationController](self, "_viewIsInsideNavigationController"))
    {
      v22 = v8 + v21;
      -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
LABEL_15:
      v8 = v22 - v23;
      goto LABEL_18;
    }
  }
  else
  {
    dyld_program_sdk_at_least();
  }
  if ((v6 & v12) == 1 && -[UIScrollView _viewIsInsideNavigationController](self, "_viewIsInsideNavigationController"))
  {
    v22 = v8 + v15;
    -[UIScrollView contentInset](self, "contentInset");
    goto LABEL_15;
  }
  if (v12)
    -[UIScrollView setContentInset:](self, "setContentInset:", v15, v14, v13, v7);
LABEL_18:
  if (v6)
    -[UIScrollView setContentOffset:](self, "setContentOffset:", v9, v8);

}

+ (id)_implicitAnimationCulprits
{
  if (qword_1ECD824F8 != -1)
    dispatch_once(&qword_1ECD824F8, &__block_literal_global_656);
  return (id)qword_1ECD824F0;
}

void __65__UIScrollView__UIApplicationTesting___implicitAnimationCulprits__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("_UIBackdropEffectView"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD824F0;
  qword_1ECD824F0 = v0;

}

- (void)_reenableImplicitAnimationsAfterScrollTest
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
  objc_msgSend((id)objc_opt_class(), "_implicitAnimationCulprits", 0);
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
        -[objc_class _setAnimatedPropertiesEnabled:](NSClassFromString(*(NSString **)(*((_QWORD *)&v7 + 1) + 8 * v6++)), "_setAnimatedPropertiesEnabled:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_suppressImplicitAnimationsForScrollTest
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
  objc_msgSend((id)objc_opt_class(), "_implicitAnimationCulprits", 0);
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
        -[objc_class _setAnimatedPropertiesEnabled:](NSClassFromString(*(NSString **)(*((_QWORD *)&v7 + 1) + 8 * v6++)), "_setAnimatedPropertiesEnabled:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5
{
  -[UIScrollView _performScrollTest:iterations:delta:scrollAxis:](self, "_performScrollTest:iterations:delta:scrollAxis:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 2);
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 scrollAxis:(unint64_t)a6
{
  UIScrollTestParameters *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (a6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 469, CFSTR("UIAxis must be UIAxisVertical or UIAxisHorizontal"));

  }
  v11 = objc_alloc_init(UIScrollTestParameters);
  -[UIScrollTestParameters setTestName:](v11, "setTestName:", v13);
  -[UIScrollTestParameters setIterations:](v11, "setIterations:", a4);
  -[UIScrollTestParameters setDelta:](v11, "setDelta:", (double)a5);
  -[UIScrollTestParameters setAxis:](v11, "setAxis:", a6);
  -[UIScrollView _performScrollTestWithParameters:completionBlock:](self, "_performScrollTestWithParameters:completionBlock:", v11, 0);

}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6
{
  -[UIScrollView _performScrollTest:iterations:delta:length:scrollAxis:](self, "_performScrollTest:iterations:delta:length:scrollAxis:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 2);
}

- (void)_performFullScreenScrollTest:(id)a3 iterations:(int)a4 scrollAxis:(unint64_t)a5
{
  uint64_t v6;
  double v8;
  uint64_t v9;
  double v10;
  id v11;

  v6 = *(_QWORD *)&a4;
  v11 = a3;
  if (a5 == 1)
  {
    -[UIView bounds](self, "bounds");
    v9 = (int)v10;
  }
  else if (a5 == 2)
  {
    -[UIView bounds](self, "bounds");
    v9 = (int)v8;
  }
  else
  {
    v9 = 0;
  }
  -[UIScrollView _performScrollTest:iterations:delta:scrollAxis:](self, "_performScrollTest:iterations:delta:scrollAxis:", v11, v6, v9, a5);

}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7
{
  -[UIScrollView _performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:](self, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, 0);
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7 extraResultsBlock:(id)a8
{
  -[UIScrollView _performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:](self, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8, 0);
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 length:(int)a6 scrollAxis:(unint64_t)a7 extraResultsBlock:(id)a8 completionBlock:(id)a9
{
  id v16;
  id v17;
  UIScrollTestParameters *v18;
  void *v19;
  id v20;

  v20 = a3;
  v16 = a8;
  v17 = a9;
  if (a7 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 505, CFSTR("UIAxis must be UIAxisVertical or UIAxisHorizontal"));

  }
  v18 = objc_alloc_init(UIScrollTestParameters);
  -[UIScrollTestParameters setTestName:](v18, "setTestName:", v20);
  -[UIScrollTestParameters setIterations:](v18, "setIterations:", a4);
  -[UIScrollTestParameters setDelta:](v18, "setDelta:", (double)a5);
  -[UIScrollTestParameters setLength:](v18, "setLength:", (double)a6);
  -[UIScrollTestParameters setAxis:](v18, "setAxis:", a7);
  -[UIScrollTestParameters setExtraResultsBlock:](v18, "setExtraResultsBlock:", v16);
  -[UIScrollView _performScrollTestWithParameters:completionBlock:](self, "_performScrollTestWithParameters:completionBlock:", v18, v17);

}

- (void)_performScrollTestWithParameters:(id)a3 completionBlock:(id)a4
{
  id v6;
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
  char *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v6 = a4;
  v27 = (id)objc_msgSend(a3, "copy");
  -[UIScrollView setScrollTestParameters:](self, "setScrollTestParameters:", v27);
  if (objc_msgSend(v27, "axis") == 2)
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    v8 = v7;
    -[UIScrollView contentSize](self, "contentSize");
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
    v8 = 0.0;
    if (objc_msgSend(v27, "axis") == 1)
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v8 = v11;
      -[UIScrollView contentSize](self, "contentSize");
      v10 = v12;
    }
  }
  objc_msgSend(v27, "length");
  if (v13 != 1.79769313e308)
  {
    objc_msgSend(v27, "length");
    if (v8 + v14 > v10)
    {
      objc_msgSend(v27, "length");
      v8 = v8 - v15;
      if (v8 < 0.0)
        v8 = 0.0;
    }
    objc_msgSend(v27, "length");
    if (v16 > v10 - v8)
      v16 = v10 - v8;
    objc_msgSend(v27, "setLength:", v16);
  }
  objc_msgSend(v27, "setStartOffset:", v8);
  objc_msgSend(v27, "setCompletionBlock:", v6);

  -[UIScrollView _suppressImplicitAnimationsForScrollTest](self, "_suppressImplicitAnimationsForScrollTest");
  _UIQOSManagedCommitsBegin(self, CFSTR("UIScrollViewScrollTest"));
  v17 = getenv("CA_BENCHMARK");
  if (v17 && !strcmp(v17, "1"))
  {
    -[UIScrollView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__incrementForScrollTest_, 0, 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__incrementForScrollTest_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDisplayLink:", v18);

    objc_msgSend(v27, "displayLink");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "maximumRefreshRate");
    if (v20 != 0.0)
      objc_msgSend(v19, "setPreferredFramesPerSecond:", llround(1.0 / v20));

    objc_msgSend(v27, "displayLink");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHighFrameRateReason:", 1048623);

    objc_msgSend(v27, "displayLink");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addToRunLoop:forMode:", v23, *MEMORY[0x1E0C99860]);

  }
  objc_msgSend(v27, "testName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)UIApp;
    objc_msgSend(v27, "testName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startedTest:", v26);

  }
}

- (id)_scrollTestExtraResults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("scrollLength");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[UIScrollView scrollTestParameters](self, "scrollTestParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("scrollLengthUnits");
  v8[0] = v4;
  v8[1] = CFSTR("pixels");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_incrementForScrollTest:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  double v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(void);
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD);
  id v51;

  v51 = a3;
  _UIQOSProcessingBegin("ScrollTest", 0, 0, 0);
  if (v51)
  {
    v4 = (void *)MEMORY[0x1E0CD28B0];
    objc_msgSend(v51, "targetTimestamp");
    v6 = v5;
    objc_msgSend(v51, "targetTimestamp");
    v8 = v7;
    objc_msgSend(v51, "timestamp");
    objc_msgSend(v4, "setEarliestAutomaticCommitTime:", v6 + (v8 - v9) * -0.5);
  }
  -[UIScrollView scrollTestParameters](self, "scrollTestParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "axis");
  -[UIScrollView contentOffset](self, "contentOffset");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v10, "delta");
  v17 = v16;
  objc_msgSend(v10, "endOffset");
  v19 = v18;
  if (v11 == 2)
  {
    -[UIView bounds](self, "bounds");
    v21 = v20;
    objc_msgSend(v10, "length");
    if (v22 == 1.79769313e308)
    {
      -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset");
      v19 = v21 + v23;
    }
    v24 = v15;
  }
  else
  {
    v21 = 0.0;
    if (v11 == 1)
    {
      -[UIView bounds](self, "bounds");
      v21 = v25;
      objc_msgSend(v10, "length");
      if (v26 == 1.79769313e308)
      {
        -[UIScrollView _maximumContentOffset](self, "_maximumContentOffset");
        v19 = v21 + v27;
      }
      v24 = v13;
    }
    else
    {
      v24 = 0.0;
    }
  }
  if (v17 > 0.0)
  {
    objc_msgSend(v10, "delta");
    v28 = 0;
    v30 = v21 + v24 + v29 > v19;
    goto LABEL_15;
  }
  objc_msgSend(v10, "delta");
  v32 = v31;
  objc_msgSend(v10, "startOffset");
  v30 = 0;
  v28 = v24 + v32 <= v33;
  if (v24 + v32 > v33)
  {
LABEL_15:
    if (!v30)
      goto LABEL_17;
  }
  objc_msgSend(v10, "delta");
  objc_msgSend(v10, "setDelta:", -v34);
LABEL_17:
  if (v28)
    objc_msgSend(v10, "setIterations:", objc_msgSend(v10, "iterations") - 1);
  if (v11 == 2)
  {
    objc_msgSend(v10, "delta");
    v15 = v15 + v35;
  }
  else if (v11 == 1)
  {
    objc_msgSend(v10, "delta");
    v13 = v13 + v36;
  }
  -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v13, v15);
  if (objc_msgSend(v10, "iterations") < 1)
  {
    objc_msgSend(v10, "length");
    if (v38 == 1.79769313e308)
    {
      objc_msgSend(v10, "startOffset");
      objc_msgSend(v10, "setLength:", v19 - v39);
    }
    -[UIScrollView _scrollTestExtraResults](self, "_scrollTestExtraResults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extraResultsBlock");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = (void *)objc_msgSend(v40, "mutableCopy");
      objc_msgSend(v10, "extraResultsBlock");
      v43 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v43[2]();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addEntriesFromDictionary:", v44);

    }
    else
    {
      v42 = v40;
    }
    objc_msgSend(v10, "testName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v46 = (void *)UIApp;
      objc_msgSend(v10, "testName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "finishedTest:extraResults:", v47, v42);

    }
    objc_msgSend(v10, "displayLink");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "invalidate");

    -[UIScrollView setScrollTestParameters:](self, "setScrollTestParameters:", 0);
    -[UIScrollView _reenableImplicitAnimationsAfterScrollTest](self, "_reenableImplicitAnimationsAfterScrollTest");
    objc_msgSend(v10, "completionBlock");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend(v10, "completionBlock");
      v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v50)[2](v50, v42);

    }
    _UIQOSManagedCommitsEnd(self, CFSTR("UIScrollViewScrollTest"));

  }
  else
  {
    objc_msgSend(v10, "displayLink");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
      -[UIScrollView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__incrementForScrollTest_, 0, 0.0);
  }

  _UIQOSProcessingEnd();
}

- (void)_simulateScrollWithTranslation:(CGPoint)a3 duration:(double)a4 willBeginDragging:(id)a5 didEndDragging:(id)a6 willBeginDecelerating:(id)a7 didEndDecelerating:(id)a8
{
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  _UIScrollViewMockPanGestureRecognizer *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _UIScrollViewMockPanGestureRecognizer *v42;
  void *v43;
  _UIScrollViewMockPanGestureRecognizer *v44;
  id v45;
  void *v46;
  _UIScrollViewMockPanGestureRecognizer *v47;
  id v48;
  void *v49;
  _UIScrollViewMockPanGestureRecognizer *v50;
  id v51;
  id v52;
  void *v53;
  CFTimeInterval v54;
  __int128 v55;
  _QWORD v56[4];
  _UIScrollViewMockPanGestureRecognizer *v57;
  UIScrollView *v58;
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  id v64;
  _QWORD v65[4];
  _UIScrollViewMockPanGestureRecognizer *v66;
  id v67;
  CFTimeInterval v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  _QWORD v74[4];
  _UIScrollViewMockPanGestureRecognizer *v75;
  UIScrollView *v76;
  id v77;
  double v78;
  double v79;
  double v80;
  double v81;
  _QWORD aBlock[5];
  _UIScrollViewMockPanGestureRecognizer *v83;
  _QWORD v84[4];
  id v85;
  uint64_t *v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  uint64_t *v91;
  uint64_t *v92;
  id v93;
  _QWORD v94[4];
  id v95;
  uint64_t *v96;
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  id location[2];

  y = a3.y;
  x = a3.x;
  v15 = a5;
  *((_QWORD *)&v55 + 1) = a6;
  *(_QWORD *)&v55 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v17);

  v110 = 0;
  v111 = &v110;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__237;
  v114 = __Block_byref_object_dispose__237;
  v115 = 0;
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__237;
  v108 = __Block_byref_object_dispose__237;
  v109 = 0;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__237;
  v102 = __Block_byref_object_dispose__237;
  v103 = 0;
  v18 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    WeakRetained = objc_loadWeakRetained(location);
    v94[0] = v18;
    v94[1] = 3221225472;
    v94[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke;
    v94[3] = &unk_1E16EAD20;
    v95 = v15;
    objc_copyWeak(&v97, location);
    v96 = &v110;
    objc_msgSend(WeakRetained, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIScrollViewWillBeginDraggingNotification"), self, 0, v94);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v111[5];
    v111[5] = v20;

    objc_destroyWeak(&v97);
  }
  if (v55 != 0)
  {
    v22 = objc_loadWeakRetained(location);
    v88[0] = v18;
    v88[1] = 3221225472;
    v88[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_2;
    v88[3] = &unk_1E16EAD48;
    v89 = *((id *)&v55 + 1);
    objc_copyWeak(&v93, location);
    v91 = &v104;
    v90 = (id)v55;
    v92 = &v98;
    objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIScrollViewDidEndDraggingNotification"), self, 0, v88);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v105[5];
    v105[5] = v23;

    objc_destroyWeak(&v93);
  }
  if (v16)
  {
    v25 = objc_loadWeakRetained(location);
    v84[0] = v18;
    v84[1] = 3221225472;
    v84[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_3;
    v84[3] = &unk_1E16EAD20;
    v85 = v16;
    objc_copyWeak(&v87, location);
    v86 = &v98;
    objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIScrollViewDidEndDeceleratingNotification"), self, 0, v84);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v99[5];
    v99[5] = v26;

    objc_destroyWeak(&v87);
  }
  if (qword_1ECD82500 != -1)
    dispatch_once(&qword_1ECD82500, &__block_literal_global_165_3);
  v28 = _MergedGlobals_1324 == 0;
  -[UIScrollView _panGestureRecognizer](self, "_panGestureRecognizer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v29, "gestureRecognizer");
    v30 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v30;
  }
  v31 = objc_alloc_init(_UIScrollViewMockPanGestureRecognizer);
  -[_UIScrollViewMockPanGestureRecognizer setGestureRecognizer:](v31, "setGestureRecognizer:", v29);
  -[UIScrollView _setPanGestureRecognizer:](self, "_setPanGestureRecognizer:", v31);
  v54 = CACurrentMediaTime();
  v32 = dbl_1866854C0[v28];
  v33 = fmax(a4, v32);
  v34 = -x;
  v35 = -y;
  v36 = -y / v33;
  v37 = v34 / v33;
  v38 = v33 - v32;
  v39 = fmin(v32 / (v33 - v32), 1.0);
  v40 = v39 * v34;
  v41 = v39 * v35;
  aBlock[0] = v18;
  aBlock[1] = 3221225472;
  aBlock[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_4;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v42 = v31;
  v83 = v42;
  v43 = _Block_copy(aBlock);
  v74[0] = v18;
  v74[1] = 3221225472;
  v74[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_5;
  v74[3] = &unk_1E16E5000;
  v44 = v42;
  v78 = v40;
  v79 = v41;
  v80 = v37;
  v81 = v36;
  v75 = v44;
  v76 = self;
  v45 = v43;
  v77 = v45;
  v46 = _Block_copy(v74);
  v65[0] = v18;
  v65[1] = 3221225472;
  v65[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_6;
  v65[3] = &unk_1E16EAD70;
  v68 = v54;
  v69 = v38;
  v70 = v34;
  v71 = v35;
  v47 = v44;
  v66 = v47;
  v72 = v37;
  v73 = v36;
  v48 = v45;
  v67 = v48;
  v49 = _Block_copy(v65);
  v56[0] = v18;
  v56[1] = 3221225472;
  v56[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_7;
  v56[3] = &unk_1E16EADC0;
  v50 = v47;
  v57 = v50;
  v51 = v48;
  v60 = v51;
  v58 = self;
  v52 = v29;
  v59 = v52;
  v61 = &v110;
  v62 = &v104;
  v63 = &v98;
  objc_copyWeak(&v64, location);
  v53 = _Block_copy(v56);
  -[UIScrollView _simulateGestureWithDuration:begin:update:end:](self, "_simulateGestureWithDuration:begin:update:end:", v46, v49, v53, v38);

  objc_destroyWeak(&v64);
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v110, 8);

  objc_destroyWeak(location);
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_UIScrollViewDidEndDraggingWillDecelerateUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  if ((_DWORD)v5)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v11 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v11, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

  }
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", objc_msgSend((id)objc_opt_class(), "_panGestureAction"), *(_QWORD *)(a1 + 40));
}

uint64_t __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "simulateTranslation:velocity:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  v2 = (void *)UIApp;
  objc_msgSend(*(id *)(a1 + 40), "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "_touchesEventForWindow:", v3);

  objc_msgSend(*(id *)(a1 + 40), "_beginTrackingWithEvent:", v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_6(uint64_t a1)
{
  double v2;

  v2 = fmin((CACurrentMediaTime() - *(double *)(a1 + 48)) / *(double *)(a1 + 56), 1.0);
  objc_msgSend(*(id *)(a1 + 32), "simulateTranslation:velocity:", *(double *)(a1 + 64) * v2, *(double *)(a1 + 72) * v2, *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  __int128 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setGestureRecognizer:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_panGestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_setPanGestureRecognizer:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    v4 = dispatch_time(0, 5000000000);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_8;
    v5[3] = &unk_1E16EAD98;
    v5[4] = *(_QWORD *)(a1 + 64);
    objc_copyWeak(&v7, (id *)(a1 + 88));
    v6 = *(_OWORD *)(a1 + 72);
    dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v7);
  }
}

void __153__UIScrollView__UIApplicationTesting___simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v5, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v8, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

- (void)_simulateZoomByScaleFactor:(double)a3 duration:(double)a4 willBeginZooming:(id)a5 didEndZooming:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  _UIScrollViewMockPinchGestureRecognizer *v23;
  CFTimeInterval v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _UIScrollViewMockPinchGestureRecognizer *v30;
  void *v31;
  _UIScrollViewMockPinchGestureRecognizer *v32;
  id v33;
  void *v34;
  _UIScrollViewMockPinchGestureRecognizer *v35;
  id v36;
  void *v37;
  _UIScrollViewMockPinchGestureRecognizer *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  _UIScrollViewMockPinchGestureRecognizer *v46;
  UIScrollView *v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  id v52;
  _QWORD v53[4];
  _UIScrollViewMockPinchGestureRecognizer *v54;
  id v55;
  CFTimeInterval v56;
  double v57;
  double v58;
  double v59;
  _QWORD v60[4];
  _UIScrollViewMockPinchGestureRecognizer *v61;
  UIScrollView *v62;
  id v63;
  double v64;
  double v65;
  _QWORD aBlock[5];
  _UIScrollViewMockPinchGestureRecognizer *v67;
  _QWORD v68[4];
  id v69;
  uint64_t *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  uint64_t *v74;
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  id location[2];

  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v12);

  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__237;
  v86 = __Block_byref_object_dispose__237;
  v87 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__237;
  v80 = __Block_byref_object_dispose__237;
  v81 = 0;
  v13 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained(location);
    v72[0] = v13;
    v72[1] = 3221225472;
    v72[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke;
    v72[3] = &unk_1E16EAD20;
    v73 = v10;
    objc_copyWeak(&v75, location);
    v74 = &v82;
    objc_msgSend(WeakRetained, "addObserverForName:object:queue:usingBlock:", CFSTR("UITextSelectionWillZoom"), self, 0, v72);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v83[5];
    v83[5] = v15;

    objc_destroyWeak(&v75);
  }
  if (v11)
  {
    v17 = objc_loadWeakRetained(location);
    v68[0] = v13;
    v68[1] = 3221225472;
    v68[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_2;
    v68[3] = &unk_1E16EAD20;
    v69 = v11;
    objc_copyWeak(&v71, location);
    v70 = &v76;
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("UITextSelectionDidZoom"), self, 0, v68);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v77[5];
    v77[5] = v18;

    objc_destroyWeak(&v71);
  }
  if (qword_1ECD82500 != -1)
    dispatch_once(&qword_1ECD82500, &__block_literal_global_165_3);
  v20 = _MergedGlobals_1324 == 0;
  -[UIScrollView pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v21, "gestureRecognizer");
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }
  v23 = objc_alloc_init(_UIScrollViewMockPinchGestureRecognizer);
  -[_UIScrollViewMockPinchGestureRecognizer setGestureRecognizer:](v23, "setGestureRecognizer:", v21);
  -[UIScrollView _setPinchGestureRecognizer:](self, "_setPinchGestureRecognizer:", v23);
  v24 = CACurrentMediaTime();
  v25 = dbl_1866854C0[v20];
  v26 = fmax(a4, v25);
  v27 = a3 / v26;
  v28 = v26 - v25;
  v29 = (a3 + -1.0) * fmin(v25 / (v26 - v25), 1.0) + 1.0;
  aBlock[0] = v13;
  aBlock[1] = 3221225472;
  aBlock[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_3;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v30 = v23;
  v67 = v30;
  v31 = _Block_copy(aBlock);
  v60[0] = v13;
  v60[1] = 3221225472;
  v60[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_4;
  v60[3] = &unk_1E16D6CD8;
  v32 = v30;
  v64 = v29;
  v65 = v27;
  v61 = v32;
  v62 = self;
  v33 = v31;
  v63 = v33;
  v34 = _Block_copy(v60);
  v53[0] = v13;
  v53[1] = 3221225472;
  v53[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_5;
  v53[3] = &unk_1E16EADE8;
  v56 = v24;
  v57 = v28;
  v58 = a3;
  v35 = v32;
  v54 = v35;
  v59 = v27;
  v36 = v33;
  v55 = v36;
  v37 = _Block_copy(v53);
  v42 = v13;
  v43 = 3221225472;
  v44 = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_6;
  v45 = &unk_1E16EAE38;
  v38 = v35;
  v46 = v38;
  v39 = v36;
  v49 = v39;
  v47 = self;
  v40 = v21;
  v48 = v40;
  v50 = &v82;
  v51 = &v76;
  objc_copyWeak(&v52, location);
  v41 = _Block_copy(&v42);
  -[UIScrollView _simulateGestureWithDuration:begin:update:end:](self, "_simulateGestureWithDuration:begin:update:end:", v34, v37, v41, v28, v42, v43, v44, v45);

  objc_destroyWeak(&v52);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  objc_destroyWeak(location);

}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", objc_msgSend((id)objc_opt_class(), "_pinchGestureAction"), *(_QWORD *)(a1 + 40));
}

uint64_t __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "simulateScale:velocity:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  v2 = (void *)UIApp;
  objc_msgSend(*(id *)(a1 + 40), "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "_touchesEventForWindow:", v3);

  objc_msgSend(*(id *)(a1 + 40), "_beginTrackingWithEvent:", v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "simulateScale:velocity:", fmin((CACurrentMediaTime() - *(double *)(a1 + 48)) / *(double *)(a1 + 56), 1.0) * (*(double *)(a1 + 64) + -1.0)+ 1.0, *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD block[6];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setGestureRecognizer:", 0);
  objc_msgSend(*(id *)(a1 + 40), "pinchGestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_setPinchGestureRecognizer:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v4 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_7;
    block[3] = &unk_1E16EAE10;
    block[4] = *(_QWORD *)(a1 + 64);
    objc_copyWeak(&v6, (id *)(a1 + 80));
    block[5] = *(_QWORD *)(a1 + 72);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);
  }
}

void __106__UIScrollView__UIApplicationTesting___simulateZoomByScaleFactor_duration_willBeginZooming_didEndZooming___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

- (void)_simulateGestureWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void (*v12)(void);
  id v13;
  id v14;

  v14 = a5;
  if (a3 <= 0.0)
  {
    v12 = (void (*)(void))*((_QWORD *)a4 + 2);
    v11 = (void (**)(_QWORD))a6;
    v13 = a4;
    v12();

    v11[2](v11);
  }
  else
  {
    v9 = a6;
    v10 = a4;
    +[_UIScrollViewGestureSimulator sharedInstance](_UIScrollViewGestureSimulator, "sharedInstance");
    v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "simulateGestureWithDuration:begin:update:end:", v10, v14, v9, a3);

  }
}

- (void)_performNaturalScrollTest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)qword_1ECD82508;
  v21 = qword_1ECD82508;
  if (!qword_1ECD82508)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getRPTScrollViewTestParametersClass_block_invoke;
    v16 = &unk_1E16B14C0;
    v17 = &v18;
    __getRPTScrollViewTestParametersClass_block_invoke((uint64_t)&v13);
    v8 = (void *)v19[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithTestName:scrollView:completionHandler:", v6, self, v7);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v11 = (void *)qword_1ECD82518;
  v21 = qword_1ECD82518;
  if (!qword_1ECD82518)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getRPTTestRunnerClass_block_invoke;
    v16 = &unk_1E16B14C0;
    v17 = &v18;
    __getRPTTestRunnerClass_block_invoke((uint64_t)&v13);
    v11 = (void *)v19[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v12, "runTestWithParameters:", v10);

}

@end
