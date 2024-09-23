@implementation UINavigationController

- (BOOL)isNavigationBarHidden
{
  UINavigationController *v3;
  UINavigationController *v4;
  int v5;

  if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
  {
    -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
    v3 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 == self)
      v5 = *(_DWORD *)&self->_navigationControllerFlags & 1;
    else
      LOBYTE(v5) = -[UINavigationController isNavigationBarHidden](v3, "isNavigationBarHidden");

  }
  else
  {
    return *(_DWORD *)&self->_navigationControllerFlags & 1;
  }
  return v5;
}

- (id)_outermostNavigationController
{
  void *v3;
  void *v4;
  UINavigationController *v5;
  UINavigationController *v6;

  if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
  {
    -[UIViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "_outermostNavigationController");
      v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = self;
    }
    v6 = v5;

  }
  else
  {
    v6 = self;
  }
  return v6;
}

- (BOOL)_isNestedNavigationController
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 46) & 1;
}

- (id)_traitOverridesForChildViewController:(id)a3
{
  id v4;
  UINavigationController *v5;
  UITraitCollection *v6;

  v4 = a3;
  if (((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController, (uint64_t)CFSTR("NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController")) & 1) != 0|| byte_1ECD7607C)&& (objc_msgSend(v4, "_departingParentViewController"), v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue(), v5, v5 == self))
  {
    v6 = self->_overrideTraitCollectionForPoppingViewControler;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_independentContainedScrollViewIntermediateToDescendantViewController:(id)a3
{
  return 0;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIViewController _existingView](self, "_existingView", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_shouldReverseLayoutDirection");

  -[UIViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  if (v9)
    v12 = v11;
  else
    v12 = v10;
  *a4 = v12;
  if (v9)
    v13 = v10;
  else
    v13 = v11;
  *a5 = v13;
}

- (double)_preferredHeightForHidingNavigationBarForViewController:(id)a3 topItem:(id)a4
{
  id v6;
  id v7;
  UINavigationController *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = v6;
  if (-[UINavigationController isNavigationBarHidden](v8, "isNavigationBarHidden")
    && -[_UINavigationControllerPalette _isPalettePinningBarHidden](v8->_topPalette, "_isPalettePinningBarHidden"))
  {
    goto LABEL_14;
  }
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v8, v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController navigationBar](v8, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  if (v12 == 0.0
    || !_isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(v8, v10)
    || !v8->_interactiveScrollActive
    && (objc_msgSend(v10, "isScrollAnimating") & 1) == 0
    && (objc_msgSend(v10, "refreshControl"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "refreshControlState"),
        v13,
        v14 != 4)
    && !-[UINavigationController _isPushingOrPopping](v8, "_isPushingOrPopping")
    && -[UIViewController _appearState](v8, "_appearState") != 3
    && (((*(_DWORD *)&v8->super._viewControllerFlags >> 1) & 3u) - 1 > 1
     || (objc_msgSend(v11, "_hasVariableHeight") & 1) == 0))
  {

LABEL_14:
    -[UINavigationController _intrinsicNavigationBarHeightRangeForNavItem:](v8, "_intrinsicNavigationBarHeightRangeForNavItem:", v7);
    v16 = v17;
    goto LABEL_15;
  }

  -[UIView frame](v8->_navigationBar, "frame");
  v16 = v15;
LABEL_15:

  return v16;
}

- ($1AB5FA073B851C12C2339EC22442E995)_intrinsicNavigationBarHeightRangeForNavItem:(id)a3
{
  double minimum;
  double preferred;
  double maximum;
  UINavigationBar *navigationBar;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  $1AB5FA073B851C12C2339EC22442E995 result;

  if (self->_interactiveScrollActive)
  {
    minimum = self->_interactiveScrollNavBarIntrinsicHeightRange.minimum;
    preferred = self->_interactiveScrollNavBarIntrinsicHeightRange.preferred;
    maximum = self->_interactiveScrollNavBarIntrinsicHeightRange.maximum;
  }
  else
  {
    navigationBar = self->_navigationBar;
    v8 = a3;
    -[UINavigationController _widthForLayout](self, "_widthForLayout");
    -[UINavigationBar _layoutHeightsForNavigationItem:fittingWidth:](navigationBar, "_layoutHeightsForNavigationItem:fittingWidth:", v8);
    minimum = v9;
    preferred = v10;
    maximum = v11;

  }
  v12 = minimum;
  v13 = preferred;
  v14 = maximum;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- ($512FAC6031DC579ED3B9B436D64463DA)_calculateTopLayoutInfoForViewController:(SEL)a3
{
  id v6;
  _BOOL4 v7;
  char v8;
  UINavigationController *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  unint64_t computingNavigationBarHeightWithRevealPresentationIterations;
  unint64_t v15;
  NSObject *v16;
  double v17;
  _UINavigationControllerPalette *topPalette;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  int v24;
  int v25;
  uint64_t v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  $512FAC6031DC579ED3B9B436D64463DA *result;
  NSObject *v33;
  BOOL v34;
  uint8_t buf[40];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v34 = 0;
  v7 = -[UINavigationController _shouldNavigationBarInsetViewController:orOverlayContent:](self, "_shouldNavigationBarInsetViewController:orOverlayContent:", v6, &v34);
  v8 = objc_msgSend(v6, "edgesForExtendedLayout");
  v9 = self;
  v10 = v6;
  if (-[UINavigationController _isPushing](v9, "_isPushing"))
  {
    v11 = 2;
  }
  else if (-[UINavigationController _isPopping](v9, "_isPopping"))
  {
    v11 = 3;
  }
  else
  {
    v11 = 0;
  }
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v9, v10, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EDDB0F48 != -1)
    dispatch_once(&qword_1EDDB0F48, &__block_literal_global_1617);
  v13 = v8 & 1;
  if (byte_1EDDB0E53)
  {
    if (v11 == 3)
    {
      computingNavigationBarHeightWithRevealPresentationIterations = v9->_computingNavigationBarHeightWithRevealPresentationIterations;
      if (computingNavigationBarHeightWithRevealPresentationIterations < 0x65)
      {
        v9->_computingNavigationBarHeightWithRevealPresentationIterations = computingNavigationBarHeightWithRevealPresentationIterations
                                                                          + 1;
        v11 = 3;
      }
      else
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v10;
            _os_log_fault_impl(&dword_185066000, v33, OS_LOG_TYPE_FAULT, "Breaking out of suspected layout loop while popping. self=%@ vc=%@", buf, 0x16u);
          }

        }
        else
        {
          v15 = qword_1EDDB0F50;
          if (!qword_1EDDB0F50)
          {
            v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&qword_1EDDB0F50);
          }
          v16 = *(NSObject **)(v15 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v10;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Breaking out of suspected layout loop while popping. self=%@ vc=%@", buf, 0x16u);
          }
        }
        v11 = 0;
      }
    }
    else
    {
      v9->_computingNavigationBarHeightWithRevealPresentationIterations = 0;
    }
  }
  memset(buf, 0, 32);
  -[UINavigationController _calculateTopViewFramesForLayoutWithViewController:contentScrollView:navBarFrame:topPaletteFrame:topLayoutType:](v9, "_calculateTopViewFramesForLayoutWithViewController:contentScrollView:navBarFrame:topPaletteFrame:topLayoutType:", v10, v12, buf, 0, v11);
  v17 = *(double *)&buf[24];

  topPalette = v9->_topPalette;
  v19 = 0.0;
  if (topPalette && -[_UINavigationControllerPalette isAttached](topPalette, "isAttached"))
  {
    -[_UINavigationControllerPalette preferredContentInsets](v9->_topPalette, "preferredContentInsets");
    if (v20 == 0.0)
    {
      -[UIView frame](v9->_topPalette, "frame");
      v22 = v21;
    }
    else
    {
      v22 = v20;
    }
    v23 = 1;
  }
  else
  {
    v23 = 0;
    v22 = 0.0;
  }
  if (v7)
    v19 = v17 + 0.0;
  if (v13)
  {
    v25 = !-[UINavigationController _isNavigationBarVisible](v9, "_isNavigationBarVisible");
    if (v34)
      v24 = 1;
    else
      v24 = v25;
  }
  else
  {
    v24 = 0;
  }
  if (-[UINavigationController _isNavigationBarVisible](v9, "_isNavigationBarVisible"))
  {
    v26 = (*(_QWORD *)&v9->_navigationControllerFlags >> 13) & 1;
    if (!v23)
    {
LABEL_35:
      v27 = v19;
      goto LABEL_43;
    }
  }
  else
  {
    LODWORD(v26) = 1;
    if (!v23)
      goto LABEL_35;
  }
  if (v7
    || (v27 = 0.0, (_DWORD)v26)
    && -[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](v9->_topPalette, "isVisibleWhenPinningBarIsHidden"))
  {
    v28 = -0.0;
    if (!v24)
      v28 = v22;
    v27 = v19 + v28;
  }
LABEL_43:
  v29 = v34;
  v30 = -0.0;
  if (v34)
    v30 = v17;
  v31 = v22 + v30;
  if (v7)
    v31 = 0.0;
  retstr->var0 = v31;
  retstr->var1 = v27;
  retstr->var2 = v17;
  retstr->var3 = v22;
  retstr->var4 = v23;
  retstr->var5 = v13;
  retstr->var6 = v7;
  retstr->var7 = v29;

  return result;
}

- (BOOL)_isPopping
{
  void *v3;
  char v4;

  -[UINavigationBar _stack](self->_navigationBar, "_stack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPopping");

  return (v4 & 1) != 0
      || -[UINavigationController _isTransitioning](self, "_isTransitioning")
      && -[UINavigationController lastOperation](self, "lastOperation") == 2;
}

- (BOOL)_isPushing
{
  void *v3;
  char v4;
  int64_t v5;

  -[UINavigationBar _stack](self->_navigationBar, "_stack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPushing");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if (!-[UINavigationController _isTransitioning](self, "_isTransitioning")
         || (v5 = -[UINavigationController lastOperation](self, "lastOperation"), v5 != 1))
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_isTransitioning
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 2) & 1;
}

- (void)_calculateTopViewFramesForLayoutWithViewController:(id)a3 contentScrollView:(id)a4 navBarFrame:(CGRect *)a5 topPaletteFrame:(CGRect *)a6 topLayoutType:(int64_t)a7
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UINavigationController *v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _UINavigationControllerPalette *topPalette;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  _UINavigationControllerPalette *transitioningTopPalette;
  CGFloat v41;
  CGFloat v42;
  UINavigationController *v43;
  UINavigationController *v44;
  void *v45;
  int v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _BOOL4 v54;
  int v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  _UINavigationControllerPalette *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  void *v75;
  void *v76;
  uint64_t v77;
  double v78;
  _UINavigationControllerPalette *v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  CGFloat MaxY;
  CGSize v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  CGRect v92;

  v91 = a3;
  v13 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 6501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oNavBarFrame != NULL"));

  }
  if (!v13)
    a7 = 0;
  if ((unint64_t)(a7 - 2) < 3)
  {
    -[UINavigationController _calculateTopViewFramesFromLayoutHeightsWithViewController:contentScrollView:preservingContentInset:respectFullExtension:gettingNavBarFrame:topPaletteFrame:](self, "_calculateTopViewFramesFromLayoutHeightsWithViewController:contentScrollView:preservingContentInset:respectFullExtension:gettingNavBarFrame:topPaletteFrame:", v91, v13, (a7 & 0xFFFFFFFFFFFFFFFELL) == 2, a7 == 3, a5, a6);
    if (a7 != 4)
      goto LABEL_57;
    goto LABEL_11;
  }
  if (a7 != 5)
  {
    if (!a7)
    {
      -[UINavigationController _calculateTopViewFramesForExpandedLayoutWithViewController:contentScrollView:gettingNavBarFrame:topPaletteFrame:](self, "_calculateTopViewFramesForExpandedLayoutWithViewController:contentScrollView:gettingNavBarFrame:topPaletteFrame:", v91, v13, a5, a6);
      goto LABEL_57;
    }
LABEL_11:
    v14 = v91;
    if (objc_msgSend(v14, "_isNestedNavigationController"))
    {
      objc_msgSend(v14, "topViewController");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v15;
    }
    objc_msgSend(v14, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _intrinsicNavigationBarHeightRangeForNavItem:](self, "_intrinsicNavigationBarHeightRangeForNavItem:", v16);
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = self;
    v24 = v14;
    v25 = v13;
    if (v24)
    {
      if (v13)
      {
LABEL_15:
        -[UINavigationController _topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:](v23, "_topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:", v24);
        v27 = v26;
        -[UIView frame](v23->_navigationBar, "frame");
        v29 = v28;
        topPalette = v23->_topPalette;
        if (topPalette)
        {
          -[UIView frame](topPalette, "frame");
          v32 = v31;
        }
        else
        {
          v32 = 0.0;
        }
        v43 = v23;
        v44 = v43;
        if (v43->__positionBarsExclusivelyWithSafeArea
          && (-[UIViewController _existingView](v43, "_existingView"),
              v45 = (void *)objc_claimAutoreleasedReturnValue(),
              v46 = objc_msgSend(v45, "_usesMinimumSafeAreas"),
              v45,
              v46))
        {
          -[UIViewController _existingView](v44, "_existingView");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "_minimumSafeAreaInsets");
          v49 = v48;

        }
        else
        {
          -[UIViewController _contentOverlayInsets](v44, "_contentOverlayInsets");
          v49 = v50;
        }
        v51 = v22 + v27;

        objc_msgSend(v25, "adjustedContentInset");
        if (v49 >= v52)
          v49 = v52;
        if ((_insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v24) & 1) != 0
          || !objc_msgSend(v25, "_isScrollingToTop"))
        {
          v54 = -[UINavigationController _interactiveScrollActive](v44, "_interactiveScrollActive");
          if (v13)
            v55 = objc_msgSend(v25, "_hasContentForBarInteractions");
          else
            v55 = 0;
          if ((v54 | v55) == 1)
          {
            v56 = v29 + v32;
            v57 = _possibleTopViewsHeightBasedOnContentOffsetForScrollView(v44, v25);
            objc_msgSend(v25, "contentInset");
            v59 = v58;
            objc_msgSend(v25, "_systemContentInset");
            v61 = v57 - (v59 + v60 - v49);
            if (v51 >= v56)
              v62 = v56;
            else
              v62 = v51;
            v51 = v62 + v61;
          }
        }
        else
        {
          objc_msgSend(v25, "_contentOffsetOrDeferredContentOffset");
          v51 = fmax(v51 - v53, 0.0);
        }

        v63 = v23->_topPalette;
        if (v63)
        {
          -[UIView frame](v63, "frame");
          v65 = v64;
        }
        else
        {
          v65 = 0.0;
        }
        v66 = v51 - v65;
        if (v44->_interactiveScrollActive || v66 <= v18)
        {
          v22 = v51 - v65;
        }
        else if (v66 < v22)
        {
          if (v66 >= v20)
            v22 = v51 - v65;
          else
            v22 = v20;
        }
        -[UINavigationController _navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:](v44, "_navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:", v24, -[UINavigationBar _hasFixedMaximumHeight](v23->_navigationBar, "_hasFixedMaximumHeight") ^ 1, v22);
        v68 = v67;
        -[UINavigationController _widthForLayout](v44, "_widthForLayout");
        v70 = v69;
        -[UIView frame](v23->_navigationBar, "frame");
        v72 = v71;
        v74 = v73;
        if (v44->__positionBarsExclusivelyWithSafeArea)
        {
          -[UINavigationController navigationBar](v44, "navigationBar");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "traitCollection");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "userInterfaceIdiom");

          if (v77 == 3)
          {
            -[UIViewController _contentOverlayInsets](v44, "_contentOverlayInsets");
            v72 = v78;
          }
        }
        if (a6)
        {
          v79 = v23->_topPalette;
          if (v79)
          {
            -[UIView frame](v79, "frame");
            v81 = v80;
            v83 = v82;
            v92.origin.x = v72;
            v92.origin.y = v74;
            v92.size.width = v70;
            v92.size.height = v68;
            MaxY = CGRectGetMaxY(v92);
            a6->origin.x = v81;
            a6->origin.y = MaxY;
            a6->size.width = v83;
            a6->size.height = v65;
          }
          else
          {
            v85 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
            a6->origin = (CGPoint)*MEMORY[0x1E0C9D648];
            a6->size = v85;
          }
        }
        a5->origin.x = v72;
        a5->origin.y = v74;
        a5->size.width = v70;
        a5->size.height = v68;

        goto LABEL_57;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat _verticalSpaceToUseForDynamicTopViewLayout(UINavigationController *__strong, CGFloat, UIViewController *__strong, UIScrollView *__strong)");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "handleFailureInFunction:file:lineNumber:description:", v88, CFSTR("UINavigationController.m"), 6798, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topViewController != nil"));

      if (v13)
        goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat _verticalSpaceToUseForDynamicTopViewLayout(UINavigationController *__strong, CGFloat, UIViewController *__strong, UIScrollView *__strong)");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "handleFailureInFunction:file:lineNumber:description:", v90, CFSTR("UINavigationController.m"), 6799, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentScrollView != nil"));

    goto LABEL_15;
  }
  -[UIView frame](self->_navigationBar, "frame");
  v34 = v33;
  v36 = v35;
  -[UINavigationController _widthForLayout](self, "_widthForLayout");
  v38 = v37;
  -[UINavigationBar _heightForRestoringFromCancelledTransition](self->_navigationBar, "_heightForRestoringFromCancelledTransition");
  a5->origin.x = v34;
  a5->origin.y = v36;
  a5->size.width = v38;
  a5->size.height = v39;
  if (a6)
  {
    transitioningTopPalette = self->_transitioningTopPalette;
    if (!transitioningTopPalette)
      transitioningTopPalette = self->_topPalette;
    -[UIView frame](transitioningTopPalette, "frame");
    a6->origin.x = 0.0;
    a6->origin.y = 0.0;
    a6->size.width = v41;
    a6->size.height = v42;
  }
LABEL_57:

}

- (void)_calculateTopViewFramesForExpandedLayoutWithViewController:(id)a3 contentScrollView:(id)a4 gettingNavBarFrame:(CGRect *)a5 topPaletteFrame:(CGRect *)a6
{
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  _BOOL4 v16;
  int v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGSize v33;
  id v34;

  v34 = a3;
  v10 = a4;
  -[UINavigationController _widthForLayout](self, "_widthForLayout");
  v12 = v11;
  -[UIView frame](self->_navigationBar, "frame");
  -[UINavigationController _navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:](self, "_navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:", v34, 0, v13);
  v15 = v14;
  v16 = -[UINavigationController _interactiveScrollActive](self, "_interactiveScrollActive");
  if (v10)
    v17 = objc_msgSend(v10, "_hasContentForBarInteractions");
  else
    v17 = 0;
  if (((v16 | v17) & 1) == 0)
  {
    -[UINavigationController _widthForLayout](self, "_widthForLayout");
    v19 = v18;
    -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_layoutHeightsForNavigationItem:fittingWidth:", v21, v19);
    v15 = v22;

  }
  if (a5)
  {
    -[UIView frame](self->_navigationBar, "frame");
    a5->origin.x = v23;
    a5->origin.y = v24;
    if (self->__positionBarsExclusivelyWithSafeArea)
    {
      -[UINavigationController navigationBar](self, "navigationBar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "traitCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "userInterfaceIdiom");

      if (v27 == 3)
      {
        -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
        a5->origin.x = v28;
      }
    }
    a5->size.width = v12;
    a5->size.height = v15;
  }
  if (a6)
  {
    if (self->_topPalette)
    {
      -[UINavigationController _frameForPalette:](self, "_frameForPalette:");
      a6->origin.x = v29;
      a6->origin.y = v30;
      a6->size.width = v31;
      a6->size.height = v32;
    }
    else
    {
      v33 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      a6->origin = (CGPoint)*MEMORY[0x1E0C9D648];
      a6->size = v33;
    }
  }

}

- (BOOL)_interactiveScrollActive
{
  return self->_interactiveScrollActive;
}

- (CGSize)_navigationBarSizeForViewController:(id)a3 proposedHeight:(double)a4 allowRubberBandStretch:(BOOL)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  int isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets;
  double v24;
  double v25;
  CGSize result;

  v8 = a3;
  -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _widthForLayout](self, "_widthForLayout");
  v11 = v10;
  objc_msgSend(v8, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_layoutHeightsForNavigationItem:fittingWidth:", v12, v11);
  v14 = v13;
  v16 = v15;

  if (v14 < a4)
    v14 = a4;
  -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 == v8)
    goto LABEL_6;
  objc_msgSend(v17, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_searchControllerIfAllowed");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_currentActiveChildViewController");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v22 = v16;
    goto LABEL_15;
  }
  v22 = v16;
  if (v21 == v8)
  {
LABEL_6:
    isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v8);
    if (isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets)
      v22 = v14;
    else
      v22 = v16;
    if (isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets && !a5)
    {
      if (v16 >= v14)
        v22 = v14;
      else
        v22 = v16;
    }
  }
LABEL_15:

  v24 = v11;
  v25 = v22;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)_navigationBarForNestedNavigationController
{
  void *v2;
  void *v3;

  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_existingNavigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_existingNavigationBar
{
  return self->_navigationBar;
}

- (BOOL)_shouldNavigationBarInsetViewController:(id)a3 orOverlayContent:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;

  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if ((objc_msgSend(v6, "_isNestedNavigationController") & 1) != 0
    || (-[UINavigationController _outermostNavigationController](self, "_outermostNavigationController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "_isNavigationBarEffectivelyVisible"),
        v8,
        !v9))
  {
    v10 = 0;
  }
  else
  {
    if ((objc_msgSend(v7, "extendedLayoutIncludesOpaqueBars") & 1) != 0
      || -[UINavigationController _hasTranslucentNavigationBarIncludingViewController:](self, "_hasTranslucentNavigationBarIncludingViewController:", v7))
    {
      v10 = (objc_msgSend(v7, "edgesForExtendedLayout") & 1) == 0;
      if (!a4)
        goto LABEL_10;
      goto LABEL_12;
    }
    v10 = 1;
    if (a4)
LABEL_12:
      *a4 = !v10;
  }
LABEL_10:

  return v10;
}

- (BOOL)_hasTranslucentNavigationBarIncludingViewController:(id)a3
{
  id v4;
  void *v5;
  char IsTranslucentOnScreen;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[UINavigationController navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsTranslucentOnScreen = objc_msgSend(v5, "isTranslucent");

  -[UINavigationController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_appearanceStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasAnyCustomBackgroundImage");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "barStyle");
      -[UIViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_screen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(v11, 0, v13);

    }
  }

  return IsTranslucentOnScreen;
}

- (BOOL)_isNavigationBarVisible
{
  void *v2;
  void *v3;
  int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  if (!-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alpha");
    v8 = v7;
    if (v7 > 0.0
      || (-[UINavigationController topViewController](self, "topViewController"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "navigationItem"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "_navigationBarVisibility") == 2))
    {
      -[UINavigationController navigationBar](self, "navigationBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "isHidden") ^ 1;

      if (v8 > 0.0)
        goto LABEL_9;
    }
    else
    {
      LOBYTE(v5) = 0;
    }

LABEL_9:
    return v5;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (double)_widthForLayout
{
  UILayoutContainerView *containerView;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView bounds](containerView, "bounds");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      -[UIViewController _screen](self, "_screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v5 = v7;

    }
  }
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v10 == 3)
    {
      -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
      v12 = v11;
      -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
      return v5 - (v12 + v13);
    }
  }
  return v5;
}

- (id)_navigationBarHiddenByDefault:(BOOL)a3
{
  UINavigationBar *navigationBar;
  _BOOL8 v5;
  id v6;
  void *v7;

  navigationBar = self->_navigationBar;
  if (!navigationBar)
  {
    v5 = a3;
    v6 = objc_alloc(self->_navigationBarClass);
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v7, "setHidden:", v5);
    -[UINavigationController setNavigationBar:](self, "setNavigationBar:", v7);

    navigationBar = self->_navigationBar;
  }
  return navigationBar;
}

- (UINavigationBar)navigationBar
{
  return (UINavigationBar *)-[UINavigationController _navigationBarHiddenByDefault:](self, "_navigationBarHiddenByDefault:", 0);
}

- (BOOL)_canHostRefreshControlOwnedByScrollView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  v7 = (!_isNestedNavigationControllerFullyInstalledIntoContainingNavigationController(self)
     || (-[UINavigationController _outermostNavigationController](self, "_outermostNavigationController"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v6 = objc_msgSend(v5, "_canHostRefreshControlOwnedByScrollView:", v4),
         v5,
         (v6 & 1) == 0))
    && +[_UINavigationControllerRefreshControlHost canHostRefreshControlOwnedByScrollView:inNavigationController:](_UINavigationControllerRefreshControlHost, "canHostRefreshControlOwnedByScrollView:inNavigationController:", v4, self);

  return v7;
}

- (BOOL)_isNavigationBarEffectivelyVisible
{
  _BOOL4 v3;

  v3 = -[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible");
  if (v3)
    LOBYTE(v3) = (*(_QWORD *)&self->_navigationControllerFlags & 0x2000) == 0;
  return v3;
}

- (double)_contentMarginForView:(id)a3
{
  UINavigationBar *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSMapTable *lastContentMarginForView;
  NSMapTable *v12;
  NSMapTable *v13;
  void *v14;
  objc_super v16;

  v4 = (UINavigationBar *)a3;
  v16.receiver = self;
  v16.super_class = (Class)UINavigationController;
  -[UIViewController _contentMarginForView:](&v16, sel__contentMarginForView_, v4);
  v6 = v5;
  if (self->_navigationBar == v4 || (UINavigationBar *)self->_toolbar == v4)
  {
    if (dyld_program_sdk_at_least())
    {
      -[UINavigationController topViewController](self, "topViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8
        || (-[UINavigationController topViewController](self, "topViewController"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v9, 4, 0),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v8))
      {
        objc_msgSend(v8, "_alignedContentMarginGivenMargin:", v6);
        v6 = v10;
        lastContentMarginForView = self->_lastContentMarginForView;
        if (!lastContentMarginForView)
        {
          v12 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 2);
          v13 = self->_lastContentMarginForView;
          self->_lastContentMarginForView = v12;

          lastContentMarginForView = self->_lastContentMarginForView;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](lastContentMarginForView, "setObject:forKey:", v14, v4);

      }
    }
  }

  return v6;
}

- (id)_nestedTopViewController
{
  void *v2;
  uint64_t v3;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isNestedNavigationController"))
  {
    objc_msgSend(v2, "topViewController");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (UIViewController)topViewController
{
  void *v2;
  void *v3;

  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (int64_t)lastOperation
{
  return *(_QWORD *)&self->_navigationControllerFlags >> 4;
}

- (void)_safeAreaInsetsDidChangeForView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationController;
  -[UIViewController _safeAreaInsetsDidChangeForView](&v3, sel__safeAreaInsetsDidChangeForView);
  -[UIView _eagerlyUpdateSafeAreaInsetsToDescendant:](self->super._view, self->_navigationBar);
  -[UINavigationBar safeAreaInsetsDidChange](self->_navigationBar, "safeAreaInsetsDidChange");
}

- (void)_updateChildContentMargins
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationController;
  -[UIViewController _updateChildContentMargins](&v5, sel__updateChildContentMargins);
  -[UINavigationController _existingNavigationBar](self, "_existingNavigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsDidChange");

  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (NSDirectionalEdgeInsets)_layoutMarginsforNavigationBar:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSDirectionalEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "_contentMargin");
  v6 = v5;
  v7 = v5;
  if (objc_msgSend(v4, "insetsLayoutMarginsFromSafeArea"))
  {
    v8 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
    -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
    if (v8 == 1)
      v11 = v9;
    else
      v11 = v10;
    if (v8 == 1)
      v9 = v10;
    v7 = v6 + v9;
    v6 = v6 + v11;
  }

  v12 = 0.0;
  v13 = 0.0;
  v14 = v7;
  v15 = v6;
  result.trailing = v15;
  result.bottom = v13;
  result.leading = v14;
  result.top = v12;
  return result;
}

uint64_t __55__UINavigationController__navigationBarDidChangeStyle___block_invoke(uint64_t result)
{
  void *v1;

  v1 = *(void **)(result + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(result + 32), "setNeedsStatusBarAppearanceUpdate");
    objc_msgSend(v1, "_setNeedsUserInterfaceAppearanceUpdate");
    return objc_msgSend(v1, "setNeedsWhitePointAdaptivityStyleUpdate");
  }
  return result;
}

uint64_t __54__UINavigationController__unhideNavigationBarForEdge___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1080) && (v3 = objc_msgSend(*(id *)(v2 + 1080), "isAttached"), v2 = *(_QWORD *)(a1 + 32), v3))
  {
    v4 = objc_msgSend(*(id *)(v2 + 1080), "isVisibleWhenPinningBarIsHidden");
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  if ((*(_QWORD *)(v2 + 1224) & 0x4000) == 0)
  {
    objc_msgSend((id)v2, "_positionNavigationBarHidden:edge:", 1, *(_QWORD *)(a1 + 48));
    if (((objc_msgSend(*(id *)(a1 + 32), "_isTransitioningOrPaletteIsTransitioning") | v4) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_positionPaletteHidden:edge:", 1, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (!-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
  {
    -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
    if (bottom != v8)
    {
      -[UINavigationController toolbar](self, "toolbar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "barPosition");
      if (v10 == 4 || v10 == 1)
        objc_msgSend(v9, "setNeedsLayout");

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UINavigationController;
  -[UIViewController _setContentOverlayInsets:](&v11, sel__setContentOverlayInsets_, top, left, bottom, right);
}

- (void)_setDefinesPresentationContextIfNecessaryForViewController:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = dyld_program_sdk_at_least();

    if (v6)
      objc_msgSend(v7, "setDefinesPresentationContext:", 1);
  }
  else
  {

  }
}

- (id)childViewControllerForStatusBarHidden
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4
    || +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton")
    || -[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_isPresentationContextByDefault
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained;
  unint64_t v5;
  objc_super v6;

  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x10000000) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "navigationControllerSupportedInterfaceOrientations:", self);

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UINavigationController;
    return -[UIViewController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t WeakRetained;
  void *v7;
  void *v8;
  char v9;
  objc_super v10;

  v3 = a3;
  if ((+[UIView _uip_transitionEnabled]() & 1) == 0)
    -[UINavigationController _updateBarsForCurrentInterfaceOrientation](self, "_updateBarsForCurrentInterfaceOrientation");
  v10.receiver = self;
  v10.super_class = (Class)UINavigationController;
  -[UIViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
  -[_UIViewControllerTransitionConductor setHostIsAppearingAnimated:](self->_transitionConductor, "setHostIsAppearingAnimated:", 0);
  if (!-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition")
    && (*(_QWORD *)&self->_navigationControllerFlags & 0x4000000000004) == 0)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__viewDidAppear:", v3);

    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      -[UINavigationController delegate](self, "delegate");
      WeakRetained = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)WeakRetained;
    -[UINavigationController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[UINavigationController _ignoreFinishingModalTransitionForFiles](self, "_ignoreFinishingModalTransitionForFiles"))
      {

      }
      else
      {
        v9 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, &__block_literal_global_390);

        if ((v9 & 1) != 0)
        {
LABEL_15:

          return;
        }
      }
      -[UINavigationController topViewController](self, "topViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationController:didShowViewController:animated:", self, v8, v3);
    }

    goto LABEL_15;
  }
}

- (void)_updateBarsForCurrentInterfaceOrientation
{
  -[UINavigationController _updateBarsForCurrentInterfaceOrientationAndForceBarLayout:](self, "_updateBarsForCurrentInterfaceOrientationAndForceBarLayout:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t WeakRetained;
  void *v15;
  void *v16;
  objc_super v17;

  v3 = a3;
  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[UINavigationController topViewController](self, "topViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_existingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isDescendantOfView:", v9);

      if ((v10 & 1) == 0)
      {
        -[UINavigationController setNeedsDeferredTransition](self, "setNeedsDeferredTransition");
        -[UIViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setNeedsLayout");

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  -[UIViewController viewWillAppear:](&v17, sel_viewWillAppear_, v3);
  -[_UIViewControllerTransitionConductor setHostIsAppearingAnimated:](self->_transitionConductor, "setHostIsAppearingAnimated:", v3);
  if (!-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition")
    || (*(_QWORD *)&self->_navigationControllerFlags & 0x1000) != 0)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "__viewWillAppear:", v3);

    -[UINavigationController topViewController](self, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if ((dyld_program_sdk_at_least() & 1) != 0)
      {
        WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
      }
      else
      {
        -[UINavigationController delegate](self, "delegate");
        WeakRetained = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)WeakRetained;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (-[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, &__block_literal_global_376) & 1) == 0)
      {
        -[UINavigationController topViewController](self, "topViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "navigationController:willShowViewController:animated:", self, v16, v3);

      }
    }
  }
}

- (id)_interfaceOrientationWindowForBar:(id)a3 matchingBar:(id)a4
{
  if (a3 == a4)
    -[UINavigationController _window](self, "_window");
  else
    objc_msgSend(a3, "window");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_layoutTopViewControllerLookForNested:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  $16004AA6B36EC19B1B0093A5EF089ED3 *p_navigationControllerFlags;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v3 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  if (v3 && objc_msgSend(v5, "_isNestedNavigationController"))
  {
    objc_msgSend(v14, "topViewController");
    v6 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v6;
  }
  -[UINavigationController disappearingViewController](self, "disappearingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v14 != v7)
  {
    if (-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition")
      || !objc_msgSend(v14, "isViewLoaded")
      || -[UINavigationController isCustomTransition](self, "isCustomTransition"))
    {
      p_navigationControllerFlags = &self->_navigationControllerFlags;
      *(_QWORD *)&self->_navigationControllerFlags |= 0x40000000000000uLL;
      goto LABEL_9;
    }
    if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
    {
      -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isCustomTransition");

      p_navigationControllerFlags = &self->_navigationControllerFlags;
      *(_QWORD *)&self->_navigationControllerFlags |= 0x40000000000000uLL;
      if ((v13 & 1) != 0)
      {
LABEL_9:
        if ((objc_msgSend((id)objc_opt_class(), "_directlySetsContentOverlayInsetsForChildren") & 1) == 0)
        {
          -[UIViewController _updateContentOverlayInsetsFromParentIfNecessary](self, "_updateContentOverlayInsetsFromParentIfNecessary");
          objc_msgSend(v14, "_updateContentOverlayInsetsForSelfAndChildren");
          objc_msgSend(v14, "navigationItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_searchControllerIfAllowed");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 && objc_msgSend(v11, "isActive"))
            objc_msgSend(v11, "_updateContentOverlayInsetsForSelfAndChildren");

        }
        goto LABEL_14;
      }
    }
    else
    {
      p_navigationControllerFlags = &self->_navigationControllerFlags;
      *(_QWORD *)&self->_navigationControllerFlags |= 0x40000000000000uLL;
    }
    -[UINavigationController _layoutViewController:](self, "_layoutViewController:", v14);
LABEL_14:
    *(_QWORD *)p_navigationControllerFlags &= ~0x40000000000000uLL;
    -[UINavigationController _eagerlyUpdateSafeAreaInsets](self, "_eagerlyUpdateSafeAreaInsets");
    v8 = v14;
  }

}

- (UIViewController)disappearingViewController
{
  return self->_disappearingViewController;
}

- (BOOL)needsDeferredTransition
{
  return -[_UIViewControllerTransitionConductor needsDeferredTransition](self->_transitionConductor, "needsDeferredTransition");
}

- (void)_eagerlyUpdateSafeAreaInsets
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  char v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = v6;
    objc_msgSend(v3, "_contentOrObservableScrollViewForEdge:", qword_18667A220[v4]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = v5 == 0;
    else
      v10 = 0;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (!v8)
    {
      goto LABEL_12;
    }
    if ((objc_msgSend(v9, "_safeAreaInsetsFrozen") & 1) == 0 && (objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
      objc_msgSend(v5, "addObject:", v9);
LABEL_12:

    v6 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);
  objc_msgSend(v3, "_existingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v5 && v11)
  {
    if ((objc_msgSend(v11, "_safeAreaInsetsFrozen") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v12, "subviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v12, "subviews");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v14, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  objc_msgSend(v3, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_searchControllerIfAllowed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "_currentActiveChildViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "contentScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || (objc_msgSend(v18, "_existingView"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((objc_msgSend(v19, "_safeAreaInsetsFrozen") & 1) == 0)
      {
        if (!v5)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v5, "addObject:", v19);
      }
    }

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v5;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[UIViewController _eagerlyUpdateSafeAreaInsetsToViewDescendant:](self, "_eagerlyUpdateSafeAreaInsetsToViewDescendant:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

}

- (BOOL)isCustomTransition
{
  return (~*(_DWORD *)&self->_navigationControllerFlags & 0x10004) == 0;
}

- (void)_layoutViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
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
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  BOOL v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v50 = a3;
  objc_msgSend(v50, "loadViewIfRequired");
  if ((objc_msgSend((id)objc_opt_class(), "_directlySetsContentOverlayInsetsForChildren") & 1) == 0)
  {
    -[UIViewController _updateContentOverlayInsetsFromParentIfNecessary](self, "_updateContentOverlayInsetsFromParentIfNecessary");
    objc_msgSend(v50, "_updateContentOverlayInsetsForSelfAndChildren");
    -[UINavigationController topViewController](self, "topViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 == v50)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_searchControllerIfAllowed");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && objc_msgSend(v7, "isActive"))
        objc_msgSend(v7, "_updateContentOverlayInsetsForSelfAndChildren");

    }
  }
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v50, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:](self, "_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:", v8);

  -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v50);
  objc_msgSend(v50, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_22:
    v14 = v50;
    goto LABEL_23;
  }
  objc_msgSend(v50, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController navigationTransitionView](self, "navigationTransitionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isDescendantOfView:", v12);

  v14 = v50;
  if (v13)
  {
    -[UINavigationController _frameForViewController:](self, "_frameForViewController:", v50);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[UINavigationController _frameForWrapperViewForViewController:](self, "_frameForWrapperViewForViewController:", v50);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    objc_msgSend(v50, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "superview");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frame");
    v53.origin.x = v33;
    v53.origin.y = v34;
    v53.size.width = v35;
    v53.size.height = v36;
    v51.origin.x = v24;
    v51.origin.y = v26;
    v51.size.width = v28;
    v51.size.height = v30;
    v37 = CGRectEqualToRect(v51, v53);

    if (!v37)
    {
      objc_msgSend(v50, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "superview");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFrame:", v24, v26, v28, v30);

    }
    objc_msgSend(v50, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v54.origin.x = v41;
    v54.origin.y = v42;
    v54.size.width = v43;
    v54.size.height = v44;
    v52.origin.x = v16;
    v52.origin.y = v18;
    v52.size.width = v20;
    v52.size.height = v22;
    v45 = CGRectEqualToRect(v52, v54);

    if (v45)
    {
      v46 = !v37;
    }
    else
    {
      objc_msgSend(v50, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setFrame:", v16, v18, v20, v22);

      v46 = 1;
    }
    if (!-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
      -[UINavigationController _positionToolbarHidden:](self, "_positionToolbarHidden:", 0);
    v14 = v50;
    if ((v46 & 1) != 0)
      goto LABEL_21;
    objc_msgSend(v50, "_topBarInsetGuideConstraint");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {

      v14 = v50;
LABEL_21:
      objc_msgSend(v14, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutIfNeeded");
      goto LABEL_22;
    }
    objc_msgSend(v50, "_bottomBarInsetGuideConstraint");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v50;
    if (v49)
      goto LABEL_21;
  }
LABEL_23:

}

- (void)_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:(id)a3
{
  void *v4;
  void *v5;
  _UINavigationControllerRefreshControlHost *v6;
  _UINavigationControllerRefreshControlHost *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[UINavigationController _shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary](self, "_shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary"))
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshControlHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5;
    v7 = v6;
    if (!-[_UINavigationControllerRefreshControlHost isHostingRefreshControlOwnedByScrollView:](v6, "isHostingRefreshControlOwnedByScrollView:", v9))
    {
      if (-[UINavigationController _canHostRefreshControlOwnedByScrollView:](self, "_canHostRefreshControlOwnedByScrollView:", v9))
      {
        v7 = -[_UINavigationControllerRefreshControlHost initWithNavigationController:scrollView:]([_UINavigationControllerRefreshControlHost alloc], "initWithNavigationController:scrollView:", self, v9);
      }
      else
      {
        v7 = 0;
      }

    }
    -[UINavigationController navigationBar](self, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRefreshControlHost:", v7);

  }
}

- (BOOL)_shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary
{
  void *v3;
  uint64_t navigationControllerFlags;
  char v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  -[UINavigationController _updateNavigationBarHandler](self, "_updateNavigationBarHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x80000000000000) == 0)
    {
      v5 = *((_BYTE *)&self->_navigationControllerFlags + 8);
      *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags | 0x80000000000000;
      *((_BYTE *)&self->_navigationControllerFlags + 8) = v5;
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __98__UINavigationController__shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary__block_invoke;
      v7[3] = &unk_1E16C08D8;
      v8 = v3;
      objc_copyWeak(&v9, &location);
      -[UINavigationController _setUpdateNavigationBarHandler:](self, "_setUpdateNavigationBarHandler:", v7);
      objc_destroyWeak(&v9);

      objc_destroyWeak(&location);
    }
  }

  return v3 != 0;
}

- (id)_updateNavigationBarHandler
{
  return self->__updateNavigationBarHandler;
}

- (CGRect)_frameForWrapperViewForViewController:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UINavigationController navigationTransitionView](self, "navigationTransitionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3
{
  return -[UIViewController _contentOrObservableScrollViewInContainerForEdge:](self, a3);
}

- (double)_scrollViewTopContentInsetForViewController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_hasTranslucentNavigationBarIncludingViewController:", v4) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "extendedLayoutIncludesOpaqueBars");

  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isNavigationBarVisible");

  -[UINavigationController _calculateTopLayoutInfoForViewController:](self, "_calculateTopLayoutInfoForViewController:", v4, 0, 0);
  v9 = v8 ^ 1;
  if ((v6 & 1) != 0 || v9)
  {
    objc_msgSend(v4, "searchDisplayController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hidNavigationBar");

    -[UINavigationController _window](self, "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") || v11)
    {
      __UIStatusBarManagerForWindow(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "isStatusBarHidden");

    }
  }

  return 0.0;
}

- (id)_window
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UINavigationController;
  -[UIViewController _window](&v8, sel__window);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UINavigationController _temporaryWindowLocator](self, "_temporaryWindowLocator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_window");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (UIViewController)_temporaryWindowLocator
{
  return self->__temporaryWindowLocator;
}

- (void)_positionNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4 initialOffset:(double)a5
{
  _BOOL8 v7;
  UILayoutContainerView *containerView;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MidX;
  double MinY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  _UINavigationControllerPalette *topPalette;
  _BOOL4 v31;
  double v32;
  _UINavigationControllerPalette *v33;
  double v34;
  id v35;
  double v36;
  double v37;
  unint64_t v38;
  double v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  CGRect v44;
  CGRect v45;

  v7 = a3;
  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView bounds](containerView, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  MidX = CGRectGetMidX(v44);
  v45.origin.x = v11;
  v45.origin.y = v13;
  v45.size.width = v15;
  v45.size.height = v17;
  MinY = CGRectGetMinY(v45);
  -[UINavigationController navigationBar](self, "navigationBar");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  v21 = v20;
  v23 = v22;
  -[UINavigationController _widthForLayout](self, "_widthForLayout");
  v25 = v24;
  -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _preferredHeightForHidingNavigationBarForViewController:topItem:](self, "_preferredHeightForHidingNavigationBarForViewController:topItem:", v26, v27);
  v29 = v28;

  objc_msgSend(v41, "setBounds:", v21, v23, v25, v29);
  topPalette = self->_topPalette;
  if (topPalette)
  {
    if (-[_UINavigationControllerPalette isAttached](topPalette, "isAttached"))
    {
      if (-[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](self->_topPalette, "isVisibleWhenPinningBarIsHidden"))
      {
        if ((*(_QWORD *)&self->_navigationControllerFlags & 1) != 0)
        {
          v31 = -[_UINavigationControllerPalette _isPalettePinningBarHidden](self->_topPalette, "_isPalettePinningBarHidden");
          if (v7 && v31 && (a4 == 4 || a4 == 1))
          {
            objc_msgSend(v41, "frame");
            objc_msgSend(v41, "setFrame:", 0.0, -v32);
            goto LABEL_29;
          }
        }
      }
    }
    v33 = self->_topPalette;
    v34 = v29 * 0.5 + a5;
    if (v33)
    {
      v35 = v41;
      if (a4 != 4 && a4 != 1 || !v7)
        goto LABEL_23;
      if (-[_UINavigationControllerPalette isAttached](v33, "isAttached"))
      {
        -[UIView bounds](self->_topPalette, "bounds");
        v37 = v36;
        v38 = -[_UINavigationControllerPalette boundaryEdge](self->_topPalette, "boundaryEdge");
        v39 = -v37;
        if (v38 == 5)
          v39 = v37;
        v34 = v34 + v39;
      }
    }
  }
  else
  {
    v34 = v29 * 0.5 + a5;
  }
  v35 = v41;
LABEL_23:
  -[UINavigationController _positionNavigationBar:hidden:edge:center:offset:](self, "_positionNavigationBar:hidden:edge:center:offset:", v35, v7, a4, MidX, MinY, v34);
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v41, "window");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
      objc_msgSend(v41, "layoutBelowIfNeeded");
  }
  else
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __74__UINavigationController__positionNavigationBarHidden_edge_initialOffset___block_invoke;
    v42[3] = &unk_1E16B1B28;
    v43 = v41;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v42);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UINavigationControllerVisualStyle navigationBarFrameChanged](self->_visualStyle, "navigationBarFrameChanged");
LABEL_29:

}

- (void)_positionNavigationBar:(id)a3 hidden:(BOOL)a4 edge:(unint64_t)a5 center:(CGPoint)a6 offset:(double)a7
{
  double y;
  double x;
  _BOOL4 v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  y = a6.y;
  x = a6.x;
  v11 = a4;
  v18 = a3;
  -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", x, y, a7);
  v14 = v13;
  v16 = v15;
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x100000000) != 0
    && v11
    && (a5 == 4 || a5 == 1)
    && !-[UINavigationController _useStandardStatusBarHeight](self, "_useStandardStatusBarHeight")
    && -[UINavigationController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar"))
  {
    -[UINavigationController _statusBarHeightAdjustmentForCurrentOrientation](self, "_statusBarHeightAdjustmentForCurrentOrientation");
    v16 = v16 - v17;
  }
  objc_msgSend(v18, "setCenter:", v14, v16);

}

- (CGPoint)_computeTopBarCenter:(id)a3 hidden:(BOOL)a4 edge:(unint64_t)a5 center:(CGPoint)a6 offset:(double)a7
{
  double y;
  double x;
  _BOOL4 v11;
  id v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  int v19;
  int v20;
  UINavigationController *v21;
  UINavigationController *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  int64_t preferredNavigationBarPosition;
  double statusBarHeightForHideShow;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  char v44;
  double v45;
  double v46;
  double builtinTransitionGap;
  double v48;
  double v49;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v11 = a4;
  v13 = a3;
  v14 = (*(_QWORD *)&self->_navigationControllerFlags & 0x2000) == 0 && v11;
  if (-[UINavigationController _searchHidNavigationBar](self, "_searchHidNavigationBar"))
  {
    v15 = 1;
  }
  else
  {
    -[UINavigationController topViewController](self, "topViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchDisplayController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "hidNavigationBar");

  }
  v18 = y + a7;
  v19 = !v14;
  if (a5 > 1)
    v19 = 1;
  v20 = v19 | v15;
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    if ((v20 & 1) != 0 || self->__preferredNavigationBarPosition == 3)
    {
      v21 = self;
      v22 = v21;
      if (self->__positionBarsExclusivelyWithSafeArea
        && (-[UIViewController _existingView](v21, "_existingView"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v24 = objc_msgSend(v23, "_usesMinimumSafeAreas"),
            v23,
            v24))
      {
        -[UIViewController _existingView](v22, "_existingView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_minimumSafeAreaInsets");
        v27 = v26;

      }
      else
      {
        -[UIViewController _contentOverlayInsets](v22, "_contentOverlayInsets");
        v27 = v30;
      }

      v18 = v18 + v27;
    }
    -[UINavigationController navigationBar](self, "navigationBar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "userInterfaceIdiom");

    if (v33 == 3)
    {
      -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
      v35 = v34 * 0.5;
      -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
      x = x + v35 - v36 * 0.5;
    }
  }
  else
  {
    preferredNavigationBarPosition = self->__preferredNavigationBarPosition;
    if (preferredNavigationBarPosition == 3)
    {
      -[UIViewController _existingView](self, "_existingView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "window");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      __UIStatusBarManagerForWindow(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "windowScene");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "defaultStatusBarHeightInOrientation:", objc_msgSend(v40, "interfaceOrientation"));
      v42 = v41;

      v18 = v18 + v42;
    }
    else if (!preferredNavigationBarPosition
           && (-[UINavigationController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar") & v20) == 1)
    {
      if (-[UINavigationController _useStandardStatusBarHeight](self, "_useStandardStatusBarHeight"))
        statusBarHeightForHideShow = self->_statusBarHeightForHideShow;
      else
        -[UINavigationController _statusBarHeightAdjustmentForCurrentOrientation](self, "_statusBarHeightAdjustmentForCurrentOrientation");
      v18 = v18 + statusBarHeightForHideShow;
    }
  }
  if (-[_UINavigationControllerPalette boundaryEdge](self->_topPalette, "boundaryEdge") == 5)
  {
    -[UIView frame](self->_topPalette, "frame");
    v18 = v18 + v43;
  }
  v44 = !v14;
  if (!a5)
    v44 = 1;
  if ((v44 & 1) == 0)
  {
    objc_msgSend(v13, "bounds");
    builtinTransitionGap = 0.0;
    if (self->_builtinTransitionStyle == 1)
      builtinTransitionGap = self->_builtinTransitionGap;
    if (a5 == 8)
    {
      x = x + v45 + builtinTransitionGap;
    }
    else if (a5 == 2)
    {
      x = x - (v45 + builtinTransitionGap);
    }
    else
    {
      v18 = v18 - v46;
    }
  }

  v48 = x;
  v49 = v18;
  result.y = v49;
  result.x = v48;
  return result;
}

- (BOOL)_searchHidNavigationBar
{
  UINavigationController *v3;
  UINavigationController *v4;
  uint64_t v5;

  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v3 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self)
    v5 = (*(_QWORD *)&self->_navigationControllerFlags >> 47) & 1;
  else
    LOBYTE(v5) = -[UINavigationController _searchHidNavigationBar](v3, "_searchHidNavigationBar");

  return v5;
}

- (UIEdgeInsets)_calculateEdgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  char v11;
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
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  char v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  UIEdgeInsets result;

  v6 = a3;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "_calculateTopLayoutInfoForViewController:", v6);
    v9 = *(double *)&v33;
  }
  else
  {
    v9 = 0.0;
  }
  objc_msgSend(v8, "_existingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "_usesMinimumSafeAreas"))
    goto LABEL_8;
  v11 = objc_msgSend(v8, "isNavigationBarHidden");

  if ((v11 & 1) != 0)
    goto LABEL_9;
  v12 = objc_msgSend(v8, "_positionBarsExclusivelyWithSafeArea");
  objc_msgSend(v8, "_contentOverlayInsets");
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v8, "_existingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_minimumSafeAreaInsets");
    v9 = v9 - (v14 - v15);
LABEL_8:

    goto LABEL_9;
  }
  v32.receiver = self;
  v32.super_class = (Class)UINavigationController;
  -[UIViewController _statusBarHeightAdjustmentForCurrentOrientation](&v32, sel__statusBarHeightAdjustmentForCurrentOrientation);
  v9 = v9 - (v14 - v30);
LABEL_9:
  v16 = 0.0;
  if (v9 == 0.0)
  {
    v17 = 0.0;
    v18 = 0.0;
    if (objc_msgSend(v8, "_searchHidNavigationBar"))
    {
      -[UINavigationController _edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController:](self, "_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController:", v6);
      v9 = v19;
      v18 = v20;
      v17 = v21;
      v16 = v22;
    }
  }
  else
  {
    v17 = 0.0;
    v18 = 0.0;
  }
  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v31 = 0;
    -[UINavigationController _shouldToolBar:insetViewController:orOverlayContent:](self, "_shouldToolBar:insetViewController:orOverlayContent:", v23, v6, &v31);
    if (v31)
    {
      -[UINavigationController toolbar](self, "toolbar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v17 = v25;

    }
  }
  *a4 = 0;

  v26 = v9;
  v27 = v18;
  v28 = v17;
  v29 = v16;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (double)_statusBarHeightAdjustmentForCurrentOrientation
{
  UINavigationController *v3;
  UINavigationController *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    v3 = self;
    v4 = v3;
    if (self->__positionBarsExclusivelyWithSafeArea
      && (-[UIViewController _existingView](v3, "_existingView"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "_usesMinimumSafeAreas"),
          v5,
          v6))
    {
      -[UIViewController _existingView](v4, "_existingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_minimumSafeAreaInsets");
      v9 = v8;

    }
    else
    {
      -[UIViewController _contentOverlayInsets](v4, "_contentOverlayInsets");
      v9 = v10;
    }

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    -[UIViewController _statusBarHeightAdjustmentForCurrentOrientation](&v13, sel__statusBarHeightAdjustmentForCurrentOrientation);
    return v11;
  }
  return v9;
}

- (BOOL)_positionBarsExclusivelyWithSafeArea
{
  return self->__positionBarsExclusivelyWithSafeArea;
}

- (void)setDisappearingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_disappearingViewController, a3);
}

- (void)_clearLastOperation
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(result, "_isPerformingLayoutToLayoutTransition") & 1) == 0)
    {
      v2 = (void *)*((_QWORD *)v1 + 127);
      if (v2)
      {
        objc_msgSend(v2, "_contentOrObservableScrollViewForEdge:", 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "topViewController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_contentOrObservableScrollViewForEdge:", 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3 != v5)
          objc_msgSend(v1, "_stopObservingContentScrollViewsForViewController:", *((_QWORD *)v1 + 127));
      }
    }
    *((_QWORD *)v1 + 153) &= 0xFFFCFFFFFFFFFE0FLL;
    objc_msgSend(*((id *)v1 + 159), "setDeferredTransitionType:", 0);
    return (void *)objc_msgSend(v1, "setDisappearingViewController:", 0);
  }
  return result;
}

- (BOOL)_isPerformingLayoutToLayoutTransition
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  -[UINavigationController disappearingViewController](self, "disappearingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UINavigationController lastOperation](self, "lastOperation");
  objc_msgSend(v4, "_uiCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_uiCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 1)
    v8 = v4;
  else
    v8 = v3;
  v9 = objc_msgSend(v8, "_usesSharedView");
  if (v6 == v7)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  -[UINavigationController _updateBarsForCurrentInterfaceOrientationAndForceBarLayout:](self, "_updateBarsForCurrentInterfaceOrientationAndForceBarLayout:", 1);
}

- (void)setInteractiveTransition:(BOOL)a3
{
  -[_UIViewControllerTransitionConductor setInteractiveTransition:](self->_transitionConductor, "setInteractiveTransition:", a3);
}

- (void)_initializeNavigationDeferredTransitionContextIfNecessary
{
  UINavigationDeferredTransitionContext *v3;
  UINavigationDeferredTransitionContext *deferredTransitionContext;

  if (-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition"))
  {
    if (!self->_deferredTransitionContext)
    {
      v3 = (UINavigationDeferredTransitionContext *)objc_opt_new();
      deferredTransitionContext = self->_deferredTransitionContext;
      self->_deferredTransitionContext = v3;

    }
  }
}

- (BOOL)_useStandardStatusBarHeight
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 37) & 1;
}

- (void)_stopObservingContentScrollViewsForViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "_contentOrObservableScrollViewForEdge:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v5);

  objc_msgSend(v4, "_contentOrObservableScrollViewForEdge:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v6);
}

- (void)_updateBarsForCurrentInterfaceOrientationAndForceBarLayout:(BOOL)a3
{
  void *v5;
  char isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets;
  void *v7;
  void *v8;
  _UINavigationControllerPalette *topPalette;

  -[UINavigationController _setInteractiveScrollActive:](self, "_setInteractiveScrollActive:", 0);
  if (a3
    || (-[UINavigationController topViewController](self, "topViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v5), v5, (isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets & 1) == 0))
  {
    -[UINavigationController _positionNavigationBarHidden:](self, "_positionNavigationBarHidden:", *(_DWORD *)&self->_navigationControllerFlags & 1);
    -[UINavigationController _repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:](self, "_repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:", *(_DWORD *)&self->_navigationControllerFlags & 1, 0, 0.0);
  }
  -[UINavigationController _setInteractiveScrollActive:](self, "_setInteractiveScrollActive:", self->_interactiveScrollActive);
  -[UINavigationController _positionToolbarHidden:](self, "_positionToolbarHidden:", -[UINavigationController isToolbarHidden](self, "isToolbarHidden"));
  -[UINavigationController _layoutTopViewController](self, "_layoutTopViewController");
  -[UINavigationController topViewController](self, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v7);

  -[UINavigationController topViewController](self, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _updateTopViewFramesForViewController:isCancelledTransition:isOrientationChange:](self, "_updateTopViewFramesForViewController:isCancelledTransition:isOrientationChange:", v8, 0, 1);

  topPalette = self->_topPalette;
  if (topPalette)
  {
    if ((*(_QWORD *)&self->_navigationControllerFlags & 1) != 0)
    {
      -[_UINavigationControllerPalette _updateLayoutForCurrentConfiguration](topPalette, "_updateLayoutForCurrentConfiguration");
      -[UINavigationController _repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:](self, "_repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:", *(_DWORD *)&self->_navigationControllerFlags & 1, 0, 0.0);
    }
  }
}

- (void)_updateTopViewFramesForViewController:(id)a3 isCancelledTransition:(BOOL)a4 isOrientationChange:(BOOL)a5
{
  void *v8;
  UINavigationController *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  _BOOL8 v14;
  id v15;

  v15 = a3;
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v15, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v9, v15, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v11 = 5;
  }
  else if (-[UINavigationController _isPushing](v9, "_isPushing"))
  {
    v11 = 2;
  }
  else
  {
    v12 = -[UINavigationController _isPopping](v9, "_isPopping");
    v13 = 3;
    if (!v12)
      v13 = 4;
    v14 = v10 != 0;
    if (a5)
      v14 = v13;
    if (v12)
      v11 = v13;
    else
      v11 = v14;
  }

  -[UINavigationController _updateTopViewFramesToMatchScrollOffsetInViewController:contentScrollView:topLayoutType:](v9, "_updateTopViewFramesToMatchScrollOffsetInViewController:contentScrollView:topLayoutType:", v15, v8, v11);
}

- (void)_updateTopViewFramesToMatchScrollOffsetInViewController:(id)a3 contentScrollView:(id)a4 topLayoutType:(int64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v8 = a3;
  v9 = a4;
  if (-[UINavigationController _canUpdateTopViewFramesToMatchScrollView](self, "_canUpdateTopViewFramesToMatchScrollView"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UINavigationController _calculateTopViewFramesForLayoutWithViewController:contentScrollView:navBarFrame:topPaletteFrame:topLayoutType:](self, "_calculateTopViewFramesForLayoutWithViewController:contentScrollView:navBarFrame:topPaletteFrame:topLayoutType:", v8, v9, &v17, &v15, a5);
    objc_msgSend(v9, "setProgrammaticScrollEnabled:", !self->_interactiveScrollActive);
    v10[1] = 3221225472;
    v11 = v17;
    v12 = v18;
    v13 = v15;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[2] = __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke;
    v10[3] = &unk_1E16B5328;
    v10[4] = self;
    v14 = v16;
    -[UINavigationController _performTopViewGeometryUpdates:](self, "_performTopViewGeometryUpdates:", v10);
    objc_msgSend(v9, "setProgrammaticScrollEnabled:", 1);
  }

}

- (BOOL)_canUpdateTopViewFramesToMatchScrollView
{
  return self->_updateTopViewFramesToMatchScrollOffsetDisabledCount <= 0
      && self->_navigationBar
      && (*(_QWORD *)&self->_navigationControllerFlags & 1) == 0;
}

- (void)_computeAndApplyScrollContentInsetDeltaForViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UINavigationController *v8;
  _QWORD v9[4];
  id v10;
  UINavigationController *v11;
  id v12;

  v4 = a3;
  -[UINavigationController _resetScrollViewObservingForViewController:](self, "_resetScrollViewObservingForViewController:", v4);
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1000000000) == 0)
  {
    if (!v5 || -[UINavigationController _isPushingOrPopping](self, "_isPushingOrPopping"))
      -[UINavigationController _updateTopViewFramesForViewController:](self, "_updateTopViewFramesForViewController:", v4);
    objc_msgSend(v6, "_viewControllerForAncestor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationController");
    v8 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

    if (v8 != self)
      -[UINavigationController _layoutTopViewController](v8, "_layoutTopViewController");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke;
    v9[3] = &unk_1E16B47A8;
    v10 = v6;
    v11 = self;
    v12 = v4;
    -[UINavigationController _performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:](self, "_performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:", v9);

  }
}

- (void)_resetScrollViewObservingForViewController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
    v6 = 5;
  else
    v6 = 1;
  -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v4, v8, v6);
  if (v5 != v4)
  {
    -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v5, v8, 4);
    if (!v5)
    {
      objc_msgSend(v8, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:](self, "_updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:", v4, v7, 1);

    }
  }

}

- (void)_performTopViewGeometryUpdates:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__UINavigationController__performTopViewGeometryUpdates___block_invoke;
  v6[3] = &unk_1E16B1D18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UINavigationController _performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:](self, "_performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:", v6);

}

- (void)_performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:(id)a3
{
  ++self->_updateTopViewFramesToMatchScrollOffsetDisabledCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_updateTopViewFramesToMatchScrollOffsetDisabledCount;
}

void *__57__UINavigationController__performTopViewGeometryUpdates___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *result;
  double v16;
  double v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "frame");
  v3 = v2;
  v5 = v4;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  if (v6)
  {
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "frame");
  v12 = v11;
  v14 = v13;
  result = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  if (result)
  {
    result = (void *)objc_msgSend(result, "frame");
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (v3 != v12 || v5 != v14 || v8 != v16 || v10 != v17)
    return (void *)objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
  return result;
}

uint64_t __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 976);
  if (v3)
  {
    objc_msgSend(v3, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(_QWORD *)(v2 + 1080);
  if (result)
  {
    result = objc_msgSend((id)result, "_attachmentIsChanging");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  return result;
}

void __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v14[4];
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (a1[4])
  {
    objc_msgSend(a1[5], "_expectedContentInsetDeltaForViewController:", a1[6]);
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    if (!objc_msgSend(a1[5], "_isTransitioning"))
      goto LABEL_5;
    objc_msgSend(a1[4], "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBarManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isInStatusBarFadeAnimation");

    if (v13)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke_2;
      v14[3] = &unk_1E16B20D8;
      v15 = a1[6];
      v16 = v3;
      v17 = v5;
      v18 = v7;
      v19 = v9;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);

    }
    else
    {
LABEL_5:
      if (objc_msgSend(a1[5], "_appearState") != 3)
      {
        if (objc_msgSend(a1[5], "_appearState"))
          objc_msgSend(a1[6], "_setNavigationControllerContentInsetAdjustment:", v3, v5, v7, v9);
      }
    }
  }
}

- (void)_layoutTopViewController
{
  -[UINavigationController _layoutTopViewControllerLookForNested:](self, "_layoutTopViewControllerLookForNested:", 0);
}

- (BOOL)_isPushingOrPopping
{
  return -[UINavigationController _isPushing](self, "_isPushing")
      || -[UINavigationController _isPopping](self, "_isPopping");
}

- (void)_updateTopViewFramesForViewController:(id)a3
{
  -[UINavigationController _updateTopViewFramesForViewController:isCancelledTransition:isOrientationChange:](self, "_updateTopViewFramesForViewController:isCancelledTransition:isOrientationChange:", a3, 0, 0);
}

- (void)_observeScrollViewDidScroll:(id)a3 topLayoutType:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double Height;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t navigationControllerFlags;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  v25 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UINavigationController topViewController](self, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = _UIBarsApplyChromelessEverywhere();
  v10 = v25;
  if (v9)
  {
    -[UINavigationBar _stack](self->_navigationBar, "_stack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topEntry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v25;
    if (v6 == v25 && (*(_QWORD *)&self->_navigationControllerFlags & 0x1000000000000000) != 0)
    {
      if (!-[_UINavigationBarLayout isVariableHeight]((_BOOL8)v13)
        || (v15 = -[_UINavigationBarLayout layoutHeights]((uint64_t)v13),
            -[UIView bounds](self->_navigationBar, "bounds"),
            Height = CGRectGetHeight(v26),
            v14 = v25,
            vabdd_f64(v15, Height) < 0.00000011920929))
      {
        -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "navigationItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController _updateManualScrollEdgeAppearanceProgressForScrollView:navigationItem:](self, "_updateManualScrollEdgeAppearanceProgressForScrollView:navigationItem:", v25, v18);

        v14 = v25;
      }
    }
    if (v8 == v14)
    {
      -[UINavigationController _existingActiveVisibleToolbar](self, "_existingActiveVisibleToolbar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _updateBackgroundTransitionProgressForScrollView:toolbar:](self, "_updateBackgroundTransitionProgressForScrollView:toolbar:", v25, v19);

    }
    v10 = v25;
  }
  v20 = v10;
  if (v6 == v10)
  {
    navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x200000000000000) != 0)
    {
      -[UINavigationController _updateLayoutForScrollView:topLayoutType:](self, "_updateLayoutForScrollView:topLayoutType:", v25, 1);
      v20 = v25;
      if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1000000000000000) != 0)
      {
        -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else if ((navigationControllerFlags & 0x1000000000000000) == 0
           && (navigationControllerFlags & 0xC00000000000000) != 0)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v23 = v22;
      objc_msgSend(v22, "navigationItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _updateManualScrollEdgeAppearanceProgressForScrollView:navigationItem:](self, "_updateManualScrollEdgeAppearanceProgressForScrollView:navigationItem:", v25, v24);

      v20 = v25;
    }
  }

}

- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4 forEdges:(unint64_t)a5
{
  id v8;
  id v9;
  UINavigationController *v10;
  void *v11;
  _BOOL8 v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  UINavigationBar *navigationBar;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint8_t v30[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v10 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  if (v8 && v10 != self)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "Internal UIKit problem. A nested navigation controller is being asked to observe a scrollView.", buf, 2u);
      }

    }
    else
    {
      v27 = _updateAndObserveScrollView_viewController_forEdges____s_category;
      if (!_updateAndObserveScrollView_viewController_forEdges____s_category)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&_updateAndObserveScrollView_viewController_forEdges____s_category);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Internal UIKit problem. A nested navigation controller is being asked to observe a scrollView.", v30, 2u);
      }
    }
  }
  objc_msgSend(v9, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:](self, "_updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:", v8, v11, a5);

  if (v8)
  {
    v12 = -[UINavigationController _navigationControllerShouldObserveScrollView](self, "_navigationControllerShouldObserveScrollView");
    v13 = objc_msgSend(v8, "_isScrollViewScrollObserver:", self);
    if ((a5 & 1) == 0)
    {
      if ((a5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_24;
    }
    if (v12)
    {
      v16 = (*(_QWORD *)&self->_navigationControllerFlags >> 57) & 1;
      objc_msgSend(v8, "_setTopScrollIndicatorFollowsContentOffset:", v16);
      if ((v16 & 1) != 0)
      {
        v17 = -[UINavigationBar _scrollEdgeAppearanceHasChromelessBehavior](self->_navigationBar, "_scrollEdgeAppearanceHasChromelessBehavior");
        objc_msgSend(v8, "_setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:", v17);
        if (v17)
        {
          navigationBar = self->_navigationBar;
          -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "navigationItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UINavigationController _widthForLayout](self, "_widthForLayout");
          -[UINavigationBar _layoutHeightsForNavigationItem:fittingWidth:](navigationBar, "_layoutHeightsForNavigationItem:fittingWidth:", v20);
          v22 = v21;

          -[UIView safeAreaInsets](self->super._view, "safeAreaInsets");
          v24 = v22 + v23;
        }
        else
        {
          v24 = 0.0;
        }
        v25 = 1;
LABEL_23:
        objc_msgSend(v8, "_setAlternativeVerticalScrollIndicatorTopSafeAreaInset:", v24);
        objc_msgSend(v8, "_setShouldAdjustLayoutToCollapseTopSpacing:", v25 | v12 & -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));
        objc_msgSend(v8, "_setShouldAdjustLayoutToDrawTopSeparator:", v12);
        if ((a5 & 4) == 0)
        {
LABEL_6:
          if (v12)
          {
LABEL_7:
            if ((v13 & 1) == 0)
              objc_msgSend(v8, "_addScrollViewScrollObserver:", self);
            -[UINavigationController _observeScrollViewDidScroll:topLayoutType:](self, "_observeScrollViewDidScroll:topLayoutType:", v8, -[UINavigationController _topLayoutTypeForViewController:](self, "_topLayoutTypeForViewController:", v9));
            goto LABEL_29;
          }
          goto LABEL_27;
        }
LABEL_24:
        -[UINavigationController _existingActiveVisibleToolbar](self, "_existingActiveVisibleToolbar");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          -[UIViewController _tabBarControllerEnforcingClass:](self, "_tabBarControllerEnforcingClass:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_navigationController:didUpdateAndObserveScrollView:forEdges:", self, v8, a5);
        }

        if (v12)
          goto LABEL_7;
LABEL_27:
        if (v13)
          -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v8);
        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(v8, "_setTopScrollIndicatorFollowsContentOffset:", 0);
    }
    objc_msgSend(v8, "_setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:", 0);
    v25 = 0;
    v24 = 0.0;
    goto LABEL_23;
  }
  if (!-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
  {
    -[UINavigationController _existingActiveVisibleToolbar](self, "_existingActiveVisibleToolbar");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if ((a5 & 4) != 0 && v14)
      -[UINavigationController _updateBackgroundTransitionProgressForScrollView:toolbar:](self, "_updateBackgroundTransitionProgressForScrollView:toolbar:", 0, v14);

  }
LABEL_29:

}

- (id)_existingActiveVisibleToolbar
{
  UIToolbar *toolbar;
  UIToolbar *v4;
  void *v5;
  uint64_t v6;

  if (-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
    toolbar = 0;
  else
    toolbar = self->_toolbar;
  v4 = toolbar;
  if (-[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_isNavigationController"))
    {
      if ((objc_msgSend(v5, "isToolbarHidden") & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(v5, "_existingToolbar");
        v6 = objc_claimAutoreleasedReturnValue();
      }

      v4 = (UIToolbar *)v6;
    }

  }
  return v4;
}

- (BOOL)isToolbarHidden
{
  return (*(_QWORD *)&self->_navigationControllerFlags & 2) == 0;
}

- (BOOL)_allowNestedNavigationControllers
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 41) & 1;
}

- (void)_updateScrollViewObservationFlagsForScrollView:(id)a3 navigationItem:(id)a4 forEdges:(unint64_t)a5
{
  char v5;
  id v8;
  unint64_t navigationControllerFlags;
  char v10;
  int isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  double v15;
  BOOL v16;
  char v17;
  id v18;

  v5 = a5;
  v18 = a3;
  v8 = a4;
  if (v18
    && (!-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden")
     || -[UINavigationController _hasPotentiallyChromelessBottomBar](self, "_hasPotentiallyChromelessBottomBar"))
    && !-[UINavigationController _otherExpectedNavigationControllerObservesScrollView:](self, "_otherExpectedNavigationControllerObservesScrollView:", v18))
  {
    if ((v5 & 1) != 0)
    {
      isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets = _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v18);
      v12 = 0x200000000000000;
      if (!isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets)
        v12 = 0;
      *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFDFFFFFFFFFFFFFFLL | v12;
      v13 = -[UINavigationBar _forceScrollEdgeAppearance](self->_navigationBar, "_forceScrollEdgeAppearance");
      v14 = 0x400000000000000;
      if (!v13)
        v14 = 0;
      *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFBFFFFFFFFFFFFFFLL | v14;
      if (v8 && objc_msgSend(v8, "_isManualScrollEdgeAppearanceEnabled"))
      {
        objc_msgSend(v8, "_autoScrollEdgeTransitionDistance");
        v16 = v15 > 0.0;
      }
      else
      {
        v16 = 0;
      }
      *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xF7FFFFFFFFFFFFFFLL | ((unint64_t)v16 << 59);
    }
    else if ((v5 & 4) == 0)
    {
      goto LABEL_26;
    }
    if (_UIBarsApplyChromelessEverywhere())
      v17 = objc_msgSend(v8, "_isManualScrollEdgeAppearanceEnabled") ^ 1;
    else
      v17 = 0;
    *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xEFFFFFFFFFFFFFFFLL | ((unint64_t)(v17 & 1) << 60);
  }
  else
  {
    if ((v5 & 1) != 0)
    {
      v10 = *((_BYTE *)&self->_navigationControllerFlags + 8);
      navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xF1FFFFFFFFFFFFFFLL;
      *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags;
      goto LABEL_9;
    }
    if ((v5 & 4) != 0)
    {
      navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
      v10 = *((_BYTE *)&self->_navigationControllerFlags + 8);
LABEL_9:
      *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags & 0xEFFFFFFFFFFFFFFFLL;
      *((_BYTE *)&self->_navigationControllerFlags + 8) = v10;
    }
  }
LABEL_26:

}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 toolbar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  $16004AA6B36EC19B1B0093A5EF089ED3 *p_navigationControllerFlags;
  uint64_t navigationControllerFlags;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  BOOL v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  double v26;
  _QWORD v27[4];
  id v28;
  double v29;
  double v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  p_navigationControllerFlags = &self->_navigationControllerFlags;
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x8000000000000000) == 0)
  {
    if ((objc_msgSend((id)UIApp, "_isActivating") & 1) != 0)
      goto LABEL_27;
    -[UINavigationController _window](self, "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "activationState");

    if (v14 == -1)
      goto LABEL_27;
    p_navigationControllerFlags = &self->_navigationControllerFlags;
    navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  }
  v15 = *((_BYTE *)p_navigationControllerFlags + 8);
  if ((navigationControllerFlags & 0x2000000000000000) == 0 || v5)
  {
    v16 = (navigationControllerFlags & 0x2000000000000000) == 0;
    v17 = navigationControllerFlags | 0x8000000000000000;
    v18 = !v5;
    if (v16)
      v18 = 1;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v15;
    if (v18)
      v19 = v17;
    else
      v19 = v17 & 0xDFFFFFFFFFFFFFFFLL;
    *(_QWORD *)&self->_navigationControllerFlags = v19;
    v30 = 0.0;
    if (_UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v8, v9, &v30))
    {
      if (!v5)
        goto LABEL_26;
      objc_msgSend(v9, "_backgroundTransitionProgress");
      if (v20 == v30
        || !+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        goto LABEL_26;
      }
      if (objc_msgSend(v9, "isMinibar"))
      {
        objc_msgSend(v9, "compactScrollEdgeAppearance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = v21;
        }
        else
        {
          objc_msgSend(v9, "scrollEdgeAppearance");
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;

      }
      else
      {
        objc_msgSend(v9, "scrollEdgeAppearance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v24 || (v25 = objc_msgSend(v24, "_hasTransparentBackground"), v24, v25))
      {
        v26 = v30;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __112__UINavigationController__updateBackgroundTransitionProgressForScrollView_toolbar_isNavigationTransitionUpdate___block_invoke;
        v27[3] = &unk_1E16B1888;
        v28 = v9;
        v29 = v26;
        _UIBarsTwoPartCrossfadeTransitionProgress(v27, 0, v26);

      }
      else
      {
LABEL_26:
        objc_msgSend(v9, "_setBackgroundTransitionProgress:", v30);
      }
    }
  }
LABEL_27:

}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 toolbar:(id)a4
{
  -[UINavigationController _updateBackgroundTransitionProgressForScrollView:toolbar:isNavigationTransitionUpdate:](self, "_updateBackgroundTransitionProgressForScrollView:toolbar:isNavigationTransitionUpdate:", a3, a4, 0);
}

- (void)_updateManualScrollEdgeAppearanceProgressForScrollView:(id)a3 navigationItem:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a4;
  v6 = a3;
  objc_msgSend(v6, "contentOffset");
  v8 = v7;
  objc_msgSend(v6, "adjustedContentInset");
  v10 = v9;

  v11 = v8 + v10;
  v12 = 0.0;
  v13 = 0.0;
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x800000000000000) != 0)
    objc_msgSend(v14, "_autoScrollEdgeTransitionDistance", 0.0);
  if (v13 == 0.0)
    v13 = 4.0;
  if (v11 >= 0.0)
  {
    v12 = 1.0;
    if (v11 < v13)
      v12 = v11 / v13;
  }
  objc_msgSend(v14, "_setManualScrollEdgeAppearanceProgress:", v12);

}

- (BOOL)_navigationControllerShouldObserveScrollView
{
  return (*(_QWORD *)&self->_navigationControllerFlags & 0x1E00000000000000) != 0;
}

- (UIEdgeInsets)_expectedContentInsetDeltaForViewController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v4 = a3;
  v5 = v4;
  v6 = 0.0;
  if (v4)
  {
    v7 = 0.0;
    if (objc_msgSend(v4, "automaticallyAdjustsScrollViewInsets"))
    {
      -[UINavigationController _scrollViewTopContentInsetForViewController:](self, "_scrollViewTopContentInsetForViewController:", v5);
      v7 = v8;
      -[UINavigationController _scrollViewBottomContentInsetForViewController:](self, "_scrollViewBottomContentInsetForViewController:", v5);
      v6 = v9;
    }
  }
  else
  {
    v7 = 0.0;
  }

  v10 = 0.0;
  v11 = 0.0;
  v12 = v7;
  v13 = v6;
  result.right = v11;
  result.bottom = v13;
  result.left = v10;
  result.top = v12;
  return result;
}

- (BOOL)_otherExpectedNavigationControllerObservesScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UINavigationController *v8;
  char v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_viewControllerForAncestor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_outermostNavigationController");
    v8 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (v8 && v8 != self)
      v9 = objc_msgSend(v5, "_isScrollViewScrollObserver:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_topLayoutTypeForViewController:(id)a3
{
  int64_t v4;
  void *v5;
  double v6;

  v4 = 1;
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, a3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  if (v6 == 0.0)
  {
    if (-[UINavigationController _isPushing](self, "_isPushing"))
    {
      v4 = 2;
    }
    else if (-[UINavigationController _isPopping](self, "_isPopping"))
    {
      v4 = 3;
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (CGRect)_frameForViewController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  int v34;
  double v35;
  void *v36;
  double v37;
  int v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  char v52;
  char v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  CGRect result;

  v4 = a3;
  -[UINavigationController navigationTransitionView](self, "navigationTransitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v56 = 0;
  v54 = 0u;
  v55 = 0u;
  -[UINavigationController _calculateTopLayoutInfoForViewController:](self, "_calculateTopLayoutInfoForViewController:", v4);
  v14 = -[UINavigationController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar");
  v15 = v4;
  -[UINavigationController navigationBar](self, "navigationBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_barPosition");
  objc_msgSend(v15, "searchDisplayController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isActive"))
  {
    objc_msgSend(v15, "searchDisplayController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "hidNavigationBar"))
      v21 = (objc_msgSend(v15, "edgesForExtendedLayout") & 1) == 0 && v17 == 3;
    else
      v21 = 0;

  }
  else
  {
    v21 = 0;
  }

  v22 = v9 + *((double *)&v54 + 1);
  v23 = 0.0;
  v24 = v13 - (*((double *)&v54 + 1) + 0.0);
  if ((v21 | v14) == 1)
  {
    -[UINavigationController _statusBarHeightAdjustmentForCurrentOrientation](self, "_statusBarHeightAdjustmentForCurrentOrientation");
    v23 = v25;
    v26 = v25 > 0.0 ? v21 : 0;
    v27 = v22 + v25;
    if (v26 == 1)
    {
      v24 = v24 - (v23 + 0.0);
      v22 = v27;
    }
  }
  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v29 = -[UINavigationController _shouldToolBar:insetViewController:orOverlayContent:](self, "_shouldToolBar:insetViewController:orOverlayContent:", v28, v4, &v53);
  v52 = 0;
  -[UIViewController tabBarController](self, "tabBarController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tabBar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController tabBarController](self, "tabBarController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[UINavigationController _shouldTabBarController:insetViewController:orOverlayContent:](self, "_shouldTabBarController:insetViewController:orOverlayContent:", v32, v4, &v52);

  if (!v33 && v29)
  {
    v22 = v22 + 0.0;
    v24 = v24 - (_UIBackgroundExtensionForBar(v28) + 0.0);
LABEL_25:
    -[UINavigationController toolbar](self, "toolbar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v35 = v37;

    goto LABEL_26;
  }
  if (v53)
    v34 = 1;
  else
    v34 = v29;
  v35 = 0.0;
  if (v34 == 1)
    goto LABEL_25;
LABEL_26:
  if (v29)
  {
    if (v31 && (~*(_DWORD *)&self->_navigationControllerFlags & 0xC00) != 0)
      v33 = 1;
    v22 = v22 + 0.0;
    v24 = v24 - (v35 + 0.0);
  }
  if (v53 && v31 && (~*(_DWORD *)&self->_navigationControllerFlags & 0xC00) != 0)
    v52 = 1;
  if (v52)
    v38 = 1;
  else
    v38 = v33;
  v39 = 0.0;
  if (v38 == 1)
  {
    objc_msgSend(v31, "bounds");
    v39 = v40;
  }
  if (v33)
  {
    objc_msgSend(v4, "_screen");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "_userInterfaceIdiom");

    v24 = v24 - (v39 + 0.0);
    if (v42 == 3)
      v22 = v22 + v39;
    else
      v22 = v22 + 0.0;
  }
  if (objc_msgSend((id)objc_opt_class(), "_directlySetsContentOverlayInsetsForChildren"))
  {
    v43 = *(double *)&v55 + *((double *)&v55 + 1);
    v44 = 0.0;
    if (!BYTE3(v56))
      v43 = 0.0;
    if ((v14 & ~v21) != 0)
      v45 = v23;
    else
      v45 = 0.0;
    v46 = v45 + v43;
    if (v52)
      v47 = v39;
    else
      v47 = 0.0;
    if (v53)
      v44 = v35;
    objc_msgSend(v4, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v46, 0.0, v47 + v44, 0.0, -1.79769313e308, -1.79769313e308);
  }

  v48 = v7 + 0.0;
  v49 = v22;
  v50 = v11;
  v51 = v24;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

+ (BOOL)_directlySetsContentOverlayInsetsForChildren
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (UIView)navigationTransitionView
{
  return (UIView *)self->_navigationTransitionView;
}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  double v3;
  objc_super v5;

  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
    return v3 > 0.0;
  }
  else if (self->__preferredNavigationBarPosition
         && -[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible"))
  {
    return self->__preferredNavigationBarPosition == 3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationController;
    return -[UIViewController _viewControllerUnderlapsStatusBar](&v5, sel__viewControllerUnderlapsStatusBar);
  }
}

- (BOOL)_shouldToolBar:(id)a3 insetViewController:(id)a4 orOverlayContent:(BOOL *)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  int v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_7;
  if (-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
  {
    if ((*(_QWORD *)&self->_navigationControllerFlags & 0x400000000000) == 0)
      goto LABEL_7;
    -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isToolbarHidden"))
    {

      goto LABEL_7;
    }
    v11 = v10[153];

    if ((v11 & 0x100000000000) == 0)
    {
LABEL_7:
      v12 = 0;
      v13 = 0;
      if (!a5)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  v14 = objc_msgSend(v8, "isTranslucent");
  if ((objc_msgSend(v9, "extendedLayoutIncludesOpaqueBars") & 1) == 0 && !v14)
  {
    v13 = 1;
    if (!a5)
      goto LABEL_16;
    goto LABEL_14;
  }
  v13 = (objc_msgSend(v9, "edgesForExtendedLayout") & 4) == 0;
  if (a5)
  {
LABEL_14:
    v12 = !v13;
LABEL_15:
    *a5 = v12;
  }
LABEL_16:

  return v13;
}

- (BOOL)_shouldTabBarController:(id)a3 insetViewController:(id)a4 orOverlayContent:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  id v14;
  int v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "tabBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0xC00) == 0)
  {
    -[UIViewController parentViewController](self, "parentViewController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14 == v8 ? 1 : objc_msgSend(v10, "isHidden") ^ 1;

    if (v10)
    {
      if (v15)
      {
        if ((objc_msgSend(v9, "extendedLayoutIncludesOpaqueBars") & 1) != 0
          || objc_msgSend(v10, "_isTranslucent"))
        {
          v12 = (objc_msgSend(v9, "edgesForExtendedLayout") & 4) == 0;
          if (!a5)
            goto LABEL_4;
        }
        else
        {
          v12 = 1;
          if (!a5)
            goto LABEL_4;
        }
        v11 = !v12;
        goto LABEL_3;
      }
    }
  }
  v11 = 0;
  v12 = 0;
  if (a5)
LABEL_3:
    *a5 = v11;
LABEL_4:

  return v12;
}

- (double)_scrollViewBottomContentInsetForViewController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;

  v4 = a3;
  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v5
    && !-[UINavigationController isToolbarHidden](self, "isToolbarHidden")
    && !-[UINavigationController _shouldToolBar:insetViewController:](self, "_shouldToolBar:insetViewController:", v5, v4))
  {
    -[UINavigationController toolbar](self, "toolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v6 = v8;

  }
  -[UIViewController tabBarController](self, "tabBarController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController tabBarController](self, "tabBarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_effectiveTabBarPosition");

  if (v10
    && v12 == 1
    && (*(_QWORD *)&self->_navigationControllerFlags & 0xC00) == 0
    && !-[UINavigationController _shouldTabBarController:insetViewController:orOverlayContent:](self, "_shouldTabBarController:insetViewController:orOverlayContent:", v9, v4, 0))
  {
    objc_msgSend(v10, "bounds");
    v6 = v6 + v13;
  }
  -[UIView _window](self->super._view, "_window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaInsets");
  v16 = v6 + v15;

  -[UIViewController _multiColumnViewController](self, "_multiColumnViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "keyboardInset");
    if (v16 < v19)
      v16 = v19;
  }

  return v16;
}

- (id)_existingToolbar
{
  return self->_toolbar;
}

- (void)_setInteractiveScrollActive:(BOOL)a3
{
  if (self->_interactiveScrollActive != a3)
  {
    self->_interactiveScrollActive = a3;
    if (a3)
      -[UINavigationController _reloadCachedInteractiveScrollMeasurements](self, "_reloadCachedInteractiveScrollMeasurements");
  }
}

- (void)_positionNavigationBarHidden:(BOOL)a3
{
  -[UINavigationController _positionNavigationBarHidden:edge:](self, "_positionNavigationBarHidden:edge:", a3, 1);
}

- (void)_updateLayoutForScrollView:(id)a3 topLayoutType:(int64_t)a4
{
  id v6;
  int isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets;
  void *v8;
  id v9;
  id v10;
  id v11;
  UIViewController *disappearingViewController;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  if (v6)
  {
    if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1000000000) == 0)
    {
      v17 = v6;
      isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets = _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v6);
      v6 = v17;
      if (isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets)
      {
        -[UINavigationController topViewController](self, "topViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 1, 1);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v9 == v17)
        {

          v11 = v17;
        }
        else
        {
          _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 1, 0);
          v10 = (id)objc_claimAutoreleasedReturnValue();

          v11 = v17;
          if (v10 != v17)
          {
            disappearingViewController = self->_disappearingViewController;
            -[UINavigationController topViewController](self, "topViewController");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "navigationItem");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_searchControllerIfAllowed");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!disappearingViewController)
            {
              if (!v15
                || !objc_msgSend(v15, "isActive")
                || (objc_msgSend(v15, "_contentOrObservableScrollViewForEdge:", 1),
                    v16 = (id)objc_claimAutoreleasedReturnValue(),
                    v16,
                    v16 != v17))
              {
                -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v17);
              }
            }

            goto LABEL_14;
          }
        }
        -[UINavigationController _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:](self, "_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:", v11);
        -[UINavigationController _updateTopViewFramesToMatchScrollOffsetInViewController:contentScrollView:topLayoutType:](self, "_updateTopViewFramesToMatchScrollOffsetInViewController:contentScrollView:topLayoutType:", v8, v17, a4);
LABEL_14:

        v6 = v17;
      }
    }
  }

}

- (void)_positionToolbarHidden:(BOOL)a3 edge:(unint64_t)a4 crossFade:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t navigationControllerFlags;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  UILayoutContainerView *containerView;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double MidX;
  double v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;
  void *v45;
  double builtinTransitionGap;
  double v47;
  double v48;
  CGFloat MaxY;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v5 = a5;
  v7 = a3;
  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bounds");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v54, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v14 = v13;
  v16 = v15;
  objc_msgSend(v54, "setBounds:", v10, v12, v13, v15);
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  -[UIViewController tabBarController](self, "tabBarController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = 0.0;
  if (!v18 || (navigationControllerFlags & 0xC00) != 0)
    goto LABEL_11;
  objc_msgSend(v18, "tabBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "window");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v19, "tabBar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isHidden") & 1) == 0)
      {

LABEL_9:
        objc_msgSend(v22, "bounds");
        v20 = v26;
        goto LABEL_10;
      }
      -[UIViewController parentViewController](self, "parentViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 == v19)
        goto LABEL_9;
    }
  }
LABEL_10:

LABEL_11:
  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView bounds](containerView, "bounds");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
  }
  else
  {
    v29 = *MEMORY[0x1E0C9D648];
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v55.origin.x = v29;
  v55.origin.y = v31;
  v55.size.width = v33;
  v55.size.height = v35;
  MidX = CGRectGetMidX(v55);
  v56.origin.x = v29;
  v56.origin.y = v31;
  v56.size.width = v33;
  v56.size.height = v35;
  v37 = CGRectGetMaxY(v56) + v16 * -0.5;
  v38 = !v7;
  v39 = v20 <= 0.0 || v7;
  if (v39)
    v40 = 0.0;
  else
    v40 = v20;
  if (v7)
    v41 = 0.0;
  else
    v41 = 1.0;
  if ((v38 & 1) != 0 || v5)
  {
    objc_msgSend(v54, "alpha");
    if (v42 != v41 && !-[UINavigationController _toolbarAnimationWasCancelled](self, "_toolbarAnimationWasCancelled"))
      objc_msgSend(v54, "setAlpha:", v41);
  }
  v43 = v37 - v40;
  v44 = !-[_UIViewControllerTransitionConductor shouldAnimateBottomBarVisibility](self->_transitionConductor, "shouldAnimateBottomBarVisibility")|| v5;
  if (((v38 | v44) & 1) != 0)
  {
    v45 = v54;
  }
  else
  {
    builtinTransitionGap = 0.0;
    if (self->_builtinTransitionStyle == 1)
      builtinTransitionGap = self->_builtinTransitionGap;
    v47 = v14 + builtinTransitionGap;
    v45 = v54;
    if (a4 == 8)
    {
      MidX = MidX + v47;
      v38 = 1;
    }
    else
    {
      v48 = MidX - v47;
      if (a4 == 2)
        MidX = v48;
      else
        v43 = v16 + v43;
      v38 = a4 == 2;
    }
  }
  if (((v38 | v44) & v39) == 1)
  {
    objc_msgSend(v45, "bounds");
    v57.origin.y = round(v43 - v57.size.height * 0.5);
    v57.origin.x = round(MidX - v57.size.width * 0.5);
    MaxY = CGRectGetMaxY(v57);
    _UIBackgroundExtensionForBarWithMaxY(v54, MaxY);
  }
  UIFloorToViewScale(self->_containerView);
  v51 = v50 * 0.5;
  objc_msgSend(v54, "center");
  if (v53 != MidX || v52 != v51)
    objc_msgSend(v54, "setCenter:", MidX, v51);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UINavigationControllerVisualStyle toolbarFrameChanged](self->_visualStyle, "toolbarFrameChanged");

}

- (void)_positionToolbarHidden:(BOOL)a3 edge:(unint64_t)a4
{
  -[UINavigationController _positionToolbarHidden:edge:crossFade:](self, "_positionToolbarHidden:edge:crossFade:", a3, a4, 0);
}

- (void)_positionToolbarHidden:(BOOL)a3
{
  -[UINavigationController _positionToolbarHidden:edge:](self, "_positionToolbarHidden:edge:", a3, 4);
}

- (UIToolbar)toolbar
{
  UIToolbar *toolbar;
  UILayoutContainerView *containerView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_class *toolbarClass;
  UIToolbar *v14;
  UIToolbar *v15;

  toolbar = self->_toolbar;
  if (!toolbar)
  {
    containerView = self->_containerView;
    if (containerView)
    {
      -[UIView bounds](containerView, "bounds");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D648];
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    toolbarClass = self->_toolbarClass;
    if (!toolbarClass)
      toolbarClass = (objc_class *)objc_opt_class();
    v14 = (UIToolbar *)objc_msgSend([toolbarClass alloc], "initWithFrame:", v6, v8, v10, v12);
    v15 = self->_toolbar;
    self->_toolbar = v14;

    -[UINavigationController _configureToolbar](self, "_configureToolbar");
    toolbar = self->_toolbar;
  }
  return toolbar;
}

- (BOOL)_hasPotentiallyChromelessBottomBar
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  if (_UIBarsApplyChromelessEverywhere())
  {
    -[UINavigationController _existingActiveVisibleToolbar](self, "_existingActiveVisibleToolbar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      -[UIViewController _tabBarControllerEnforcingClass:](self, "_tabBarControllerEnforcingClass:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        v4 = objc_msgSend(v5, "_isBarEffectivelyHidden") ^ 1;
      else
        LOBYTE(v4) = 0;

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_toolbarWindowForInterfaceOrientation:(id)a3
{
  return -[UINavigationController _interfaceOrientationWindowForBar:matchingBar:](self, "_interfaceOrientationWindowForBar:matchingBar:", a3, self->_toolbar);
}

- (BOOL)_shouldToolBar:(id)a3 insetViewController:(id)a4
{
  return -[UINavigationController _shouldToolBar:insetViewController:orOverlayContent:](self, "_shouldToolBar:insetViewController:orOverlayContent:", a3, a4, 0);
}

- (void)_configureToolbar
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__UINavigationController__configureToolbar__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)_setUpContentFocusContainerGuide
{
  UIFocusContainerGuide *v3;
  UIFocusContainerGuide *contentFocusContainerGuide;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (!self->_contentFocusContainerGuide)
  {
    v3 = objc_alloc_init(UIFocusContainerGuide);
    contentFocusContainerGuide = self->_contentFocusContainerGuide;
    self->_contentFocusContainerGuide = v3;

    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addLayoutGuide:", self->_contentFocusContainerGuide);

    -[UILayoutGuide setIdentifier:](self->_contentFocusContainerGuide, "setIdentifier:", CFSTR("UINavigationControllerContentFocusContainerGuide"));
    v16 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide topAnchor](self->_contentFocusContainerGuide, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController navigationBar](self, "navigationBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[UILayoutGuide leadingAnchor](self->_contentFocusContainerGuide, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v6;
    -[UILayoutGuide trailingAnchor](self->_contentFocusContainerGuide, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v10;
    -[UILayoutGuide bottomAnchor](self->_contentFocusContainerGuide, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v15);

  }
}

- (void)setNavigationBar:(id)a3
{
  UINavigationBar *v6;
  UINavigationBar **p_navigationBar;
  int v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UINavigationBar *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  UINavigationBar *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (UINavigationBar *)a3;
  p_navigationBar = &self->_navigationBar;
  if (self->_navigationBar != v6)
  {
    v8 = dyld_program_sdk_at_least();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v8)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 2690, CFSTR("%@ is not a subclass of UINavigationBar"), v6);

      }
    }
    else if ((isKindOfClass & 1) == 0)
    {
      v27 = qword_1EDDB0E88;
      if (!qword_1EDDB0E88)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&qword_1EDDB0E88);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v6;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "%@ is not a subclass of UINavigationBar", buf, 0xCu);
      }
    }
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar setLocked:](*p_navigationBar, "setLocked:", 0);
    -[UINavigationBar setDelegate:](*p_navigationBar, "setDelegate:", 0);
    -[UIView removeFromSuperview](*p_navigationBar, "removeFromSuperview");
    -[NSMapTable removeObjectForKey:](self->_lastContentMarginForView, "removeObjectForKey:", *p_navigationBar);
    objc_storeStrong((id *)&self->_navigationBar, a3);
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UINavigationController _widthForLayout](self, "_widthForLayout");
    v15 = v14;
    -[UINavigationBar _layoutHeightsForNavigationItem:fittingWidth:](v6, "_layoutHeightsForNavigationItem:fittingWidth:", 0);
    -[UINavigationBar setFrame:](*p_navigationBar, "setFrame:", v12, v13, v15, v16);
    v17 = *p_navigationBar;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      if (qword_1EDDB0F40 != -1)
        dispatch_once(&qword_1EDDB0F40, &__block_literal_global_1614);
      if (byte_1EDDB0E52)
      {
        -[UIView frame](v17, "frame");
        -[UINavigationBar sizeThatFits:](v17, "sizeThatFits:", v18, v19);
      }
    }

    -[UIView setAutoresizingMask:](*p_navigationBar, "setAutoresizingMask:", 2);
    -[UINavigationBar setDelegate:](*p_navigationBar, "setDelegate:", self);
    -[UIView addSubview:](self->super._view, "addSubview:", *p_navigationBar);
    if (objc_msgSend(v11, "count"))
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v21 = v11;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v30 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "navigationItem");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v23);
      }

      -[UINavigationBar setItems:](*p_navigationBar, "setItems:", v20);
    }
    -[UINavigationBar setLocked:](*p_navigationBar, "setLocked:", 1);
    -[UINavigationController _positionNavigationBarHidden:](self, "_positionNavigationBarHidden:", *(_DWORD *)&self->_navigationControllerFlags & 1);
    -[UIView setHidden:](*p_navigationBar, "setHidden:", *(_DWORD *)&self->_navigationControllerFlags & 1);

  }
}

- (void)_repositionPaletteWithNavigationBarHidden:(BOOL)a3 duration:(double)a4 shouldUpdateNavigationItems:(BOOL)a5
{
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void (**v15)(void *, uint64_t);
  _QWORD v16[5];
  BOOL v17;
  _QWORD aBlock[9];
  BOOL v19;
  BOOL v20;

  v7 = a3;
  -[UIView bounds](self->_topPalette, "bounds");
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFELL | v7;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke;
  aBlock[3] = &unk_1E16C0760;
  v19 = v7;
  aBlock[4] = self;
  aBlock[5] = v10;
  aBlock[6] = v11;
  aBlock[7] = v12;
  aBlock[8] = v13;
  v20 = a5;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke_2;
  v16[3] = &unk_1E16B7F38;
  v17 = v7;
  v16[4] = self;
  v15 = (void (**)(void *, uint64_t))_Block_copy(v16);
  if (a4 <= 0.0)
  {
    v14[2](v14);
    v15[2](v15, 1);
  }
  else
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v15, a4);
  }

}

void __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = 0.0;
    if (objc_msgSend(*(id *)(a1 + 32), "_viewControllerUnderlapsStatusBar"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_statusBarHeightAdjustmentForCurrentOrientation");
      v2 = v3;
    }
    objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarHidesCompletelyOffscreen:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_positionNavigationBarHidden:edge:initialOffset:", 1, 1, *(double *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "_positionPaletteHidden:edge:initialOffset:", 0, 1, v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setPalettePinningBarHidden:", 1);
  }
  else
  {
    if (*(_BYTE *)(a1 + 73) && (objc_msgSend(*(id *)(a1 + 32), "_hasNestedNavigationController") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationBar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLocked:", 0);

      objc_msgSend(*(id *)(a1 + 32), "_navigationItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "navigationBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setItems:", v5);

      objc_msgSend(*(id *)(a1 + 32), "navigationBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLocked:", 1);

    }
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "_viewControllerForObservableScrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_topViewControllerObservableScrollViewForEdge:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateTopViewFramesToMatchScrollOffsetInViewController:contentScrollView:topLayoutType:", v9, v10, 0);

    objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarHidesCompletelyOffscreen:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_positionNavigationBarHidden:edge:initialOffset:", 0, 1, 0.0);
    objc_msgSend(*(id *)(a1 + 32), "_positionPaletteHidden:edge:initialOffset:", 0, 1, 0.0);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_searchHidNavigationBar"))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_animateForSearchPresentation:", *(unsigned __int8 *)(a1 + 72));

  }
  objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "topViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_computeAndApplyScrollContentInsetDeltaForViewController:", v13);

}

- (void)_positionNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  UINavigationController *v11;
  _BOOL8 v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a3;
  if (!a3
    || !-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController")
    || (-[UINavigationController _existingNavigationBar](self, "_existingNavigationBar"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isHidden"),
        v7,
        (v8 & 1) == 0))
  {
    if (a4)
    {
      if (a4 == 15)
      {
        -[UINavigationController navigationBar](self, "navigationBar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v5)
        {
          objc_msgSend(v9, "setAlpha:", 1.0);

          -[UINavigationController navigationBar](self, "navigationBar");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_updateBarVisibilityForTopItem");

          goto LABEL_15;
        }
        objc_msgSend(v9, "setAlpha:", 0.0);

        v11 = self;
        v12 = 0;
        v13 = 15;
LABEL_14:
        -[UINavigationController _positionNavigationBarHidden:edge:initialOffset:](v11, "_positionNavigationBarHidden:edge:initialOffset:", v12, v13, 0.0);
LABEL_15:
        -[UINavigationController navigationBar](self, "navigationBar");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        -[UINavigationController navigationBar](self, "navigationBar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_setBarPosition:", -[UINavigationController _positionForBar:](self, "_positionForBar:", v16));

        return;
      }
    }
    else if (v5)
    {
      -[UINavigationController navigationBar](self, "navigationBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAlpha:", 0.0);
      goto LABEL_12;
    }
    if (-[UINavigationController _navigationBarAnimationWasCancelled](self, "_navigationBarAnimationWasCancelled"))
    {
LABEL_13:
      v11 = self;
      v12 = v5;
      v13 = a4;
      goto LABEL_14;
    }
    -[UINavigationController navigationBar](self, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);

    -[UINavigationController navigationBar](self, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_updateBarVisibilityForTopItem");
LABEL_12:

    goto LABEL_13;
  }
}

- (BOOL)_navigationBarAnimationWasCancelled
{
  return self->__navigationBarAnimationWasCancelled;
}

- (int64_t)_positionForBar:(id)a3
{
  UIToolbar *v5;
  UIToolbar *v6;
  void *v7;
  void *v8;
  int64_t preferredNavigationBarPosition;

  v5 = (UIToolbar *)a3;
  v6 = v5;
  if ((UIToolbar *)self->_navigationBar == v5)
  {
    preferredNavigationBarPosition = self->__preferredNavigationBarPosition;
    if (!preferredNavigationBarPosition)
    {
      if (-[UINavigationController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar"))
        preferredNavigationBarPosition = 3;
      else
        preferredNavigationBarPosition = 2;
    }
  }
  else if (self->_toolbar == v5)
  {
    if (dyld_program_sdk_at_least())
      preferredNavigationBarPosition = 4;
    else
      preferredNavigationBarPosition = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected bar sending delegate -barPositionForBar:! %@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 9257, CFSTR("%@"), v7);

    preferredNavigationBarPosition = 0;
  }

  return preferredNavigationBarPosition;
}

- (void)_positionPaletteHidden:(BOOL)a3 edge:(unint64_t)a4 initialOffset:(double)a5
{
  _BOOL8 v7;
  _UINavigationControllerPalette *topPalette;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t navigationControllerFlags;
  double v15;
  double v16;
  double v17;
  UILayoutContainerView *containerView;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double MidX;
  double MinY;
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
  _UINavigationControllerPalette *v47;
  double v48;
  double v49;
  double v50;
  _UINavigationControllerPalette *v51;
  _UINavigationControllerPalette *transitioningTopPalette;
  _UINavigationControllerPalette *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGRect v63;
  CGRect v64;

  v7 = a3;
  if (-[UINavigationController _isTransitioning](self, "_isTransitioning"))
    return;
  topPalette = self->_topPalette;
  if (!topPalette || -[_UINavigationControllerPalette boundaryEdge](topPalette, "boundaryEdge") == 5)
    return;
  -[UINavigationController navigationBar](self, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v54 = v11;
  v13 = v12;

  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  -[UIView bounds](self->_topPalette, "bounds");
  v59 = v15;
  v60 = v16 * 0.5;
  v17 = v16 * 0.5 + 0.0;
  if (!v7 && (navigationControllerFlags & 1) == 0
    || v7
    && !-[_UINavigationControllerPalette _isPalettePinningBarHidden](self->_topPalette, "_isPalettePinningBarHidden")
    && (a4 == 8 || a4 == 2))
  {
    v17 = v13 + v17;
  }
  if (-[_UINavigationControllerPalette paletteIsHidden](self->_topPalette, "paletteIsHidden"))
  {
    -[UINavigationController _frameForPalette:](self, "_frameForPalette:", self->_topPalette);
    -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:");
    -[UINavigationController _installPaletteIntoViewHierarchy:](self, "_installPaletteIntoViewHierarchy:", self->_topPalette);
  }
  v55 = v13;
  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView bounds](containerView, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v56 = *MEMORY[0x1E0C9D648];
  }
  else
  {
    v20 = *MEMORY[0x1E0C9D648];
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v56 = *MEMORY[0x1E0C9D648];
    v27 = v22;
  }
  v61 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v62 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v63.origin.x = v20;
  v63.origin.y = v22;
  v63.size.width = v24;
  v63.size.height = v26;
  MidX = CGRectGetMidX(v63);
  v64.origin.x = v20;
  v64.origin.y = v22;
  v64.size.width = v24;
  v64.size.height = v26;
  MinY = CGRectGetMinY(v64);
  -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", self->_topPalette, v7, a4, MidX, MinY, v17);
  v31 = v30;
  v33 = v32;
  -[UIView frame](self->_topPalette, "frame");
  v57 = v34;
  v58 = v35;
  if (self->_transitioningTopPalette)
  {
    -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", MidX, MinY, v17);
    v37 = v36;
    v39 = v38;
    -[UIView bounds](self->_transitioningTopPalette, "bounds");
    v41 = v37 - v40 * 0.5;
    v43 = v39 - v42 * 0.5;
    -[UIView frame](self->_transitioningTopPalette, "frame");
    v61 = v45;
    v62 = v44;
    v46 = v41;
  }
  else
  {
    v46 = 0.0;
    v43 = v27;
    v41 = v56;
  }
  if (v7
    && -[_UINavigationControllerPalette _isPalettePinningBarHidden](self->_topPalette, "_isPalettePinningBarHidden")
    && (a4 == 8 || a4 == 2))
  {
    v47 = self->_topPalette;
    v48 = -v55;
  }
  else
  {
    v47 = self->_topPalette;
    v48 = a5;
  }
  -[_UINavigationControllerPalette _setTopConstraintConstant:](v47, "_setTopConstraintConstant:", v48);
  v49 = v31 + v59 * -0.5;
  v50 = v33 - v60;
  if (a4 != 8 && a4 != 2)
  {
    -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:", v49, v33 - v60, v57, v58);
    transitioningTopPalette = self->_transitioningTopPalette;
    if (!transitioningTopPalette)
      return;
LABEL_41:
    -[_UINavigationControllerPalette setFrame:](transitioningTopPalette, "setFrame:", v41, v43, v62, v61);
    return;
  }
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    if (!v7 || (navigationControllerFlags & 1) != 0)
    {
      if (!v7 && (navigationControllerFlags & 1) != 0)
      {
        -[_UINavigationControllerPalette _setLeftConstraintConstant:](self->_topPalette, "_setLeftConstraintConstant:", v49 - v54);
        -[_UINavigationControllerPalette _setTopConstraintConstant:](self->_topPalette, "_setTopConstraintConstant:", -v55);
      }
    }
    else
    {
      -[_UINavigationControllerPalette _setLeftConstraintConstant:](self->_topPalette, "_setLeftConstraintConstant:", v49);
    }
    -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:", v49, v50, v57, v58);
    v53 = self->_transitioningTopPalette;
    if (v53)
    {
      -[_UINavigationControllerPalette _setLeftConstraintConstant:](v53, "_setLeftConstraintConstant:", v46);
      transitioningTopPalette = self->_transitioningTopPalette;
      goto LABEL_41;
    }
  }
  else
  {
    -[_UINavigationControllerPalette setFrame:isAnimating:](self->_topPalette, "setFrame:isAnimating:", 0, v49, v50, v57, v58);
    v51 = self->_transitioningTopPalette;
    if (v51)
      -[_UINavigationControllerPalette setFrame:isAnimating:](v51, "setFrame:isAnimating:", 0, v41, v43, v62, v61);
  }
}

- (void)_setNavigationBarHidesCompletelyOffscreen:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFEFFFFFFFFLL | v3;
}

uint64_t __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke_2(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setPalettePinningBarHidden:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
}

- (id)_topViewControllerObservableScrollViewForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[UINavigationController _viewControllerForObservableScrollView](self, "_viewControllerForObservableScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_contentOrObservableScrollViewForEdge:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)__viewWillLayoutSubviews
{
  void *v3;
  int isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  if (!-[UIViewController _freezeLayoutForOrientationChangeOnDismissal](self, "_freezeLayoutForOrientationChangeOnDismissal"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v3);

    -[_UIViewControllerTransitionConductor startDeferredTransitionIfNeeded](self->_transitionConductor, "startDeferredTransitionIfNeeded");
    if (!-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController")
      && -[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible")
      && !-[UINavigationController _isPushingOrPopping](self, "_isPushingOrPopping"))
    {
      -[UINavigationController _positionNavigationBarHidden:](self, "_positionNavigationBarHidden:", 0);
    }
    -[UINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v5);

    if ((*(_QWORD *)&self->_navigationControllerFlags & 4) == 0
      || -[UINavigationController _isPushingOrPopping](self, "_isPushingOrPopping")
      || isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets != v6)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "_isNestedNavigationController")
        && objc_msgSend(v7, "_isPushingOrPopping"))
      {
        objc_msgSend(v7, "_existingView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setNeedsLayout");

      }
      -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v7);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_UINavigationControllerVisualStyle containerViewWillLayoutSubviews:](self->_visualStyle, "containerViewWillLayoutSubviews:", self->_containerView);
  }
}

- (id)_transitionCoordinator
{
  void *v3;
  objc_super v5;

  -[_UIViewControllerTransitionConductor transitionCoordinator](self->_transitionConductor, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationController;
    -[UIViewController _transitionCoordinator](&v5, sel__transitionCoordinator);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (UIViewControllerAnimatedTransitioning)_transitionController
{
  return -[_UIViewControllerTransitionConductor transitionController](self->_transitionConductor, "transitionController");
}

- (id)_viewControllerForObservableScrollView
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[UIViewController _shouldRequestViewControllerForObservableScrollViewFromPresentedViewController](self))
  {
    v6.receiver = self;
    v6.super_class = (Class)UINavigationController;
    -[UIViewController _viewControllerForObservableScrollView](&v6, sel__viewControllerForObservableScrollView);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _viewControllerForObservableScrollViewForViewController(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (BOOL)_isNavigationController
{
  return 1;
}

- (BOOL)_allowsFreezeLayoutForOrientationChangeOnDismissal
{
  return HIBYTE(*(_QWORD *)&self->_navigationControllerFlags) & 1;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v3;

  if (-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationController;
  return -[UIViewController preferredStatusBarStyle](&v3, sel_preferredStatusBarStyle);
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  UILayoutContainerView *v7;
  UILayoutContainerView *containerView;
  double v9;
  double v10;
  double v11;
  double v12;
  UINavigationTransitionView *v13;
  UINavigationTransitionView *navigationTransitionView;
  UILayoutContainerView *v15;
  void *v16;
  void *v17;
  id v18;

  -[UIViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
  v7 = -[UILayoutContainerView initWithFrame:]([UILayoutContainerView alloc], "initWithFrame:", v3, v4, v5, v6);
  containerView = self->_containerView;
  self->_containerView = v7;

  -[UIView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  -[UILayoutContainerView setDelegate:](self->_containerView, "setDelegate:", self);
  -[UIViewController setView:](self, "setView:", self->_containerView);
  -[UINavigationController navigationBar](self, "navigationBar");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[UILayoutContainerView addSubview:](self->_containerView, "addSubview:", v18);
  -[UINavigationController _positionNavigationBarHidden:](self, "_positionNavigationBarHidden:", *(_DWORD *)&self->_navigationControllerFlags & 1);
  -[UIView bounds](self->_containerView, "bounds");
  v13 = -[UIView initWithFrame:]([UINavigationTransitionView alloc], "initWithFrame:", v9, v10, v11, v12);
  navigationTransitionView = self->_navigationTransitionView;
  self->_navigationTransitionView = v13;

  -[UIView setAutoresizingMask:](self->_navigationTransitionView, "setAutoresizingMask:", 18);
  -[UIView insertSubview:belowSubview:](self->_containerView, "insertSubview:belowSubview:", self->_navigationTransitionView, v18);
  -[UINavigationController _setupVisualStyle](self, "_setupVisualStyle");
  if (!-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
  {
    v15 = self->_containerView;
    -[UINavigationController toolbar](self, "toolbar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutContainerView addSubview:](v15, "addSubview:", v16);

    -[UINavigationController _positionToolbarHidden:](self, "_positionToolbarHidden:", -[UINavigationController isToolbarHidden](self, "isToolbarHidden"));
  }
  if (-[UIViewController childViewControllersCount](self, "childViewControllersCount"))
    -[UINavigationController setNeedsDeferredTransition](self, "setNeedsDeferredTransition");
  -[UINavigationController _configureBarsAutomaticActions](self, "_configureBarsAutomaticActions");
  -[UINavigationController _setUpContentFocusContainerGuide](self, "_setUpContentFocusContainerGuide");
  -[UINavigationController _setupBackKeyCommand](self, "_setupBackKeyCommand");
  -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionConductor setTransitionContainerView:](self->_transitionConductor, "setTransitionContainerView:", v17);

}

- (void)_configureBarTapGesture
{
  void *v3;
  void *v4;
  id v5;

  if (self->__barTapHideGesture)
  {
    -[UIViewController _existingView](self, "_existingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    if (self->_hidesBarsOnTap || self->_hidesBarsWhenVerticallyCompact || self->_hidesBarsOnSwipe)
    {
      objc_msgSend(v3, "addGestureRecognizer:", self->__barTapHideGesture);
    }
    else
    {
      -[UIGestureRecognizer view](self->__barTapHideGesture, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeGestureRecognizer:", self->__barTapHideGesture);

    }
  }
}

- (void)_configureBarsAutomaticActions
{
  -[UINavigationController _configureKeyboardBarHiding](self, "_configureKeyboardBarHiding");
  -[UINavigationController _configureBarSwipeGesture](self, "_configureBarSwipeGesture");
  -[UINavigationController _configureBarTapGesture](self, "_configureBarTapGesture");
}

- (void)_setKeyboardAppearedNotificationToken:(id)a3
{
  objc_storeStrong(&self->__keyboardAppearedNotificationToken, a3);
}

- (void)_configureKeyboardBarHiding
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (self->_hidesBarsWhenKeyboardAppears)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __53__UINavigationController__configureKeyboardBarHiding__block_invoke;
    v8 = &unk_1E16B22E0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("UIKeyboardWillShowNotification"), 0, 0, &v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _setKeyboardAppearedNotificationToken:](self, "_setKeyboardAppearedNotificationToken:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[UINavigationController _setKeyboardAppearedNotificationToken:](self, "_setKeyboardAppearedNotificationToken:", 0);
  }
}

- (void)_configureBarSwipeGesture
{
  _UIBarPanGestureRecognizer *barSwipeHideGesture;
  id v4;

  barSwipeHideGesture = self->__barSwipeHideGesture;
  if (barSwipeHideGesture)
  {
    if (self->_hidesBarsOnSwipe)
    {
      -[UIViewController _existingView](self, "_existingView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addGestureRecognizer:", self->__barSwipeHideGesture);
    }
    else
    {
      -[UIGestureRecognizer view](barSwipeHideGesture, "view");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeGestureRecognizer:", self->__barSwipeHideGesture);
    }

  }
}

- (void)_setupVisualStyle
{
  void *v4;
  _UINavigationControllerVisualStyle *v5;
  _UINavigationControllerVisualStyle *visualStyle;
  id v7;

  +[_UINavigationControllerVisualStyleFactory sharedInstance](_UINavigationControllerVisualStyleFactory, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleForNavigationController:", self);
  v5 = (_UINavigationControllerVisualStyle *)objc_claimAutoreleasedReturnValue();
  visualStyle = self->_visualStyle;
  self->_visualStyle = v5;

  if (!self->_visualStyle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 907, CFSTR("Visual provider must always be set"));

  }
}

- (void)_setupBackKeyCommand
{
  UIKeyCommand *v3;
  UIKeyCommand *backKeyCommand;

  if (!self->_backKeyCommand)
  {
    if (dyld_program_sdk_at_least())
    {
      +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("["), 0x100000, sel__performBackKeyCommand_);
      v3 = (UIKeyCommand *)objc_claimAutoreleasedReturnValue();
      backKeyCommand = self->_backKeyCommand;
      self->_backKeyCommand = v3;

      -[UIKeyCommand _setEnumerationPriority:](self->_backKeyCommand, "_setEnumerationPriority:", -1);
      -[UIViewController addKeyCommand:](self, "addKeyCommand:", self->_backKeyCommand);
    }
  }
}

- (void)_updatePalettesWithBlock:(id)a3
{
  void (**v4)(_QWORD, _UINavigationControllerPalette *);
  _UINavigationControllerPalette *topPalette;
  _BOOL4 v6;
  void (**v7)(_QWORD, _UINavigationControllerPalette *);

  v4 = (void (**)(_QWORD, _UINavigationControllerPalette *))a3;
  topPalette = self->_topPalette;
  if (topPalette)
  {
    v7 = v4;
    v6 = -[_UINavigationControllerPalette _shouldUpdateBackground](topPalette, "_shouldUpdateBackground");
    v4 = v7;
    if (v6)
    {
      v7[2](v7, self->_topPalette);
      v4 = v7;
    }
  }

}

- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (_UIBarsApplyChromelessEverywhere())
  {
    -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      -[UINavigationController _existingActiveVisibleToolbar](self, "_existingActiveVisibleToolbar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _updateBackgroundTransitionProgressForScrollView:toolbar:](self, "_updateBackgroundTransitionProgressForScrollView:toolbar:", v7, v6);

    }
  }

}

- (void)_observeScrollViewAlignedContentMarginDidChange:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__UINavigationController__observeScrollViewAlignedContentMarginDidChange___block_invoke;
  v4[3] = &unk_1E16C08B0;
  v4[4] = self;
  if (__74__UINavigationController__observeScrollViewAlignedContentMarginDidChange___block_invoke((uint64_t)v4, self->_navigationBar))
  {
    -[UINavigationBar layoutMarginsDidChange](self->_navigationBar, "layoutMarginsDidChange");
  }
  if (__74__UINavigationController__observeScrollViewAlignedContentMarginDidChange___block_invoke((uint64_t)v4, self->_toolbar))
  {
    -[UIView setNeedsLayout](self->_toolbar, "setNeedsLayout");
  }
}

BOOL __74__UINavigationController__observeScrollViewAlignedContentMarginDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "_contentMarginForView:", v3);
    v9 = v7 != v8;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  -[UINavigationController _observeScrollViewDidScroll:topLayoutType:](self, "_observeScrollViewDidScroll:topLayoutType:", a3, 1);
}

- (UIEdgeInsets)_revealableContentPaddingForObservedScrollView:(id)a3 includeContentWithCollapsedAffinity:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  v5 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v6);

  v8 = 0.0;
  if (v7 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v5))
  {
    -[UINavigationController _heightRangeOfTopViews](self, "_heightRangeOfTopViews");
    v10 = v9;
    v12 = v9 - v11;
    -[UINavigationController navigationBar](self, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v10 - v14;
    -[UIView bounds](self->_topPalette, "bounds");
    v17 = v15 - v16;

    v18 = 0.0;
    if (v17 >= 0.0)
      v18 = v17;
    if (v12 >= v18)
      v8 = v18;
    else
      v8 = v12;
  }

  v19 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  v22 = v8;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v22;
  return result;
}

- (id)tabBarItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UINavigationController;
  -[UIViewController tabBarItem](&v10, sel_tabBarItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(v3, "selectedImage"), (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v3, "unselectedImage"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
  }
  else
  {
    if ((objc_msgSend(v3, "isSystemItem") & 1) != 0)
      return v3;
    -[UINavigationController bottomViewController](self, "bottomViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabBarItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (objc_msgSend(v5, "selectedImage"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(v5, "unselectedImage"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if ((objc_msgSend(v5, "isSystemItem") & 1) == 0)
    {
      goto LABEL_5;
    }
    v9 = v5;

    v3 = v9;
  }
LABEL_5:

  return v3;
}

- (void)_hideOrShowBottomBarIfNeededWithTransition:(int)a3
{
  uint64_t v3;
  _BOOL4 v5;
  uint64_t navigationControllerFlags;
  _BOOL4 v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  UINavigationController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  UINavigationController *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  v3 = *(_QWORD *)&a3;
  v5 = -[UINavigationController _shouldBottomBarBeHidden](self, "_shouldBottomBarBeHidden");
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  v7 = -[UINavigationController _shouldCrossFadeBottomBars](self, "_shouldCrossFadeBottomBars");
  -[UIViewController viewIfLoaded](self, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_shouldReverseLayoutDirection");

  v10 = (uint64_t)self->_navigationControllerFlags;
  if (v5)
  {
    if ((v10 & 0xC00) == 0)
    {
      if ((_DWORD)v3)
      {
        -[UINavigationController disappearingViewController](self, "disappearingViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((navigationControllerFlags & 0x10000) != 0)
        {
          v13 = v12;
        }
        else
        {
          +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v34 = v13;
        v23 = objc_msgSend(v13, "autoresizingMask");
        objc_msgSend(v34, "setAutoresizingMask:", objc_msgSend(v34, "autoresizingMask") & 0xFFFFFFFFFFFFFFEFLL);

      }
      else
      {
        v23 = 0;
        v34 = 0;
      }
      -[UIViewController tabBarController](self, "tabBarController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_selectedViewControllerInTabBar");
      v25 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

      if (v25 == self)
      {
        if (v7)
          v33 = 6;
        else
          v33 = v3;
        objc_msgSend(v24, "_hideBarWithTransition:isExplicit:reason:", v33, 0, 2);
        v30 = *((_BYTE *)&self->_navigationControllerFlags + 8);
        v31 = (uint64_t)self->_navigationControllerFlags;
        *(_QWORD *)&self->_navigationControllerFlags = v31 | 0x400;
        if (!v7)
          goto LABEL_47;
        v32 = 0x400000400;
      }
      else
      {
        if (-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
        {
LABEL_47:
          objc_msgSend(v34, "setAutoresizingMask:", v23);

          goto LABEL_48;
        }
        v26 = 15;
        v27 = 8;
        if (v9)
          v27 = 2;
        v28 = 2;
        if (v9)
          v28 = 8;
        if ((_DWORD)v3 == 1)
          v26 = v28;
        if ((_DWORD)v3 == 2)
          v29 = v27;
        else
          v29 = v26;
        -[UINavigationController durationForTransition:](self, "durationForTransition:", v3);
        -[UINavigationController _setToolbarHidden:edge:duration:](self, "_setToolbarHidden:edge:duration:", 1, v29);
        v30 = *((_BYTE *)&self->_navigationControllerFlags + 8);
        v31 = (uint64_t)self->_navigationControllerFlags;
        v32 = 263168;
      }
      *(_QWORD *)&self->_navigationControllerFlags = v31 | v32;
      *((_BYTE *)&self->_navigationControllerFlags + 8) = v30;
      goto LABEL_47;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    -[UIViewController tabBarController](self, "tabBarController");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_selectedViewControllerInTabBar");
    v14 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

    if (v14 == self)
    {
      if (v7)
        v21 = 6;
      else
        v21 = v3;
      objc_msgSend(v34, "_showBarWithTransition:isExplicit:reason:", v21, 1, 2);
      v19 = *((_BYTE *)&self->_navigationControllerFlags + 8);
      v22 = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFBFFLL;
      *(_QWORD *)&self->_navigationControllerFlags = v22;
      if (!v7)
        goto LABEL_48;
      v20 = v22 | 0x800000000;
    }
    else
    {
      if (!-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
      {
LABEL_48:

        return;
      }
      v15 = 15;
      v16 = 2;
      if (v9)
        v16 = 8;
      v17 = 8;
      if (v9)
        v17 = 2;
      if ((_DWORD)v3 == 1)
        v15 = v17;
      if ((_DWORD)v3 == 2)
        v18 = v16;
      else
        v18 = v15;
      -[UINavigationController durationForTransition:](self, "durationForTransition:", v3);
      -[UINavigationController _setToolbarHidden:edge:duration:](self, "_setToolbarHidden:edge:duration:", 0, v18);
      v19 = *((_BYTE *)&self->_navigationControllerFlags + 8);
      v20 = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFBFBFFLL | 0x40000;
    }
    *(_QWORD *)&self->_navigationControllerFlags = v20;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v19;

  }
}

- (BOOL)_shouldCrossFadeBottomBars
{
  id WeakRetained;
  char v5;

  if (-[UINavigationController _isUsingBuiltinAnimator](self, "_isUsingBuiltinAnimator")
    && -[_UINavigationControllerVisualStyle isUsingParallaxTransition](self->_visualStyle, "isUsingParallaxTransition"))
  {
    return 0;
  }
  if (-[_UIViewControllerTransitionConductor shouldCrossFadeBottomBars](self->_transitionConductor, "shouldCrossFadeBottomBars"))
  {
    return 1;
  }
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x4000000) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "_navigationControllerShouldCrossFadeBottomBars:", self);

  return v5;
}

- (BOOL)_isUsingBuiltinAnimator
{
  return self->__usingBuiltinAnimator;
}

- (BOOL)_shouldBottomBarBeHidden
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UINavigationController bottomViewController](self, "bottomViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hidesBottomBarWhenPushed") & 1) != 0)
        {

          v11 = 1;
          goto LABEL_12;
        }
        if (v10 == v3)
          goto LABEL_10;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_10:

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "_suppressesBottomBar");
LABEL_12:

  return v11;
}

- (id)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController")
    && (-[UINavigationController bottomViewController](self, "bottomViewController"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationController;
    -[UIViewController navigationItem](&v7, sel_navigationItem);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (UIViewController)bottomViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x3000000000000) != 0
    && (-[UINavigationController disappearingViewController](self, "disappearingViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4 == v5))
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v7 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
LABEL_6:

LABEL_8:
  return (UIViewController *)v7;
}

- (double)durationForTransition:(int)a3
{
  uint64_t v3;
  double result;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  if (-[UINavigationController isCustomTransition](self, "isCustomTransition"))
  {
    -[_UIViewControllerTransitionConductor customNavigationTransitionDuration](self->_transitionConductor, "customNavigationTransitionDuration");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UINavigationController;
    -[UIViewController durationForTransition:](&v6, sel_durationForTransition_, v3);
  }
  return result;
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  _BOOL8 v4;
  _UINavigationControllerPalette *v8;
  void *v9;
  UINavigationController *v10;
  UINavigationController *v11;
  void *v12;
  void *v13;
  uint64_t navigationControllerFlags;
  uint64_t v15;
  _UINavigationControllerPalette *topPalette;
  _UINavigationControllerPalette **p_topPalette;
  _UINavigationControllerPalette *freePalette;
  _UINavigationControllerPalette *v19;
  _BOOL4 v20;
  double v21;
  _BOOL4 v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _UINavigationControllerPalette *v29;

  v4 = a4;
  v29 = (_UINavigationControllerPalette *)a3;
  if (_UIGetBarNavigationPaletteEnabled())
  {
    v8 = v29;
    -[_UINavigationControllerPalette setPinned:](v8, "setPinned:", v4);
    -[UINavigationController topViewController](self, "topViewController");
    self = (UINavigationController *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setBottomPalette:", v8);

LABEL_3:
    goto LABEL_8;
  }
  if (!v29)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise:format:", v26, CFSTR("%@ requires a non-nil palette as its first argument!"), v27);

  }
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v10 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v10 != self)
  {
    v11 = v10;
    -[UINavigationController attachPalette:isPinned:](v10, "attachPalette:isPinned:", v29, v4);
    self = v11;
    goto LABEL_8;
  }
  -[UINavigationController navigationBar](self, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || (navigationControllerFlags = (uint64_t)self->_navigationControllerFlags,
        (navigationControllerFlags & 0x800000000000) != 0))
  {

  }
  else
  {

    if ((navigationControllerFlags & 0x8000) == 0)
    {
      NSLog(CFSTR("Warning attempt to a attach %@ to a navigation controller whose navigation bar is not in the view hierarchy!"), v29);
      goto LABEL_8;
    }
  }
  v15 = -[_UINavigationControllerPalette boundaryEdge](v29, "boundaryEdge");
  if (v15)
  {
    if (v15 != 5 && v15 != 2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Palettes currently can only have a top boundary edge or no boundary edge"), v28);
      goto LABEL_33;
    }
    topPalette = self->_topPalette;
    if (!topPalette || topPalette == v29)
    {
      if (topPalette == v29)
      {
        -[UINavigationDeferredTransitionContext incomingTopPalette](self->_deferredTransitionContext, "incomingTopPalette");
        v19 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();

        if (v19 != v29)
          goto LABEL_8;
      }
    }
    else
    {
      if ((*(_QWORD *)&self->_navigationControllerFlags & 8) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Only one palette with a top boundary edge can be active outside of a transition. Current active palette is %@"), self->_topPalette);
        goto LABEL_33;
      }
      if (-[_UINavigationControllerPalette isPinned](topPalette, "isPinned"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attaching a new palette while transitioning from a pinned palette makes no sense"));
      objc_storeStrong((id *)&self->_transitioningTopPalette, self->_topPalette);
    }
    p_topPalette = &self->_topPalette;
  }
  else
  {
    p_topPalette = &self->_freePalette;
    freePalette = self->_freePalette;
    if (freePalette && freePalette != v29)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Only one palette with no boundary edge can be active. Current active palette is %@"), self->_freePalette);
      goto LABEL_33;
    }
    if (freePalette == v29)
      goto LABEL_8;
  }
  objc_storeStrong((id *)p_topPalette, a3);
LABEL_33:
  v20 = -[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden");
  v21 = 0.0;
  if (v20)
    -[UINavigationController _statusBarHeightForCurrentInterfaceOrientation](self, "_statusBarHeightForCurrentInterfaceOrientation", 0.0);
  -[_UINavigationControllerPalette _resetConstraintConstants:](v29, "_resetConstraintConstants:", v21);
  -[UIView setAlpha:](v29, "setAlpha:", 1.0);
  -[_UINavigationControllerPalette _setAttached:didComplete:](v29, "_setAttached:didComplete:", 1, 0);
  -[UINavigationController _frameForPalette:](self, "_frameForPalette:", v29);
  -[_UINavigationControllerPalette setFrame:](v29, "setFrame:");
  v22 = -[_UINavigationControllerPalette _restartPaletteTransitionIfNecessary](self->_topPalette, "_restartPaletteTransitionIfNecessary");
  v23 = v22;
  if ((*(_QWORD *)&self->_navigationControllerFlags & 8) != 0
    || v22
    || v20 && !-[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](v29, "isVisibleWhenPinningBarIsHidden"))
  {
    -[_UINavigationControllerPalette _setAttached:didComplete:](v29, "_setAttached:didComplete:", 1, 1);
  }
  else
  {
    -[UINavigationController _installPaletteIntoViewHierarchy:](self, "_installPaletteIntoViewHierarchy:", v29);
    -[_UINavigationControllerPalette _setAttached:didComplete:](v29, "_setAttached:didComplete:", 1, 1);
    -[UINavigationController topViewController](self, "topViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v24);

  }
  -[_UINavigationControllerPalette setPinned:](v29, "setPinned:", v4);
  if (-[_UINavigationControllerPalette boundaryEdge](v29, "boundaryEdge") == 5)
    -[UINavigationController _updateBarsForCurrentInterfaceOrientation](self, "_updateBarsForCurrentInterfaceOrientation");
  if (v23)
  {
    -[UIViewController transitionCoordinator](self, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _startPaletteTransitionIfNecessary:animated:](self, "_startPaletteTransitionIfNecessary:animated:", v9, 0);
    goto LABEL_3;
  }
LABEL_8:

}

- (void)_updateControlledViewsToFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  -[UIViewController _updateControlledViewsToFrame:](&v4, sel__updateControlledViewsToFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UINavigationController _frameForPalette:](self, "_frameForPalette:", self->_topPalette);
  -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:");
}

- (CGRect)_frameForPalette:(id)a3
{
  id v4;
  uint64_t v5;
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
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(v4, "boundaryEdge");
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (v5)
  {
    if (v5 == 5)
    {
      v7 = 0.0;
      v9 = 0.0;
      if (-[UINavigationController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar"))
      {
        -[UINavigationController _statusBarHeightAdjustmentForCurrentOrientation](self, "_statusBarHeightAdjustmentForCurrentOrientation");
        v9 = v19;
      }
      if ((*(_QWORD *)&self->_navigationControllerFlags & 1) != 0)
      {
        -[UINavigationController _widthForLayout](self, "_widthForLayout");
        v11 = v22;
      }
      else
      {
        -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frame");
        v11 = v21;

      }
    }
    else if (v5 == 2)
    {
      v9 = 0.0;
      if (-[UINavigationController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar"))
      {
        -[UINavigationController _statusBarHeightAdjustmentForCurrentOrientation](self, "_statusBarHeightAdjustmentForCurrentOrientation");
        v9 = v14;
      }
      if ((*(_QWORD *)&self->_navigationControllerFlags & 1) != 0)
      {
        -[UINavigationController _widthForLayout](self, "_widthForLayout");
        v11 = v23;
      }
      else
      {
        -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v11 = v16;
        v18 = v17;

        v9 = v9 + v18;
      }
      v7 = 0.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Palettes currently can only have a top boundary edge or no boundary edge"));
    }
  }
  v24 = v7;
  v25 = v9;
  v26 = v11;
  v27 = v13;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
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
  double v17;
  double v18;
  UIEdgeInsets result;

  v6 = a3;
  if (objc_msgSend(v6, "_isNestedNavigationController"))
  {
    *a4 = 1;
    -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
  }
  else
  {
    -[UINavigationController _calculateEdgeInsetsForChildViewController:insetsAreAbsolute:](self, "_calculateEdgeInsetsForChildViewController:insetsAreAbsolute:", v6, a4);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)viewDidLayoutSubviews
{
  _BOOL4 v3;
  char v4;
  char v5;
  char v6;

  v3 = -[UINavigationController _shouldInteractivePopGestureBeEnabled](self, "_shouldInteractivePopGestureBeEnabled");
  v4 = *((_BYTE *)&self->_navigationControllerFlags + 8);
  if (((v3 ^ ((v4 & 4) == 0)) & 1) == 0)
  {
    v5 = v4 & 0xFB;
    if (v3)
      v6 = 4;
    else
      v6 = 0;
    *(_QWORD *)&self->_navigationControllerFlags = self->_navigationControllerFlags;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v5 | v6;
    -[UIViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](self, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
  }
}

- (BOOL)_shouldInteractivePopGestureBeEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v12;

  -[UINavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state")
    && !-[UINavigationController _isCurrentTransitionPreemptable](self, "_isCurrentTransitionPreemptable"))
  {
    v10 = 0;
    goto LABEL_16;
  }
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchDisplayController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_searchControllerIfAllowed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden")
    && !-[UINavigationController _allowsInteractivePopWhenNavigationBarHidden](self, "_allowsInteractivePopWhenNavigationBarHidden")&& !objc_msgSend(v6, "_allowsInteractivePopWhenNavigationBarHidden")|| objc_msgSend(v5, "isActive") && (objc_msgSend(v5, "isNavigationBarHidingEnabled") & 1) != 0|| objc_msgSend(v7, "isActive")&& (objc_msgSend(v7, "_hidesNavigationBarDuringPresentationRespectingInlineSearch") & 1) != 0|| (objc_msgSend(v6, "hidesBackButton") & 1) != 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(v6, "leftBarButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {

    goto LABEL_18;
  }
  v9 = objc_msgSend(v6, "leftItemsSupplementBackButton");

  if (v9)
  {
LABEL_18:
    -[UINavigationController previousViewController](self, "previousViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 != 0;

    goto LABEL_14;
  }
LABEL_13:
  v10 = 0;
LABEL_14:

LABEL_16:
  return v10;
}

- (UIViewController)previousViewController
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3 < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndex:", v3 - 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIViewController *)v4;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "preferredScreenEdgesDeferringSystemGestures");

  if ((*((_BYTE *)&self->_navigationControllerFlags + 8) & 4) != 0)
  {
    -[UIViewController _existingView](self, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_shouldReverseLayoutDirection");

    v8 = 2;
    if (v7)
      v8 = 8;
    v5 |= v8;
  }
  return v5;
}

- (BOOL)_navigationBarLayoutIsInInteractiveScroll
{
  return self->_interactiveScrollActive;
}

- (void)_navigationItemDidUpdateSearchController:(id)a3 oldSearchController:(id)a4
{
  id v6;
  UINavigationController *v7;
  UINavigationController *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 != self)
    -[UINavigationController _navigationItemDidUpdateSearchController:oldSearchController:](v7, "_navigationItemDidUpdateSearchController:oldSearchController:", v11, v6);
  -[UINavigationController topViewController](self, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {
    -[UINavigationController _setDefinesPresentationContextIfNecessaryForViewController:](self, "_setDefinesPresentationContextIfNecessaryForViewController:", v9);
    -[UIView setNeedsLayout](self->_navigationTransitionView, "setNeedsLayout");
    -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
  }

}

- (void)_updateScrollViewFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  UILayoutContainerView *containerView;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  UILayoutContainerView *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  -[UINavigationController _ensureToViewControllersViewIsLoaded:](self, "_ensureToViewControllersViewIsLoaded:", v6);
  objc_msgSend(v29, "_contentOrObservableScrollViewForEdge:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    containerView = self->_containerView;
    objc_msgSend(v7, "center");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v8, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](containerView, "convertPoint:fromView:", v14, v11, v13);
    v16 = v15;

  }
  else
  {
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  objc_msgSend(v6, "_contentOrObservableScrollViewForEdge:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v8
    || dyld_program_sdk_at_least()
    && (objc_msgSend(v6, "view"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "window"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    *(_QWORD *)&self->_navigationControllerFlags |= 0x1000000000uLL;
  }
  -[UINavigationController _layoutViewController:](self, "_layoutViewController:", v6);
  *(_QWORD *)&self->_navigationControllerFlags &= ~0x1000000000uLL;
  if (v8)
  {
    v20 = self->_containerView;
    objc_msgSend(v8, "center");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v8, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](v20, "convertPoint:fromView:", v25, v22, v24);
    v27 = v26;

    objc_msgSend(v29, "_setNavigationControllerContentOffsetAdjustment:", v27 - v16 + v27 - v16);
  }
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v6, 1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:](self, "_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:", v28);

}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _UIViewControllerTransitionConductor *transitionConductor;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  if ((*(_QWORD *)&self->_navigationControllerFlags & 2) != 0)
  {
    v4 = a4;
    transitionConductor = self->_transitionConductor;
    v7 = a3;
    v8 = -[_UIViewControllerTransitionConductor shouldAnimateBottomBarVisibility](transitionConductor, "shouldAnimateBottomBarVisibility") & v4;
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toolbarItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setItems:animated:", v9, v8);
  }
}

- (BOOL)_isLayingOutTopViewController
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 54) & 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UINavigationController;
  -[UIViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    if (-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition"))
    {
      -[UIViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLayout");

    }
    if (objc_msgSend(v6, "_isHostedInAnotherProcess"))
      -[UINavigationController _setPositionBarsExclusivelyWithSafeArea:](self, "_setPositionBarsExclusivelyWithSafeArea:", 1);
  }

}

- (void)_calculateTopViewFramesFromLayoutHeightsWithViewController:(id)a3 contentScrollView:(id)a4 preservingContentInset:(BOOL)a5 respectFullExtension:(BOOL)a6 gettingNavBarFrame:(CGRect *)a7 topPaletteFrame:(CGRect *)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  int v29;
  int v30;
  double v31;
  void *v32;
  int v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void **v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  uint64_t i;
  void *v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  void *v69;
  void *v70;
  uint64_t v71;
  double v72;
  _UINavigationControllerPalette *topPalette;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat MaxY;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  _UINavigationControllerPalette *v82;
  _UINavigationControllerPalette *v83;
  unint64_t v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  CGRect *v94;
  void *v95;
  CGFloat rect;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  void *v107;
  uint64_t v108;
  CGRect v109;
  CGRect v110;

  v10 = a6;
  v11 = a5;
  v108 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  -[UINavigationController _widthForLayout](self, "_widthForLayout");
  v17 = v16;
  if ((objc_msgSend(v14, "_isNestedNavigationController") & 1) != 0)
  {
    objc_msgSend(v14, "navigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topItem");
    v19 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "navigationItem");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)v19;
  -[UINavigationBar _layoutHeightsForNavigationItem:fittingWidth:](self->_navigationBar, "_layoutHeightsForNavigationItem:fittingWidth:", v19, v17);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UINavigationController _topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:](self, "_topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:", v14);
  v27 = v26;
  v28 = -[UINavigationController _interactiveScrollActive](self, "_interactiveScrollActive");
  if (v15)
    v29 = objc_msgSend(v15, "_hasContentForBarInteractions");
  else
    v29 = 0;
  v30 = (v28 | v29) & v11;
  v97 = v15;
  rect = v17;
  if (v30 == 1)
  {
    v31 = _possibleTopViewsHeightBasedOnContentOffsetForScrollView(self, v15);
    if (v31 == 0.0)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "_isNavigationController");

      if (v33)
      {
        -[UIView bounds](self->_navigationBar, "bounds");
        v31 = v27 + CGRectGetHeight(v109);
      }
      else
      {
        v31 = v23 + v27;
      }
    }
  }
  else
  {
    v31 = v25 + v27;
  }
  v34 = 0.0;
  if (self->_topPalette)
    v34 = v27;
  v35 = v31 - v34;
  v36 = v23 - (v31 - v34);
  if (v36 < 0.05)
    v21 = v23;
  if ((v30 & v10) == 1)
  {
    v37 = v98;
    if (v25 <= v23 || v36 >= 0.05)
    {
      v25 = v21;
    }
    else
    {
      v36 = v25 - v35;
      if (v25 - v35 >= 0.05)
      {
        v94 = a8;
        -[UINavigationBar _stack](self->_navigationBar, "_stack", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController viewControllers](self, "viewControllers");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

        -[UINavigationController topViewController](self, "topViewController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "_isNestedNavigationController");

        if (v42)
        {
          -[UINavigationController topViewController](self, "topViewController");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "viewControllers");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "count");

          v46 = v45 != 0;
          v47 = v45 - 1;
          v37 = v98;
          if (!v46)
            v47 = 0;
          v40 += v47;
        }
        v95 = v38;
        v48 = objc_msgSend(v38, "itemCount");
        v49 = v48 - 1;
        if (v40 != v48 && v40 != v49)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
            {
              -[UINavigationController viewControllers](self, "viewControllers");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "items");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v105 = v90;
              v106 = 2112;
              v107 = v91;
              _os_log_fault_impl(&dword_185066000, v89, OS_LOG_TYPE_FAULT, "Unexpected configuration of navigation stack. viewControllers = %@, stack.items = %@", buf, 0x16u);

            }
            v37 = v98;
          }
          else
          {
            v84 = _calculateTopViewFramesFromLayoutHeightsWithViewController_contentScrollView_preservingContentInset_respectFullExtension_gettingNavBarFrame_topPaletteFrame____s_category;
            if (!_calculateTopViewFramesFromLayoutHeightsWithViewController_contentScrollView_preservingContentInset_respectFullExtension_gettingNavBarFrame_topPaletteFrame____s_category)
            {
              v84 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v84, (unint64_t *)&_calculateTopViewFramesFromLayoutHeightsWithViewController_contentScrollView_preservingContentInset_respectFullExtension_gettingNavBarFrame_topPaletteFrame____s_category);
            }
            v85 = *(NSObject **)(v84 + 8);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              v86 = v85;
              -[UINavigationController viewControllers](self, "viewControllers");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "items");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v105 = v87;
              v106 = 2112;
              v107 = v88;
              _os_log_impl(&dword_185066000, v86, OS_LOG_TYPE_ERROR, "Unexpected configuration of navigation stack. viewControllers = %@, stack.items = %@", buf, 0x16u);

              v37 = v98;
            }
          }
        }
        if (v40 == v49)
        {
          objc_msgSend(v95, "previousBackEntry");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if (v51)
          {
            v53 = v51;
          }
          else
          {
            objc_msgSend(v95, "backEntry");
            v53 = (id)objc_claimAutoreleasedReturnValue();
          }
          v50 = v53;

        }
        else
        {
          objc_msgSend(v95, "topEntry");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v50, "activeLayout");
        v54 = (void **)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarLayout restingHeights](v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v93 = v55;
        objc_msgSend(v55, "reverseObjectEnumerator");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
        if (v57)
        {
          v58 = v57;
          v92 = v50;
          v59 = *(_QWORD *)v100;
          v60 = v35 + 0.05;
          while (2)
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v100 != v59)
                objc_enumerationMutation(v56);
              v62 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
              objc_msgSend(v62, "doubleValue");
              if (v63 <= v60)
              {
                objc_msgSend(v62, "doubleValue");
                v21 = v64;
                goto LABEL_45;
              }
            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
            if (v58)
              continue;
            break;
          }
LABEL_45:
          v37 = v98;
          v50 = v92;
        }

        v25 = v21;
        a8 = v94;
      }
    }
  }
  else
  {
    v25 = v21;
    v37 = v98;
  }
  -[UIView frame](self->_navigationBar, "frame", v36);
  v66 = v65;
  v68 = v67;
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "traitCollection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "userInterfaceIdiom");

    if (v71 == 3)
    {
      -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
      v66 = v72;
    }
  }
  topPalette = self->_topPalette;
  if (topPalette)
  {
    -[UIView frame](topPalette, "frame");
    v75 = v74;
    MaxY = v76;
    v79 = v78;
    v81 = v80;
    v82 = self->_topPalette;
    if (v82)
    {
      -[UINavigationDeferredTransitionContext outgoingTopPalette](self->_deferredTransitionContext, "outgoingTopPalette");
      v83 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();

      if (v82 != v83)
      {
        v110.origin.x = v66;
        v110.origin.y = v68;
        v110.size.width = rect;
        v110.size.height = v25;
        MaxY = CGRectGetMaxY(v110);
        v81 = v27;
      }
    }
  }
  else
  {
    v75 = *MEMORY[0x1E0C9D648];
    MaxY = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v79 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v81 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (a7)
  {
    a7->origin.x = v66;
    a7->origin.y = v68;
    a7->size.width = rect;
    a7->size.height = v25;
  }
  if (a8)
  {
    a8->origin.x = v75;
    a8->origin.y = MaxY;
    a8->size.width = v79;
    a8->size.height = v81;
  }

}

- (double)_topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:(id)a3
{
  id v4;
  _UINavigationControllerPalette *v5;
  double v6;
  id v7;
  _UINavigationControllerPalette *v8;
  double v9;
  void *v11;
  char v12;

  v4 = a3;
  v5 = self->_topPalette;
  v6 = 0.0;
  if (v5)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v4)
    {
      -[UINavigationDeferredTransitionContext outgoingTopPalette](self->_deferredTransitionContext, "outgoingTopPalette");
      v8 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();
      if (v8 == v5)
      {
        -[UINavigationDeferredTransitionContext outgoingTopPalette](self->_deferredTransitionContext, "outgoingTopPalette");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isAttached");

        if ((v12 & 1) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }

      v7 = v4;
    }

LABEL_6:
    -[UIView frame](v5, "frame");
    v6 = v9;
  }
LABEL_7:

  return v6;
}

- ($1AB5FA073B851C12C2339EC22442E995)_heightRangeOfTopViews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _UINavigationControllerPalette *topPalette;
  double v12;
  double v13;
  double v14;
  double v15;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _intrinsicNavigationBarHeightRangeForNavItem:](self, "_intrinsicNavigationBarHeightRangeForNavItem:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;

  topPalette = self->_topPalette;
  if (topPalette)
  {
    -[UIView frame](topPalette, "frame");
    v6 = v6 + v12;
    v8 = v8 + v12;
    v10 = v10 + v12;
  }
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)_updateContainersForStackChange
{
  -[UINavigationController _updateEnclosingSplitViewControllerForStackChange](self, "_updateEnclosingSplitViewControllerForStackChange");
  -[UINavigationController _updateEnclosingTabBarControllerForStackChange](self, "_updateEnclosingTabBarControllerForStackChange");
}

- (void)_updateEnclosingSplitViewControllerForStackChange
{
  id v3;

  if ((*((_BYTE *)&self->_navigationControllerFlags + 8) & 2) == 0)
  {
    -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_navigationControllerDidUpdateStack:", self);

  }
}

- (void)_updateEnclosingTabBarControllerForStackChange
{
  void *v3;
  void *v4;
  id v5;

  if (_UIBarsApplyChromelessEverywhere())
  {
    -[UIViewController tabBarController](self, "tabBarController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_navigationControllerDidUpdateStack:", self);

  }
  -[UINavigationController _managedTabGroup](self, "_managedTabGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UINavigationController _managedTabGroup](self, "_managedTabGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateForManagingNavigationStackChange");

  }
}

- (BOOL)_isCreatedBySplitViewController
{
  return *((_BYTE *)&self->_navigationControllerFlags + 8) & 1;
}

- (id)_targetNavigationBarForUISplitViewControllerSidebarButton
{
  return self->_navigationBar;
}

- (void)_notifyTransitionBegan:(id)a3
{
  id v4;

  objc_msgSend(a3, "toViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_prepareForContainerTransition:", self);

}

- (UIViewController)visibleViewController
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  -[UIViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "visibleViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = v3;
    goto LABEL_5;
  }
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_isNestedNavigationController"))
  {
    objc_msgSend(v5, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    goto LABEL_7;
  }
LABEL_6:
  v6 = v5;
  v7 = v6;
LABEL_7:

  return (UIViewController *)v7;
}

- (void)_viewControllerSubtreeDidGainViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[UINavigationController _handleSubtreeDidGainScrollView:](self, "_handleSubtreeDidGainScrollView:", v4);
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && (void *)v5 != v4)
    -[UINavigationController _handleSubtreeDidGainScrollView:](self, "_handleSubtreeDidGainScrollView:", v5);

}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4
{
  id v6;
  UINavigationController *v7;
  UINavigationController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == self)
  {
    -[UINavigationController _handleSubtreeDidGainScrollView:](self, "_handleSubtreeDidGainScrollView:", v13);
    -[UIViewController _tabBarControllerEnforcingClass:](self, "_tabBarControllerEnforcingClass:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[UIViewController presentingViewController](self, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_tabBarControllerEnforcingClass:", 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "_viewSubtreeDidGainScrollView:enclosingViewController:", v13, v6);

  }
  else
  {
    -[UINavigationController _viewSubtreeDidGainScrollView:enclosingViewController:](v7, "_viewSubtreeDidGainScrollView:enclosingViewController:", v13, v6);
  }

}

- (void)_handleSubtreeDidGainScrollView:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    if (v5 == v12 || v6 == v12)
    {
      if ((objc_msgSend(v5, "_isScrollViewScrollObserver:", self) & 1) == 0)
      {
        if (v5 == v12)
          v10 = 1;
        else
          v10 = 4;
        _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, v10, 1);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "_safeAreaInsetsFrozen");
        if (v9 != v5)
          objc_msgSend(v9, "_setSafeAreaInsetsFrozen:", 1);
        -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v4);
        objc_msgSend(v9, "_setSafeAreaInsetsFrozen:updateForUnfreeze:", v11, 0);
        goto LABEL_18;
      }
      if (v6 && v6 != v5 && (objc_msgSend(v6, "_isScrollViewScrollObserver:", self) & 1) == 0)
      {
        -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v6, v4, 4);
        goto LABEL_19;
      }
      if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1E00000000000000) == 0)
      {
        objc_msgSend(v4, "navigationItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController _updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:](self, "_updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:");

        if (v6)
        {
          if (v6 != v12)
          {
            objc_msgSend(v4, "navigationItem");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            -[UINavigationController _updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:](self, "_updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:", v6, v9, 4);
LABEL_18:

          }
        }
      }
    }
  }
LABEL_19:

}

- (void)_presentationTransitionUnwrapViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  objc_msgSend(v29, "childModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v29;
  if (v3)
  {
    objc_msgSend(v29, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v9, "superview");
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
        if (!v10)
          goto LABEL_6;
      }
      objc_msgSend(v9, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(v29, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

      objc_msgSend(v29, "presentedViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "presentationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "containerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v13, v15, v17, v19);

      objc_msgSend(v29, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:atIndex:", v24, 0);

      objc_msgSend(v29, "presentedViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "containerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:aboveSubview:", v27, v28);

      v11 = v8;
      if (v8 != v9)
      {
        objc_msgSend(v8, "removeFromSuperview");
        v11 = v9;
      }
    }
    else
    {
LABEL_6:
      v11 = 0;
    }

    v4 = v29;
  }

}

- (BOOL)_isViewControllerFullWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "convertRect:toView:", 0);
  v5 = v4;
  v7 = v6;
  -[UINavigationController _window](self, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = v7 > v12 * 0.5 && v10 == v5;
  return v13;
}

- (id)_keyboardAnimationStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;

  -[UINavigationController _transitionAnimationContext](self, "_transitionAnimationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[UINavigationController _isViewControllerFullWidth](self, "_isViewControllerFullWidth"))
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceIdiom");

      v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    }
    else
    {
      v6 = 0;
    }
    +[_UIViewControllerKeyboardAnimationStyle animationStyleWithContext:useCustomTransition:](_UIViewControllerKeyboardAnimationStyle, "animationStyleWithContext:useCustomTransition:", v3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (-[UIViewController _parentViewController]((id *)&self->super.super.super.isa),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) != 0))
    {
      objc_msgSend(v8, "setOutDirection:", 0);
    }
  }
  else
  {
    -[UIViewController _keyboardSceneDelegate](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextAnimationStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_transitionAnimationContext
{
  return -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  -[UIViewController viewDidDisappear:](&v17, sel_viewDidDisappear_);
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x4000000001000) == 0)
  {
    -[UINavigationController _viewControllerForDisappearCallback](self, "_viewControllerForDisappearCallback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((*(_QWORD *)&self->_navigationControllerFlags & 0xF0) != 0)
    {
      objc_msgSend(v5, "_setNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v6, "_setNavigationControllerContentOffsetAdjustment:", 0.0);
    }
    -[UIViewController __viewDidDisappear:]((uint64_t)v6, v3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v12, "_appearState") == 3)
            -[UIViewController __viewDidDisappear:]((uint64_t)v12, v3);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }

    -[UINavigationController setDisappearingViewController:](self, "setDisappearingViewController:", 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UINavigationController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x4000000001000) == 0)
  {
    -[UINavigationController _viewControllerForDisappearCallback](self, "_viewControllerForDisappearCallback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController __viewWillDisappear:]((uint64_t)v5, v3);

  }
}

- (id)_viewControllerForDisappearCallback
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0xF0) != 0x20)
  {
    -[UINavigationController disappearingViewController](self, "disappearingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UINavigationController disappearingViewController](self, "disappearingViewController");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
  }
  return v3;
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
  $16004AA6B36EC19B1B0093A5EF089ED3 *p_navigationControllerFlags;
  char v19;
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
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id location;
  _QWORD block[4];
  id v48;
  UINavigationController *v49;

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
      block[2] = __38__UINavigationController_setDelegate___block_invoke;
      block[3] = &unk_1E16B1B50;
      v8 = v4;
      v48 = v8;
      v49 = self;
      if (setDelegate__once_0 != -1)
      {
        dispatch_once(&setDelegate__once_0, block);
        v8 = v48;
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  v9 = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (WeakRetained != v9 || !v9 && (*(_DWORD *)&self->_navigationControllerFlags & 0x80000000) != 0)
  {
    if (WeakRetained)
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
    objc_storeWeak((id *)&self->_delegate, v9);
    v12 = v9;
    -[UINavigationController delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v15 = -[UINavigationController allowsWeakReference](self, sel_allowsWeakReference);

      v14 = (unint64_t)(v12 != 0) << 31;
      if (v12 && v15)
      {
        objc_initWeak(&location, self);
        v16 = [_UIWeakHelper alloc];
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __38__UINavigationController_setDelegate___block_invoke_226;
        v44[3] = &unk_1E16B3F40;
        objc_copyWeak(&v45, &location);
        v17 = -[_UIWeakHelper initWithDeallocationBlock:](v16, "initWithDeallocationBlock:", v44);
        objc_setAssociatedObject(v12, (char *)&self->super.super.super.isa + 1, v17, (void *)1);

        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);
        v14 = 0x80000000;
      }
    }
    else
    {

      v14 = (unint64_t)(v12 != 0) << 31;
    }

    p_navigationControllerFlags = &self->_navigationControllerFlags;
    v19 = *((_BYTE *)p_navigationControllerFlags + 8);
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFF7FFFFFFFLL | v14;
    *((_BYTE *)p_navigationControllerFlags + 8) = v19;
    v20 = objc_opt_respondsToSelector();
    v21 = 0x80000;
    if ((v20 & 1) == 0)
      v21 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFFF7FFFFLL | v21;
    v22 = objc_opt_respondsToSelector();
    v23 = 0x100000;
    if ((v22 & 1) == 0)
      v23 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFFEFFFFFLL | v23;
    v24 = objc_opt_respondsToSelector();
    v25 = 0x400000;
    if ((v24 & 1) == 0)
      v25 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v25;
    v26 = objc_opt_respondsToSelector();
    v27 = 0x200000;
    if ((v26 & 1) == 0)
      v27 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFFDFFFFFLL | v27;
    v28 = objc_opt_respondsToSelector();
    v29 = 0x1000000;
    if ((v28 & 1) == 0)
      v29 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFEFFFFFFLL | v29;
    v30 = objc_opt_respondsToSelector();
    v31 = 0x800000;
    if ((v30 & 1) == 0)
      v31 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFF7FFFFFLL | v31;
    v32 = objc_opt_respondsToSelector();
    v33 = 0x2000000;
    if ((v32 & 1) == 0)
      v33 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFDFFFFFFLL | v33;
    v34 = objc_opt_respondsToSelector();
    v35 = 0x4000000;
    if ((v34 & 1) == 0)
      v35 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v35;
    v36 = objc_opt_respondsToSelector();
    v37 = 0x8000000;
    if ((v36 & 1) == 0)
      v37 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFF7FFFFFFLL | v37;
    v38 = objc_opt_respondsToSelector();
    v39 = 0x10000000;
    if ((v38 & 1) == 0)
      v39 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFEFFFFFFFLL | v39;
    v40 = objc_opt_respondsToSelector();
    v41 = 0x20000000;
    if ((v40 & 1) == 0)
      v41 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFDFFFFFFFLL | v41;
    v42 = objc_opt_respondsToSelector();
    v43 = 0x40000000;
    if ((v42 & 1) == 0)
      v43 = 0;
    *(_QWORD *)p_navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags & 0xFFFFFFFFBFFFFFFFLL | v43;
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_navigationBar:(id)a3 topItemUpdatedLargeTitleDisplayMode:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v10)
  {
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v7))
    {
      _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 == v8)
        v9 = 5;
      else
        v9 = 1;
      -[UINavigationController _updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:](self, "_updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:", v7, v10, v9);
    }

  }
}

- (void)_navigationBarChangedSize:(id)a3
{
  void *v4;
  void *v5;
  id v7;
  objc_super v8;

  if (self->_interactiveScrollActive)
  {
    -[UINavigationController _topViewControllerObservableScrollViewForEdge:](self, "_topViewControllerObservableScrollViewForEdge:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    -[UINavigationController _reloadCachedInteractiveScrollMeasurements](self, "_reloadCachedInteractiveScrollMeasurements");
    -[UINavigationController _layoutTopViewController](self, "_layoutTopViewController");
    objc_msgSend(v7, "_setAutomaticContentOffsetAdjustmentEnabled:", 1);

  }
  else
  {
    -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout", a3);
    -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateTopViewFramesForViewController:](self, "_updateTopViewFramesForViewController:", v4);
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v5, v4, 1);

    if (self->_externallySetNavControllerPreferredContentSize.width == *MEMORY[0x1E0C9D820]
      && self->_externallySetNavControllerPreferredContentSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[UINavigationController _setPreferredContentSizeFromChildContentContainer:](self, "_setPreferredContentSizeFromChildContentContainer:", v4);
    }
    else
    {
      -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:");
      v8.receiver = self;
      v8.super_class = (Class)UINavigationController;
      -[UIViewController setPreferredContentSize:](&v8, sel_setPreferredContentSize_);
    }

  }
}

- (void)_setPreferredContentSizeFromChildContentContainer:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v4, "preferredContentSize");
    v7 = v6;
    v9 = v8;
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    -[UIViewController preferredContentSize](&v13, sel_preferredContentSize);
    if (v7 > 0.0)
      v10 = v7;
    if (v9 > 0.0)
      -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:", v10, v9);
    v12.receiver = self;
    v12.super_class = (Class)UINavigationController;
    -[UIViewController setPreferredContentSize:](&v12, sel_setPreferredContentSize_);
    self->_externallySetNavControllerPreferredContentSize = (CGSize)*MEMORY[0x1E0C9D820];
    v11.receiver = self;
    v11.super_class = (Class)UINavigationController;
    -[UIViewController preferredContentSizeDidChangeForChildContentContainer:](&v11, sel_preferredContentSizeDidChangeForChildContentContainer_, self);
  }

}

- (CGSize)_adjustedContentSizeForPopover:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((*(_DWORD *)&self->_navigationControllerFlags & 1) == 0)
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UINavigationController navigationBar](self, "navigationBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      height = height + v8;

    }
  }
  if ((*(_QWORD *)&self->_navigationControllerFlags & 2) != 0)
  {
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UINavigationController toolbar](self, "toolbar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      height = height + v11;

    }
  }
  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UINavigationController _preferredContentSizeForcingLoad:](self, "_preferredContentSizeForcingLoad:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_preferredContentSizeForcingLoad:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UINavigationController;
  -[UIViewController preferredContentSize](&v18, sel_preferredContentSize);
  v7 = v6;
  v8 = v5;
  if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v3)
      {
        objc_msgSend(v11, "view");

      }
      objc_msgSend(v12, "preferredContentSize");
      v7 = fmax(v14, v7);
      if (v13 == 0.0)
      {
        v8 = fmax(v13, v8);
      }
      else
      {
        -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:", v7);
        v8 = v15;
      }

    }
  }
  v16 = v7;
  v17 = v8;
  result.height = v17;
  result.width = v16;
  return result;
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "toolbar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v6);

  objc_msgSend(v6, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "_positionToolbarHidden:edge:crossFade:", 1, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v6, "setHidden:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateToolbarItemsFromViewController:animated:", v5, 0);

}

uint64_t __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_forwardPaletteToViewControllerIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (_UIGetBarNavigationPaletteEnabled())
  {
    -[UINavigationController disappearingViewController](self, "disappearingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_bottomPalette");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isPinned"))
    {
      objc_msgSend(v8, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setBottomPalette:", v6);

    }
  }

}

- (void)_updateInteractivePopGestureEnabledState
{
  unint64_t v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  int v13;
  void *v14;

  if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController")
    || -[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
    {
      v3 = -[UIViewController childViewControllersCount](self, "childViewControllersCount");
      v4 = v3 < 2;
      v5 = v3 > 1;
      -[UINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", v5);

      -[UIViewController navigationController](self, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "interactivePopGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEnabled:", v4);

    }
    else
    {
      v9 = -[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers");
      v10 = v14;
      if (!v9)
        goto LABEL_13;
      v11 = !objc_msgSend(v14, "_isNestedNavigationController")
         || (unint64_t)((unint64_t)objc_msgSend(v14, "childViewControllersCount") < 2);
      -[UINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnabled:", v11);

      v13 = objc_msgSend(v14, "_isNestedNavigationController");
      v10 = v14;
      if (!v13)
        goto LABEL_13;
      objc_msgSend(v14, "interactivePopGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", v11 ^ 1);
    }

    v10 = v14;
LABEL_13:

  }
}

- (id)_navigationItemsCallingPublicAccessor:(BOOL)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
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
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
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
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (a3)
          objc_msgSend(v11, "navigationItem");
        else
          objc_msgSend(v11, "_navigationItemCreatingDefaultIfNotSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((dyld_program_sdk_at_least() & 1) != 0 || v12)
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  -[UINavigationController topViewController](self, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "_isNestedNavigationController"))
  {
    v14 = v13;
    objc_msgSend(v14, "_outermostNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v16)
    {
      objc_msgSend(v14, "_navigationItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
            if ((objc_msgSend(v5, "containsObject:", v22) & 1) == 0)
              objc_msgSend(v5, "addObject:", v22);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v19);
      }

    }
  }

  return v5;
}

- (id)_navigationItems
{
  return -[UINavigationController _navigationItemsCallingPublicAccessor:](self, "_navigationItemsCallingPublicAccessor:", 1);
}

- (id)_screenEdgePanGestureRecognizer
{
  void *v2;
  void *v3;

  -[_UINavigationControllerVisualStyle interactionController](self->_visualStyle, "interactionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "screenEdgePanGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_resetBottomBarHiddenState
{
  *(_QWORD *)&self->_navigationControllerFlags &= ~0x400uLL;
}

- (void)_updateBottomBarHiddenState
{
  -[UINavigationController _hideOrShowBottomBarIfNeededWithTransition:](self, "_hideOrShowBottomBarIfNeededWithTransition:", 0);
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (UINavigationController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  UINavigationController *v4;
  UINavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, nibNameOrNil, nibBundleOrNil);
  v5 = v4;
  if (v4)
    -[UINavigationController _commonNonCoderInit](v4, "_commonNonCoderInit");
  return v5;
}

- (UINavigationController)initWithRootViewController:(UIViewController *)rootViewController
{
  UIViewController *v4;
  UINavigationController *v5;
  UINavigationController *v6;
  objc_super v8;

  v4 = rootViewController;
  if (dyld_program_sdk_at_least())
  {
    v8.receiver = self;
    v8.super_class = (Class)UINavigationController;
    v5 = -[UIViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  }
  else
  {
    v5 = -[UINavigationController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  }
  v6 = v5;
  if (v5)
  {
    if (dyld_program_sdk_at_least())
      -[UINavigationController _commonNonCoderInit](v6, "_commonNonCoderInit");
    -[UINavigationController pushViewController:animated:](v6, "pushViewController:animated:", v4, 0);
  }

  return v6;
}

- (UINavigationController)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
  UINavigationController *v7;
  UINavigationController *v8;
  objc_super v10;

  if (dyld_program_sdk_at_least())
  {
    v10.receiver = self;
    v10.super_class = (Class)UINavigationController;
    v7 = -[UIViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  }
  else
  {
    v7 = -[UINavigationController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  }
  v8 = v7;
  if (v7)
  {
    if (dyld_program_sdk_at_least())
      -[UINavigationController _commonNonCoderInit](v8, "_commonNonCoderInit");
    -[UINavigationController setNavigationBarClass:](v8, "setNavigationBarClass:", navigationBarClass);
    -[UINavigationController _setToolbarClass:](v8, "_setToolbarClass:", toolbarClass);
  }
  return v8;
}

- (void)_commonInitWithBuiltinTransitionGap:(double)a3
{
  int v5;
  uint64_t v6;
  UINavigationController *v7;
  BOOL v8;
  _UIViewControllerTransitionConductor *v9;
  _UIViewControllerTransitionConductor *transitionConductor;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  char isKindOfClass;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  self->_navigationBarClass = (Class)objc_opt_class();
  *(_QWORD *)&self->super._viewControllerFlags = *(_QWORD *)&self->super._viewControllerFlags & 0xFFFFFFFFFFEFFBFFLL | 0x400;
  self->_builtinTransitionGap = a3;
  *(_QWORD *)&self->_navigationControllerFlags &= ~0x4000000000uLL;
  v5 = dyld_program_sdk_at_least();
  v6 = 0x8000000000;
  if (!v5)
    v6 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v6;
  if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_91, (uint64_t)CFSTR("PositionBarsExclusivelyWithSafeArea")) & 1) == 0
    && !byte_1EDDA7EDC)
  {
    goto LABEL_9;
  }
  v7 = self;
  if (qword_1EDDB0F38 != -1)
    dispatch_once(&qword_1EDDB0F38, &__block_literal_global_1605);
  if (byte_1EDDB0E51)
  {

LABEL_9:
    v8 = (byte_1EDDA7EE4 != 0) & ~_UIInternalPreferenceUsesDefault_0(&dword_1EDDA7EE0, (uint64_t)CFSTR("ForcePositionBarsExclusivelyWithSafeArea"));
    goto LABEL_10;
  }
  if (qword_1EDDB0F30)
  {
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  v8 = 1;
LABEL_10:
  self->__positionBarsExclusivelyWithSafeArea = v8;
  v9 = -[_UIViewControllerTransitionConductor initWithDelegate:transitionManager:]([_UIViewControllerTransitionConductor alloc], "initWithDelegate:transitionManager:", self, self->_transitionManager);
  transitionConductor = self->_transitionConductor;
  self->_transitionConductor = v9;

  -[_UIViewControllerTransitionConductor setNeedsDeferredTransition:](self->_transitionConductor, "setNeedsDeferredTransition:", -[UIViewController childViewControllersCount](self, "childViewControllersCount") != 0);
  -[_UIViewControllerTransitionConductor setDeferredTransitionType:](self->_transitionConductor, "setDeferredTransitionType:", 0);
  if (!qword_1EDDB0E58)
  {
    qword_1EDDB0E58 = +[UINavigationController instanceMethodForSelector:](UINavigationController, "instanceMethodForSelector:", sel_navigationBar);
    qword_1EDDB0E60 = +[UINavigationController instanceMethodForSelector:](UINavigationController, "instanceMethodForSelector:", sel_toolbar);
  }
  v11 = -[UINavigationController methodForSelector:](self, "methodForSelector:", sel_navigationBar);
  if (v11)
  {
    if (v11 != qword_1EDDB0E58)
    {
      -[UINavigationController navigationBar](self, "navigationBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An override of -[UINavigationController navigationBar] is returning an object that is not a kind of UINavigationBar"));
    }
  }
  v14 = -[UINavigationController methodForSelector:](self, "methodForSelector:", sel_toolbar);
  if (v14)
  {
    if (v14 != qword_1EDDB0E60)
    {
      -[UINavigationController toolbar](self, "toolbar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An override of -[UINavigationController toolbar] is returning an object that is not a kind of UIToolbar"));
    }
  }
  v20[0] = 0x1E1A99498;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIViewController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v17, self, sel__userInterfaceIdiomChanged);

}

- (void)_commonNonCoderInit
{
  self->super._modalTransitionStyle = -1;
  -[UINavigationController _commonInitWithBuiltinTransitionGap:](self, "_commonInitWithBuiltinTransitionGap:", 20.0);
}

- (void)setNavigationBarClass:(Class)a3
{
  objc_class *v6;
  void *v7;
  void *v8;

  v6 = (objc_class *)objc_opt_class();
  if (a3)
  {
    if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 2588, CFSTR("%@ is not a subclass of UINavigationBar"), v8);

    }
  }
  else
  {
    a3 = v6;
  }
  self->_navigationBarClass = a3;
}

- (void)_setToolbarClass:(Class)a3
{
  void *v6;
  void *v7;

  if (a3 && (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 572, CFSTR("%@ is not a subclass of UIToolbar"), v7);

  }
  self->_toolbarClass = a3;
}

void __54__UINavigationController_setViewControllers_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  unsigned int v28;
  unsigned int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableChildViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

    if (!v7)
      goto LABEL_5;
  }
  if (!objc_msgSend(v5, "count"))
    goto LABEL_5;
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

  if ((v11 & 1) == 0)
  {
LABEL_5:
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "mutableChildViewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "_transitionForOldViewControllers:newViewControllers:", v13, v5);

    v15 = v5;
    v16 = objc_msgSend(v15, "count");
    if (v16)
    {
      v17 = v16;
      v28 = v14;
      v29 = a3;
      v18 = 0;
      v19 = 0;
      do
      {
        v20 = v17--;
        objc_msgSend(v15, "objectAtIndex:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "useLayoutToLayoutNavigationTransitions"))
        {
          if (v19)
          {
            objc_msgSend(v19, "addIndex:", v17);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v18, "addObject:", v19);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v19);
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        else if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v19, "addIndex:", v17);
          }
          else
          {
            objc_msgSend(v15, "objectAtIndex:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_setUseLayoutToLayoutNavigationTransitions:withCheck:", 0, 0);
            objc_msgSend(v19, "addIndex:", v20);

          }
          v19 = 0;
        }

      }
      while (v17);
      if (v19)
      {
        objc_msgSend(v15, "objectAtIndex:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_setUseLayoutToLayoutNavigationTransitions:withCheck:", 0, 0);
        objc_msgSend(v19, "addIndex:", 0);

      }
      a3 = v29;
      if (v18)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v18 = v18;
        v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v31 != v26)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(a1 + 32), "_prepareCollectionViewControllers:forSharingInRange:", v15, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
            }
            v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v25);
        }

      }
      v14 = v28;
    }
    else
    {

      v18 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_setViewControllers:transition:animated:", v15, v14, a3);

  }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  _BOOL8 v4;
  UIViewController *v6;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  uint8_t buf[4];
  UINavigationController *v17;
  __int16 v18;
  UIViewController *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = animated;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = viewController;
  if (qword_1EDDB0F58 != -1)
    dispatch_once(&qword_1EDDB0F58, &__block_literal_global_1624);
  if (byte_1EDDB0E54)
  {
    v7 = qword_1EDDB0EC0;
    if (!qword_1EDDB0EC0)
    {
      v7 = __UILogCategoryGetNode("NavigationControllerVerboseLoggingForStrictRepeatedPushAssertion", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1EDDB0EC0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v4)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = (void *)MEMORY[0x1E0CB3978];
      v11 = v8;
      objc_msgSend(v10, "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "-pushViewController:animated: sent to %@ passing %@, animated = %@,\n%@", buf, 0x2Au);

    }
  }
  v13 = -[UINavigationController _effectiveTransitionForTransition:](self, "_effectiveTransitionForTransition:", v4);
  if (-[UIViewController useLayoutToLayoutNavigationTransitions](v6, "useLayoutToLayoutNavigationTransitions"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to push collection view controller %@ on %@ with layout to layout transitions but the top view controller is not a UICollectionViewController!"), v6, self);
  }
  if (-[UIViewController useLayoutToLayoutNavigationTransitions](v6, "useLayoutToLayoutNavigationTransitions"))
    -[UINavigationController _prepareCollectionViewControllerForSharing:](self, "_prepareCollectionViewControllerForSharing:", v6);
  -[UINavigationController pushViewController:transition:forceImmediate:](self, "pushViewController:transition:forceImmediate:", v6, v13, +[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions") ^ 1);

}

- (int)_transitionForOldViewControllers:(id)a3 newViewControllers:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;

  v6 = a3;
  objc_msgSend(a4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UINavigationController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  objc_msgSend(v7, "_existingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) != 0 || (v8 & 1) != 0 || !v9)
  {
    if (!v9)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    -[UIViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  }
  if (!-[UIViewController isViewLoaded](self, "isViewLoaded"))
    goto LABEL_8;
  -[UIViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

LABEL_9:
  objc_msgSend(v6, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v12 && (v11 & 1) != 0)
  {
    v13 = 0;
  }
  else if (objc_msgSend(v6, "containsObject:", v7) ^ 1 | v11)
  {
    v13 = 1;
  }
  else
  {
    v13 = 2;
  }

  return v13;
}

- (void)pushViewController:(id)a3 transition:(int)a4 forceImmediate:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t navigationControllerFlags;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  id *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  char v29;
  _QWORD aBlock[4];
  id v31;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (-[UINavigationController _sanityCheckPushViewController:transition:forceImmediate:](self, "_sanityCheckPushViewController:transition:forceImmediate:", v8, v6, v5))
  {
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = objc_claimAutoreleasedReturnValue();

    navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v10)
      v14 = 1;
    else
      v14 = v5;
    if ((navigationControllerFlags & 4) == 0 && v14)
    {
      -[UINavigationController disappearingViewController](self, "disappearingViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {

      }
      else if (!-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition"))
      {
        -[UINavigationController setDisappearingViewController:](self, "setDisappearingViewController:", v13);
      }
    }
    if (v10)
    {
      -[UINavigationController disappearingViewController](self, "disappearingViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      v17 = 0;
      if ((_DWORD)v6 && v16)
      {
        v18 = ((*(_QWORD *)&self->super._viewControllerFlags >> 1) & 3) - 1;
        v10 = v18 < 2;
        if (v18 >= 2)
          v17 = 0;
        else
          v17 = v6;
      }
    }
    else
    {
      v17 = 0;
    }
    v19 = (id *)MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke;
    aBlock[3] = &unk_1E16B2B18;
    v20 = v8;
    v31 = v20;
    v21 = _Block_copy(aBlock);
    v22 = dyld_program_sdk_at_least();
    v26 = v12;
    v23 = (void *)v13;
    if ((v22 & 1) != 0)
    {
      v24 = 0;
    }
    else
    {
      v27[0] = v19;
      v27[1] = 3221225472;
      v27[2] = __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke_2;
      v27[3] = &unk_1E16B4008;
      v24 = v27;
      v27[4] = self;
      v19 = &v28;
      v28 = v20;
      v29 = v10;
    }
    v25 = _Block_copy(v24);
    -[UINavigationController _applyViewControllers:transition:animated:operation:rescheduleBlock:](self, "_applyViewControllers:transition:animated:operation:rescheduleBlock:", v21, v17, v10, 1, v25);
    if ((_DWORD)v10)
      -[UINavigationController _playPushNavigationSound](self, "_playPushNavigationSound");

    if ((v22 & 1) == 0)
  }

}

- (void)setNeedsDeferredTransition:(BOOL)a3
{
  _BOOL8 v3;
  UINavigationController *v5;
  UINavigationController *v6;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = a3;
  if (-[UINavigationController allowsWeakReference](self, sel_allowsWeakReference))
    v5 = self;
  else
    v5 = 0;
  v6 = v5;
  if (-[_UIViewControllerTransitionConductor needsDeferredTransition](self->_transitionConductor, "needsDeferredTransition") != v3&& v6 != 0)
  {
    -[_UIViewControllerTransitionConductor setNeedsDeferredTransition:](self->_transitionConductor, "setNeedsDeferredTransition:", v3);
    if (v3)
    {
      -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
      -[UIView superview](self->_containerView, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView frame](self->_containerView, "frame");
      objc_msgSend(v8, "convertPoint:toView:", 0);
      v10 = v9;

      -[UIView frame](self->_containerView, "frame");
      if (v10 + v11 <= 0.0)
      {
        objc_initWeak(&location, self);
        v12 = (void *)UIApp;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __53__UINavigationController_setNeedsDeferredTransition___block_invoke;
        v13[3] = &unk_1E16B3F40;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v12, "_performBlockAfterCATransactionCommits:", v13);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)setNeedsDeferredTransition
{
  -[UINavigationController setNeedsDeferredTransition:](self, "setNeedsDeferredTransition:", 1);
}

- (void)_propagateContentAdjustmentsForControllersWithSharedViews
{
  void *v3;
  int64_t v4;
  id v5;

  -[UINavigationController disappearingViewController](self, "disappearingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UINavigationController lastOperation](self, "lastOperation");
  if (v4 == 2)
  {
    if (!objc_msgSend(v5, "_usesSharedView"))
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v5, "_navigationControllerContentInsetAdjustment");
    objc_msgSend(v3, "_setNavigationControllerContentInsetAdjustment:");
    objc_msgSend(v5, "_navigationControllerContentOffsetAdjustment");
    objc_msgSend(v3, "_setNavigationControllerContentOffsetAdjustment:");
    goto LABEL_7;
  }
  if (v4 == 1 && (objc_msgSend(v3, "_usesSharedView") & 1) != 0)
    goto LABEL_6;
LABEL_7:

}

- (void)_executeNavigationHandler:(id)a3 deferred:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void (**v7)(void);
  void (**v8)(void);
  void (**v9)(_QWORD);
  void *v10;
  void (**v11)(_QWORD);

  v4 = a4;
  v11 = (void (**)(_QWORD))a3;
  -[UINavigationController _updateNavigationBarHandler](self, "_updateNavigationBarHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v6)
    {
      -[UINavigationController _updateNavigationBarHandler](self, "_updateNavigationBarHandler");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
    -[UINavigationController _setUpdateNavigationBarHandler:](self, "_setUpdateNavigationBarHandler:", v11);
    goto LABEL_10;
  }
  if (v6)
  {
    -[UINavigationController _updateNavigationBarHandler](self, "_updateNavigationBarHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    -[UINavigationController _setUpdateNavigationBarHandler:](self, "_setUpdateNavigationBarHandler:", v11);

LABEL_10:
    v9 = v11;
    goto LABEL_11;
  }
  v9 = v11;
  if (self->_navigationBar
    || (-[UIViewController _existingView](self, "_existingView"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9 = v11,
        v10))
  {
    v9[2](v9);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_presentationTransitionWrapViewController:(id)a3 forTransitionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _UINavigationPresentationWrapperView *v18;
  _UINavigationPresentationWrapperView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v5 = a4;
  objc_msgSend(v24, "childModalViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v24, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v24, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      +[UIViewControllerWrapperView wrapperViewForView:frame:](v12, v13, v14, v15, (uint64_t)UIViewControllerWrapperView, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setAutoresizingMask:", 18);
      objc_msgSend(v24, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:belowSubview:", v8, v16);

      objc_msgSend(v24, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v17);

    }
    v18 = [_UINavigationPresentationWrapperView alloc];
    objc_msgSend(v8, "bounds");
    v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
    -[UIView setAutoresizingMask:](v19, "setAutoresizingMask:", 18);
    objc_msgSend(v8, "insertSubview:atIndex:", v19, 0);
    objc_msgSend(v24, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v19, "addSubview:", v20);

    objc_msgSend(v24, "presentedViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v19, "addSubview:", v23);

    objc_msgSend(v5, "_setFromView:", v19);
  }

}

- (void)_setViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5
{
  -[UINavigationController _setViewControllers:transition:animated:operation:](self, "_setViewControllers:transition:animated:operation:", a3, *(_QWORD *)&a4, a5, 3);
}

- (void)_setViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  _QWORD v22[6];

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v11, "count");

  if (v13 != v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 1393, CFSTR("All view controllers in a navigation controller must be distinct (%@)"), v11);

  }
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke;
  v22[3] = &unk_1E16C0628;
  v22[4] = self;
  v22[5] = a2;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v22);
  if (!(_DWORD)v8)
  {
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UINavigationController _transitionForOldViewControllers:newViewControllers:](self, "_transitionForOldViewControllers:newViewControllers:", v16, v11);

  }
  aBlock[0] = v15;
  aBlock[1] = 3221225472;
  aBlock[2] = __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke_2;
  aBlock[3] = &unk_1E16B2B18;
  v21 = v11;
  v17 = v11;
  v18 = _Block_copy(aBlock);
  -[UINavigationController _applyViewControllers:transition:animated:operation:rescheduleBlock:](self, "_applyViewControllers:transition:animated:operation:rescheduleBlock:", v18, v8, v7, a6, 0);

}

- (void)updateTitleForViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "indexOfObjectIdenticalTo:", v7))
  {
    objc_msgSend(v7, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setTitle:](self, "setTitle:", v6);

  }
}

- (void)_updatePaletteConstraints
{
  _UINavigationControllerPalette *topPalette;
  void *v4;
  void *v5;
  char v6;
  id v7;

  topPalette = self->_topPalette;
  if (topPalette)
  {
    -[_UINavigationControllerPalette _constraints](topPalette, "_constraints");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[_UINavigationControllerPalette _constraints](self->_topPalette, "_constraints");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isActive");

      if ((v6 & 1) == 0)
        -[_UINavigationControllerPalette _configurePaletteConstraintsForBoundary](self->_topPalette, "_configurePaletteConstraintsForBoundary");
    }
    else
    {

    }
  }
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
  -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", navigationBarHidden, 0);
}

- (Class)_toolbarClass
{
  return self->_toolbarClass;
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationController;
  -[UIViewController didMoveToParentViewController:](&v3, sel_didMoveToParentViewController_, a3);
}

- (void)_executeSplitViewControllerActions:(id)a3
{
  $16004AA6B36EC19B1B0093A5EF089ED3 *p_navigationControllerFlags;
  char v4;

  p_navigationControllerFlags = &self->_navigationControllerFlags;
  v4 = *((_BYTE *)&self->_navigationControllerFlags + 8);
  *((_BYTE *)&self->_navigationControllerFlags + 8) = v4 | 2;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *((_BYTE *)p_navigationControllerFlags + 8) = *((_BYTE *)p_navigationControllerFlags + 8) & 0xFD | v4 & 2;
}

- (void)_setCreatedBySplitViewController:(BOOL)a3
{
  *((_BYTE *)&self->_navigationControllerFlags + 8) = *((_BYTE *)&self->_navigationControllerFlags + 8) & 0xFE | a3;
}

- (void)showViewController:(UIViewController *)vc sender:(id)sender
{
  UIViewController *v6;
  id v7;
  objc_super v8;

  v6 = vc;
  v7 = sender;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !-[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers"))
  {
    *(_QWORD *)&self->_navigationControllerFlags |= 0x8000000000000uLL;
    v8.receiver = self;
    v8.super_class = (Class)UINavigationController;
    -[UIViewController showViewController:sender:](&v8, sel_showViewController_sender_, v6, v7);
    *(_QWORD *)&self->_navigationControllerFlags &= ~0x8000000000000uLL;
  }
  else
  {
    -[UINavigationController pushViewController:animated:](self, "pushViewController:animated:", v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  }

}

void __53__UINavigationController_setNeedsDeferredTransition___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[121], "layoutSubviews");
    WeakRetained = v2;
  }

}

uint64_t __43__UINavigationController__configureToolbar__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "_setBarPosition:", objc_msgSend(*(id *)(a1 + 32), "_positionForBar:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992)));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAutoresizingMask:", 10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "sizeToFit");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 968);

  if (v2 != v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  v4 = objc_msgSend(*(id *)(a1 + 32), "isToolbarHidden");
  if ((v4 & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateToolbarItemsFromViewController:animated:", v6, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "_positionToolbarHidden:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setHidden:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "_setLocked:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_configureBarsAutomaticActions");
}

- (BOOL)_viewControllerWasSelected
{
  void *v2;
  char v3;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_viewControllerWasSelected");

  return v3;
}

- (id)_backdropBarGroupName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> Backdrop Group"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_layoutContainerViewSemanticContentAttributeChanged:(id)a3
{
  if (self->_containerView == a3)
    -[_UINavigationControllerVisualStyle layoutContainerViewSemanticContentAttributeChanged:](self->_visualStyle, "layoutContainerViewSemanticContentAttributeChanged:");
}

- (void)_updateToolbarItemsFromViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
  {
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toolbarItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItems:animated:", v8, v4);

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  if (!-[UIViewController _freezeLayoutForOrientationChangeOnDismissal](self, "_freezeLayoutForOrientationChangeOnDismissal"))
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "userInterfaceStyle");
    if (v9 == objc_msgSend(v8, "userInterfaceStyle")
      || (objc_msgSend(v8, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", 0, 0x1E1A994B0),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", 0, 0x1E1A994B0),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "isEqual:", v11),
          v11,
          v10,
          (v12 & 1) == 0))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
      v14[3] = &unk_1E16B2150;
      v14[4] = self;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", v14, 0);
    }
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v13, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);

  }
}

- (void)updateTabBarItemForViewController:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[UINavigationController bottomViewController](self, "bottomViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[UIViewController _parentViewController]((id *)&self->super.super.super.isa);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateTabBarItemForViewController:", self);

  }
}

- (void)_installPaletteIntoViewHierarchy:(id)a3
{
  void *v4;
  void *v5;
  UIView *paletteClippingView;
  _UINavigationControllerPaletteClippingView *v7;
  void *v8;
  UIView *v9;
  UIView *v10;
  id v11;

  v11 = a3;
  -[UINavigationController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "boundaryEdge") == 5)
  {
    objc_msgSend(v5, "insertSubview:aboveSubview:", v11, v4);
  }
  else
  {
    paletteClippingView = self->_paletteClippingView;
    if (!paletteClippingView)
    {
      v7 = [_UINavigationControllerPaletteClippingView alloc];
      -[UIViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v9 = -[UIView initWithFrame:](v7, "initWithFrame:");

      -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
      -[UIView setPreservesSuperviewLayoutMargins:](v9, "setPreservesSuperviewLayoutMargins:", 1);
      objc_msgSend(v5, "insertSubview:belowSubview:", v9, v4);
      v10 = self->_paletteClippingView;
      self->_paletteClippingView = v9;

      paletteClippingView = self->_paletteClippingView;
    }
    -[UIView addSubview:](paletteClippingView, "addSubview:", v11);
  }

}

- (id)_additionalViewControllersToCheckForUserActivity
{
  void *v2;
  int v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIStateRestorationDebugLogEnabled();
  if (v2)
  {
    if (v3)
      NSLog(CFSTR("%s: NavigationController's top view controller to check is %@"), "-[UINavigationController(ActivityContinuationPrivate) _additionalViewControllersToCheckForUserActivity]", v2);
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
      NSLog(CFSTR("%s: NavigationController has no top view controller to check. So sad, but I'll get over it and just return nil here"), "-[UINavigationController(ActivityContinuationPrivate) _additionalViewControllersToCheckForUserActivity]");
    v4 = 0;
  }

  return v4;
}

- (void)_navigationBarDidChangeStyle:(id)a3
{
  _QWORD v4[5];

  if (self->_navigationBar == a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__UINavigationController__navigationBarDidChangeStyle___block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
    -[UIViewController _invalidateBehaviorPreferences](self);
  }
}

- (void)_prepareForNestedDisplayWithNavigationController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  $16004AA6B36EC19B1B0093A5EF089ED3 *p_navigationControllerFlags;
  char v10;
  unint64_t navigationControllerFlags;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;

  v16 = a3;
  -[UINavigationController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot display a nested UINavigationController with zero viewControllers: %@"), self);
  -[UINavigationController _topViewControllerObservableScrollViewForEdge:](self, "_topViewControllerObservableScrollViewForEdge:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v6);

  -[UINavigationController _topViewControllerObservableScrollViewForEdge:](self, "_topViewControllerObservableScrollViewForEdge:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v7);

  -[UINavigationController _setIsNestedNavigationController:](self, "_setIsNestedNavigationController:", 1);
  -[UINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  p_navigationControllerFlags = &self->_navigationControllerFlags;
  v10 = *((_BYTE *)&self->_navigationControllerFlags + 8);
  navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 1) != 0)
  {
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v10;
    *(_QWORD *)p_navigationControllerFlags = (navigationControllerFlags >> 4) & 0x80000000000 | navigationControllerFlags & 0xFFFF77FFFFFFFFFFLL;
  }
  else
  {
    *(_QWORD *)p_navigationControllerFlags = navigationControllerFlags | 0x80000000000;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v10;
    -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, 0);
  }
  v12 = objc_msgSend(v16, "isToolbarHidden");
  v13 = v16 + 153;
  v14 = v16[153];
  v15 = *((_BYTE *)v16 + 1232);
  if (v12)
  {
    *v13 = v14 & 0xFFFFEFFFFFFFFFFFLL;
    *((_BYTE *)v16 + 1232) = v15;
  }
  else
  {
    *v13 = v14 | 0x100000000000;
    *((_BYTE *)v16 + 1232) = v15;
    objc_msgSend(v16, "setToolbarHidden:", 1);
  }
  -[UIViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 0);

}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;

  v4 = animated;
  v5 = hidden;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v8, "transitionWasCancelled");

  }
  if (!v4 || (v7 & 1) != 0)
  {
    objc_msgSend(v10, "_setNavigationBarHidden:edge:duration:", v5, 1, 0.0);
  }
  else
  {
    if (-[UINavigationController _isTransitioning](self, "_isTransitioning"))
      -[_UIViewControllerTransitionConductor customNavigationTransitionDuration](self->_transitionConductor, "customNavigationTransitionDuration");
    else
      v9 = 0.2;
    objc_msgSend(v10, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", v5, 1, v9);
  }

}

- (void)_setNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4 duration:(double)a5
{
  _BOOL8 v8;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, void *);
  void *v29;
  UINavigationController *v30;
  void (**v31)(_QWORD);
  _QWORD v32[6];
  _QWORD v33[5];
  _QWORD v34[5];
  BOOL v35;
  _QWORD v36[4];
  void (**v37)(_QWORD);
  _QWORD aBlock[6];
  BOOL v39;
  BOOL v40;
  BOOL v41;

  if (((((*(_QWORD *)&self->_navigationControllerFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    v8 = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("_UINavigationControllerNavigationBarVisibilityWillChangeNotification"), self);

    -[UINavigationController _navigationBarHiddenByDefault:](self, "_navigationBarHiddenByDefault:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UINavigationController _isTransitioningOrPaletteIsTransitioning](self, "_isTransitioningOrPaletteIsTransitioning");
    if (!v8)
    {
      -[UINavigationController _navigationItems](self, "_navigationItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_displayItemsKeepingOwningNavigationBar:", v13);

      -[UINavigationController _unhideNavigationBarForEdge:](self, "_unhideNavigationBarForEdge:", a4);
    }
    v14 = -[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition");
    -[UIViewController transitionCoordinator](self, "transitionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 > 0.0)
    {
      if (-[UINavigationController isInteractiveTransition](self, "isInteractiveTransition") || v14)
        -[UINavigationController _startInteractiveNavbarTransition](self, "_startInteractiveNavbarTransition");
      if (v14 && !v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 3330, CFSTR("Expected a non-nil coordinator if there is an interruptible animator associated with this transition"));

      }
    }
    *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFELL | v8;
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke;
    aBlock[3] = &unk_1E16C0790;
    v39 = v14;
    aBlock[4] = self;
    aBlock[5] = a4;
    v40 = v8;
    v41 = v12;
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    v18 = v17;
    if (a5 <= 0.0)
    {
      v17[2](v17);
    }
    else if (v14)
    {
      v36[0] = v16;
      v36[1] = 3221225472;
      v36[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_2;
      v36[3] = &unk_1E16B1CC8;
      v37 = v17;
      v34[0] = v16;
      v34[1] = 3221225472;
      v34[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_3;
      v34[3] = &unk_1E16BF900;
      v34[4] = self;
      v35 = v8;
      objc_msgSend(v15, "animateAlongsideTransition:completion:", v36, v34);

    }
    else
    {
      if (-[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
      {
        v19 = 196608;
      }
      else if (v15)
      {
        v19 = objc_msgSend(v15, "completionCurve") << 16;
      }
      else
      {
        v19 = 0;
      }
      if (v8)
        v20 = v19 | 4;
      else
        v20 = v19;
      v33[0] = v16;
      v33[1] = 3221225472;
      v33[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_4;
      v33[3] = &unk_1E16B3FD8;
      v33[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v20, v18, v33, a5, 0.0);
    }
    -[UIViewController _invalidateBehaviorPreferences](self);
    v32[0] = v16;
    v32[1] = 3221225472;
    v32[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_5;
    v32[3] = &unk_1E16B1888;
    v32[4] = self;
    v32[5] = a4;
    v21 = (void (**)(_QWORD))_Block_copy(v32);
    if (a5 <= 0.0)
    {
      if ((*(_QWORD *)&self->_navigationControllerFlags & 0x10000) != 0)
      {
        -[UINavigationController topViewController](self, "topViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "transitionCoordinator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v16;
        v27 = 3221225472;
        v28 = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_6;
        v29 = &unk_1E16BF798;
        v30 = self;
        v31 = v21;
        objc_msgSend(v24, "animateAlongsideTransition:completion:", 0, &v26);

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _hideShowNavigationBarDidStop:finished:context:](self, "_hideShowNavigationBarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowNavigationBar"), v22, 0);

    }
    else if (!v14 && -[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
    {
      +[UIView _finishAnimationTracking](UIView, "_finishAnimationTracking");
    }
    v21[2](v21);
LABEL_32:

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UINavigationControllerVisualStyle navigationBarVisibilityChanged](self->_visualStyle, "navigationBarVisibilityChanged");
  -[UIViewController _updateTabBarLayout](self, "_updateTabBarLayout", v26, v27, v28, v29, v30);
}

- (BOOL)_hasInterruptibleNavigationTransition
{
  return -[_UIViewControllerTransitionConductor hasInterruptibleNavigationTransition](self->_transitionConductor, "hasInterruptibleNavigationTransition");
}

- (void)_observableScrollViewDidChangeFrom:(id)a3 forViewController:(id)a4 edges:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UINavigationController;
  -[UIViewController _observableScrollViewDidChangeFrom:forViewController:edges:](&v18, sel__observableScrollViewDidChangeFrom_forViewController_edges_, v8, v9, a5);
  if ((a5 & 5) != 0)
  {
    if ((a5 & 1) != 0)
    {
      -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v8);
    }
    else if (objc_msgSend(v8, "_isScrollViewScrollObserver:", self))
    {
      objc_msgSend(v8, "_removeScrollViewScrollObserver:", self);
    }
    -[UINavigationController _viewControllerForObservableScrollView](self, "_viewControllerForObservableScrollView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v9)
      goto LABEL_29;
    if ((a5 & 1) != 0)
    {
      objc_msgSend(v9, "_contentOrObservableScrollViewForEdge:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a5 & 4) == 0)
        goto LABEL_9;
    }
    else
    {
      v11 = 0;
      if ((a5 & 4) == 0)
      {
LABEL_9:
        v12 = 0;
        if (!v8)
          goto LABEL_15;
        goto LABEL_13;
      }
    }
    objc_msgSend(v9, "_contentOrObservableScrollViewForEdge:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_15;
LABEL_13:
    if ((a5 & 1) != 0 && !v11)
    {
LABEL_16:
      -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
        v15 = a5;
      else
        v15 = 1;
      -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v11, v14, v15);

LABEL_20:
      if (v8 && (a5 & 4) != 0 && !v12)
      {
        if (!v11)
          goto LABEL_28;
      }
      else
      {
        objc_msgSend(v12, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_28;

        if (v12 == v11)
          goto LABEL_28;
      }
      -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v12, v17, 4);

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
LABEL_15:
    objc_msgSend(v11, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_20;
    goto LABEL_16;
  }
LABEL_30:

}

- (void)_stopObservingContentScrollView:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "_isScrollViewScrollObserver:", self))
  {
    -[UINavigationController _setInteractiveScrollActive:](self, "_setInteractiveScrollActive:", 0);
    objc_msgSend(v4, "_setTopScrollIndicatorFollowsContentOffset:", 0);
    objc_msgSend(v4, "_setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:", 0);
    objc_msgSend(v4, "_setAlternativeVerticalScrollIndicatorTopSafeAreaInset:", 0.0);
    objc_msgSend(v4, "_removeScrollViewScrollObserver:", self);
  }

}

- (BOOL)_isTransitioningOrPaletteIsTransitioning
{
  return -[UINavigationController _isTransitioning](self, "_isTransitioning")
      || (*(_QWORD *)&self->_navigationControllerFlags & 8) != 0
      || -[_UINavigationControllerPalette _restartPaletteTransitionIfNecessary](self->_topPalette, "_restartPaletteTransitionIfNecessary");
}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40) != 1)
    objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "topViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_computeAndApplyScrollContentInsetDeltaForViewController:", v3);

}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_splitViewControllerEnforcingClass:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_navigationControllerDidChangeNavigationBarHidden:", *(_QWORD *)(a1 + 32));

  }
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
    objc_msgSend(v3, "_setNeedsUserInterfaceAppearanceUpdate");
    objc_msgSend(v3, "setNeedsWhitePointAdaptivityStyleUpdate");
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && *(_QWORD *)(a1 + 40) == 1)
  {
    v6 = *(_QWORD **)(a1 + 32);
    if ((v6[153] & 0x2000) != 0)
    {
      objc_msgSend(v6, "navigationBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "navigationBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendSubviewToBack:", v9);

    }
  }
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  if (v10 && objc_msgSend(v10, "boundaryEdge") == 5)
  {
    if (*(_BYTE *)(a1 + 49)
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "isVisibleWhenPinningBarIsHidden") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_positionNavigationBarHidden:edge:", *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_restartPaletteTransitionIfNecessary");
  if (*(_BYTE *)(a1 + 50))
  {
    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "transitionCoordinator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_startPaletteTransitionIfNecessary:animated:", v14, 0);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_positionPaletteHidden:edge:", *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  }
  if (!*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_fadeAllViewsIn");

  }
  if (*(_QWORD *)(a1 + 40) == 1)
    objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
}

- (void)_hideShowNavigationBarDidStop:(id)a3 finished:(id)a4 context:(id)a5
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  _UINavigationControllerPalette *v10;
  void *v11;
  void *v12;
  _UINavigationControllerPalette *topPalette;
  _UINavigationControllerPalette *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v6 = -[UINavigationController _navbarIsAppearingInteractively](self, "_navbarIsAppearingInteractively", a3, a4, a5);
  if (-[UINavigationController _navigationBarAnimationWasCancelled](self, "_navigationBarAnimationWasCancelled"))
  {
    *(_QWORD *)&self->_navigationControllerFlags ^= 1uLL;
    -[UINavigationController _setNavigationBarAnimationWasCancelled:](self, "_setNavigationBarAnimationWasCancelled:", 0);
  }
  -[UINavigationController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  if ((*(_QWORD *)&self->_navigationControllerFlags & 1) != 0)
  {
    -[UINavigationController _navigationItems](self, "_navigationItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_displayItemsKeepingOwningNavigationBar:", v12);

    if ((*(_QWORD *)&self->_navigationControllerFlags & 0x2000) == 0)
    {
      topPalette = self->_topPalette;
      if (topPalette
        && -[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](topPalette, "isVisibleWhenPinningBarIsHidden"))
      {
        -[UINavigationController _repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:](self, "_repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:", 1, 1, 0.0);
      }
      else
      {
        objc_msgSend(v19, "removeFromSuperview");
        objc_msgSend(v19, "setHidden:", 1);
        v14 = self->_topPalette;
        if (v14
          && !-[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](v14, "isVisibleWhenPinningBarIsHidden"))
        {
          -[UIView removeFromSuperview](self->_topPalette, "removeFromSuperview");
        }
      }
    }
  }
  else
  {
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController navigationBar](self, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bringSubviewToFront:", v9);

    v10 = self->_topPalette;
    if (v10 && -[_UINavigationControllerPalette boundaryEdge](v10, "boundaryEdge") == 5)
    {
      -[UIView superview](self->_topPalette, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

      }
      else if (-[_UINavigationControllerPalette isAttached](self->_topPalette, "isAttached"))
      {
        -[UINavigationController _installPaletteIntoViewHierarchy:](self, "_installPaletteIntoViewHierarchy:", self->_topPalette);
        goto LABEL_18;
      }
      -[UIView superview](self->_topPalette, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bringSubviewToFront:", self->_topPalette);

    }
  }
LABEL_18:
  if (v6)
  {
    if (!-[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition"))
    {
      objc_msgSend(v19, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimeOffset:", 0.0);
      LODWORD(v17) = 1.0;
      objc_msgSend(v16, "setSpeed:", v17);

    }
    -[UINavigationController _setNavbarAnimationId:](self, "_setNavbarAnimationId:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:", CFSTR("_UINavigationControllerNavigationBarVisibilityDidChangeNotification"), self);

}

- (BOOL)_navbarIsAppearingInteractively
{
  void *v2;
  BOOL v3;

  -[UINavigationController _navbarAnimationId](self, "_navbarAnimationId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSUUID)_navbarAnimationId
{
  return self->__navbarAnimationId;
}

- (void)_positionPaletteHidden:(BOOL)a3 edge:(unint64_t)a4
{
  -[UINavigationController _positionPaletteHidden:edge:initialOffset:](self, "_positionPaletteHidden:edge:initialOffset:", a3, a4, 0.0);
}

- (void)_setToolbarHidden:(BOOL)a3 edge:(unint64_t)a4 duration:(double)a5
{
  _BOOL4 v7;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  char v30;
  int v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  UIView *p_super;
  _UIBarBackgroundLayoutLegacy *v42;
  void *v43;
  _UIBarBackground *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double MinY;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  int v75;
  void *v76;
  BOOL v77;
  void *v78;
  UIView *v79;
  void *v80;
  id v81;
  UIView *v82;
  id v83;
  id v84;
  id v85;
  UIView *v86;
  id v87;
  id v88;
  UIView *v89;
  void (**v90)(_QWORD);
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  _BOOL4 v96;
  _BOOL4 v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  void (**v101)(_QWORD);
  void *v102;
  int v103;
  double v104;
  double v105;
  _BOOL4 v106;
  uint64_t v107;
  void (**v108)(_QWORD);
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  uint64_t v116;
  id v117;
  UIView *v118;
  const char *v119;
  char v120;
  void *v121;
  char v122;
  UIView *v123;
  id v124;
  void *v125;
  int v126;
  id v127;
  void *v128;
  int v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD v133[5];
  void (**v134)(_QWORD);
  _QWORD v135[6];
  _QWORD v136[6];
  _QWORD v137[4];
  id v138;
  __int128 *v139;
  __int128 v140;
  uint64_t v141;
  char v142;
  _QWORD v143[5];
  BOOL v144;
  _QWORD v145[4];
  void (**v146)(_QWORD);
  _QWORD v147[6];
  BOOL v148;
  BOOL v149;
  _QWORD v150[6];
  BOOL v151;
  _QWORD v152[4];
  void (**v153)(_QWORD);
  _QWORD v154[4];
  id v155;
  _QWORD v156[4];
  void (**v157)(_QWORD);
  _QWORD v158[4];
  id v159;
  _QWORD v160[4];
  id v161;
  id v162;
  id v163;
  UIView *v164;
  _QWORD aBlock[5];
  id v166;
  UIView *v167;
  id v168;
  UIView *v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  double v175;
  __int128 v176;
  double v177;
  uint64_t v178;
  double v179;
  BOOL v180;
  BOOL v181;
  _QWORD v182[4];
  id v183;
  id v184;
  UINavigationController *v185;
  UIView *v186;
  id v187;
  double v188;
  __int128 v189;
  double v190;
  uint64_t v191;
  double v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char v197;
  char v198;
  BOOL v199;
  BOOL v200;
  _QWORD v201[5];
  id v202;
  unint64_t v203;
  BOOL v204;
  CGRect v205;
  CGRect v206;

  v7 = a3;
  if (a4 == 15)
  {
    v10 = 1;
  }
  else if (-[UINavigationController _shouldCrossFadeBottomBars](self, "_shouldCrossFadeBottomBars"))
  {
    v10 = -[_UIViewControllerTransitionConductor shouldAnimateBottomBarVisibility](self->_transitionConductor, "shouldAnimateBottomBarVisibility");
  }
  else
  {
    v10 = 0;
  }
  if (((*(_QWORD *)&self->_navigationControllerFlags >> 1) & 1) == v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("_UINavigationControllerToolbarVisibilityWillChangeNotification"), self);

    if (!v10
      || (*(_QWORD *)&self->_navigationControllerFlags & 0xC00000000) == 0
      || !-[UIViewController isViewLoaded](self, "isViewLoaded"))
    {
      goto LABEL_60;
    }
    -[UIViewController tabBarController](self, "tabBarController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tabBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UINavigationController toolbar](self, "toolbar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "barStyle");
    if (v15 != objc_msgSend(v14, "barStyle"))
      goto LABEL_59;
    objc_msgSend(v13, "barTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v14;
    v132 = v13;
    if (v16 || (objc_msgSend(v14, "barTintColor"), (v125 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v13, "barTintColor");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v14;
      v14 = (void *)v17;
      objc_msgSend(v18, "barTintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqual:", v13))
      {
        v19 = 0;
        goto LABEL_19;
      }
      v129 = 1;
    }
    else
    {
      v129 = 0;
      v125 = 0;
    }
    objc_msgSend(v132, "backgroundImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {

      v19 = 0;
      if (!v129)
      {
LABEL_20:
        v14 = v131;
        v13 = v132;
        if (v16)
        {

          if (!v19)
            goto LABEL_59;
LABEL_24:
          if (!v7)
          {
            v201[0] = MEMORY[0x1E0C809B0];
            v201[1] = 3221225472;
            v201[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke;
            v201[3] = &unk_1E16C07C8;
            v201[4] = self;
            v202 = v131;
            v203 = a4;
            v204 = v10;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v201);

          }
          v21 = MEMORY[0x1E0C9BAA8];
          v140 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
          v126 = objc_msgSend(v131, "_shouldStretchDuringCrossfadeTransition");
          v119 = a2;
          if (v126)
          {
            objc_msgSend(v131, "_backgroundView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "bounds");
            v24 = v23;

            v25 = v132;
            objc_msgSend(v132, "bounds");
            v27 = (v24 - v26) * 0.5;
            v140 = 0uLL;
            v28 = 1.0;
            v116 = 0;
            v115 = v26 / v24;
          }
          else
          {
            v28 = *(double *)v21;
            v27 = *(double *)(v21 + 40);
            v115 = *(double *)(v21 + 24);
            v116 = *(_QWORD *)(v21 + 32);
            v25 = v132;
          }
          -[UIViewController view](self, "view");
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "barTintColor");
          v124 = (id)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v25, "isTranslucent");
          v31 = objc_msgSend(v131, "isTranslucent");
          if ((*(_QWORD *)&self->_navigationControllerFlags & 0x400000000) == 0)
            v25 = v131;
          objc_msgSend(v25, "_backgroundView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "frame");
          v130 = (void *)v29;
          objc_msgSend(v25, "convertRect:toView:", v29);
          v34 = v33;
          v36 = v35;
          v38 = v37;
          v40 = v39;

          v120 = v30;
          v122 = v31;
          if ((v30 & 1) != 0 || v31)
          {
            v44 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v34, v36, v38, v40);
            -[_UIBarBackground setTopAligned:](v44, "setTopAligned:", 0);
            v42 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
            -[_UIBarBackground setLayout:](v44, "setLayout:", v42);
            -[_UIBarBackgroundLayoutLegacy configureEffectForStyle:backgroundTintColor:forceOpaque:](v42, "configureEffectForStyle:backgroundTintColor:forceOpaque:", objc_msgSend(v132, "barStyle"), v124, 0);
            -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](v42, "configureShadowForBarStyle:", objc_msgSend(v132, "barStyle"));
            objc_msgSend(v132, "traitCollection");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_self();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForTrait:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIBarBackground setGroupName:](v44, "setGroupName:", v47);

            p_super = &v44->super;
            -[_UIBarBackground transitionBackgroundViews](v44, "transitionBackgroundViews");
            -[UIView layoutIfNeeded](v44, "layoutIfNeeded");
          }
          else
          {
            p_super = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v34, v36, v38, v40);
            objc_msgSend(v132, "_backgroundView");
            v42 = (_UIBarBackgroundLayoutLegacy *)objc_claimAutoreleasedReturnValue();
            -[_UIBarBackgroundLayoutLegacy backgroundColor](v42, "backgroundColor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView setBackgroundColor:](p_super, "setBackgroundColor:", v43);

          }
          -[UIView layer](p_super, "layer");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setAllowsGroupOpacity:", 0);

          objc_msgSend(v131, "superview");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          a2 = v119;
          v118 = p_super;
          if (v49 == v130)
            objc_msgSend(v130, "insertSubview:belowSubview:", p_super, v131);
          else
            objc_msgSend(v130, "addSubview:", p_super);
          -[UIViewController view](self, "view");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "_backgroundView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "bounds");
          v54 = v53;
          v56 = v55;
          v58 = v57;
          v60 = v59;
          objc_msgSend(v131, "_backgroundView");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "convertRect:fromView:", v61, v54, v56, v58, v60);
          MinY = CGRectGetMinY(v205);

          -[UIViewController view](self, "view");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "_backgroundView");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "bounds");
          v66 = v65;
          v68 = v67;
          v70 = v69;
          v72 = v71;
          objc_msgSend(v132, "_backgroundView");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "convertRect:fromView:", v73, v66, v68, v70, v72);
          v74 = CGRectGetMinY(v206);

          v75 = v126;
          if (MinY >= v74)
            v75 = 1;
          if (v74 >= MinY)
            v76 = 0;
          else
            v76 = v132;
          v77 = v75 == 0;
          v78 = v131;
          if (!v77)
            v78 = v76;
          v117 = v78;
          if (v117)
            v79 = objc_alloc_init(UIView);
          else
            v79 = 0;
          +[UIColor blackColor](UIColor, "blackColor");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v79, "setBackgroundColor:", v80);

          -[UIView setOpaque:](v79, "setOpaque:", 1);
          v182[0] = MEMORY[0x1E0C809B0];
          v182[1] = 3221225472;
          v182[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_2;
          v182[3] = &unk_1E16C07F0;
          v197 = v120;
          v127 = v132;
          v183 = v127;
          v198 = v122;
          v81 = v131;
          v199 = !v7;
          v184 = v81;
          v185 = self;
          v82 = v79;
          v186 = v82;
          v83 = v117;
          v187 = v83;
          v188 = v28;
          v189 = v140;
          v190 = v115;
          v191 = v116;
          v192 = v27;
          v200 = v7;
          v193 = 0x3FF0000000000000;
          v194 = 0;
          v196 = 0;
          v195 = 0;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v182);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_3;
          aBlock[3] = &unk_1E16C0818;
          v180 = !v7;
          aBlock[4] = self;
          v84 = v81;
          v166 = v84;
          v123 = v82;
          v167 = v123;
          v85 = v83;
          v168 = v85;
          v171 = 0x3FF0000000000000;
          v174 = 0;
          v172 = 0;
          v173 = 0;
          v86 = v118;
          v169 = v86;
          v181 = v7;
          v175 = v28;
          v176 = v140;
          v177 = v115;
          v178 = v116;
          v179 = v27;
          v87 = v127;
          v170 = v87;
          v128 = _Block_copy(aBlock);
          v160[0] = MEMORY[0x1E0C809B0];
          v160[1] = 3221225472;
          v160[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_4;
          v160[3] = &unk_1E16B51E8;
          v161 = v87;
          v162 = v84;
          v88 = v85;
          v163 = v88;
          v89 = v86;
          v164 = v89;
          v90 = (void (**)(_QWORD))_Block_copy(v160);
          -[UIViewController transitionCoordinator](self, "transitionCoordinator");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = v88;
          if (v91)
          {
            v92 = MEMORY[0x1E0C809B0];
            v158[0] = MEMORY[0x1E0C809B0];
            v158[1] = 3221225472;
            v158[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_6;
            v158[3] = &unk_1E16B1CC8;
            v159 = v128;
            v156[0] = v92;
            v156[1] = 3221225472;
            v156[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_7;
            v156[3] = &unk_1E16B1CC8;
            v157 = v90;
            objc_msgSend(v91, "animateAlongsideTransitionInView:animation:completion:", v89, v158, v156);

            v93 = v159;
          }
          else
          {
            if (a5 <= 0.0)
            {
              v90[2](v90);
              goto LABEL_58;
            }
            v94 = MEMORY[0x1E0C809B0];
            v154[0] = MEMORY[0x1E0C809B0];
            v154[1] = 3221225472;
            v154[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_8;
            v154[3] = &unk_1E16B1BF8;
            v155 = v128;
            v152[0] = v94;
            v152[1] = 3221225472;
            v152[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_9;
            v152[3] = &unk_1E16B1BA0;
            v153 = v90;
            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v154, v152, a5);

            v93 = v155;
          }

LABEL_58:
          v13 = v132;

          v14 = v131;
          goto LABEL_59;
        }

        if (v19)
          goto LABEL_24;
LABEL_59:

LABEL_60:
        -[UIViewController transitionCoordinator](self, "transitionCoordinator");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = -[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition");
        if (v95)
          v97 = objc_msgSend(v95, "presentationStyle") == -1;
        else
          v97 = 0;
        if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
        {
          if (!v7)
          {
            v150[0] = MEMORY[0x1E0C809B0];
            v150[1] = 3221225472;
            v150[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_10;
            v150[3] = &unk_1E16BFE60;
            v150[4] = self;
            v150[5] = a4;
            v151 = v10;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v150);
          }
          v98 = a5 > 0.0 || v97;
          if (v98 == 1)
          {
            if (!v7 && !v10)
              *(_QWORD *)&self->_navigationControllerFlags |= 0x4000000000000000uLL;
            if (-[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
              -[UINavigationController _startInteractiveToolbarTransition](self, "_startInteractiveToolbarTransition");
            if (!v95 && v96)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 3920, CFSTR("Expected a non-nil coordinator if there is an interruptible animator associated with this transition"));

            }
          }
        }
        v99 = 2;
        if (v7)
          v99 = 0;
        *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFDLL | v99;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[_UINavigationControllerVisualStyle toolbarVisibilityChanged](self->_visualStyle, "toolbarVisibilityChanged");
        if (!-[UIViewController isViewLoaded](self, "isViewLoaded"))
          goto LABEL_111;
        v100 = MEMORY[0x1E0C809B0];
        v147[0] = MEMORY[0x1E0C809B0];
        v147[1] = 3221225472;
        v147[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_11;
        v147[3] = &unk_1E16C0840;
        v148 = v7;
        v147[4] = self;
        v147[5] = a4;
        v149 = v10;
        v101 = (void (**)(_QWORD))_Block_copy(v147);
        v102 = v101;
        if (v96)
        {
          v145[0] = v100;
          v145[1] = 3221225472;
          v145[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_12;
          v145[3] = &unk_1E16B1CC8;
          v146 = v101;
          v143[0] = v100;
          v143[1] = 3221225472;
          v143[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_13;
          v143[3] = &unk_1E16BF900;
          v144 = v7;
          v143[4] = self;
          objc_msgSend(v95, "animateAlongsideTransition:completion:", v145, v143);

        }
        else
        {
          v103 = a5 > 0.0 || v97;
          if (v103 == 1)
          {
            v104 = a5;
            if (v95)
            {
              objc_msgSend(v95, "transitionDuration");
              v104 = v105;
            }
            v106 = -[UINavigationController isInteractiveTransition](self, "isInteractiveTransition");
            if (v106)
              v107 = 196608;
            else
              v107 = 0;
            if (!v106 && v95)
              v107 = objc_msgSend(v95, "completionCurve") << 16;
            *(_QWORD *)&v140 = 0;
            *((_QWORD *)&v140 + 1) = &v140;
            v141 = 0x2020000000;
            v142 = 0;
            v137[0] = v100;
            v137[1] = 3221225472;
            v137[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_14;
            v137[3] = &unk_1E16B1E40;
            v138 = v102;
            v139 = &v140;
            v136[0] = v100;
            v136[1] = 3221225472;
            v136[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_15;
            v136[3] = &unk_1E16BD888;
            v136[4] = self;
            v136[5] = &v140;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v107, v137, v136, v104, 0.0);
            if (!*(_BYTE *)(*((_QWORD *)&v140 + 1) + 24))
              -[UINavigationController _hideShowToolbarDidStop:finished:context:](self, "_hideShowToolbarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowToolbar"), MEMORY[0x1E0C9AAB0], 0);

            _Block_object_dispose(&v140, 8);
          }
          else
          {
            v101[2](v101);
          }
        }
        v135[0] = v100;
        v135[1] = 3221225472;
        v135[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_16;
        v135[3] = &unk_1E16B1888;
        v135[4] = self;
        v135[5] = a4;
        v108 = (void (**)(_QWORD))_Block_copy(v135);
        if (a5 > 0.0 || v95)
        {
          if (!v96)
          {
            if (-[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
              -[UINavigationController _finishAnimationTracking](self, "_finishAnimationTracking");
          }
        }
        else
        {
          if ((*(_QWORD *)&self->_navigationControllerFlags & 0x10000) != 0)
          {
            -[UINavigationController topViewController](self, "topViewController");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "transitionCoordinator");
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            v133[0] = v100;
            v133[1] = 3221225472;
            v133[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_17;
            v133[3] = &unk_1E16BF798;
            v133[4] = self;
            v134 = v108;
            objc_msgSend(v111, "animateAlongsideTransition:completion:", 0, v133);

            goto LABEL_110;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[UINavigationController _hideShowToolbarDidStop:finished:context:](self, "_hideShowToolbarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowToolbar"), v109, 0);

        }
        v108[2](v108);
LABEL_110:

LABEL_111:
        return;
      }
    }
    else
    {
      objc_msgSend(v131, "backgroundImageForToolbarPosition:barMetrics:", 1, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50
        || (objc_msgSend(v131, "backgroundImageForToolbarPosition:barMetrics:", 1, 1),
            (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

        v19 = 0;
      }
      else
      {
        objc_msgSend(v131, "backgroundImageForToolbarPosition:barMetrics:", 4, 0);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        if (v112)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v131, "backgroundImageForToolbarPosition:barMetrics:", 4, 1);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v113 == 0;

          v112 = 0;
        }

      }
      if ((v129 & 1) == 0)
        goto LABEL_20;
    }
LABEL_19:

    goto LABEL_20;
  }
}

- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated
{
  _BOOL8 v4;
  double v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  v4 = hidden;
  if (animated)
    v6 = 0.2;
  else
    v6 = 0.0;
  if ((*(_QWORD *)&self->_navigationControllerFlags & 4) != 0)
  {
    v8 = animated;
    -[UINavigationController disappearingViewController](self, "disappearingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController disappearingViewController](self, "disappearingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11) ^ 1;

    }
    else
    {
      v12 = 0;
    }

    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_shouldReverseLayoutDirection");

    v15 = 2;
    if (v14)
      v16 = 8;
    else
      v16 = 2;
    if (!v14)
      v15 = 8;
    if (v4)
      v17 = v15;
    else
      v17 = v16;
    if (v4)
      v15 = v16;
    if (v12)
      v7 = v17;
    else
      v7 = v15;
    v6 = 0.0;
    if (v8)
    {
      -[UINavigationController durationForTransition:](self, "durationForTransition:", 1);
      v6 = v18;
    }
  }
  else
  {
    v7 = 4;
  }
  if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
    *(_QWORD *)&self->_navigationControllerFlags &= ~0x100000000000uLL;
  -[UINavigationController _setToolbarHidden:edge:duration:](self, "_setToolbarHidden:edge:duration:", v4, v7, v6);
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_16(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 40) != 4)
    objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_computeAndApplyScrollContentInsetDeltaForViewController:");
  if (_UIBarsApplyChromelessEverywhere())
  {
    v2 = *(_QWORD **)(a1 + 32);
    if ((~v2[153] & 0x400000000002) == 0)
    {
      objc_msgSend(v2, "_outermostNavigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v3, v5, 4, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_updateBackgroundTransitionProgressForScrollView:toolbar:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));

    }
  }

}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAutoresizingMask:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "_positionToolbarHidden:edge:crossFade:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 49));
  if (*(_QWORD *)(a1 + 40) == 4)
    return objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
  return result;
}

- (void)_hideShowToolbarDidStop:(id)a3 finished:(id)a4 context:(id)a5
{
  _BOOL4 v7;
  uint64_t navigationControllerFlags;
  _BOOL4 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  id v24;

  v24 = a4;
  v7 = -[UINavigationController _toolbarIsAnimatingInteractively](self, "_toolbarIsAnimatingInteractively");
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags & 0xFFFFFFFFFFFBFFFFLL;
  if (-[UINavigationController _toolbarAnimationWasCancelled](self, "_toolbarAnimationWasCancelled"))
  {
    v9 = -[UINavigationController isToolbarHidden](self, "isToolbarHidden");
    v10 = (uint64_t)self->_navigationControllerFlags;
    v11 = *((_BYTE *)&self->_navigationControllerFlags + 8);
    if (v9)
    {
      v12 = v10 | 2;
      if ((navigationControllerFlags & 0x40000) != 0)
        v12 &= ~0x400uLL;
      *((_BYTE *)&self->_navigationControllerFlags + 8) = v11;
      *(_QWORD *)&self->_navigationControllerFlags = v12;
      -[UINavigationController toolbar](self, "toolbar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 0;
    }
    else
    {
      v18 = v10 & 0xFFFFFFFFFFFFFFFDLL;
      if ((navigationControllerFlags & 0x40000) != 0)
        v18 |= 0x400uLL;
      *((_BYTE *)&self->_navigationControllerFlags + 8) = v11;
      *(_QWORD *)&self->_navigationControllerFlags = v18;
      -[UINavigationController toolbar](self, "toolbar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeFromSuperview");

      -[UINavigationController toolbar](self, "toolbar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 1;
    }
    objc_msgSend(v13, "setHidden:", v15);

    -[UINavigationController _setToolbarAnimationWasCancelled:](self, "_setToolbarAnimationWasCancelled:", 0);
  }
  else if (objc_msgSend(v24, "BOOLValue"))
  {
    if (-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
    {
      -[UINavigationController toolbar](self, "toolbar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[UINavigationController toolbar](self, "toolbar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", 1);

    }
    else if (a5)
    {
      -[UINavigationController _layoutTopViewController](self, "_layoutTopViewController");
    }
  }
  if (v7)
  {
    if (!-[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition"))
    {
      -[UINavigationController _existingToolbar](self, "_existingToolbar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTimeOffset:", 0.0);
      LODWORD(v22) = 1.0;
      objc_msgSend(v21, "setSpeed:", v22);

    }
    -[UINavigationController _setToolbarAnimationId:](self, "_setToolbarAnimationId:", 0);
  }
  -[UIView setAutoresizingMask:](self->_toolbar, "setAutoresizingMask:", 10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:", CFSTR("_UINavigationControllerToolbarVisibilityDidChangeNotification"), self);

}

- (BOOL)_toolbarIsAnimatingInteractively
{
  void *v2;
  BOOL v3;

  -[UINavigationController _toolbarAnimationId](self, "_toolbarAnimationId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_toolbarAnimationWasCancelled
{
  return self->__toolbarAnimationWasCancelled;
}

- (NSUUID)_toolbarAnimationId
{
  return self->__toolbarAnimationId;
}

- (void)setToolbarHidden:(BOOL)toolbarHidden
{
  -[UINavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", toolbarHidden, 0);
}

- (void)_setNavigationBarHidden:(BOOL)a3 edgeIfNotNavigating:(unint64_t)a4 duration:(double)a5
{
  _BOOL8 v7;
  _BOOL4 v9;
  _UINavigationControllerPalette *topPalette;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  double v17;
  unint64_t v18;

  if (((((*(_QWORD *)&self->_navigationControllerFlags & 1) == 0) ^ a3) & 1) != 0)
    return;
  v7 = a3;
  v18 = a4;
  v17 = a5;
  v9 = -[UINavigationController _isTransitioningOrPaletteIsTransitioning](self, "_isTransitioningOrPaletteIsTransitioning");
  topPalette = self->_topPalette;
  if (!topPalette || !-[_UINavigationControllerPalette isAttached](topPalette, "isAttached"))
  {
    v12 = 0;
LABEL_9:
    if (-[UINavigationController wasLastOperationAnimated](self, "wasLastOperationAnimated"))
      -[UINavigationController _animationParametersForHidingNavigationBar:lastOperation:edge:duration:](self, "_animationParametersForHidingNavigationBar:lastOperation:edge:duration:", v7, -[UINavigationController lastOperation](self, "lastOperation"), &v18, &v17);
    if (v12)
    {
      if (-[_UINavigationControllerPalette isPinned](self->_topPalette, "isPinned"))
      {
        -[_UINavigationControllerPalette _setPalettePinningBarHidden:](self->_topPalette, "_setPalettePinningBarHidden:", v7);
        -[_UINavigationControllerPalette _resetConstraintConstants:](self->_topPalette, "_resetConstraintConstants:", 0.0);
      }
      else
      {
        -[UIViewController transitionCoordinator](self, "transitionCoordinator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __79__UINavigationController__setNavigationBarHidden_edgeIfNotNavigating_duration___block_invoke;
        v15[3] = &unk_1E16BF900;
        v15[4] = self;
        v16 = v7;
        objc_msgSend(v14, "animateAlongsideTransition:completion:", 0, v15);

      }
    }
    -[UINavigationController _setNavigationBarHidden:edge:duration:](self, "_setNavigationBarHidden:edge:duration:", v7, v18, v17);
    return;
  }
  v11 = -[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](self->_topPalette, "isVisibleWhenPinningBarIsHidden");
  if (v9 || !v11)
  {
    v12 = v11;
    if (v7 && v11 && v9)
    {
      -[UIView superview](self->_topPalette, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v12 = 1;
      }
      else
      {
        v12 = 1;
        -[_UINavigationControllerPalette _setPalettePinningBarHidden:](self->_topPalette, "_setPalettePinningBarHidden:", 1);
      }
    }
    goto LABEL_9;
  }
  if (!v7)
    -[UINavigationController _unhideNavigationBarForEdge:](self, "_unhideNavigationBarForEdge:", a4);
  -[UINavigationController _repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:](self, "_repositionPaletteWithNavigationBarHidden:duration:shouldUpdateNavigationItems:", v7, 1, a5);
}

- (void)_setIsNestedNavigationController:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (void)_unhideNavigationBarForEdge:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  -[UINavigationController _navigationBarHiddenByDefault:](self, "_navigationBarHiddenByDefault:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__UINavigationController__unhideNavigationBarForEdge___block_invoke;
  v8[3] = &unk_1E16B1C28;
  v9 = v5;
  v10 = a3;
  v8[4] = self;
  v7 = v5;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

}

- (void)_startPaletteTransitionIfNecessary:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  UINavigationController *v7;
  UINavigationController *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  double MaxY;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CGFloat v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  BOOL v50;
  _UINavigationControllerPalette *topPalette;
  _UINavigationControllerPalette *v52;
  _UINavigationControllerPalette *v53;
  double v54;
  double v55;
  uint64_t v56;
  void *v57;
  id v58;
  void (**v59)(void *, _QWORD);
  _UINavigationControllerPalette *v60;
  void *v61;
  _UINavigationControllerPalette *v62;
  _UINavigationControllerPalette *v63;
  BOOL v64;
  _UINavigationControllerPalette *v65;
  char v66;
  BOOL v67;
  _QWORD v68[4];
  id v69;
  UINavigationController *v70;
  _QWORD *v71;
  uint64_t v72;
  char v73;
  BOOL v74;
  BOOL v75;
  _QWORD aBlock[5];
  _UINavigationControllerPalette *v77;
  id v78;
  _QWORD *v79;
  uint64_t v80;
  char v81;
  char v82;
  BOOL v83;
  BOOL v84;
  _QWORD v85[3];
  char v86;
  _QWORD v87[5];
  _QWORD v88[9];
  _QWORD v89[5];
  id v90;
  uint64_t v91;
  CGFloat v92;
  uint64_t v93;
  uint64_t v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v4 = a4;
  v6 = a3;
  if (!-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
    goto LABEL_5;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    *(_QWORD *)&self->_navigationControllerFlags &= ~8uLL;
    -[UIView setClipsToBounds:](self->_paletteClippingView, "setClipsToBounds:", 1);
    if (-[UINavigationController isBuiltinTransition](self, "isBuiltinTransition"))
      v9 = -[UINavigationController isCustomTransition](self, "isCustomTransition");
    else
      v9 = 0;
    v10 = -[UINavigationController isInteractiveTransition](self, "isInteractiveTransition");
    -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_topPalette)
      goto LABEL_68;
    v12 = -[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible");
    v13 = -[_UINavigationControllerPalette isAttached](self->_topPalette, "isAttached");
    if (v12)
    {
      if (!v13
        || (-[UIView superview](self->_topPalette, "superview"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            v14))
      {
        if (!-[_UINavigationControllerPalette isAttached](self->_topPalette, "isAttached")
          || -[_UINavigationControllerPalette isPinned](self->_topPalette, "isPinned"))
        {
          if (-[_UINavigationControllerPalette isAttached](self->_topPalette, "isAttached"))
          {
            v15 = 0;
            if (v9 && v10)
            {
              objc_msgSend(v11, "frame");
              MaxY = CGRectGetMaxY(v95);
              objc_msgSend(v11, "layer");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "presentationLayer");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "frame");
              v15 = MaxY != CGRectGetMaxY(v96);

            }
            goto LABEL_34;
          }
          goto LABEL_32;
        }
        -[UINavigationController detachPalette:isInPaletteTransition:](self, "detachPalette:isInPaletteTransition:", self->_topPalette, 1);
LABEL_38:
        v64 = v10;
        v67 = v9;
        -[UINavigationDeferredTransitionContext setOutgoingTopPalette:](self->_deferredTransitionContext, "setOutgoingTopPalette:", self->_topPalette);
        v23 = 0;
        v66 = 1;
        goto LABEL_39;
      }
      goto LABEL_31;
    }
    if (v13)
    {
      -[UIView superview](self->_topPalette, "superview");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        if (!-[_UINavigationControllerPalette isPinned](self->_topPalette, "isPinned")
          && -[UINavigationController _isTransitioning](self, "_isTransitioning"))
        {

LABEL_28:
          if (!-[_UINavigationControllerPalette isPinned](self->_topPalette, "isPinned"))
            goto LABEL_38;
          v64 = v10;
          v66 = 0;
          v67 = v9;
          v23 = 0;
LABEL_39:
          -[UIViewController view](self, "view");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "_shouldReverseLayoutDirection");

          v45 = -[UINavigationController lastOperation](self, "lastOperation");
          v46 = 8;
          if (v44)
            v47 = 2;
          else
            v47 = 8;
          if (!v44)
            v46 = 2;
          if (v45 == 1)
            v48 = v47;
          else
            v48 = v46;
          -[UIView superview](self->_topPalette, "superview");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49 == 0;

          v85[0] = 0;
          v85[1] = v85;
          v85[2] = 0x2020000000;
          v86 = 0;
          if (-[_UINavigationControllerPalette _supportsSpecialSearchBarTransitions](self->_topPalette, "_supportsSpecialSearchBarTransitions"))
          {
            topPalette = self->_topPalette;
          }
          else
          {
            topPalette = 0;
          }
          v52 = topPalette;
          v53 = v52;
          if (v23)
            v54 = 1.0;
          else
            v54 = 0.0;
          -[_UINavigationControllerPalette _setShadowAlpha:](v52, "_setShadowAlpha:", v54);
          if (v23)
            v55 = 0.0;
          else
            v55 = 1.0;
          -[UINavigationBar _setShadowAlpha:](self->_navigationBar, "_setShadowAlpha:", v55);
          v56 = MEMORY[0x1E0C809B0];
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_5;
          aBlock[3] = &unk_1E16C0A80;
          aBlock[4] = self;
          v65 = v53;
          v77 = v65;
          v79 = v85;
          v57 = v11;
          v58 = v11;
          v81 = v66;
          v82 = v23;
          v83 = v67;
          v78 = v58;
          v80 = v48;
          v84 = v50;
          v59 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
          if (v6 && v4)
          {
            v60 = self->_topPalette;
            v68[0] = v56;
            v68[1] = 3221225472;
            v68[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_7;
            v68[3] = &unk_1E16C0B98;
            v73 = v23;
            v69 = v58;
            v70 = self;
            v74 = v67;
            v71 = v85;
            v72 = v48;
            v75 = v64;
            objc_msgSend(v6, "animateAlongsideTransitionInView:animation:completion:", v60, v68, v59);
            v11 = v57;
            if (self->_transitioningTopPalette)
            {
              objc_msgSend(v6, "_alongsideAnimationViews");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "addObject:", self->_transitioningTopPalette);

            }
          }
          else
          {
            -[UINavigationController _positionPaletteHidden:edge:](self, "_positionPaletteHidden:edge:", v23 ^ 1u, v48);
            v11 = v57;
            v59[2](v59, 0);
            v62 = self->_topPalette;
            if (v62
              && -[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](v62, "isVisibleWhenPinningBarIsHidden")&& -[_UINavigationControllerPalette _isPalettePinningBarHidden](self->_topPalette, "_isPalettePinningBarHidden"))
            {
              v63 = self->_topPalette;
              -[UIView frame](v63, "frame");
              -[_UINavigationControllerPalette _resetConstraintConstants:](v63, "_resetConstraintConstants:", CGRectGetMinY(v98));
            }
          }

          _Block_object_dispose(v85, 8);
          goto LABEL_68;
        }
        v21 = -[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](self->_topPalette, "isVisibleWhenPinningBarIsHidden");

        if (!v21)
          goto LABEL_28;
      }
    }
    if (-[_UINavigationControllerPalette isAttached](self->_topPalette, "isAttached"))
    {
      -[UIView superview](self->_topPalette, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {

      }
      else if (-[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](self->_topPalette, "isVisibleWhenPinningBarIsHidden"))
      {
LABEL_31:
        v64 = v10;
        v66 = 0;
        v67 = v9;
        v23 = 1;
        goto LABEL_39;
      }
    }
LABEL_32:
    if (-[_UINavigationControllerPalette isAttached](self->_topPalette, "isAttached"))
    {
      v15 = 0;
LABEL_34:
      if (!v6)
      {
LABEL_68:

        goto LABEL_69;
      }
      if (v15)
      {
        objc_msgSend(v11, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "presentationLayer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "frame");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        -[UIView frame](self->_topPalette, "frame");
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v97.origin.x = v27;
        v97.origin.y = v29;
        v97.size.width = v31;
        v97.size.height = v33;
        v40 = CGRectGetMaxY(v97);
        v41 = MEMORY[0x1E0C809B0];
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke;
        v89[3] = &unk_1E16C0A30;
        v89[4] = self;
        v90 = v11;
        v91 = v35;
        v92 = v40;
        v93 = v37;
        v94 = v39;
        v88[0] = v41;
        v88[1] = 3221225472;
        v88[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_3;
        v88[3] = &unk_1E16C0A58;
        v88[4] = self;
        v88[5] = v35;
        *(CGFloat *)&v88[6] = v40;
        v88[7] = v37;
        v88[8] = v39;
        objc_msgSend(v6, "animateAlongsideTransition:completion:", v89, v88);

        goto LABEL_68;
      }
LABEL_67:
      -[_UINavigationControllerPalette _setRestartPaletteTransitionIfNecessary:](self->_topPalette, "_setRestartPaletteTransitionIfNecessary:", 1);
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_4;
      v87[3] = &unk_1E16B2150;
      v87[4] = self;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v87);
      goto LABEL_68;
    }
    -[UIView superview](self->_topPalette, "superview");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      if (!v6)
        goto LABEL_68;
      goto LABEL_67;
    }
    goto LABEL_38;
  }
  v8 = v7;
  -[UINavigationController _startPaletteTransitionIfNecessary:animated:](v7, "_startPaletteTransitionIfNecessary:animated:", v6, v4);

LABEL_69:
}

- (BOOL)isInteractiveTransition
{
  return -[_UIViewControllerTransitionConductor isInteractiveTransition](self->_transitionConductor, "isInteractiveTransition");
}

- (BOOL)isBuiltinTransition
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 17) & 1;
}

- (UINavigationController)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  UINavigationController *v5;
  uint64_t v6;
  UINavigationBar *navigationBar;
  UINavigationController *v8;
  char v9;
  char v10;
  char v11;
  UINavigationBar *v12;
  BOOL v13;
  char v14;
  uint64_t v15;
  UIToolbar *toolbar;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  float v20;
  UINavigationBar *v21;
  void *v22;
  _UIViewControllerTransitionManager *transitionManager;
  void *v24;
  unint64_t v26;
  NSObject *v27;
  UINavigationBar *v28;
  NSObject *v29;
  UINavigationBar *v30;
  objc_super v31;
  uint8_t buf[4];
  UINavigationController *v33;
  __int16 v34;
  UINavigationBar *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = aDecoder;
  v31.receiver = self;
  v31.super_class = (Class)UINavigationController;
  v5 = -[UIViewController initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINavigationBar"));
    v6 = objc_claimAutoreleasedReturnValue();
    navigationBar = v5->_navigationBar;
    v5->_navigationBar = (UINavigationBar *)v6;

    -[UINavigationBar delegate](v5->_navigationBar, "delegate");
    v8 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

    v9 = -[UINavigationBar isLocked](v5->_navigationBar, "isLocked");
    v10 = v9;
    if (v8 == v5)
      v11 = v9;
    else
      v11 = 0;
    if (v5->_navigationBar && (v11 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          v30 = v5->_navigationBar;
          *(_DWORD *)buf = 138412546;
          v33 = v5;
          v34 = 2112;
          v35 = v30;
          _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "UINavigationBar decoded as unlocked for UINavigationController, or navigationBar delegate set up incorrectly. Inconsistent configuration may cause problems. navigationController=%@, navigationBar=%@", buf, 0x16u);
        }

      }
      else
      {
        v26 = initWithCoder____s_category;
        if (!initWithCoder____s_category)
        {
          v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v26, (unint64_t *)&initWithCoder____s_category);
        }
        v27 = *(NSObject **)(v26 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = v5->_navigationBar;
          *(_DWORD *)buf = 138412546;
          v33 = v5;
          v34 = 2112;
          v35 = v28;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "UINavigationBar decoded as unlocked for UINavigationController, or navigationBar delegate set up incorrectly. Inconsistent configuration may cause problems. navigationController=%@, navigationBar=%@", buf, 0x16u);
        }
      }
    }
    v12 = v5->_navigationBar;
    if (v12)
      v13 = v8 == v5;
    else
      v13 = 0;
    if (v13)
      v14 = v10;
    else
      v14 = 1;
    if ((v14 & 1) == 0)
      -[UINavigationBar _setDecodedUnlockedWithNavigationControllerDelegate:](v12, "_setDecodedUnlockedWithNavigationControllerDelegate:", 1);
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIToolbar"));
    v15 = objc_claimAutoreleasedReturnValue();
    toolbar = v5->_toolbar;
    v5->_toolbar = (UIToolbar *)v15;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_delegate, v17);

    *(_QWORD *)&v5->_navigationControllerFlags = *(_QWORD *)&v5->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFELL | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UINavigationBarHidden"));
    v18 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIToolbarShown"));
    v19 = 2;
    if (!v18)
      v19 = 0;
    *(_QWORD *)&v5->_navigationControllerFlags = *(_QWORD *)&v5->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFDLL | v19;
    v5->_builtinTransitionStyle = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UINavigationControllerTransitionStyle"));
    if ((*(_QWORD *)&v5->_navigationControllerFlags & 1) != 0)
      -[UIView setHidden:](v5->_navigationBar, "setHidden:", 1);
    -[NSCoder decodeFloatForKey:](v4, "decodeFloatForKey:", CFSTR("UINavigationControllerTransitionGap"));
    -[UINavigationController _commonInitWithBuiltinTransitionGap:](v5, "_commonInitWithBuiltinTransitionGap:", v20);
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UINavigationControllerCondensesBarsWhenKeyboardAppears")))
    {
      -[UINavigationController setHidesBarsWhenKeyboardAppears:](v5, "setHidesBarsWhenKeyboardAppears:", 1);
    }
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UINavigationControllerCondensesBarsOnSwipe")))
      -[UINavigationController setHidesBarsOnSwipe:](v5, "setHidesBarsOnSwipe:", 1);
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UINavigationControllerHidesBarsWhenVerticallyCompact")))
    {
      -[UINavigationController setHidesBarsWhenVerticallyCompact:](v5, "setHidesBarsWhenVerticallyCompact:", 1);
    }
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UINavigationControllerHidesBarsOnTap")))
      -[UINavigationController setHidesBarsOnTap:](v5, "setHidesBarsOnTap:", 1);
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UINavigationControllerCreatedBySplitViewController")))
    {
      *((_BYTE *)&v5->_navigationControllerFlags + 8) |= 1u;
    }
    v21 = v5->_navigationBar;
    -[UINavigationController _navigationItemsCallingPublicAccessor:](v5, "_navigationItemsCallingPublicAccessor:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar _setDecodedItems:](v21, "_setDecodedItems:", v22);

    transitionManager = v5->_transitionManager;
    if (transitionManager)
    {
      -[UINavigationController viewControllers](v5, "viewControllers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIViewControllerTransitionManager configureWithInitialViewControllers:](transitionManager, "configureWithInitialViewControllers:", v24);

    }
  }

  return v5;
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UINavigationController;
  v6 = a3;
  -[UIViewController removeChildViewController:notifyDidMove:](&v11, sel_removeChildViewController_notifyDidMove_, v6, v4);
  objc_msgSend(v6, "_viewControllerForObservableScrollView", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_contentOrObservableScrollViewForEdge:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_contentOrObservableScrollViewForEdge:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_isScrollViewScrollObserver:", self))
  {
    -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v8);
LABEL_6:
    -[UINavigationController topViewController](self, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _resetScrollViewObservingForViewController:](self, "_resetScrollViewObservingForViewController:", v10);

    goto LABEL_7;
  }
  if (v9 != v8 && objc_msgSend(v9, "_isScrollViewScrollObserver:", self))
  {
    objc_msgSend(v9, "_removeScrollViewScrollObserver:", self);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_prepareForNormalDisplayWithNavigationController:(id)a3
{
  void *v4;
  void *v5;
  $16004AA6B36EC19B1B0093A5EF089ED3 *p_navigationControllerFlags;
  uint64_t navigationControllerFlags;
  char v8;
  unint64_t *v9;
  unint64_t v10;
  char v11;
  UIView *paletteClippingView;
  unint64_t *v13;

  v13 = (unint64_t *)a3;
  if (-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
  {
    -[UINavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 1);

    -[UINavigationController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_redisplayItems");

    objc_msgSend(v13, "_noteNestedNavigationControllerDidReturnToNormal:", self);
    -[UINavigationController _setTemporaryWindowLocator:](self, "_setTemporaryWindowLocator:", v13);
    -[UINavigationController _setIsNestedNavigationController:](self, "_setIsNestedNavigationController:", 0);
    p_navigationControllerFlags = &self->_navigationControllerFlags;
    navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x880000000000) == 0x80000000000)
    {
      -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 0, 0);
      navigationControllerFlags = *(_QWORD *)p_navigationControllerFlags;
    }
    v8 = *((_BYTE *)&self->_navigationControllerFlags + 8);
    *(_QWORD *)p_navigationControllerFlags = navigationControllerFlags & 0xFFFFF7FFFFFFFFFFLL;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v8;
    v9 = v13 + 153;
    v10 = v13[153];
    if ((v10 & 0x100000000000) != 0)
    {
      objc_msgSend(v13, "setToolbarHidden:", 0);
      v10 = *v9;
    }
    v11 = *((_BYTE *)v13 + 1232);
    *v9 = v10 & 0xFFFFEFFFFFFFFFFFLL;
    *((_BYTE *)v13 + 1232) = v11;
    -[UINavigationController _setTemporaryWindowLocator:](self, "_setTemporaryWindowLocator:", 0);
    -[UIViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
    -[UIView removeFromSuperview](self->_paletteClippingView, "removeFromSuperview");
    paletteClippingView = self->_paletteClippingView;
    self->_paletteClippingView = 0;

  }
}

- (void)_setTemporaryWindowLocator:(id)a3
{
  objc_storeStrong((id *)&self->__temporaryWindowLocator, a3);
}

- (void)_noteNestedNavigationControllerDidReturnToNormal:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_topViewControllerObservableScrollViewForEdge:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v4);

  objc_msgSend(v6, "_topViewControllerObservableScrollViewForEdge:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _stopObservingContentScrollView:](self, "_stopObservingContentScrollView:", v5);

  -[UINavigationController _detachTopPaletteIfShowingSearchBarForTopmostViewControllerInNavigationController:](self, "_detachTopPaletteIfShowingSearchBarForTopmostViewControllerInNavigationController:", v6);
}

- (void)_detachTopPaletteIfShowingSearchBarForTopmostViewControllerInNavigationController:(id)a3
{
  UINavigationController *v4;
  UINavigationController *v5;
  _BYTE *v6;
  unint64_t v7;
  NSObject *v8;
  _UINavigationControllerPalette *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  unint64_t v15;
  NSObject *v16;
  _UINavigationControllerPalette *topPalette;
  int v18;
  _UINavigationControllerPalette *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  UINavigationController *v23;
  __int16 v24;
  UINavigationController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (UINavigationController *)a3;
  -[_UINavigationControllerPalette navController](self->_topPalette, "navController");
  v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6 = (_BYTE *)qword_1EDDB0EA8;
    if (!qword_1EDDB0EA8)
    {
      v6 = (_BYTE *)(__UILogCategoryGetNode("", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
      atomic_store((unint64_t)v6, (unint64_t *)&qword_1EDDB0EA8);
    }
    if ((*v6 & 1) != 0)
    {
      if (v4 == self)
      {
        v15 = qword_1EDDB0EB0;
        if (!qword_1EDDB0EB0)
        {
          v15 = __UILogCategoryGetNode("Navigation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&qword_1EDDB0EB0);
        }
        if ((*(_BYTE *)v15 & 1) == 0)
          goto LABEL_5;
        v16 = *(NSObject **)(v15 + 8);
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_5;
        topPalette = self->_topPalette;
        v10 = v16;
        -[_UINavigationControllerPalette navController](topPalette, "navController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = topPalette;
        v20 = 2112;
        v21 = v11;
        v22 = 2112;
        v23 = self;
        v12 = "Palette %@ belongs to nav controller %@, which is not the nav controller which should be displaying it (%@)";
        v13 = v10;
        v14 = 32;
      }
      else
      {
        v7 = qword_1EDDB0EB8;
        if (!qword_1EDDB0EB8)
        {
          v7 = __UILogCategoryGetNode("Navigation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&qword_1EDDB0EB8);
        }
        if ((*(_BYTE *)v7 & 1) == 0)
          goto LABEL_5;
        v8 = *(NSObject **)(v7 + 8);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_5;
        v9 = self->_topPalette;
        v10 = v8;
        -[_UINavigationControllerPalette navController](v9, "navController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138413058;
        v19 = v9;
        v20 = 2112;
        v21 = v11;
        v22 = 2112;
        v23 = self;
        v24 = 2112;
        v25 = v4;
        v12 = "Palette %@ belongs to nav controller %@, which is neither outer (%@) or inner (%@) nav controller";
        v13 = v10;
        v14 = 42;
      }
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v18, v14);

    }
  }
LABEL_5:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__barTapHideGesture, 0);
  objc_storeStrong((id *)&self->__barInteractiveAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->__barSwipeHideGesture, 0);
  objc_storeStrong(&self->__keyboardAppearedNotificationToken, 0);
  objc_destroyWeak((id *)&self->__managedTabGroup);
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong(&self->__updateNavigationBarHandler, 0);
  objc_storeStrong((id *)&self->__navbarAnimationId, 0);
  objc_storeStrong((id *)&self->__toolbarAnimationId, 0);
  objc_storeStrong((id *)&self->_transitionManager, 0);
  objc_storeStrong((id *)&self->__temporaryWindowLocator, 0);
  objc_storeStrong((id *)&self->_rememberedFocusedItemsByViewController, 0);
  objc_storeStrong((id *)&self->_transitionConductor, 0);
  objc_storeStrong((id *)&self->_cleanupHelper, 0);
  objc_destroyWeak((id *)&self->_searchControllerToNotifyWhenScrollingAnimationStops);
  objc_storeStrong((id *)&self->_windowRotationLockAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutGuideTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_scrollViewManager, 0);
  objc_storeStrong((id *)&self->_overridingDestinationItemForFocusUpdate, 0);
  objc_storeStrong((id *)&self->_lastContentMarginForView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_transitioningTopPalette, 0);
  objc_storeStrong((id *)&self->_freePalette, 0);
  objc_storeStrong((id *)&self->_paletteClippingView, 0);
  objc_storeStrong((id *)&self->_topPalette, 0);
  objc_storeStrong((id *)&self->_backKeyCommand, 0);
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideTraitCollectionForPoppingViewControler, 0);
  objc_storeStrong((id *)&self->_deferredTransitionContext, 0);
  objc_storeStrong((id *)&self->_disappearingViewController, 0);
  objc_storeStrong((id *)&self->_navigationTransitionView, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (id)_lastNavigationItems
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;

  v3 = -[UIViewController childViewControllersCount](self, "childViewControllersCount");
  if (v3 < 2)
  {
    v6 = 0;
  }
  else
  {
    v4 = v3;
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i != v4; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  return v6;
}

uint64_t __40__UINavigationController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFinishingModalTransition");
}

uint64_t __41__UINavigationController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPerformingModalTransition");
}

- (NSArray)popToRootViewControllerAnimated:(BOOL)animated
{
  uint64_t v3;

  if (animated)
    v3 = 2;
  else
    v3 = 0;
  return (NSArray *)-[UINavigationController popToRootViewControllerWithTransition:](self, "popToRootViewControllerWithTransition:", v3);
}

- (void)_navigationBar:(id)a3 itemBackButtonUpdated:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_navigationController:navigationBar:itemBackButtonUpdated:", self, v7, v6);

}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  -[UIViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[UINavigationController _setupBackGestureRecognizer](self, "_setupBackGestureRecognizer");
  if (+[UIView _uip_transitionEnabled]())
    -[UINavigationController _updateBarsForCurrentInterfaceOrientation](self, "_updateBarsForCurrentInterfaceOrientation");
}

- (void)_layoutContainerViewDidMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  -[UIViewController _layoutContainerViewDidMoveToWindow:](&v4, sel__layoutContainerViewDidMoveToWindow_, a3);
  -[UINavigationController _setupBackGestureRecognizer](self, "_setupBackGestureRecognizer");
}

- (void)_setupBackGestureRecognizer
{
  void *v3;
  unint64_t v4;
  uint64_t v6;
  UITapGestureRecognizer *v7;
  void *v8;
  void *v9;
  char v10;
  UITapGestureRecognizer *v11;
  UITapGestureRecognizer *v12;
  UITapGestureRecognizer *v13;
  void *v14;
  void *v15;
  UITapGestureRecognizer *backGestureRecognizer;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 > 8 || ((1 << v4) & 0x10C) == 0)
  {
    if (self->_backGestureRecognizer)
    {
      -[UIView removeGestureRecognizer:](self->_containerView, "removeGestureRecognizer:");
      backGestureRecognizer = self->_backGestureRecognizer;
      self->_backGestureRecognizer = 0;

    }
  }
  else
  {
    if (v4 == 3)
      v6 = 7;
    else
      v6 = 5;
    v7 = self->_backGestureRecognizer;
    if (!v7)
      goto LABEL_12;
    -[UIGestureRecognizer allowedPressTypes](v7, "allowedPressTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if ((v10 & 1) == 0)
    {
      -[UIView removeGestureRecognizer:](self->_containerView, "removeGestureRecognizer:", self->_backGestureRecognizer);
      v11 = self->_backGestureRecognizer;
      self->_backGestureRecognizer = 0;

    }
    if (!self->_backGestureRecognizer)
    {
LABEL_12:
      v12 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__performBackGesture_);
      v13 = self->_backGestureRecognizer;
      self->_backGestureRecognizer = v12;

      -[UIGestureRecognizer setDelegate:](self->_backGestureRecognizer, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITapGestureRecognizer setAllowedPressTypes:](self->_backGestureRecognizer, "setAllowedPressTypes:", v15);

      -[UIGestureRecognizer setAllowedTouchTypes:](self->_backGestureRecognizer, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
      -[UIView addGestureRecognizer:](self->_containerView, "addGestureRecognizer:", self->_backGestureRecognizer);
    }
  }
}

- (double)_topBarHeight
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _UINavigationControllerPalette *topPalette;
  double v9;

  v3 = 0.0;
  if (-[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible"))
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v3 = v5;

  }
  -[UINavigationController _statusBarHeightForCurrentInterfaceOrientation](self, "_statusBarHeightForCurrentInterfaceOrientation");
  v7 = v3 + v6;
  topPalette = self->_topPalette;
  if (topPalette
    && -[_UINavigationControllerPalette isAttached](topPalette, "isAttached")
    && (-[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible")
     || -[_UINavigationControllerPalette isVisibleWhenPinningBarIsHidden](self->_topPalette, "isVisibleWhenPinningBarIsHidden")))
  {
    -[UIView bounds](self->_topPalette, "bounds");
    return v7 + v9;
  }
  return v7;
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  UINavigationController *v3;
  UINavigationController *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    v3 = self;
    v4 = v3;
    if (self->__positionBarsExclusivelyWithSafeArea
      && (-[UIViewController _existingView](v3, "_existingView"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "_usesMinimumSafeAreas"),
          v5,
          v6))
    {
      -[UIViewController _existingView](v4, "_existingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_minimumSafeAreaInsets");
      v9 = v8;

    }
    else
    {
      -[UIViewController _contentOverlayInsets](v4, "_contentOverlayInsets");
      v9 = v10;
    }

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    -[UIViewController _statusBarHeightForCurrentInterfaceOrientation](&v13, sel__statusBarHeightForCurrentInterfaceOrientation);
    return v11;
  }
  return v9;
}

void __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 && !objc_msgSend(*(id *)(a1 + 32), "_allowNestedNavigationControllers")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(*(id *)(a1 + 32), "_allowChildSplitViewControllers") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("UISplitViewControllers");
    if ((isKindOfClass & 1) != 0)
      v6 = CFSTR("UINavigationControllers");
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UINavigationController.m"), 1399, CFSTR("%@ are not allowed in a navigation controller!"), v6);

  }
}

- (id)paletteForEdge:(unint64_t)a3 size:(CGSize)a4
{
  double height;
  double width;
  UIView *v8;
  _UINavigationBarBridgingPalette *v9;

  height = a4.height;
  width = a4.width;
  if (_UIGetBarNavigationPaletteEnabled())
  {
    v8 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    v9 = -[_UINavigationBarPalette initWithContentView:]([_UINavigationBarBridgingPalette alloc], "initWithContentView:", v8);

  }
  else
  {
    -[UINavigationController _paletteForEdge:size:paletteClass:](self, "_paletteForEdge:size:paletteClass:", a3, objc_opt_class(), width, height);
    v9 = (_UINavigationBarBridgingPalette *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_paletteForEdge:(unint64_t)a3 size:(CGSize)a4 paletteClass:(Class)a5
{
  double height;
  double width;
  void *v11;
  char v12;
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
  NSObject *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  int v28;
  void *v29;
  uint64_t v30;

  height = a4.height;
  width = a4.width;
  v30 = *MEMORY[0x1E0C80C00];
  if (a3 != 2 && a3 != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 11622, CFSTR("Only edge = UIBoundaryEdgeTop and UIBoundaryEdgeTopAbove are currently supported!"));

  }
  v12 = -[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class());
  if (os_variant_has_internal_diagnostics())
  {
    if ((v12 & 1) != 0)
      goto LABEL_6;
    __UIFaultDebugAssertLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    NSStringFromClass(a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v25;
    _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "DEBUG ASSERTION: Requested to make a palette of a class that isn't a subclass of _UINavigationControllerPalette. Requested class = %@. Making a _UINavigationControllerPalette instead on release builds of UIKit.", (uint8_t *)&v28, 0xCu);
LABEL_14:

LABEL_15:
LABEL_16:
    a5 = (Class)objc_opt_class();
    goto LABEL_6;
  }
  if ((v12 & 1) == 0)
  {
    v26 = _paletteForEdge_size_paletteClass____s_category;
    if (!_paletteForEdge_size_paletteClass____s_category)
    {
      v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v26, (unint64_t *)&_paletteForEdge_size_paletteClass____s_category);
    }
    v27 = *(NSObject **)(v26 + 8);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v24 = v27;
    NSStringFromClass(a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v25;
    _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "DEBUG ASSERTION: Requested to make a palette of a class that isn't a subclass of _UINavigationControllerPalette. Requested class = %@. Making a _UINavigationControllerPalette instead on release builds of UIKit.", (uint8_t *)&v28, 0xCu);
    goto LABEL_14;
  }
LABEL_6:
  v13 = (void *)objc_msgSend([a5 alloc], "_initWithNavigationController:forEdge:", self, a3);
  -[UINavigationController _boundsForPalette:size:](self, "_boundsForPalette:size:", v13, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v13, "_setSize:", width, height);
  objc_msgSend(v13, "setBounds:", v15, v17, v19, v21);
  -[UINavigationController _pinningBarForPalette:](self, "_pinningBarForPalette:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 0);
  objc_msgSend(v13, "_setPinningBar:", v22);

  return v13;
}

- (id)_pinningBarForPalette:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "boundaryEdge");
  if (v4)
  {
    if (v4 == (void *)5 || v4 == (void *)2)
    {
      -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Palettes currently can only have a top boundary edge or no boundary edge"));
      v4 = 0;
    }
  }
  return v4;
}

- (CGRect)_boundsForPalette:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  uint64_t v7;
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
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = objc_msgSend(a3, "boundaryEdge");
  if (v7)
  {
    if (v7 == 5 || v7 == 2)
    {
      -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;
      v12 = v11;
      width = v13;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Palettes currently can only have a top boundary edge or no boundary edge"));
      height = 0.0;
      width = 0.0;
      v12 = 0.0;
      v10 = 0.0;
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v14 = v10;
  v15 = v12;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  UINavigationController *v5;
  _UITVScrollViewManager *scrollViewManager;
  objc_super v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
    objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);

  -[UINavigationController _setKeyboardAppearedNotificationToken:](self, "_setKeyboardAppearedNotificationToken:", 0);
  -[UINavigationController _setBarSwipeHideGesture:](self, "_setBarSwipeHideGesture:", 0);
  -[UINavigationController _setInteractiveAnimationCoordinator:](self, "_setInteractiveAnimationCoordinator:", 0);
  -[UINavigationController _setBarTapHideGesture:](self, "_setBarTapHideGesture:", 0);
  -[UINavigationController _releaseContainerViews](self, "_releaseContainerViews");
  -[UINavigationBar setLocked:](self->_navigationBar, "setLocked:", 0);
  -[UINavigationBar delegate](self->_navigationBar, "delegate");
  v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[UINavigationBar setDelegate:](self->_navigationBar, "setDelegate:", 0);
  -[UIGestureRecognizer setDelegate:](self->_backGestureRecognizer, "setDelegate:", 0);
  -[_UIViewControllerTransitionConductor setTransitionController:](self->_transitionConductor, "setTransitionController:", 0);
  -[_UIViewControllerTransitionConductor setInteractiveTransitionController:](self->_transitionConductor, "setInteractiveTransitionController:", 0);
  -[UINavigationController _setToolbarAnimationId:](self, "_setToolbarAnimationId:", 0);
  scrollViewManager = self->_scrollViewManager;
  self->_scrollViewManager = 0;

  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  -[UIViewController dealloc](&v7, sel_dealloc);
}

- (void)_setTransitionController:(id)a3
{
  -[_UIViewControllerTransitionConductor setTransitionController:](self->_transitionConductor, "setTransitionController:", a3);
}

- (void)_setToolbarAnimationId:(id)a3
{
  objc_storeStrong((id *)&self->__toolbarAnimationId, a3);
}

- (void)_setInteractiveAnimationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->__barInteractiveAnimationCoordinator, a3);
}

- (void)_setInteractionController:(id)a3
{
  -[_UIViewControllerTransitionConductor setInteractiveTransitionController:](self->_transitionConductor, "setInteractiveTransitionController:", a3);
}

- (void)_setBarTapHideGesture:(id)a3
{
  objc_storeStrong((id *)&self->__barTapHideGesture, a3);
}

- (void)_setBarSwipeHideGesture:(id)a3
{
  objc_storeStrong((id *)&self->__barSwipeHideGesture, a3);
}

- (void)_releaseContainerViews
{
  UINavigationController *v3;
  UILayoutContainerView *containerView;
  UINavigationTransitionView *navigationTransitionView;

  -[UILayoutContainerView delegate](self->_containerView, "delegate");
  v3 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[UILayoutContainerView setDelegate:](self->_containerView, "setDelegate:", 0);
  containerView = self->_containerView;
  self->_containerView = 0;

  navigationTransitionView = self->_navigationTransitionView;
  self->_navigationTransitionView = 0;

}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;

  -[UIViewController interactionActivityTrackingBaseName](self, "interactionActivityTrackingBaseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UINavigationController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    {
      -[UINavigationController topViewController](self, "topViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_effectiveInteractionActivityTrackingBaseName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(CFSTR("UINC-"), "stringByAppendingString:", v5);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)_navigationBar:(id)a3 topItemUpdatedContentLayout:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_navigationController:navigationBar:topItemUpdatedContentLayout:", self, v7, v6);

}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
  _BOOL8 v4;
  NSArray *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSArray *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSArray *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  NSArray *v35;
  NSArray *v36;
  BOOL v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[8];
  _QWORD v41[4];
  NSArray *v42;
  id v43;
  _QWORD v44[5];
  NSArray *v45;
  BOOL v46;
  _QWORD aBlock[6];

  v4 = animated;
  v7 = viewControllers;
  if (!self || (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) == 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__UINavigationController_setViewControllers_animated___block_invoke;
    aBlock[3] = &unk_1E16C05B0;
    aBlock[4] = self;
    v9 = _Block_copy(aBlock);
    -[UINavigationController _transitionCoordinator](self, "_transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (-[UINavigationController _transitionConflictsWithNavigationTransitions:](self, "_transitionConflictsWithNavigationTransitions:", v10))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%@ called on <%@ %p> while an existing transition or presentation is occurring; the navigation stack will not be updated."),
          v11,
          v13,
          self);

LABEL_35:
        goto LABEL_36;
      }
      v44[0] = v8;
      v44[1] = 3221225472;
      v44[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_2;
      v44[3] = &unk_1E16C05D8;
      v44[4] = self;
      v14 = v7;
      v45 = v14;
      v46 = v4;
      v15 = _Block_copy(v44);
      if (!v4 && objc_msgSend(v10, "presentationStyle") != -1)
      {
        v41[0] = v8;
        v41[1] = 3221225472;
        v41[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_4;
        v41[3] = &unk_1E16B2F48;
        v43 = v9;
        v42 = v14;
        +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v41);

        v16 = v43;
LABEL_33:

        v28 = v45;
        goto LABEL_34;
      }
      if (-[UINavigationController _isCurrentTransitionPreemptable](self, "_isCurrentTransitionPreemptable"))
      {
        -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
        v33 = objc_claimAutoreleasedReturnValue();
        -[_UIViewControllerTransitionConductor transitionController](self->_transitionConductor, "transitionController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v17;
        objc_msgSend(v17, "preemptWithContext:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
        {
          if (v20 == v33)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 1197, CFSTR("Failed to preempt running transition."));

            v25 = v32;
            v16 = (id)v33;
          }
          else
          {
            v22 = setViewControllers_animated____s_category;
            if (!setViewControllers_animated____s_category)
            {
              v22 = __UILogCategoryGetNode("UINavigationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v22, (unint64_t *)&setViewControllers_animated____s_category);
            }
            v23 = *(NSObject **)(v22 + 8);
            v16 = (id)v33;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "A transition was started while preempting previous transition. Deferring new transition.", buf, 2u);
            }
            -[UINavigationController _transitionCoordinator](self, "_transitionCoordinator");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(void *, void *))v15 + 2))(v15, v24);

            v25 = v32;
          }
        }
        else
        {
          -[UIView layoutIfNeeded](self->_navigationBar, "layoutIfNeeded");
          -[_UIViewControllerTransitionConductor setPendingPreemptionHandoffData:](self->_transitionConductor, "setPendingPreemptionHandoffData:", v19);
          (*((void (**)(void *, NSArray *, _BOOL8))v9 + 2))(v9, v14, v4);
          v25 = v32;
          v16 = (id)v33;
        }

      }
      else
      {
        (*((void (**)(void *, void *))v15 + 2))(v15, v10);
        v16 = v10;
        if (sel__addInvalidationHandler_)
        {
          -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "_state");
          v30 = objc_opt_respondsToSelector();

          if ((v30 & 1) == 0)
            goto LABEL_33;
        }
        else if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          goto LABEL_33;
        }
        -[UILayoutContainerView _disableUserInteractionForReason:](self->_containerView, "_disableUserInteractionForReason:", CFSTR("setViewControllers"));
        v38[0] = v8;
        v38[1] = 3221225472;
        v38[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_261;
        v38[3] = &unk_1E16B1B28;
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v25 = v39;
        objc_msgSend(v16, "_addInvalidationHandler:", v38);

      }
      goto LABEL_33;
    }
    if (-[UINavigationController _isTransitioning](self, "_isTransitioning"))
    {
      if (!v4)
      {
LABEL_23:
        (*((void (**)(void *, NSArray *, _BOOL8))v9 + 2))(v9, v7, v4);
        goto LABEL_35;
      }
    }
    else if (!-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition") || !v4)
    {
      goto LABEL_23;
    }
    v26 = dyld_program_sdk_at_least() ^ 1;
    v27 = (void *)UIApp;
    v34[0] = v8;
    v34[1] = 3221225472;
    v34[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_2_262;
    v34[3] = &unk_1E16C0600;
    v36 = v9;
    v35 = v7;
    v37 = v4;
    objc_msgSend(v27, "_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:block:", v26, v34);

    v28 = v36;
LABEL_34:

    goto LABEL_35;
  }
LABEL_36:

}

- (void)setViewControllers:(NSArray *)viewControllers
{
  -[UINavigationController setViewControllers:animated:](self, "setViewControllers:animated:", viewControllers, 0);
}

- (void)_setAllowNestedNavigationControllers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (void)_setClipUnderlapWhileTransitioning:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (void)detachPalette:(id)a3
{
  UINavigationController *v4;
  UINavigationController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v4 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == self)
  {
    if (_UIGetBarNavigationPaletteEnabled())
    {
      -[UINavigationController disappearingViewController](self, "disappearingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_bottomPalette");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPinned:", 0);

      -[UINavigationController topViewController](self, "topViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setBottomPalette:", 0);

    }
    else
    {
      -[UINavigationController detachPalette:isInPaletteTransition:](self, "detachPalette:isInPaletteTransition:", v11, 0);
    }
  }
  else
  {
    -[UINavigationController detachPalette:](v4, "detachPalette:", v11);
  }

}

- (void)_collapseViewController:(id)a3 forSplitViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "_isNavigationController"))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  v11 = v10;
  if (v10)
  {
    v12 = *((_QWORD *)v10 + 153) & 0x800000000000;
    *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFF7FFFFFFFFFFFLL | v12;
  }
  else
  {
    v12 = *(_QWORD *)&self->_navigationControllerFlags & 0x800000000000;
  }
  if (v12)
    -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, 0);
  -[UIViewController _keyboardSceneDelegate](self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "responder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "_shouldAttemptToPreserveInputViewsForResponder:", v14);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_preserveInputViewsWithId:", v16);

    objc_msgSend(v13, "responder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resignFirstResponder");

  }
  if (os_variant_has_internal_diagnostics())
  {
    v27 = qword_1EDDB0F10;
    if (!qword_1EDDB0F10)
    {
      v27 = __UILogCategoryGetNode("UINavigationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&qword_1EDDB0F10);
    }
    v28 = *(NSObject **)(v27 + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v29 = 138477827;
      *(_QWORD *)&v29[4] = v7;
      _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "UINavigationController for collapsing UISplitViewController about to push view controller %{private}@", v29, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v8, "_panelImpl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = qword_1EDDB0F18;
      if (!qword_1EDDB0F18)
      {
        v19 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1EDDB0F18);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        *(_DWORD *)v29 = 138543618;
        *(_QWORD *)&v29[4] = objc_opt_class();
        *(_WORD *)&v29[12] = 2048;
        *(_QWORD *)&v29[14] = v7;
        v22 = *(id *)&v29[4];
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "UINavigationController for collapsing UISplitViewController about to push view controller <%{public}@: %p>", v29, 0x16u);

      }
      if (objc_msgSend(v8, "isCollapsed", *(_OWORD *)v29, *(_QWORD *)&v29[16], v30))
      {
        -[UINavigationController viewControllers](self, "viewControllers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v7);

        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 10595, CFSTR("UISplitViewController collapse will push the same view controller a second time"));

        }
      }
    }
  }
  -[UINavigationController pushViewController:animated:](self, "pushViewController:animated:", v7, 0);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_restoreInputViewsWithId:animated:", v26, 0);

}

- (NSArray)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  uint64_t v4;

  if (animated)
    v4 = 2;
  else
    v4 = 0;
  return (NSArray *)-[UINavigationController popToViewController:transition:](self, "popToViewController:transition:", viewController, v4);
}

- (id)popToRootViewControllerWithTransition:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController popToViewController:transition:](self, "popToViewController:transition:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  objc_super v10;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[UINavigationController topViewController](self, "topViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "canBecomeFirstResponder"),
        v5,
        v4,
        v6))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "becomeFirstResponder");

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UINavigationController;
    return -[UIResponder becomeFirstResponder](&v10, sel_becomeFirstResponder);
  }
}

- (void)_setBuiltinTransitionStyle:(int64_t)a3
{
  void *v4;
  id v5;

  self->_builtinTransitionStyle = a3;
  -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setTransitionStyle:", self->_builtinTransitionStyle);

  }
}

- (void)_tabBarControllerDidFinishShowingTabBar:(id)a3 isHidden:(BOOL)a4
{
  unsigned int v5;
  void *v6;

  if (a4)
  {
    if (-[UINavigationController _didExplicitlyHideTabBar](self, "_didExplicitlyHideTabBar", a3))
      v5 = 0;
    else
      v5 = 1024;
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFF3FFFFFBFFLL | v5;
  -[UINavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v6);

  -[UINavigationController _layoutTopViewController](self, "_layoutTopViewController");
}

- (BOOL)_didExplicitlyHideTabBar
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 11) & 1;
}

- (int64_t)_builtinTransitionStyle
{
  return self->_builtinTransitionStyle;
}

void __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];

  v16 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_shouldHideBarsForTraits:", v4);

  v6 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)v5)
  {
    v7 = objc_msgSend(v6, "_useCrossFadeForGestureHiding");
    objc_msgSend(*(id *)(a1 + 32), "_existingNavigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      if (v7)
        v10 = 15;
      else
        v10 = 1;
      objc_msgSend(v16, "transitionDuration");
      objc_msgSend(v9, "_setNavigationBarHidden:edge:duration:", 1, v10);
    }
  }
  else
  {
    if (!v6[1258])
      goto LABEL_19;
    v7 = objc_msgSend(v6, "_useCrossFadeForGestureHiding");
    objc_msgSend(*(id *)(a1 + 32), "_existingNavigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = *(void **)(a1 + 32);
      if (v7)
        v12 = 15;
      else
        v12 = 1;
      objc_msgSend(v16, "transitionDuration");
      objc_msgSend(v11, "_setNavigationBarHidden:edge:duration:", 0, v12);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
      v17[3] = &unk_1E16B1B28;
      v17[4] = *(_QWORD *)(a1 + 32);
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_existingToolbarWithItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    if (v7)
      v15 = 15;
    else
      v15 = 4;
    objc_msgSend(v16, "transitionDuration");
    objc_msgSend(v14, "_setToolbarHidden:edge:duration:", v5, v15);
  }

  v6 = *(_BYTE **)(a1 + 32);
LABEL_19:
  objc_msgSend(v6, "_requestNavigationBarUpdateSearchBarForPlacementChangeIfApplicable");
  objc_msgSend(*(id *)(a1 + 32), "_updateBarsForCurrentInterfaceOrientation");

}

- (BOOL)_shouldHideBarsForTraits:(id)a3
{
  return objc_msgSend(a3, "verticalSizeClass") == 1 && self->_hidesBarsWhenVerticallyCompact;
}

- (void)_requestNavigationBarUpdateSearchBarForPlacementChangeIfApplicable
{
  if (-[UINavigationController _isNavigationBarEffectivelyVisible](self, "_isNavigationBarEffectivelyVisible"))
    -[UINavigationBar _updateSearchBarForPlacementChangeIfApplicable](self->_navigationBar, "_updateSearchBarForPlacementChangeIfApplicable");
}

- (int64_t)modalTransitionStyle
{
  uint64_t modalTransitionStyle;
  void *v4;
  void *v5;

  modalTransitionStyle = self->super._modalTransitionStyle;
  if (modalTransitionStyle == -1)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      modalTransitionStyle = objc_msgSend(v5, "modalTransitionStyle");

    }
    else
    {
      modalTransitionStyle = 0;
    }

  }
  return modalTransitionStyle;
}

- (id)existingPaletteForEdge:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *transitioningTopPalette;
  id v8;
  UINavigationController *v9;
  UINavigationController *v10;
  void *v12;
  int v13;
  uint64_t v14;

  if (_UIGetBarNavigationPaletteEnabled())
  {
    -[UINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bottomPalette");
    self = (UINavigationController *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      transitioningTopPalette = self;
    else
      transitioningTopPalette = 0;
  }
  else
  {
    -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
    v9 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
    if (v9 != self)
    {
      v10 = v9;
      -[UINavigationController existingPaletteForEdge:](v9, "existingPaletteForEdge:", a3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      self = v10;
      goto LABEL_8;
    }
    -[UIViewController transitionCoordinator](self, "transitionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isCancelled");

    if (a3)
    {
      if (a3 != 5 && a3 != 2)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Palettes currently can only have a top boundary edge or no boundary edge"));
        v8 = 0;
        goto LABEL_8;
      }
      if (v13)
      {
        transitioningTopPalette = self->_transitioningTopPalette;
        if (transitioningTopPalette)
          goto LABEL_5;
      }
      v14 = 1080;
    }
    else
    {
      v14 = 1096;
    }
    transitioningTopPalette = *(Class *)((char *)&self->super.super.super.isa + v14);
  }
LABEL_5:
  v8 = transitioningTopPalette;
LABEL_8:

  return v8;
}

- (void)_setUseStandardStatusBarHeight:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  _QWORD v15[5];

  if (((((*(_QWORD *)&self->_navigationControllerFlags & 0x2000000000) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UIViewController _existingView](self, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v6 = 0x2000000000;
    if (!v3)
      v6 = 0;
    *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFDFFFFFFFFFLL | v6;
    v7 = 0.0;
    if (v3)
    {
      objc_msgSend(v13, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "interfaceOrientation");

      __UIStatusBarManagerForWindow(v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if ((unint64_t)(v9 - 1) > 3)
        objc_msgSend(v10, "statusBarHeight");
      else
        objc_msgSend(v10, "defaultStatusBarHeightInOrientation:", v9);
      v7 = v12;

    }
    self->_statusBarHeightForHideShow = v7;
    -[UINavigationBar _setOverrideBackgroundExtension:](self->_navigationBar, "_setOverrideBackgroundExtension:", v7, v13);
    if ((*(_DWORD *)&self->_navigationControllerFlags & 1) == 0
      && !-[UIViewController _freezeLayoutForOrientationChangeOnDismissal](self, "_freezeLayoutForOrientationChangeOnDismissal"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __57__UINavigationController__setUseStandardStatusBarHeight___block_invoke;
      v15[3] = &unk_1E16B1B28;
      v15[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);
    }

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditing:animated:", v5, v4);

}

id __57__UINavigationController_popToViewController_transition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    v6 = objc_msgSend(v3, "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 32));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v6 + 1;
      objc_msgSend(v3, "subarrayWithRange:", v10, objc_msgSend(v3, "count") - v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      objc_msgSend(v3, "subarrayWithRange:", 0, v10);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Tried to pop to a view controller that doesn't exist.", buf, 2u);
      }

    }
    else
    {
      v7 = _UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke_2___s_category;
      if (!_UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke_2___s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke_2___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Tried to pop to a view controller that doesn't exist.", v17, 2u);
      }
    }
  }
  v9 = v3;
LABEL_10:
  v14 = v9;

  return v14;
}

- (id)popViewControllerWithTransition:(int)a3
{
  return -[UINavigationController _popViewControllerWithTransition:allowPoppingLast:](self, "_popViewControllerWithTransition:allowPoppingLast:", *(_QWORD *)&a3, 0);
}

- (id)_popViewControllerWithTransition:(int)a3 allowPoppingLast:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  BOOL v23;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[UINavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = v8 == 1 && v4;
  if (v8 <= 1 && !v9)
    return 0;
  v11 = -[UINavigationController _effectiveTransitionForTransition:](self, "_effectiveTransitionForTransition:", v5);
  -[UINavigationController topViewController](self, "topViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least())
  {
    if (self)
      v15 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 < 2;
    else
      v15 = 0;
  }
  else
  {
    v15 = -[UIViewController _appearState](self, "_appearState") == 2;
  }
  if (!v14)
    v15 = 0;
  if (!(_DWORD)v11)
    v15 = 0;
  v16 = v8 != 1 && v15;
  if (!-[UIResponder _disableAutomaticKeyboardBehavior](self, "_disableAutomaticKeyboardBehavior"))
  {
    -[UIViewController _keyboardSceneDelegate](self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "responder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "_shouldAttemptToPreserveInputViewsForResponder:", v18);

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_preserveInputViewsWithId:", v20);

    }
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__UINavigationController__popViewControllerWithTransition_allowPoppingLast___block_invoke;
  v22[3] = &__block_descriptor_41_e26___NSArray_16__0__NSArray_8l;
  v22[4] = v8;
  v23 = v4;
  v21 = _Block_copy(v22);
  -[UINavigationController _applyViewControllers:transition:animated:operation:rescheduleBlock:](self, "_applyViewControllers:transition:animated:operation:rescheduleBlock:", v21, v11, v16, 2, 0);

  return v12;
}

- (id)popToViewController:(id)a3 transition:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__52;
  v22 = __Block_byref_object_dispose__52;
  v23 = 0;
  -[UINavigationController topViewController](self, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __57__UINavigationController_popToViewController_transition___block_invoke;
    v15 = &unk_1E16C0920;
    v16 = v6;
    v17 = &v18;
    v8 = _Block_copy(&v12);
    v9 = -[UINavigationController _effectiveTransitionForTransition:](self, "_effectiveTransitionForTransition:", v4, v12, v13, v14, v15);
    -[UINavigationController _applyViewControllers:transition:animated:operation:rescheduleBlock:](self, "_applyViewControllers:transition:animated:operation:rescheduleBlock:", v8, v9, (_DWORD)v9 != 0, 2, 0);

  }
  v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (BOOL)_transitionConflictsWithNavigationTransitions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "presentationStyle") == 4
    || objc_msgSend(v4, "presentationStyle") == 3
    || objc_msgSend(v4, "presentationStyle") == 6)
  {
    objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 || objc_msgSend(v4, "presentationStyle") != 4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __72__UINavigationController__transitionConflictsWithNavigationTransitions___block_invoke;
      v9[3] = &unk_1E16C0948;
      v10 = v5;
      v7 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, v9) ^ 1;
      v6 = v10;
    }
    else
    {
      objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = v6 != 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_navigationBar:(id)a3 itemEnabledAutoScrollTransition:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (_isNestedNavigationControllerFullyInstalledIntoContainingNavigationController(self))
  {
    -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_navigationBar:itemEnabledAutoScrollTransition:", v11, v6);
LABEL_11:

    goto LABEL_12;
  }
  -[UINavigationBar topItem](self->_navigationBar, "topItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 4, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v9)
      v10 = 5;
    else
      v10 = 1;
    -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v6, v7, v10);
    if (v9 && v6 != v9)
      -[UINavigationController _updateAndObserveScrollView:viewController:forEdges:](self, "_updateAndObserveScrollView:viewController:forEdges:", v9, v7, 4);

    goto LABEL_11;
  }
LABEL_12:

}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", sel_preferredInterfaceOrientationForPresentation, objc_opt_class());
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UINavigationBar *navigationBar;
  UIToolbar *toolbar;
  id WeakRetained;
  uint64_t navigationControllerFlags;
  double builtinTransitionGap;
  int64_t builtinTransitionStyle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UINavigationController;
  -[UIViewController encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  navigationBar = self->_navigationBar;
  if (navigationBar)
    objc_msgSend(v4, "encodeObject:forKey:", navigationBar, CFSTR("UINavigationBar"));
  toolbar = self->_toolbar;
  if (toolbar)
    objc_msgSend(v4, "encodeObject:forKey:", toolbar, CFSTR("UIToolbar"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 1) != 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UINavigationBarHidden"));
    navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  }
  if ((navigationControllerFlags & 2) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIToolbarShown"));
  builtinTransitionGap = self->_builtinTransitionGap;
  if (builtinTransitionGap != 0.0)
  {
    *(float *)&builtinTransitionGap = builtinTransitionGap;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UINavigationControllerTransitionGap"), builtinTransitionGap);
  }
  builtinTransitionStyle = self->_builtinTransitionStyle;
  if (builtinTransitionStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", builtinTransitionStyle, CFSTR("UINavigationControllerTransitionStyle"));
  if (self->_hidesBarsWhenKeyboardAppears)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UINavigationControllerCondensesBarsWhenKeyboardAppears"));
  if (self->_hidesBarsOnSwipe)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UINavigationControllerCondensesBarsOnSwipe"));
  if (self->_hidesBarsWhenVerticallyCompact)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UINavigationControllerHidesBarsWhenVerticallyCompact"));
  if (self->_hidesBarsOnTap)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UINavigationControllerHidesBarsOnTap"));
  if ((*((_BYTE *)&self->_navigationControllerFlags + 8) & 1) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UINavigationControllerCreatedBySplitViewController"));

}

void __38__UINavigationController_setDelegate___block_invoke(uint64_t a1)
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
  v2 = _UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke___s_category;
  if (!_UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke___s_category);
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

void __38__UINavigationController_setDelegate___block_invoke_226(uint64_t a1)
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

- (BOOL)_isCrossfadingOutTabBar
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 34) & 1;
}

- (BOOL)_isCrossfadingInTabBar
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 35) & 1;
}

- (void)_setCrossfadingOutTabBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (void)_setCrossfadingInTabBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (void)_setDidExplicitlyHideTabBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFF7FFLL | v3;
}

uint64_t __57__UINavigationController__setUseStandardStatusBarHeight___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_positionNavigationBarHidden:edge:initialOffset:", 0, 1, 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_positionPaletteHidden:edge:initialOffset:", 0, 1, 0.0);
}

- (BOOL)_useCurrentStatusBarHeight
{
  return 0;
}

- (BOOL)allowUserInteractionDuringTransition
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 38) & 1;
}

- (void)setAllowUserInteractionDuringTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)enableBackButtonDuringTransition
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 39) & 1;
}

- (void)setEnableBackButtonDuringTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (int)_effectiveTransitionForTransition:(int)a3
{
  if (+[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions"))
    return a3;
  else
    return 0;
}

void __54__UINavigationController_setViewControllers_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_3;
  v5[3] = &unk_1E16BCC58;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(_BYTE *)(a1 + 48);
  objc_msgSend(a2, "animateAlongsideTransition:completion:", 0, v5);

}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewControllers:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_261(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_2_262(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)_hasNestedNavigationController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "_isNestedNavigationController") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_setAllowChildSplitViewControllers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)_allowChildSplitViewControllers
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 42) & 1;
}

id __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_setViewControllers:(id)a3 transition:(int)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  v6 = v4;
  if (!(_DWORD)v4)
  {
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UINavigationController _transitionForOldViewControllers:newViewControllers:](self, "_transitionForOldViewControllers:newViewControllers:", v7, v8);

  }
  -[UINavigationController _setViewControllers:transition:animated:](self, "_setViewControllers:transition:animated:", v8, v6, (_DWORD)v4 != 0);

}

- (void)_applyViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6 rescheduleBlock:(id)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void (**v38)(_QWORD, void *);
  void *v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[16];
  _QWORD v43[5];
  id v44;
  id v45;
  int64_t v46;
  int v47;
  BOOL v48;
  _QWORD aBlock[5];
  id v50;
  int64_t v51;
  int v52;
  BOOL v53;

  v9 = a5;
  v13 = a3;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke;
  aBlock[3] = &unk_1E16C0650;
  v16 = v13;
  aBlock[4] = self;
  v50 = v16;
  v52 = a4;
  v53 = v9;
  v51 = a6;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[UINavigationController _transitionCoordinator](self, "_transitionCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    if (-[UINavigationController _isTransitioning](self, "_isTransitioning"))
    {
      if (!v9)
      {
LABEL_21:
        v17[2](v17);
        goto LABEL_34;
      }
    }
    else if (!-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition") || !v9)
    {
      goto LABEL_21;
    }
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v17);
    goto LABEL_34;
  }
  if (!-[UINavigationController _transitionConflictsWithNavigationTransitions:](self, "_transitionConflictsWithNavigationTransitions:", v18))
  {
    v43[0] = v15;
    v43[1] = 3221225472;
    v43[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_2;
    v43[3] = &unk_1E16C06A0;
    v43[4] = self;
    v44 = v14;
    v47 = a4;
    v48 = v9;
    v45 = v16;
    v46 = a6;
    v22 = _Block_copy(v43);
    if (!v9 && objc_msgSend(v18, "presentationStyle") != -1)
    {
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v17);
      dyld_program_sdk_at_least();
LABEL_33:

      goto LABEL_34;
    }
    if (!-[UINavigationController _isCurrentTransitionPreemptable](self, "_isCurrentTransitionPreemptable"))
    {
      (*((void (**)(void *, void *))v22 + 2))(v22, v18);
      v29 = v18;
      if (sel__addInvalidationHandler_)
      {
        -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
        v34 = v29;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "_state");
        v36 = objc_opt_respondsToSelector();

        v29 = v34;
        if ((v36 & 1) == 0)
          goto LABEL_32;
      }
      else if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_32:

        goto LABEL_33;
      }
      -[UILayoutContainerView _disableUserInteractionForReason:](self->_containerView, "_disableUserInteractionForReason:", CFSTR("_applyViewControllers"));
      v40[0] = v15;
      v40[1] = 3221225472;
      v40[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_282;
      v40[3] = &unk_1E16B1B28;
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v33 = v41;
      objc_msgSend(v29, "_addInvalidationHandler:", v40);
      v26 = v41;
LABEL_31:

      goto LABEL_32;
    }
    v38 = (void (**)(_QWORD, void *))v22;
    -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
    v23 = objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerTransitionConductor transitionController](self->_transitionConductor, "transitionController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v24;
    objc_msgSend(v24, "preemptWithContext:", v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
    {
      v29 = (id)v23;
      if (v27 != v23)
      {
        v30 = _applyViewControllers_transition_animated_operation_rescheduleBlock____s_category;
        if (!_applyViewControllers_transition_animated_operation_rescheduleBlock____s_category)
        {
          v30 = __UILogCategoryGetNode("UINavigationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v30, (unint64_t *)&_applyViewControllers_transition_animated_operation_rescheduleBlock____s_category);
        }
        v31 = *(NSObject **)(v30 + 8);
        v22 = v38;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_DEFAULT, "A transition was started while preempting previous transition. Deferring new transition.", buf, 2u);
        }
        -[UINavigationController _transitionCoordinator](self, "_transitionCoordinator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2](v38, v32);

        v33 = v39;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 1514, CFSTR("Failed to preempt running transition."));

      v33 = v39;
    }
    else
    {
      -[UIView layoutIfNeeded](self->_navigationBar, "layoutIfNeeded");
      -[_UIViewControllerTransitionConductor setPendingPreemptionHandoffData:](self->_transitionConductor, "setPendingPreemptionHandoffData:", v26);
      v17[2](v17);
      v33 = v39;
      v29 = (id)v23;
    }
    v22 = v38;
LABEL_30:

    goto LABEL_31;
  }
  NSStringFromSelector(a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ called on <%@ %p> while an existing transition or presentation is occurring; the navigation stack will not be updated."),
    v19,
    v21,
    self);

LABEL_34:
}

void __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_immediatelyApplyViewControllers:transition:animated:operation:", v4, *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60), *(_QWORD *)(a1 + 48));
}

void __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  int v11;
  char v12;
  _QWORD v13[4];
  id v14;

  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_3;
    v13[3] = &unk_1E16B1CC8;
    v14 = v3;
    objc_msgSend(a2, "animateAlongsideTransition:completion:", 0, v13);
    v4 = v14;
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_4;
    v8[3] = &unk_1E16C0678;
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 48);
    v11 = *(_DWORD *)(a1 + 64);
    v12 = *(_BYTE *)(a1 + 68);
    v7 = *(_QWORD *)(a1 + 56);
    v9 = v6;
    v10 = v7;
    objc_msgSend(a2, "animateAlongsideTransition:completion:", 0, v8);
    v4 = v9;
  }

}

uint64_t __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyViewControllers:transition:animated:operation:rescheduleBlock:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_282(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_immediatelyApplyViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6
{
  _BOOL4 v6;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  _UIUnsafeUnretainedCleanupHelper *cleanupHelper;
  _UIUnsafeUnretainedCleanupHelper *v25;
  _UIUnsafeUnretainedCleanupHelper *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v30;
  uint64_t i;
  void *v32;
  int v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  int v44;
  char v46;
  char v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void (**v53)(_QWORD);
  _UIViewControllerTransitionManager *transitionManager;
  _UIViewControllerTransitionManager *v55;
  _UIViewControllerTransitionManager *v56;
  _UIViewControllerTransitionManager *v57;
  int v58;
  _BOOL4 v59;
  int64_t v60;
  unsigned int v61;
  _BOOL4 v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL4 v66;
  void *v67;
  BOOL v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  BOOL v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  uint64_t v85;
  UIViewController *v86;
  _UIViewControllerTransitionConductor **p_transitionConductor;
  unint64_t navigationControllerFlags;
  _BOOL4 v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v96;
  int v98;
  _BOOL4 v99;
  void *v100;
  int v101;
  id v102;
  id v103;
  int64_t v104;
  _BOOL4 v105;
  _BOOL4 v106;
  id obj;
  id obja;
  _QWORD v109[5];
  id v110;
  void (**v111)(_QWORD);
  char v112;
  _QWORD aBlock[5];
  id v114;
  id v115;
  id v116;
  id v117;
  int v118;
  BOOL v119;
  _QWORD v120[4];
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  id location;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;

  v6 = a5;
  v135 = *MEMORY[0x1E0C80C00];
  v103 = a3;
  navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  -[UIViewController _existingView](self, "_existingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = v6 && ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 < 2;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 == 3)
  {
    v11 = v103;
    v9 = v103;
    v10 = v93;
  }
  else
  {
    objc_msgSend(v103, "arrayByExcludingObjectsInArray:", v93);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "arrayByExcludingObjectsInArray:", v103);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v103;
  }
  v90 = v9;
  v91 = objc_msgSend(v9, "count");
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self, "topViewController");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96 == v12)
  {
    v99 = v92 == 0;
    *(_QWORD *)&self->_navigationControllerFlags &= ~0x100uLL;
    -[_UIViewControllerTransitionConductor setDeferredTransitionType:](self->_transitionConductor, "setDeferredTransitionType:", 0);
    v105 = 0;
    v98 = 0;
    v89 = a4 != 0;
  }
  else if (v92)
  {
    -[UINavigationController disappearingViewController](self, "disappearingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

      v98 = 0;
      v99 = 0;
      v89 = 0;
    }
    else
    {
      v99 = 0;
      if (-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition")
        || (navigationControllerFlags & 4) != 0)
      {
        v15 = 0;
        v89 = 0;
      }
      else
      {
        -[UINavigationController topViewController](self, "topViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController setDisappearingViewController:](self, "setDisappearingViewController:", v14);

        v99 = 0;
        v89 = 0;
        v15 = 1;
      }
      v98 = v15;
    }
  }
  else
  {
    v89 = 0;
    v98 = 0;
    v99 = 1;
  }
  -[UINavigationController disappearingViewController](self, "disappearingViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    -[UINavigationController topViewController](self, "topViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
  }
  -[UINavigationController topViewController](self, "topViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = 0;
  v18 = v105;
  if (!v17)
    v18 = 0;
  v105 = v18;
  v19 = a4;
  if (!v17)
    v19 = 0;
  a4 = v19;
LABEL_27:
  v21 = v98 ^ 1;
  if (a6 != 2)
    v21 = 1;
  if ((v21 & 1) == 0)
  {
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    cleanupHelper = self->_cleanupHelper;
    if (cleanupHelper
      || (v25 = (_UIUnsafeUnretainedCleanupHelper *)-[_UIUnsafeUnretainedCleanupHelper initWithParent:deallocationHandler:]([_UIUnsafeUnretainedCleanupHelper alloc], (uint64_t)self, &__block_literal_global_309_0), v26 = self->_cleanupHelper, self->_cleanupHelper = v25, v26, (cleanupHelper = self->_cleanupHelper) != 0))
    {
      -[NSHashTable addObject:](cleanupHelper->_children, "addObject:", v23);
    }

    objc_msgSend(v22, "removeLastObject");
  }
  v101 = dyld_program_sdk_at_least();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v10;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v130;
    v30 = v96 == v12 || v91 != 0;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v130 != v28)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
        if ((objc_msgSend(v103, "containsObject:", v32) & 1) == 0)
        {
          -[UINavigationController disappearingViewController](self, "disappearingViewController");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v32 != v35;

          -[UINavigationController disappearingViewController](self, "disappearingViewController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32 == v36)
            v33 = v98;
          else
            v33 = 0;

          if (v33)
          {
            *(_QWORD *)&self->_navigationControllerFlags |= 0x1000000000000uLL;
LABEL_53:
            objc_msgSend(v32, "willMoveToParentViewController:", 0);
            goto LABEL_54;
          }
          if (v32 != v35)
          {
            v34 = 1;
            goto LABEL_53;
          }
        }
        v33 = 0;
        v34 = 0;
LABEL_54:
        if (!v30)
        {
          objc_msgSend(obj, "lastObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v32 == v37;

          if (v38)
          {
            if (((dyld_program_sdk_at_least() ^ 1 | v99) & 1) != 0)
            {
              -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
            }
            else
            {
              objc_initWeak(&location, self);
              v126[0] = MEMORY[0x1E0C809B0];
              v126[1] = 3221225472;
              v126[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke;
              v126[3] = &unk_1E16BFED8;
              objc_copyWeak(&v127, &location);
              -[UIViewController _performAtViewIsAppearing:]((uint64_t)v12, v126);
              objc_destroyWeak(&v127);
              objc_destroyWeak(&location);
            }
          }
        }
        if (objc_msgSend(v32, "_isNestedNavigationController") & v34)
          objc_msgSend(v32, "_prepareForNormalDisplayWithNavigationController:", self);
        if ((v105 & v33 & v101 & 1) != 0)
          *(_QWORD *)&self->_navigationControllerFlags |= 0x2000000000000uLL;
        else
          -[UINavigationController removeChildViewController:notifyDidMove:](self, "removeChildViewController:notifyDidMove:", v32, v34);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
    }
    while (v27);
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v39 = v90;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v122, v133, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v123;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v123 != v41)
          objc_enumerationMutation(v39);
        v43 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
        v44 = objc_msgSend(obj, "containsObject:", v43);
        if ((v44 & 1) == 0
          && -[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers"))
        {
          objc_msgSend(v43, "_prepareForNestedDisplayWithNavigationController:", self);
        }
        -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:](self, "_addChildViewController:performHierarchyCheck:notifyWillMove:", v43, 0, v44 ^ 1u);
        if (v43 == v12 && v96 != v12)
        {
          if (((dyld_program_sdk_at_least() ^ 1 | v99) & 1) != 0)
          {
            if (self)
              -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
          }
          else
          {
            objc_initWeak(&location, self);
            v120[0] = MEMORY[0x1E0C809B0];
            v120[1] = 3221225472;
            v120[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_2;
            v120[3] = &unk_1E16BFED8;
            objc_copyWeak(&v121, &location);
            -[UIViewController _performAtViewIsAppearing:]((uint64_t)v12, v120);
            objc_destroyWeak(&v121);
            objc_destroyWeak(&location);
          }
        }
        if (v43 == v12)
          v46 = 1;
        else
          v46 = v44;
        if ((v46 & 1) == 0)
          objc_msgSend(v43, "didMoveToParentViewController:", self);
        v47 = v44 ^ 1;
        if (v43 != v12)
          v47 = 1;
        if ((v47 & 1) == 0)
          -[UINavigationController _resetScrollViewObservingForViewController:](self, "_resetScrollViewObservingForViewController:", v12);
      }
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v122, v133, 16);
    }
    while (v40);
  }

  if (!-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
    -[UINavigationBar _redisplayItems](self->_navigationBar, "_redisplayItems");
  objc_msgSend((id)UIApp, "_deactivateReachability");
  if (v94)
  {
    objc_msgSend(v94, "parentViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
        goto LABEL_100;
      objc_msgSend(v94, "_existingView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "superview");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "removeFromSuperview");

    }
  }
LABEL_100:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_3;
  aBlock[3] = &unk_1E16C06E8;
  aBlock[4] = self;
  v102 = v39;
  v114 = v102;
  v50 = obj;
  v115 = v50;
  v119 = v105;
  v118 = a4;
  v51 = v103;
  v116 = v51;
  v52 = v12;
  v117 = v52;
  v53 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self)
    transitionManager = self->_transitionManager;
  else
    transitionManager = 0;
  v55 = transitionManager;

  if (v55)
  {
    if (self)
      v56 = self->_transitionManager;
    else
      v56 = 0;
    v57 = v56;
    -[_UIViewControllerTransitionManager applyViewControllers:](v57, "applyViewControllers:", v51);

  }
  v58 = v89;
  if (v96 != v12)
    v58 = 1;
  if (v58 == 1)
  {
    v59 = v92 != 0;
    v60 = 2;
    if (a4 != 2)
      v60 = 3;
    if (a4 == 1)
      v60 = 1;
    if (a6 != 3)
      v60 = a6;
    v104 = v60;
    v61 = -[UINavigationController _effectiveTransitionForTransition:](self, "_effectiveTransitionForTransition:");
    if (v61)
      v62 = v105;
    else
      v62 = 0;
    v106 = v62;
    v63 = 256;
    if (!v59 || !v62)
      v63 = 0;
    *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFE0FLL | (16 * (v104 & 0xF)) | v63;
    if (v59 && v62)
      v64 = v61;
    else
      v64 = 0;
    -[_UIViewControllerTransitionConductor setDeferredTransitionType:](self->_transitionConductor, "setDeferredTransitionType:", v64);
    if (((navigationControllerFlags >> 2) & 1) != 0)
    {
      v66 = a6 != 3 && v91 != 0;
      obja = _Block_copy(v53);
    }
    else
    {
      -[UINavigationController setNeedsDeferredTransition](self, "setNeedsDeferredTransition");
      obja = _Block_copy(v53);
      if (v106)
      {
        *(_QWORD *)&self->_navigationControllerFlags |= 0x10000uLL;
        -[UINavigationController _customTransitionController:](self, "_customTransitionController:", 1);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIViewControllerTransitionConductor setTransitionController:](self->_transitionConductor, "setTransitionController:", v100);
        +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v100);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69 && objc_msgSend(v100, "conformsToProtocol:", &unk_1EDDCE3D0))
          v70 = objc_msgSend(v100, "shouldPreemptWithContext:", v69);
        else
          v70 = 0;
        v74 = -[UINavigationController allowUserInteractionDuringTransition](self, "allowUserInteractionDuringTransition") | v70;
        objc_msgSend(v69, "_setAllowUserInteraction:", v74);
        -[UINavigationController disappearingViewController](self, "disappearingViewController");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController _presentationTransitionWrapViewController:forTransitionContext:](self, "_presentationTransitionWrapViewController:forTransitionContext:", v75, v69);

        if (v69)
        {
          -[UINavigationController _customInteractionController:](self, "_customInteractionController:", v69);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIViewControllerTransitionConductor setInteractiveTransitionController:](self->_transitionConductor, "setInteractiveTransitionController:", v76);
          objc_msgSend(v100, "transitionDuration:", v69);
          -[_UIViewControllerTransitionConductor setCustomNavigationTransitionDuration:](self->_transitionConductor, "setCustomNavigationTransitionDuration:");
          -[_UIViewControllerTransitionConductor customNavigationTransitionDuration](self->_transitionConductor, "customNavigationTransitionDuration");
          objc_msgSend(v69, "_setDuration:");
          v109[0] = MEMORY[0x1E0C809B0];
          v109[1] = 3221225472;
          v109[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_6;
          v109[3] = &unk_1E16B1CF0;
          v112 = v74;
          v109[4] = self;
          v110 = v69;
          v111 = v53;
          v77 = _Block_copy(v109);

          obja = v77;
        }

        v66 = 1;
      }
      else
      {
        -[UINavigationController disappearingViewController](self, "disappearingViewController");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController _presentationTransitionWrapViewController:forTransitionContext:](self, "_presentationTransitionWrapViewController:forTransitionContext:", v71, 0);

        if (!self->_navigationBar
          && (-[UIViewController _existingView](self, "_existingView"),
              v72 = (void *)objc_claimAutoreleasedReturnValue(),
              v73 = v72 == 0,
              v72,
              v73))
        {
          v66 = a6 != 3 && v91 != 0;
        }
        else
        {
          v53[2](v53);
          v66 = 0;
        }
        -[UINavigationController _propagateContentAdjustmentsForControllersWithSharedViews](self, "_propagateContentAdjustmentsForControllersWithSharedViews");
      }
    }
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      -[UINavigationController _navigationToolbarTransitionController](self, "_navigationToolbarTransitionController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _existingToolbar](self, "_existingToolbar");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "prepareTransitionWithToolbar:", v80);

    }
    -[UINavigationController _hideOrShowBottomBarIfNeededWithTransition:](self, "_hideOrShowBottomBarIfNeededWithTransition:", v64);
    -[UIViewController _existingTabBarItem](self, "_existingTabBarItem");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v81, "isSystemItem") & 1) == 0)
    {
      -[UINavigationController tab](self, "tab");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82 == 0;

      if (!v83)
      {
LABEL_156:
        if (v66)
          -[UINavigationController _executeNavigationHandler:deferred:](self, "_executeNavigationHandler:deferred:", obja, 1);
        if (!+[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions")
          && !v106)
        {
          p_transitionConductor = &self->_transitionConductor;
          -[_UIViewControllerTransitionConductor setTransitionController:](*p_transitionConductor, "setTransitionController:", 0);
          -[_UIViewControllerTransitionConductor startDeferredTransitionIfNeeded](*p_transitionConductor, "startDeferredTransitionIfNeeded");
        }

        goto LABEL_161;
      }
      -[UINavigationController bottomViewController](self, "bottomViewController");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "title");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = objc_msgSend(v81, "length");
      if (v104 == 1 && v85 && !objc_msgSend(v93, "count"))
        -[UIViewController setTitle:](self, "setTitle:", v81);
      v86 = self->super._parentViewController;
      -[UIViewController updateTabBarItemForViewController:](v86, "updateTabBarItemForViewController:", self);

    }
    goto LABEL_156;
  }
  if (self->_navigationBar
    || (-[UIViewController _existingView](self, "_existingView"),
        v67 = (void *)objc_claimAutoreleasedReturnValue(),
        v68 = v67 == 0,
        v67,
        !v68))
  {
    v53[2](v53);
  }
LABEL_161:

}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[UIViewController _invalidatePreferences:excluding:](WeakRetained, -1, 0);
    WeakRetained = v2;
  }

}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[UIViewController _invalidatePreferences:excluding:](WeakRetained, -1, 0);
    WeakRetained = v2;
  }

}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isNavigationBarHidden")
    && !objc_msgSend(*(id *)(a1 + 32), "_isNestedNavigationController"))
  {
    if (*(_BYTE *)(a1 + 76) && objc_msgSend(*(id *)(a1 + 32), "_hasPotentiallyChromelessBottomBar"))
      objc_msgSend(*(id *)(a1 + 32), "_startCoordinatedBottomBarUpdateForTransition:", *(unsigned int *)(a1 + 72));
  }
  else
  {
    objc_msgSend(v2, "setLocked:", 0);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v57 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "_isNestedNavigationController") & 1) != 0)
          {
            v8 = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v5)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_13:

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v53;
      while (2)
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v53 != v12)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "_isNestedNavigationController"))
          {

            goto LABEL_29;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v11)
          continue;
        break;
      }
    }

    if ((v8 & 1) != 0 || objc_msgSend(*(id *)(a1 + 32), "_isNestedNavigationController"))
    {
LABEL_29:
      v40 = v2;
      v16 = objc_msgSend(*(id *)(a1 + 40), "count");
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(*(id *)(a1 + 48), "reverseObjectEnumerator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v49;
        do
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
            if (objc_msgSend(v22, "_isNestedNavigationController"))
            {
              objc_msgSend(v22, "navigationBar");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "_stack");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "iterateEntries:", &__block_literal_global_285);
            }
            if (*(_BYTE *)(a1 + 76))
            {
              objc_msgSend(*(id *)(a1 + 48), "firstObject");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22 == v25 && v16 == 0)
                v27 = *(unsigned int *)(a1 + 72);
              else
                v27 = 0;

            }
            else
            {
              v27 = 0;
            }
            -[UIViewController _removeNavigationItemsFromNavigationController:transition:](v22, *(void **)(a1 + 32), v27);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        }
        while (v19);
      }

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v28 = *(id *)(a1 + 40);
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v45;
        do
        {
          for (m = 0; m != v30; ++m)
          {
            if (*(_QWORD *)v45 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * m);
            if (*(_BYTE *)(a1 + 76))
            {
              objc_msgSend(*(id *)(a1 + 40), "lastObject");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33 == v34)
                v35 = *(unsigned int *)(a1 + 72);
              else
                v35 = 0;

            }
            else
            {
              v35 = 0;
            }
            -[UIViewController _appendNavigationItemsToNavigationController:transition:](v33, *(void **)(a1 + 32), v35);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        }
        while (v30);
      }

      objc_msgSend(*(id *)(a1 + 32), "_updateContainersForStackChange");
      v2 = v40;
    }
    else
    {
      objc_msgSend(v2, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_navigationItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_updateNavigationBar:fromItems:toItems:animated:", v2, v14, v15, *(unsigned __int8 *)(a1 + 76));
      if (*(_BYTE *)(a1 + 76)
        && objc_msgSend(*(id *)(a1 + 32), "_hasPotentiallyChromelessBottomBar")
        && !objc_msgSend(v2, "_transitionForOldItems:newItems:", v14, v15))
      {
        objc_msgSend(*(id *)(a1 + 32), "_startCoordinatedBottomBarUpdateForTransition:", *(unsigned int *)(a1 + 72));
      }

    }
    objc_msgSend(v2, "setLocked:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "disappearingViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "_isNestedNavigationController") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", v36) & 1) != 0)
      goto LABEL_73;
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "_isNestedNavigationController") & 1) == 0)
  {
    goto LABEL_73;
  }
  objc_msgSend(*(id *)(a1 + 32), "_transitionCoordinator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_5;
    v41[3] = &unk_1E16B2E68;
    v38 = v36;
    v39 = *(_QWORD *)(a1 + 32);
    v42 = v38;
    v43 = v39;
    objc_msgSend(v37, "animateAlongsideTransition:completion:", 0, v41);

  }
  else
  {
    objc_msgSend(v36, "_prepareForNormalDisplayWithNavigationController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_updateInteractivePopGestureEnabledState");
  }

LABEL_73:
  objc_msgSend(*(id *)(a1 + 32), "_forwardPaletteToViewControllerIfNeeded:", *(_QWORD *)(a1 + 64));

}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "item");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stackEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStateFromCounterpart:", v3);

}

uint64_t __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_5(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_prepareForNormalDisplayWithNavigationController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "_updateInteractivePopGestureEnabledState");
}

uint64_t __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;

  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_rootAncestorViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_viewsWithDisabledInteractionGivenTransitionContext:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_disableInteractionForViews:", v3);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __82__UINavigationController__ensureParentViewControllerReferenceIsCleanedUpForChild___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (*(_QWORD *)(v9 + 104) == a2)
          *(_QWORD *)(v9 + 104) = 0;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UIView setClipsToBounds:](self->_navigationTransitionView, "setClipsToBounds:", v3);
}

- (void)_setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  UINavigationTransitionView *navigationTransitionView;
  double v9;
  double v10;
  double v11;
  double v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  navigationTransitionView = self->_navigationTransitionView;
  -[UIView frame](navigationTransitionView, "frame");
  -[UIView setFrame:](navigationTransitionView, "setFrame:", left + v9, top + v10, v11 - (left + right), v12 - (top + bottom));
}

- (void)_setBuiltinTransitionGap:(double)a3
{
  void *v4;
  id v5;

  self->_builtinTransitionGap = a3;
  -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setTransitionGap:", self->_builtinTransitionGap);

  }
}

- (void)_finishAnimationTracking
{
  if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
  {
    +[UIViewPropertyAnimator _finishTrackingAnimations](UIViewPropertyAnimator, "_finishTrackingAnimations");
  }
  else
  {
    +[UIView _finishAnimationTracking](UIView, "_finishAnimationTracking");
  }
}

- (id)_startInteractiveBarTransition:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;

  v4 = a3;
  -[UINavigationController _setNavigationBarAnimationWasCancelled:](self, "_setNavigationBarAnimationWasCancelled:", 0);
  -[UINavigationController _setToolbarAnimationWasCancelled:](self, "_setToolbarAnimationWasCancelled:", 0);
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
  {
    if (!+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
    {
      v5 = +[UIViewPropertyAnimator _startTrackingAnimations](UIViewPropertyAnimator, "_startTrackingAnimations");
      +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", 1);
    }
    +[UIViewPropertyAnimator _currentTrackedAnimationsUUID](UIViewPropertyAnimator, "_currentTrackedAnimationsUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _startAnimationTracking](UIView, "_startAnimationTracking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 0;
    objc_msgSend(v7, "setSpeed:", v8);
    objc_msgSend(v7, "setTimeOffset:", 0.0);

  }
  return v6;
}

- (void)_startInteractiveToolbarTransition
{
  void *v3;
  id v4;

  if (qword_1EDDB0E70 != -1)
    dispatch_once(&qword_1EDDB0E70, &__block_literal_global_315);
  if (-[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition"))
  {
    v4 = (id)qword_1EDDB0E68;
  }
  else
  {
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _startInteractiveBarTransition:](self, "_startInteractiveBarTransition:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UINavigationController _setToolbarAnimationId:](self, "_setToolbarAnimationId:", v4);

}

void __60__UINavigationController__startInteractiveToolbarTransition__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EDDB0E68;
  qword_1EDDB0E68 = v0;

}

- (void)_startInteractiveNavbarTransition
{
  id v3;
  id v4;

  if (qword_1EDDB0E80 != -1)
    dispatch_once(&qword_1EDDB0E80, &__block_literal_global_317);
  if (-[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition"))
  {
    v3 = (id)qword_1EDDB0E78;
  }
  else
  {
    -[UINavigationController _startInteractiveBarTransition:](self, "_startInteractiveBarTransition:", self->_navigationBar);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  -[UINavigationController _setNavbarAnimationId:](self, "_setNavbarAnimationId:", v3);

}

void __59__UINavigationController__startInteractiveNavbarTransition__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EDDB0E78;
  qword_1EDDB0E78 = v0;

}

- (void)_updateInteractiveBarTransition:(id)a3 withUUID:(id)a4 percent:(double)a5 isFinished:(BOOL)a6 didComplete:(BOOL)a7 completionSpeed:(double)a8 completionCurve:(int64_t)a9
{
  _BOOL4 v11;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  UICubicTimingParameters *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v11 = a7;
  v26 = a3;
  v16 = a4;
  if (!-[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition"))
  {
    if (+[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_containsAnimatorForTrackedAnimationsUUID:", v16))
    {
      +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a6)
      {
        v19 = 1.0 - a5;
        if (!v11)
          v19 = a5;
        v20 = v19 / a8;
        v21 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", a9);
        objc_msgSend(v18, "setReversed:", !v11);
        objc_msgSend(v18, "continueAnimationWithTimingParameters:durationFactor:", v21, v20);

      }
      else
      {
        objc_msgSend(v17, "setFractionComplete:", a5);
      }
    }
    else
    {
      objc_msgSend(v26, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIViewControllerTransitionConductor customNavigationTransitionDuration](self->_transitionConductor, "customNavigationTransitionDuration");
      v23 = v22;
      if (a6)
      {
        objc_msgSend(v18, "timeOffset");
        if (v11)
          v24 = v23 - v24;
        +[UIView _completeAnimationWithUUID:duration:curve:reverse:](UIView, "_completeAnimationWithUUID:duration:curve:reverse:", v16, a9, !v11, v24);
        *(float *)&v25 = a8;
        objc_msgSend(v18, "setSpeed:", v25);
      }
      else
      {
        objc_msgSend(v18, "setTimeOffset:", v22 * a5);
      }
    }

  }
}

- (void)_updateInteractiveTransition:(double)a3
{
  double v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3 >= 0.0)
    v4 = a3;
  else
    v4 = 0.0;
  v5 = -[UINavigationController _navbarIsAppearingInteractively](self, "_navbarIsAppearingInteractively");
  -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    -[UINavigationController _navbarAnimationId](self, "_navbarAnimationId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v7, v8, 0, 0, 3, v4, 1.0);

  }
  else
  {
    objc_msgSend(v6, "_updateInteractiveTransition:", v4);
  }

  if (-[UINavigationController _toolbarIsAnimatingInteractively](self, "_toolbarIsAnimatingInteractively"))
  {
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _toolbarAnimationId](self, "_toolbarAnimationId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v10, v9, 0, 0, 3, v4, 1.0);

  }
}

- (void)_finishInteractiveTransition:(double)a3 transitionContext:(id)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v14 = a4;
  v6 = -[UINavigationController _navbarIsAppearingInteractively](self, "_navbarIsAppearingInteractively");
  -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UINavigationController _navbarAnimationId](self, "_navbarAnimationId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_completionVelocity");
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v7, v8, 1, 1, objc_msgSend(v14, "_completionCurve"), a3, v9);

  }
  else
  {
    objc_msgSend(v14, "_completionVelocity");
    objc_msgSend(v7, "_finishInteractiveTransition:completionSpeed:completionCurve:", objc_msgSend(v14, "_completionCurve"), a3, v10);
  }

  if (-[UINavigationController _toolbarIsAnimatingInteractively](self, "_toolbarIsAnimatingInteractively"))
  {
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _toolbarAnimationId](self, "_toolbarAnimationId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_completionVelocity");
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v11, v12, 1, 1, objc_msgSend(v14, "_completionCurve"), a3, v13);

  }
}

- (void)_cancelInteractiveTransition:(double)a3 transitionContext:(id)a4
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "_completionVelocity");
  v7 = v6;
  if (-[UINavigationController _navbarIsAppearingInteractively](self, "_navbarIsAppearingInteractively"))
  {
    -[UINavigationController _setNavigationBarAnimationWasCancelled:](self, "_setNavigationBarAnimationWasCancelled:", 1);
    -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _navbarAnimationId](self, "_navbarAnimationId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v8, v9, 1, 0, objc_msgSend(v14, "_completionCurve"), a3, fabs(v7));

  }
  else
  {
    -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_completionVelocity");
    objc_msgSend(v8, "_cancelInteractiveTransition:completionSpeed:completionCurve:", objc_msgSend(v14, "_completionCurve"), a3, fabs(v10));
  }

  if (-[UINavigationController _toolbarIsAnimatingInteractively](self, "_toolbarIsAnimatingInteractively"))
  {
    -[UINavigationController _setToolbarAnimationWasCancelled:](self, "_setToolbarAnimationWasCancelled:", 1);
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _toolbarAnimationId](self, "_toolbarAnimationId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_completionVelocity");
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v11, v12, 1, 0, objc_msgSend(v14, "_completionCurve"), a3, fabs(v13));

  }
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  uint64_t navigationControllerFlags;
  id WeakRetained;
  char v6;

  if (-[UINavigationController _isUsingBuiltinAnimator](self, "_isUsingBuiltinAnimator")
    && -[_UINavigationControllerVisualStyle isUsingParallaxTransition](self->_visualStyle, "isUsingParallaxTransition"))
  {
    return 0;
  }
  if (-[_UIViewControllerTransitionConductor shouldCrossFadeNavigationBar](self->_transitionConductor, "shouldCrossFadeNavigationBar"))
  {
    return 1;
  }
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x2000000) == 0)
    return (navigationControllerFlags & 0x600000) != 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "_navigationControllerShouldCrossFadeNavigationBar:", self);

  return v6;
}

- (int64_t)_navigationBarTransitionVariant
{
  int64_t result;

  result = -[_UIViewControllerTransitionConductor navigationBarTransitionVariant](self->_transitionConductor, "navigationBarTransitionVariant");
  if (!result)
    return -[UINavigationController _shouldCrossFadeNavigationBar](self, "_shouldCrossFadeNavigationBar");
  return result;
}

- (id)_navigationBarTransitionOverlay
{
  return -[_UIViewControllerTransitionConductor navigationBarTransitionOverlay](self->_transitionConductor, "navigationBarTransitionOverlay");
}

- (id)_navigationToolbarTransitionController
{
  return -[_UIViewControllerTransitionConductor navigationToolbarTransitionController](self->_transitionConductor, "navigationToolbarTransitionController");
}

- (BOOL)_shouldCrossFadeNavigationBarVisibility
{
  void *v3;
  void *v4;
  UINavigationController *v5;
  UINavigationController *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "navigationController");
    v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
    if (v5 == self)
    {

    }
    else
    {
      v6 = v5;
      objc_msgSend(v4, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_isTransitioning");

      if (v8)
      {
        objc_msgSend(v4, "navigationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "_shouldCrossFadeNavigationBarVisibility");

        goto LABEL_9;
      }
    }
  }
  if (-[UINavigationController _shouldCrossFadeNavigationBar](self, "_shouldCrossFadeNavigationBar"))
    v10 = 1;
  else
    v10 = -[_UIViewControllerTransitionConductor shouldCrossFadeNavigationBarVisibility](self->_transitionConductor, "shouldCrossFadeNavigationBarVisibility");
LABEL_9:

  return v10;
}

- (void)_startToolbarTransitionIfNecessary:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  char isKindOfClass;
  char v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t navigationControllerFlags;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  BOOL v58;
  _QWORD *v59;
  char v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  UINavigationController *v67;
  id v68;
  char v69;
  char v70;
  BOOL v71;
  _QWORD v72[4];
  id v73;
  id location;
  _QWORD v75[5];
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  BOOL v80;
  char v81;
  char v82;
  _QWORD aBlock[4];
  id v84;
  id v85;
  UINavigationController *v86;
  BOOL v87;
  BOOL v88;
  _QWORD v89[6];

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "_transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "toolbarItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _navigationToolbarTransitionController](self, "_navigationToolbarTransitionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UINavigationController _navigationToolbarTransitionController](self, "_navigationToolbarTransitionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginTransitionWithToolbar:items:animated:", v15, v12, v4);

    v16 = 0;
    v17 = 0;
    goto LABEL_58;
  }
  v61 = v7;
  if (!v4 || !dyld_program_sdk_at_least())
    goto LABEL_14;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v19 = isKindOfClass;
  if ((isKindOfClass & 1) != 0)
  {
    v20 = isKindOfClass;
    v21 = v8;
    v17 = v21;
    if ((v21[153] & 2) == 0 || (*(_QWORD *)&self->_navigationControllerFlags & 0x100000000002) == 0)
    {
      v60 = 0;
      v26 = 0;
      v16 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v21, "_existingToolbar");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "items");
    v22 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v23 = v11;
    v11 = (void *)v22;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    v60 = 0;
    v26 = 0;
    v16 = 0;
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  v24 = v9;
  v16 = v24;
  if ((v24[153] & 2) == 0 || (*(_QWORD *)&self->_navigationControllerFlags & 0x100000000002) == 0)
  {
    v60 = 0;
    v26 = 0;
    goto LABEL_15;
  }
  v20 = v19;
  objc_msgSend(v24, "_existingToolbar");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "items");
  v25 = objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v23 = v12;
  v12 = (void *)v25;
LABEL_13:
  v60 = v20 ^ 1;

  v26 = 1;
LABEL_16:
  v27 = v26 & _UIBarsApplyChromelessEverywhere();
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  v29 = 0x200000000000;
  if (!v27)
    v29 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags & 0xFFFFDFFFFFFFFFFFLL | v29;
  if ((v26 & 1) != 0 || (navigationControllerFlags & 2) != 0)
  {
    v57 = v27;
    if (!-[UINavigationController _toolbarIsAnimatingInteractively](self, "_toolbarIsAnimatingInteractively")
      && (objc_msgSend(v12, "count") || objc_msgSend(v11, "count")))
    {
      -[UINavigationController _existingToolbar](self, "_existingToolbar");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v57 & 1) != 0)
      {
        if (objc_msgSend(v8, "_isNavigationController"))
          v30 = v8;
        else
          v30 = v9;
        objc_msgSend(v30, "_existingToolbar");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v54 = 0;
      }
      v52 = v11;
      if (v4)
      {
        v53 = -[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition");
        v31 = -[UINavigationController isInteractiveTransition](self, "isInteractiveTransition");
        if (v26)
        {
          v50 = v31;
          objc_msgSend(v17, "_setToolbarHidden:edge:duration:", 1, 15, 0.0);
          objc_msgSend(v17, "_existingToolbar");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setItems:", 0);

          objc_msgSend(v16, "_setToolbarHidden:edge:duration:", 1, 15, 0.0);
          objc_msgSend(v16, "_existingToolbar");
          v48 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setItems:", 0);

          v89[0] = MEMORY[0x1E0C809B0];
          v89[1] = 3221225472;
          v89[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke;
          v89[3] = &unk_1E16B1B28;
          v89[4] = self;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v89);
          objc_msgSend(v55, "setItems:", v11);
          v31 = v50;
        }
        if (v31 || v53)
          -[UINavigationController _startInteractiveToolbarTransition](self, "_startInteractiveToolbarTransition");
        objc_msgSend(v55, "bounds");
        v33 = v32;
        v35 = v34;
        objc_msgSend(v55, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v38 = v35 != v37 || v33 != v36;
        if (v53)
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          v58 = v38;
          aBlock[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_2;
          aBlock[3] = &unk_1E16B2950;
          v84 = v55;
          v87 = v4;
          v88 = v58;
          v85 = v12;
          v86 = self;
          v39 = _Block_copy(aBlock);

        }
        else
        {
          v42 = v38;
          objc_msgSend(v55, "setItems:animated:", v12, 1);
          v43 = v57;
          v44 = 0;
          if (!(v60 & 1 | ((v57 & 1) == 0)))
          {
            objc_msgSend(v55, "_backgroundTransitionProgress");
            v44 = v45;
            objc_msgSend(v54, "_backgroundTransitionProgress");
            objc_msgSend(v55, "_setBackgroundTransitionProgress:");
            v43 = v57;
          }
          if (v42 || (v43 & 1) != 0)
          {
            v75[0] = MEMORY[0x1E0C809B0];
            v75[1] = 3221225472;
            v75[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_3;
            v75[3] = &unk_1E16C0710;
            v80 = v42;
            v75[4] = self;
            v81 = v43;
            v82 = v60 & 1;
            v76 = v54;
            v77 = v16;
            v79 = v44;
            v78 = v55;
            v39 = _Block_copy(v75);

          }
          else
          {
            v39 = 0;
          }
          -[UINavigationController _finishAnimationTracking](self, "_finishAnimationTracking");
        }
        objc_initWeak(&location, self);
        v51 = v39;
        if (v39)
        {
          v46 = v39;
          v47 = MEMORY[0x1E0C809B0];
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_4;
          v72[3] = &unk_1E16B1CC8;
          v59 = v72;
          v48 = &v73;
          v73 = v46;
        }
        else
        {
          v59 = 0;
          v47 = MEMORY[0x1E0C809B0];
        }
        v62[0] = v47;
        v62[1] = 3221225472;
        v62[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_5;
        v62[3] = &unk_1E16C0738;
        objc_copyWeak(&v68, &location);
        v69 = v26;
        v63 = v55;
        v64 = v16;
        v65 = v17;
        v70 = v60 & 1;
        v66 = v8;
        v67 = self;
        v71 = v53;
        v7 = v61;
        objc_msgSend(v61, "animateAlongsideTransition:completion:", v59, v62);

        objc_destroyWeak(&v68);
        if (v51)

        objc_destroyWeak(&location);
        v41 = v55;
      }
      else
      {
        objc_msgSend(v9, "toolbarItems");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v55;
        objc_msgSend(v55, "setItems:animated:", v40, 0);

        v7 = v61;
      }

      v11 = v52;
    }
    else
    {
      v7 = v61;
    }
  }
  else
  {
    v7 = v61;
  }
LABEL_58:

}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setToolbarHidden:edge:duration:", 0, 15, 0.0);
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setItems:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  if (*(_BYTE *)(a1 + 57))
    return objc_msgSend(*(id *)(a1 + 48), "_positionToolbarHidden:", objc_msgSend(*(id *)(a1 + 48), "isToolbarHidden"));
  return result;
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  v1 = result;
  if (*(_BYTE *)(result + 72))
    result = objc_msgSend(*(id *)(result + 32), "_positionToolbarHidden:", objc_msgSend(*(id *)(result + 32), "isToolbarHidden"));
  if (*(_BYTE *)(v1 + 73))
  {
    if (*(_BYTE *)(v1 + 74))
    {
      v2 = objc_msgSend(*(id *)(v1 + 40), "_appearanceHint");
      if (v2 == 1)
      {
        v3 = 0.0;
      }
      else if (v2 == 2)
      {
        v3 = 1.0;
      }
      else
      {
        objc_msgSend(*(id *)(v1 + 40), "_backgroundTransitionProgress");
        v7 = v4;
        objc_msgSend(*(id *)(v1 + 48), "_viewControllerForObservableScrollView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_contentOrObservableScrollViewForEdge:", 4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        _UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v6, *(void **)(v1 + 40), &v7);

        v3 = v7;
      }
    }
    else
    {
      v3 = *(double *)(v1 + 64);
    }
    return objc_msgSend(*(id *)(v1 + 56), "_setBackgroundTransitionProgress:", v3);
  }
  return result;
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = (id *)(a1 + 72);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  LODWORD(v3) = objc_msgSend(v4, "isCancelled");

  if ((_DWORD)v3)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(WeakRetained, "_setToolbarAnimationWasCancelled:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setItems:", 0);
      objc_msgSend(*(id *)(a1 + 40), "_setToolbarHidden:edge:duration:", 0, 15, 0.0);
      objc_msgSend(*(id *)(a1 + 48), "_setToolbarHidden:edge:duration:", 0, 15, 0.0);
      objc_msgSend(WeakRetained, "_setToolbarHidden:edge:duration:", *(_BYTE *)(a1 + 81) == 0, 15, 0.0);
    }
    else
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "toolbarItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setItems:animated:", v6, 0);

      objc_msgSend(WeakRetained, "_setToolbarAnimationWasCancelled:", 0);
    }
  }
  else if (*(_BYTE *)(a1 + 80))
  {
    if (*(_BYTE *)(a1 + 81))
    {
      objc_msgSend(*(id *)(a1 + 32), "setItems:", 0);
      objc_msgSend(WeakRetained, "_setToolbarHidden:edge:duration:", 1, 15, 0.0);
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_6;
    v10[3] = &unk_1E16B1B50;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 64) + 1224) &= ~0x200000000000uLL;
  if (!*(_BYTE *)(a1 + 82))
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeOffset:", 0.0);
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setSpeed:", v8);

  }
  objc_msgSend(WeakRetained, "_setToolbarAnimationId:", 0);

}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_existingToolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItems:", 0);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateToolbarItemsFromViewController:animated:", v4, 0);

  objc_msgSend(*(id *)(a1 + 32), "_setToolbarHidden:edge:duration:", 0, 15, 0.0);
  objc_msgSend(*(id *)(a1 + 40), "_existingToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", 0);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateToolbarItemsFromViewController:animated:", v7, 0);

  return objc_msgSend(*(id *)(a1 + 40), "_setToolbarHidden:edge:duration:", 0, 15, 0.0);
}

- (unint64_t)_keyboardScreenEdgeForTransition:(int)a3
{
  unsigned int v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_keyboardDirectionForTransition:", *(_QWORD *)&a3) - 1;
  if (v3 > 4)
    return 4;
  else
    return qword_18667A238[v3];
}

- (BOOL)_shouldHideSearchBarWhenScrollingForNavigationItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UINavigationController _topViewControllerObservableScrollViewForEdge:](self, "_topViewControllerObservableScrollViewForEdge:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    LOBYTE(v5) = objc_msgSend(v4, "hidesSearchBarWhenScrolling");

  return (char)v5;
}

- (Class)navigationBarClass
{
  return self->_navigationBarClass;
}

- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationController;
  -[UIViewController _viewsWithDisabledInteractionGivenTransitionContext:](&v13, sel__viewsWithDisabledInteractionGivenTransitionContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UINavigationController _existingToolbar](self, "_existingToolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[UINavigationController enableBackButtonDuringTransition](self, "enableBackButtonDuringTransition"))
    objc_msgSend(v5, "addObject:", self->_navigationBar);
  if (v8 == v4
    && (objc_msgSend(v4, "isInterruptible") & 1) == 0
    && (objc_msgSend(v4, "_allowUserInteraction") & 1) == 0)
  {
    -[UINavigationController disappearingViewController](self, "disappearingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v5, "addObject:", v11);

  }
  return v5;
}

- (BOOL)_canPerformRename:(id)a3
{
  UINavigationBar *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v4 = (UINavigationBar *)a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UINavigationBar sender](v4, "sender");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (UINavigationBar *)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self->_navigationBar)
    {
LABEL_10:
      -[UINavigationController navigationBar](self, "navigationBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "_canRename");

      goto LABEL_11;
    }
  }
  else if (!-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
  {
    -[UIView window](self->_navigationBar, "window");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[UIViewController presentedViewController](self, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)rename:(id)a3
{
  id v3;

  -[UINavigationController navigationBar](self, "navigationBar", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_beginRenaming");

}

- (BOOL)_navigationBarShouldUpdateProgress
{
  void *v2;
  BOOL v3;

  -[UIViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_clipUnderlapWhileTransitioning
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 33) & 1;
}

- (BOOL)_animationParametersForHidingNavigationBar:(BOOL)a3 lastOperation:(int64_t)a4 edge:(unint64_t *)a5 duration:(double *)a6
{
  _BOOL4 v9;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v9 = a3;
  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_shouldReverseLayoutDirection");

  if (v12)
    v13 = 8;
  else
    v13 = 2;
  if (v12)
    v14 = 2;
  else
    v14 = 8;
  v15 = -[UINavigationController _shouldCrossFadeNavigationBarVisibility](self, "_shouldCrossFadeNavigationBarVisibility");
  if (a4 == 2)
  {
    if (a5)
    {
      if (v9)
        v18 = v14;
      else
        v18 = v13;
      if (v15)
        v18 = 15;
      *a5 = v18;
    }
    if (!a6)
      goto LABEL_28;
    v17 = 2;
LABEL_27:
    -[UINavigationController durationForTransition:](self, "durationForTransition:", v17);
    *(_QWORD *)a6 = v19;
LABEL_28:
    LOBYTE(v17) = 1;
    return v17;
  }
  if (a4 != 1)
  {
    LOBYTE(v17) = 0;
    return v17;
  }
  if (a5)
  {
    if (v9)
      v16 = v13;
    else
      v16 = v14;
    if (v15)
      v16 = 15;
    *a5 = v16;
  }
  v17 = 1;
  if (a6)
    goto LABEL_27;
  return v17;
}

- (BOOL)_viewControllerIgnoresClippedGlyphPathFrame
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  return -[UIViewController _viewControllerIgnoresClippedGlyphPathFrame](&v4, sel__viewControllerIgnoresClippedGlyphPathFrame)|| self->_interactiveScrollActive|| -[UINavigationController _isTransitioning](self, "_isTransitioning");
}

uint64_t __74__UINavigationController__positionNavigationBarHidden_edge_initialOffset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

- (void)_positionTransitioningPalette:(id)a3 outside:(BOOL)a4 edge:(unint64_t)a5 preservingYPosition:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t navigationControllerFlags;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UILayoutContainerView *containerView;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double MidX;
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
  double MinY;
  double v49;
  NSObject *v50;
  uint64_t v51;
  CGFloat v52;
  uint64_t v53;
  CGFloat v54;
  uint64_t v55;
  CGFloat v56;
  double rect;
  uint8_t buf[4];
  const char *v59;
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v6 = a6;
  v8 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (!v10 || objc_msgSend(v10, "boundaryEdge") == 5)
    goto LABEL_28;
  if (os_variant_has_internal_diagnostics())
  {
    if (v8 && a5 != 2 && a5 != 8)
    {
      __UIFaultDebugAssertLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v59 = "-[UINavigationController _positionTransitioningPalette:outside:edge:preservingYPosition:]";
        _os_log_fault_impl(&dword_185066000, v50, OS_LOG_TYPE_FAULT, "Only pass outside==YES to %s for transitions!", buf, 0xCu);
      }

    }
  }
  else if (v8 && a5 != 2 && a5 != 8)
  {
    v12 = _positionTransitioningPalette_outside_edge_preservingYPosition____s_category;
    if (!_positionTransitioningPalette_outside_edge_preservingYPosition____s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_positionTransitioningPalette_outside_edge_preservingYPosition____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[UINavigationController _positionTransitioningPalette:outside:edge:preservingYPosition:]";
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Only pass outside==YES to %s for transitions!", buf, 0xCu);
    }
  }
  -[UINavigationController navigationBar](self, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v53 = v16;
  v55 = v15;
  v51 = v17;
  v19 = v18;

  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  -[UIView bounds](self->_topPalette, "bounds");
  v22 = v21;
  v24 = v23 * 0.5;
  v25 = v23 * 0.5 + 0.0;
  rect = v19;
  if (objc_msgSend(v11, "_isPalettePinningBarHidden"))
    v19 = -0.0;
  if (objc_msgSend(v11, "paletteIsHidden", v51, v53, v55))
  {
    -[UINavigationController _frameForPalette:](self, "_frameForPalette:", v11);
    objc_msgSend(v11, "setFrame:");
    -[UINavigationController _installPaletteIntoViewHierarchy:](self, "_installPaletteIntoViewHierarchy:", v11);
  }
  v26 = v19 + v25;
  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView bounds](containerView, "bounds");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
  }
  else
  {
    v29 = *MEMORY[0x1E0C9D648];
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v61.origin.x = v29;
  v61.origin.y = v31;
  v61.size.width = v33;
  v61.size.height = v35;
  MidX = CGRectGetMidX(v61);
  v62.origin.x = v29;
  v62.origin.y = v31;
  v62.size.width = v33;
  v62.size.height = v35;
  -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", v11, v8, a5, MidX, CGRectGetMinY(v62), v26);
  v38 = v37;
  v40 = v39 + v22 * -0.5;
  objc_msgSend(v11, "frame");
  v44 = v42;
  v45 = v43;
  if (v6)
  {
    v46 = v41;
    v47 = v40;
    MinY = CGRectGetMinY(*(CGRect *)(&v41 - 1));
    v63.origin.y = v54;
    v63.origin.x = v56;
    v63.size.width = v52;
    v63.size.height = rect;
    v49 = MinY - CGRectGetMaxY(v63);
  }
  else
  {
    v46 = v38 - v24;
    if (!objc_msgSend(v11, "_isPalettePinningBarHidden"))
      goto LABEL_23;
    v49 = -rect;
  }
  objc_msgSend(v11, "_setTopConstraintConstant:", v49);
LABEL_23:
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    if ((navigationControllerFlags & 1) == 0)
      objc_msgSend(v11, "_setLeftConstraintConstant:", v40);
    objc_msgSend(v11, "setFrame:", v40, v46, v44, v45);
  }
  else
  {
    -[_UINavigationControllerPalette setFrame:isAnimating:](self->_topPalette, "setFrame:isAnimating:", 0, v40, v46, v44, v45);
    objc_msgSend(v11, "_setLeftConstraintConstant:", v40);
  }
LABEL_28:

}

uint64_t __79__UINavigationController__setNavigationBarHidden_edgeIfNotNavigating_duration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v4;
  double v5;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setPalettePinningBarHidden:", *(unsigned __int8 *)(a1 + 40));
    v4 = objc_msgSend(*(id *)(a1 + 32), "_viewControllerUnderlapsStatusBar");
    v5 = 0.0;
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "_statusBarHeightAdjustmentForCurrentOrientation", 0.0);
    if (!*(_BYTE *)(a1 + 40))
      v5 = 0.0;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_resetConstraintConstants:", v5);
  }
  return result;
}

- (void)_setSearchHidNavigationBar:(BOOL)a3
{
  _BOOL8 v3;
  UINavigationController *v5;
  uint64_t v6;
  UINavigationController *v7;

  v3 = a3;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v6 = 0x800000000000;
    if (!v3)
      v6 = 0;
    *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFF7FFFFFFFFFFFLL | v6;
  }
  else
  {
    v7 = v5;
    -[UINavigationController _setSearchHidNavigationBar:](v5, "_setSearchHidNavigationBar:", v3);
    v5 = v7;
  }

}

uint64_t __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224);
  v4 = a2;
  if (objc_msgSend(v4, "isCancelled") && (v3 & 1) != *(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarAnimationWasCancelled:", 0);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_hideShowNavigationBarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowNavigationBar"), v6, v4);

}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hideShowNavigationBarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowNavigationBar"), v3, 0);

}

uint64_t __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_hideShowNavigationBarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowNavigationBar"), v6, v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)pretendNavBarHidden
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 13) & 1;
}

- (void)setPretendNavBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  UINavigationController *v5;
  uint64_t v6;
  UINavigationController *v7;

  v3 = a3;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v6 = 0x2000;
    if (!v3)
      v6 = 0;
    *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFDFFFLL | v6;
  }
  else
  {
    v7 = v5;
    -[UINavigationController setPretendNavBarHidden:](v5, "setPretendNavBarHidden:", v3);
    v5 = v7;
  }

}

- (BOOL)searchBarHidNavBar
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 15) & 1;
}

- (void)setSearchBarHidNavBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)avoidMovingNavBarOffscreenBeforeUnhiding
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 14) & 1;
}

- (void)setAvoidMovingNavBarOffscreenBeforeUnhiding:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (void)_sendNavigationBarToBack
{
  void *v3;
  void *v4;
  id v5;

  -[UINavigationController navigationBar](self, "navigationBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", v4);

}

- (void)setToolbar:(id)a3
{
  UIToolbar *v5;
  UIToolbar **p_toolbar;
  UIToolbar *toolbar;
  void *v8;
  UIToolbar *v9;

  v5 = (UIToolbar *)a3;
  p_toolbar = &self->_toolbar;
  toolbar = self->_toolbar;
  v9 = v5;
  if (toolbar != v5)
  {
    if (toolbar)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIToolbar setItems:animated:](toolbar, "setItems:animated:", v8, 0);

      -[UIView removeFromSuperview](*p_toolbar, "removeFromSuperview");
      -[NSMapTable removeObjectForKey:](self->_lastContentMarginForView, "removeObjectForKey:", *p_toolbar);
    }
    objc_storeStrong((id *)&self->_toolbar, a3);
    if (*p_toolbar)
      -[UINavigationController _configureToolbar](self, "_configureToolbar");
  }

}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_positionToolbarHidden:edge:crossFade:", 1, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _OWORD v13[3];

  if (*(_BYTE *)(a1 + 152))
  {
    objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

  }
  if (*(_BYTE *)(a1 + 153))
  {
    objc_msgSend(*(id *)(a1 + 40), "_backgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
  if (*(_BYTE *)(a1 + 154) && (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 1224) & 0x400000000) != 0)
  {
    v5 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(v5, "convertRect:fromView:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 56), "setFrame:");
    v6 = *(void **)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 88);
    v13[0] = *(_OWORD *)(a1 + 72);
    v13[1] = v7;
    v13[2] = *(_OWORD *)(a1 + 104);
    objc_msgSend(v6, "setTransform:", v13);
  }
  else if (*(_BYTE *)(a1 + 155) && (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 1224) & 0x800000000) != 0)
  {
    v4 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    objc_msgSend(v4, "convertRect:fromView:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "setFrame:");
  }
  objc_msgSend(*(id *)(a1 + 56), "frame");
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", v8 + *(double *)(a1 + 128), *(double *)(a1 + 120) + v9, v10 - (*(double *)(a1 + 128) + *(double *)(a1 + 144)), v11 - (*(double *)(a1 + 120) + *(double *)(a1 + 136)));
  return objc_msgSend(*(id *)(a1 + 64), "setMaskView:", *(_QWORD *)(a1 + 56));
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_3(uint64_t a1)
{
  __int128 v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _OWORD v27[3];
  _OWORD v28[3];

  if (*(_BYTE *)(a1 + 160) && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224) & 0x400000000) != 0)
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v28[0] = *MEMORY[0x1E0C9BAA8];
    v28[1] = v10;
    v28[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v9, "setTransform:", v28);
    v11 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    objc_msgSend(v11, "convertRect:fromView:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", v12 + *(double *)(a1 + 88), *(double *)(a1 + 80) + v13, v14 - (*(double *)(a1 + 88) + *(double *)(a1 + 104)), v15 - (*(double *)(a1 + 80) + *(double *)(a1 + 96)));
    v8 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  if (*(_BYTE *)(a1 + 161) && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224) & 0x800000000) != 0)
  {
    v2 = *(_OWORD *)(a1 + 128);
    v27[0] = *(_OWORD *)(a1 + 112);
    v27[1] = v2;
    v27[2] = *(_OWORD *)(a1 + 144);
    objc_msgSend(*(id *)(a1 + 40), "setTransform:", v27);
    v3 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 72), "bounds");
    objc_msgSend(v3, "convertRect:fromView:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", v4 + *(double *)(a1 + 88), *(double *)(a1 + 80) + v5, v6 - (*(double *)(a1 + 88) + *(double *)(a1 + 104)), v7 - (*(double *)(a1 + 80) + *(double *)(a1 + 96)));
    v8 = *(void **)(a1 + 72);
LABEL_7:
    objc_msgSend(v8, "_backgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertRect:toView:", v25, v18, v20, v22, v24);
    objc_msgSend(*(id *)(a1 + 64), "setFrame:");

  }
  return objc_msgSend(*(id *)(a1 + 64), "layoutIfNeeded");
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_4(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _OWORD v10[3];

  objc_msgSend(a1[4], "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(a1[5], "_backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = a1[5];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v5;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", v10);
  v6 = (void *)UIApp;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_5;
  v7[3] = &unk_1E16B1B50;
  v8 = a1[6];
  v9 = a1[7];
  objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", v7);

}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMaskView:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_13(uint64_t a1, void *a2)
{
  int v3;
  unint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224);
  v5 = a2;
  if (objc_msgSend(v5, "isCancelled") && (v3 != 0) == ((v4 >> 1) & 1))
    objc_msgSend(*(id *)(a1 + 32), "_setToolbarAnimationWasCancelled:", 0);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_hideShowToolbarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowToolbar"), v7, v5);

}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_14(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)objc_msgSend(v2, "_didEndCount") > 0;

}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_15(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_hideShowToolbarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowToolbar"), v3, 0);

  }
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_hideShowToolbarDidStop:finished:context:", CFSTR("UINavigationControllerHideShowToolbar"), v6, v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_navigationBarDidEndAnimation:(id)a3
{
  UINavigationBar *v4;
  void *v5;
  void *v6;
  uint64_t navigationControllerFlags;
  void *v8;
  UINavigationBar *v9;
  void *v10;
  _QWORD v11[4];
  UINavigationBar *v12;

  v4 = (UINavigationBar *)a3;
  if (self->_navigationBar == v4)
  {
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom") == 3)
    {
      navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;

      if ((navigationControllerFlags & 0x20000000000000) == 0)
      {
        *(_QWORD *)&self->_navigationControllerFlags |= 0x20000000000000uLL;
        -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      }
    }
    else
    {

    }
  }
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_existingNavigationBar");
  v9 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    -[UIViewController transitionCoordinator](self, "transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __56__UINavigationController__navigationBarDidEndAnimation___block_invoke;
      v11[3] = &unk_1E16B2150;
      v12 = v4;
      objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v11);

    }
    else
    {
      -[UINavigationBar _reenableUserInteraction](v4, "_reenableUserInteraction");
    }

  }
}

uint64_t __56__UINavigationController__navigationBarDidEndAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reenableUserInteraction");
}

- (void)_rememberPresentingFocusedItem:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UINavigationController;
  v4 = a3;
  -[UIViewController _rememberPresentingFocusedItem:](&v6, sel__rememberPresentingFocusedItem_, v4);
  -[UINavigationController topViewController](self, "topViewController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _rememberFocusedItem:forViewController:](self, "_rememberFocusedItem:forViewController:", v4, v5);

}

- (BOOL)_canRestoreFocusAfterTransitionToRecalledItem:(id)a3 inViewController:(id)a4
{
  id v6;
  id v7;
  char IsFocusedOrFocusable;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    IsFocusedOrFocusable = -[UIViewController _canRestoreFocusAfterTransitionToItem:](self, "_canRestoreFocusAfterTransitionToItem:", v6);
  }
  else if (-[UIViewController restoresFocusAfterTransition](self, "restoresFocusAfterTransition")
         && objc_msgSend(v7, "restoresFocusAfterTransition"))
  {
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIFocusEnvironmentIsAncestorOfEnvironment(v9, v6))
      IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v6);
    else
      IsFocusedOrFocusable = 0;

  }
  else
  {
    IsFocusedOrFocusable = 0;
  }

  return IsFocusedOrFocusable;
}

- (id)_overridingPreferredFocusEnvironment
{
  UIFocusItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = self->_overridingDestinationItemForFocusUpdate;
  if (v3)
    return v3;
  v9.receiver = self;
  v9.super_class = (Class)UINavigationController;
  -[UIViewController _overridingPreferredFocusEnvironment](&v9, sel__overridingPreferredFocusEnvironment);
  v3 = (UIFocusItem *)objc_claimAutoreleasedReturnValue();
  if (v3)
    return v3;
  -[UIViewController _existingView](self, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[UINavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _recallRememberedFocusedItemForViewController:](self, "_recallRememberedFocusedItemForViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  if (!-[UINavigationController _canRestoreFocusAfterTransitionToRecalledItem:inViewController:](self, "_canRestoreFocusAfterTransitionToRecalledItem:inViewController:", v7, v6))
  {
    -[UINavigationController _forgetFocusedItemForViewController:](self, "_forgetFocusedItemForViewController:", v6);
LABEL_9:
    v3 = 0;
    goto LABEL_10;
  }
  v3 = v7;
LABEL_10:

  return v3;
}

- (id)_childViewControllersEligibleForOverridingPreferredFocusEnvironments
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[UINavigationController topViewController](self, "topViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)preferredFocusedView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFocusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationController;
    -[UIViewController preferredFocusedView](&v9, sel_preferredFocusedView);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v7;

  if (!qword_1EDDB0E90)
  {
    qword_1EDDB0E90 = +[UINavigationController instanceMethodForSelector:](UINavigationController, "instanceMethodForSelector:", sel_preferredFocusedView);
    qword_1EDDB0E98 = +[UINavigationController instanceMethodForSelector:](UINavigationController, "instanceMethodForSelector:", sel_preferredFocusEnvironments);
  }
  v3 = -[UINavigationController methodForSelector:](self, "methodForSelector:", sel_preferredFocusedView);
  v4 = -[UINavigationController methodForSelector:](self, "methodForSelector:", sel_preferredFocusEnvironments);
  if (v3)
    v5 = v3 == qword_1EDDB0E90;
  else
    v5 = 1;
  if (v5)
    return 0;
  if (v4)
    v7 = v4 == qword_1EDDB0E98;
  else
    v7 = 1;
  if (v7)
    return 1;
  else
    return 2;
}

- (id)preferredFocusEnvironments
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  if (!-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "addObject:", v5);

  }
  _UIFocusEnvironmentPreferredNodeToFocusedItem(self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((void *)v7 == v6)
    {

    }
    else
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(v3, "containsObject:", v6);

      if (v9)
      {
        objc_msgSend(v3, "removeObject:", v6);
        objc_msgSend(v3, "insertObject:atIndex:", v6, 0);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UINavigationController;
  -[UIViewController preferredFocusEnvironments](&v13, sel_preferredFocusEnvironments);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v3, -[UINavigationController _subclassPreferredFocusedViewPrioritizationType](self, "_subclassPreferredFocusedViewPrioritizationType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_shouldUpdateFocusInContext:(id)a3
{
  return !self->_scrollViewManager
      && -[UIViewController shouldUpdateFocusInContext:](self, "shouldUpdateFocusInContext:", a3);
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 IsAncestorOfEnvironment;
  objc_super v9;

  v4 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextFocusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v6, v7);

  if (IsAncestorOfEnvironment)
    -[UINavigationController _forgetFocusedItemForViewController:](self, "_forgetFocusedItemForViewController:", v5);
  v9.receiver = self;
  v9.super_class = (Class)UINavigationController;
  -[UIViewController _didUpdateFocusInContext:](&v9, sel__didUpdateFocusInContext_, v4);

}

- (NSMapTable)_rememberedFocusedItemsByViewController
{
  NSMapTable *rememberedFocusedItemsByViewController;
  NSMapTable *v4;
  NSMapTable *v5;

  rememberedFocusedItemsByViewController = self->_rememberedFocusedItemsByViewController;
  if (!rememberedFocusedItemsByViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rememberedFocusedItemsByViewController;
    self->_rememberedFocusedItemsByViewController = v4;

    rememberedFocusedItemsByViewController = self->_rememberedFocusedItemsByViewController;
  }
  return rememberedFocusedItemsByViewController;
}

- (void)_rememberFocusedItem:(id)a3 forViewController:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UINavigationController _rememberedFocusedItemsByViewController](self, "_rememberedFocusedItemsByViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)_forgetFocusedItemForViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UINavigationController _rememberedFocusedItemsByViewController](self, "_rememberedFocusedItemsByViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)_recallRememberedFocusedItemForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UINavigationController _rememberedFocusedItemsByViewController](self, "_rememberedFocusedItemsByViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setIsWrappingDuringAdaptation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)_ignoreFinishingModalTransitionForFiles
{
  if (qword_1EDDB0EA0 != -1)
    dispatch_once(&qword_1EDDB0EA0, &__block_literal_global_379);
  return _MergedGlobals_92;
}

void __65__UINavigationController__ignoreFinishingModalTransitionForFiles__block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_92 = objc_msgSend(&unk_1E1A930F8, "containsObject:", v0);

}

- (BOOL)editing
{
  void *v2;
  char v3;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (id)viewControllerForUnwindSegueAction:(SEL)a3 fromViewController:(id)a4 withSender:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = objc_msgSend(v10, "count") - 1;
  while (v12 != -1)
  {
    objc_msgSend(v10, "objectAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    --v12;
    v11 = v13;
    if (objc_msgSend(v13, "_canPerformUnwindSegueAction:fromViewController:sender:", a3, v8, v9))
    {
      v14 = v13;
      v11 = v14;
      goto LABEL_6;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  -[UIViewController viewControllerForUnwindSegueAction:fromViewController:withSender:](&v17, sel_viewControllerForUnwindSegueAction_fromViewController_withSender_, a3, v8, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = v14;

  return v15;
}

- (id)allowedChildViewControllersForUnwindingFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[UIViewController childViewControllerContainingSegueSource:](self, "childViewControllerContainingSegueSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UINavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__UINavigationController_allowedChildViewControllersForUnwindingFromSource___block_invoke;
  v13[3] = &unk_1E16C0CA0;
  v14 = v6;
  v8 = v5;
  v15 = v8;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

uint64_t __76__UINavigationController_allowedChildViewControllersForUnwindingFromSource___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    return objc_msgSend(*(id *)(result + 40), "addObject:", a2);
  return result;
}

- (void)unwindForSegue:(id)a3 towardsViewController:(id)a4
{
  void *v5;
  int v6;
  id v7;
  id v8;

  v8 = a4;
  -[UINavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if (v6)
    v7 = -[UINavigationController popToViewController:animated:](self, "popToViewController:animated:", v8, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

}

- (id)segueForUnwindingToViewController:(id)a3 fromViewController:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  -[UINavigationController viewControllers](self, "viewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v9);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 4634, CFSTR("toViewController (%@) is not one of my view controllers."), v9);

  }
  _UIFirstPopoverSeguePresentedControllerInUnwindingResponderChain(v11, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__UINavigationController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke;
  v20[3] = &unk_1E16B47A8;
  v20[4] = self;
  v21 = v9;
  v22 = v14;
  v15 = v14;
  v16 = v9;
  +[UIStoryboardSegue segueWithIdentifier:source:destination:performHandler:](UIStoryboardSegue, "segueWithIdentifier:source:destination:performHandler:", v10, v11, v16, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __90__UINavigationController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v2 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = v2;
    else
      v7 = 0;
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "popToViewController:animated:", *(_QWORD *)(a1 + 40), v7);
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v2, 0);

    }
  }
  else
  {
    v11 = (id)objc_msgSend(v4, "popToViewController:animated:", *(_QWORD *)(a1 + 40), v2);
  }
  v12 = *(void **)(a1 + 48);
  if (v12)
  {
    objc_msgSend(v12, "_popoverController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissPopoverAnimated:", v2);

  }
}

- (BOOL)_canPerformBackKeyCommandToPopViewController
{
  void *v3;
  void *v4;
  int v5;

  if (-[UIViewController childViewControllersCount](self, "childViewControllersCount") >= 2
    && -[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible"))
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hidesBackButton") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[UIViewController splitViewController](self, "splitViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5
    && objc_msgSend(v5, "displayMode") != 2
    && objc_msgSend(v6, "displayMode") != 4
    && objc_msgSend(v6, "canPerformAction:withSender:", sel_toggleSidebar_, v4)
    && -[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible");

  return v7;
}

- (void)_performBackKeyCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[UINavigationController _canPerformBackKeyCommandToPopViewController](self, "_canPerformBackKeyCommandToPopViewController"))
  {
    v4 = -[UINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
  }
  else if (-[UINavigationController _canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:](self, "_canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:", v6))
  {
    -[UIViewController splitViewController](self, "splitViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toggleSidebar:", v6);

  }
}

- (void)_userInterfaceIdiomChanged
{
  -[UINavigationController _setupBackGestureRecognizer](self, "_setupBackGestureRecognizer");
  -[UINavigationController _setupVisualStyle](self, "_setupVisualStyle");
}

- (void)_performBackGesture:(id)a3
{
  id v3;

  v3 = -[UINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  unint64_t v5;

  if (self->_backGestureRecognizer == a3
    && (-[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5 <= 1))
  {
    return -[UINavigationController _isTransitioning](self, "_isTransitioning");
  }
  else
  {
    return 1;
  }
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  _UIBarTapGestureRecognizer *v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;

  v6 = (_UIBarTapGestureRecognizer *)a3;
  v7 = a4;
  v10 = 1;
  if (self->__barTapHideGesture == v6 || (_UIBarTapGestureRecognizer *)self->__barSwipeHideGesture == v6)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isNestedNavigationController");

    if ((v9 & 1) != 0)
      v10 = 0;
  }

  return v10;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MinY;
  double MaxY;
  double v33;
  char v34;
  CGRect v36;
  CGRect v37;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if ((UITapGestureRecognizer *)self->__barSwipeHideGesture == v6
    && objc_msgSend(v7, "_isGestureType:", 9))
  {
    v9 = v8;
    -[UIViewController _existingView](self, "_existingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    objc_msgSend(v12, "convertRect:toView:", v10);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[UINavigationController _existingNavigationBar](self, "_existingNavigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    objc_msgSend(v22, "convertRect:toView:", v10);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v36.origin.x = v14;
    v36.origin.y = v16;
    v36.size.width = v18;
    v36.size.height = v20;
    MinY = CGRectGetMinY(v36);
    v37.origin.x = v24;
    v37.origin.y = v26;
    v37.size.width = v28;
    v37.size.height = v30;
    MaxY = CGRectGetMaxY(v37);
    UICeilToViewScale(v10);
    v34 = MinY <= MaxY + v33;

  }
  else if (self->_backGestureRecognizer == v6)
  {
    v34 = objc_msgSend(v8, "_isGestureType:", 8);
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)_deepestActionResponder
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__UINavigationController__deepestActionResponder__block_invoke;
  v3[3] = &unk_1E16BE5F0;
  v3[4] = self;
  -[UIViewController _deepestPresentedActionResponderOrBlock:](self, "_deepestPresentedActionResponderOrBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __49__UINavigationController__deepestActionResponder__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasDeepestActionResponder");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deepestActionResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)UINavigationController;
    objc_msgSendSuper2(&v7, sel__deepestActionResponder);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_didEndTransitionFromView:(id)a3 toView:(id)a4 wasCustom:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  unint64_t navigationControllerFlags;
  void *v10;
  void *v11;
  int64_t v12;
  char v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t v19;
  _BOOL4 v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _UIInvalidatable *keyboardLayoutGuideTransitionAssertion;
  _UIInvalidatable *v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  unint64_t v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  UINavigationDeferredTransitionContext *deferredTransitionContext;
  uint64_t v54;
  id *v55;
  id v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t WeakRetained;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  char v66;
  void *v67;
  void *v68;
  id v69;
  char v70;
  void *v71;
  char v72;
  _UIFocusUpdateRequest *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unint64_t v78;
  NSObject *v79;
  os_signpost_id_t v80;
  os_signpost_id_t v81;
  char v82;
  char v83;
  _BOOL4 v84;
  id v85;
  uint8_t buf[8];
  _QWORD v87[5];
  _QWORD v88[4];
  id v89;
  char v90;
  _QWORD v91[4];
  _QWORD v92[2];
  char v93;
  _QWORD v94[4];
  id v95;
  char v96;
  _QWORD v97[4];
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;

  v5 = a5;
  v8 = a3;
  v85 = a4;
  navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  -[UINavigationController disappearingViewController](self, "disappearingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v83 = *((_BYTE *)&self->_navigationControllerFlags + 6) & 1;
    goto LABEL_5;
  }
  v12 = -[UINavigationController lastOperation](self, "lastOperation");
  v83 = *((_BYTE *)&self->_navigationControllerFlags + 6) & 1;
  if (v12 == 1)
  {
LABEL_5:
    v13 = objc_msgSend(v11, "_usesSharedView");
    v14 = 1;
    goto LABEL_6;
  }
  v13 = objc_msgSend(v10, "_usesSharedView");
  v14 = 0;
LABEL_6:
  if (v10 != v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewControllerWrapperView unwrapView:](v8, v15);

      if (v8 == v85)
        goto LABEL_17;
LABEL_16:
      objc_msgSend(v8, "removeFromSuperview");
      goto LABEL_17;
    }
  }
  if (!v5)
    goto LABEL_17;
  objc_msgSend(v10, "childModalViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_16;
  objc_msgSend(v10, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v82 = v13;
  v18 = v14;
  v19 = navigationControllerFlags;
  v20 = v5;
  v21 = v8;
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 == v85)
    v23 = v21;
  else
    v23 = v22;
  objc_msgSend(v23, "removeFromSuperview");

  v8 = v21;
  v5 = v20;
  navigationControllerFlags = v19;
  v14 = v18;
  v13 = v82;
LABEL_17:
  -[UINavigationController _presentationTransitionUnwrapViewController:](self, "_presentationTransitionUnwrapViewController:", v11);
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x200) != 0)
  {
    -[UIViewController _keyboardSceneDelegate](self);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "popAnimationStyle");

    *(_QWORD *)&self->_navigationControllerFlags &= ~0x200uLL;
  }
  keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
  if (keyboardLayoutGuideTransitionAssertion)
  {
    -[_UIInvalidatable _invalidate](keyboardLayoutGuideTransitionAssertion, "_invalidate");
    v26 = self->_keyboardLayoutGuideTransitionAssertion;
    self->_keyboardLayoutGuideTransitionAssertion = 0;

  }
  if (v5)
  {
    objc_msgSend(v11, "view");
    v27 = v11;
    v28 = v10;
    v29 = v13;
    v30 = v14;
    v31 = navigationControllerFlags;
    v32 = v5;
    v33 = v8;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v34);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v33;
    v5 = v32;
    navigationControllerFlags = v31;
    v14 = v30;
    v13 = v29;
    v10 = v28;
    v11 = v27;
    if (v35 == v85)
    {
      -[UINavigationController _frameForWrapperViewForViewController:](self, "_frameForWrapperViewForViewController:", v27);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      -[UINavigationController _frameForViewController:](self, "_frameForViewController:", v27);
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke;
      v97[3] = &unk_1E16B7030;
      v98 = v85;
      v100 = v37;
      v101 = v39;
      v102 = v41;
      v103 = v43;
      v99 = v27;
      v104 = v45;
      v105 = v47;
      v106 = v49;
      v107 = v51;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v97);

    }
  }
  -[UINavigationController _layoutTopViewController](self, "_layoutTopViewController");
  if ((v13 & 1) == 0)
  {
    objc_msgSend(v10, "_setNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v10, "_setNavigationControllerContentOffsetAdjustment:", 0.0);
  }
  -[UINavigationController _navigationToolbarTransitionController](self, "_navigationToolbarTransitionController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "endTransition");

  -[UINavigationController _clearLastOperation](self);
  *(_QWORD *)&self->_navigationControllerFlags &= ~4uLL;
  deferredTransitionContext = self->_deferredTransitionContext;
  self->_deferredTransitionContext = 0;

  if (v10 != v11 && -[UIViewController _appearState](self, "_appearState") == 2)
  {
    v54 = MEMORY[0x1E0C809B0];
    if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1000) == 0)
    {
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_2;
      v94[3] = &unk_1E16B1B78;
      v96 = v83;
      v95 = v10;
      -[UIViewController _endAppearanceTransition:]((uint64_t)v95, v94);

    }
    v91[0] = v54;
    v91[1] = 3221225472;
    v91[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_3;
    v91[3] = &unk_1E16B4008;
    v93 = v14;
    v55 = (id *)v92;
    v56 = v11;
    v92[0] = v56;
    v92[1] = self;
    v57 = v91;
    goto LABEL_37;
  }
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1000) == 0
    && -[UIViewController _appearState](self, "_appearState") != 2)
  {
    if (v14)
      objc_msgSend(v11, "setNeedsDidMoveCleanup:", 1);
    if (v10)
    {
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_4;
      v88[3] = &unk_1E16B1B78;
      v90 = v83;
      v55 = &v89;
      v56 = v10;
      v89 = v56;
      v57 = v88;
LABEL_37:
      -[UIViewController _endAppearanceTransition:]((uint64_t)v56, v57);

    }
  }
  *(_QWORD *)&self->_navigationControllerFlags &= ~0x1000uLL;
  v58 = (navigationControllerFlags >> 8) & 1;
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      -[UINavigationController delegate](self, "delegate");
      WeakRetained = objc_claimAutoreleasedReturnValue();
    }
    v60 = (void *)WeakRetained;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate") & 1) != 0)
        goto LABEL_45;
      objc_msgSend(v11, "_existingView");
      v84 = v5;
      v61 = v8;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "window");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "_isHostedInAnotherProcess");

      v8 = v61;
      v5 = v84;
      if (v64)
LABEL_45:
        objc_msgSend(v60, "navigationController:didShowViewController:animated:", self, v11, v58);
    }

  }
  -[UINavigationController didShowViewController:animated:](self, "didShowViewController:animated:", v11, v58);
  v65 = (uint64_t)self->_navigationControllerFlags;
  if ((v65 & 0x20000000000000) == 0)
  {
    v66 = *((_BYTE *)&self->_navigationControllerFlags + 8);
    *(_QWORD *)&self->_navigationControllerFlags = v65 | 0x20000000000000;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v66;
    if (v5)
    {
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_5;
      v87[3] = &unk_1E16B1B28;
      v87[4] = self;
      objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v87);
    }
    else
    {
      -[UIViewController _focusSystem](self, "_focusSystem");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController topViewController](self, "topViewController");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v8;
      if (v68)
        v70 = objc_msgSend(v67, "_focusedItemIsContainedInEnvironment:includeSelf:", v68, 1);
      else
        v70 = 0;
      -[UINavigationController navigationBar](self, "navigationBar");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v67, "_focusedItemIsContainedInEnvironment:includeSelf:", v71, 1);

      if ((v70 & 1) == 0 && (v72 & 1) == 0)
      {
        v73 = -[_UIFocusUpdateRequest initWithEnvironment:]([_UIFocusUpdateRequest alloc], "initWithEnvironment:", self);
        -[_UIFocusUpdateRequest setAllowsFocusingCurrentItem:](v73, "setAllowsFocusingCurrentItem:", 1);
        -[UIViewController _focusSystem](self, "_focusSystem");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "_requestFocusUpdate:", v73);

      }
      v8 = v69;
    }
  }
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v76 = v75;
  if (v10)
    objc_msgSend(v75, "setObject:forKey:", v10, CFSTR("UINavigationControllerLastVisibleViewController"));
  if (v11)
    objc_msgSend(v76, "setObject:forKey:", v11, CFSTR("UINavigationControllerNextVisibleViewController"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "postNotificationName:object:userInfo:", CFSTR("UINavigationControllerDidShowViewControllerNotification"), self, v76);

  v78 = _didEndTransitionFromView_toView_wasCustom____s_category;
  if (!_didEndTransitionFromView_toView_wasCustom____s_category)
  {
    v78 = __UILogCategoryGetNode("UINavigationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v78, (unint64_t *)&_didEndTransitionFromView_toView_wasCustom____s_category);
  }
  v79 = *(id *)(v78 + 8);
  v80 = os_signpost_id_make_with_pointer(*(os_log_t *)(v78 + 8), self);
  if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v81 = v80;
    if (os_signpost_enabled(v79))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v79, OS_SIGNPOST_INTERVAL_END, v81, "NavigationTransition", " enableTelemetry=YES ", buf, 2u);
    }
  }

}

void __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(double *)(a1 + 80);
  v3 = *(double *)(a1 + 88);
  v4 = *(double *)(a1 + 96);
  v5 = *(double *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "didMoveToParentViewController:", 0);
  return result;
}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "didMoveToParentViewController:", *(_QWORD *)(result + 40));
  return result;
}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_4(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "didMoveToParentViewController:", 0);
  return result;
}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
}

- (void)_didCancelTransitionFromViewController:(id)a3 toViewController:(id)a4 wrapperView:(id)a5 wasCustom:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  unint64_t navigationControllerFlags;
  UINavigationController *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _UIInvalidatable *keyboardLayoutGuideTransitionAssertion;
  _UIInvalidatable *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  UINavigationDeferredTransitionContext *deferredTransitionContext;
  uint64_t v38;
  uint64_t WeakRetained;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  NSObject *v51;
  os_signpost_id_t v52;
  os_signpost_id_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint8_t buf[16];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  if (v10)
  {
    objc_msgSend(v10, "parentViewController");
    v14 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == self && (*(_QWORD *)&self->_navigationControllerFlags & 0x1000) == 0;

  }
  else
  {
    v15 = 1;
  }
  -[UINavigationController setDisappearingViewController:](self, "setDisappearingViewController:", 0);
  -[UIViewController presentedViewController](self, "presentedViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v12;
  if (v16)
    goto LABEL_18;
  if (!objc_msgSend(v10, "_containedInAbsoluteResponderChain"))
    goto LABEL_19;
  -[UIViewController _keyboardSceneDelegate](self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushAnimationStyle:", v17);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "_restoreInputViewsWithId:animated:", v18, 1);

  if ((v19 & 1) == 0)
  {
    if ((objc_msgSend(v10, "_containsFirstResponder") & 1) != 0)
    {
      if (!objc_msgSend(v11, "_containsFirstResponder"))
        goto LABEL_17;
    }
    else
    {
      if ((objc_msgSend(v10, "becomeFirstResponder") & 1) != 0)
        goto LABEL_17;
      objc_msgSend(v16, "responder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v11, "_shouldAttemptToPreserveInputViewsForResponder:", v20);

      if (!v21)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_preserveInputViewsWithId:animated:", v22, 1);

    }
    objc_msgSend(v16, "responder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resignFirstResponder");

  }
LABEL_17:
  objc_msgSend(v16, "popAnimationStyle");
  v12 = v58;
LABEL_18:

LABEL_19:
  if (v6)
  {
    objc_msgSend(v11, "childModalViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      objc_msgSend(v25, "superview");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      if (v27 == v12)
      {
        objc_msgSend(v11, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeFromSuperview");

        v26 = v12;
      }
      else
      {
        objc_msgSend(v27, "removeFromSuperview");
        v26 = v27;
      }
    }
    else
    {
      objc_msgSend(v25, "removeFromSuperview");
    }

  }
  -[UINavigationController _presentationTransitionUnwrapViewController:](self, "_presentationTransitionUnwrapViewController:", v10);
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x200) != 0)
  {
    -[UIViewController _keyboardSceneDelegate](self);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "popAnimationStyle");

    keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
    if (keyboardLayoutGuideTransitionAssertion)
    {
      -[_UIInvalidatable _invalidate](keyboardLayoutGuideTransitionAssertion, "_invalidate");
      v31 = self->_keyboardLayoutGuideTransitionAssertion;
      self->_keyboardLayoutGuideTransitionAssertion = 0;

    }
    -[UINavigationController _window](self, "_window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isTrackingKeyboard");

    if (v33)
    {
      -[UINavigationController _window](self, "_window");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "moveKeyboardLayoutGuideOverEdge:layoutViews:", 0, 0);

    }
    *(_QWORD *)&self->_navigationControllerFlags &= ~0x200uLL;
  }
  if (v15)
    -[UINavigationController removeChildViewController:notifyDidMove:](self, "removeChildViewController:notifyDidMove:", v11, 0);
  else
    -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:](self, "_addChildViewController:performHierarchyCheck:notifyWillMove:", v10, 0, 0);
  -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
  objc_msgSend(v11, "cancelBeginAppearanceTransition");
  objc_msgSend(v10, "cancelBeginAppearanceTransition");
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self, "topViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_updateTopViewFramesForViewController:isCancelledTransition:isOrientationChange:", v36, 1, 0);

  -[UINavigationController _clearLastOperation](self);
  *(_QWORD *)&self->_navigationControllerFlags &= ~4uLL;
  deferredTransitionContext = self->_deferredTransitionContext;
  self->_deferredTransitionContext = 0;

  if (dyld_program_sdk_at_least())
  {
    v38 = (navigationControllerFlags >> 8) & 1;
    if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
    {
      if ((dyld_program_sdk_at_least() & 1) != 0)
      {
        WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
      }
      else
      {
        -[UINavigationController delegate](self, "delegate");
        WeakRetained = objc_claimAutoreleasedReturnValue();
      }
      v40 = (void *)WeakRetained;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate") & 1) != 0
          || (objc_msgSend(v11, "_existingView"),
              v41 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v41, "window"),
              v42 = (void *)objc_claimAutoreleasedReturnValue(),
              v43 = objc_msgSend(v42, "_isHostedInAnotherProcess"),
              v42,
              v41,
              v43))
        {
          objc_msgSend(v40, "navigationController:willShowViewController:animated:", self, v10, v38);
        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate") & 1) != 0
          || (objc_msgSend(v11, "_existingView"),
              v44 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v44, "window"),
              v45 = (void *)objc_claimAutoreleasedReturnValue(),
              v46 = objc_msgSend(v45, "_isHostedInAnotherProcess"),
              v45,
              v44,
              v46))
        {
          objc_msgSend(v40, "navigationController:didShowViewController:animated:", self, v10, v38);
        }
      }

    }
    -[UINavigationController willShowViewController:animated:](self, "willShowViewController:animated:", v10, v38);
    -[UINavigationController didShowViewController:animated:](self, "didShowViewController:animated:", v10, v38);
  }
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v48 = v47;
  if (v10)
    objc_msgSend(v47, "setObject:forKey:", v10, CFSTR("UINavigationControllerLastVisibleViewController"));
  if (v11)
    objc_msgSend(v48, "setObject:forKey:", v11, CFSTR("UINavigationControllerNextVisibleViewController"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "postNotificationName:object:userInfo:", CFSTR("UINavigationControllerDidCancelShowingViewControllerNotification"), self, v48);

  v50 = _didCancelTransitionFromViewController_toViewController_wrapperView_wasCustom____s_category;
  if (!_didCancelTransitionFromViewController_toViewController_wrapperView_wasCustom____s_category)
  {
    v50 = __UILogCategoryGetNode("UINavigationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v50, (unint64_t *)&_didCancelTransitionFromViewController_toViewController_wrapperView_wasCustom____s_category);
  }
  v51 = *(id *)(v50 + 8);
  v52 = os_signpost_id_make_with_pointer(*(os_log_t *)(v50 + 8), self);
  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v53 = v52;
    if (os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v51, OS_SIGNPOST_INTERVAL_END, v53, "NavigationTransition", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_resetScrollViewObservingForViewController:", v10);
  objc_msgSend(v11, "_contentOrObservableScrollViewForEdge:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_contentOrObservableScrollViewForEdge:", 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_stopObservingContentScrollView:", v55);
  if (v56 != v55)
    objc_msgSend(v54, "_stopObservingContentScrollView:", v56);
  -[UINavigationController _navigationToolbarTransitionController](self, "_navigationToolbarTransitionController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "cancelTransition");

  -[UINavigationController _updateEnclosingTabBarControllerForStackChange](self, "_updateEnclosingTabBarControllerForStackChange");
  -[UINavigationController _updateBottomBarHiddenState](self, "_updateBottomBarHiddenState");

}

- (void)_setCustomTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)wasLastOperationAnimated
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 8) & 1;
}

- (BOOL)_shouldNavigationBarInsetViewController:(id)a3
{
  return -[UINavigationController _shouldNavigationBarInsetViewController:orOverlayContent:](self, "_shouldNavigationBarInsetViewController:orOverlayContent:", a3, 0);
}

- (BOOL)_shouldChildViewControllerUseFullScreenLayout:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  if (-[UIViewController _shouldChildViewControllerUseFullScreenLayout:](&v7, sel__shouldChildViewControllerUseFullScreenLayout_, v4))
  {
    v5 = !-[UINavigationController _shouldNavigationBarInsetViewController:](self, "_shouldNavigationBarInsetViewController:", v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (UIEdgeInsets)_avoidanceInsets
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
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  UIEdgeInsets result;

  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  -[UIViewController _avoidanceInsets](&v17, sel__avoidanceInsets);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UINavigationController existingPaletteForEdge:](self, "existingPaletteForEdge:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "frame");
    v4 = v4 + CGRectGetHeight(v18);
  }

  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int has_internal_diagnostics;
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
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  id v26;
  uint64_t v27;
  UIEdgeInsets result;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v6)
    v8 = 1;
  else
    v8 = v4 == 0;
  v9 = !v8;
  if (has_internal_diagnostics)
  {
    if (v9)
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v25 = 138412290;
        v26 = v3;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Paying the price for an isKindOfClass check for pre-iOS 11.0 search controller behavior that failed. Presenting view controller: %@", (uint8_t *)&v25, 0xCu);
      }

      goto LABEL_18;
    }
  }
  else if (v9)
  {
    v23 = _edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController____s_category;
    if (!_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController____s_category)
    {
      v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController____s_category);
    }
    v24 = *(NSObject **)(v23 + 8);
    v17 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = 138412290;
      v26 = v3;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Paying the price for an isKindOfClass check for pre-iOS 11.0 search controller behavior that failed. Presenting view controller: %@", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_19;
  }
  if (!v6)
  {
LABEL_18:
    v17 = 0.0;
LABEL_19:
    v15 = 0.0;
    v13 = 0.0;
    v11 = 0.0;
    goto LABEL_20;
  }
  LOBYTE(v25) = 0;
  objc_msgSend(v6, "_edgeInsetsForChildViewController:insetsAreAbsolute:", v3, &v25);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
LABEL_20:

  v19 = v11;
  v20 = v13;
  v21 = v15;
  v22 = v17;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (BOOL)_navigationBar:(id)a3 getContentOffsetOfObservedScrollViewIfApplicable:(CGPoint *)a4
{
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  BOOL v10;

  -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v7))
  {
    if (a4)
    {
      objc_msgSend(v7, "contentOffset");
      a4->x = v8;
      a4->y = v9;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNavigationControllerContentInsetAdjustment:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_isTransitioningSearchController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_searchControllerIfAllowed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isActive"))
    {
      objc_msgSend(v5, "transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_scrollToRevealNavigationBarPart:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v4 = a4;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v18, v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v18, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_stackEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeLayout");
    v12 = (id *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[_UINavigationBarLayout layoutHeightRevealingPart:](v12, a3);
      if (v13 > 0.0)
      {
        v14 = v13;
        objc_msgSend(v9, "frame");
        v16 = -(v14 + v15);
        objc_msgSend(v8, "contentOffset");
        if (v17 > v16)
          objc_msgSend(v8, "setContentOffset:animated:", v4);
      }
    }

  }
}

- (id)_scrollDetentOffsetsForScrollView:(id)a3
{
  id v4;
  UINavigationController *v5;
  id *p_isa;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t i;
  void *v24;
  int v25;
  float v26;
  void *v27;
  void *v28;
  float v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  p_isa = (id *)&v5->super.super.super.isa;
  if (v5->__positionBarsExclusivelyWithSafeArea
    && (-[UIViewController _existingView](v5, "_existingView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "_usesMinimumSafeAreas"),
        v7,
        v8))
  {
    objc_msgSend(p_isa, "_existingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_minimumSafeAreaInsets");
    v11 = v10;

  }
  else
  {
    objc_msgSend(p_isa, "_contentOverlayInsets");
    v11 = v12;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_allowedNavigationOverlapAmount");
  v15 = v14;
  v16 = v14 - v11;
  if (objc_msgSend(p_isa, "_isNavigationBarVisible"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(p_isa[122], "_restingHeights", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v20 = v18;
      v21 = *(_QWORD *)v33;
      v22 = 1;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v17);
          v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((v22 & 1) == 0
            || (v25 = objc_msgSend(v4, "_canScrollWithoutBouncingIncludingRevealableContentPaddingTopY"),
                v19 = -1073741820.0,
                v25))
          {
            objc_msgSend(v24, "floatValue", v19);
            v19 = v26;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v27);

          v22 = 0;
        }
        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v22 = 0;
      }
      while (v20);
    }

    objc_msgSend(v13, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v16 = v16 - v29;

  }
  if (v15 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v30);

  }
  return v13;
}

- (double)_scrollOffsetRetargettedToDetentOffsetIfNecessary:(double)a3 unclampedOriginalTargetOffset:(double)a4 scrollView:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  double v25;
  float v27;

  v7 = a5;
  -[UINavigationController _scrollDetentOffsetsForScrollView:](self, "_scrollDetentOffsetsForScrollView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  if (v10 <= a3)
    goto LABEL_16;
  objc_msgSend(v8, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  if (v12 >= a3)
  {

    goto LABEL_16;
  }
  v13 = objc_msgSend(v8, "count");

  if (v13 < 2)
    goto LABEL_17;
  objc_msgSend(v7, "_allowedNavigationOverlapAmount");
  v15 = v14;
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
LABEL_14:
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    a3 = v27;
LABEL_16:

    goto LABEL_17;
  }
  v16 = -a3;
  v17 = 1;
  while (1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v17 - 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;

    if (v15 != 0.0 && v17 == objc_msgSend(v8, "count") - 1)
      break;
    v24 = (float)-v20;
    v25 = (float)-v23;
    if (v24 <= v16 && v16 <= v25)
    {
      if ((v24 + v25) * 0.5 <= v16)
        v24 = (float)-v23;
      a3 = -v24;
      break;
    }
    if (++v17 >= (unint64_t)objc_msgSend(v8, "count"))
      goto LABEL_14;
  }
LABEL_17:

  return a3;
}

- (void)_observeScrollView:(id)a3 willEndDraggingWithVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 unclampedOriginalTarget:(CGPoint)a6
{
  double y;
  id v9;
  int isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets;
  void *v11;
  int v12;
  CGFloat v13;
  id v14;

  y = a6.y;
  v9 = a3;
  if (a5)
  {
    v14 = v9;
    isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets = _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v9);
    v9 = v14;
    if (isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets)
    {
      -[UINavigationController topViewController](self, "topViewController", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = _insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v11);

      v9 = v14;
      if (v12)
      {
        -[UINavigationController _scrollOffsetRetargettedToDetentOffsetIfNecessary:unclampedOriginalTargetOffset:scrollView:](self, "_scrollOffsetRetargettedToDetentOffsetIfNecessary:unclampedOriginalTargetOffset:scrollView:", v14, a5->y, y);
        v9 = v14;
        a5->y = v13;
      }
    }
  }

}

- (UIEdgeInsets)_collapsableContentPaddingForObservedScrollView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v4 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v5);

  v7 = 0.0;
  if (v6 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v4))
  {
    -[UINavigationController _heightRangeOfTopViews](self, "_heightRangeOfTopViews");
    v9 = v8;
    -[UINavigationController navigationBar](self, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    -[UIView bounds](self->_topPalette, "bounds");
    v14 = v12 + v13 - v9;

    v7 = fmax(v14, 0.0);
  }

  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  v18 = v7;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v18;
  return result;
}

- (double)_navigationBar:(id)a3 preferredHeightForTransitionToHeightRange:(id)a4
{
  double var2;
  double var0;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  var2 = a4.var2;
  var0 = a4.var0;
  -[UINavigationController topViewController](self, "topViewController", a3, a4.var0, a4.var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "contentOffset");
    v10 = v9;
    objc_msgSend(v8, "adjustedContentInset");
    if (v10 + v11 > 0.0)
      var2 = var0;
  }

  return var2;
}

- (BOOL)_tryRequestPopToItem:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UINavigationController *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UINavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 < 2)
    goto LABEL_21;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v8)
    goto LABEL_20;
  v9 = v8;
  v20 = self;
  v21 = v5;
  v10 = *(_QWORD *)v23;
LABEL_4:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v23 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v13 = v12;
    if (objc_msgSend(v13, "_tryRequestPopToItem:", v4))
    {

LABEL_16:
      v5 = v21;
      goto LABEL_20;
    }
    objc_msgSend(v13, "topViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v4)
      goto LABEL_18;

LABEL_12:
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  objc_msgSend(v12, "navigationItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v4)
    goto LABEL_12;
  v17 = v12;
LABEL_18:

  v5 = v21;
  if (v12)
  {
    v18 = -[UINavigationController popToViewController:animated:](v20, "popToViewController:animated:", v12, 1);
    v7 = v12;
LABEL_20:

  }
LABEL_21:

  return v6 > 1;
}

- (void)_navigationBar:(id)a3 requestPopToItem:(id)a4
{
  -[UINavigationController _tryRequestPopToItem:](self, "_tryRequestPopToItem:", a4);
}

- (BOOL)_navigationBarTopItemIsNestedNavigationController:(id)a3
{
  void *v3;
  char v4;

  -[UINavigationController topViewController](self, "topViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isNestedNavigationController");

  return v4;
}

- (void)_observeScrollViewWillBeginDragging:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[UINavigationController _immediatelyFinishNavigationBarTransition](self, "_immediatelyFinishNavigationBarTransition");
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x200000000000000) != 0)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      -[UINavigationController _setInteractiveScrollActive:](self, "_setInteractiveScrollActive:", 1);
  }

}

- (void)_observeScrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6 && !a4)
    -[UINavigationController _setInteractiveScrollActive:](self, "_setInteractiveScrollActive:", 0);
}

- (void)_observeScrollViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[UINavigationController _setInteractiveScrollActive:](self, "_setInteractiveScrollActive:", 0);
}

- (void)_setSuspendToolbarBackgroundUpdating:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)_suspendToolbarBackgroundUpdating
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 61) & 1;
}

uint64_t __112__UINavigationController__updateBackgroundTransitionProgressForScrollView_toolbar_isNavigationTransitionUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBackgroundTransitionProgress:", *(double *)(a1 + 40));
}

- (void)_observeScrollView:(id)a3 didBeginTransitionToDeferredContentOffset:(CGPoint)a4
{
  if (-[UINavigationController _isPushingOrPoppingUsingLayoutToLayoutNavigationTransition](self, "_isPushingOrPoppingUsingLayoutToLayoutNavigationTransition", a3, a4.x, a4.y))
  {
    -[UINavigationController _performCoordinatedUpdateTopFramesTransitionAnimation](self, "_performCoordinatedUpdateTopFramesTransitionAnimation");
  }
}

- (void)_observeScrollViewHasClearedContentOffsetAnimation:(id)a3
{
  UISearchController **p_searchControllerToNotifyWhenScrollingAnimationStops;
  id WeakRetained;
  id v5;

  p_searchControllerToNotifyWhenScrollingAnimationStops = &self->_searchControllerToNotifyWhenScrollingAnimationStops;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchControllerToNotifyWhenScrollingAnimationStops);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_searchControllerToNotifyWhenScrollingAnimationStops);
    objc_msgSend(v5, "_contentScrollViewDidFinishContentOffsetAnimation");

    objc_storeWeak((id *)p_searchControllerToNotifyWhenScrollingAnimationStops, 0);
  }
}

- (BOOL)_navigationItemShouldDeferSearchPresentationOrDismissalForScrollViewAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "_searchControllerIfAllowed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v6, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && objc_msgSend(v9, "isScrollAnimating"))
      {
        objc_storeWeak((id *)&self->_searchControllerToNotifyWhenScrollingAnimationStops, v5);
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_immediatelyFinishNavigationBarTransition
{
  UINavigationController *v3;
  UINavigationController *v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);

  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v3 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self)
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_immediatelyFinishRunningTransition");
    v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    -[_UIViewControllerTransitionConductor transitionCoordinator](self->_transitionConductor, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UIViewControllerTransitionConductor transitionCoordinator](self->_transitionConductor, "transitionCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __67__UINavigationController__immediatelyFinishNavigationBarTransition__block_invoke;
      v9[3] = &unk_1E16B1CC8;
      v10 = v6;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v9);

    }
    else
    {
      v6[2](v6);
    }

  }
  else
  {
    -[UINavigationController _immediatelyFinishNavigationBarTransition](v3, "_immediatelyFinishNavigationBarTransition");
  }

}

uint64_t __67__UINavigationController__immediatelyFinishNavigationBarTransition__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reloadCachedInteractiveScrollMeasurements
{
  $159A8CB0983A181321B2526656F627B7 *p_interactiveScrollNavBarIntrinsicHeightRange;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  if (self->_interactiveScrollActive)
  {
    self->_interactiveScrollActive = 0;
    p_interactiveScrollNavBarIntrinsicHeightRange = &self->_interactiveScrollNavBarIntrinsicHeightRange;
    -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _intrinsicNavigationBarHeightRangeForNavItem:](self, "_intrinsicNavigationBarHeightRangeForNavItem:", v5);
    p_interactiveScrollNavBarIntrinsicHeightRange->minimum = v6;
    p_interactiveScrollNavBarIntrinsicHeightRange->preferred = v7;
    p_interactiveScrollNavBarIntrinsicHeightRange->maximum = v8;

    self->_interactiveScrollActive = 1;
  }
}

- (void)_scrollViewManagerDidFinishScrolling:(id)a3
{
  _UITVScrollViewManager *scrollViewManager;
  id v5;
  void *v6;
  void *v7;
  _UIFocusRegionContainerProxy *v8;
  void *v9;
  void *v10;
  _UIFocusRegionContainerProxy *v11;
  _UIFocusMap *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIFocusMap *v17;
  void *v18;
  void *v19;
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
  double MaxX;
  double v33;
  void *v34;
  UIFocusItem *overridingDestinationItemForFocusUpdate;
  id v36;
  CGRect v37;

  scrollViewManager = self->_scrollViewManager;
  self->_scrollViewManager = 0;
  v5 = a3;

  objc_msgSend(v5, "scrollView");
  v36 = (id)objc_claimAutoreleasedReturnValue();

  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_focusSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [_UIFocusRegionContainerProxy alloc];
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIFocusRegionContainerProxy initWithOwningEnvironment:itemContainer:](v8, "initWithOwningEnvironment:itemContainer:", v9, v10);

    v12 = [_UIFocusMap alloc];
    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_focusSystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coordinateSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[_UIFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:](v12, "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v14, v11, v16, 0, 1);

    -[UIViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v18, "_shouldReverseLayoutDirection");

    -[UIViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v28 = v21;
    v29 = v23;
    v30 = v25;
    v31 = v27;
    if ((_DWORD)v14)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v28);
      v33 = 1.0;
    }
    else
    {
      MaxX = CGRectGetMinX(*(CGRect *)&v28);
      v33 = 0.0;
    }
    v37.origin.x = v21;
    v37.origin.y = v23;
    v37.size.width = v25;
    v37.size.height = v27;
    -[_UIFocusMap _closestFocusableItemToPoint:inRect:excludingItems:distanceMeasuringUnitPoint:](v17, "_closestFocusableItemToPoint:inRect:excludingItems:distanceMeasuringUnitPoint:", 0, MaxX, CGRectGetMinY(v37), v21, v23, v25, v27, 0.0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      objc_storeStrong((id *)&self->_overridingDestinationItemForFocusUpdate, v34);

  }
  -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  -[UIViewController updateFocusIfNeeded](self, "updateFocusIfNeeded");
  overridingDestinationItemForFocusUpdate = self->_overridingDestinationItemForFocusUpdate;
  self->_overridingDestinationItemForFocusUpdate = 0;

}

void __98__UINavigationController__shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performSkippedHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary");

}

- (void)_performSkippedHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary
{
  uint64_t navigationControllerFlags;
  char v4;
  id v5;

  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x80000000000000) != 0)
  {
    v4 = *((_BYTE *)&self->_navigationControllerFlags + 8);
    *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags & 0xFF7FFFFFFFFFFFFFLL;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v4;
    -[UINavigationController _topViewControllerObservableScrollViewForEdge:](self, "_topViewControllerObservableScrollViewForEdge:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:](self, "_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:", v5);

  }
}

- (void)_setUpHostedRefreshControlForScrollView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[UINavigationController _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:](self, "_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:", v7);
    v6 = v7;
  }

}

- (void)_startDeferredTransitionIfNeeded
{
  -[_UIViewControllerTransitionConductor startDeferredTransitionIfNeeded](self->_transitionConductor, "startDeferredTransitionIfNeeded");
}

- (int)_deferredTransition
{
  return -[_UIViewControllerTransitionConductor deferredTransitionType](self->_transitionConductor, "deferredTransitionType");
}

- (UIViewControllerAnimatedTransitioning)_cachedTransitionController
{
  return -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("__cachedTransitionController")))
  {
    UIKVCAccessProhibited((uint64_t)v4, (uint64_t)CFSTR("UINavigationController"));

    return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationController;
    -[UINavigationController valueForUndefinedKey:](&v7, sel_valueForUndefinedKey_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (UIViewControllerInteractiveTransitioning)_interactionController
{
  return -[_UIViewControllerTransitionConductor interactiveTransitionController](self->_transitionConductor, "interactiveTransitionController");
}

- (UIViewControllerInteractiveTransitioning)_cachedInteractionController
{
  return -[_UINavigationControllerVisualStyle interactionController](self->_visualStyle, "interactionController");
}

- (void)_setCachedTransitionController:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_UINavigationControllerVisualStyle setTransitionController:](self->_visualStyle, "setTransitionController:", v4);

}

- (void)_setCachedInteractionController:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_UINavigationControllerVisualStyle setInteractionController:](self->_visualStyle, "setInteractionController:", v4);

}

- (id)_builtinTransitionController
{
  return -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
}

- (id)_builtinInteractionController
{
  return -[_UINavigationControllerVisualStyle interactionController](self->_visualStyle, "interactionController");
}

- (id)_createBuiltInTransitionControllerForOperation:(int64_t)a3
{
  -[_UINavigationControllerVisualStyle updateTransitionControllerWithOperation:](self->_visualStyle, "updateTransitionControllerWithOperation:", a3);
  return -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
}

- (id)_createBuiltInInteractionControllerForAnimationController:(id)a3
{
  return 0;
}

- (id)_customTransitionController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _UINavigationCrossfadeAnimator *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _UITabCrossFadeTransition *v19;
  void *v20;
  id v21;
  _BOOL8 v22;
  id v23;
  void *v24;
  uint64_t navigationControllerFlags;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _UIViewControllerOneToOneTransitionContext *v39;
  void *v40;
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
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;

  v3 = a3;
  -[_UIViewControllerTransitionConductor transitionController](self->_transitionConductor, "transitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UINavigationController disappearingViewController](self, "disappearingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v65 = objc_claimAutoreleasedReturnValue();

    v10 = -[UINavigationController lastOperation](self, "lastOperation");
    -[UINavigationController _setUsingBuiltinAnimator:](self, "_setUsingBuiltinAnimator:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v10 == 1)
      v12 = v8;
    else
      v12 = v7;
    v13 = v12;
    objc_msgSend(v13, "preferredTransition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "_transitionControllerForViewController:inContainer:isAppearing:", v13, self, v10 == 1);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (_UINavigationCrossfadeAnimator *)v16;
      goto LABEL_9;
    }
    if (-[UINavigationController _wantsTabCrossFadeTransition](self, "_wantsTabCrossFadeTransition"))
    {
      v19 = [_UITabCrossFadeTransition alloc];
      -[UIViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "backgroundColor");
      v21 = v13;
      v22 = v3;
      v23 = WeakRetained;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[_UITabCrossFadeTransition initWithBackgroundColor:](v19, "initWithBackgroundColor:", v24);

      WeakRetained = v23;
      v3 = v22;
      v13 = v21;
      v15 = 0;

      if (v6)
      {
LABEL_9:
        if (!-[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
        {
          v17 = _AXSReduceMotionReduceSlideTransitionsEnabled();
          if (!v6)
          {
            if (v17)
              v6 = objc_alloc_init(_UINavigationCrossfadeAnimator);
          }
        }
        if (v6)
          goto LABEL_42;
        if ((*(_QWORD *)&self->_navigationControllerFlags & 0x40000000) != 0)
          v18 = objc_msgSend(WeakRetained, "_navigationControllerLayoutTransitioningClass:", self);
        else
          v18 = 0;
        if (v10 == 1)
        {
          if (!objc_msgSend(v8, "_usesSharedView"))
            goto LABEL_40;
          objc_msgSend(v8, "_uiCollectionView");
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
            goto LABEL_40;
          v27 = (void *)v26;
          objc_msgSend(v8, "_uiCollectionView");
          v60 = (void *)v18;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_uiCollectionView");
          v62 = WeakRetained;
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = v28 == v29;
          WeakRetained = v62;
          if (!v30)
          {
LABEL_40:
            -[UINavigationController _createBuiltInTransitionControllerForOperation:](self, "_createBuiltInTransitionControllerForOperation:", *(_QWORD *)&self->_navigationControllerFlags >> 4);
            v6 = (_UINavigationCrossfadeAnimator *)objc_claimAutoreleasedReturnValue();
            -[UINavigationController _setCachedTransitionController:](self, "_setCachedTransitionController:", v6);
            if (!v6)
            {
              -[UINavigationController _setUsingBuiltinAnimator:](self, "_setUsingBuiltinAnimator:", 1);
              goto LABEL_43;
            }
            *(_QWORD *)&self->_navigationControllerFlags |= 0x20000uLL;
            -[UINavigationController _setUsingBuiltinAnimator:](self, "_setUsingBuiltinAnimator:", 1);
LABEL_42:
            +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v6);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v37)
            {
              v64 = WeakRetained;
              v39 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
              objc_msgSend(v7, "view");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "frame");
              v42 = v41;
              v44 = v43;
              v46 = v45;
              v48 = v47;

              -[_UIViewControllerTransitionContext _setIsAnimated:](v39, "_setIsAnimated:", v3);
              -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v39, "_setFromViewController:", v7);
              -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v39, "_setToViewController:", v8);
              v38 = (void *)v65;
              -[_UIViewControllerTransitionContext _setContainerView:](v39, "_setContainerView:", v65);
              -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v39, "_setFromStartFrame:", v42, v44, v46, v48);
              -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v39, "_setToEndFrame:", v42, v44, v46, v48);
              v49 = *MEMORY[0x1E0C9D648];
              v50 = *(double *)(MEMORY[0x1E0C9D648] + 8);
              v51 = *(double *)(MEMORY[0x1E0C9D648] + 16);
              v52 = *(double *)(MEMORY[0x1E0C9D648] + 24);
              -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v39, "_setToStartFrame:", *MEMORY[0x1E0C9D648], v50, v51, v52);
              -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v39, "_setFromEndFrame:", v49, v50, v51, v52);
              -[_UIViewControllerTransitionContext _setAnimator:](v39, "_setAnimator:", v6);
              if (-[UINavigationController _isUsingBuiltinAnimator](self, "_isUsingBuiltinAnimator"))
                -[_UIViewControllerTransitionContext _setCompletionCurve:](v39, "_setCompletionCurve:", 7);
              objc_msgSend(v8, "childModalViewController");
              v53 = objc_claimAutoreleasedReturnValue();
              if (v53)
              {
                v54 = (void *)v53;
                objc_msgSend(v8, "view");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "superview");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (v56)
                {
                  objc_msgSend(v8, "view");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "superview");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_UIViewControllerOneToOneTransitionContext _setToView:](v39, "_setToView:", v58);

                }
              }

              WeakRetained = v64;
              goto LABEL_50;
            }
LABEL_43:
            v38 = (void *)v65;
LABEL_50:

            return v6;
          }
          if (v60)
          {
            objc_msgSend(v60, "transitionForOperation:fromViewController:toViewController:", 1, v7, v8);
            v6 = (_UINavigationCrossfadeAnimator *)objc_claimAutoreleasedReturnValue();
            if (v6)
              goto LABEL_42;
          }
          v31 = v8;
          v32 = 1;
        }
        else
        {
          if (v10 != 2)
            goto LABEL_40;
          if (!objc_msgSend(v7, "_usesSharedView"))
            goto LABEL_40;
          objc_msgSend(v8, "_uiCollectionView");
          v33 = objc_claimAutoreleasedReturnValue();
          if (!v33)
            goto LABEL_40;
          v34 = (void *)v33;
          objc_msgSend(v8, "_uiCollectionView");
          v61 = (void *)v18;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_uiCollectionView");
          v63 = WeakRetained;
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = v35 == v36;
          WeakRetained = v63;
          if (!v30)
            goto LABEL_40;
          if (v61)
          {
            objc_msgSend(v61, "transitionForOperation:fromViewController:toViewController:", 2, v7, v8);
            v6 = (_UINavigationCrossfadeAnimator *)objc_claimAutoreleasedReturnValue();
            if (v6)
              goto LABEL_42;
          }
          v31 = v7;
          v32 = 2;
        }
        objc_msgSend(v31, "_animatorForOperation:fromViewController:toViewController:", v32, v7, v8);
        v6 = (_UINavigationCrossfadeAnimator *)objc_claimAutoreleasedReturnValue();
        if (v6)
          goto LABEL_42;
        goto LABEL_40;
      }
    }
    if (!-[UINavigationController _shouldIgnoreDelegateTransitionController](self, "_shouldIgnoreDelegateTransitionController"))
    {
      navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
      if ((navigationControllerFlags & 0x200000) != 0)
      {
        objc_msgSend(WeakRetained, "navigationController:animationControllerForOperation:fromViewController:toViewController:", self, v10, v7, v8);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      if ((navigationControllerFlags & 0x400000) != 0)
      {
        objc_msgSend(WeakRetained, "navigationController:animatorForOperation:fromViewController:toViewController:", self, v10, v7, v8);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v6 = 0;
    goto LABEL_9;
  }
  -[_UIViewControllerTransitionConductor transitionController](self->_transitionConductor, "transitionController");
  v6 = (_UINavigationCrossfadeAnimator *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_showcaseView
{
  void *v2;
  void *v3;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_showcaseView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldUseBuiltinInteractionController
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t navigationControllerFlags;
  id WeakRetained;
  char v11;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_hasOwnInteractiveExitGestureForTraits:", v5);

  if ((v6 & 1) != 0
    || !-[UINavigationController _isUsingBuiltinAnimator](self, "_isUsingBuiltinAnimator")
    && -[UINavigationController _hasInterruptibleNavigationTransition](self, "_hasInterruptibleNavigationTransition"))
  {
    return 0;
  }
  if (-[UINavigationController _isUsingBuiltinAnimator](self, "_isUsingBuiltinAnimator"))
  {
    -[_UINavigationControllerVisualStyle interactionController](self->_visualStyle, "interactionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      return 1;
  }
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x600000) == 0)
    return 1;
  if ((navigationControllerFlags & 0x8000000) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_msgSend(WeakRetained, "_navigationControllerShouldUseBuiltinInteractionController:", self);

  return v11;
}

- (id)_customInteractionController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t navigationControllerFlags;
  void *v13;
  void *v14;

  v4 = a3;
  -[_UIViewControllerTransitionConductor interactiveTransitionController](self->_transitionConductor, "interactiveTransitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "_animator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v7)
      goto LABEL_14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "_interactionController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
LABEL_6:
        objc_msgSend(v4, "_setInteractor:", v9);
LABEL_26:
        v6 = v9;

        goto LABEL_27;
      }
LABEL_14:
      if ((+[UIView _interruptibleParallaxTransitionsEnabled]()
         && -[UINavigationController _isUsingBuiltinAnimator](self, "_isUsingBuiltinAnimator")
         || -[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
        && (-[UINavigationController _shouldUseBuiltinInteractionController](self, "_shouldUseBuiltinInteractionController")|| (-[_UINavigationControllerVisualStyle transitionController](self->_visualStyle, "transitionController"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v7 == v13)))
      {
        -[_UINavigationControllerVisualStyle interactionController](self->_visualStyle, "interactionController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v4, "_setInteractor:", v14);
          v9 = v14;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v9, "setAnimationController:", v7);
          }
        }
        else
        {
          -[UINavigationController _createBuiltInInteractionControllerForAnimationController:](self, "_createBuiltInInteractionControllerForAnimationController:", v7);
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v9 = 0;
      }
      goto LABEL_26;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = WeakRetained;
    navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x800000) != 0)
    {
      objc_msgSend(WeakRetained, "navigationController:interactionControllerForAnimationController:", self, v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_13;
      navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    }
    if ((navigationControllerFlags & 0x1000000) != 0)
    {
      objc_msgSend(v11, "navigationController:interactionControllerUsingAnimator:", self, v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
LABEL_13:

    if (v9)
      goto LABEL_6;
    goto LABEL_14;
  }
  -[_UIViewControllerTransitionConductor interactiveTransitionController](self->_transitionConductor, "interactiveTransitionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v6;
}

- (id)separateSecondaryViewControllerForSplitViewController:(id)a3
{
  void *v3;
  void *v4;

  -[UINavigationController _separateViewControllersAfterAndIncludingViewController:forSplitViewController:](self, "_separateViewControllersAfterAndIncludingViewController:forSplitViewController:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  unsigned __int8 v9;
  objc_super v11;

  v6 = a4;
  v7 = v6;
  if (sel_showViewController_sender_ == a3 && (*(_QWORD *)&self->_navigationControllerFlags & 0x8000000000000) != 0)
  {
    v8 = 0;
    goto LABEL_13;
  }
  if (sel__performBackKeyCommand_ != a3 || !objc_msgSend(v6, "isEqual:", self->_backKeyCommand))
  {
    if (sel_rename_ == a3)
    {
      v9 = -[UINavigationController _canPerformRename:](self, "_canPerformRename:", v7);
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UINavigationController;
      v9 = -[UIViewController canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v7);
    }
    goto LABEL_12;
  }
  if (!-[UINavigationController _canPerformBackKeyCommandToPopViewController](self, "_canPerformBackKeyCommandToPopViewController"))
  {
    v9 = -[UINavigationController _canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:](self, "_canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:", v7);
LABEL_12:
    v8 = v9;
    goto LABEL_13;
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)_sanityCheckPushViewController:(id)a3 transition:(int)a4 forceImmediate:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UINavigationController *v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  UINavigationController *v24;
  _BOOL4 v25;
  uint64_t v26;
  __CFString *v27;
  unint64_t v28;
  NSObject *v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  UINavigationController *v37;
  unint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  UINavigationController *v47;
  unint64_t v48;
  NSObject *v49;
  unint64_t v50;
  NSObject *v51;
  unint64_t v53;
  NSObject *v54;
  void *v55;
  UINavigationController *v56;
  NSObject *v57;
  id v58;
  UINavigationController *v59;
  __CFString *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  UINavigationController *v79;
  __int16 v80;
  id v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  const __CFString *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v5 = a5;
  v88 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  if (qword_1EDDB0F58 != -1)
    dispatch_once(&qword_1EDDB0F58, &__block_literal_global_1624);
  if (byte_1EDDB0E54)
  {
    v8 = qword_1EDDB0EC8;
    if (!qword_1EDDB0EC8)
    {
      v8 = __UILogCategoryGetNode("NavigationControllerVerboseLoggingForStrictRepeatedPushAssertion", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1EDDB0EC8);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (v5)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = (void *)MEMORY[0x1E0CB3978];
      v12 = v9;
      objc_msgSend(v11, "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v79 = self;
      v80 = 2112;
      v81 = v66;
      v82 = 2048;
      v83 = a4;
      v84 = 2112;
      v85 = v10;
      v86 = 2112;
      v87 = v13;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "-pushViewController:transition:forceImmediate: sent to %@ passing %@, transition=%lu, forceImmediate=%@\n%@", buf, 0x34u);

    }
  }
  if (v66)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || -[UINavigationController _allowChildSplitViewControllers](self, "_allowChildSplitViewControllers"))
    {
      -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v66, "_isNavigationController");
      if (objc_msgSend(v65, "containsObject:", v66))
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        _UIMainBundleIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ is pushing the same view controller instance (%@) more than once which is not supported and is most likely an error in the application : %@"), self, v66, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          goto LABEL_16;
      }
      else if (v14)
      {
        if (!-[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Pushing a navigation controller is not supported"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
LABEL_16:
            -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_panelImpl");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v64)
              goto LABEL_97;
            v19 = (UINavigationController *)v66;
            v20 = v18;
            v21 = v20;
            v61 = 0;
            if (!self || !v20)
            {
LABEL_39:
              v63 = v21;

              objc_msgSend(v64, "currentState");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v62, "_collapsedState");
              if (v26 == 1)
              {
                v27 = CFSTR("collapsing");
              }
              else if (v26 == 2)
              {
                v27 = CFSTR("collapsed");
              }
              else
              {
                v27 = CFSTR("expanding");
                if (!v26)
                  v27 = CFSTR("expanded");
              }
              v60 = v27;
              objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(" [%@]"), v60);
              v59 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

              v28 = qword_1EDDB0ED0;
              if (!qword_1EDDB0ED0)
              {
                v28 = __UILogCategoryGetNode("UINavigationController_in_UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v28, (unint64_t *)&qword_1EDDB0ED0);
              }
              v29 = *(NSObject **)(v28 + 8);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v79 = (UINavigationController *)v60;
                v80 = 2112;
                v81 = v21;
                _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_DEFAULT, "Incorrect push in %@ UISplitViewController, %@", buf, 0x16u);
              }
              v30 = qword_1EDDB0ED8;
              if (!qword_1EDDB0ED8)
              {
                v30 = __UILogCategoryGetNode("UINavigationController_in_UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v30, (unint64_t *)&qword_1EDDB0ED8);
              }
              v31 = *(NSObject **)(v30 + 8);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v79 = v19;
                _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_DEFAULT, "Rejecting %@", buf, 0xCu);
              }
              objc_msgSend(v21, "_printHierarchy");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "componentsSeparatedByString:", CFSTR("\n"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              obj = v33;
              v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
              if (v34)
              {
                v35 = *(_QWORD *)v73;
                do
                {
                  for (i = 0; i != v34; ++i)
                  {
                    if (*(_QWORD *)v73 != v35)
                      objc_enumerationMutation(obj);
                    v37 = *(UINavigationController **)(*((_QWORD *)&v72 + 1) + 8 * i);
                    v38 = qword_1EDDB0EE0;
                    if (!qword_1EDDB0EE0)
                    {
                      v38 = __UILogCategoryGetNode("UINavigationController_in_UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                      atomic_store(v38, (unint64_t *)&qword_1EDDB0EE0);
                    }
                    v39 = *(NSObject **)(v38 + 8);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v79 = v37;
                      _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                    }
                  }
                  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
                }
                while (v34);
              }

              if (objc_msgSend(v64, "style"))
              {
                objc_msgSend(v64, "valueForKey:", CFSTR("_perColumnViewControllers"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "description");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "componentsSeparatedByString:", CFSTR("\n"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                v70 = 0u;
                v71 = 0u;
                v68 = 0u;
                v69 = 0u;
                v43 = v42;
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
                if (v44)
                {
                  v45 = *(_QWORD *)v69;
                  do
                  {
                    for (j = 0; j != v44; ++j)
                    {
                      if (*(_QWORD *)v69 != v45)
                        objc_enumerationMutation(v43);
                      v47 = *(UINavigationController **)(*((_QWORD *)&v68 + 1) + 8 * j);
                      v48 = qword_1EDDB0EE8;
                      if (!qword_1EDDB0EE8)
                      {
                        v48 = __UILogCategoryGetNode("UINavigationController_in_UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                        atomic_store(v48, (unint64_t *)&qword_1EDDB0EE8);
                      }
                      v49 = *(NSObject **)(v48 + 8);
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v79 = v47;
                        _os_log_impl(&dword_185066000, v49, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                      }
                    }
                    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
                  }
                  while (v44);
                }

              }
              if (os_variant_has_internal_diagnostics())
              {
                v53 = qword_1EDDB0EF8;
                if (!qword_1EDDB0EF8)
                {
                  v53 = __UILogCategoryGetNode("UINavigationController_in_UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v53, (unint64_t *)&qword_1EDDB0EF8);
                }
                v54 = *(id *)(v53 + 8);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v64, "valueForKey:", CFSTR("panelController"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "valueForKey:", CFSTR("_internalState"));
                  v56 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v79 = v56;
                  _os_log_impl(&dword_185066000, v54, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

                }
              }

              if (v61)
              {
                if (os_variant_has_internal_diagnostics())
                {
                  __UIFaultDebugAssertLog();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v59;
                    _os_log_fault_impl(&dword_185066000, v57, OS_LOG_TYPE_FAULT, "Ignoring push instead of throwing exception per UINavigationControllerRelaxRepeatedPushAssertionForSplitViewController default: %@", buf, 0xCu);
                  }

                }
                else
                {
                  v50 = qword_1EDDB0F08;
                  if (!qword_1EDDB0F08)
                  {
                    v50 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                    atomic_store(v50, (unint64_t *)&qword_1EDDB0F08);
                  }
                  v51 = *(NSObject **)(v50 + 8);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v59;
                    _os_log_impl(&dword_185066000, v51, OS_LOG_TYPE_ERROR, "Ignoring push instead of throwing exception per UINavigationControllerRelaxRepeatedPushAssertionForSplitViewController default: %@", buf, 0xCu);
                  }
                }

                v23 = 0;
                goto LABEL_85;
              }
              v17 = v59;
LABEL_97:
              objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
              v58 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v58);
            }
            v22 = v20;
            if (_UIIsPrivateMainBundle() && qword_1EDDB0F60 != -1)
              dispatch_once(&qword_1EDDB0F60, &__block_literal_global_1628);
            if (!byte_1EDDB0E55)
              goto LABEL_26;
            if (qword_1EDDB0F58 != -1)
              dispatch_once(&qword_1EDDB0F58, &__block_literal_global_1624);
            if (byte_1EDDB0E54)
            {
LABEL_26:
              v61 = 0;
              goto LABEL_39;
            }
            -[UINavigationController topViewController](self, "topViewController");
            v24 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
            if (v24 == v19)
            {
              v25 = objc_msgSend(v22, "_columnForViewController:", self) == 0;

              if (v25)
              {
                v61 = (unint64_t)(objc_msgSend(v22, "_columnForViewController:", v19) - 1) < 2;
                goto LABEL_38;
              }
            }
            else
            {

            }
            v61 = 0;
LABEL_38:
            v21 = v22;
            goto LABEL_39;
          }
        }
      }
      v23 = 1;
LABEL_85:

      goto LABEL_86;
    }
    NSLog(CFSTR("Split View Controllers cannot be pushed to a Navigation Controller %@."), self);
  }
  else
  {
    NSLog(CFSTR("Application tried to push a nil view controller on target %@."), self);
  }
  v23 = 0;
LABEL_86:

  return v23;
}

uint64_t __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
}

- (void)pushViewController:(id)a3 transition:(int)a4
{
  -[UINavigationController pushViewController:transition:forceImmediate:](self, "pushViewController:transition:forceImmediate:", a3, *(_QWORD *)&a4, 0);
}

- (id)_nthChildViewControllerFromTop:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;

  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", v5 + ~a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_findViewControllerToPopTo
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController disappearingViewController](self, "disappearingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == v4;

  -[UINavigationController _nthChildViewControllerFromTop:](self, "_nthChildViewControllerFromTop:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIViewController)popViewControllerAnimated:(BOOL)animated
{
  uint64_t v3;

  if (animated)
    v3 = 2;
  else
    v3 = 0;
  return (UIViewController *)-[UINavigationController _popViewControllerWithTransition:allowPoppingLast:](self, "_popViewControllerWithTransition:allowPoppingLast:", v3, 0);
}

- (void)_updateBottomBarHiddenStateFromOtherNavigationController:(id)a3
{
  if (a3)
    *(_QWORD *)&self->_navigationControllerFlags |= *((_QWORD *)a3 + 153) & 0x400;
}

- (BOOL)_isCurrentTransitionPreemptable
{
  void *v3;
  void *v4;
  char v5;

  -[UINavigationController _transitionController](self, "_transitionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDDCE3D0))
  {
    -[_UIViewControllerTransitionConductor transitionContext](self->_transitionConductor, "transitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_state") && (objc_msgSend(v4, "_transitionHasCompleted") & 1) == 0)
      v5 = objc_msgSend(v3, "shouldPreemptWithContext:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_allowsInteractivePopWhenNavigationBarHidden
{
  return ((unint64_t)*((unsigned __int8 *)&self->_navigationControllerFlags + 8) >> 3) & 1;
}

- (void)_setAllowsInteractivePopWhenNavigationBarHidden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)&self->_navigationControllerFlags + 8) = *((_BYTE *)&self->_navigationControllerFlags + 8) & 0xF7 | v3;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationController;
  if (-[UIViewController _hasPreferredInterfaceOrientationForPresentation](&v5, sel__hasPreferredInterfaceOrientationForPresentation))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    LODWORD(v3) = dyld_program_sdk_at_least();
    if ((_DWORD)v3)
      return (*(_QWORD *)&self->_navigationControllerFlags >> 29) & 1;
  }
  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  int64_t v5;
  objc_super v6;

  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x20000000) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "navigationControllerPreferredInterfaceOrientationForPresentation:", self);

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UINavigationController;
    return -[UIViewController preferredInterfaceOrientationForPresentation](&v6, sel_preferredInterfaceOrientationForPresentation);
  }
}

- (BOOL)_willPerformCustomNavigationTransitionForPop
{
  return -[_UIViewControllerTransitionConductor willPerformCustomTransition](self->_transitionConductor, "willPerformCustomTransition");
}

- (BOOL)_willPerformCustomNavigationTransitionForPush
{
  return -[_UIViewControllerTransitionConductor willPerformCustomTransition](self->_transitionConductor, "willPerformCustomTransition");
}

- (id)_interruptibleNavigationTransitionAnimator
{
  return -[_UIViewControllerTransitionConductor interruptibleNavigationTransitionAnimator](self->_transitionConductor, "interruptibleNavigationTransitionAnimator");
}

- (double)_customNavigationTransitionDuration
{
  double result;

  -[_UIViewControllerTransitionConductor customNavigationTransitionDuration](self->_transitionConductor, "customNavigationTransitionDuration");
  return result;
}

id __76__UINavigationController__popViewControllerWithTransition_allowPoppingLast___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") > 1 || *(_QWORD *)(a1 + 32) == 1 && *(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "subarrayWithRange:", 0, objc_msgSend(v3, "count") - 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)popViewControllerWithAnimationTransition:(int64_t)a3 duration:(double)a4 curve:(int64_t)a5
{
  int64_t v7;
  void *v8;

  v7 = (a5 << 16) | (a3 << 20);
  -[UINavigationController navigationTransitionView](self, "navigationTransitionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v8, v7, 0, 0, a4);

  return -[UINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 0);
}

- (id)popToViewControllerWithSnapbackIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = v8 - 2;
  if (v8 < 2)
    goto LABEL_7;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "canHandleSnapbackIdentifier:animated:", v6, v4) & 1) != 0)
      break;

    if (--v9 == -1)
      goto LABEL_7;
  }
  if (v10)
  {
    -[UINavigationController popToViewController:animated:](self, "popToViewController:animated:", v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

BOOL __72__UINavigationController__transitionConflictsWithNavigationTransitions___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (void)_setAllowsFreezeLayoutForOrientationChangeOnDismissal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)_allowsAutorotation
{
  unsigned int v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  v3 = -[UIViewController _allowsAutorotation](&v7, sel__allowsAutorotation);
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 &= objc_msgSend(v5, "_allowsAutorotation");

  }
  return v3;
}

- (BOOL)_doesTopViewControllerSupportInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;

  -[UINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[UINavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isSupportedInterfaceOrientation:", a3);

  return v7;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if (objc_msgSend((id)objc_opt_class(), "_doesOverrideLegacyShouldAutorotateMethod"))
    return -[UINavigationController shouldAutorotateToInterfaceOrientation:](self, "shouldAutorotateToInterfaceOrientation:", a3);
  else
    return -[UINavigationController _doesTopViewControllerSupportInterfaceOrientation:](self, "_doesTopViewControllerSupportInterfaceOrientation:", a3);
}

- (id)rotatingHeaderView
{
  void *v3;
  void *v4;

  if (-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rotatingHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)rotatingFooterView
{
  void *v3;
  void *v4;

  if (-[UINavigationController isToolbarHidden](self, "isToolbarHidden"))
  {
    -[UINavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rotatingFooterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UINavigationController toolbar](self, "toolbar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_shouldUseOnePartRotation
{
  void *v3;
  void *v4;
  char v5;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldUseOnePartRotation");

  return v5;
}

- (void)_getRotationContentSettings:(id *)a3
{
  id v4;

  -[UINavigationController topViewController](self, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_getRotationContentSettings:", a3);

}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  -[UINavigationController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willRotateToInterfaceOrientation:duration:", a3, a4);

}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v7;

  -[UINavigationController topViewController](self, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _updateBarsForCurrentInterfaceOrientation](self, "_updateBarsForCurrentInterfaceOrientation");
  objc_msgSend(v7, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;
  CGAffineTransform v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)UINavigationController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7)
  {
    objc_msgSend(v7, "targetTransform");
    if (!CGAffineTransformIsIdentity(&v10))
    {
      -[UINavigationController _stopTransitionsImmediately](self, "_stopTransitionsImmediately");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __77__UINavigationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v8[3] = &unk_1E16B2150;
      v8[4] = self;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);
    }
  }

}

uint64_t __77__UINavigationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBarsForCurrentInterfaceOrientation");
}

void __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_navigationBarForNestedNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "_navigationBarForNestedNavigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize
{
  return 0;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  objc_super v35;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "_existingView"), (v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v12 = (void *)v11,
        -[UINavigationController topViewController](self, "topViewController"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v10 == v13))
  {
    -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20
      && objc_msgSend(v20, "_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:", self))
    {
      v35.receiver = self;
      v35.super_class = (Class)UINavigationController;
      -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v35, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
      v15 = v22;
      v17 = v23;
    }
    else
    {
      -[UIViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v26 = v25;
      v28 = v27;

      objc_msgSend(v10, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      v31 = v30;
      v33 = v32;

      v15 = width - v26 + v31;
      v17 = height - v28 + v33;
    }

  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)UINavigationController;
    -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v34, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    v15 = v14;
    v17 = v16;
  }

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  UINavigationController *v7;
  UINavigationController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  if (!-[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers")
    || !-[UINavigationController _hasNestedNavigationController](self, "_hasNestedNavigationController"))
  {
    goto LABEL_18;
  }
  -[UIViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (objc_msgSend(v5, "style"))
  {
    if (objc_msgSend(v5, "style") && !objc_msgSend(v5, "_columnForViewController:", self))
      goto LABEL_15;
    goto LABEL_17;
  }
  objc_msgSend(v5, "childViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)UINavigationController;
    -[UIViewController _childViewControllersToSendViewWillTransitionToSize](&v15, sel__childViewControllersToSendViewWillTransitionToSize);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v5, "_childViewControllersToSendViewWillTransitionToSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsInArray:", v12);

    return v11;
  }
  v8 = v7;
  if (objc_msgSend(v5, "style"))
  {
    v9 = objc_msgSend(v5, "_columnForViewController:", self);

    if (!v9)
      goto LABEL_15;
  }
  else
  {

  }
LABEL_17:

LABEL_18:
  v14.receiver = self;
  v14.super_class = (Class)UINavigationController;
  -[UIViewController _childViewControllersToSendViewWillTransitionToSize](&v14, sel__childViewControllersToSendViewWillTransitionToSize);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  -[UINavigationController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willAnimateFirstHalfOfRotationToInterfaceOrientation:duration:", a3, a4);

}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3
{
  id v5;

  if (!-[UINavigationController _shouldUseOnePartRotation](self, "_shouldUseOnePartRotation"))
    -[UINavigationController _updateBarsForCurrentInterfaceOrientation](self, "_updateBarsForCurrentInterfaceOrientation");
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didAnimateFirstHalfOfRotationToInterfaceOrientation:", a3);

}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  -[UINavigationController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willAnimateSecondHalfOfRotationFromInterfaceOrientation:duration:", a3, a4);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4;

  -[UINavigationController topViewController](self, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didRotateFromInterfaceOrientation:", a3);

}

- (id)rotatingSnapshotViewForWindow:(id)a3
{
  void *v3;
  void *v4;

  -[UINavigationController topViewController](self, "topViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setPreferredNavigationBarPosition:(int64_t)a3
{
  void *v6;
  id v7;

  if (a3 == 4 || a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 9183, CFSTR("UINavigationBar does not support UIBarPositionBottom or UIBarPositionBottomAttached"));

  }
  if (self->__preferredNavigationBarPosition != a3)
  {
    self->__preferredNavigationBarPosition = a3;
    if (-[UINavigationController _isNavigationBarVisible](self, "_isNavigationBarVisible"))
    {
      -[UIViewController _existingView](self, "_existingView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLayout");

    }
  }
}

- (id)_findViewControllerToPopToForNavigationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v7 = 0;
  if (v6)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        objc_msgSend(v11, "navigationItem");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          v7 = v10;
          v6 = v7;
          goto LABEL_11;
        }
        v7 = v11;

        v9 = (char *)v9 + 1;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_updateNavigationBar:(id)a3 fromItems:(id)a4 toItems:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a6;
  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v10, "count");
  if (v12 + 1 == objc_msgSend(v11, "count"))
  {
    v13 = v10;
    v14 = v11;
    if (objc_msgSend(v13, "count") < (unint64_t)v12 || objc_msgSend(v14, "count") < (unint64_t)v12)
      goto LABEL_6;
    if (v12 >= 1)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 != v16)
      {
LABEL_6:

LABEL_7:
        goto LABEL_8;
      }
      v17 = 1;
      while (v12 != v17)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        ++v17;
        if (v18 != v19)
        {

          if (v17 - 1 < v12)
            goto LABEL_8;
          goto LABEL_15;
        }
      }
    }

LABEL_15:
    objc_msgSend(v14, "lastObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UINavigationController navigationBar:shouldPushItem:](self, "navigationBar:shouldPushItem:", v20, v13);
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v20, "setItems:animated:", v11, v6);

}

- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4
{
  return 1;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  return 1;
}

- (BOOL)_isViewControllerInRootPresentationHierarchy:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v4 = a3;
  -[UINavigationController _window](self, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v4, "presentingViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

    if (!v11 || v6 == v11)
    {
      v15 = v11;
    }
    else
    {
      do
      {
        objc_msgSend(v11, "parentViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v11, "presentingViewController");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        if (!v15)
          break;
        v11 = v15;
      }
      while (v6 != v15);
    }
    if (v6 == v15)
    {
      objc_msgSend(v6, "presentedViewController");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v16 == v4;

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (int64_t)navigationBarNSToolbarSection:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;

  -[UINavigationController _window](self, "_window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UINavigationController _isViewControllerInRootPresentationHierarchy:](self, "_isViewControllerInRootPresentationHierarchy:", self))
  {
    v6 = 3;
  }
  else
  {
    -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UINavigationController _isViewControllerInRootPresentationHierarchy:](self, "_isViewControllerInRootPresentationHierarchy:", v7)&& (v8 = objc_msgSend(v7, "_columnForViewController:", self), v8 < 4))
    {
      v6 = qword_18667A260[v8];
    }
    else
    {
      -[UIViewController _tabBarControllerEnforcingClass:](self, "_tabBarControllerEnforcingClass:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UINavigationController _isViewControllerInRootPresentationHierarchy:](self, "_isViewControllerInRootPresentationHierarchy:", v9))
      {
        v6 = 3;
      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (void)navigationBarDidResizeForPrompt:(id)a3
{
  id v4;

  -[UINavigationController _layoutTopViewController](self, "_layoutTopViewController", a3);
  -[UINavigationController topViewController](self, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v4);

}

- (id)_navigationBarWindowForInterfaceOrientation:(id)a3
{
  return -[UINavigationController _interfaceOrientationWindowForBar:matchingBar:](self, "_interfaceOrientationWindowForBar:matchingBar:", a3, self->_navigationBar);
}

- (void)_popNavigationBar:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  UINavigationController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[UINavigationController _isTransitioning](self, "_isTransitioning"))
  {
    if (!-[UINavigationController navigationBar:shouldPopItem:](self, "navigationBar:shouldPopItem:", v7, v8))
      goto LABEL_12;
    goto LABEL_11;
  }
  v9 = -[UINavigationController needsDeferredTransition](self, "needsDeferredTransition");
  v10 = -[UINavigationController navigationBar:shouldPopItem:](self, "navigationBar:shouldPopItem:", v7, v8);
  v11 = v10;
  if (!v9
    && v10
    && (-[UINavigationController _isTransitioning](self, "_isTransitioning")
     || -[UINavigationController needsDeferredTransition](self, "needsDeferredTransition")))
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 9507, CFSTR("Override of -navigationBar:shouldPopItem: returned YES after manually popping a view controller (navigationController=%@)"), self);

    }
    else
    {
      v14 = _popNavigationBar_item____s_category;
      if (!_popNavigationBar_item____s_category)
      {
        v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&_popNavigationBar_item____s_category);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = self;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Override of -navigationBar:shouldPopItem: returned YES after manually popping a view controller (navigationController=%@)", buf, 0xCu);
      }
    }
  }
  else if (v11)
  {
LABEL_11:
    v13 = -[UINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
  }
LABEL_12:

}

- (BOOL)_isPushingOrPoppingUsingLayoutToLayoutNavigationTransition
{
  void *v3;
  BOOL v4;

  if (!-[UINavigationController _isPushingOrPopping](self, "_isPushingOrPopping"))
    return 0;
  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "useLayoutToLayoutNavigationTransitions"))
    v4 = -[UINavigationController _isPerformingLayoutToLayoutTransition](self, "_isPerformingLayoutToLayoutTransition");
  else
    v4 = 0;

  return v4;
}

- (void)_updateBottomBarsForNavigationTransition
{
  _DWORD *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  UINavigationController *v21;
  id v22;
  uint8_t buf[4];
  UINavigationController *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
  v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = ((v3[92] >> 1) & 3u) - 1 < 2;
  else
    v5 = 0;
  objc_msgSend(v3, "_existingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __66__UINavigationController__updateBottomBarsForNavigationTransition__block_invoke;
    v20 = &unk_1E16B1B50;
    v21 = self;
    v22 = v4;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v17);

  }
  else if (v5)
  {
    v8 = _updateBottomBarsForNavigationTransition___s_category;
    if (!_updateBottomBarsForNavigationTransition___s_category)
    {
      v8 = __UILogCategoryGetNode("UINavigationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_updateBottomBarsForNavigationTransition___s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v4;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Top view controller's view unexpectedly not in window for navigation transition. Skipping layout. nav = %{public}@, topVC = %{public}@", buf, 0x16u);
    }
  }
  -[UIViewController _tabBarControllerEnforcingClass:](self, "_tabBarControllerEnforcingClass:", 1, v17, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    if (v5)
      goto LABEL_15;
LABEL_17:
    -[UINavigationController _setSuspendToolbarBackgroundUpdating:](self, "_setSuspendToolbarBackgroundUpdating:", 0);
    goto LABEL_19;
  }
  v12 = objc_msgSend(v10, "_isBarEffectivelyHidden");
  if (!v5)
  {
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v11, "_setSuspendBarBackgroundUpdating:", 0);
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if ((v12 & 1) != 0)
  {
LABEL_15:
    objc_msgSend(v4, "_contentOrObservableScrollViewForEdge:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _existingActiveVisibleToolbar](self, "_existingActiveVisibleToolbar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _updateBackgroundTransitionProgressForScrollView:toolbar:isNavigationTransitionUpdate:](self, "_updateBackgroundTransitionProgressForScrollView:toolbar:isNavigationTransitionUpdate:", v15, v16, 1);

    goto LABEL_19;
  }
  objc_msgSend(v4, "_contentOrObservableScrollViewForEdge:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tabBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:", v13, v14, 1);

LABEL_19:
}

void __66__UINavigationController__updateBottomBarsForNavigationTransition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(*(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "_isAutomaticContentOffsetAdjustmentEnabled");
  v3 = objc_msgSend(v5, "_shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange");
  objc_msgSend(v5, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  objc_msgSend(v5, "_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_updateContentOverlayInsetsFromParentIfNecessary");
  objc_msgSend(v5, "_setAutomaticContentOffsetAdjustmentEnabled:", v2);
  objc_msgSend(v5, "_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:", v3);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)_startCoordinatedBottomBarUpdateForTransition:(int)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD aBlock[5];

  if (!-[UINavigationController _isNestedNavigationController](self, "_isNestedNavigationController"))
  {
    if (a3 == 2)
      +[_UINavigationBarTransitionAssistant popTransitionAssistantForNavigationBar:delegate:crossfade:](_UINavigationBarTransitionAssistant, "popTransitionAssistantForNavigationBar:delegate:crossfade:", self->_navigationBar, self, 0);
    else
      +[_UINavigationBarTransitionAssistant pushTransitionAssistantForNavigationBar:delegate:crossfade:](_UINavigationBarTransitionAssistant, "pushTransitionAssistantForNavigationBar:delegate:crossfade:", self->_navigationBar, self, a3 != 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    if ((objc_msgSend(v5, "shouldAnimateAlongside") & 1) != 0)
    {
      objc_msgSend(v5, "transitionCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke_2;
      v9[3] = &unk_1E16B1CC8;
      v10 = v7;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v9, 0);

    }
    else
    {
      objc_msgSend(v5, "duration");
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7);
    }

  }
}

uint64_t __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBottomBarsForNavigationTransition");
}

uint64_t __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_navigationBarPrepareToAnimateTransition:(id)a3
{
  id v3;

  -[UINavigationController topViewController](self, "topViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_prepareForNavigationTransition:", 1);

}

- (void)_navigationBarWillBeginCoordinatedTransitionAnimations:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  -[UINavigationController _initializeNavigationDeferredTransitionContextIfNecessary](self, "_initializeNavigationDeferredTransitionContextIfNecessary", a3);
  if (!-[UINavigationController _isPushingOrPoppingUsingLayoutToLayoutNavigationTransition](self, "_isPushingOrPoppingUsingLayoutToLayoutNavigationTransition"))
  {
    -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[UINavigationController _nestedTopViewController](self, "_nestedTopViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "_safeAreaInsetsFrozen");
    if (v8 != v6)
      objc_msgSend(v6, "_setSafeAreaInsetsFrozen:", 1);
    -[UINavigationController _performCoordinatedUpdateTopFramesTransitionAnimation](self, "_performCoordinatedUpdateTopFramesTransitionAnimation");
    if (-[UINavigationController _hasPotentiallyChromelessBottomBar](self, "_hasPotentiallyChromelessBottomBar"))
      -[UINavigationController _updateBottomBarsForNavigationTransition](self, "_updateBottomBarsForNavigationTransition");
    objc_msgSend(v6, "_setSafeAreaInsetsFrozen:updateForUnfreeze:", v7, 0);

  }
}

- (void)_navigationBarWillRunAutomaticDeferredShowsScopeBar:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__UINavigationController__navigationBarWillRunAutomaticDeferredShowsScopeBar___block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v3, 0.25);
}

uint64_t __78__UINavigationController__navigationBarWillRunAutomaticDeferredShowsScopeBar___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performCoordinatedUpdateTopFramesTransitionAnimation");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "layoutIfNeeded");
}

- (void)_navigationBarDidUpdateVisibility:(id)a3
{
  -[UINavigationController _layoutTopViewControllerLookForNested:](self, "_layoutTopViewControllerLookForNested:", 1);
}

- (void)_navigationBarWillChangeHeightForManualShowOrHideOfSearchScopeBar:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;

  -[UIViewController _existingView](self, "_existingView", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3 && (v3[13] & 0x8000000000000000) == 0)
  {
    v4 = v3;
    objc_msgSend(v3, "setNeedsLayout");
    v3 = v4;
  }

}

- (CGRect)_incomingNavigationBarFrame
{
  void *v3;
  void *v4;
  UINavigationController *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  CGRect result;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v5, v3, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UINavigationController _isPushing](v5, "_isPushing"))
  {
    v7 = 2;
  }
  else if (-[UINavigationController _isPopping](v5, "_isPopping"))
  {
    v7 = 3;
  }
  else
  {
    v7 = v6 != 0;
  }

  v12 = 0u;
  v13 = 0u;
  -[UINavigationController _calculateTopViewFramesForLayoutWithViewController:contentScrollView:navBarFrame:topPaletteFrame:topLayoutType:](v5, "_calculateTopViewFramesForLayoutWithViewController:contentScrollView:navBarFrame:topPaletteFrame:topLayoutType:", v3, v4, &v12, 0, v7);

  v9 = *((double *)&v12 + 1);
  v8 = *(double *)&v12;
  v11 = *((double *)&v13 + 1);
  v10 = *(double *)&v13;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_performCoordinatedUpdateTopFramesTransitionAnimation
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];

  -[UINavigationController topViewController](self, "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_isNestedNavigationController"))
  {
    objc_msgSend(v5, "topViewController");
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v3;
  }
  else
  {
    v4 = v5;
  }
  -[UINavigationController _updateTopViewFramesForViewController:](self, "_updateTopViewFramesForViewController:", v4, v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__UINavigationController__performCoordinatedUpdateTopFramesTransitionAnimation__block_invoke;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);

}

uint64_t __79__UINavigationController__performCoordinatedUpdateTopFramesTransitionAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewControllerLookForNested:", 1);
}

- (void)setHidesBarsWhenKeyboardAppears:(BOOL)hidesBarsWhenKeyboardAppears
{
  if (self->_hidesBarsWhenKeyboardAppears != hidesBarsWhenKeyboardAppears)
  {
    self->_hidesBarsWhenKeyboardAppears = hidesBarsWhenKeyboardAppears;
    -[UINavigationController _configureKeyboardBarHiding](self, "_configureKeyboardBarHiding");
  }
}

- (void)_setKeyboardNotificationToken:(id)a3
{
  id v5;
  id *p_keyboardAppearedNotificationToken;
  void *v7;
  id v8;

  v5 = a3;
  p_keyboardAppearedNotificationToken = &self->__keyboardAppearedNotificationToken;
  if (*p_keyboardAppearedNotificationToken != v5)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", *p_keyboardAppearedNotificationToken);

    objc_storeStrong(p_keyboardAppearedNotificationToken, a3);
    v5 = v8;
  }

}

- (void)_hideForKeyboardAppearance
{
  void *v3;
  void *v4;

  if (!-[UINavigationController _isTransitioning](self, "_isTransitioning"))
  {
    -[UIViewController _existingView](self, "_existingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[UINavigationController _setBarsHidden:allowAnimation:](self, "_setBarsHidden:allowAnimation:", 1, 1);
  }
}

void __53__UINavigationController__configureKeyboardBarHiding__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideForKeyboardAppearance");

}

- (void)setHidesBarsOnSwipe:(BOOL)hidesBarsOnSwipe
{
  if (self->_hidesBarsOnSwipe != hidesBarsOnSwipe)
  {
    self->_hidesBarsOnSwipe = hidesBarsOnSwipe;
    if (hidesBarsOnSwipe)
    {
      -[UINavigationController _makeBarSwipeGestureIfNecessary](self, "_makeBarSwipeGestureIfNecessary");
      -[UINavigationController _makeBarHideGestureIfNecessary](self, "_makeBarHideGestureIfNecessary");
    }
    -[UINavigationController _configureBarTapGesture](self, "_configureBarTapGesture");
    -[UINavigationController _configureBarSwipeGesture](self, "_configureBarSwipeGesture");
  }
}

- (void)_makeBarSwipeGestureIfNecessary
{
  _UIBarPanGestureRecognizer *v3;
  _UIBarPanGestureRecognizer *barSwipeHideGesture;

  if (!self->__barSwipeHideGesture)
  {
    v3 = -[_UIBarPanGestureRecognizer initWithTarget:action:]([_UIBarPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__gestureRecognizedInteractiveHide_);
    barSwipeHideGesture = self->__barSwipeHideGesture;
    self->__barSwipeHideGesture = v3;

    -[_UIBarPanGestureRecognizer _setDelegate:](self->__barSwipeHideGesture, "_setDelegate:", self);
  }
}

- (UIPanGestureRecognizer)barHideOnSwipeGestureRecognizer
{
  -[UINavigationController _makeBarSwipeGestureIfNecessary](self, "_makeBarSwipeGestureIfNecessary");
  return (UIPanGestureRecognizer *)self->__barSwipeHideGesture;
}

- (void)_gestureRecognizedInteractiveHide:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _UIAnimationCoordinator *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
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
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  _BOOL4 v73;
  BOOL v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[5];
  BOOL v83;

  v5 = a3;
  v6 = objc_msgSend(v5, "barAction");
  if (v6)
  {
    v7 = v6;
    -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "state");
    -[UINavigationController _barInteractiveAnimationCoordinator](self, "_barInteractiveAnimationCoordinator");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (_UIAnimationCoordinator *)v10;
    if ((unint64_t)(v9 - 1) <= 1)
    {
      -[UIViewController _existingView](self, "_existingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "velocityInView:", v12);
      v14 = v13;
      if (v11)
      {
        -[_UIAnimationCoordinator stash](v11, "stash");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NavigationTransitionFinishedEarly"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "BOOLValue"))
        {

        }
        else
        {
          v81 = v8;
          v42 = v12;
          -[_UIAnimationCoordinator stash](v11, "stash");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("NavigationBarAnimateOnEnd"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "BOOLValue");

          if ((v45 & 1) != 0)
          {
            v12 = v42;
          }
          else
          {
            -[_UIAnimationCoordinator stash](v11, "stash");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("NavigationBarCriticalVelocity"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "doubleValue");
            v66 = v65;

            v12 = v42;
            if ((v7 != 1 || v14 >= v66) && (v7 != 2 || v14 <= v66))
            {
              v73 = v14 < -v66 && v7 == 2;
              v74 = v14 > -v66 && v7 == 1;
              v8 = v81;
              if (v74 || v73)
              {
                -[_UIAnimationCoordinator stash](v11, "stash");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NavigationTransitionFinishedEarly"));

                -[_UIAnimationCoordinator cancelInteractiveAnimation](v11, "cancelInteractiveAnimation");
                -[_UIAnimationCoordinator stash](v11, "stash");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("NavigationBarStartingMode"));
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                -[UINavigationController _setBarsHidden:allowAnimation:](self, "_setBarsHidden:allowAnimation:", objc_msgSend(v78, "BOOLValue"), 0);

              }
              else
              {
                -[UINavigationController _barInteractiveAnimationCoordinator](self, "_barInteractiveAnimationCoordinator");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                _gestureProgress((uint64_t)v12, v5, v11);
                objc_msgSend(v75, "updateInteractiveProgress:");

              }
              goto LABEL_48;
            }
            -[_UIAnimationCoordinator stash](v11, "stash");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NavigationTransitionFinishedEarly"));

            -[_UIAnimationCoordinator finishInteractiveAnimation](v11, "finishInteractiveAnimation");
          }
          v8 = v81;
        }
LABEL_48:

        goto LABEL_49;
      }
      v32 = -[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden");
      v11 = objc_alloc_init(_UIAnimationCoordinator);
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __60__UINavigationController__gestureRecognizedInteractiveHide___block_invoke;
      v82[3] = &unk_1E16C0970;
      v82[4] = self;
      v83 = v32;
      -[_UIAnimationCoordinator setAnimator:](v11, "setAnimator:", v82);
      objc_msgSend(v8, "_existingView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAnimationCoordinator setContainerView:](v11, "setContainerView:", v33);

      objc_msgSend(v8, "topViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAnimationCoordinator setViewController:](v11, "setViewController:", v34);

      objc_msgSend(v8, "topViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frame");
      -[_UIAnimationCoordinator setStartFrame:](v11, "setStartFrame:");

      objc_msgSend(v8, "topViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "frame");
      -[_UIAnimationCoordinator setEndFrame:](v11, "setEndFrame:");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAnimationCoordinator stash](v11, "stash");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("NavigationBarStartingMode"));

      if (v7 == 2 && v32)
      {
        -[_UIAnimationCoordinator stash](v11, "stash");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NavigationBarAnimateOnEnd"));
      }
      else
      {
        v50 = v7 != 1 || v32;
        if ((v50 & 1) != 0)
          goto LABEL_41;
        v51 = fabs(v14);
        if (v51 >= 10.0)
          v52 = v51;
        else
          v52 = 10.0;
        objc_opt_self();
        _durationOfSpringAnimation(1.0, 900.0, 50.0, v52);
        -[_UIAnimationCoordinator setDuration:](v11, "setDuration:");
        objc_msgSend(v8, "_existingNavigationBar");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "frame");
        v54 = v53;
        -[_UIAnimationCoordinator animateInteractively](v11, "animateInteractively");
        objc_msgSend(v41, "frame");
        v56 = v55 - v54;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIAnimationCoordinator stash](v11, "stash");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v57, CFSTR("NavigationBarTravelDistance"));

        v59 = (void *)MEMORY[0x1E0CB37E8];
        -[_UIAnimationCoordinator duration](v11, "duration");
        objc_msgSend(v59, "numberWithDouble:", v56 / v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIAnimationCoordinator stash](v11, "stash");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("NavigationBarCriticalVelocity"));

      }
LABEL_41:
      -[UINavigationController _setInteractiveAnimationCoordinator:](self, "_setInteractiveAnimationCoordinator:", v11);
      goto LABEL_48;
    }
    if (v9 == 3)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 9916, CFSTR("Trying to complete an interactive gesture but the animation coordinator is nil! (gesture=%@)"), v5);

      }
      -[_UIAnimationCoordinator stash](v11, "stash");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("NavigationTransitionFinishedEarly"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      if ((v19 & 1) != 0)
        goto LABEL_31;
      objc_msgSend(v8, "_existingView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _gestureProgress((uint64_t)v20, v5, v11);
      v22 = v21;
      objc_msgSend(v5, "velocityInView:", v20);
      v24 = v23;
      -[_UIAnimationCoordinator stash](v11, "stash");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("NavigationBarAnimateOnEnd"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "BOOLValue");

      if (v27)
      {
        if (v24 > 300.0)
        {
          v28 = fabs(v24);
          if (v28 >= 10.0)
            v29 = v28;
          else
            v29 = 10.0;
          objc_opt_self();
          _durationOfSpringAnimation(1.0, 900.0, 50.0, v29);
          -[_UIAnimationCoordinator setDuration:](v11, "setDuration:");
          -[_UIAnimationCoordinator animate](v11, "animate");
        }
        goto LABEL_30;
      }
      -[_UIAnimationCoordinator stash](v11, "stash");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("NavigationBarCriticalVelocity"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "doubleValue");
      v71 = v70;

      if (v7 == 1)
      {
        if (v22 >= 0.25 || v24 <= v71)
        {
LABEL_58:
          -[_UIAnimationCoordinator finishInteractiveAnimation](v11, "finishInteractiveAnimation");
          goto LABEL_30;
        }
      }
      else if (v22 >= 0.5 || v24 >= v71)
      {
        goto LABEL_58;
      }
      -[_UIAnimationCoordinator cancelInteractiveAnimation](v11, "cancelInteractiveAnimation");
      -[_UIAnimationCoordinator stash](v11, "stash");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("NavigationBarStartingMode"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _setBarsHidden:allowAnimation:](self, "_setBarsHidden:allowAnimation:", objc_msgSend(v72, "BOOLValue"), 0);

    }
    else
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 9947, CFSTR("Trying to complete an interactive gesture but the animation coordinator is nil! (gesture=%@)"), v5);

      }
      -[_UIAnimationCoordinator stash](v11, "stash");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("NavigationTransitionFinishedEarly"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "BOOLValue"))
      {

      }
      else
      {
        -[_UIAnimationCoordinator stash](v11, "stash");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("NavigationBarAnimateOnEnd"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "BOOLValue");

        if ((v48 & 1) == 0)
          -[_UIAnimationCoordinator cancelInteractiveAnimation](v11, "cancelInteractiveAnimation");
      }
      -[_UIAnimationCoordinator stash](v11, "stash");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NavigationBarStartingMode"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _setBarsHidden:allowAnimation:](self, "_setBarsHidden:allowAnimation:", objc_msgSend(v49, "BOOLValue"), 0);
    }

LABEL_30:
LABEL_31:
    -[UINavigationController _setInteractiveAnimationCoordinator:](self, "_setInteractiveAnimationCoordinator:", 0);
LABEL_49:

    goto LABEL_50;
  }
  -[UINavigationController _setInteractiveAnimationCoordinator:](self, "_setInteractiveAnimationCoordinator:", 0);
LABEL_50:

}

uint64_t __60__UINavigationController__gestureRecognizedInteractiveHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBarsHidden:allowAnimation:", *(_BYTE *)(a1 + 40) == 0, 1);
}

- (void)setHidesBarsWhenVerticallyCompact:(BOOL)hidesBarsWhenVerticallyCompact
{
  if (self->_hidesBarsWhenVerticallyCompact != hidesBarsWhenVerticallyCompact)
  {
    self->_hidesBarsWhenVerticallyCompact = hidesBarsWhenVerticallyCompact;
    if (hidesBarsWhenVerticallyCompact)
      -[UINavigationController _makeBarHideGestureIfNecessary](self, "_makeBarHideGestureIfNecessary");
    -[UINavigationController _configureBarTapGesture](self, "_configureBarTapGesture");
  }
}

- (void)setHidesBarsOnTap:(BOOL)hidesBarsOnTap
{
  if (self->_hidesBarsOnTap != hidesBarsOnTap)
  {
    self->_hidesBarsOnTap = hidesBarsOnTap;
    if (hidesBarsOnTap)
      -[UINavigationController _makeBarHideGestureIfNecessary](self, "_makeBarHideGestureIfNecessary");
    -[UINavigationController _configureBarTapGesture](self, "_configureBarTapGesture");
  }
}

- (void)_makeBarHideGestureIfNecessary
{
  _UIBarTapGestureRecognizer *v3;
  _UIBarTapGestureRecognizer *barTapHideGesture;

  if (!self->__barTapHideGesture)
  {
    v3 = -[_UIBarTapGestureRecognizer initWithTarget:action:]([_UIBarTapGestureRecognizer alloc], "initWithTarget:action:", self, sel__gestureRecognizedToggleVisibility_);
    barTapHideGesture = self->__barTapHideGesture;
    self->__barTapHideGesture = v3;

    -[_UIBarTapGestureRecognizer _setDelegate:](self->__barTapHideGesture, "_setDelegate:", self);
  }
}

- (UITapGestureRecognizer)barHideOnTapGestureRecognizer
{
  -[UINavigationController _makeBarHideGestureIfNecessary](self, "_makeBarHideGestureIfNecessary");
  return (UITapGestureRecognizer *)self->__barTapHideGesture;
}

- (id)_existingToolbarWithItems
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[UINavigationController _existingToolbar](self, "_existingToolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {

    v2 = 0;
  }
  return v2;
}

- (BOOL)_useCrossFadeForGestureHiding
{
  void *v3;
  _BOOL4 v4;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UINavigationController _shouldHideBarsForTraits:](self, "_shouldHideBarsForTraits:", v3);

  return v4
      && -[UIViewController preferredStatusBarUpdateAnimation](self, "preferredStatusBarUpdateAnimation") == UIStatusBarAnimationFade;
}

- (void)_gestureRecognizedToggleVisibility:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  UINavigationController *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;

  v5 = objc_msgSend(a3, "tapCategory");
  v6 = v5;
  if (v5 > 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationController.m"), 10075, CFSTR("Unknown tap gesture category %li"), v6);

    return;
  }
  if (((1 << v5) & 0x15) == 0)
  {
    if (((1 << v5) & 0x28) == 0)
    {
      if (self->_hidesBarsOnTap)
      {
        -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = -[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden");
        }
        else
        {
          -[UINavigationController _existingToolbarWithItems](self, "_existingToolbarWithItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            return;
          v10 = -[UINavigationController isToolbarHidden](self, "isToolbarHidden");
        }
        v8 = !v10;
        v7 = self;
LABEL_6:
        -[UINavigationController _setBarsHidden:](v7, "_setBarsHidden:", v8);
        return;
      }
      if (!self->_hidesBarsWhenVerticallyCompact)
        return;
    }
    v7 = self;
    v8 = 0;
    goto LABEL_6;
  }
}

- (void)_setBarsHidden:(BOOL)a3
{
  BOOL v5;
  _UIAnimationCoordinator *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  UINavigationController *v19;
  BOOL v20;
  BOOL v21;
  _QWORD v22[5];

  v5 = -[UINavigationController _useCrossFadeForGestureHiding](self, "_useCrossFadeForGestureHiding");
  v6 = objc_alloc_init(_UIAnimationCoordinator);
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  _durationOfSpringAnimation(1.0, 900.0, 50.0, 10.0);
  -[_UIAnimationCoordinator setDuration:](v6, "setDuration:");
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __41__UINavigationController__setBarsHidden___block_invoke;
  v22[3] = &unk_1E16C0998;
  v22[4] = self;
  -[_UIAnimationCoordinator setPreperation:](v6, "setPreperation:", v22);
  v14 = v8;
  v15 = 3221225472;
  v16 = __41__UINavigationController__setBarsHidden___block_invoke_2;
  v17 = &unk_1E16C09C0;
  v20 = a3;
  v21 = v5;
  v18 = v7;
  v19 = self;
  v9 = v7;
  -[_UIAnimationCoordinator setAnimator:](v6, "setAnimator:", &v14);
  objc_msgSend(v9, "_existingView", v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAnimationCoordinator setContainerView:](v6, "setContainerView:", v10);

  objc_msgSend(v9, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAnimationCoordinator setViewController:](v6, "setViewController:", v11);

  objc_msgSend(v9, "topViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  -[_UIAnimationCoordinator setStartFrame:](v6, "setStartFrame:");

  -[_UIAnimationCoordinator animate](v6, "animate");
}

void __41__UINavigationController__setBarsHidden___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_frameForViewController:", v4);
  objc_msgSend(v19, "setEndFrame:");

  objc_msgSend(v19, "startFrame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v19, "endFrame");
  if (v6 != v10 || v8 != v9)
  {
    objc_msgSend(v19, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "endFrame");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v19, "transitionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_transitionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewWillTransitionToSize:withTransitionCoordinator:", v18, v14, v16);

  }
}

void __41__UINavigationController__setBarsHidden___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_existingNavigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 48);
    if (*(_BYTE *)(a1 + 49))
      v6 = 15;
    else
      v6 = 1;
    objc_msgSend(v16, "duration");
    objc_msgSend(v4, "_setNavigationBarHidden:edge:duration:", v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "_existingToolbarWithItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(unsigned __int8 *)(a1 + 48);
    if (*(_BYTE *)(a1 + 49))
      v10 = 15;
    else
      v10 = 4;
    objc_msgSend(v16, "duration");
    objc_msgSend(v8, "_setToolbarHidden:edge:duration:", v9, v10);
  }
  objc_msgSend(*(id *)(a1 + 40), "_outermostNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

  objc_msgSend(v11, "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

- (void)_setBarsHidden:(BOOL)a3 allowAnimation:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v6 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled") & a4;
  -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", v4, v6);
  -[UINavigationController _existingToolbarWithItems](self, "_existingToolbarWithItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[UINavigationController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", v4, v6);
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  objc_msgSend(v13, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

}

- (id)defaultPNGName
{
  void *v2;
  void *v3;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPNGName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setNavigationSoundsEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_navigationControllerFlags = *(_QWORD *)&self->_navigationControllerFlags & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)_navigationSoundsEnabled
{
  return (*(_QWORD *)&self->_navigationControllerFlags >> 52) & 1;
}

- (id)_uip_tabElement
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UINavigationController;
  -[UIViewController _uip_tabElement](&v6, sel__uip_tabElement);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UINavigationController bottomViewController](self, "bottomViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_uip_tabElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)tab
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[UINavigationController _managedTabGroup](self, "_managedTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UINavigationController;
    -[UIViewController tab](&v8, "tab");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)_shouldOverlayTabBar
{
  return !-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden");
}

- (id)_hostingNavigationBar
{
  UINavigationBar *navigationBar;

  if (-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
    navigationBar = 0;
  else
    navigationBar = self->_navigationBar;
  return navigationBar;
}

- (void)setContentSizeForViewInPopover:(CGSize)a3
{
  objc_super v4;

  -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:", a3.width, a3.height);
  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  -[UIViewController setContentSizeForViewInPopover:](&v4, sel_setContentSizeForViewInPopover_);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  objc_super v5;

  self->_externallySetNavControllerPreferredContentSize = a3;
  if (a3.width != *MEMORY[0x1E0C9D820] || a3.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:");
  v5.receiver = self;
  v5.super_class = (Class)UINavigationController;
  -[UIViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_);
}

- (CGSize)contentSizeForViewInPopover
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
  objc_super v12;
  CGSize result;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");

    -[UINavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSizeForViewInPopover");
    v7 = v6;
    v9 = v8;

    -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:", v7, v9);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UINavigationController;
    -[UIViewController contentSizeForViewInPopover](&v12, sel_contentSizeForViewInPopover);
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)isModalInPopover
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isModalInPresentation") & 1) != 0)
        {

          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UINavigationController;
  v8 = -[UIViewController isModalInPopover](&v10, sel_isModalInPopover);
LABEL_11:

  return v8;
}

- (id)_viewForContentInPopover
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[UIViewController childModalViewController](self, "childModalViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[UIViewController childModalViewController](self, "childModalViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isModalInPopover"),
        v5,
        v4,
        v6))
  {
    -[UIViewController childModalViewController](self, "childModalViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_viewForContentInPopover");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)_willBecomeContentViewControllerOfPopover:(id)a3
{
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[UIViewController _setPopoverController:](self, "_setPopoverController:", a3);
  if (self->_navigationBar)
  {
    -[UINavigationController navigationBar](self, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "barStyle"))
    {
LABEL_3:

      goto LABEL_5;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->super._popoverController);
    v6 = objc_msgSend(WeakRetained, "_popoverControllerStyle");

    if (!v6)
    {
      -[UINavigationController navigationBar](self, "navigationBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self->_savedNavBarStyleBeforeSheet = objc_msgSend(v10, "barStyle");

      -[UINavigationController navigationBar](self, "navigationBar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBarStyle:", 4);
      goto LABEL_3;
    }
  }
LABEL_5:
  if (self->_toolbar)
  {
    -[UINavigationController toolbar](self, "toolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "barStyle"))
    {
      v8 = objc_loadWeakRetained((id *)&self->super._popoverController);
      v9 = objc_msgSend(v8, "_popoverControllerStyle");

      if (v9)
        goto LABEL_9;
      -[UINavigationController toolbar](self, "toolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_savedToolBarStyleBeforeSheet = objc_msgSend(v11, "barStyle");

      -[UINavigationController toolbar](self, "toolbar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBarStyle:", 4);
    }

  }
LABEL_9:
  -[UINavigationController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
  -[UINavigationController _startDeferredTransitionIfNeeded](self, "_startDeferredTransitionIfNeeded");
}

- (void)_didBecomeContentViewControllerOfPopover:(id)a3
{
  objc_msgSend(a3, "_startWatchingForNavigationControllerNotifications:", self);
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t savedNavBarStyleBeforeSheet;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t savedToolBarStyleBeforeSheet;
  void *v16;
  id v17;

  v17 = a3;
  -[UINavigationController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 0);
  -[UIViewController _popoverController](self, "_popoverController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v17)
  {
    -[UIViewController _setPopoverController:](self, "_setPopoverController:", 0);
    -[UINavigationController navigationBar](self, "navigationBar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[UINavigationController navigationBar](self, "navigationBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "barStyle");

      if (v8 == 4)
      {
        savedNavBarStyleBeforeSheet = self->_savedNavBarStyleBeforeSheet;
        -[UINavigationController navigationBar](self, "navigationBar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBarStyle:", savedNavBarStyleBeforeSheet);

      }
    }
    -[UINavigationController toolbar](self, "toolbar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[UINavigationController toolbar](self, "toolbar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "barStyle");

      if (v14 == 4)
      {
        savedToolBarStyleBeforeSheet = self->_savedToolBarStyleBeforeSheet;
        -[UINavigationController toolbar](self, "toolbar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBarStyle:", savedToolBarStyleBeforeSheet);

      }
    }
  }
  objc_msgSend(v17, "_stopWatchingForNavigationControllerNotifications:", self);

}

- (BOOL)_isExecutingSplitViewControllerActions
{
  return ((unint64_t)*((unsigned __int8 *)&self->_navigationControllerFlags + 8) >> 1) & 1;
}

- (id)_navigationBarAdditionalActionsForBackButtonMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigationController:navigationBarAdditionalActionsForBackButtonMenu:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_navigationBarShouldShowSidebarToggleInNSToolbar:(id)a3
{
  void *v3;
  char v4;

  -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_needsNSToolbarSidebarToggle");

  return v4;
}

- (id)_effectiveDelegateForNavigationItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  UINavigationController *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  UINavigationController *v15;
  void *v16;
  id v17;
  UINavigationController *v18;
  UINavigationController *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UINavigationController disappearingViewController](self, "disappearingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_existingNavigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v10 = self;
    goto LABEL_23;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIViewController childViewControllers](self, "childViewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_22;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_msgSend(v13, "_existingNavigationItem");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v4)
      {
        v18 = self;
LABEL_21:

        v10 = v18;
        goto LABEL_22;
      }
      if (!objc_msgSend(v13, "_isNestedNavigationController"))
        continue;
      v15 = v13;
      -[UINavigationController bottomViewController](v15, "bottomViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_existingNavigationItem");
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (v17 == v4)
      {
        v19 = self;

        v10 = v19;
        goto LABEL_13;
      }
      -[UINavigationController _effectiveDelegateForNavigationItem:](v15, "_effectiveDelegateForNavigationItem:", v4);
      v18 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v10 = v15;
        goto LABEL_21;
      }
      v10 = 0;
LABEL_13:

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
      continue;
    break;
  }
LABEL_22:

LABEL_23:
  return v10;
}

- (id)_separateViewControllersAfterAndIncludingViewController:(id)a3 forSplitViewController:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t navigationControllerFlags;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v5;
  else
    v8 = (void *)v6;
  v9 = v8;
  -[UINavigationController viewControllers](self, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = (id)MEMORY[0x1E0C9AA60];
  if (!v9)
    goto LABEL_23;
  v13 = objc_msgSend(v10, "indexOfObject:", v9);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v14 = v13;
  if (objc_msgSend(v9, "_isNavigationController"))
  {
    navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
    v9[153] = v9[153] & 0xFFFF7FFFFFFFFFFFLL | (((navigationControllerFlags >> 47) & 1) << 47);
    if ((navigationControllerFlags & 0x800000000000) != 0)
    {
      *(_QWORD *)&self->_navigationControllerFlags &= ~0x800000000000uLL;
      -[UINavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 0);
    }
  }
  if (v5 || v14 != objc_msgSend(v11, "count") - 1)
  {
    if (!v14)
    {
      -[UINavigationController setViewControllers:animated:](self, "setViewControllers:animated:", MEMORY[0x1E0C9AA60], 0);
      v19 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", v14 - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController popToViewController:animated:](self, "popToViewController:animated:", v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (!v16)
    {
      v19 = 0;
      goto LABEL_17;
    }
    v23[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
LABEL_17:

LABEL_19:
  if (v19)
    v20 = v19;
  else
    v20 = v12;
  v12 = v20;

LABEL_23:
  return v12;
}

- (id)_moreListTitle
{
  void *v2;
  void *v3;

  -[UINavigationController bottomViewController](self, "bottomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_moreListTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)moreListImage
{
  void *v2;
  void *v3;

  -[UINavigationController bottomViewController](self, "bottomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moreListImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)moreListSelectedImage
{
  void *v2;
  void *v3;

  -[UINavigationController bottomViewController](self, "bottomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moreListSelectedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)moreListTableCell
{
  void *v2;
  void *v3;

  -[UINavigationController bottomViewController](self, "bottomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moreListTableCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_ensureToViewControllersViewIsLoaded:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadViewIfNeeded");

  }
  objc_msgSend(v4, "loadViewIfNeeded");

}

- (void)transitionConductorWillStartImmediateTransition:(id)a3
{
  _QWORD *v3;

  *(_QWORD *)&self->_navigationControllerFlags |= 4uLL;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3[153] |= 8uLL;

}

- (void)transitionConductorDidStartImmediateTransition:(id)a3
{
  -[UINavigationController _startPaletteTransitionIfNecessary:animated:](self, "_startPaletteTransitionIfNecessary:animated:", 0, 0);
}

- (void)transitionConductor:(id)a3 beginPinningInputViewsForTransitionFromViewController:(id)a4 toViewController:(id)a5 forTransitionType:(int)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  v9 = a5;
  -[UIViewController _focusBehavior](self, "_focusBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "syncsFocusAndResponder") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[UIViewController _focusSystem](self, "_focusSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_5:
    -[UIViewController presentedViewController](self, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
LABEL_6:

      goto LABEL_12;
    }
    if (!objc_msgSend(v9, "_containedInAbsoluteResponderChain"))
      goto LABEL_12;
    if ((objc_msgSend(v9, "_containsFirstResponder") & 1) != 0
      || -[UIResponder _disableAutomaticKeyboardBehavior](self, "_disableAutomaticKeyboardBehavior"))
    {
      if (!objc_msgSend(v30, "_containsFirstResponder"))
        goto LABEL_12;
      -[UIViewController _keyboardSceneDelegate](self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "responder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resignFirstResponder");

      goto LABEL_6;
    }
    -[UIViewController _keyboardSceneDelegate](self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UINavigationController _isViewControllerFullWidth](self, "_isViewControllerFullWidth");
    v16 = (a6 - 17) < 0xFFFFFFFE && v15;
    if (v16)
      objc_msgSend(v13, "_setIgnoresPinning:allowImmediateReload:", 1, 0);
    -[UIViewController parentViewController](self, "parentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_isHostedRootViewController");

    if (v30)
    {
      v19 = 1;
    }
    else
    {
      -[UIViewController presentingViewController](self, "presentingViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v18 = 1;

      if ((v18 & 1) != 0)
      {
        v19 = 1;
        v21 = 1;
LABEL_21:
        if ((objc_msgSend(v9, "becomeFirstResponder") & 1) == 0)
        {
          -[UINavigationController _keyboardAnimationStyle](self, "_keyboardAnimationStyle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pushAnimationStyle:", v22);

          objc_msgSend(v13, "responder");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v30, "_shouldAttemptToPreserveInputViewsForResponder:", v23);

          if (v24)
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v30);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_preserveInputViewsWithId:animated:", v25, 1);

            objc_msgSend(v13, "responder");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "resignFirstResponder");
          }
          else
          {
            objc_msgSend(v13, "responder");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "_clearBecomeFirstResponderWhenCapable");
          }

          objc_msgSend(v13, "popAnimationStyle");
          objc_msgSend(v13, "responder");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v9);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_restoreInputViewsWithId:animated:", v29, 1);

          }
        }
        if ((v21 & 1) != 0)
        {
          if ((v19 & 1) != 0)
            goto LABEL_33;
        }
        else
        {
          objc_msgSend(v13, "popAnimationStyle");
          if ((v19 & 1) != 0)
          {
LABEL_33:
            if (!v16)
              goto LABEL_6;
LABEL_37:
            objc_msgSend(v13, "_setIgnoresPinning:allowImmediateReload:", 0, 0);
            goto LABEL_6;
          }
        }
        objc_msgSend(v13, "_endDisablingAnimations");
        if (!v16)
          goto LABEL_6;
        goto LABEL_37;
      }
      objc_msgSend(v13, "_beginDisablingAnimations");
      v19 = 0;
    }
    -[UINavigationController _keyboardAnimationStyle](self, "_keyboardAnimationStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushAnimationStyle:", v20);

    v21 = 0;
    goto LABEL_21;
  }
LABEL_12:

}

- (void)transitionConductor:(id)a3 willTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[UINavigationController _initializeNavigationDeferredTransitionContextIfNecessary](self, "_initializeNavigationDeferredTransitionContextIfNecessary");
  -[UIViewController _focusSystem](self, "_focusSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (objc_msgSend(v12, "isViewLoaded"))
    {
      objc_msgSend(v12, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "_focusedItemIsContainedInEnvironment:includeSelf:", v9, 1);

      if (v10)
      {
        objc_msgSend(v8, "focusedItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController _rememberFocusedItem:forViewController:](self, "_rememberFocusedItem:forViewController:", v11, v12);

      }
    }
  }
  -[UINavigationController _ensureToViewControllersViewIsLoaded:](self, "_ensureToViewControllersViewIsLoaded:", v7);

}

- (id)transitionConductor:(id)a3 retargetedToViewControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5 transition:(int)a6
{
  _WORD *v9;
  _WORD *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t navigationControllerFlags;
  __int16 v20;
  __int16 v21;
  uint64_t WeakRetained;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  _UIInvalidatable *v40;
  _UIInvalidatable *keyboardLayoutGuideTransitionAssertion;
  unint64_t v43;
  NSObject *v44;
  NSObject *v45;
  id v47;
  uint8_t buf[16];
  uint8_t v49[16];

  v47 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *(_QWORD *)&self->_navigationControllerFlags & 0x100;
  v12 = (*(_QWORD *)&self->_navigationControllerFlags >> 8) & 1;
  v13 = -[UIViewController _appearState](self, "_appearState");
  v14 = v13 - 3;
  if (v9 == v10 || v14 < 0xFFFFFFFE)
    goto LABEL_19;
  v15 = v13;
  if (v13 == 1)
    v16 = objc_msgSend(v47, "hostIsAppearingAnimated");
  else
    v16 = v11 >> 8;
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1000) == 0)
  {
    v17 = v9;
    if (!v11)
    {
      v17 = v9;
      if ((*(_QWORD *)&self->_navigationControllerFlags & 0xF0) == 0x20)
      {
        objc_msgSend(v9, "parentViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v9;
        if (!v18)
        {
          if (v9)
          {
            v20 = v9[188];
            v9[188] = v20 | 0x100;
            objc_msgSend(v9, "setParentViewController:", self);
            v9[188] = v9[188] & 0xFEFF | v20 & 0x100;
            objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, v16);
            v21 = v9[188];
            v9[188] = v21 | 0x100;
            objc_msgSend(v9, "setParentViewController:", 0);
            v9[188] = v9[188] & 0xFEFF | v21 & 0x100;
            navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
            goto LABEL_17;
          }
          v17 = 0;
        }
      }
    }
    objc_msgSend(v17, "beginAppearanceTransition:animated:", 0, v16);
  }
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if (!v9 && v15 == 1)
  {
    v12 = (_DWORD)v16 != 0;
    if ((navigationControllerFlags & 0x4000000001000) == 0)
      objc_msgSend(v10, "__viewWillAppear:", v16);
    goto LABEL_19;
  }
LABEL_17:
  v12 = (_DWORD)v16 != 0;
  if ((navigationControllerFlags & 0x1000) == 0)
    objc_msgSend(v10, "beginAppearanceTransition:animated:", 1, v16);
LABEL_19:
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    -[UINavigationController delegate](self, "delegate");
    WeakRetained = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)WeakRetained;
  if (v14 >= 0xFFFFFFFE && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v23, "navigationController:willShowViewController:animated:", self, v24, v11 != 0);

    v25 = 1;
  }
  else
  {
    v25 = 0;
  }
  -[UINavigationController topViewController](self, "topViewController");
  v26 = objc_claimAutoreleasedReturnValue();
  if ((_WORD *)v26 == v10)
  {
    v29 = v10;
  }
  else
  {
    v27 = (id)v26;
    do
    {
      objc_msgSend(v10, "parentViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didMoveToParentViewController:", v28);

      objc_msgSend(v10, "cancelBeginAppearanceTransition");
      objc_msgSend(v27, "loadViewIfRequired");
      v29 = v27;

      objc_msgSend(v29, "beginAppearanceTransition:animated:", 1, v12);
      -[UINavigationController topViewController](self, "topViewController");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      if (v27)
        v30 = v25;
      else
        v30 = 0;
      if (v30 == 1)
        objc_msgSend(v23, "navigationController:willShowViewController:animated:", self, v27, v11 != 0);
      v10 = v29;
    }
    while (v29 != v27);
  }
  -[UINavigationController willShowViewController:animated:](self, "willShowViewController:animated:", v29, v11 != 0);
  -[UINavigationController _privateWillShowViewController:](self, "_privateWillShowViewController:", v29);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v32 = v31;
  if (v9)
    objc_msgSend(v31, "setObject:forKey:", v9, CFSTR("UINavigationControllerLastVisibleViewController"));
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 != 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v37, CFSTR("UINavigationControllerTransitionIsAnimated"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "postNotificationName:object:userInfo:", CFSTR("UINavigationControllerWillShowViewControllerNotification"), self, v32);
    goto LABEL_47;
  }
  objc_msgSend(v32, "setObject:forKey:", v29, CFSTR("UINavigationControllerNextVisibleViewController"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 != 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKey:", v33, CFSTR("UINavigationControllerTransitionIsAnimated"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("UINavigationControllerWillShowViewControllerNotification"), self, v32);

  if (a6)
  {
    *(_QWORD *)&self->_navigationControllerFlags |= 0x200uLL;
    -[UIViewController _keyboardSceneDelegate](self);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _keyboardAnimationStyle](self, "_keyboardAnimationStyle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pushAnimationStyle:", v36);

LABEL_47:
    goto LABEL_48;
  }
  -[UINavigationController _window](self, "_window");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isTrackingKeyboard");

  if (v39)
  {
    if (!self->_keyboardLayoutGuideTransitionAssertion)
      goto LABEL_46;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v49 = 0;
        _os_log_fault_impl(&dword_185066000, v45, OS_LOG_TYPE_FAULT, "Should not already have a KLG transition assertion when starting a non-animated navigation transition", v49, 2u);
      }

    }
    else
    {
      v43 = transitionConductor_retargetedToViewControllerForTransitionFromViewController_toViewController_transition____s_category;
      if (!transitionConductor_retargetedToViewControllerForTransitionFromViewController_toViewController_transition____s_category)
      {
        v43 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v43, (unint64_t *)&transitionConductor_retargetedToViewControllerForTransitionFromViewController_toViewController_transition____s_category);
      }
      v44 = *(NSObject **)(v43 + 8);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_ERROR, "Should not already have a KLG transition assertion when starting a non-animated navigation transition", buf, 2u);
      }
    }
    if (!self->_keyboardLayoutGuideTransitionAssertion)
    {
LABEL_46:
      -[UINavigationController _window](self, "_window");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_obtainKeyboardLayoutGuideTransitionAssertionForReason:", CFSTR("UINavigationController unanimated transition"));
      v40 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
      keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
      self->_keyboardLayoutGuideTransitionAssertion = v40;

      goto LABEL_47;
    }
  }
LABEL_48:
  -[UINavigationController _presentationTransitionUnwrapViewController:](self, "_presentationTransitionUnwrapViewController:", v29);

  return v29;
}

- (void)transitionConductor:(id)a3 didStartDeferredTransition:(BOOL)a4 context:(id)a5
{
  id v8;
  void *v9;
  UITraitCollection *v11;
  UITraitCollection *overrideTraitCollectionForPoppingViewControler;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD);
  void *v41;
  id v42;

  v42 = a3;
  v8 = a5;
  if (v8
    || (objc_msgSend(v42, "transitionContext"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v32,
        !v32))
  {
    if (a4)
    {
      objc_msgSend(v8, "fromViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(_QWORD *)&self->_navigationControllerFlags & 0xF0) == 0x20
        || (*(_QWORD *)&self->_navigationControllerFlags & 0x2000000000000) != 0)
      {
        if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController, (uint64_t)CFSTR("NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController")) & 1) != 0|| byte_1ECD7607C)
        {
          -[UIViewController overrideTraitCollectionForChildViewController:](self, "overrideTraitCollectionForChildViewController:", v9);
          v11 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
          overrideTraitCollectionForPoppingViewControler = self->_overrideTraitCollectionForPoppingViewControler;
          self->_overrideTraitCollectionForPoppingViewControler = v11;

          objc_msgSend(v9, "set_departingParentViewController:", self);
        }
        -[UINavigationController removeChildViewController:notifyDidMove:](self, "removeChildViewController:notifyDidMove:", v9, 0);
      }
      -[UINavigationController topViewController](self, "topViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "childModalViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "superview");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v16, "bounds");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          objc_msgSend(v13, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

          objc_msgSend(v13, "presentedViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "presentationController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "containerView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setFrame:", v18, v20, v22, v24);

          objc_msgSend(v13, "presentedViewController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "presentationController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "containerView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addSubview:", v31);

        }
      }
      -[UINavigationController _notifyTransitionBegan:](self, "_notifyTransitionBegan:", v8);

    }
    if ((*(_QWORD *)&self->_navigationControllerFlags & 4) == 0)
      -[UINavigationController _clearLastOperation](self);
    if (!a4)
      -[UINavigationController _layoutTopViewController](self, "_layoutTopViewController");
    if ((*(_QWORD *)&self->_navigationControllerFlags & 2) != 0)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "toolbarItems");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        -[UINavigationController _existingToolbar](self, "_existingToolbar");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController topViewController](self, "topViewController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "toolbarItems");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setItems:animated:", v38, (*(_QWORD *)&self->_navigationControllerFlags >> 8) & 1);

      }
    }
    -[UINavigationController _updateNavigationBarHandler](self, "_updateNavigationBarHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[UINavigationController _updateNavigationBarHandler](self, "_updateNavigationBarHandler");
      v40 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      -[UINavigationController _setUpdateNavigationBarHandler:](self, "_setUpdateNavigationBarHandler:", 0);
      v40[2](v40);
      if (-[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
      {
        -[UINavigationController _navigationBarForNestedNavigationController](self, "_navigationBarForNestedNavigationController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "_beginInteractiveTransition");

      }
    }
    *(_QWORD *)&self->_navigationControllerFlags &= ~0x4000000000000000uLL;
  }

}

- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5
{
  -[UINavigationController _didEndTransitionFromView:toView:wasCustom:](self, "_didEndTransitionFromView:toView:wasCustom:", a4, a5, 0);
}

- (void)transitionConductor:(id)a3 didStartCustomTransitionWithContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  objc_class *v14;
  const char *Name;
  objc_class *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  _UIPresentedViewControllerInteractivePopTransitioningDelegate *v27;
  UIViewControllerBuiltinTransitionViewAnimator *v28;
  void *v29;
  uint64_t v30;
  UIViewControllerBuiltinTransitionViewAnimator *v31;
  uint64_t v32;
  _UIPresentedViewControllerInteractivePopTransitioningDelegate *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  id v42;
  int v43;
  uint64_t WeakRetained;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  unint64_t navigationControllerFlags;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  int v67;
  unint64_t v68;
  void *v69;
  void *v70;
  _UIInvalidatable *v71;
  _UIInvalidatable *keyboardLayoutGuideTransitionAssertion;
  void *v73;
  void *v74;
  UINavigationController *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  _UIInvalidatable *windowRotationLockAssertion;
  unint64_t v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  _UIPresentedViewControllerInteractivePopTransitioningDelegate *v101;
  id v102;
  id v103;
  UINavigationController *v104;
  uint8_t v105[128];
  uint8_t buf[4];
  int v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  const char *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "toViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_searchControllerIfAllowed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isActive"))
    objc_msgSend(v9, "_setTransitioningOutWithoutDisappearing:", 1);
  v90 = v9;
  v10 = qword_1EDDB0F20;
  if (!qword_1EDDB0F20)
  {
    v10 = __UILogCategoryGetNode("UINavigationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1EDDB0F20);
  }
  v11 = *(id *)(v10 + 8);
  v12 = os_signpost_id_make_with_pointer(*(os_log_t *)(v10 + 8), self);
  v91 = v5;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      v14 = (objc_class *)objc_opt_class();
      Name = class_getName(v14);
      v16 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 67240706;
      v107 = 1;
      v108 = 2082;
      v109 = Name;
      v5 = v91;
      v110 = 2082;
      v111 = class_getName(v16);
      _os_signpost_emit_with_name_impl(&dword_185066000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NavigationTransition", " enableTelemetry=YES  isAnimation=YES custom=%{signpost.telemetry:number1,signpost.description:attribute,public}u, from=%{signpost.telemetry:string1,public}s to=%{signpost.telemetry:string2,public}s", buf, 0x1Cu);
    }
  }

  *(_QWORD *)&self->_navigationControllerFlags |= 4uLL;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v17[153] |= 8uLL;

  *(_QWORD *)&self->_navigationControllerFlags |= 0x10000uLL;
  -[UIViewController _focusSystem](self, "_focusSystem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_lockEnvironment:", self);

  v93 = v7;
  v19 = *(_QWORD *)&self->_navigationControllerFlags & 0xF0;
  objc_msgSend(v5, "_transitionCoordinator");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController presentedViewController](self, "presentedViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activePresentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionConductor interactiveTransitionController](self->_transitionConductor, "interactiveTransitionController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19 == 16;
  v24 = v93;
  if (!v23)
  {
    if (v20)
    {
      if (objc_msgSend(v21, "_shouldDismissWithNavigationPop"))
      {
        objc_msgSend(v21, "_sourceViewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "_isMemberOfViewControllerHierarchy:", v93);

        if (v26)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0
            && objc_msgSend(v22, "_supportsCoordinatedPresentationDismissal"))
          {
            v27 = objc_alloc_init(_UIPresentedViewControllerInteractivePopTransitioningDelegate);
            v28 = [UIViewControllerBuiltinTransitionViewAnimator alloc];
            -[UIViewController view](self, "view");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v29, "_shouldReverseLayoutDirection"))
              v30 = 1;
            else
              v30 = 2;
            v31 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:](v28, "initWithTransition:", v30);
            -[_UIPresentedViewControllerInteractivePopTransitioningDelegate setAnimator:](v27, "setAnimator:", v31);

            v5 = v91;
            -[_UIPresentedViewControllerInteractivePopTransitioningDelegate setInteractor:](v27, "setInteractor:", v22);
          }
          else
          {
            v27 = 0;
          }
          v32 = MEMORY[0x1E0C809B0];
          v100[0] = MEMORY[0x1E0C809B0];
          v100[1] = 3221225472;
          v100[2] = __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke;
          v100[3] = &unk_1E16C0CE8;
          v101 = v27;
          v102 = v20;
          v103 = v21;
          v104 = self;
          v98[0] = v32;
          v98[1] = 3221225472;
          v98[2] = __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke_2;
          v98[3] = &unk_1E16B2150;
          v99 = v102;
          v33 = v27;
          objc_msgSend(v92, "animateAlongsideTransition:completion:", v100, v98);

        }
      }
    }
  }
  -[UINavigationController topViewController](self, "topViewController");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  v89 = v20;
  if (v34 != v6)
  {
    v36 = v34;

    v6 = v36;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v95 != v40)
          objc_enumerationMutation(v37);
        v42 = *(id *)(*((_QWORD *)&v94 + 1) + 8 * i);
        if (v42 != v6 && objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "_isContainmentChanging"))
          objc_msgSend(v42, "didMoveToParentViewController:", self);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
    }
    while (v39);

    v5 = v91;
    v24 = v93;
    if (!self)
      goto LABEL_39;
  }
  else
  {

  }
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 > 1)
  {
LABEL_39:
    v43 = 0;
    goto LABEL_40;
  }
  if ((*(_QWORD *)&self->_navigationControllerFlags & 0x1000) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("custom navigation transition - no popping between different orienations!"));
  v43 = 1;
  objc_msgSend(v24, "beginAppearanceTransition:animated:", 0, 1);
  objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, 1);
LABEL_40:
  v87 = v22;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    -[UINavigationController delegate](self, "delegate");
    WeakRetained = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)WeakRetained;
  if (v43)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UINavigationController topViewController](self, "topViewController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 1;
      objc_msgSend(v45, "navigationController:willShowViewController:animated:", self, v46, 1);

    }
    else
    {
      v43 = 0;
    }
  }
  v88 = v21;
  -[UINavigationController topViewController](self, "topViewController");
  v47 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v47)
  {
    v49 = v6;
  }
  else
  {
    do
    {
      objc_msgSend(v6, "parentViewController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didMoveToParentViewController:", v48);

      objc_msgSend(v6, "cancelBeginAppearanceTransition");
      objc_msgSend(v47, "view");

      v49 = v47;
      objc_msgSend(v49, "beginAppearanceTransition:animated:", 1, 1);
      if (v43)
      {
        -[UINavigationController topViewController](self, "topViewController");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "navigationController:willShowViewController:animated:", self, v50, 1);

      }
      -[UINavigationController topViewController](self, "topViewController");
      v47 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v49;
    }
    while (v49 != v47);
  }
  -[UINavigationController _privateWillShowViewController:](self, "_privateWillShowViewController:", v49);
  -[UINavigationController _setDefinesPresentationContextIfNecessaryForViewController:](self, "_setDefinesPresentationContextIfNecessaryForViewController:", v49);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v52 = v51;
  if (v24)
    objc_msgSend(v51, "setObject:forKey:", v24, CFSTR("UINavigationControllerLastVisibleViewController"));
  if (v49)
    objc_msgSend(v52, "setObject:forKey:", v49, CFSTR("UINavigationControllerNextVisibleViewController"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setObject:forKey:", v53, CFSTR("UINavigationControllerTransitionIsAnimated"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "postNotificationName:object:userInfo:", CFSTR("UINavigationControllerWillShowViewControllerNotification"), self, v52);

  -[UINavigationController _startToolbarTransitionIfNecessary:animated:](self, "_startToolbarTransitionIfNecessary:animated:", v5, 1);
  -[UINavigationController _startPaletteTransitionIfNecessary:animated:](self, "_startPaletteTransitionIfNecessary:animated:", v92, 1);
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "_tabBarControllerEnforcingClass:", 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
    v58 = objc_msgSend(v56, "_isBarEffectivelyHidden") ^ 1;
  else
    v58 = 0;
  v59 = objc_msgSend(v55, "_hasPotentiallyChromelessBottomBar");
  navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  v61 = *((_BYTE *)&self->_navigationControllerFlags + 8);
  if (!v59)
  {
    *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags & 0xBFFFFFFFFFFFFFFFLL;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v61;
    objc_msgSend(v5, "_setNeedsBottomBarCrossfade:", 0);
    goto LABEL_68;
  }
  if ((navigationControllerFlags & 0x4000000000000000) != 0)
  {
    v62 = (navigationControllerFlags >> 45) & 1;
    *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags & 0xBFFFFFFFFFFFFFFFLL;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v61;
    objc_msgSend(v5, "_setNeedsBottomBarCrossfade:", v62);
    if ((v62 & 1) == 0)
      goto LABEL_68;
  }
  else
  {
    *(_QWORD *)&self->_navigationControllerFlags = navigationControllerFlags & 0xBFFFFFFFFFFFFFFFLL;
    *((_BYTE *)&self->_navigationControllerFlags + 8) = v61;
    objc_msgSend(v5, "_setNeedsBottomBarCrossfade:", 1);
  }
  if (v58)
    objc_msgSend(v57, "_setSuspendBarBackgroundUpdating:", 1);
  else
    objc_msgSend(v55, "_setSuspendToolbarBackgroundUpdating:", 1);
LABEL_68:
  -[UINavigationController _updateScrollViewFromViewController:toViewController:](self, "_updateScrollViewFromViewController:toViewController:", v24, v49);
  v63 = -[UINavigationController _deferredTransition](self, "_deferredTransition");
  if ((_DWORD)v63)
  {
    v64 = v63;
    -[UINavigationController _keyboardAnimationStyle](self, "_keyboardAnimationStyle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)&self->_navigationControllerFlags |= 0x200uLL;
      -[UINavigationController _window](self, "_window");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "isTrackingKeyboard");

      if (v67)
      {
        v68 = -[UINavigationController _keyboardScreenEdgeForTransition:](self, "_keyboardScreenEdgeForTransition:", v64);
        if ((objc_msgSend(v65, "disableAlongsideView") & 1) == 0)
        {
          -[UINavigationController _window](self, "_window");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "moveKeyboardLayoutGuideOverEdge:layoutViews:", v68, 1);

          if (!self->_keyboardLayoutGuideTransitionAssertion)
            goto LABEL_73;
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_185066000, v86, OS_LOG_TYPE_FAULT, "Should not already have a KLG transition assertion when starting a custom navigation transition", buf, 2u);
            }

          }
          else
          {
            v84 = qword_1EDDB0F28;
            if (!qword_1EDDB0F28)
            {
              v84 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v84, (unint64_t *)&qword_1EDDB0F28);
            }
            v85 = *(NSObject **)(v84 + 8);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_185066000, v85, OS_LOG_TYPE_ERROR, "Should not already have a KLG transition assertion when starting a custom navigation transition", buf, 2u);
            }
          }
          if (!self->_keyboardLayoutGuideTransitionAssertion)
          {
LABEL_73:
            -[UINavigationController _window](self, "_window");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "_obtainKeyboardLayoutGuideTransitionAssertionForReason:", CFSTR("UINavigationController custom transition"));
            v71 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
            keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
            self->_keyboardLayoutGuideTransitionAssertion = v71;

          }
        }
      }
      -[UIViewController _keyboardSceneDelegate](self);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "pushAnimationStyle:", v65);

    }
  }
  v74 = (void *)MEMORY[0x1E0CB3940];
  v75 = self;
  v76 = (objc_class *)objc_opt_class();
  NSStringFromClass(v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "stringWithFormat:", CFSTR("<%@: %p>"), v77, v75);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "stringWithFormat:", CFSTR("UINavigationController transition : %@"), v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController view](v75, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "window");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _acquireOrientationLockAssertionWithReason:](v81, v79);
  v82 = objc_claimAutoreleasedReturnValue();
  windowRotationLockAssertion = v75->_windowRotationLockAssertion;
  v75->_windowRotationLockAssertion = (_UIInvalidatable *)v82;

  *(_QWORD *)&self->_navigationControllerFlags &= ~0x20000000000000uLL;
  objc_msgSend(v91, "_setPerformingLayoutToLayoutTransition:", -[UINavigationController _isPerformingLayoutToLayoutTransition](v75, "_isPerformingLayoutToLayoutTransition"));

}

void __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_setOverrideTransitioningDelegate:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = *(void **)(a1 + 48);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "set_dismissingHorizontallyAlongsideNavigationPop:", 1);
  objc_msgSend(*(id *)(a1 + 56), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v4, "set_dismissingHorizontallyAlongsideNavigationPop:", 0);

}

uint64_t __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setOverrideTransitioningDelegate:", 0);
}

- (void)transitionConductor:(id)a3 didEndCustomTransitionWithContext:(id)a4 didComplete:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
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
  void *v29;
  UITraitCollection *overrideTraitCollectionForPoppingViewControler;
  void *v31;
  void (**v32)(void);
  uint64_t navigationControllerFlags;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _UIInvalidatable *windowRotationLockAssertion;
  void *v47;
  id v48;

  v5 = a5;
  v48 = a4;
  objc_msgSend(v48, "fromViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "toViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v7, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_searchControllerIfAllowed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_setTransitioningOutWithoutDisappearing:", 0);
  v15 = objc_msgSend(v48, "_needsBottomBarCrossfade");
  v16 = v48;
  if (v15)
  {
    v17 = objc_msgSend(v48, "_transitioningBottomBarIsTabBar");
    -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_tabBarControllerEnforcingClass:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17)
    {
      if ((objc_msgSend(v19, "_suspendBarBackgroundUpdating") & 1) != 0)
      {
        v47 = v12;
        objc_msgSend(v20, "_setSuspendBarBackgroundUpdating:", 0);
        objc_msgSend(v18, "_viewControllerForObservableScrollView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_contentOrObservableScrollViewForEdge:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tabBar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:", v22, v23, 1);
LABEL_10:

        v12 = v47;
      }
    }
    else if ((objc_msgSend(v18, "_suspendToolbarBackgroundUpdating") & 1) != 0)
    {
      v47 = v12;
      objc_msgSend(v18, "_setSuspendToolbarBackgroundUpdating:", 0);
      objc_msgSend(v18, "_viewControllerForObservableScrollView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_contentOrObservableScrollViewForEdge:", 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_existingActiveVisibleToolbar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_updateBackgroundTransitionProgressForScrollView:toolbar:isNavigationTransitionUpdate:", v22, v23, 1);
      goto LABEL_10;
    }

    v16 = v48;
  }
  objc_msgSend(v16, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UINavigationController topViewController](self, "topViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController _didEndTransitionFromView:toView:wasCustom:](self, "_didEndTransitionFromView:toView:wasCustom:", v12, v24, 1);
    -[UINavigationController _setPreferredContentSizeFromChildContentContainer:](self, "_setPreferredContentSizeFromChildContentContainer:", v25);
  }
  else
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v25 = v26;
    if (v7)
      objc_msgSend(v26, "setObject:forKey:", v7, CFSTR("UINavigationControllerNextVisibleViewController"));
    if (v8)
      objc_msgSend(v25, "setObject:forKey:", v8, CFSTR("UINavigationControllerLastVisibleViewController"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v48, "isAnimated"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("UINavigationControllerTransitionIsAnimated"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("UINavigationControllerWillShowViewControllerNotification"), self, v25);

    -[UINavigationController _forgetFocusedItemForViewController:](self, "_forgetFocusedItemForViewController:", v7);
    -[UINavigationController _didCancelTransitionFromViewController:toViewController:wrapperView:wasCustom:](self, "_didCancelTransitionFromViewController:toViewController:wrapperView:wasCustom:", v7, v8, v24, 1);
  }

  -[UIViewController _focusSystem](self, "_focusSystem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_unlockEnvironment:", self);

  overrideTraitCollectionForPoppingViewControler = self->_overrideTraitCollectionForPoppingViewControler;
  self->_overrideTraitCollectionForPoppingViewControler = 0;

  objc_msgSend(v7, "set_departingParentViewController:", 0);
  *(_QWORD *)&self->_navigationControllerFlags &= 0xFFFFFFFFFFFCFFFFLL;
  objc_msgSend(v48, "_postInteractiveCompletionHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v48, "_postInteractiveCompletionHandler");
    v32 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v32[2]();

    objc_msgSend(v48, "_setPostInteractiveCompletionHandler:", 0);
  }
  if (objc_msgSend(v48, "isInterruptible"))
  {
    -[_UIViewControllerTransitionConductor setCustomNavigationTransitionDuration:](self->_transitionConductor, "setCustomNavigationTransitionDuration:", 0.0);
    -[UINavigationController setInteractiveTransition:](self, "setInteractiveTransition:", 0);
  }
  navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if (objc_msgSend(v48, "_isPerformingLayoutToLayoutTransition"))
  {
    v34 = v24;
    v35 = v14;
    v36 = v12;
    v37 = navigationControllerFlags & 0xF0;
    objc_msgSend(v7, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v8, "_uiCollectionView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40 == v7)
      {
        objc_msgSend(v8, "_uiCollectionView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setDelegate:", v8);

      }
      v42 = v7;
      if (v37 == 16)
        goto LABEL_31;
    }
    else
    {
      objc_msgSend(v7, "_uiCollectionView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSubview:", v43);

      v42 = v8;
      if (v37 != 16)
      {
LABEL_31:

        v12 = v36;
        v14 = v35;
        v24 = v34;
        goto LABEL_32;
      }
    }
    objc_msgSend(v42, "_clearSharedView");
    goto LABEL_31;
  }
LABEL_32:
  if (!-[UINavigationController isInteractiveTransition](self, "isInteractiveTransition"))
    -[_UIViewControllerTransitionConductor setCustomNavigationTransitionDuration:](self->_transitionConductor, "setCustomNavigationTransitionDuration:", 0.0);
  objc_msgSend(v48, "_setTransitionIsInFlight:", 0);
  objc_msgSend(v48, "_setInteractor:", 0);
  objc_msgSend(v48, "_setAnimator:", 0);
  -[_UIViewControllerTransitionConductor setTransitionController:](self->_transitionConductor, "setTransitionController:", 0);
  -[_UIViewControllerTransitionConductor setInteractiveTransitionController:](self->_transitionConductor, "setInteractiveTransitionController:", 0);
  -[UINavigationController navigationBar](self, "navigationBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
    objc_msgSend(v44, "_reenableUserInteractionWhenReadyWithContext:", v48);
  else
    objc_msgSend(v48, "_enableInteractionForDisabledViews");
  -[_UIInvalidatable _invalidate](self->_windowRotationLockAssertion, "_invalidate");
  windowRotationLockAssertion = self->_windowRotationLockAssertion;
  self->_windowRotationLockAssertion = 0;

  -[UINavigationController _setUsingBuiltinAnimator:](self, "_setUsingBuiltinAnimator:", 0);
}

- (void)transitionConductor:(id)a3 interactiveTransitionDidUpdateProgress:(double)a4 finish:(BOOL)a5 transitionCompleted:(BOOL)a6 transitionContext:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;

  v8 = a6;
  v9 = a5;
  v13 = a3;
  v12 = a7;
  if (v9 && v8)
  {
    -[UINavigationController _finishInteractiveTransition:transitionContext:](self, "_finishInteractiveTransition:transitionContext:", v12, a4);
  }
  else if (v9)
  {
    -[UINavigationController _cancelInteractiveTransition:transitionContext:](self, "_cancelInteractiveTransition:transitionContext:", v12, a4);
  }
  else
  {
    -[UINavigationController _updateInteractiveTransition:](self, "_updateInteractiveTransition:", a4);
  }

}

- (CGRect)transitionConductor:(id)a3 frameForViewController:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UINavigationController _frameForViewController:](self, "_frameForViewController:", a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)transitionConductor:(id)a3 frameForWrapperViewForViewController:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UINavigationController _frameForWrapperViewForViewController:](self, "_frameForWrapperViewForViewController:", a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (_UIViewControllerTransitionConductor)_transitionConductor
{
  return self->_transitionConductor;
}

- (BOOL)hidesBarsWhenKeyboardAppears
{
  return self->_hidesBarsWhenKeyboardAppears;
}

- (BOOL)hidesBarsOnSwipe
{
  return self->_hidesBarsOnSwipe;
}

- (BOOL)hidesBarsWhenVerticallyCompact
{
  return self->_hidesBarsWhenVerticallyCompact;
}

- (BOOL)hidesBarsOnTap
{
  return self->_hidesBarsOnTap;
}

- (double)_builtinTransitionGap
{
  return self->_builtinTransitionGap;
}

- (int64_t)_preferredNavigationBarPosition
{
  return self->__preferredNavigationBarPosition;
}

- (void)_setPositionBarsExclusivelyWithSafeArea:(BOOL)a3
{
  self->__positionBarsExclusivelyWithSafeArea = a3;
}

- (void)_setUsingBuiltinAnimator:(BOOL)a3
{
  self->__usingBuiltinAnimator = a3;
}

- (BOOL)_shouldIgnoreDelegateTransitionController
{
  return self->__shouldIgnoreDelegateTransitionController;
}

- (void)_setShouldIgnoreDelegateTransitionController:(BOOL)a3
{
  self->__shouldIgnoreDelegateTransitionController = a3;
}

- (void)_setNavbarAnimationId:(id)a3
{
  objc_storeStrong((id *)&self->__navbarAnimationId, a3);
}

- (void)_setToolbarAnimationWasCancelled:(BOOL)a3
{
  self->__toolbarAnimationWasCancelled = a3;
}

- (void)_setNavigationBarAnimationWasCancelled:(BOOL)a3
{
  self->__navigationBarAnimationWasCancelled = a3;
}

- (BOOL)_wantsTabCrossFadeTransition
{
  return self->__wantsTabCrossFadeTransition;
}

- (void)_setWantsTabCrossfadeTransition:(BOOL)a3
{
  self->__wantsTabCrossFadeTransition = a3;
}

- (void)_setUpdateNavigationBarHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1352);
}

- (UIFocusContainerGuide)_contentFocusContainerGuide
{
  return self->_contentFocusContainerGuide;
}

- (UITabGroup)_managedTabGroup
{
  return (UITabGroup *)objc_loadWeakRetained((id *)&self->__managedTabGroup);
}

- (void)_setManagedTabGroup:(id)a3
{
  objc_storeWeak((id *)&self->__managedTabGroup, a3);
}

- (id)_keyboardAppearedNotificationToken
{
  return self->__keyboardAppearedNotificationToken;
}

- (_UIBarPanGestureRecognizer)_barSwipeHideGesture
{
  return self->__barSwipeHideGesture;
}

- (_UIAnimationCoordinator)_barInteractiveAnimationCoordinator
{
  return self->__barInteractiveAnimationCoordinator;
}

- (_UIBarTapGestureRecognizer)_barTapHideGesture
{
  return self->__barTapHideGesture;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Child view controllers are %@"), "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]", v5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__UINavigationController_StateRestoration__encodeRestorableStateWithCoder___block_invoke;
  v14[3] = &unk_1E16C09E8;
  v7 = v6;
  v15 = v7;
  _UISaveReferencedChildViewControllers(v5, (uint64_t)v14);
  if (-[UINavigationController _allowNestedNavigationControllers](self, "_allowNestedNavigationControllers"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("kAllowsNestedNavigationControllerKey"));
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Navigation controller encoding children %@"), "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]", v7);
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kUIViewControllerChildrenKey"));
  -[UINavigationController topViewController](self, "topViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[UINavigationController topViewController](self, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restorationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (_UIStateRestorationDebugLogEnabled())
      {
        -[UINavigationController topViewController](self, "topViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%s: top View Controller in NavigationController doesn't have restoration identifier, will ignore snapshot on next launch: %@"), "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]", v12);

      }
      objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UINavigationController;
  -[UIViewController encodeRestorableStateWithCoder:](&v13, sel_encodeRestorableStateWithCoder_, v4);

}

BOOL __75__UINavigationController_StateRestoration__encodeRestorableStateWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: Child view controller for navigation controller doesn't have restoration identifier, truncating array: %@"), "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]_block_invoke", v5);
  }

  return v6 != 0;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAllowsNestedNavigationControllerKey")))
    -[UINavigationController _setAllowNestedNavigationControllers:](self, "_setAllowNestedNavigationControllers:", 1);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("kUIViewControllerChildrenKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Navigation controller decoded child ViewController restoration paths %@"), "-[UINavigationController(StateRestoration) decodeRestorableStateWithCoder:]", v8);
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIResponder objectWithRestorationIdentifierPath:](UIResponder, "objectWithRestorationIdentifierPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("Invalid object (not a ViewController) for Child View Controller at index %ld with identifier %@, truncating child array: %@"), v12, v13, v14);
        goto LABEL_15;
      }
      objc_msgSend(v9, "addObject:", v14);

      if (v11 == ++v12)
        goto LABEL_16;
    }
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("Can't find Child View Controller at index %ld with identifier %@, truncating child array"), v12, v13);
LABEL_15:

  }
LABEL_16:
  if (objc_msgSend(v9, "count"))
  {
    -[UINavigationController setViewControllers:](self, "setViewControllers:", v9);
    if ((*(_QWORD *)&self->_navigationControllerFlags & 4) == 0)
      -[UINavigationController _startDeferredTransitionIfNeeded](self, "_startDeferredTransitionIfNeeded");
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    -[UIResponder _restorationIdentifierPath](self, "_restorationIdentifierPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: No child view controllers found for %@: %@"), "-[UINavigationController(StateRestoration) decodeRestorableStateWithCoder:]", v15, self);

  }
  v16.receiver = self;
  v16.super_class = (Class)UINavigationController;
  -[UIResponder decodeRestorableStateWithCoder:](&v16, sel_decodeRestorableStateWithCoder_, v4);

}

- (UIViewController)detailViewController
{
  return 0;
}

- (BOOL)isExpanded
{
  return 0;
}

- (id)_topPalette
{
  return self->_topPalette;
}

- (id)_managedSearchPaletteForEdge:(unint64_t)a3 size:(CGSize)a4
{
  return -[UINavigationController _paletteForEdge:size:paletteClass:](self, "_paletteForEdge:size:paletteClass:", a3, objc_opt_class(), a4.width, a4.height);
}

- (void)_detachPalette:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "boundaryEdge");
  objc_msgSend(v8, "_pinningBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_setShadowAlpha:", (double)(objc_msgSend(v8, "pinningBarShadowWasHidden") ^ 1));
  if (-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
    objc_msgSend(v8, "_setPalettePinningBarHidden:", 0);
  objc_msgSend(v8, "removeFromSuperview");
  if (v4)
  {
    if (v4 != 5 && v4 != 2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Palettes currently can only have a top boundary edge or no boundary edge"));
      goto LABEL_13;
    }
    v6 = 1080;
  }
  else
  {
    v6 = 1096;
  }
  v7 = *(Class *)((char *)&self->super.super.super.isa + v6);
  *(Class *)((char *)&self->super.super.super.isa + v6) = 0;

LABEL_13:
  objc_msgSend(v8, "_setAttached:didComplete:", 0, 1);

}

- (void)detachPalette:(id)a3 isInPaletteTransition:(BOOL)a4
{
  _BOOL8 v4;
  UINavigationController *v6;
  UINavigationController *v7;
  _UINavigationControllerPalette *v8;
  void *v9;
  void *v10;
  _UINavigationControllerPalette *v11;

  v4 = a4;
  v11 = (_UINavigationControllerPalette *)a3;
  -[UINavigationController _outermostNavigationController](self, "_outermostNavigationController");
  v6 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == self)
  {
    if (self->_topPalette == v11
      || self->_freePalette == v11
      || (-[UINavigationDeferredTransitionContext outgoingTopPalette](self->_deferredTransitionContext, "outgoingTopPalette"), v8 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue(), v8, v8 == v11))
    {
      -[_UINavigationControllerPalette _setAttached:didComplete:](v11, "_setAttached:didComplete:", 0, 0);
      if (!v4)
      {
        -[UINavigationController _detachPalette:](self, "_detachPalette:", v11);
        if (!-[UINavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
        {
          -[UINavigationController topViewController](self, "topViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[UINavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v9);

        }
      }
      if (-[_UINavigationControllerPalette _restartPaletteTransitionIfNecessary](self->_topPalette, "_restartPaletteTransitionIfNecessary"))
      {
        -[UIViewController transitionCoordinator](self, "transitionCoordinator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController _startPaletteTransitionIfNecessary:animated:](self, "_startPaletteTransitionIfNecessary:animated:", v10, 0);

      }
    }
  }
  else
  {
    -[UINavigationController detachPalette:isInPaletteTransition:](v6, "detachPalette:isInPaletteTransition:", v11, v4);
  }

}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double MaxY;
  __int128 v7;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  CGRect v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 40), "frame");
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  MaxY = CGRectGetMaxY(v12);
  v9[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_2;
  v9[3] = &unk_1E16B20D8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setFrame:", v3, MaxY, v4, v5);
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return result;
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setRestartPaletteTransitionIfNecessary:", 0);
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void (**v5)(void *, _QWORD);
  char v6;
  double v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD aBlock[4];
  id v26;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1088);
  v4 = a2;
  objc_msgSend(v3, "setClipsToBounds:", 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_6;
  aBlock[3] = &unk_1E16B5C00;
  v26 = *(id *)(a1 + 40);
  v5 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v5[2](v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));
  v5[2](v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104));
  v6 = objc_msgSend(v4, "isCancelled");

  if ((v6 & 1) != 0)
  {
    v7 = 1.0;
    if (!*(_BYTE *)(a1 + 73))
      v7 = 0.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "_setShadowAlpha:", v7);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_attachmentIsChanging"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setAttached:didComplete:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "isAttached") ^ 1, 1);
      v8 = *(id **)(a1 + 32);
      if (*(_BYTE *)(a1 + 74))
      {
        if (*(_BYTE *)(a1 + 73))
        {
          v9 = *(_QWORD *)(a1 + 64);
          v10 = 1;
        }
        else
        {
          v10 = 0;
          v9 = 1;
        }
        objc_msgSend(v8, "_positionTransitioningPalette:outside:edge:preservingYPosition:", v8[135], v10, v9, 1);
      }
      else
      {
        if (*(_BYTE *)(a1 + 73))
          v15 = 0.0;
        else
          v15 = 1.0;
        objc_msgSend(v8[135], "setAlpha:", v15);
      }
      if (*(_BYTE *)(a1 + 75))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "removeFromSuperview");
    }
    v21 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v21 + 1104))
    {
      objc_msgSend(*(id *)(v21 + 1080), "removeFromSuperview");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setAttached:didComplete:", 0, 1);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(*(_QWORD *)(a1 + 32) + 1104));
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 1104);
      *(_QWORD *)(v22 + 1104) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setAttached:didComplete:", 1, 1);
      objc_msgSend(*(id *)(a1 + 32), "_positionTransitioningPalette:outside:edge:preservingYPosition:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080), 0, 1, 1);
    }
    else if (*(_BYTE *)(a1 + 75))
    {
      objc_msgSend(*(id *)(v21 + 1080), "superview");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "removeFromSuperview");
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "isPinned") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "_detachPalette:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));
      }
    }
    goto LABEL_37;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088), *(_QWORD *)(a1 + 48));

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "isAttached") & 1) == 0)
  {
    v13 = *(_QWORD **)(a1 + 32);
    v12 = v13[135];
    if (*(_BYTE *)(a1 + 72))
    {
LABEL_18:
      objc_msgSend(v13, "_detachPalette:", v12);
      goto LABEL_24;
    }
    v14 = (void *)v13[135];
LABEL_23:
    objc_msgSend(v14, "removeFromSuperview", v12);
    goto LABEL_24;
  }
  if (!*(_BYTE *)(a1 + 73)
    || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_attachmentIsChanging"))
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v13 = *(_QWORD **)(a1 + 32);
      v12 = v13[135];
      goto LABEL_18;
    }
    if (*(_BYTE *)(a1 + 73))
      goto LABEL_24;
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "_setAttached:didComplete:", 1, 1);
LABEL_24:
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 1104);
  if (v17)
  {
    objc_msgSend(v17, "removeFromSuperview");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "_setAttached:didComplete:", 0, 1);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 1104);
    *(_QWORD *)(v18 + 1104) = 0;

    v16 = *(_QWORD *)(a1 + 32);
  }
  v20 = 0.0;
  if (!*(_BYTE *)(a1 + 73))
    v20 = 1.0;
  objc_msgSend(*(id *)(v16 + 976), "_setShadowAlpha:", v20);
LABEL_37:

}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = v3;
    v5 = objc_msgSend(v4, "paletteShadowIsHidden");
    v3 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_setShadowAlpha:", 1.0);
      v3 = v6;
    }
  }

}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_7(uint64_t a1, void *a2)
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
  double v14;
  double v15;
  double v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  int v29;
  double MaxY;
  void *v31;
  __int128 v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  double MinX;
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
  double v50;
  id v51;
  id v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
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
  double *p_x;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  id v78;
  double v79;
  double v80;
  uint64_t v81;
  id v82;
  id v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  double v88;
  double v89;
  int8x16_t v90;
  double v91;
  double Width;
  double v93;
  int v94;
  CGFloat rect;
  CGFloat v96;
  CGFloat v97;
  int8x16_t v98;
  CGFloat v99;
  void *v100;
  int v101;
  double v102;
  id v103;
  void *v104;
  _QWORD v105[4];
  int8x16_t v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  _QWORD v119[4];
  id v120;
  char v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  int8x16_t v127;
  id v128;
  uint64_t v129;
  uint64_t *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  _QWORD v135[4];
  id v136;
  char v137;
  _QWORD v138[4];
  id v139;
  id v140;
  uint64_t *v141;
  double v142;
  double v143;
  double v144;
  double v145;
  _QWORD v146[4];
  id v147;
  uint64_t v148;
  id v149;
  id v150;
  id v151;
  id v152;
  uint64_t *v153;
  uint64_t *v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  CGFloat v158;
  uint64_t v159;
  char v160;
  char v161;
  uint64_t v162;
  CGRect *v163;
  uint64_t v164;
  void *v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  double *v169;
  uint64_t v170;
  CGFloat Height;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;

  v103 = a2;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v99 = v13;
  v96 = v15;
  v97 = v14;
  rect = v16;
  v17 = objc_msgSend(*(id *)(a1 + 32), "_hidesShadow");
  if (*(_BYTE *)(a1 + 64))
    v18 = *(void **)(*(_QWORD *)(a1 + 40) + 1080);
  else
    v18 = 0;
  v19 = v18;
  if (objc_msgSend(v19, "_supportsSpecialSearchBarTransitions"))
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;
  objc_msgSend(v21, "viewForAsymmetricFade");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 28;
  if (!*(_BYTE *)(a1 + 64))
    v23 = 27;
  v24 = objc_retain(*(id *)(*(_QWORD *)(a1 + 40)
                          + OBJC_IVAR___UISnapshotModalViewController__disappearingViewController[v23]));
  v104 = v24;
  if (objc_msgSend(v24, "_supportsSpecialSearchBarTransitions"))
    v25 = v24;
  else
    v25 = 0;
  v26 = v25;
  objc_msgSend(v26, "viewForAsymmetricFade");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    v28 = v17;
  else
    v28 = 0;
  if (v28 == 1 && (objc_msgSend(v21, "paletteShadowIsHidden") & 1) == 0)
  {
    if (v24)
      v101 = objc_msgSend(v24, "paletteShadowIsHidden");
    else
      v101 = 1;
  }
  else
  {
    v101 = 0;
  }
  if (v26)
    v29 = v17;
  else
    v29 = 0;
  if (v29 == 1 && (objc_msgSend(v26, "paletteShadowIsHidden") & 1) == 0)
  {
    if (v19)
      v94 = objc_msgSend(v19, "paletteShadowIsHidden");
    else
      v94 = 1;
  }
  else
  {
    v94 = 0;
  }
  if ((v22 != 0) != (v27 != 0))
  {
    v172.origin.x = v99;
    v172.size.width = v96;
    v172.origin.y = v97;
    v172.size.height = rect;
    MaxY = CGRectGetMaxY(v172);
    v173.origin.x = v6;
    v173.origin.y = v8;
    v173.size.width = v10;
    v173.size.height = v12;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = MaxY >= CGRectGetMaxY(v173);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1088), "superview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1088), *(_QWORD *)(a1 + 32));

    }
  }
  v168 = 0;
  v169 = (double *)&v168;
  v170 = 0x2020000000;
  Height = 0.0;
  objc_msgSend(v19, "frame");
  Height = CGRectGetHeight(v174);
  v162 = 0;
  v163 = (CGRect *)&v162;
  v164 = 0x4010000000;
  v165 = &unk_18685B0AF;
  v32 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v166 = *MEMORY[0x1E0C9D648];
  v167 = v32;
  if (v19)
  {
    v146[0] = MEMORY[0x1E0C809B0];
    v146[1] = 3221225472;
    v146[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_8;
    v146[3] = &unk_1E16C0AA8;
    v33 = v19;
    v34 = *(_QWORD *)(a1 + 40);
    v147 = v33;
    v148 = v34;
    v153 = &v168;
    v160 = v101;
    v149 = v21;
    v150 = *(id *)(a1 + 32);
    v161 = *(_BYTE *)(a1 + 65);
    v151 = v22;
    v154 = &v162;
    v155 = v6;
    v156 = v8;
    v157 = v10;
    v158 = v12;
    v35 = v27;
    v36 = *(_QWORD *)(a1 + 56);
    v152 = v35;
    v159 = v36;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v146);

  }
  if (*(_BYTE *)(a1 + 65))
  {
    if (v22 && v169[3] > 0.0)
    {
      MinX = CGRectGetMinX(v163[1]);
      v175.origin.x = v99;
      v175.size.width = v96;
      v175.origin.y = v97;
      v175.size.height = rect;
      v38 = CGRectGetMaxY(v175);
      Width = CGRectGetWidth(v163[1]);
      v89 = v169[3];
      objc_msgSend(v22, "frame");
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v47 = v169[3];
      v48 = CGRectGetHeight(v163[1]);
      objc_msgSend(v21, "_searchBar");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "backgroundColor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v47 - v48;

      v138[0] = MEMORY[0x1E0C809B0];
      v138[1] = 3221225472;
      v138[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_9;
      v138[3] = &unk_1E16C0AD0;
      v51 = v21;
      v139 = v51;
      v141 = &v162;
      v52 = v22;
      v140 = v52;
      v142 = v40;
      v143 = v42 - v50;
      v144 = v44;
      v145 = v46;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v138);
      objc_msgSend(v51, "setFrame:", MinX, v38, Width, v89);
      v53 = v50 + v42 - v50;
      objc_msgSend(v52, "setFrame:", v40, v53, v44, v46);
      objc_msgSend(v103, "transitionDuration");
      v55 = v54;
      v56 = MEMORY[0x1E0C809B0];
      v135[0] = MEMORY[0x1E0C809B0];
      v135[1] = 3221225472;
      v135[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_10;
      v135[3] = &unk_1E16B1B78;
      v136 = v52;
      v137 = *(_BYTE *)(a1 + 66);
      v124[0] = v56;
      v124[1] = 3221225472;
      v124[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_13;
      v124[3] = &unk_1E16C0B20;
      v125 = v51;
      v57 = v87;
      v58 = *(_QWORD *)(a1 + 48);
      v126 = v57;
      v129 = v58;
      v90 = *(int8x16_t *)(a1 + 32);
      v59 = (id)v90.i64[0];
      v127 = vextq_s8(v90, v90, 8uLL);
      v128 = v136;
      v130 = &v168;
      v131 = v40;
      v132 = v53;
      v133 = v44;
      v134 = v46;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v135, v124, v55, 0.0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_positionTransitioningPalette:outside:edge:preservingYPosition:", v19, 0, 1, 0);
    }
    if (v101)
      objc_msgSend(v21, "_setShadowAlpha:", 1.0);
    if (v27)
    {
      objc_msgSend(v27, "frame");
      v102 = v60;
      v93 = v61;
      v88 = v63;
      v91 = v62;
      objc_msgSend(v26, "frame");
      v65 = v64;
      v67 = v66;
      v69 = v68;
      p_x = &v163->origin.x;
      v163[1].origin.x = v64;
      *((_QWORD *)p_x + 5) = v71;
      v86 = v71;
      p_x[6] = v66;
      p_x[7] = v68;
      v176.origin.x = v99;
      v176.size.width = v96;
      v176.origin.y = v97;
      v176.size.height = rect;
      v72 = CGRectGetMaxY(v176);
      v73 = CGRectGetHeight(v163[1]);
      if (v22)
        v74 = v69;
      else
        v74 = 0.0;
      v177.origin.x = v65;
      v177.origin.y = v72;
      v177.size.width = v67;
      v177.size.height = v74;
      v75 = CGRectGetHeight(v177);
      v100 = v22;
      objc_msgSend(v26, "_searchBar");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "backgroundColor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      v122[0] = MEMORY[0x1E0C809B0];
      v122[1] = 3221225472;
      v122[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_15;
      v122[3] = &unk_1E16B1B28;
      v78 = v26;
      v123 = v78;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v122);
      objc_msgSend(v78, "_pushDisableLayoutFlushingForTransition");
      objc_msgSend(v78, "setFrame:", v65, v72, v67, v74);
      objc_msgSend(v27, "setFrame:", v102, v93 - (v73 - v75), v91, v88);
      objc_msgSend(v103, "transitionDuration");
      v80 = v79;
      v81 = MEMORY[0x1E0C809B0];
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_16;
      v119[3] = &unk_1E16B1B78;
      v121 = *(_BYTE *)(a1 + 66);
      v120 = v27;
      v105[0] = v81;
      v105[1] = 3221225472;
      v105[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_18;
      v105[3] = &unk_1E16C0B70;
      v110 = *(_QWORD *)(a1 + 48);
      v98 = *(int8x16_t *)(a1 + 32);
      v82 = (id)v98.i64[0];
      v106 = vextq_s8(v98, v98, 8uLL);
      v107 = v78;
      v83 = v77;
      v108 = v83;
      v109 = v120;
      v111 = v65;
      v112 = v86;
      v113 = v67;
      v114 = v69;
      v115 = v102;
      v116 = v93;
      v117 = v91;
      v118 = v88;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v119, v105, v80, 0.0);

      v22 = v100;
    }
    else if (v104)
    {
      if (*(_QWORD *)(a1 + 56) == 2)
        v85 = 8;
      else
        v85 = 2;
      objc_msgSend(*(id *)(a1 + 40), "_positionTransitioningPalette:outside:edge:preservingYPosition:", v104, 1, v85, 1);
    }
    if (v94)
      objc_msgSend(v26, "_setShadowAlpha:", 0.0);
  }
  else
  {
    v84 = 1.0;
    if (!*(_BYTE *)(a1 + 64))
      v84 = 0.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "setAlpha:", v84);
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 40), "_positionTransitioningPalette:outside:edge:preservingYPosition:", v21, 0, 1, 0);
      objc_msgSend(v21, "setAlpha:", 1.0);
    }
    if (v26)
    {
      objc_msgSend(*(id *)(a1 + 40), "_positionTransitioningPalette:outside:edge:preservingYPosition:", v26, 0, 1, 1);
      objc_msgSend(v26, "setAlpha:", 0.0);
    }
  }
  _Block_object_dispose(&v162, 8);
  _Block_object_dispose(&v168, 8);

}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CGRect v19;

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllAnimations");

    objc_msgSend(*(id *)(a1 + 40), "_frameForPalette:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
    objc_msgSend(*(id *)(a1 + 32), "frame");
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = CGRectGetHeight(v19);
    if (*(_BYTE *)(a1 + 136))
      objc_msgSend(*(id *)(a1 + 48), "_setShadowAlpha:", 0.0);
    v4 = *(void **)(a1 + 48);
    if (v4)
    {
      objc_msgSend(v4, "_searchBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "backgroundImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(*(id *)(a1 + 56), "backgroundImageForBarMetrics:", objc_msgSend(*(id *)(a1 + 56), "_activeBarMetrics"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "size");
          if (v10 == *MEMORY[0x1E0C9D820] && v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
          {
            objc_msgSend(*(id *)(a1 + 48), "_searchBar");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setBackgroundImage:", v8);

          }
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_installPaletteIntoViewHierarchy:", *(_QWORD *)(a1 + 32));
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) > 0.0)
      objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  if (!*(_BYTE *)(a1 + 137))
  {
    v17 = *(void **)(a1 + 32);
    return objc_msgSend(v17, "setAlpha:", 0.0);
  }
  if (!*(_QWORD *)(a1 + 64))
    return objc_msgSend(*(id *)(a1 + 40), "_positionTransitioningPalette:outside:edge:preservingYPosition:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 128), 0);
  objc_msgSend(*(id *)(a1 + 48), "frame");
  v12 = *(_QWORD **)(*(_QWORD *)(a1 + 88) + 8);
  v12[4] = v13;
  v12[5] = v14;
  v12[6] = v15;
  v12[7] = v16;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = CGRectGetMaxY(*(CGRect *)(a1 + 96));
  if (!*(_QWORD *)(a1 + 72))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 56) = 0;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) > 0.0)
  {
    v17 = *(void **)(a1 + 64);
    return objc_msgSend(v17, "setAlpha:", 0.0);
  }
  return objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 56));
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_9(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_pushDisableLayoutFlushingForTransition");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "_searchBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", 0);

}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  double v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_11;
  v6[3] = &unk_1E16B1B28;
  v7 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, 0.0, 0.01);
  v3 = dbl_18667A210[*(_BYTE *)(a1 + 40) == 0];
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_12;
  v4[3] = &unk_1E16B1B28;
  v5 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, v3, 1.0 - v3);

}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD aBlock[4];
  id v17;
  id v18[5];
  __int128 v19;
  __int128 v20;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_popDisableLayoutFlushingForTransition");
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1088), "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1088), *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 64), "alpha");
  if (v5 != 1.0)
  {
    objc_msgSend(*(id *)(a1 + 48), "_frameForPalette:", *(_QWORD *)(a1 + 32));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_initWeak(&location, *(id *)(a1 + 32));
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_14;
    aBlock[3] = &unk_1E16C0AF8;
    objc_copyWeak(v18, &location);
    v18[1] = v7;
    v18[2] = v9;
    v18[3] = v11;
    v18[4] = v12;
    v17 = *(id *)(a1 + 64);
    v13 = *(_OWORD *)(a1 + 104);
    v19 = *(_OWORD *)(a1 + 88);
    v20 = v13;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(*(id *)(a1 + 32), "setResetAfterSearchFieldFade:", v14);
    else
      v14[2](v14);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_14(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id WeakRetained;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_15(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_searchBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", 0);

}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_16(uint64_t a1)
{
  double v1;
  _QWORD v2[4];
  id v3;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.25;
  else
    v1 = 0.1;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_17;
  v2[3] = &unk_1E16B1B28;
  v3 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, 0.0, v1);

}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  __int128 v6;
  __int128 v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id location;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 48), "_popDisableLayoutFlushingForTransition");
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "_searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(*(id *)(a1 + 64), "alpha");
  if (v5 != 1.0)
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_19;
    v13 = &unk_1E16C0B48;
    v14 = *(id *)(a1 + 64);
    objc_copyWeak(&v16, &location);
    v6 = *(_OWORD *)(a1 + 96);
    v17 = *(_OWORD *)(a1 + 80);
    v18 = v6;
    v7 = *(_OWORD *)(a1 + 128);
    v19 = *(_OWORD *)(a1 + 112);
    v20 = v7;
    v15 = *(id *)(a1 + 48);
    v8 = (void (**)(_QWORD))_Block_copy(&v10);
    objc_msgSend(*(id *)(a1 + 48), "window", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(*(id *)(a1 + 48), "setResetAfterSearchFieldFade:", v8);
    else
      v8[2](v8);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_19(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(double *)(a1 + 56);
  v3 = *(double *)(a1 + 64);
  v4 = *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  return objc_msgSend(*(id *)(a1 + 40), "_setShadowAlpha:", 1.0);
}

- (void)_prepareCollectionViewController:(id)a3 forSharingWithCollectionViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v10, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "_uiCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_uiCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is configured to share a different collection view than %@"), v10, v5);
  }
  else
  {
    objc_msgSend(v10, "_clearSharedView");
    objc_msgSend(v10, "_setUsesSharedView:", 1);
    objc_msgSend(v5, "_uiCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSharedCollectionView:", v9);

  }
}

- (void)_prepareCollectionViewControllerForSharing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UINavigationController topViewController](self, "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController _prepareCollectionViewController:forSharingWithCollectionViewController:](self, "_prepareCollectionViewController:forSharingWithCollectionViewController:", v4, v5);

}

- (void)_prepareCollectionViewControllers:(id)a3 forSharingInRange:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "firstIndex");
  v8 = objc_msgSend(v6, "indexGreaterThanIndex:", v7);
  objc_msgSend(v17, "objectAtIndex:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_uiCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v9 != v10 && (isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "_uiCollectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDataSource:", v9);

      objc_msgSend(v9, "_uiCollectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layoutIfNeeded");

    }
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      objc_msgSend(v17, "objectAtIndex:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController _prepareCollectionViewController:forSharingWithCollectionViewController:](self, "_prepareCollectionViewController:forSharingWithCollectionViewController:", v15, v14);
      v16 = objc_msgSend(v6, "indexGreaterThanIndex:", v8);

      v7 = v8;
      v8 = v16;
    }
    while (v16 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)_stopTransitionsImmediately
{
  -[_UIViewControllerTransitionConductor stopTransitionsImmediately](self->_transitionConductor, "stopTransitionsImmediately");
}

- (id)_effectiveActivityItemsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  -[UIResponder _effectiveActivityItemsConfiguration](&v7, sel__effectiveActivityItemsConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UINavigationController viewControllers](self, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_effectiveActivityItemsConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
