@implementation _UISheetLayoutInfo

- (BOOL)_wantsFullScreen
{
  return self->__wantsFullScreen;
}

- (int64_t)_indexOfCurrentActiveOrDismissDetent
{
  void *v3;

  if ((*((_BYTE *)&self->_clean + 3) & 0x40) == 0)
  {
    if (-[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented")
      || -[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally"))
    {
      self->__indexOfCurrentActiveOrDismissDetent = -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent");
    }
    else
    {
      -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      self->__indexOfCurrentActiveOrDismissDetent = objc_msgSend(v3, "count") - 1;

    }
    *(_QWORD *)&self->_clean |= 0x40000000uLL;
  }
  return self->__indexOfCurrentActiveOrDismissDetent;
}

- (int64_t)_indexOfCurrentActiveDetent
{
  id v3;

  v3 = -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
  return self->__indexOfCurrentActiveDetent;
}

- (void)set_rubberBandExtentBeyondMinimumOffsetWasInvalidated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void)set_rubberBandExtentBeyondMaximumOffsetWasInvalidated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)set_indexOfCurrentActiveOrDismissDetentWasInvalidated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)_setCurrentOffsetGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (BOOL)_isInverted
{
  BOOL result;

  if ((*((_BYTE *)&self->_clean + 2) & 2) != 0)
    return self->__inverted;
  result = !-[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached")
        && -[_UISheetLayoutInfo _wantsInvertedWhenFloating](self, "_wantsInvertedWhenFloating");
  self->__inverted = result;
  *(_QWORD *)&self->_clean |= 0x20000uLL;
  return result;
}

- (BOOL)_wantsGrabber
{
  return self->__wantsGrabber;
}

- (BOOL)_shouldDimmingIgnoreTouches
{
  _BOOL4 v3;
  double v4;
  double v5;
  double Height;
  double v7;
  BOOL result;
  double v9;
  double Width;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  if ((*((_BYTE *)&self->_clean + 14) & 0x40) != 0)
    return self->__shouldDimmingIgnoreTouches;
  if (-[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached"))
  {
    v3 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
    -[_UISheetLayoutInfo _currentOffset](self, "_currentOffset");
    v5 = v4;
    if (v3)
    {
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
      Height = CGRectGetHeight(v11);
      -[_UISheetLayoutInfo _margins](self, "_margins");
      if (v5 < Height - v7)
        goto LABEL_12;
      goto LABEL_10;
    }
    -[_UISheetLayoutInfo _margins](self, "_margins");
    if (v5 <= v9)
    {
LABEL_10:
      -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
      Width = CGRectGetWidth(v12);
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
      if (Width != CGRectGetWidth(v13)
        && -[_UISheetLayoutInfo _shouldDismissWhenTappedOutside](self, "_shouldDismissWhenTappedOutside"))
      {
        goto LABEL_12;
      }
LABEL_13:
      result = 1;
      goto LABEL_14;
    }
  }
  else if (!-[_UISheetLayoutInfo _shouldDismissWhenTappedOutside](self, "_shouldDismissWhenTappedOutside"))
  {
    goto LABEL_13;
  }
LABEL_12:
  result = -[_UISheetLayoutInfo _isDragging](self, "_isDragging");
LABEL_14:
  self->__shouldDimmingIgnoreTouches = result;
  *((_DWORD *)&self->_clean + 3) |= 0x400000u;
  return result;
}

- (BOOL)_isDimmingEnabled
{
  double v3;
  BOOL result;

  if ((*((_BYTE *)&self->_clean + 15) & 1) != 0)
    return self->__dimmingEnabled;
  -[_UISheetLayoutInfo _percentDimmedFromOffset](self, "_percentDimmedFromOffset");
  result = v3 > 0.0;
  self->__dimmingEnabled = v3 > 0.0;
  *((_DWORD *)&self->_clean + 3) |= 0x1000000u;
  return result;
}

- (BOOL)_insetsContentViewForGrabber
{
  return self->__insetsContentViewForGrabber;
}

- (double)_grabberSpacing
{
  return self->__grabberSpacing;
}

- (BOOL)_isFunctionallyFullScreen
{
  BOOL result;

  if ((*((_BYTE *)&self->_clean + 2) & 8) != 0)
    return self->__functionallyFullScreen;
  result = -[_UISheetLayoutInfo _isForcedFullScreen](self, "_isForcedFullScreen")
        || -[_UISheetLayoutInfo _wantsFullScreen](self, "_wantsFullScreen");
  self->__functionallyFullScreen = result;
  *(_QWORD *)&self->_clean |= 0x80000uLL;
  return result;
}

- (UIEdgeInsets)_margins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double top;
  double left;
  double bottom;
  double right;
  double v28;
  double v29;
  UIEdgeInsets result;

  if ((*(_BYTE *)&self->_clean & 0x80) == 0)
  {
    if (-[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached"))
    {
      -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
      v28 = v4;
      v29 = v3;
      v6 = v5;
      v8 = v7;
      -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISheetLayoutInfo _marginInCompactHeight](self, "_marginInCompactHeight");
      v11 = v10;
      -[_UISheetLayoutInfo _marginInRegularWidthRegularHeight](self, "_marginInRegularWidthRegularHeight");
      v13 = v12;
      v14 = -[_UISheetLayoutInfo _tucksIntoUnsafeAreaInCompactHeight](self, "_tucksIntoUnsafeAreaInCompactHeight");
      -[_UISheetLayoutInfo _unsafeInsets](self, "_unsafeInsets");
      v15 = -[_UISheetLayoutInfo _allowsAsymmetricVerticalMargins](self, "_allowsAsymmetricVerticalMargins");
      -[_UISheetLayoutInfo _metrics](self, "_metrics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->__margins.top = _UISheetLayoutInfoMargins(v9, 1, v14, v15, v16, v29, v28, v6, v8, v11, v13);
      self->__margins.left = v17;
      self->__margins.bottom = v18;
      self->__margins.right = v19;

    }
    else
    {
      -[_UISheetLayoutInfo _marginsWhenFloating](self, "_marginsWhenFloating");
      self->__margins.top = v20;
      self->__margins.left = v21;
      self->__margins.bottom = v22;
      self->__margins.right = v23;
    }
    *(_QWORD *)&self->_clean |= 0x80uLL;
  }
  top = self->__margins.top;
  left = self->__margins.left;
  bottom = self->__margins.bottom;
  right = self->__margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (BOOL)_isInteractionEnabled
{
  double v3;
  void *v4;
  BOOL v5;

  if ((*((_BYTE *)&self->_clean + 14) & 8) == 0)
  {
    if ((-[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented")
       || -[_UISheetLayoutInfo _presentsWithGesture](self, "_presentsWithGesture"))
      && ((-[_UISheetLayoutInfo _percentFullScreen](self, "_percentFullScreen"), v3 != 1.0)
       || -[_UISheetLayoutInfo _allowsInteractiveDismissWhenFullScreen](self, "_allowsInteractiveDismissWhenFullScreen")))
    {
      if (-[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally"))
      {
        -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        self->__interactionEnabled = objc_msgSend(v4, "count") != 1;

LABEL_11:
        *((_DWORD *)&self->_clean + 3) |= 0x80000u;
        return self->__interactionEnabled;
      }
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
    self->__interactionEnabled = v5;
    goto LABEL_11;
  }
  return self->__interactionEnabled;
}

- (double)_shadowOpacity
{
  double v3;
  double v4;
  BOOL v5;
  double result;
  double v7;
  double v8;
  double v9;

  if ((*((_BYTE *)&self->_clean + 14) & 2) != 0)
    return self->__shadowOpacity;
  -[_UISheetLayoutInfo _percentDimmedFromOffset](self, "_percentDimmedFromOffset");
  v4 = v3;
  v5 = -[_UISheetLayoutInfo _isHosting](self, "_isHosting");
  result = 0.0;
  if (!v5)
  {
    -[_UISheetLayoutInfo _preferredShadowOpacity](self, "_preferredShadowOpacity");
    v8 = (1.0 - v4) * v7;
    -[_UISheetLayoutInfo _percentPresented](self, "_percentPresented");
    result = v8 * v9;
  }
  self->__shadowOpacity = result;
  *((_DWORD *)&self->_clean + 3) |= 0x20000u;
  return result;
}

- (double)_magicShadowOpacity
{
  -[_UISheetLayoutInfo _percentDimmed](self, "_percentDimmed");
  return self->__magicShadowOpacity;
}

- (double)_percentDimmed
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;

  if ((*((_BYTE *)&self->_clean + 14) & 1) == 0)
  {
    if (-[_UISheetPresentationMetrics wantsDimming](self->__metrics, "wantsDimming"))
    {
      -[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_percentFullScreen");
      v5 = v4;
      -[_UISheetLayoutInfo _percentDimmedFromOffset](self, "_percentDimmedFromOffset");
      v7 = v6;
      if (objc_msgSend(v3, "_stacksWithChild"))
      {
        self->__percentDimmed = 0.0;
        if (v5 != 1.0
          || -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached")
          && objc_msgSend(v3, "_scalesDownBehindDescendants"))
        {
          v8 = 0.0;
          if (-[_UISheetLayoutInfo _stacksWithChild](self, "_stacksWithChild"))
          {
            -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "_percentDimmedFromOffset");
            v8 = v10 * 0.2;

          }
          v7 = v7 * 0.6 + v8;
        }
        self->__confinedPercentDimmed = v7;
        v11 = 0.0;
      }
      else
      {
        if (v5 == 1.0)
        {
          self->__percentDimmed = 0.0;
          self->__confinedPercentDimmed = v7;
        }
        else
        {
          self->__percentDimmed = v7;
          self->__confinedPercentDimmed = 0.0;
        }
        v11 = 0.0;
        if (!-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
        {
          -[_UISheetLayoutInfo _percentFullScreen](self, "_percentFullScreen");
          if (v12 != 1.0)
            v11 = v7;
        }
      }
      self->__magicShadowOpacity = v11;
      objc_msgSend(v3, "_presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0.0;
      if (v14 && objc_msgSend(v14, "userInterfaceStyle") == 2)
      {
        if (objc_msgSend(v14, "userInterfaceLevel"))
          v15 = 0.0;
        else
          v15 = 1.0 - v5;
      }
      self->__confinedPercentLightened = v15;

    }
    else
    {
      self->__confinedPercentLightened = 0.0;
      self->__percentDimmed = 0.0;
      self->__confinedPercentDimmed = 0.0;
    }
    *((_DWORD *)&self->_clean + 3) |= 0x10000u;
  }
  return self->__percentDimmed;
}

- (CGRect)_hostedFrameOfPresentedViewInContainerView
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
    -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
  else
    -[_UISheetLayoutInfo _frameOfPresentedViewInContainerView](self, "_frameOfPresentedViewInContainerView");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_isHosting
{
  return self->__hosting;
}

- (UIRectCornerRadii)_hostedCornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  if ((*((_BYTE *)&self->_clean + 13) & 0x20) != 0)
  {
    topLeft = self->__hostedCornerRadii.topLeft;
    bottomLeft = self->__hostedCornerRadii.bottomLeft;
    bottomRight = self->__hostedCornerRadii.bottomRight;
    topRight = self->__hostedCornerRadii.topRight;
  }
  else
  {
    if (-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
    {
      topLeft = 1.79769313e308;
      bottomLeft = 1.79769313e308;
      bottomRight = 1.79769313e308;
      topRight = 1.79769313e308;
    }
    else
    {
      -[_UISheetLayoutInfo _cornerRadii](self, "_cornerRadii");
    }
    self->__hostedCornerRadii.topLeft = topLeft;
    self->__hostedCornerRadii.bottomLeft = bottomLeft;
    self->__hostedCornerRadii.bottomRight = bottomRight;
    self->__hostedCornerRadii.topRight = topRight;
    *((_DWORD *)&self->_clean + 3) |= 0x2000u;
  }
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (double)_grabberAlpha
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double result;
  double v8;

  if ((*((_BYTE *)&self->_clean + 15) & 2) != 0)
    return self->__grabberAlpha;
  v3 = 0.0;
  if (-[_UISheetLayoutInfo _wantsGrabber](self, "_wantsGrabber")
    && !-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
  {
    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_percentDimmedFromOffset");
      v3 = 1.0 - v6;

    }
    else
    {
      v3 = 1.0;
    }
  }
  -[_UISheetLayoutInfo _percentFullScreen](self, "_percentFullScreen");
  result = v3 * (1.0 - v8);
  self->__grabberAlpha = result;
  *((_DWORD *)&self->_clean + 3) |= 0x2000000u;
  return result;
}

- (double)_confinedPercentLightened
{
  return self->__confinedPercentLightened;
}

- (double)_confinedPercentDimmed
{
  -[_UISheetLayoutInfo _percentDimmed](self, "_percentDimmed");
  return self->__confinedPercentDimmed;
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  _BOOL4 v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double MinY;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  if ((*((_BYTE *)&self->_clean + 14) & 0x20) != 0)
  {
    return self->__shouldPresentedViewControllerControlStatusBarAppearance;
  }
  else
  {
    if (-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
    {
      v3 = 0;
    }
    else
    {
      -[_UISheetLayoutInfo _untransformedFrame](self, "_untransformedFrame");
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
      MidX = CGRectGetMidX(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      MidY = CGRectGetMidY(v25);
      memset(&v23, 0, sizeof(v23));
      CGAffineTransformMakeTranslation(&t1, -MidX, -MidY);
      -[_UISheetLayoutInfo _transform](self, "_transform");
      CGAffineTransformConcat(&v22, &t1, &t2);
      CGAffineTransformMakeTranslation(&v19, MidX, MidY);
      CGAffineTransformConcat(&v23, &v22, &v19);
      v18 = v23;
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v27 = CGRectApplyAffineTransform(v26, &v18);
      MinY = CGRectGetMinY(v27);
      -[_UISheetLayoutInfo _containerView](self, "_containerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "statusBarManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultStatusBarHeight");
      v16 = v15 * 0.5;

      v3 = MinY <= v16;
    }
    self->__shouldPresentedViewControllerControlStatusBarAppearance = v3;
    *((_DWORD *)&self->_clean + 3) |= 0x200000u;
  }
  return v3;
}

- (CGAffineTransform)_transform
{
  void *v3;
  CGAffineTransform *v4;
  CGAffineTransform *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
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
  double MinY;
  double v25;
  double v26;
  int v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  CGFloat v33;
  CGFloat v34;
  _OWORD v35[3];
  CGRect v36;

  v4 = self;
  if ((BYTE5(self->c) & 0x40) == 0)
  {
    v6 = self + 28;
    v7 = -[CGAffineTransform _isHosting](self, "_isHosting");
    if (v7
      && (-[CGAffineTransform _childLayoutInfo](v4, "_childLayoutInfo"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v30 = MEMORY[0x1E0C9BAA8];
      v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v6->a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v4[28].c = v31;
      *(_OWORD *)&v4[28].tx = *(_OWORD *)(v30 + 32);
    }
    else
    {
      -[CGAffineTransform _presentedViewController](v4, "_presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CGAffineTransform _untransformedFrame](v4, "_untransformedFrame");
      v33 = v11;
      v34 = v10;
      v13 = v12;
      v15 = v14;
      -[CGAffineTransform _fullHeightUntransformedFrameForDepthLevel](v4, "_fullHeightUntransformedFrameForDepthLevel");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[CGAffineTransform _stackAlignmentFrame](v4, "_stackAlignmentFrame");
      MinY = CGRectGetMinY(v36);
      -[CGAffineTransform _depthLevel](v4, "_depthLevel");
      v26 = v25;
      if ((-[CGAffineTransform _isEdgeAttached](v4, "_isEdgeAttached") & 1) != 0)
        v27 = 1;
      else
        v27 = -[CGAffineTransform _peeksWhenFloating](v4, "_peeksWhenFloating");
      -[CGAffineTransform _metrics](v4, "_metrics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _UISheetTransformForMetrics((uint64_t)v35, v9, v27, v28, v34, v33, v13, v15, v17, v19, v21, v23, MinY, v26);
      v29 = v35[1];
      *(_OWORD *)&v6->a = v35[0];
      *(_OWORD *)&v4[28].c = v29;
      *(_OWORD *)&v4[28].tx = v35[2];

      if (!v7)
        goto LABEL_11;
    }

LABEL_11:
    HIDWORD(v4->c) |= 0x4000u;
  }
  v32 = *(_OWORD *)&v4[28].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v4[28].a;
  *(_OWORD *)&retstr->c = v32;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v4[28].tx;
  return self;
}

- (CGRect)_fullHeightUntransformedFrameForDepthLevel
{
  double v3;
  double v4;
  double v5;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*((_BYTE *)&self->_clean + 3) & 2) != 0)
  {
    x = self->__fullHeightUntransformedFrameForDepthLevel.origin.x;
    y = self->__fullHeightUntransformedFrameForDepthLevel.origin.y;
    width = self->__fullHeightUntransformedFrameForDepthLevel.size.width;
    height = self->__fullHeightUntransformedFrameForDepthLevel.size.height;
  }
  else
  {
    if (-[_UISheetLayoutInfo _stacksWithParent](self, "_stacksWithParent")
      && (-[_UISheetLayoutInfo _parentDepthLevel](self, "_parentDepthLevel"),
          v4 = v3,
          -[_UISheetLayoutInfo _depthLevel](self, "_depthLevel"),
          v4 == v5))
    {
      -[_UISheetLayoutInfo _parentFullHeightUntransformedFrameForDepthLevel](self, "_parentFullHeightUntransformedFrameForDepthLevel");
    }
    else
    {
      -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
    }
    self->__fullHeightUntransformedFrameForDepthLevel.origin.x = x;
    self->__fullHeightUntransformedFrameForDepthLevel.origin.y = y;
    self->__fullHeightUntransformedFrameForDepthLevel.size.width = width;
    self->__fullHeightUntransformedFrameForDepthLevel.size.height = height;
    *(_QWORD *)&self->_clean |= 0x2000000uLL;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIRectCornerRadii)_cornerRadii
{
  void *v3;
  double v4;
  double v5;
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
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double Width;
  double v46;
  _BOOL4 v47;
  double v48;
  double v49;
  _BOOL4 v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  BOOL v58;
  double v59;
  double v60;
  double v61;
  BOOL v62;
  double v63;
  double v64;
  double v65;
  BOOL v66;
  double v67;
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  UIRectCornerRadii result;

  if ((*((_BYTE *)&self->_clean + 13) & 0x10) == 0)
  {
    -[_UISheetLayoutInfo _metrics](self, "_metrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cornerRadius");
    v5 = v4;

    -[_UISheetLayoutInfo _containerView](self, "_containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_effectiveUISettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cornerRadiusConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cornerRadii");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[_UISheetLayoutInfo _depthLevel](self, "_depthLevel");
    v74 = v20;
    -[_UISheetLayoutInfo _percentFullScreen](self, "_percentFullScreen");
    v75 = v21;
    -[_UISheetLayoutInfo _percentPresented](self, "_percentPresented");
    v73 = v22;
    -[_UISheetLayoutInfo _preferredCornerRadius](self, "_preferredCornerRadius");
    if (v23 == 1.79769313e308)
      v24 = v5;
    else
      v24 = v23;
    -[_UISheetLayoutInfo _dismissCornerRadius](self, "_dismissCornerRadius");
    if (v25 == 1.79769313e308)
      v25 = v24;
    v76 = v25;
    if (v11)
    {
      objc_msgSend(v10, "topLeft");
      if (v13 != 1.79769313e308)
        v26 = v13;
      v27 = v19;
      v28 = v5 * 0.5;
      v72 = v5 * 0.5 + fmax(v5, v26) * 0.5;
      objc_msgSend(v10, "bottomLeft");
      if (v15 != 1.79769313e308)
        v29 = v15;
      v30 = v28 + fmax(v5, v29) * 0.5;
      objc_msgSend(v10, "bottomRight");
      if (v17 != 1.79769313e308)
        v31 = v17;
      v32 = v28 + fmax(v5, v31) * 0.5;
      objc_msgSend(v10, "topRight");
      v34 = v72;
      if (v27 != 1.79769313e308)
        v33 = v27;
      v35 = v28 + fmax(v5, v33) * 0.5;
    }
    else
    {
      v35 = v5 * 0.5 + v24 * 0.5;
      v32 = v35;
      v34 = v35;
      v30 = v35;
    }
    v36 = v74;
    v37 = fmax(fmin(v74, 1.0), 0.0);
    v38 = (1.0 - v37) * v24;
    v39 = v38 + v37 * v34;
    v40 = v38 + v37 * v30;
    v41 = v38 + v37 * v32;
    v42 = v38 + v37 * v35;
    v43 = v75;
    if (-[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached"))
    {
      v44 = v73;
      if (v74 == 0.0)
      {
        -[_UISheetLayoutInfo _untransformedFrame](self, "_untransformedFrame");
        Width = CGRectGetWidth(v77);
        -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
        v53 = Width == CGRectGetWidth(v78);
        v36 = v74;
        if (v53)
          v46 = 1.79769313e308;
        else
          v46 = 0.0;
        v47 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
        if (v47)
          v42 = v46;
        else
          v41 = v46;
        if (v47)
          v39 = v46;
        else
          v40 = v46;
        v43 = v75;
      }
    }
    else
    {
      v44 = v73;
    }
    if (-[_UISheetLayoutInfo _isExpanded](self, "_isExpanded") && v36 == 0.0)
    {
      -[_UISheetLayoutInfo _untransformedFrame](self, "_untransformedFrame");
      v48 = CGRectGetWidth(v79);
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
      if (v48 == CGRectGetWidth(v80))
        v49 = 1.79769313e308;
      else
        v49 = 0.0;
      v50 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
      if (v50)
        v41 = v49;
      else
        v42 = v49;
      if (v50)
        v40 = v49;
      else
        v39 = v49;
      v43 = v75;
    }
    objc_msgSend(v10, "topLeft");
    v52 = 1.79769313e308;
    v53 = v39 == 1.79769313e308 || v43 == 1.0;
    v54 = 1.0 - v43;
    v55 = (1.0 - v43) * v39 + v43 * v51;
    if (v53)
      v55 = 1.79769313e308;
    if (v44 != 1.0 || v55 != 1.79769313e308)
    {
      if (v55 != 1.79769313e308)
        v51 = v55;
      v52 = (1.0 - v44) * v76 + v44 * v51;
    }
    objc_msgSend(v10, "bottomLeft");
    v57 = 1.79769313e308;
    v58 = v40 == 1.79769313e308 || v43 == 1.0;
    v59 = v54 * v40 + v43 * v56;
    if (v58)
      v59 = 1.79769313e308;
    if (v44 != 1.0 || v59 != 1.79769313e308)
    {
      if (v59 != 1.79769313e308)
        v56 = v59;
      v57 = (1.0 - v44) * v76 + v44 * v56;
    }
    objc_msgSend(v10, "bottomRight");
    v61 = 1.79769313e308;
    v62 = v41 == 1.79769313e308 || v43 == 1.0;
    v63 = v54 * v41 + v43 * v60;
    if (v62)
      v63 = 1.79769313e308;
    if (v44 != 1.0 || v63 != 1.79769313e308)
    {
      if (v63 != 1.79769313e308)
        v60 = v63;
      v61 = (1.0 - v44) * v76 + v44 * v60;
    }
    objc_msgSend(v10, "topRight");
    v65 = 1.79769313e308;
    v66 = v42 == 1.79769313e308 || v43 == 1.0;
    v67 = v54 * v42 + v43 * v64;
    if (v66)
      v67 = 1.79769313e308;
    if (v44 != 1.0 || v67 != 1.79769313e308)
    {
      if (v67 != 1.79769313e308)
        v64 = v67;
      v65 = (1.0 - v44) * v76 + v44 * v64;
    }
    self->__cornerRadii.topLeft = v52;
    self->__cornerRadii.bottomLeft = v57;
    self->__cornerRadii.bottomRight = v61;
    self->__cornerRadii.topRight = v65;
    *((_DWORD *)&self->_clean + 3) |= 0x1000u;

  }
  topLeft = self->__cornerRadii.topLeft;
  bottomLeft = self->__cornerRadii.bottomLeft;
  bottomRight = self->__cornerRadii.bottomRight;
  topRight = self->__cornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (CGRect)_containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__containerBounds.origin.x;
  y = self->__containerBounds.origin.y;
  width = self->__containerBounds.size.width;
  height = self->__containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_percentFullScreen
{
  void *v3;
  char v4;
  BOOL v5;
  double result;
  _BOOL4 v7;
  double v8;

  if ((*((_BYTE *)&self->_clean + 2) & 0x10) != 0)
    return self->__percentFullScreen;
  -[_UISheetLayoutInfo _metrics](self, "_metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "exclusivelyUsesZPositionForTransform");

  v5 = -[_UISheetLayoutInfo _isForcedFullScreen](self, "_isForcedFullScreen");
  result = 1.0;
  if (!v5 && (v4 & 1) == 0)
  {
    v7 = -[_UISheetLayoutInfo _wantsFullScreen](self, "_wantsFullScreen", 1.0);
    result = 0.0;
    if (v7)
    {
      -[_UISheetLayoutInfo _depthLevel](self, "_depthLevel", 0.0);
      result = fmax(fmin(1.0 - v8, 1.0), 0.0);
    }
  }
  self->__percentFullScreen = result;
  *(_QWORD *)&self->_clean |= 0x100000uLL;
  return result;
}

- (_UISheetPresentationMetrics)_metrics
{
  return self->__metrics;
}

- (double)_depthLevel
{
  _BOOL4 v3;
  double result;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;

  if ((*((_BYTE *)&self->_clean + 1) & 0x20) != 0)
    return self->__depthLevel;
  v3 = -[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented");
  result = 0.0;
  if (v3)
  {
    if (-[_UISheetLayoutInfo _hasParentSheet](self, "_hasParentSheet", 0.0))
      v5 = -[_UISheetLayoutInfo _stacksWithParent](self, "_stacksWithParent");
    else
      v5 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
    v6 = v5;
    -[_UISheetLayoutInfo _percentFullHeight](self, "_percentFullHeight");
    if (v7 == 0.0
      && v6
      && !-[_UISheetLayoutInfo _isHidingUnderneathDescendantForDepthLevel](self, "_isHidingUnderneathDescendantForDepthLevel"))
    {
      -[_UISheetLayoutInfo _parentDepthLevel](self, "_parentDepthLevel");
    }
    else
    {
      -[_UISheetLayoutInfo _proposedDepthLevel](self, "_proposedDepthLevel");
    }
  }
  self->__depthLevel = result;
  *(_QWORD *)&self->_clean |= 0x2000uLL;
  return result;
}

- (double)_percentPresented
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  if ((*((_BYTE *)&self->_clean + 12) & 0x20) != 0)
    return self->__percentPresented;
  -[_UISheetLayoutInfo _currentOffset](self, "_currentOffset");
  v4 = v3;
  -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
  v6 = v5;
  -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
  result = fmax(fmin((v4 - v6) / (v7 - v6), 1.0), 0.0);
  self->__percentPresented = result;
  *((_DWORD *)&self->_clean + 3) |= 0x20u;
  return result;
}

- (double)_preferredCornerRadius
{
  return self->__preferredCornerRadius;
}

- (double)_dismissCornerRadius
{
  return self->__dismissCornerRadius;
}

- (BOOL)_isForcedFullScreen
{
  void *v3;
  BOOL v4;

  if ((*((_BYTE *)&self->_clean + 2) & 4) == 0)
  {
    -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "verticalSizeClass") == 1
      && !-[_UISheetLayoutInfo _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight"))
    {
      if (objc_msgSend(v3, "horizontalSizeClass") == 1)
        v4 = 1;
      else
        v4 = !-[_UISheetLayoutInfo _wantsFloatingInRegularWidthCompactHeight](self, "_wantsFloatingInRegularWidthCompactHeight");
    }
    else
    {
      v4 = 0;
    }
    self->__forcedFullScreen = v4;
    *(_QWORD *)&self->_clean |= 0x40000uLL;

  }
  return self->__forcedFullScreen;
}

- (double)_dismissOffset
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double result;

  if ((*((_BYTE *)&self->_clean + 3) & 4) != 0)
    return self->__dismissOffset;
  -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UISheetLayoutInfo _dismissSourceFrame](self, "_dismissSourceFrame");
  result = _UISheetDismissOffset(-[_UISheetLayoutInfo _isInverted](self, "_isInverted"), v4, v6, v8, v10, v11, v12, v13, v14);
  self->__dismissOffset = result;
  *(_QWORD *)&self->_clean |= 0x4000000uLL;
  return result;
}

- (UIEdgeInsets)_touchInsets
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
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MinY;
  double MinX;
  double MaxY;
  double bottom;
  double MaxX;
  double right;
  double top;
  double left;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat rect;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  UIEdgeInsets result;

  if ((*((_BYTE *)&self->_clean + 13) & 8) != 0)
  {
    top = self->__touchInsets.top;
    left = self->__touchInsets.left;
    bottom = self->__touchInsets.bottom;
    right = self->__touchInsets.right;
  }
  else
  {
    -[_UISheetLayoutInfo _untransformedFrame](self, "_untransformedFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    rect = v7;
    v10 = v9;
    -[_UISheetLayoutInfo _hostedUntransformedFrame](self, "_hostedUntransformedFrame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v33.origin.x = v4;
    v28 = v6;
    v29 = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    MinY = CGRectGetMinY(v33);
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    v31 = MinY - CGRectGetMinY(v34);
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = rect;
    v35.size.height = v10;
    MinX = CGRectGetMinX(v35);
    v36.origin.x = v12;
    v36.origin.y = v14;
    v36.size.width = v16;
    v36.size.height = v18;
    v30 = MinX - CGRectGetMinX(v36);
    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.width = v16;
    v37.size.height = v18;
    MaxY = CGRectGetMaxY(v37);
    v38.origin.x = v29;
    v38.origin.y = v28;
    v38.size.width = rect;
    v38.size.height = v10;
    bottom = MaxY - CGRectGetMaxY(v38);
    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    MaxX = CGRectGetMaxX(v39);
    v40.origin.x = v29;
    v40.origin.y = v28;
    v40.size.width = rect;
    v40.size.height = v10;
    right = MaxX - CGRectGetMaxX(v40);
    left = v30;
    top = v31;
    self->__touchInsets.top = v31;
    self->__touchInsets.left = v30;
    self->__touchInsets.bottom = bottom;
    self->__touchInsets.right = right;
    *((_DWORD *)&self->_clean + 3) |= 0x800u;
  }
  v27 = bottom;
  result.right = right;
  result.bottom = v27;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)_hostedUntransformedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*((_BYTE *)&self->_clean + 13) & 2) != 0)
  {
    x = self->__hostedUntransformedFrame.origin.x;
    y = self->__hostedUntransformedFrame.origin.y;
    width = self->__hostedUntransformedFrame.size.width;
    height = self->__hostedUntransformedFrame.size.height;
  }
  else
  {
    if (-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
    else
      -[_UISheetLayoutInfo _untransformedFrame](self, "_untransformedFrame");
    self->__hostedUntransformedFrame.origin.x = x;
    self->__hostedUntransformedFrame.origin.y = y;
    self->__hostedUntransformedFrame.size.width = width;
    self->__hostedUntransformedFrame.size.height = height;
    *((_DWORD *)&self->_clean + 3) |= 0x200u;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_untransformedFrame
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  int v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double MinX;
  _BOOL4 v42;
  double v43;
  double Height;
  double x;
  double y;
  double width;
  double v48;
  CGFloat rect;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  if ((*((_BYTE *)&self->_clean + 13) & 1) == 0)
  {
    v3 = -[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally");
    -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
    rect = v4;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    if (v3)
      -[_UISheetLayoutInfo _rawCurrentOffset](self, "_rawCurrentOffset");
    else
      -[_UISheetLayoutInfo _currentOffset](self, "_currentOffset");
    v13 = v11;
    v14 = v12;
    v15 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
    v16 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
    v17 = -[_UISheetLayoutInfo _isExpanded](self, "_isExpanded");
    -[_UISheetLayoutInfo _offsetAdjustment](self, "_offsetAdjustment");
    v19 = v18;
    -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
    v22 = v21;
    -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayScale");
    v25 = v24;
    -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
    self->__untransformedFrame.origin.x = _UISheetLayoutInfoUntransformedFrame(v15, v3, v16, v17, v20, v13, v14, v19, v22, v25, v27, v28, v29, rect, v6, v8, v10, v26);
    self->__untransformedFrame.origin.y = v30;
    self->__untransformedFrame.size.width = v31;
    self->__untransformedFrame.size.height = v32;

    -[_UISheetLayoutInfo _dismissSourceFrame](self, "_dismissSourceFrame");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    if (!-[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented")
      && !-[_UISheetLayoutInfo _isDragging](self, "_isDragging"))
    {
      v50.origin.x = v34;
      v50.origin.y = v36;
      v50.size.width = v38;
      v50.size.height = v40;
      if (!CGRectIsNull(v50))
      {
        v51.origin.x = v34;
        v51.origin.y = v36;
        v51.size.width = v38;
        v51.size.height = v40;
        MinX = CGRectGetMinX(v51);
        v52.origin.x = rect;
        v52.origin.y = v6;
        v52.size.width = v8;
        v52.size.height = v10;
        self->__untransformedFrame.origin.x = self->__untransformedFrame.origin.x + MinX - CGRectGetMinX(v52);
        v42 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
        v43 = 0.0;
        if (v42)
        {
          Height = CGRectGetHeight(self->__untransformedFrame);
          v53.origin.x = v34;
          v53.origin.y = v36;
          v53.size.width = v38;
          v53.size.height = v40;
          v43 = Height - CGRectGetHeight(v53);
        }
        self->__untransformedFrame.origin.y = v43 + self->__untransformedFrame.origin.y;
        self->__untransformedFrame.size.width = v38;
        self->__untransformedFrame.size.height = v40;
      }
    }
    *((_DWORD *)&self->_clean + 3) |= 0x100u;
  }
  x = self->__untransformedFrame.origin.x;
  y = self->__untransformedFrame.origin.y;
  width = self->__untransformedFrame.size.width;
  v48 = self->__untransformedFrame.size.height;
  result.size.height = v48;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)_currentOffset
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double x;
  double y;
  CGPoint result;

  if ((*((_BYTE *)&self->_clean + 12) & 2) == 0)
  {
    -[_UISheetLayoutInfo _rawCurrentOffset](self, "_rawCurrentOffset");
    self->__currentOffset.x = v3;
    self->__currentOffset.y = v4;
    if (!-[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented")
      && !-[_UISheetLayoutInfo _isEffectiveDismissible](self, "_isEffectiveDismissible"))
    {
      -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
      v6 = v5;
      -[_UISheetLayoutInfo _offsetForCurrentActiveDetent](self, "_offsetForCurrentActiveDetent");
      self->__currentOffset.y = self->__currentOffset.y + v6 - v7;
    }
    *((_DWORD *)&self->_clean + 3) |= 2u;
  }
  x = self->__currentOffset.x;
  y = self->__currentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)_offsetAdjustment
{
  int v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double offsetAdjustment;
  double v12;
  double v13;

  if ((*((_BYTE *)&self->_clean + 12) & 0x10) == 0)
  {
    v3 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
    v4 = -[_UISheetLayoutInfo _isHidingUnderneathDescendant](self, "_isHidingUnderneathDescendant");
    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented")
      || !v5
      || v3 != objc_msgSend(v5, "_isInverted"))
    {
      self->__offsetAdjustment = 0.0;
LABEL_17:
      *((_DWORD *)&self->_clean + 3) |= 0x10u;

      return self->__offsetAdjustment;
    }
    v6 = 1.0;
    if (!v4)
    {
      -[_UISheetLayoutInfo _percentFullHeight](self, "_percentFullHeight");
      v6 = 1.0 - v7;
    }
    objc_msgSend(v5, "_nonFullHeightOffset");
    v9 = v8;
    -[_UISheetLayoutInfo _offsetForCurrentActiveDetent](self, "_offsetForCurrentActiveDetent");
    offsetAdjustment = v6 * (v9 - v10);
    self->__offsetAdjustment = offsetAdjustment;
    if (v4)
    {
      if (!-[_UISheetLayoutInfo _isAnyDescendantTransitioning](self, "_isAnyDescendantTransitioning"))
        goto LABEL_17;
      offsetAdjustment = self->__offsetAdjustment;
    }
    if (offsetAdjustment <= 0.0)
      v12 = offsetAdjustment;
    else
      v12 = 0.0;
    v13 = fmax(offsetAdjustment, 0.0);
    if (v3)
      v13 = v12;
    self->__offsetAdjustment = v13;
    goto LABEL_17;
  }
  return self->__offsetAdjustment;
}

- (BOOL)_isEffectivePresented
{
  _UISheetLayoutInfo *v2;

  v2 = self;
  if ((*(_BYTE *)&self->_clean & 1) != 0)
  {
    LOBYTE(self) = self->__effectivePresented;
  }
  else
  {
    LODWORD(self) = -[_UISheetLayoutInfo _isPresented](self, "_isPresented");
    if ((_DWORD)self)
      LOBYTE(self) = !-[_UISheetLayoutInfo _isHidden](v2, "_isHidden");
    v2->__effectivePresented = (char)self;
    *(_QWORD *)&v2->_clean |= 1uLL;
  }
  return (char)self;
}

- (BOOL)_isHidingUnderneathDescendant
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_clean & 0x10) == 0)
  {
    self->__hidingUnderneathDescendant = 0;
    -[_UISheetLayoutInfo _ancestorSheetIDs](self, "_ancestorSheetIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[_UISheetLayoutInfo _descendantHiddenAncestorSheetIDs](self, "_descendantHiddenAncestorSheetIDs", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
          {
            self->__hidingUnderneathDescendant = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

    *(_QWORD *)&self->_clean |= 0x10uLL;
  }
  return self->__hidingUnderneathDescendant;
}

- (CGRect)_dismissSourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__dismissSourceFrame.origin.x;
  y = self->__dismissSourceFrame.origin.y;
  width = self->__dismissSourceFrame.size.width;
  height = self->__dismissSourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_isPresented
{
  return self->__presented;
}

- (CGRect)_frameOfPresentedViewInContainerView
{
  double v3;
  double v4;
  int v5;
  char v6;
  int v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
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
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*((_BYTE *)&self->_clean + 13) & 4) == 0)
  {
    if (-[_UISheetLayoutInfo _isHidden](self, "_isHidden"))
      -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
    else
      -[_UISheetLayoutInfo _offsetForCurrentActiveDetent](self, "_offsetForCurrentActiveDetent");
    v4 = v3;
    v5 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
    v6 = -[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally");
    v7 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
    v8 = -[_UISheetLayoutInfo _isExpanded](self, "_isExpanded");
    -[_UISheetLayoutInfo _offsetAdjustment](self, "_offsetAdjustment");
    v10 = v9;
    -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
    v13 = v12;
    -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");
    v16 = v15;
    -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
    self->__frameOfPresentedViewInContainerView.origin.x = _UISheetLayoutInfoUntransformedFrame(v5, v6, v7, v8, v11, 0.0, v4, v10, v13, v16, v26, v27, v28, v18, v20, v22, v24, v25);
    self->__frameOfPresentedViewInContainerView.origin.y = v29;
    self->__frameOfPresentedViewInContainerView.size.width = v30;
    self->__frameOfPresentedViewInContainerView.size.height = v31;

    *((_DWORD *)&self->_clean + 3) |= 0x400u;
  }
  x = self->__frameOfPresentedViewInContainerView.origin.x;
  y = self->__frameOfPresentedViewInContainerView.origin.y;
  width = self->__frameOfPresentedViewInContainerView.size.width;
  height = self->__frameOfPresentedViewInContainerView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_isEdgeAttached
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  void *v8;
  double v9;
  BOOL v10;
  CGRect v12;

  if ((*((_BYTE *)&self->_clean + 1) & 0x40) == 0)
  {
    -[_UISheetLayoutInfo _marginsWhenFloating](self, "_marginsWhenFloating");
    v4 = v3;
    v6 = v5;
    -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
    Width = CGRectGetWidth(v12);
    -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UISheetLayoutInfo _supportsAttachedEdge](self, "_supportsAttachedEdge"))
    {
      if (-[_UISheetLayoutInfo _wantsEdgeAttached](self, "_wantsEdgeAttached")
        || -[_UISheetLayoutInfo _wantsFullScreen](self, "_wantsFullScreen")
        || (-[_UISheetLayoutInfo _preferredSize](self, "_preferredSize"), v9 > Width - v4 - v6)
        || objc_msgSend(v8, "horizontalSizeClass") == 1)
      {
        v10 = 1;
LABEL_11:
        self->__edgeAttached = v10;
        *(_QWORD *)&self->_clean |= 0x4000uLL;

        return self->__edgeAttached;
      }
      if (objc_msgSend(v8, "verticalSizeClass") == 1)
      {
        v10 = !-[_UISheetLayoutInfo _wantsFloatingInRegularWidthCompactHeight](self, "_wantsFloatingInRegularWidthCompactHeight");
        goto LABEL_11;
      }
    }
    v10 = 0;
    goto LABEL_11;
  }
  return self->__edgeAttached;
}

- (CGRect)_fullHeightUntransformedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*((_BYTE *)&self->_clean + 3) & 1) != 0)
  {
    x = self->__fullHeightUntransformedFrame.origin.x;
    y = self->__fullHeightUntransformedFrame.origin.y;
    width = self->__fullHeightUntransformedFrame.size.width;
    height = self->__fullHeightUntransformedFrame.size.height;
  }
  else
  {
    if (-[_UISheetLayoutInfo _isFunctionallyFullScreen](self, "_isFunctionallyFullScreen"))
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
    else
      -[_UISheetLayoutInfo _stackAlignmentFrame](self, "_stackAlignmentFrame");
    self->__fullHeightUntransformedFrame.origin.x = x;
    self->__fullHeightUntransformedFrame.origin.y = y;
    self->__fullHeightUntransformedFrame.size.width = width;
    self->__fullHeightUntransformedFrame.size.height = height;
    *(_QWORD *)&self->_clean |= 0x1000000uLL;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UITraitCollection)_containerTraitCollection
{
  return self->__containerTraitCollection;
}

- (double)_smallestNonDismissDetentOffset
{
  id v3;

  v3 = -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
  return self->__smallestNonDismissDetentOffset;
}

- (NSArray)_activeDetents
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  void *v31;
  double v32;
  double v33;
  NSMutableArray *mutableDetentValues;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  NSMutableArray *mutableActiveDetents;
  double v40;
  _UISheetActiveDetent *v41;
  NSMutableArray *v42;
  int64_t v43;
  int64_t *p_indexOfCurrentActiveDetent;
  int64_t v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  int v51;
  double v52;
  id v53;
  id v54;
  void *v55;
  int v56;
  int64_t v57;
  id v58;
  id v59;
  void *v60;
  int v61;
  NSMutableArray *v62;
  void *v63;
  NSMutableArray *v64;
  _UISheetActiveDetent *v65;
  _BOOL4 v66;
  _BOOL4 v67;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v72;
  double v73;
  double v74;
  NSMutableArray *v75;
  _UISheetActiveDetent *v76;
  double v77;
  _UISheetActiveDetent *v78;
  int64_t indexOfActiveDimmingDetent;
  int64_t v80;
  void *v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int64_t v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  NSMutableArray *v91;
  _UISheetActiveDetent *v92;
  _UISheetActiveDetent *v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  const char *v101;
  double v102;
  double v103;
  double v104;
  int v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[2];
  double (*v110)(uint64_t, uint64_t);
  void *v111;
  _UISheetLayoutInfo *v112;
  _QWORD v113[4];
  char v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  if ((*((_BYTE *)&self->_clean + 3) & 8) != 0)
    return (NSArray *)self->__mutableActiveDetents;
  if (dyld_program_sdk_at_least() && (*(_BYTE *)&self->_computing & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetMetrics.m"), 3064, CFSTR("Cannot call _activeDetents reentrantly."));

  }
  *(_BYTE *)&self->_computing |= 1u;
  -[NSMutableArray removeAllObjects](self->__mutableDetentValues, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->__mutableActiveDetents, "removeAllObjects");
  -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
  -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
  v103 = v14;
  v104 = v13;
  v16 = v15;
  v18 = v17;
  -[_UISheetLayoutInfo _detents](self, "_detents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _selectedDetentIdentifier](self, "_selectedDetentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _effectiveAppearance](self, "_effectiveAppearance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_largestUndimmedDetentIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_smallestDimmedDetentIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _latestUserChosenOffset](self, "_latestUserChosenOffset");
  v25 = v24;
  v26 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
  v105 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
  if (qword_1ECD7D428 != -1)
    dispatch_once(&qword_1ECD7D428, &__block_literal_global_40_0);
  v108 = (void *)v22;
  objc_msgSend((id)qword_1ECD7D420, "resolvedValueInContext:", self);
  v28 = v27;
  _UISheetLayoutInfoResolvedDetentValue(v27, v104, v103, v16, v18, v26, v105);
  v102 = v29;
  v107 = v23;
  if (!-[_UISheetLayoutInfo _isFunctionallyFullScreen](self, "_isFunctionallyFullScreen", v5, v7, v9, v11) && v12)
  {
    v100 = v21;
    v101 = a2;
    v106 = v20;
    if (objc_msgSend(v19, "count"))
    {
      v30 = 0;
      do
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "resolvedValueInContext:", self);
        v33 = v32;

        mutableDetentValues = self->__mutableDetentValues;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](mutableDetentValues, "addObject:", v35);

        if (v33 != 1.79769313e308)
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.UIKit.full")))
            -[_UISheetLayoutInfo _fullDetentValue](self, "_fullDetentValue");
          else
            -[_UISheetLayoutInfo maximumDetentValue](self, "maximumDetentValue");
          if (v33 < v38)
            v38 = v33;
          _UISheetLayoutInfoResolvedDetentValue(v38, v104, v103, v16, v18, v26, v105);
          mutableActiveDetents = self->__mutableActiveDetents;
          v41 = -[_UISheetActiveDetent initWithIdentifier:value:]([_UISheetActiveDetent alloc], "initWithIdentifier:value:", v37, v40, v5, v7, v9, v11);
          -[NSMutableArray addObject:](mutableActiveDetents, "addObject:", v41);

        }
        ++v30;
      }
      while (v30 < objc_msgSend(v19, "count"));
    }
    if (!-[NSMutableArray count](self->__mutableActiveDetents, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetMetrics.m"), 3119, CFSTR("At least one detent must be active."));

    }
    v42 = self->__mutableActiveDetents;
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __36___UISheetLayoutInfo__activeDetents__block_invoke_2;
    v113[3] = &__block_descriptor_33_e55_q24__0___UISheetActiveDetent_8___UISheetActiveDetent_16l;
    v114 = v105;
    -[NSMutableArray sortUsingComparator:](v42, "sortUsingComparator:", v113);
    v43 = 0x7FFFFFFFFFFFFFFFLL;
    self->__indexOfCurrentActiveDetent = 0x7FFFFFFFFFFFFFFFLL;
    p_indexOfCurrentActiveDetent = &self->__indexOfCurrentActiveDetent;
    v20 = v106;
    if (objc_msgSend(v21, "_prefersDimmingVisible"))
      v43 = -[NSMutableArray count](self->__mutableActiveDetents, "count") - 1;
    self->__indexOfActiveDimmingDetent = v43;
    self->__hasActiveFullDetent = 0;
    if (-[NSMutableArray count](self->__mutableActiveDetents, "count"))
    {
      v45 = 0;
      while (1)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->__mutableActiveDetents, "objectAtIndexedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "_identifier");
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v48 = v20;
        v49 = v20;
        v50 = v48;
        if (v47 == v48)
          break;
        if (!v49 || !v47)
        {

          goto LABEL_34;
        }
        v51 = objc_msgSend(v47, "isEqual:", v48);

        if (v51)
          goto LABEL_31;
LABEL_34:
        v53 = v47;
        v54 = v108;
        v55 = v54;
        if (v53 == v54)
        {

LABEL_40:
          v57 = v45 - 1;
          if (!v45)
            v57 = 0x7FFFFFFFFFFFFFFFLL;
          self->__indexOfActiveDimmingDetent = v57;
          goto LABEL_44;
        }
        if (!v108 || !v53)
        {

          goto LABEL_44;
        }
        v56 = objc_msgSend(v53, "isEqual:", v54);

        if (v56)
          goto LABEL_40;
LABEL_44:
        v58 = v53;
        v59 = v107;
        v60 = v59;
        if (v58 == v59)
        {

        }
        else
        {
          if (!v107 || !v58)
          {

            goto LABEL_52;
          }
          v61 = objc_msgSend(v58, "isEqual:", v59);

          if (!v61)
            goto LABEL_52;
        }
        self->__indexOfActiveDimmingDetent = v45;
LABEL_52:
        v20 = v106;
        if (objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.UIKit.full")))
          self->__hasActiveFullDetent = 1;

        if (++v45 >= (unint64_t)-[NSMutableArray count](self->__mutableActiveDetents, "count"))
          goto LABEL_57;
      }

LABEL_31:
      *p_indexOfCurrentActiveDetent = v45;
      if (v25 == 1.79769313e308)
      {
        objc_msgSend(v46, "_value");
        v25 = v52;
      }
      goto LABEL_34;
    }
LABEL_57:
    if (-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
    {
      v21 = v100;
      v23 = v107;
      if (-[_UISheetLayoutInfo _remoteContainsFirstResponder](self, "_remoteContainsFirstResponder"))
      {
        v66 = -[_UISheetLayoutInfo _remoteFirstResponderRequiresKeyboard](self, "_remoteFirstResponderRequiresKeyboard");
LABEL_62:
        v67 = v66;
        goto LABEL_64;
      }
    }
    else
    {
      v21 = v100;
      v23 = v107;
      if (-[_UISheetLayoutInfo _containsFirstResponder](self, "_containsFirstResponder"))
      {
        v66 = -[_UISheetLayoutInfo _firstResponderRequiresKeyboard](self, "_firstResponderRequiresKeyboard");
        goto LABEL_62;
      }
    }
    v67 = 0;
LABEL_64:
    -[_UISheetLayoutInfo _effectiveKeyboardFrame](self, "_effectiveKeyboardFrame");
    v118.origin.y = v103;
    v118.origin.x = v104;
    v118.size.width = v16;
    v118.size.height = v18;
    v116 = CGRectIntersection(v115, v118);
    if (!v67
      || (x = v116.origin.x, y = v116.origin.y, width = v116.size.width, height = v116.size.height, CGRectIsEmpty(v116))
      || (v105 & 1) != 0
      || !-[_UISheetLayoutInfo _shouldAdjustDetentsToAvoidKeyboard](self, "_shouldAdjustDetentsToAvoidKeyboard"))
    {
      self->__adjustedIndexOfCurrentActiveDetentForContainedFirstResponder = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      -[NSMutableArray firstObject](self->__mutableActiveDetents, "firstObject");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "_value");
      v74 = v73;

      if (v74 > v102)
      {
        v75 = self->__mutableActiveDetents;
        v76 = [_UISheetActiveDetent alloc];
        v117.origin.x = x;
        v117.origin.y = y;
        v117.size.width = width;
        v117.size.height = height;
        v77 = v74 - CGRectGetHeight(v117);
        if (v77 < v102)
          v77 = v102;
        v78 = -[_UISheetActiveDetent initWithIdentifier:value:](v76, "initWithIdentifier:value:", 0, v77);
        -[NSMutableArray insertObject:atIndex:](v75, "insertObject:atIndex:", v78, 0);

        indexOfActiveDimmingDetent = self->__indexOfActiveDimmingDetent;
        if (indexOfActiveDimmingDetent == 0x7FFFFFFFFFFFFFFFLL)
          v80 = 0;
        else
          v80 = indexOfActiveDimmingDetent + 1;
        self->__indexOfActiveDimmingDetent = v80;
      }
      *p_indexOfCurrentActiveDetent = 0;
      self->__adjustedIndexOfCurrentActiveDetentForContainedFirstResponder = 0;
    }
    a2 = v101;
    goto LABEL_78;
  }
  v62 = self->__mutableDetentValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v62, "addObject:", v63);

  v64 = self->__mutableActiveDetents;
  v65 = -[_UISheetActiveDetent initWithIdentifier:value:]([_UISheetActiveDetent alloc], "initWithIdentifier:value:", 0, v102);
  -[NSMutableArray addObject:](v64, "addObject:", v65);

  *(_OWORD *)&self->__indexOfCurrentActiveDetent = xmmword_186672FB0;
  self->__indexOfActiveDimmingDetent = 0;
  self->__hasActiveFullDetent = 0;
LABEL_78:
  if (!-[NSMutableArray count](self->__mutableActiveDetents, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetMetrics.m"), 3209, CFSTR("At least one detent must be active."));

  }
  if (v25 == 1.79769313e308)
  {
    -[NSMutableArray lastObject](self->__mutableActiveDetents, "lastObject");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "_value");
    v25 = v82;

  }
  if (v25 == 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetMetrics.m"), 3216, CFSTR("_latestUserChosenOffset must be resolved to a concrete value by this point."));

  }
  if (self->__indexOfCurrentActiveDetent == 0x7FFFFFFFFFFFFFFFLL)
  {
    v83 = -[NSMutableArray count](self->__mutableActiveDetents, "count");
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v110 = __36___UISheetLayoutInfo__activeDetents__block_invoke_3;
    v111 = &unk_1E16B8EF0;
    v112 = self;
    if (v83)
    {
      v84 = v83;
      v85 = 0;
      v86 = 0x7FFFFFFFFFFFFFFFLL;
      v87 = 1.79769313e308;
      do
      {
        v88 = vabdd_f64(v110((uint64_t)v109, v85), v25);
        if (v88 < v87)
        {
          v86 = v85;
          v87 = v88;
        }
        ++v85;
      }
      while (v84 != v85);
    }
    else
    {
      v86 = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->__indexOfCurrentActiveDetent = v86;
    v23 = v107;
    if (v86 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetMetrics.m"), 3227, CFSTR("indexOfCurrentActiveDetent must be a concrete index by this point."));

    }
  }
  -[NSMutableArray lastObject](self->__mutableActiveDetents, "lastObject");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "_value");
  self->__smallestNonDismissDetentOffset = v90;

  self->__numberOfActiveNonDismissDetents = -[NSMutableArray count](self->__mutableActiveDetents, "count");
  if (-[_UISheetLayoutInfo _isEffectiveDismissible](self, "_isEffectiveDismissible"))
  {
    v91 = self->__mutableActiveDetents;
    v92 = [_UISheetActiveDetent alloc];
    -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
    v93 = -[_UISheetActiveDetent initWithIdentifier:value:](v92, "initWithIdentifier:value:", 0);
    -[NSMutableArray addObject:](v91, "addObject:", v93);

  }
  *(_BYTE *)&self->_computing &= ~1u;
  *(_QWORD *)&self->_clean |= 0x8000000uLL;

  return (NSArray *)self->__mutableActiveDetents;
}

- (double)_percentDimmedFromOffset
{
  int64_t v3;
  double v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double result;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;

  if ((*((_BYTE *)&self->_clean + 13) & 0x80) != 0)
    return self->__percentDimmedFromOffset;
  v3 = -[_UISheetLayoutInfo _indexOfActiveDimmingDetent](self, "_indexOfActiveDimmingDetent");
  v4 = 0.0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    v6 = v3 + 1;
    -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_value");
    v10 = v9;

    if (v6 >= objc_msgSend(v7, "count"))
    {
      -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
      v13 = v15;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_value");
      v13 = v12;

    }
    -[_UISheetLayoutInfo _currentOffset](self, "_currentOffset");
    v4 = fmax(fmin((v16 - v13) / (v10 - v13), 1.0), 0.0);

  }
  -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_percentDimmedFromOffset");
  v19 = v18;

  v20 = -[_UISheetLayoutInfo _isHidingUnderneathDescendant](self, "_isHidingUnderneathDescendant");
  if (v4 < v19 || v20)
    result = v19;
  else
    result = v4;
  self->__percentDimmedFromOffset = result;
  *((_DWORD *)&self->_clean + 3) |= 0x8000u;
  return result;
}

- (BOOL)_dismissesHorizontally
{
  _UISheetLayoutInfo *v2;

  v2 = self;
  if ((*((_BYTE *)&self->_clean + 1) & 0x80) != 0)
  {
    LOBYTE(self) = self->__dismissesHorizontally;
  }
  else
  {
    self = -[_UISheetLayoutInfo _horizontalAlignment](self, "_horizontalAlignment");
    if (self)
      LOBYTE(self) = !-[_UISheetLayoutInfo _isEdgeAttached](v2, "_isEdgeAttached");
    v2->__dismissesHorizontally = (char)self;
    *(_QWORD *)&v2->_clean |= 0x8000uLL;
  }
  return (char)self;
}

- (BOOL)_isHidden
{
  return self->__hidden;
}

- (double)_offsetForCurrentActiveDetent
{
  void *v3;
  void *v4;
  double v5;

  if (!self->_clean.offsetForCurrentActiveDetent)
  {
    -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_value");
    self->__offsetForCurrentActiveDetent = v5;

    self->_clean.offsetForCurrentActiveDetent = 1;
  }
  return self->__offsetForCurrentActiveDetent;
}

- (BOOL)_stacksWithParent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  char v22;

  -[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_stackAlignmentFrame");
  else
    -[_UISheetLayoutInfo _hostParentStackAlignmentFrame](self, "_hostParentStackAlignmentFrame");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  -[_UISheetLayoutInfo _stackAlignmentFrame](self, "_stackAlignmentFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[_UISheetLayoutInfo _metrics](self, "_metrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _UISheetLayoutInfoStacks(v21, v9, v10, v11, v12, v14, v16, v18, v20);

  return v22;
}

- (_UISheetLayoutInfo)_parentLayoutInfo
{
  return (_UISheetLayoutInfo *)objc_loadWeakRetained((id *)&self->__parentLayoutInfo);
}

- (CGRect)_stackAlignmentFrame
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  int v22;
  int64_t v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double MidX;
  double MidY;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double MaxX;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int64_t v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  double MinX;
  double v65;
  double MinY;
  double MaxY;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat rect;
  double recta;
  double v77;
  double v78;
  double v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect result;

  if ((*((_BYTE *)&self->_clean + 2) & 0x40) != 0)
    goto LABEL_44;
  -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
  v4 = v3;
  rect = v5;
  v7 = v6;
  v9 = v8;
  -[_UISheetLayoutInfo _additionalMinimumTopInset](self, "_additionalMinimumTopInset");
  v78 = v10;
  -[_UISheetLayoutInfo _margins](self, "_margins");
  v77 = v11;
  v79 = v12;
  v73 = v13;
  v15 = v14;
  v16 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
  -[_UISheetLayoutInfo _sourceFrame](self, "_sourceFrame");
  x = v80.origin.x;
  y = v80.origin.y;
  width = v80.size.width;
  height = v80.size.height;
  if (CGRectIsNull(v80))
  {
    -[_UISheetLayoutInfo _containerView](self, "_containerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "_shouldReverseLayoutDirection");

    v23 = -[_UISheetLayoutInfo _horizontalAlignment](self, "_horizontalAlignment");
    if (v23 == 2)
    {
      v24 = v79;
      v25 = v9;
      v27 = rect;
      v26 = v4;
      if (!v22)
        goto LABEL_9;
    }
    else
    {
      if (v23 != 1)
      {
        v81.origin.x = v4;
        v81.origin.y = rect;
        v81.size.width = v7;
        v25 = v9;
        v27 = rect;
        v81.size.height = v25;
        MidX = CGRectGetMidX(v81);
        v24 = v79;
LABEL_14:
        v82.origin.x = v4;
        v82.origin.y = v27;
        v82.size.width = v7;
        v82.size.height = v25;
        MidY = CGRectGetMidY(v82);
        goto LABEL_15;
      }
      v24 = v79;
      v25 = v9;
      v26 = v4;
      if (v22)
      {
        v27 = rect;
LABEL_9:
        v30 = v27;
        v31 = v7;
        v32 = v25;
        MaxX = CGRectGetMaxX(*(CGRect *)&v26);
LABEL_13:
        MidX = MaxX;
        goto LABEL_14;
      }
      v27 = rect;
    }
    v34 = v27;
    v35 = v7;
    v36 = v25;
    MaxX = CGRectGetMinX(*(CGRect *)&v26);
    goto LABEL_13;
  }
  MidX = x + width * 0.5;
  MidY = y + height * 0.5;
  v24 = v79;
  v25 = v9;
  v27 = rect;
LABEL_15:
  v83.origin.x = v4;
  v83.origin.y = v27;
  v83.size.width = v7;
  v83.size.height = v25;
  v37 = CGRectGetWidth(v83) - v24 - v15;
  v38 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
  -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v38)
  {
    v41 = -[_UISheetLayoutInfo _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached");
    v42 = v37;
    if (v41)
    {
      if (objc_msgSend(v40, "horizontalSizeClass", v37) != 1
        || (v43 = objc_msgSend(v40, "verticalSizeClass"), v42 = v37, v43 != 2))
      {
        -[_UISheetLayoutInfo _preferredSize](self, "_preferredSize");
      }
    }
    if (v42 >= v37)
      v42 = v37;
    v44 = fmax(v24 + (v37 - (v37 - v42)) * 0.5, fmin(MidX, v24 + (v37 + v37 - v42) * 0.5));
    v45 = v78 + v77;
    v46 = v73;
    if (!v16)
      v46 = v78 + v77;
    v47 = v44 - v42 * 0.5;
    if (v16)
      v45 = 0.0;
    self->__stackAlignmentFrame.origin.x = v47;
    self->__stackAlignmentFrame.origin.y = v45;
    self->__stackAlignmentFrame.size.width = v42;
    self->__stackAlignmentFrame.size.height = v25 - v46;

  }
  else
  {
    v48 = objc_msgSend(v39, "userInterfaceIdiom");

    -[_UISheetLayoutInfo _preferredSize](self, "_preferredSize");
    if (v48 == 6)
    {
      self->__stackAlignmentFrame.origin.x = MidX - v49 * 0.5;
      self->__stackAlignmentFrame.origin.y = MidY - v50 * 0.5;
      self->__stackAlignmentFrame.size.width = v49;
      self->__stackAlignmentFrame.size.height = v50;
    }
    else
    {
      recta = MidX;
      v51 = v25 - v77 - v73;
      v52 = v51 - v78;
      if (v49 >= v37)
        v53 = v37;
      else
        v53 = v49;
      if (v50 >= v52)
        v54 = v51 - v78;
      else
        v54 = v50;
      v55 = -[_UISheetLayoutInfo _mode](self, "_mode");
      v56 = v53 * 1.41421356;
      if (v54 < v53 * 1.41421356)
        v56 = v54;
      if (v55)
        v56 = v54;
      v74 = v56;
      -[_UISheetLayoutInfo _effectiveKeyboardFrame](self, "_effectiveKeyboardFrame");
      v57 = v84.origin.x;
      v58 = v84.origin.y;
      v59 = v84.size.width;
      v60 = v84.size.height;
      if (!CGRectIsNull(v84))
      {
        v85.origin.x = v57;
        v85.origin.y = v58;
        v85.size.width = v59;
        v85.size.height = v60;
        v61 = CGRectGetMinY(v85) * 0.5;
        if (MidY >= v61)
          MidY = v61;
      }
      v72 = MidY;
      v62 = v52 - v74;
      v63 = v78 + v77 + (v52 - (v52 - v74)) * 0.5;
      v86.origin.x = v79 + (v37 - (v37 - v53)) * 0.5;
      v86.origin.y = v63;
      v86.size.width = v37 - v53;
      v86.size.height = v52 - v74;
      MinX = CGRectGetMinX(v86);
      v87.origin.x = v79 + (v37 - (v37 - v53)) * 0.5;
      v87.origin.y = v63;
      v87.size.width = v37 - v53;
      v87.size.height = v52 - v74;
      v65 = fmax(MinX, fmin(recta, CGRectGetMaxX(v87)));
      v88.origin.x = v79 + (v37 - (v37 - v53)) * 0.5;
      v88.origin.y = v63;
      v88.size.width = v37 - v53;
      v88.size.height = v52 - v74;
      MinY = CGRectGetMinY(v88);
      v89.origin.x = v79 + (v37 - (v37 - v53)) * 0.5;
      v89.origin.y = v63;
      v89.size.width = v37 - v53;
      v89.size.height = v62;
      MaxY = CGRectGetMaxY(v89);
      self->__stackAlignmentFrame.origin.x = v65 - v53 * 0.5;
      self->__stackAlignmentFrame.origin.y = fmax(MinY, fmin(v72, MaxY)) - v74 * 0.5;
      self->__stackAlignmentFrame.size.width = v53;
      self->__stackAlignmentFrame.size.height = v74;
    }
  }
  *(_QWORD *)&self->_clean |= 0x400000uLL;
LABEL_44:
  v68 = self->__stackAlignmentFrame.origin.x;
  v69 = self->__stackAlignmentFrame.origin.y;
  v70 = self->__stackAlignmentFrame.size.width;
  v71 = self->__stackAlignmentFrame.size.height;
  result.size.height = v71;
  result.size.width = v70;
  result.origin.y = v69;
  result.origin.x = v68;
  return result;
}

- (CGRect)_hostParentStackAlignmentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__hostParentStackAlignmentFrame.origin.x;
  y = self->__hostParentStackAlignmentFrame.origin.y;
  width = self->__hostParentStackAlignmentFrame.size.width;
  height = self->__hostParentStackAlignmentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)_indexOfActiveDimmingDetent
{
  id v3;

  v3 = -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
  return self->__indexOfActiveDimmingDetent;
}

- (CGPoint)_rawCurrentOffset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void (**currentOffsetGetter)(void);
  CGFloat v20;
  CGFloat v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double MaxY;
  void *v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double MinX;
  double MaxX;
  double x;
  double y;
  CGPoint result;
  CGRect v40;
  CGRect v41;

  if ((*((_BYTE *)&self->_clean + 12) & 1) == 0)
  {
    -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    currentOffsetGetter = (void (**)(void))self->__currentOffsetGetter;
    if (currentOffsetGetter)
    {
      currentOffsetGetter[2]();
    }
    else
    {
      v22 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
      v23 = v4;
      v24 = v6;
      v25 = v8;
      v26 = v10;
      if (v22)
        MaxY = CGRectGetMaxY(*(CGRect *)&v23);
      else
        MaxY = CGRectGetMinY(*(CGRect *)&v23);
      v21 = MaxY;
      v20 = 0.0;
    }
    self->__rawCurrentOffset.x = v20;
    self->__rawCurrentOffset.y = v21;
    if (!-[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented")
      && -[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally"))
    {
      -[_UISheetLayoutInfo _containerView](self, "_containerView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "_shouldReverseLayoutDirection"))
        v29 = 2;
      else
        v29 = 1;

      v30 = -[_UISheetLayoutInfo _horizontalAlignment](self, "_horizontalAlignment");
      v31 = v4;
      v32 = v6;
      v33 = v8;
      v34 = v10;
      if (v30 == v29)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v31);
        v40.origin.x = v12;
        v40.origin.y = v14;
        v40.size.width = v16;
        v40.size.height = v18;
        MaxX = CGRectGetMaxX(v40);
      }
      else
      {
        MinX = CGRectGetMaxX(*(CGRect *)&v31);
        v41.origin.x = v12;
        v41.origin.y = v14;
        v41.size.width = v16;
        v41.size.height = v18;
        MaxX = CGRectGetMinX(v41);
      }
      self->__rawCurrentOffset.x = MinX - MaxX + self->__rawCurrentOffset.x;
    }
    *((_DWORD *)&self->_clean + 3) |= 1u;
  }
  x = self->__rawCurrentOffset.x;
  y = self->__rawCurrentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)_allowsInteractiveDismissWhenFullScreen
{
  return self->__allowsInteractiveDismissWhenFullScreen;
}

- (int64_t)_horizontalAlignment
{
  return self->__horizontalAlignment;
}

- (BOOL)_isEffectiveDismissible
{
  _UISheetLayoutInfo *v2;

  v2 = self;
  if ((*((_BYTE *)&self->_clean + 2) & 1) != 0)
  {
    LOBYTE(self) = self->__effectiveDismissible;
  }
  else
  {
    LODWORD(self) = -[_UISheetLayoutInfo _isDismissible](self, "_isDismissible");
    if ((_DWORD)self)
      LOBYTE(self) = !-[_UISheetLayoutInfo _dismissesHorizontally](v2, "_dismissesHorizontally");
    v2->__effectiveDismissible = (char)self;
    *(_QWORD *)&v2->_clean |= 0x10000uLL;
  }
  return (char)self;
}

- (double)_latestUserChosenOffset
{
  return self->__latestUserChosenOffset;
}

- (BOOL)_isDismissible
{
  return self->__dismissible;
}

- (_UISheetPresentationControllerAppearance)_effectiveAppearance
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _UISheetPresentationControllerAppearance *effectiveAppearance;
  void *v8;
  _UISheetPresentationControllerAppearance *v9;

  if ((*((_BYTE *)&self->_clean + 4) & 2) == 0)
  {
    -[_UISheetLayoutInfo _standardAppearance](self, "_standardAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached"))
    {
      -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "verticalSizeClass");

      if (v5 != 1)
      {
        v9 = v3;
        effectiveAppearance = self->__effectiveAppearance;
        self->__effectiveAppearance = v9;
LABEL_11:

        *(_QWORD *)&self->_clean |= 0x200000000uLL;
        return self->__effectiveAppearance;
      }
      -[_UISheetLayoutInfo _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UISheetLayoutInfo _floatingAppearance](self, "_floatingAppearance");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    effectiveAppearance = (_UISheetPresentationControllerAppearance *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v3;
    objc_storeStrong((id *)&self->__effectiveAppearance, v8);
    goto LABEL_11;
  }
  return self->__effectiveAppearance;
}

- (double)_alpha
{
  void *v3;
  double v4;
  void *v5;

  if ((*((_BYTE *)&self->_clean + 14) & 4) != 0)
    return self->__alpha;
  -[_UISheetLayoutInfo _metrics](self, "_metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1.0;
  if (objc_msgSend(v3, "fadeOutIfAnyDescendantWantsFullScreen"))
  {
    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (double)(objc_msgSend(v5, "_anyDescendantWantsFullScreen") ^ 1);

  }
  self->__alpha = v4;
  *((_DWORD *)&self->_clean + 3) |= 0x40000u;
  return v4;
}

- (CGRect)_sourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__sourceFrame.origin.x;
  y = self->__sourceFrame.origin.y;
  width = self->__sourceFrame.size.width;
  height = self->__sourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_hasParentSheet
{
  void *v3;
  _BOOL4 v4;
  CGRect v6;

  -[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[_UISheetLayoutInfo _hostParentStackAlignmentFrame](self, "_hostParentStackAlignmentFrame");
    v4 = !CGRectIsNull(v6);
  }

  return v4;
}

- (BOOL)_wantsFloatingInRegularWidthCompactHeight
{
  return self->__wantsFloatingInRegularWidthCompactHeight;
}

- (CGRect)_effectiveKeyboardFrame
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*((_BYTE *)&self->_clean + 2) & 0x20) == 0)
  {
    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
    {
      -[_UISheetLayoutInfo _remoteKeyboardFrame](self, "_remoteKeyboardFrame");
    }
    else if (v3)
    {
      objc_msgSend(v3, "_effectiveKeyboardFrame");
    }
    else
    {
      -[_UISheetLayoutInfo _keyboardFrame](self, "_keyboardFrame");
    }
    self->__effectiveKeyboardFrame.origin.x = v4;
    self->__effectiveKeyboardFrame.origin.y = v5;
    self->__effectiveKeyboardFrame.size.width = v6;
    self->__effectiveKeyboardFrame.size.height = v7;
    *(_QWORD *)&self->_clean |= 0x200000uLL;

  }
  x = self->__effectiveKeyboardFrame.origin.x;
  y = self->__effectiveKeyboardFrame.origin.y;
  width = self->__effectiveKeyboardFrame.size.width;
  height = self->__effectiveKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_containsFirstResponder
{
  return self->__containsFirstResponder;
}

- (BOOL)_isScrollInteractionEnabled
{
  BOOL result;

  if ((*((_BYTE *)&self->_clean + 14) & 0x10) != 0)
    return self->__scrollInteractionEnabled;
  if (-[_UISheetLayoutInfo _isInverted](self, "_isInverted"))
    result = -[_UISheetLayoutInfo _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown");
  else
    result = 1;
  self->__scrollInteractionEnabled = result;
  *((_DWORD *)&self->_clean + 3) |= 0x100000u;
  return result;
}

- (CGRect)_keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__keyboardFrame.origin.x;
  y = self->__keyboardFrame.origin.y;
  width = self->__keyboardFrame.size.width;
  height = self->__keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_parentDepthLevel
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_depthLevel");
  else
    -[_UISheetLayoutInfo _hostParentDepthLevel](self, "_hostParentDepthLevel");
  v6 = v5;

  return v6;
}

- (double)_nonFullHeightOffset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  int v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  _BOOL4 v18;
  CGFloat MaxY;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double nonFullHeightOffset;
  double v26;
  double v27;

  if ((*((_BYTE *)&self->_clean + 12) & 8) != 0)
    return self->__nonFullHeightOffset;
  -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UISheetLayoutInfo _percentFullHeight](self, "_percentFullHeight");
  v12 = v11;
  v13 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
  if (!-[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented"))
    goto LABEL_12;
  if (v12 == 0.0
    || (-[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "_isHidingUnderneathDescendant"),
        v14,
        v15))
  {
    -[_UISheetLayoutInfo _currentOffset](self, "_currentOffset");
    v17 = v16;
    v18 = -[_UISheetLayoutInfo _isEffectiveDismissible](self, "_isEffectiveDismissible");
    if (v13)
    {
      if (v18)
        -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
      else
        MaxY = -INFINITY;
      if (v17 >= MaxY)
        MaxY = v17;
    }
    else
    {
      if (v18)
        -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
      else
        MaxY = INFINITY;
      if (v17 < MaxY)
        MaxY = v17;
    }
    goto LABEL_22;
  }
  if (v12 < 1.0)
  {
    -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
  }
  else
  {
LABEL_12:
    v20 = v4;
    v21 = v6;
    v22 = v8;
    v23 = v10;
    if (v13)
      MaxY = CGRectGetMaxY(*(CGRect *)&v20);
    else
      MaxY = CGRectGetMinY(*(CGRect *)&v20);
  }
LABEL_22:
  self->__nonFullHeightOffset = MaxY;
  -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 != 1.0 || -[_UISheetLayoutInfo _isHidingUnderneathDescendant](self, "_isHidingUnderneathDescendant"))
    && v24
    && v13 == objc_msgSend(v24, "_isInverted"))
  {
    nonFullHeightOffset = self->__nonFullHeightOffset;
    objc_msgSend(v24, "_nonFullHeightOffset");
    if (nonFullHeightOffset >= v26)
      v27 = v26;
    else
      v27 = nonFullHeightOffset;
    if (nonFullHeightOffset >= v26)
      v26 = nonFullHeightOffset;
    if (v13)
      v26 = v27;
    self->__nonFullHeightOffset = v26;
  }
  *((_DWORD *)&self->_clean + 3) |= 8u;

  return self->__nonFullHeightOffset;
}

- (CGRect)_parentFullHeightUntransformedFrameForDepthLevel
{
  void *v3;
  void *v4;
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
  CGRect result;

  -[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_fullHeightUntransformedFrameForDepthLevel");
  else
    -[_UISheetLayoutInfo _hostParentFullHeightUntransformedFrameForDepthLevel](self, "_hostParentFullHeightUntransformedFrameForDepthLevel");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setContainerSafeAreaInsets:(UIEdgeInsets)a3
{
  _UISheetLayoutInfo *v6;

  if (self->__containerSafeAreaInsets.left != a3.left
    || self->__containerSafeAreaInsets.top != a3.top
    || self->__containerSafeAreaInsets.right != a3.right
    || self->__containerSafeAreaInsets.bottom != a3.bottom)
  {
    self->__containerSafeAreaInsets = a3;
    v6 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v6);
    _UISheetLayoutInfoDirtyMargins(v6);
    _UISheetLayoutInfoDirtyActiveDetents(v6);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMinimumOffset(v6);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMaximumOffset(v6);
    _UISheetLayoutInfoDirtyExpanded(v6);
    _UISheetLayoutInfoDirtyShouldPresentedViewControllerControlStatusBarAppearance(v6);

  }
}

- (void)_setTransitioning:(BOOL)a3
{
  if (self->__transitioning != a3)
  {
    self->__transitioning = a3;
    _UISheetLayoutInfoDirtyAnyDescendantTransitioning(self);
  }
}

- (void)_setPresented:(BOOL)a3
{
  if (self->__presented != a3)
  {
    self->__presented = a3;
    _UISheetLayoutInfoDirtyEffectivePresented(self);
  }
}

- (void)_setParentSheetLayoutInfo:(id)a3
{
  id WeakRetained;
  void *v5;
  _UISheetLayoutInfo *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__parentLayoutInfo);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__parentLayoutInfo, obj);
    v6 = self;
    _UISheetLayoutInfoDirtyDepthLevel(v6);
    _UISheetLayoutInfoDirtyAncestorSheetIDs(v6);
    _UISheetLayoutInfoDirtyParentDepthLevel(v6);
    _UISheetLayoutInfoDirtyParentDepthLevel(v6);
    _UISheetLayoutInfoDirtyFullHeightUntransformedFrameForDepthLevel(v6);
    _UISheetLayoutInfoDirtyPercentDimmed(v6);

    v5 = obj;
  }

}

- (void)_setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->__presentedViewController, a3);
}

- (void)_setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->__presentingViewController, a3);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (void)_setMode:(int64_t)a3
{
  if (self->__mode != a3)
  {
    self->__mode = a3;
    _UISheetLayoutInfoDirtyPreferredSize(self);
  }
}

- (_UISheetPresentationControllerAppearance)_standardAppearance
{
  return self->__standardAppearance;
}

- (_UISheetPresentationControllerAppearance)_floatingAppearance
{
  return self->__floatingAppearance;
}

- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance
{
  return self->__edgeAttachedCompactHeightAppearance;
}

- (BOOL)_widthFollowsPreferredContentSizeWhenEdgeAttached
{
  return self->__widthFollowsPreferredContentSizeWhenEdgeAttached;
}

- (NSString)_selectedDetentIdentifier
{
  return self->__selectedDetentIdentifier;
}

- (BOOL)_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge
{
  return self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge;
}

- (BOOL)_wantsEdgeAttachedInCompactHeight
{
  return self->__wantsEdgeAttachedInCompactHeight;
}

- (NSArray)_detents
{
  return self->__detents;
}

- (BOOL)_wantsEdgeAttached
{
  return self->__wantsEdgeAttached;
}

- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown
{
  return self->__prefersScrollingResizesWhenDetentDirectionIsDown;
}

- (BOOL)_peeksWhenFloating
{
  return self->__peeksWhenFloating;
}

- (BOOL)_wantsInvertedWhenFloating
{
  return self->__wantsInvertedWhenFloating;
}

- (double)_additionalMinimumTopInset
{
  return self->__additionalMinimumTopInset;
}

- (_UISheetLayoutInfo)initWithMetrics:(id)a3
{
  id v5;
  _UISheetLayoutInfo *v6;
  _UISheetLayoutInfo *v7;
  void *v8;
  uint64_t v9;
  NSArray *detents;
  NSMutableArray *v11;
  NSMutableArray *mutableDetentValues;
  NSMutableArray *v13;
  NSMutableArray *mutableActiveDetents;
  uint64_t v15;
  _UISheetPresentationControllerAppearance *standardAppearance;
  double v17;
  double v18;
  int64x2_t v20;
  CGSize v21;
  CGPoint v22;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UISheetLayoutInfo;
  v6 = -[_UISheetLayoutInfo init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metrics, a3);
    v7->__mode = objc_msgSend(v5, "defaultMode");
    v21 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v22 = (CGPoint)*MEMORY[0x1E0C9D628];
    v7->__sourceFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v7->__sourceFrame.size = v21;
    v20 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v7->__marginInCompactHeight = v20;
    v7->__keyboardFrame.origin = v22;
    v7->__keyboardFrame.size = v21;
    v7->__remoteKeyboardFrame.origin = v22;
    v7->__remoteKeyboardFrame.size = v21;
    v7->__shouldAdjustDetentsToAvoidKeyboard = 1;
    v7->__shouldScaleDownBehindDescendants = 1;
    v7->__reduceMotionEnabled = _AXSReduceMotionEnabled() != 0;
    v7->__peeksWhenFloating = 1;
    v7->__dismissible = 1;
    +[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    detents = v7->__detents;
    v7->__detents = (NSArray *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableDetentValues = v7->__mutableDetentValues;
    v7->__mutableDetentValues = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableActiveDetents = v7->__mutableActiveDetents;
    v7->__mutableActiveDetents = v13;

    +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:](_UISheetPresentationControllerAppearance, "appearancePreferringDimmingVisible:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    standardAppearance = v7->__standardAppearance;
    v7->__standardAppearance = (_UISheetPresentationControllerAppearance *)v15;

    *(_WORD *)&v7->__prefersScrollingResizesWhenDetentDirectionIsDown = 257;
    v7->__latestUserChosenOffset = 1.79769313e308;
    v7->__grabberSpacing = 5.0;
    v7->__grabberBlurEnabled = 1;
    v7->__dismissSourceFrame.origin = v22;
    v7->__dismissSourceFrame.size = v21;
    *(int64x2_t *)&v7->__dismissCornerRadius = v20;
    objc_msgSend(v5, "preferredShadowOpacity");
    v7->__preferredShadowOpacity = v17;
    objc_msgSend(v5, "shadowRadius");
    v7->__shadowRadius = v18;
    v7->__shouldDismissWhenTappedOutside = 1;
    v7->__hostParentStackAlignmentFrame.origin = v22;
    v7->__hostParentStackAlignmentFrame.size = v21;
    v7->__hostParentFullHeightUntransformedFrameForDepthLevel.origin = v22;
    v7->__hostParentFullHeightUntransformedFrameForDepthLevel.size = v21;
  }

  return v7;
}

- (BOOL)_isAnyDescendantDragging
{
  void *v3;

  if ((*((_BYTE *)&self->_clean + 12) & 0x40) == 0)
  {
    if (-[_UISheetLayoutInfo _isDragging](self, "_isDragging"))
    {
      self->__anyDescendantDragging = 1;
    }
    else
    {
      -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      self->__anyDescendantDragging = objc_msgSend(v3, "_isAnyDescendantDragging");

    }
    *((_DWORD *)&self->_clean + 3) |= 0x40u;
  }
  return self->__anyDescendantDragging;
}

- (BOOL)_isDragging
{
  return self->__dragging;
}

- (void)_setShouldScaleDownBehindDescendants:(BOOL)a3
{
  if (self->__shouldScaleDownBehindDescendants != a3)
  {
    self->__shouldScaleDownBehindDescendants = a3;
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(self);
  }
}

- (void)_setChildSheetLayoutInfo:(id)a3
{
  _UISheetLayoutInfo *v5;
  _UISheetLayoutInfo *v6;
  _UISheetLayoutInfo *v7;

  v5 = (_UISheetLayoutInfo *)a3;
  if (self->__childLayoutInfo != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->__childLayoutInfo, a3);
    v6 = self;
    _UISheetLayoutInfoDirtyAnyDescendantTransitioning(v6);
    _UISheetLayoutInfoDirtyDescendantHiddenAncestorSheetIDs(v6);
    _UISheetLayoutInfoDirtyProposedDepthLevelIncrement(v6);
    _UISheetLayoutInfoDirtyProposedDepthLevel(v6);
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(v6);
    _UISheetLayoutInfoDirtyStacksWithChild(v6);
    _UISheetLayoutInfoDirtyNonFullHeightOffset(v6);
    _UISheetLayoutInfoDirtyOffsetAdjustment(v6);
    _UISheetLayoutInfoDirtyAnyDescendantDragging(v6);
    _UISheetLayoutInfoDirtyAnyDescendantWantsFullScreen(v6);
    _UISheetLayoutInfoDirtyCornerRadii(v6);
    _UISheetLayoutInfoDirtyTransform(v6);
    _UISheetLayoutInfoDirtyPercentDimmedFromOffset(v6);
    _UISheetLayoutInfoDirtyPercentDimmed(v6);
    _UISheetLayoutInfoDirtyGrabberAlpha(v6);
    _UISheetLayoutInfoDirtyAlpha(v6);
    _UISheetLayoutInfoDirtyModelDimmingEnabled(v6);

    v5 = v7;
  }

}

- (void)_layout
{
  _UISheetLayoutInfo *v2;
  void *v3;
  _UISheetLayoutInfo *v4;
  void *v5;
  _UISheetLayoutInfo *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _UISheetLayoutInfo *v10;
  void *v11;
  uint64_t v12;
  _UISheetLayoutInfo *v13;

  v2 = self;
  -[_UISheetLayoutInfo _childLayoutInfo](v2, "_childLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[_UISheetLayoutInfo _childLayoutInfo](v2, "_childLayoutInfo");
      v4 = (_UISheetLayoutInfo *)objc_claimAutoreleasedReturnValue();

      -[_UISheetLayoutInfo _childLayoutInfo](v4, "_childLayoutInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  v6 = v4;
  v13 = v6;
  if (v6)
  {
    v7 = v6;
    do
    {
      objc_msgSend(v7, "_delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_sheetLayoutInfoPrelayout:", v7);

      objc_msgSend(v7, "_parentLayoutInfo");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    while (v9);
    v10 = v13;
    do
    {
      -[_UISheetLayoutInfo _delegate](v10, "_delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_sheetLayoutInfoLayout:", v10);

      -[_UISheetLayoutInfo _parentLayoutInfo](v10, "_parentLayoutInfo");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (_UISheetLayoutInfo *)v12;
    }
    while (v12);
  }

}

- (void)_setScreenSize:(CGSize)a3
{
  if (self->__screenSize.width != a3.width || self->__screenSize.height != a3.height)
  {
    self->__screenSize = a3;
    _UISheetLayoutInfoDirtyPreferredSize(self);
  }
}

- (CGSize)_preferredSize
{
  int64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat Height;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double width;
  double v29;
  CGSize result;
  CGRect v31;

  if ((*((_BYTE *)&self->_clean + 1) & 1) == 0)
  {
    v3 = -[_UISheetLayoutInfo _mode](self, "_mode");
    if (v3 == 1)
    {
      -[_UISheetLayoutInfo _presentedViewController](self, "_presentedViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
      v16 = v15;
      v18 = v17;
      -[_UISheetLayoutInfo _presentingViewController](self, "_presentingViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISheetLayoutInfo _presentedViewController](self, "_presentedViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = _UISheetContentContainerSize(v19, v20, v16, v18);
      v23 = v22;
      -[_UISheetLayoutInfo _screenSize](self, "_screenSize");
      objc_msgSend(v14, "_formSheetSizeForWindowWithSize:screenSize:", v21, v23, v24, v25);
      self->__preferredSize.width = v26;
      self->__preferredSize.height = v27;

    }
    else if (!v3)
    {
      if (qword_1ECD7D418 != -1)
        dispatch_once(&qword_1ECD7D418, &__block_literal_global_36);
      -[_UISheetLayoutInfo _presentedViewController](self, "_presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIViewController _boundsWidthWithMinimumHorizontalContentMarginForView:preservingContentWidth:](UIViewController, "_boundsWidthWithMinimumHorizontalContentMarginForView:preservingContentWidth:", v5, *(double *)&qword_1ECD7D410);
      v7 = v6;

      v8 = __UIViewReadableWidthForFont(0);
      -[_UISheetLayoutInfo _presentedViewController](self, "_presentedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIViewController _boundsWidthWithMinimumHorizontalContentMarginForView:preservingContentWidth:](UIViewController, "_boundsWidthWithMinimumHorizontalContentMarginForView:preservingContentWidth:", v10, v8);
      v12 = v11;

      if (v7 < v12)
        v7 = v12;
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
      Height = CGRectGetHeight(v31);
      self->__preferredSize.width = v7;
      self->__preferredSize.height = Height;
    }
    *(_QWORD *)&self->_clean |= 0x100uLL;
  }
  width = self->__preferredSize.width;
  v29 = self->__preferredSize.height;
  result.height = v29;
  result.width = width;
  return result;
}

- (UIViewController)_presentedViewController
{
  return self->__presentedViewController;
}

- (double)_proposedDepthLevel
{
  void *v3;
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;

  if ((*((_BYTE *)&self->_clean + 1) & 0x10) == 0)
  {
    if (-[_UISheetLayoutInfo _scalesDownBehindDescendants](self, "_scalesDownBehindDescendants"))
    {
      -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[_UISheetLayoutInfo _isHosting](self, "_isHosting") || v3)
      {
        v5 = -[_UISheetLayoutInfo _stacksWithChild](self, "_stacksWithChild");
        v4 = 0.0;
        if (v5)
        {
          objc_msgSend(v3, "_proposedDepthLevel", 0.0);
          v7 = v6;
          v8 = -[_UISheetLayoutInfo _isHidingUnderneathDescendantForDepthLevel](self, "_isHidingUnderneathDescendantForDepthLevel");
          v9 = 0.0;
          if (!v8)
            -[_UISheetLayoutInfo _proposedDepthLevelIncrement](self, "_proposedDepthLevelIncrement", 0.0);
          v4 = v7 + v9;
        }
      }
      else
      {
        -[_UISheetLayoutInfo _remoteProposedDepthLevel](self, "_remoteProposedDepthLevel");
      }
      self->__proposedDepthLevel = v4;

    }
    else
    {
      self->__proposedDepthLevel = 0.0;
    }
    *(_QWORD *)&self->_clean |= 0x1000uLL;
  }
  return self->__proposedDepthLevel;
}

- (BOOL)_scalesDownBehindDescendants
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v8;

  -[_UISheetLayoutInfo _metrics](self, "_metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _containerView](self, "_containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
  v5 = objc_msgSend(v3, "shouldScaleDownBehindDescendantsForContainer:withBounds:", v4);

  if (!-[_UISheetLayoutInfo _shouldScaleDownBehindDescendants](self, "_shouldScaleDownBehindDescendants")
    || -[_UISheetLayoutInfo _isReduceMotionEnabled](self, "_isReduceMotionEnabled")
    || (v5 & 1) == 0 && -[_UISheetLayoutInfo _wantsFullScreen](self, "_wantsFullScreen"))
  {
    return 0;
  }
  -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "verticalSizeClass") != 1;

  return v6;
}

- (BOOL)_shouldScaleDownBehindDescendants
{
  return self->__shouldScaleDownBehindDescendants;
}

- (BOOL)_isReduceMotionEnabled
{
  return self->__reduceMotionEnabled;
}

- (BOOL)_stacksWithChild
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
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;

  if ((*((_BYTE *)&self->_clean + 2) & 0x80) == 0)
  {
    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_UISheetLayoutInfo _stackAlignmentFrame](self, "_stackAlignmentFrame");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      objc_msgSend(v3, "_stackAlignmentFrame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[_UISheetLayoutInfo _metrics](self, "_metrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      self->__stacksWithChild = _UISheetLayoutInfoStacks(v20, v5, v7, v9, v11, v13, v15, v17, v19);

    }
    else
    {
      self->__stacksWithChild = 0;
    }
    *(_QWORD *)&self->_clean |= 0x800000uLL;

  }
  return self->__stacksWithChild;
}

- (double)_proposedDepthLevelIncrement
{
  void *v3;
  double v4;

  if ((*((_BYTE *)&self->_clean + 1) & 8) == 0)
  {
    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "_isHidingUnderneathDescendantForDepthLevel"))
      objc_msgSend(v3, "_proposedDepthLevelIncrement");
    else
      objc_msgSend(v3, "_percentFullHeight");
    self->__proposedDepthLevelIncrement = v4;
    *(_QWORD *)&self->_clean |= 0x800uLL;

  }
  return self->__proposedDepthLevelIncrement;
}

- (double)_percentFullHeight
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double MaxY;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;

  if ((*((_BYTE *)&self->_clean + 1) & 2) == 0)
  {
    -[_UISheetLayoutInfo _stackAlignmentFrame](self, "_stackAlignmentFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
    v13 = v4;
    v14 = v6;
    v15 = v8;
    v16 = v10;
    if (v12)
      MaxY = CGRectGetMaxY(*(CGRect *)&v13);
    else
      MaxY = CGRectGetMinY(*(CGRect *)&v13);
    v18 = MaxY;
    -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayScale");
    v21 = v20;

    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_value");
    UIRoundToScale(v23, v21);
    v25 = v24;
    UIRoundToScale(v18, v21);
    if (v25 == v26)
    {

    }
    else
    {
      v28 = -[_UISheetLayoutInfo _isFunctionallyFullScreen](self, "_isFunctionallyFullScreen");

      v27 = 0.0;
      if (!v28)
      {
LABEL_12:
        self->__percentFullHeight = v27;
        *(_QWORD *)&self->_clean |= 0x200uLL;

        return self->__percentFullHeight;
      }
    }
    if ((unint64_t)objc_msgSend(v11, "count", v27) <= 1)
    {
      -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
      v31 = v32;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_value");
      v31 = v30;

    }
    -[_UISheetLayoutInfo _currentOffset](self, "_currentOffset");
    v27 = fmax(fmin((v33 - v31) / (v18 - v31), 1.0), 0.0);
    goto LABEL_12;
  }
  return self->__percentFullHeight;
}

- (BOOL)_isHidingUnderneathDescendantForDepthLevel
{
  _UISheetLayoutInfo *v2;

  v2 = self;
  if ((*((_BYTE *)&self->_clean + 1) & 4) != 0)
  {
    LOBYTE(self) = self->__hidingUnderneathDescendantForDepthLevel;
  }
  else
  {
    LODWORD(self) = -[_UISheetLayoutInfo _isHidingUnderneathDescendant](self, "_isHidingUnderneathDescendant");
    if ((_DWORD)self)
      LOBYTE(self) = -[_UISheetLayoutInfo _isEdgeAttached](v2, "_isEdgeAttached");
    v2->__hidingUnderneathDescendantForDepthLevel = (char)self;
    *(_QWORD *)&v2->_clean |= 0x400uLL;
  }
  return (char)self;
}

- (void)_setWantsFullScreen:(BOOL)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__wantsFullScreen != a3)
  {
    self->__wantsFullScreen = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(v3);
    _UISheetLayoutInfoDirtyFunctionallyFullScreen(v3);
    _UISheetLayoutInfoDirtyPercentFullScreen(v3);
    _UISheetLayoutInfoDirtyAnyDescendantWantsFullScreen(v3);

  }
}

- (void)_setContainerBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UISheetLayoutInfo *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__containerBounds, a3))
  {
    self->__containerBounds.origin.x = x;
    self->__containerBounds.origin.y = y;
    self->__containerBounds.size.width = width;
    self->__containerBounds.size.height = height;
    v8 = self;
    _UISheetLayoutInfoDirtyUnsafeInsets(v8);
    _UISheetLayoutInfoDirtyPreferredSize(v8);
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(v8);
    _UISheetLayoutInfoDirtyEdgeAttached(v8);
    _UISheetLayoutInfoDirtyStackAlignmentFrame(v8);
    _UISheetLayoutInfoDirtyFullHeightUntransformedFrame(v8);
    _UISheetLayoutInfoDirtyDismissOffset(v8);
    _UISheetLayoutInfoDirtyRawCurrentOffset(v8);
    _UISheetLayoutInfoDirtyNonFullHeightOffset(v8);
    _UISheetLayoutInfoDirtyActiveDetents(v8);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMinimumOffset(v8);
    _UISheetLayoutInfoDirtyRubberBandExtentBeyondMaximumOffset(v8);
    _UISheetLayoutInfoDirtyHostedUntransformedFrame(v8);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v8);
    _UISheetLayoutInfoDirtyCornerRadii(v8);
    _UISheetLayoutInfoDirtyShouldDimmingIgnoreTouches(v8);

  }
}

- (void)_setContainerTraitCollection:(id)a3
{
  _UISheetLayoutInfo *v5;
  uint64_t clean;
  id v7;

  v7 = a3;
  if (!-[UITraitCollection isEqual:](self->__containerTraitCollection, "isEqual:"))
  {
    objc_storeStrong((id *)&self->__containerTraitCollection, a3);
    v5 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v5);
    _UISheetLayoutInfoDirtyMargins(v5);
    _UISheetLayoutInfoDirtyPreferredSize(v5);
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(v5);
    _UISheetLayoutInfoDirtyEdgeAttached(v5);
    _UISheetLayoutInfoDirtyForcedFullScreen(v5);
    clean = (uint64_t)v5->_clean;
    if ((clean & 0x200000000) != 0)
    {
      *(_QWORD *)&v5->_clean = clean & 0xFFFFFFFDFFFFFFFFLL;
      _UISheetLayoutInfoDirtyActiveDetents(v5);
    }
    _UISheetLayoutInfoDirtyActiveDetents(v5);
    _UISheetLayoutInfoDirtyStackAlignmentFrame(v5);
    _UISheetLayoutInfoDirtyUntransformedFrame(v5);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v5);
    _UISheetLayoutInfoDirtyPercentFullHeight(v5);
    _UISheetLayoutInfoDirtyInteractionEnabled(v5);

  }
}

- (_UISheetLayoutInfoDelegate)_delegate
{
  return (_UISheetLayoutInfoDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (NSSet)_descendantHiddenAncestorSheetIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;
  NSSet *descendantHiddenAncestorSheetIDs;

  if ((*(_BYTE *)&self->_clean & 8) == 0)
  {
    -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "_isEffectivePresented"))
    {
      objc_msgSend(v4, "_hiddenAncestorSheetID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_descendantHiddenAncestorSheetIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        objc_msgSend(v6, "setByAddingObject:", v5);
        v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = v6;
      }
      descendantHiddenAncestorSheetIDs = self->__descendantHiddenAncestorSheetIDs;
      self->__descendantHiddenAncestorSheetIDs = v8;

    }
    else
    {
      v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      v5 = self->__descendantHiddenAncestorSheetIDs;
      self->__descendantHiddenAncestorSheetIDs = v9;
    }

    *(_QWORD *)&self->_clean |= 8uLL;
  }
  return self->__descendantHiddenAncestorSheetIDs;
}

- (_UISheetLayoutInfo)_childLayoutInfo
{
  return self->__childLayoutInfo;
}

- (id)_indexOfCurrentActiveOrDismissDetentWasInvalidated
{
  return self->__indexOfCurrentActiveOrDismissDetentWasInvalidated;
}

- (NSString)_hiddenAncestorSheetID
{
  return self->__hiddenAncestorSheetID;
}

- (void)_setContainerView:(id)a3
{
  UIView *v5;
  UIView *v6;
  id *p_containerView;
  _BOOL4 v8;
  UIView *containerView;
  BOOL v10;
  _BOOL4 v11;
  UIView *v12;

  v5 = (UIView *)a3;
  v6 = v5;
  if (self->__containerView != v5)
  {
    v12 = v5;
    p_containerView = (id *)&self->__containerView;
    v8 = -[_UISheetLayoutInfo _tucksIntoUnsafeAreaInCompactHeight](self, "_tucksIntoUnsafeAreaInCompactHeight");
    containerView = self->__containerView;
    if (containerView)
      v10 = !v8;
    else
      v10 = 1;
    if (!v10)
      -[UIView _removeBoundingPathChangeObserver:](containerView, "_removeBoundingPathChangeObserver:", self);
    objc_storeStrong((id *)&self->__containerView, a3);
    if (*p_containerView)
      v11 = v8;
    else
      v11 = 0;
    v6 = v12;
    if (v11)
    {
      objc_msgSend(*p_containerView, "_addBoundingPathChangeObserver:", self);
      v6 = v12;
    }
  }

}

- (UIEdgeInsets)_marginsWhenFloating
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double top;
  double left;
  double bottom;
  double right;
  double v24;
  double v25;
  UIEdgeInsets result;

  if ((*(_BYTE *)&self->_clean & 0x40) == 0)
  {
    -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
    v24 = v4;
    v25 = v3;
    v6 = v5;
    v8 = v7;
    -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISheetLayoutInfo _marginInCompactHeight](self, "_marginInCompactHeight");
    v11 = v10;
    -[_UISheetLayoutInfo _marginInRegularWidthRegularHeight](self, "_marginInRegularWidthRegularHeight");
    v13 = v12;
    v14 = -[_UISheetLayoutInfo _tucksIntoUnsafeAreaInCompactHeight](self, "_tucksIntoUnsafeAreaInCompactHeight");
    -[_UISheetLayoutInfo _unsafeInsets](self, "_unsafeInsets");
    v15 = -[_UISheetLayoutInfo _allowsAsymmetricVerticalMargins](self, "_allowsAsymmetricVerticalMargins");
    -[_UISheetLayoutInfo _metrics](self, "_metrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->__marginsWhenFloating.top = _UISheetLayoutInfoMargins(v9, 0, v14, v15, v16, v25, v24, v6, v8, v11, v13);
    self->__marginsWhenFloating.left = v17;
    self->__marginsWhenFloating.bottom = v18;
    self->__marginsWhenFloating.right = v19;

    *(_QWORD *)&self->_clean |= 0x40uLL;
  }
  top = self->__marginsWhenFloating.top;
  left = self->__marginsWhenFloating.left;
  bottom = self->__marginsWhenFloating.bottom;
  right = self->__marginsWhenFloating.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_tucksIntoUnsafeAreaInCompactHeight
{
  return self->__tucksIntoUnsafeAreaInCompactHeight;
}

- (UIEdgeInsets)_unsafeInsets
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  double right;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double left;
  double MinX;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MaxX;
  double bottom;
  double top;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  UIEdgeInsets result;

  if ((*(_BYTE *)&self->_clean & 0x20) != 0)
  {
    top = self->__unsafeInsets.top;
    left = self->__unsafeInsets.left;
    bottom = self->__unsafeInsets.bottom;
    right = self->__unsafeInsets.right;
  }
  else
  {
    -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
    v37 = v4;
    v38 = v3;
    v6 = v5;
    v8 = v7;
    -[_UISheetLayoutInfo _containerView](self, "_containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    right = 0.0;
    objc_msgSend(v9, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", 2, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    left = 0.0;
    if (!CGRectIsNull(v39))
    {
      v40.origin.x = v12;
      v40.origin.y = v14;
      v40.size.width = v16;
      v40.size.height = v18;
      MinX = CGRectGetMinX(v40);
      v41.origin.y = v37;
      v41.origin.x = v38;
      v41.size.width = v6;
      v41.size.height = v8;
      left = MinX - CGRectGetMinX(v41);
    }
    -[_UISheetLayoutInfo _containerView](self, "_containerView", *(_QWORD *)&v8, *(_QWORD *)&v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_rectTuckedAgainstBoundingPathEdge:withSize:cornerRadii:minimumPadding:", 8, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v42.origin.x = v23;
    v42.origin.y = v25;
    v42.size.width = v27;
    v42.size.height = v29;
    if (!CGRectIsNull(v42))
    {
      v43.origin.x = v38;
      v43.origin.y = v37;
      v43.size.height = v35;
      v43.size.width = v36;
      MaxX = CGRectGetMaxX(v43);
      v44.origin.x = v23;
      v44.origin.y = v25;
      v44.size.width = v27;
      v44.size.height = v29;
      right = MaxX - CGRectGetMaxX(v44);
    }
    self->__unsafeInsets.top = 0.0;
    self->__unsafeInsets.left = left;
    self->__unsafeInsets.bottom = 0.0;
    self->__unsafeInsets.right = right;
    *(_QWORD *)&self->_clean |= 0x20uLL;
    bottom = 0.0;
    top = 0.0;
  }
  v33 = left;
  v34 = right;
  result.right = v34;
  result.bottom = bottom;
  result.left = v33;
  result.top = top;
  return result;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (double)_marginInRegularWidthRegularHeight
{
  return self->__marginInRegularWidthRegularHeight;
}

- (double)_marginInCompactHeight
{
  return self->__marginInCompactHeight;
}

- (BOOL)_allowsAsymmetricVerticalMargins
{
  return self->__allowsAsymmetricVerticalMargins;
}

- (double)maximumDetentValue
{
  double Height;
  _BOOL4 v4;
  double v5;
  _BOOL4 v6;
  double v7;
  CGRect v9;

  -[_UISheetLayoutInfo _fullHeightPresentedViewFrame](self, "_fullHeightPresentedViewFrame");
  Height = CGRectGetHeight(v9);
  v4 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
  v5 = 0.0;
  if (v4)
  {
    v6 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted", 0.0);
    -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
    if (!v6)
      v5 = v7;
  }
  return Height - v5;
}

- (UIEdgeInsets)_containerSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__containerSafeAreaInsets.top;
  left = self->__containerSafeAreaInsets.left;
  bottom = self->__containerSafeAreaInsets.bottom;
  right = self->__containerSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)_ancestorSheetIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *ancestorSheetIDs;

  if ((*(_BYTE *)&self->_clean & 4) == 0)
  {
    -[_UISheetLayoutInfo _sheetID](self, "_sheetID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ancestorSheetIDs");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v7 = (void *)v5;
    v8 = v7;

    if (v3)
    {
      objc_msgSend(v8, "arrayByAddingObject:", v3);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (NSArray *)v8;
    }
    ancestorSheetIDs = self->__ancestorSheetIDs;
    self->__ancestorSheetIDs = v9;

    *(_QWORD *)&self->_clean |= 4uLL;
  }
  return self->__ancestorSheetIDs;
}

- (NSString)_sheetID
{
  return self->__sheetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableActiveDetents, 0);
  objc_storeStrong((id *)&self->__mutableDetentValues, 0);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong(&self->__rubberBandExtentBeyondMaximumOffsetWasInvalidated, 0);
  objc_storeStrong(&self->__rubberBandExtentBeyondMinimumOffsetWasInvalidated, 0);
  objc_storeStrong(&self->__indexOfCurrentActiveOrDismissDetentWasInvalidated, 0);
  objc_storeStrong((id *)&self->__childLayoutInfo, 0);
  objc_destroyWeak((id *)&self->__parentLayoutInfo);
  objc_storeStrong(&self->__currentOffsetGetter, 0);
  objc_storeStrong((id *)&self->__hiddenAncestorSheetID, 0);
  objc_storeStrong((id *)&self->__sheetID, 0);
  objc_storeStrong((id *)&self->__floatingAppearance, 0);
  objc_storeStrong((id *)&self->__edgeAttachedCompactHeightAppearance, 0);
  objc_storeStrong((id *)&self->__standardAppearance, 0);
  objc_storeStrong((id *)&self->__selectedDetentIdentifier, 0);
  objc_storeStrong((id *)&self->__detents, 0);
  objc_storeStrong((id *)&self->__containerTraitCollection, 0);
  objc_storeStrong((id *)&self->__metrics, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->__presentedViewController, 0);
  objc_destroyWeak((id *)&self->__presentingViewController);
  objc_storeStrong((id *)&self->__effectiveAppearance, 0);
  objc_storeStrong((id *)&self->__descendantHiddenAncestorSheetIDs, 0);
  objc_storeStrong((id *)&self->__ancestorSheetIDs, 0);
}

- (void)_setAdditionalMinimumTopInset:(double)a3
{
  if (self->__additionalMinimumTopInset != a3)
  {
    self->__additionalMinimumTopInset = a3;
    _UISheetLayoutInfoDirtyStackAlignmentFrame(self);
  }
}

- (void)_setSourceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__sourceFrame, a3))
  {
    self->__sourceFrame.origin.x = x;
    self->__sourceFrame.origin.y = y;
    self->__sourceFrame.size.width = width;
    self->__sourceFrame.size.height = height;
    _UISheetLayoutInfoDirtyStackAlignmentFrame(self);
  }
}

- (void)_setHorizontalAlignment:(int64_t)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__horizontalAlignment != a3)
  {
    self->__horizontalAlignment = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyDismissesHorizontally(v3);
    _UISheetLayoutInfoDirtyStackAlignmentFrame(v3);
    _UISheetLayoutInfoDirtyRawCurrentOffset(v3);

  }
}

- (void)_setMarginInCompactHeight:(double)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__marginInCompactHeight != a3)
  {
    self->__marginInCompactHeight = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v3);
    _UISheetLayoutInfoDirtyMargins(v3);

  }
}

- (void)_setMarginInRegularWidthRegularHeight:(double)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__marginInRegularWidthRegularHeight != a3)
  {
    self->__marginInRegularWidthRegularHeight = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v3);
    _UISheetLayoutInfoDirtyMargins(v3);

  }
}

- (void)_setTucksIntoUnsafeAreaInCompactHeight:(BOOL)a3
{
  _BOOL4 v3;
  _UISheetLayoutInfo *v4;
  void *v5;
  id v6;

  if (self->__tucksIntoUnsafeAreaInCompactHeight != a3)
  {
    v3 = a3;
    self->__tucksIntoUnsafeAreaInCompactHeight = a3;
    v4 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v4);
    _UISheetLayoutInfoDirtyMargins(v4);

    -[_UISheetLayoutInfo _containerView](v4, "_containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "_addBoundingPathChangeObserver:", v4);
    else
      objc_msgSend(v5, "_removeBoundingPathChangeObserver:", v4);

  }
}

- (void)_setAllowsAsymmetricVerticalMargins:(BOOL)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__allowsAsymmetricVerticalMargins != a3)
  {
    self->__allowsAsymmetricVerticalMargins = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyMarginsWhenFloating(v3);
    _UISheetLayoutInfoDirtyMargins(v3);

  }
}

- (void)_setKeyboardFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__keyboardFrame, a3))
  {
    self->__keyboardFrame.origin.x = x;
    self->__keyboardFrame.origin.y = y;
    self->__keyboardFrame.size.width = width;
    self->__keyboardFrame.size.height = height;
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(self);
  }
}

- (void)_setRemoteKeyboardFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__remoteKeyboardFrame, a3))
  {
    self->__remoteKeyboardFrame.origin.x = x;
    self->__remoteKeyboardFrame.origin.y = y;
    self->__remoteKeyboardFrame.size.width = width;
    self->__remoteKeyboardFrame.size.height = height;
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(self);
  }
}

- (void)_setContainsFirstResponder:(BOOL)a3
{
  if (self->__containsFirstResponder != a3)
  {
    self->__containsFirstResponder = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setFirstResponderRequiresKeyboard:(BOOL)a3
{
  if (self->__firstResponderRequiresKeyboard != a3)
  {
    self->__firstResponderRequiresKeyboard = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setRemoteContainsFirstResponder:(BOOL)a3
{
  if (self->__remoteContainsFirstResponder != a3)
  {
    self->__remoteContainsFirstResponder = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setRemoteFirstResponderRequiresKeyboard:(BOOL)a3
{
  if (self->__remoteFirstResponderRequiresKeyboard != a3)
  {
    self->__remoteFirstResponderRequiresKeyboard = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setShouldAdjustDetentsToAvoidKeyboard:(BOOL)a3
{
  if (self->__shouldAdjustDetentsToAvoidKeyboard != a3)
  {
    self->__shouldAdjustDetentsToAvoidKeyboard = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setWantsEdgeAttached:(BOOL)a3
{
  if (self->__wantsEdgeAttached != a3)
  {
    self->__wantsEdgeAttached = a3;
    _UISheetLayoutInfoDirtyEdgeAttached(self);
  }
}

- (void)_setWantsEdgeAttachedInCompactHeight:(BOOL)a3
{
  if (self->__wantsEdgeAttachedInCompactHeight != a3)
  {
    self->__wantsEdgeAttachedInCompactHeight = a3;
    _UISheetLayoutInfoDirtyForcedFullScreen(self);
  }
}

- (void)_setWantsFloatingInRegularWidthCompactHeight:(BOOL)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__wantsFloatingInRegularWidthCompactHeight != a3)
  {
    self->__wantsFloatingInRegularWidthCompactHeight = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyEdgeAttached(v3);
    _UISheetLayoutInfoDirtyForcedFullScreen(v3);

  }
}

- (void)_setWantsInvertedWhenFloating:(BOOL)a3
{
  if (self->__wantsInvertedWhenFloating != a3)
  {
    self->__wantsInvertedWhenFloating = a3;
    _UISheetLayoutInfoDirtyInverted(self);
  }
}

- (void)_setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)a3
{
  if (self->__widthFollowsPreferredContentSizeWhenEdgeAttached != a3)
  {
    self->__widthFollowsPreferredContentSizeWhenEdgeAttached = a3;
    _UISheetLayoutInfoDirtyStackAlignmentFrame(self);
  }
}

- (void)_setHidden:(BOOL)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__hidden != a3)
  {
    self->__hidden = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyEffectivePresented(v3);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v3);

  }
}

- (void)_setPresentsWithGesture:(BOOL)a3
{
  if (self->__presentsWithGesture != a3)
  {
    self->__presentsWithGesture = a3;
    _UISheetLayoutInfoDirtyInteractionEnabled(self);
  }
}

- (void)_setReduceMotionEnabled:(BOOL)a3
{
  if (self->__reduceMotionEnabled != a3)
  {
    self->__reduceMotionEnabled = a3;
    _UISheetLayoutInfoDirtyScalesDownBehindDescendants(self);
  }
}

- (void)_setPeeksWhenFloating:(BOOL)a3
{
  if (self->__peeksWhenFloating != a3)
  {
    self->__peeksWhenFloating = a3;
    _UISheetLayoutInfoDirtyTransform(self);
  }
}

- (void)_setHosting:(BOOL)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__hosting != a3)
  {
    self->__hosting = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyProposedDepthLevel(v3);
    _UISheetLayoutInfoDirtyEffectiveKeyboardFrame(v3);
    _UISheetLayoutInfoDirtyActiveDetents(v3);
    _UISheetLayoutInfoDirtyHostedUntransformedFrame(v3);
    _UISheetLayoutInfoDirtyFrameOfPresentedViewInContainerView(v3);
    _UISheetLayoutInfoDirtyHostedCornerRadii(v3);
    _UISheetLayoutInfoDirtyTransform(v3);
    _UISheetLayoutInfoDirtyGrabberAlpha(v3);
    _UISheetLayoutInfoDirtyInteractionEnabled(v3);
    _UISheetLayoutInfoDirtyPercentDimmed(v3);
    _UISheetLayoutInfoDirtyShadowOpacity(v3);
    _UISheetLayoutInfoDirtyShouldPresentedViewControllerControlStatusBarAppearance(v3);

  }
}

- (void)_setDismissible:(BOOL)a3
{
  if (self->__dismissible != a3)
  {
    self->__dismissible = a3;
    _UISheetLayoutInfoDirtyEffectiveDismissible(self);
  }
}

- (void)_setDetents:(id)a3
{
  NSArray *v5;
  NSArray *detents;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSArray isEqualToArray:](self->__detents, "isEqualToArray:"))
  {
    if (!objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetMetrics.m"), 1887, CFSTR("_detents must have at least one element."));

    }
    v5 = (NSArray *)objc_msgSend(v8, "copy");
    detents = self->__detents;
    self->__detents = v5;

    _UISheetLayoutInfoDirtyActiveDetents(self);
    -[_UISheetLayoutInfo _setLatestUserChosenOffset:](self, "_setLatestUserChosenOffset:", 1.79769313e308);
  }

}

- (void)_setSelectedDetentIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *selectedDetentIdentifier;
  NSString *v10;

  v4 = a3;
  v5 = self->__selectedDetentIdentifier;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    selectedDetentIdentifier = self->__selectedDetentIdentifier;
    self->__selectedDetentIdentifier = v8;

    _UISheetLayoutInfoDirtyActiveDetents(self);
    -[_UISheetLayoutInfo _setLatestUserChosenOffset:](self, "_setLatestUserChosenOffset:", 1.79769313e308);
  }
LABEL_9:

}

- (void)_setStandardAppearance:(id)a3
{
  id v5;
  _UISheetPresentationControllerAppearance *v6;
  _UISheetPresentationControllerAppearance *v7;
  BOOL v8;
  uint64_t clean;
  _UISheetPresentationControllerAppearance *v10;

  v5 = a3;
  v6 = self->__standardAppearance;
  v7 = (_UISheetPresentationControllerAppearance *)v5;
  v10 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UISheetPresentationControllerAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->__standardAppearance, a3);
    clean = (uint64_t)self->_clean;
    if ((clean & 0x200000000) != 0)
    {
      *(_QWORD *)&self->_clean = clean & 0xFFFFFFFDFFFFFFFFLL;
      _UISheetLayoutInfoDirtyActiveDetents(self);
    }
  }
LABEL_10:

}

- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3
{
  id v5;
  _UISheetPresentationControllerAppearance *v6;
  _UISheetPresentationControllerAppearance *v7;
  BOOL v8;
  uint64_t clean;
  _UISheetPresentationControllerAppearance *v10;

  v5 = a3;
  v6 = self->__edgeAttachedCompactHeightAppearance;
  v7 = (_UISheetPresentationControllerAppearance *)v5;
  v10 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UISheetPresentationControllerAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->__edgeAttachedCompactHeightAppearance, a3);
    clean = (uint64_t)self->_clean;
    if ((clean & 0x200000000) != 0)
    {
      *(_QWORD *)&self->_clean = clean & 0xFFFFFFFDFFFFFFFFLL;
      _UISheetLayoutInfoDirtyActiveDetents(self);
    }
  }
LABEL_10:

}

- (void)_setFloatingAppearance:(id)a3
{
  id v5;
  _UISheetPresentationControllerAppearance *v6;
  _UISheetPresentationControllerAppearance *v7;
  BOOL v8;
  uint64_t clean;
  _UISheetPresentationControllerAppearance *v10;

  v5 = a3;
  v6 = self->__floatingAppearance;
  v7 = (_UISheetPresentationControllerAppearance *)v5;
  v10 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UISheetPresentationControllerAppearance isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->__floatingAppearance, a3);
    clean = (uint64_t)self->_clean;
    if ((clean & 0x200000000) != 0)
    {
      *(_QWORD *)&self->_clean = clean & 0xFFFFFFFDFFFFFFFFLL;
      _UISheetLayoutInfoDirtyActiveDetents(self);
    }
  }
LABEL_10:

}

- (void)_setSheetID:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  char v8;
  NSString *v9;

  v5 = a3;
  v6 = self->__sheetID;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->__sheetID, a3);
    _UISheetLayoutInfoDirtyAncestorSheetIDs(self);
  }
LABEL_9:

}

- (void)_setHiddenAncestorSheetID:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  char v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  v5 = a3;
  v6 = self->__hiddenAncestorSheetID;
  v7 = (NSString *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    v9 = v11;
  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->__hiddenAncestorSheetID, a3);
    -[_UISheetLayoutInfo _parentLayoutInfo](self, "_parentLayoutInfo");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
      _UISheetLayoutInfoDirtyDescendantHiddenAncestorSheetIDs(v10);
  }

LABEL_11:
}

- (void)_setShouldDismissWhenTappedOutside:(BOOL)a3
{
  if (self->__shouldDismissWhenTappedOutside != a3)
  {
    self->__shouldDismissWhenTappedOutside = a3;
    _UISheetLayoutInfoDirtyShouldDimmingIgnoreTouches(self);
  }
}

- (void)_setAllowsInteractiveDismissWhenFullScreen:(BOOL)a3
{
  if (self->__allowsInteractiveDismissWhenFullScreen != a3)
  {
    self->__allowsInteractiveDismissWhenFullScreen = a3;
    _UISheetLayoutInfoDirtyInteractionEnabled(self);
  }
}

- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3
{
  if (self->__prefersScrollingResizesWhenDetentDirectionIsDown != a3)
  {
    self->__prefersScrollingResizesWhenDetentDirectionIsDown = a3;
    _UISheetLayoutInfoDirtyScrollInteractionEnabled(self);
  }
}

- (void)_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3
{
  _UISheetLayoutInfo *v3;
  id v4;

  if (self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge != a3)
  {
    self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = a3;
    v3 = self;
    -[_UISheetLayoutInfo _delegate](v3, "_delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sheetLayoutInfoDidInvalidateOutput:", v3);

  }
}

- (void)_setLatestUserChosenOffset:(double)a3
{
  if (self->__latestUserChosenOffset != a3)
  {
    self->__latestUserChosenOffset = a3;
    _UISheetLayoutInfoDirtyActiveDetents(self);
  }
}

- (void)_setWantsGrabber:(BOOL)a3
{
  if (self->__wantsGrabber != a3)
  {
    self->__wantsGrabber = a3;
    _UISheetLayoutInfoDirtyGrabberAlpha(self);
  }
}

- (void)_setGrabberSpacing:(double)a3
{
  _UISheetLayoutInfo *v3;
  id v4;

  if (self->__grabberSpacing != a3)
  {
    self->__grabberSpacing = a3;
    v3 = self;
    -[_UISheetLayoutInfo _delegate](v3, "_delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sheetLayoutInfoDidInvalidateOutput:", v3);

  }
}

- (void)_setInsetsContentViewForGrabber:(BOOL)a3
{
  _UISheetLayoutInfo *v3;
  id v4;

  if (self->__insetsContentViewForGrabber != a3)
  {
    self->__insetsContentViewForGrabber = a3;
    v3 = self;
    -[_UISheetLayoutInfo _delegate](v3, "_delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sheetLayoutInfoDidInvalidateOutput:", v3);

  }
}

- (void)_setGrabberBlurEnabled:(BOOL)a3
{
  _UISheetLayoutInfo *v3;
  id v4;

  if (self->__grabberBlurEnabled != a3)
  {
    self->__grabberBlurEnabled = a3;
    v3 = self;
    -[_UISheetLayoutInfo _delegate](v3, "_delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sheetLayoutInfoDidInvalidateOutput:", v3);

  }
}

- (void)_setDragging:(BOOL)a3
{
  _UISheetLayoutInfo *v3;

  if (self->__dragging != a3)
  {
    self->__dragging = a3;
    v3 = self;
    _UISheetLayoutInfoDirtyAnyDescendantDragging(v3);
    _UISheetLayoutInfoDirtyShouldDimmingIgnoreTouches(v3);

  }
}

- (void)_setDismissSourceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UISheetLayoutInfo *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__dismissSourceFrame, a3))
  {
    self->__dismissSourceFrame.origin.x = x;
    self->__dismissSourceFrame.origin.y = y;
    self->__dismissSourceFrame.size.width = width;
    self->__dismissSourceFrame.size.height = height;
    v8 = self;
    _UISheetLayoutInfoDirtyDismissOffset(v8);
    _UISheetLayoutInfoDirtyUntransformedFrame(v8);

  }
}

- (void)_setDismissCornerRadius:(double)a3
{
  if (self->__dismissCornerRadius != a3)
  {
    self->__dismissCornerRadius = a3;
    _UISheetLayoutInfoDirtyCornerRadii(self);
  }
}

- (void)_setPreferredCornerRadius:(double)a3
{
  if (self->__preferredCornerRadius != a3)
  {
    self->__preferredCornerRadius = a3;
    _UISheetLayoutInfoDirtyCornerRadii(self);
  }
}

- (void)_setPreferredShadowOpacity:(double)a3
{
  if (self->__preferredShadowOpacity != a3)
  {
    self->__preferredShadowOpacity = a3;
    _UISheetLayoutInfoDirtyShadowOpacity(self);
  }
}

- (void)_setShadowRadius:(double)a3
{
  _UISheetLayoutInfo *v3;
  id v4;

  if (self->__shadowRadius != a3)
  {
    self->__shadowRadius = a3;
    v3 = self;
    -[_UISheetLayoutInfo _delegate](v3, "_delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sheetLayoutInfoDidInvalidateOutput:", v3);

  }
}

- (void)_setRemoteProposedDepthLevel:(double)a3
{
  if (self->__remoteProposedDepthLevel != a3)
  {
    self->__remoteProposedDepthLevel = a3;
    _UISheetLayoutInfoDirtyProposedDepthLevel(self);
  }
}

- (void)_setHostParentStackAlignmentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UISheetLayoutInfo *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__hostParentStackAlignmentFrame, a3))
  {
    self->__hostParentStackAlignmentFrame.origin.x = x;
    self->__hostParentStackAlignmentFrame.origin.y = y;
    self->__hostParentStackAlignmentFrame.size.width = width;
    self->__hostParentStackAlignmentFrame.size.height = height;
    v8 = self;
    _UISheetLayoutInfoDirtyDepthLevel(v8);
    _UISheetLayoutInfoDirtyParentDepthLevel(v8);

  }
}

- (void)_setHostParentFullHeightUntransformedFrameForDepthLevel:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__hostParentFullHeightUntransformedFrameForDepthLevel, a3))
  {
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x = x;
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y = y;
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width = width;
    self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height = height;
    _UISheetLayoutInfoDirtyFullHeightUntransformedFrameForDepthLevel(self);
  }
}

- (void)_setHostParentDepthLevel:(double)a3
{
  if (self->__hostParentDepthLevel != a3)
  {
    self->__hostParentDepthLevel = a3;
    _UISheetLayoutInfoDirtyParentDepthLevel(self);
  }
}

- (BOOL)_isAnyDescendantTransitioning
{
  void *v3;

  if ((*(_BYTE *)&self->_clean & 2) == 0)
  {
    if (-[_UISheetLayoutInfo _isTransitioning](self, "_isTransitioning"))
    {
      self->__anyDescendantTransitioning = 1;
    }
    else
    {
      -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      self->__anyDescendantTransitioning = objc_msgSend(v3, "_isAnyDescendantTransitioning");

    }
    *(_QWORD *)&self->_clean |= 2uLL;
  }
  return self->__anyDescendantTransitioning;
}

- (BOOL)_supportsAttachedEdge
{
  void *v4;
  void *v5;
  char v6;

  if (-[_UISheetLayoutInfo _alwaysAllowsEdgeAttached](self, "_alwaysAllowsEdgeAttached"))
    return 1;
  -[_UISheetLayoutInfo _metrics](self, "_metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "supportsEdgeAttachedForTraitCollection:", v5);

  return v6;
}

- (double)_fullDetentValue
{
  _BOOL4 v3;
  double v4;
  double v5;
  double MinY;
  double v7;
  CGRect v9;

  v3 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
  -[_UISheetLayoutInfo maximumDetentValue](self, "maximumDetentValue");
  v5 = v4;
  if (v3)
  {
    -[_UISheetLayoutInfo _fullHeightPresentedViewFrame](self, "_fullHeightPresentedViewFrame");
    MinY = CGRectGetMinY(v9);
    -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
    return v5 + MinY - v7;
  }
  return v5;
}

- (BOOL)_isExpanded
{
  _UISheetLayoutInfo *v2;
  double v3;
  double v4;
  double v5;

  v2 = self;
  if ((*((_BYTE *)&self->_clean + 12) & 4) != 0)
  {
    LOBYTE(self) = self->__expanded;
  }
  else
  {
    LODWORD(self) = -[_UISheetLayoutInfo _hasActiveFullDetent](self, "_hasActiveFullDetent");
    if ((_DWORD)self)
    {
      LODWORD(self) = -[_UISheetLayoutInfo _isEdgeAttached](v2, "_isEdgeAttached");
      if ((_DWORD)self)
      {
        if (-[_UISheetLayoutInfo _isFunctionallyFullScreen](v2, "_isFunctionallyFullScreen"))
        {
          LOBYTE(self) = 0;
        }
        else
        {
          -[_UISheetLayoutInfo _currentOffset](v2, "_currentOffset");
          v4 = v3;
          -[_UISheetLayoutInfo _containerSafeAreaInsets](v2, "_containerSafeAreaInsets");
          LOBYTE(self) = v4 <= v5;
        }
      }
    }
    v2->__expanded = (char)self;
    *((_DWORD *)&v2->_clean + 3) |= 4u;
  }
  return (char)self;
}

- (BOOL)_anyDescendantWantsFullScreen
{
  void *v3;

  if ((*((_BYTE *)&self->_clean + 12) & 0x80) == 0)
  {
    if (-[_UISheetLayoutInfo _wantsFullScreen](self, "_wantsFullScreen")
      && -[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented"))
    {
      self->__anyDescendantWantsFullScreen = 1;
    }
    else
    {
      -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      self->__anyDescendantWantsFullScreen = objc_msgSend(v3, "_anyDescendantWantsFullScreen");

    }
    *((_DWORD *)&self->_clean + 3) |= 0x80u;
  }
  return self->__anyDescendantWantsFullScreen;
}

- (NSArray)_detentValues
{
  id v3;

  v3 = -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
  return (NSArray *)self->__mutableDetentValues;
}

- (int64_t)_adjustedIndexOfCurrentActiveDetentForContainedFirstResponder
{
  id v3;

  v3 = -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
  return self->__adjustedIndexOfCurrentActiveDetentForContainedFirstResponder;
}

- (int64_t)_numberOfActiveNonDismissDetents
{
  id v3;

  v3 = -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
  return self->__numberOfActiveNonDismissDetents;
}

- (int64_t)_indexOfActiveDetentForTappingGrabber
{
  int64_t v3;
  int64_t result;

  if ((*((_BYTE *)&self->_clean + 3) & 0x10) != 0)
    return self->__indexOfActiveDetentForTappingGrabber;
  v3 = -[_UISheetLayoutInfo _numberOfActiveNonDismissDetents](self, "_numberOfActiveNonDismissDetents");
  result = (v3 + -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent") - 1) % v3;
  self->__indexOfActiveDetentForTappingGrabber = result;
  *(_QWORD *)&self->_clean |= 0x10000000uLL;
  return result;
}

- (int64_t)_grabberAction
{
  int64_t v3;
  int64_t v4;
  int64_t result;

  if ((*((_BYTE *)&self->_clean + 3) & 0x20) != 0)
    return self->__grabberAction;
  if (-[_UISheetLayoutInfo _adjustedIndexOfCurrentActiveDetentForContainedFirstResponder](self, "_adjustedIndexOfCurrentActiveDetentForContainedFirstResponder") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = -[_UISheetLayoutInfo _indexOfActiveDetentForTappingGrabber](self, "_indexOfActiveDetentForTappingGrabber");
    v4 = -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent");
    if (v4 == v3)
    {
      result = 1;
    }
    else if (v4 < v3)
    {
      result = 2;
    }
    else
    {
      result = 3;
    }
    self->__grabberAction = result;
  }
  else
  {
    result = 0;
    self->__grabberAction = 0;
  }
  *(_QWORD *)&self->_clean |= 0x20000000uLL;
  return result;
}

- (double)_rubberBandExtentBeyondMinimumOffset
{
  void *v3;
  double v4;
  double MinY;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  if ((*((_BYTE *)&self->_clean + 3) & 0x80) == 0)
  {
    if (-[_UISheetLayoutInfo _isInverted](self, "_isInverted"))
    {
      if (!-[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally"))
      {
        -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
        self->__rubberBandExtentBeyondMinimumOffset = fmax(fmin(CGRectGetHeight(v12) * 0.25, 200.0), 0.0);
        goto LABEL_8;
      }
      -[_UISheetLayoutInfo _metrics](self, "_metrics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topOffset");
      self->__rubberBandExtentBeyondMinimumOffset = v4;
    }
    else
    {
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
      MinY = CGRectGetMinY(v11);
      -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_value");
      v8 = MinY + v7;
      -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
      self->__rubberBandExtentBeyondMinimumOffset = fmax(fmin(v8 - v9, 100.0), 0.0);

    }
LABEL_8:
    *(_QWORD *)&self->_clean |= 0x80000000uLL;
  }
  return self->__rubberBandExtentBeyondMinimumOffset;
}

- (double)_rubberBandExtentBeyondMaximumOffset
{
  double MaxY;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  if ((*((_BYTE *)&self->_clean + 4) & 1) == 0)
  {
    if (-[_UISheetLayoutInfo _isInverted](self, "_isInverted"))
    {
      -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
      MaxY = CGRectGetMaxY(v11);
      -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_value");
      v7 = MaxY - v6;
      -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
      self->__rubberBandExtentBeyondMaximumOffset = fmax(fmin(v7 - v8, 100.0), 0.0);

    }
    else
    {
      if (!-[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally"))
      {
        -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
        self->__rubberBandExtentBeyondMaximumOffset = fmax(fmin(CGRectGetHeight(v12) * 0.25, 200.0), 0.0);
        goto LABEL_8;
      }
      -[_UISheetLayoutInfo _metrics](self, "_metrics");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topOffset");
      self->__rubberBandExtentBeyondMaximumOffset = v9;
    }

LABEL_8:
    *(_QWORD *)&self->_clean |= 0x100000000uLL;
  }
  return self->__rubberBandExtentBeyondMaximumOffset;
}

- (CGRect)_hostedDismissFrame
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
  char v14;
  int v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
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

  -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
  v4 = v3;
  if (-[_UISheetLayoutInfo _isHosting](self, "_isHosting"))
  {
    -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v13 = -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached");
    v14 = -[_UISheetLayoutInfo _dismissesHorizontally](self, "_dismissesHorizontally");
    v15 = -[_UISheetLayoutInfo _isInverted](self, "_isInverted");
    v16 = -[_UISheetLayoutInfo _isExpanded](self, "_isExpanded");
    -[_UISheetLayoutInfo _offsetAdjustment](self, "_offsetAdjustment");
    v18 = v17;
    -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
    v21 = v20;
    -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayScale");
    v24 = v23;
    -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
    v6 = _UISheetLayoutInfoUntransformedFrame(v13, v14, v15, v16, v19, 0.0, v4, v18, v21, v24, v34, v35, v36, v26, v28, v30, v32, v33);
    v8 = v37;
    v10 = v38;
    v12 = v39;

  }
  v40 = v6;
  v41 = v8;
  v42 = v10;
  v43 = v12;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (BOOL)_isModelDimmingEnabled
{
  int64_t v3;
  BOOL v4;
  BOOL result;
  void *v6;
  int v7;
  BOOL v8;

  if ((*((_BYTE *)&self->_clean + 14) & 0x80) != 0)
    return self->__modelDimmingEnabled;
  v3 = -[_UISheetLayoutInfo _indexOfActiveDimmingDetent](self, "_indexOfActiveDimmingDetent");
  v4 = v3 != 0x7FFFFFFFFFFFFFFFLL
    && -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent") <= v3;
  self->__modelDimmingEnabled = v4;
  -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isModelDimmingEnabled");

  if (!-[_UISheetLayoutInfo _isHidingUnderneathDescendant](self, "_isHidingUnderneathDescendant"))
  {
    if (self->__modelDimmingEnabled)
      v8 = 1;
    else
      v8 = v7;
    self->__modelDimmingEnabled = v8;
    if (!v8)
      goto LABEL_8;
LABEL_13:
    result = -[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented");
    goto LABEL_14;
  }
  self->__modelDimmingEnabled = v7;
  if (v7)
    goto LABEL_13;
LABEL_8:
  result = 0;
LABEL_14:
  self->__modelDimmingEnabled = result;
  *((_DWORD *)&self->_clean + 3) |= 0x800000u;
  return result;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  id v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  void *v123;
  uint64_t v125;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetLayoutInfo _containerBounds](self, "_containerBounds");
  v4 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("_containerBounds"));
  -[_UISheetLayoutInfo _containerSafeAreaInsets](self, "_containerSafeAreaInsets");
  v5 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", CFSTR("_containerSafeAreaInsets"));
  -[_UISheetLayoutInfo _containerTraitCollection](self, "_containerTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "ui_appendObject:withName:usingLightweightDescription:", v6, CFSTR("_containerTraitCollection"), 1);

  -[_UISheetLayoutInfo _additionalMinimumTopInset](self, "_additionalMinimumTopInset");
  v8 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_additionalMinimumTopInset"));
  v9 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _mode](self, "_mode"), CFSTR("_mode"));
  -[_UISheetLayoutInfo _sourceFrame](self, "_sourceFrame");
  v10 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", CFSTR("_sourceFrame"));
  v11 = (id)objc_msgSend(v3, "ui_appendInteger:withName:ifNotEqualTo:", -[_UISheetLayoutInfo _horizontalAlignment](self, "_horizontalAlignment"), CFSTR("_horizontalAlignment"), 0);
  -[_UISheetLayoutInfo _marginInCompactHeight](self, "_marginInCompactHeight");
  v12 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_marginInCompactHeight"));
  -[_UISheetLayoutInfo _marginInRegularWidthRegularHeight](self, "_marginInRegularWidthRegularHeight");
  v13 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_marginInRegularWidthRegularHeight"));
  v14 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _tucksIntoUnsafeAreaInCompactHeight](self, "_tucksIntoUnsafeAreaInCompactHeight"), CFSTR("_tucksIntoUnsafeAreaInCompactHeight"), 1);
  v15 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _allowsAsymmetricVerticalMargins](self, "_allowsAsymmetricVerticalMargins"), CFSTR("_allowsAsymmetricVerticalMargins"), 1);
  -[_UISheetLayoutInfo _keyboardFrame](self, "_keyboardFrame");
  v16 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", CFSTR("_keyboardFrame"));
  v17 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsFullScreen](self, "_wantsFullScreen"), CFSTR("_wantsFullScreen"), 1);
  v18 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsEdgeAttached](self, "_wantsEdgeAttached"), CFSTR("_wantsEdgeAttached"), 1);
  v19 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight"), CFSTR("_wantsEdgeAttachedInCompactHeight"), 1);
  v20 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached"), CFSTR("_widthFollowsPreferredContentSizeWhenEdgeAttached"), 1);
  v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isPresented](self, "_isPresented"), CFSTR("_presented"));
  v22 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _shouldScaleDownBehindDescendants](self, "_shouldScaleDownBehindDescendants"), CFSTR("_shouldScaleDownBehindDescendants"), 0);
  v23 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isReduceMotionEnabled](self, "_isReduceMotionEnabled"), CFSTR("_reduceMotionEnabled"), 1);
  v24 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isHosting](self, "_isHosting"), CFSTR("_hosting"), 1);
  v25 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isDismissible](self, "_isDismissible"), CFSTR("_dismissible"));
  -[_UISheetLayoutInfo _detents](self, "_detents");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v3, "appendObject:withName:", v26, CFSTR("_detents"));

  -[_UISheetLayoutInfo _selectedDetentIdentifier](self, "_selectedDetentIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v28, CFSTR("_selectedDetentIdentifier"));

  -[_UISheetLayoutInfo _standardAppearance](self, "_standardAppearance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendObject:withName:", v29, CFSTR("_standardAppearance"));

  -[_UISheetLayoutInfo _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v31, CFSTR("_edgeAttachedCompactHeightAppearance"), 1);

  -[_UISheetLayoutInfo _floatingAppearance](self, "_floatingAppearance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v33, CFSTR("_floatingAppearance"), 1);

  -[_UISheetLayoutInfo _sheetID](self, "_sheetID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v35, CFSTR("_sheetID"), 1);

  -[_UISheetLayoutInfo _hiddenAncestorSheetID](self, "_hiddenAncestorSheetID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v36, CFSTR("_hiddenAncestorSheetID"), 1);

  v37 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _shouldDismissWhenTappedOutside](self, "_shouldDismissWhenTappedOutside"), CFSTR("_shouldDismissWhenTappedOutside"), 0);
  v38 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _allowsInteractiveDismissWhenFullScreen](self, "_allowsInteractiveDismissWhenFullScreen"), CFSTR("_allowsInteractiveDismissWhenFullScreen"), 1);
  v39 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown"), CFSTR("_prefersScrollingResizesWhenDetentDirectionIsDown"), 0);
  v40 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge](self, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"), CFSTR("_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"), 0);
  -[_UISheetLayoutInfo _latestUserChosenOffset](self, "_latestUserChosenOffset");
  v41 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_latestUserChosenOffset"));
  v42 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _wantsGrabber](self, "_wantsGrabber"), CFSTR("_wantsGrabber"), 1);
  -[_UISheetLayoutInfo _grabberSpacing](self, "_grabberSpacing");
  v43 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_grabberSpacing"));
  v44 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _insetsContentViewForGrabber](self, "_insetsContentViewForGrabber"), CFSTR("_insetsContentViewForGrabber"), 1);
  v45 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isDragging](self, "_isDragging"), CFSTR("_dragging"), 1);
  -[_UISheetLayoutInfo _dismissSourceFrame](self, "_dismissSourceFrame");
  v46 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", CFSTR("_dismissSourceFrame"));
  -[_UISheetLayoutInfo _dismissCornerRadius](self, "_dismissCornerRadius");
  v47 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_dismissCornerRadius"));
  -[_UISheetLayoutInfo _preferredCornerRadius](self, "_preferredCornerRadius");
  v48 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_preferredCornerRadius"));
  -[_UISheetLayoutInfo _preferredShadowOpacity](self, "_preferredShadowOpacity");
  v50 = v49;
  -[_UISheetLayoutInfo _metrics](self, "_metrics");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "preferredShadowOpacity");
  v53 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_preferredShadowOpacity"), v50, v52);

  -[_UISheetLayoutInfo _shadowRadius](self, "_shadowRadius");
  v55 = v54;
  -[_UISheetLayoutInfo _metrics](self, "_metrics");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "shadowRadius");
  v58 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_shadowRadius"), v55, v57);

  -[_UISheetLayoutInfo _ancestorSheetIDs](self, "_ancestorSheetIDs");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (id)objc_msgSend(v3, "ui_appendArray:withName:skipIfEmpty:", v59, CFSTR("_ancestorSheetIDs"), 1);

  -[_UISheetLayoutInfo _descendantHiddenAncestorSheetIDs](self, "_descendantHiddenAncestorSheetIDs");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (id)objc_msgSend(v3, "ui_appendSet:withName:skipIfEmpty:", v61, CFSTR("_descendantHiddenAncestorSheetIDs"), 1);

  v63 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isHidingUnderneathDescendant](self, "_isHidingUnderneathDescendant"), CFSTR("_hidingUnderneathDescendant"), 1);
  -[_UISheetLayoutInfo _marginsWhenFloating](self, "_marginsWhenFloating");
  v64 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", CFSTR("_marginsWhenFloating"));
  -[_UISheetLayoutInfo _margins](self, "_margins");
  v65 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", CFSTR("_margins"));
  -[_UISheetLayoutInfo _preferredSize](self, "_preferredSize");
  v66 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("_preferredSize"));
  -[_UISheetLayoutInfo _percentFullHeight](self, "_percentFullHeight");
  v67 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_percentFullHeight"));
  v68 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isHidingUnderneathDescendantForDepthLevel](self, "_isHidingUnderneathDescendantForDepthLevel"), CFSTR("_hidingUnderneathDescendantForDepthLevel"), 1);
  -[_UISheetLayoutInfo _proposedDepthLevel](self, "_proposedDepthLevel");
  v69 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_proposedDepthLevel"));
  -[_UISheetLayoutInfo _depthLevel](self, "_depthLevel");
  v70 = (id)objc_msgSend(v3, "ui_appendFloat:withName:ifNotEqualTo:", CFSTR("_depthLevel"));
  v71 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _scalesDownBehindDescendants](self, "_scalesDownBehindDescendants"), CFSTR("_scalesDownBehindDescendants"), 0);
  v72 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isEdgeAttached](self, "_isEdgeAttached"), CFSTR("_edgeAttached"), 1);
  v73 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isForcedFullScreen](self, "_isForcedFullScreen"), CFSTR("_forcedFullScreen"), 1);
  v74 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isFunctionallyFullScreen](self, "_isFunctionallyFullScreen"), CFSTR("_functionallyFullScreen"), 1);
  -[_UISheetLayoutInfo _percentFullScreen](self, "_percentFullScreen");
  v75 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_percentFullScreen"));
  -[_UISheetLayoutInfo _effectiveKeyboardFrame](self, "_effectiveKeyboardFrame");
  v76 = (id)objc_msgSend(v3, "ui_appendRect:withName:ifNotEqualTo:", CFSTR("_effectiveKeyboardFrame"));
  -[_UISheetLayoutInfo _stackAlignmentFrame](self, "_stackAlignmentFrame");
  v77 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("_stackAlignmentFrame"));
  v78 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _stacksWithChild](self, "_stacksWithChild"), CFSTR("_stacksWithChild"));
  -[_UISheetLayoutInfo _fullHeightUntransformedFrame](self, "_fullHeightUntransformedFrame");
  v79 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("_fullHeightUntransformedFrame"));
  -[_UISheetLayoutInfo _fullHeightUntransformedFrameForDepthLevel](self, "_fullHeightUntransformedFrameForDepthLevel");
  v80 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("_fullHeightUntransformedFrameForDepthLevel"));
  -[_UISheetLayoutInfo _dismissOffset](self, "_dismissOffset");
  v81 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_dismissOffset"));
  -[_UISheetLayoutInfo _effectiveAppearance](self, "_effectiveAppearance");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (id)objc_msgSend(v3, "appendObject:withName:", v82, CFSTR("_effectiveAppearance"));

  -[_UISheetLayoutInfo _offsetForCurrentActiveDetent](self, "_offsetForCurrentActiveDetent");
  v84 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_offsetForCurrentActiveDetent"));
  -[_UISheetLayoutInfo _currentOffset](self, "_currentOffset");
  v85 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("_currentOffset"));
  -[_UISheetLayoutInfo _nonFullHeightOffset](self, "_nonFullHeightOffset");
  v86 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_nonFullHeightOffset"));
  -[_UISheetLayoutInfo _offsetAdjustment](self, "_offsetAdjustment");
  v87 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_offsetAdjustment"));
  -[_UISheetLayoutInfo _percentPresented](self, "_percentPresented");
  v88 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_percentPresented"));
  v89 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isEffectivePresented](self, "_isEffectivePresented"), CFSTR("_effectivePresented"));
  v90 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _isAnyDescendantDragging](self, "_isAnyDescendantDragging"), CFSTR("_anyDescendantDragging"), 1);
  v91 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[_UISheetLayoutInfo _anyDescendantWantsFullScreen](self, "_anyDescendantWantsFullScreen"), CFSTR("_anyDescendantWantsFullScreen"), 1);
  -[_UISheetLayoutInfo _detentValues](self, "_detentValues");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (id)objc_msgSend(v3, "appendObject:withName:", v92, CFSTR("_detentValues"));

  -[_UISheetLayoutInfo _activeDetents](self, "_activeDetents");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (id)objc_msgSend(v3, "appendObject:withName:", v94, CFSTR("_activeDetents"));

  v96 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfCurrentActiveDetent](self, "_indexOfCurrentActiveDetent"), CFSTR("_indexOfCurrentActiveDetent"));
  v97 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfActiveDimmingDetent](self, "_indexOfActiveDimmingDetent"), CFSTR("_indexOfActiveDimmingDetent"));
  -[_UISheetLayoutInfo _smallestNonDismissDetentOffset](self, "_smallestNonDismissDetentOffset");
  v98 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_smallestNonDismissDetentOffset"));
  v99 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _numberOfActiveNonDismissDetents](self, "_numberOfActiveNonDismissDetents"), CFSTR("_numberOfActiveNonDismissDetents"));
  v100 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfActiveDetentForTappingGrabber](self, "_indexOfActiveDetentForTappingGrabber"), CFSTR("_indexOfActiveDetentForTappingGrabber"));
  v101 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _grabberAction](self, "_grabberAction"), CFSTR("_grabberAction"));
  v102 = (id)objc_msgSend(v3, "appendInteger:withName:", -[_UISheetLayoutInfo _indexOfCurrentActiveOrDismissDetent](self, "_indexOfCurrentActiveOrDismissDetent"), CFSTR("_indexOfCurrentActiveOrDismissDetent"));
  -[_UISheetLayoutInfo _rubberBandExtentBeyondMinimumOffset](self, "_rubberBandExtentBeyondMinimumOffset");
  v103 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_rubberBandExtentBeyondMinimumOffset"));
  -[_UISheetLayoutInfo _rubberBandExtentBeyondMaximumOffset](self, "_rubberBandExtentBeyondMaximumOffset");
  v104 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_rubberBandExtentBeyondMaximumOffset"));
  -[_UISheetLayoutInfo _untransformedFrame](self, "_untransformedFrame");
  v105 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("_untransformedFrame"));
  -[_UISheetLayoutInfo _hostedUntransformedFrame](self, "_hostedUntransformedFrame");
  v106 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("_hostedUntransformedFrame"));
  -[_UISheetLayoutInfo _frameOfPresentedViewInContainerView](self, "_frameOfPresentedViewInContainerView");
  v107 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("_frameOfPresentedViewInContainerView"));
  -[_UISheetLayoutInfo _touchInsets](self, "_touchInsets");
  v108 = (id)objc_msgSend(v3, "ui_appendEdgeInsets:withName:", CFSTR("_touchInsets"));
  -[_UISheetLayoutInfo _cornerRadii](self, "_cornerRadii");
  v109 = (id)objc_msgSend(v3, "ui_appendCornerRadii:withName:", CFSTR("_cornerRadii"));
  -[_UISheetLayoutInfo _transform](self, "_transform");
  v110 = (id)objc_msgSend(v3, "ui_appendTransform:withName:", &v125, CFSTR("_transform"));
  -[_UISheetLayoutInfo _percentDimmedFromOffset](self, "_percentDimmedFromOffset");
  v111 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_percentDimmedFromOffset"));
  -[_UISheetLayoutInfo _percentDimmed](self, "_percentDimmed");
  v112 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_percentDimmed"));
  -[_UISheetLayoutInfo _confinedPercentDimmed](self, "_confinedPercentDimmed");
  v113 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_confinedPercentDimmed"));
  -[_UISheetLayoutInfo _magicShadowOpacity](self, "_magicShadowOpacity");
  v114 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_magicShadowOpacity"));
  -[_UISheetLayoutInfo _shadowOpacity](self, "_shadowOpacity");
  v115 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_shadowOpacity"));
  -[_UISheetLayoutInfo _alpha](self, "_alpha");
  v116 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_alpha"));
  -[_UISheetLayoutInfo _grabberAlpha](self, "_grabberAlpha");
  v117 = (id)objc_msgSend(v3, "ui_appendFloat:withName:", CFSTR("_grabberAlpha"));
  v118 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isInteractionEnabled](self, "_isInteractionEnabled"), CFSTR("_interactionEnabled"));
  v119 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _shouldPresentedViewControllerControlStatusBarAppearance](self, "_shouldPresentedViewControllerControlStatusBarAppearance"), CFSTR("_shouldPresentedViewControllerControlStatusBarAppearance"));
  v120 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _shouldDimmingIgnoreTouches](self, "_shouldDimmingIgnoreTouches"), CFSTR("_shouldDimmingIgnoreTouches"));
  v121 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isDimmingEnabled](self, "_isDimmingEnabled"), CFSTR("_dimmingEnabled"));
  v122 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UISheetLayoutInfo _isExpanded](self, "_isExpanded"), CFSTR("_expanded"));
  objc_msgSend(v3, "build");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v123;
}

- (id)_descendantDescription
{
  _UISheetLayoutInfo *v2;
  void *v3;
  _UISheetLayoutInfo *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _UISheetLayoutInfo *v10;
  void *v11;
  void *v12;

  v2 = self;
  -[_UISheetLayoutInfo _parentLayoutInfo](v2, "_parentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[_UISheetLayoutInfo _parentLayoutInfo](v2, "_parentLayoutInfo");
      v4 = (_UISheetLayoutInfo *)objc_claimAutoreleasedReturnValue();

      -[_UISheetLayoutInfo _parentLayoutInfo](v4, "_parentLayoutInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  v6 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[_UISheetLayoutInfo description](v4, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  -[_UISheetLayoutInfo _childLayoutInfo](v4, "_childLayoutInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    do
    {
      -[_UISheetLayoutInfo _childLayoutInfo](v4, "_childLayoutInfo");
      v10 = (_UISheetLayoutInfo *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "appendString:", CFSTR("\n"));
      -[_UISheetLayoutInfo description](v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v11);

      -[_UISheetLayoutInfo _childLayoutInfo](v10, "_childLayoutInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v10;
    }
    while (v12);
  }
  else
  {
    v10 = v4;
  }

  return v8;
}

- (BOOL)_hasChildSheet
{
  void *v2;
  BOOL v3;

  -[_UISheetLayoutInfo _childLayoutInfo](self, "_childLayoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)_invertedDepthLevel
{
  double v3;
  double v4;
  double v5;

  -[_UISheetLayoutInfo _maximumDepthLevelInChain](self, "_maximumDepthLevelInChain");
  v4 = v3;
  -[_UISheetLayoutInfo _depthLevel](self, "_depthLevel");
  return v4 - v5;
}

- (double)_maximumDepthLevelInChain
{
  _UISheetLayoutInfo *v2;
  uint64_t v3;
  void *v4;
  _UISheetLayoutInfo *v5;
  double v6;
  double v7;

  v2 = self;
  -[_UISheetLayoutInfo _parentLayoutInfo](v2, "_parentLayoutInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v5 = v4;

      -[_UISheetLayoutInfo _parentLayoutInfo](v5, "_parentLayoutInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v5;
    }
    while (v4);
  }
  else
  {
    v5 = v2;
  }
  -[_UISheetLayoutInfo _depthLevel](v5, "_depthLevel");
  v7 = v6;

  return v7;
}

- (BOOL)_hasActiveFullDetent
{
  return self->__hasActiveFullDetent;
}

- (UIViewController)_presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__presentingViewController);
}

- (CGSize)_screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->__screenSize.width;
  height = self->__screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)_remoteKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__remoteKeyboardFrame.origin.x;
  y = self->__remoteKeyboardFrame.origin.y;
  width = self->__remoteKeyboardFrame.size.width;
  height = self->__remoteKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_firstResponderRequiresKeyboard
{
  return self->__firstResponderRequiresKeyboard;
}

- (BOOL)_remoteContainsFirstResponder
{
  return self->__remoteContainsFirstResponder;
}

- (BOOL)_remoteFirstResponderRequiresKeyboard
{
  return self->__remoteFirstResponderRequiresKeyboard;
}

- (BOOL)_shouldAdjustDetentsToAvoidKeyboard
{
  return self->__shouldAdjustDetentsToAvoidKeyboard;
}

- (BOOL)_isTransitioning
{
  return self->__transitioning;
}

- (BOOL)_presentsWithGesture
{
  return self->__presentsWithGesture;
}

- (BOOL)_shouldDismissWhenTappedOutside
{
  return self->__shouldDismissWhenTappedOutside;
}

- (double)_tearOffset
{
  return self->__tearOffset;
}

- (void)_setTearOffset:(double)a3
{
  self->__tearOffset = a3;
}

- (BOOL)_isGrabberBlurEnabled
{
  return self->__grabberBlurEnabled;
}

- (double)_preferredShadowOpacity
{
  return self->__preferredShadowOpacity;
}

- (double)_shadowRadius
{
  return self->__shadowRadius;
}

- (double)_remoteProposedDepthLevel
{
  return self->__remoteProposedDepthLevel;
}

- (CGRect)_hostParentFullHeightUntransformedFrameForDepthLevel
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x;
  y = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y;
  width = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width;
  height = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_hostParentDepthLevel
{
  return self->__hostParentDepthLevel;
}

- (id)_currentOffsetGetter
{
  return self->__currentOffsetGetter;
}

- (BOOL)_alwaysAllowsEdgeAttached
{
  return self->__alwaysAllowsEdgeAttached;
}

- (void)_setAlwaysAllowsEdgeAttached:(BOOL)a3
{
  self->__alwaysAllowsEdgeAttached = a3;
}

- (id)_rubberBandExtentBeyondMinimumOffsetWasInvalidated
{
  return self->__rubberBandExtentBeyondMinimumOffsetWasInvalidated;
}

- (id)_rubberBandExtentBeyondMaximumOffsetWasInvalidated
{
  return self->__rubberBandExtentBeyondMaximumOffsetWasInvalidated;
}

- (NSMutableArray)_mutableDetentValues
{
  return self->__mutableDetentValues;
}

- (NSMutableArray)_mutableActiveDetents
{
  return self->__mutableActiveDetents;
}

@end
