@implementation UIScrollViewPanGestureRecognizer

- (BOOL)_isGestureType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  char v11;

  v4 = a3;
  if ((*((char *)self + 480) & 0x80000000) == 0)
    goto LABEL_14;
  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_parentScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_panGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v11 = 0;
  }
  else
  {
LABEL_14:
    if (self->_scrollViewCanScrubWithTouch)
    {
      objc_msgSend(v4, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isDescendantOfView:", v9))
      {
        objc_opt_class();
        v10 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }
    v11 = v10 ^ 1;
  }

  return v11 & 1;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v3;
  char isKindOfClass;
  unsigned __int8 v5;
  id v6;
  objc_super v8;

  if (self->_scrollViewCanScrubWithTouch)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v5 = isKindOfClass ^ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
    v6 = a3;
    v5 = -[UIGestureRecognizer shouldBeRequiredToFailByGestureRecognizer:](&v8, sel_shouldBeRequiredToFailByGestureRecognizer_, v6);

  }
  return v5 & 1;
}

- (void)setView:(id)a3
{
  id v4;
  int64_t indirectScrollingState;
  id WeakRetained;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIGestureRecognizer setView:](&v8, sel_setView_, v4);
  indirectScrollingState = self->_indirectScrollingState;
  if (indirectScrollingState)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
    v7 = WeakRetained;
    if (v4 && indirectScrollingState == 1)
      objc_msgSend(WeakRetained, "_addToViewIfAllowed:", v4);
    else
      objc_msgSend(WeakRetained, "_resetToOriginalViewIfAllowed");

  }
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 10)
  {
    -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = self;
    v7.super_class = (Class)UIScrollViewPanGestureRecognizer;
    LODWORD(self) = -[UIPanGestureRecognizer shouldReceiveEvent:](&v7, sel_shouldReceiveEvent_, v4);
    if ((_DWORD)self && (objc_msgSend(v5, "isTracking") & 1) == 0)
      objc_msgSend(v5, "_beginTrackingWithEvent:", v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
    LOBYTE(self) = -[UIPanGestureRecognizer shouldReceiveEvent:](&v8, sel_shouldReceiveEvent_, v4);
  }

  return (char)self;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  unint64_t lastTouchCount;
  id v8;
  objc_super v9;

  v6 = a4;
  lastTouchCount = self->super._lastTouchCount;
  v8 = a3;
  self->_modifierFlags = objc_msgSend(v6, "_modifierFlags");
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v8, v6);

  if (!lastTouchCount)
    -[UIScrollViewPanGestureRecognizer _beginScroll](self, "_beginScroll");
  *((_BYTE *)self + 480) &= 0xFCu;
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible
    && -[UIScrollViewPanGestureRecognizer _shouldTryToBeginWithEvent:](self, "_shouldTryToBeginWithEvent:", v6))
  {
    -[UIPanGestureRecognizer _removeHysteresisFromTranslation](self, "_removeHysteresisFromTranslation");
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }

}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  char v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unsigned int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  objc_super v58;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)UIScrollViewPanGestureRecognizer;
  if (-[UIPanGestureRecognizer _shouldTryToBeginWithEvent:](&v59, sel__shouldTryToBeginWithEvent_, v4))
  {
    -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_canScrollX"))
      v6 = -[UIPanGestureRecognizer _canPanHorizontally](self, "_canPanHorizontally");
    else
      v6 = 0;
    if (objc_msgSend(v5, "_canScrollY"))
      v8 = -[UIPanGestureRecognizer _canPanVertically](self, "_canPanVertically");
    else
      v8 = 0;
    v9 = -[UIPanGestureRecognizer _willScrollX](self, "_willScrollX");
    v10 = -[UIPanGestureRecognizer _willScrollY](self, "_willScrollY");
    -[UIGestureRecognizer view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollViewPanGestureRecognizer translationInView:](self, "translationInView:", v11);
    v13 = v12;
    v15 = v14;

    if (!v6 && !v8 || v8 && !v6 && !v10 || !v8 && v6 && !v9)
      goto LABEL_59;
    if ((*((_BYTE *)self + 480) & 0x10) != 0)
    {
      objc_msgSend(v5, "_actingParentScrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v5, "_parentScrollView");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;

      if (-[UIScrollViewPanGestureRecognizer _isParentScrollView:consideringEvent:](self, "_isParentScrollView:consideringEvent:", v19, v4))
      {
        v20 = objc_msgSend(v5, "_currentlyAbuttedContentEdges");
        v57 = (v20 >> 1) & 1;
        v54 = (v20 >> 3) & 1;
        v55 = v20 & 1;
        v53 = (v20 >> 2) & 1;
        if (*((char *)self + 480) < 0)
        {
          if (-[UIScrollViewPanGestureRecognizer _shouldTransferTrackingFromParentScrollViewForCurrentOffset](self, "_shouldTransferTrackingFromParentScrollViewForCurrentOffset"))
          {
            objc_msgSend(v19, "contentOffset");
            v22 = v21;
            v24 = v23;
            objc_msgSend(v19, "_pinContentOffsetToClosestPageBoundary");
            objc_msgSend(v19, "panGestureRecognizer");
            v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25 && (v25[1] & 0x200000000) != 0)
              objc_msgSend(v25, "setState:", 5);

            objc_msgSend(v19, "pinchGestureRecognizer");
            v27 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27 && (v27[1] & 0x200000000) != 0)
              objc_msgSend(v27, "setState:", 5);

            v29 = *MEMORY[0x1E0C9D538];
            v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
            objc_msgSend(v19, "contentOffset");
            v33 = v24 - v32;
            if (v55 | v53)
              v34 = 0.0;
            else
              v34 = v29;
            if (!(v55 | v53))
              v33 = v30;
            v35 = v22 - v31;
            if (v57 | v54)
              v33 = 0.0;
            else
              v35 = v34;
            -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v5, v35, v33, 0.0, v34);
          }
          else if (-[UIScrollViewPanGestureRecognizer _shouldContinueToWaitToTransferTrackingFromParentScrollView](self, "_shouldContinueToWaitToTransferTrackingFromParentScrollView")|| (*((_BYTE *)self + 480) &= ~0x80u, v58.receiver = self, v58.super_class = (Class)UIScrollViewPanGestureRecognizer, !-[UIPanGestureRecognizer _shouldTryToBeginWithEvent:](&v58, sel__shouldTryToBeginWithEvent_, v4)))
          {
LABEL_58:

LABEL_59:
            v7 = 0;
LABEL_60:

            goto LABEL_61;
          }
        }
        if (objc_msgSend(v5, "isPagingEnabled"))
        {
          v36 = objc_msgSend(v5, "_abuttedPagingEdges");
          v57 = (v36 >> 1) & 1;
          v54 = (v36 >> 3) & 1;
          v55 = v36 & 1;
          v53 = (v36 >> 2) & 1;
        }
        v37 = objc_msgSend(v5, "_canScrollX");
        v38 = objc_msgSend(v5, "_canScrollY");
        v56 = v37;
        if (objc_msgSend(v19, "_canScrollX"))
          v39 = objc_msgSend(v19, "isScrollEnabled") ^ 1;
        else
          v39 = 1;
        if (objc_msgSend(v19, "_canScrollY"))
          v40 = objc_msgSend(v19, "isScrollEnabled") ^ 1;
        else
          v40 = 1;
        v52 = v40;
        v41 = objc_msgSend(v5, "transfersHorizontalScrollingToParent");
        v51 = objc_msgSend(v5, "transfersVerticalScrollingToParent");
        -[UIGestureRecognizer view](self, "view");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollViewPanGestureRecognizer _hysteresis](self, "_hysteresis");
        v44 = v43;
        -[UIScrollViewPanGestureRecognizer _hysteresis](self, "_hysteresis");
        objc_msgSend(v42, "convertSize:fromView:", 0, v44, v45);
        v47 = v46;
        v49 = v48;

        if (((v38 & v10 | v39) & 1) == 0 && v41 && (!v56 || v13 >= v47 && v57 || v13 <= -v47 && v54)
          || ((v56 & v9 | v52) & 1) == 0 && ((v51 ^ 1) & 1) == 0 && (!v38 || v15 >= v49 && v55 || v15 <= -v49 && v53))
        {
          goto LABEL_58;
        }
      }

    }
    v7 = objc_msgSend(v5, "_delegateShouldPanGestureTryToBegin");
    goto LABEL_60;
  }
  v7 = 0;
LABEL_61:

  return v7;
}

- (double)_hysteresis
{
  double result;
  objc_super v3;

  result = 0.0;
  if ((*((char *)self + 480) & 0x80000000) == 0
    && (self->super._lastTouchCount != 1 || !self->_scrollViewCanScrubWithTouch))
  {
    v3.receiver = self;
    v3.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIPanGestureRecognizer _hysteresis](&v3, sel__hysteresis, 0.0);
  }
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_relativePanView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIGestureRecognizer view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7 && v9)
  {
    v11 = v9;

    v7 = v11;
  }
  v18.receiver = self;
  v18.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](&v18, sel__convertPoint_toSceneReferenceCoordinatesFromView_, v7, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_relativePanView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIGestureRecognizer view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7 && v9)
  {
    v11 = v9;

    v7 = v11;
  }
  v18.receiver = self;
  v18.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](&v18, sel__convertPoint_fromSceneReferenceCoordinatesToView_, v7, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  double discreteFastScrollMultiplier;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGPoint result;

  if ((*((_BYTE *)self + 480) & 0x20) != 0)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIPanGestureRecognizer translationInView:](&v9, sel_translationInView_, a3);
    discreteFastScrollMultiplier = self->_discreteFastScrollMultiplier;
    v6 = v5 * discreteFastScrollMultiplier;
    v8 = v7 * discreteFastScrollMultiplier;
  }
  result.y = v8;
  result.x = v6;
  return result;
}

- (UIScrollViewPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIScrollViewPanGestureRecognizer *v5;
  UIScrollViewPanGestureRecognizer *v6;
  UIScrollViewPanGestureRecognizer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
  v5 = -[UIPanGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_scrollViewAction = a4;
    *((_BYTE *)v5 + 480) &= ~0x40u;
    *((_BYTE *)v5 + 480) &= 0xF3u;
    v5->_indirectScrollingState = 0;
    -[UIPanGestureRecognizer setFailsPastMaxTouches:](v5, "setFailsPastMaxTouches:", 0);
    -[UIScrollViewPanGestureRecognizer setTranslationScaleFactor:](v6, "setTranslationScaleFactor:", 1.0);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v6, "setAllowedScrollTypesMask:", 3);
    v6->_discreteFastScrollMultiplier = 1.0;
    v7 = v6;
  }

  return v6;
}

- (void)setTranslationScaleFactor:(double)a3
{
  self->_translationScaleFactor = a3;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  if (!self->super._lastTouchCount)
  {
    -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_scrollViewCanScrubWithTouch = objc_msgSend(v8, "_canScrubWithTouch:", v6);

  }
  if (objc_msgSend(v7, "_containsHIDPointerEvent"))
  {
    if (!self->_scrollViewCanScrubWithTouch)
    {
      -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_supportsPointerDragScrolling");

      if ((v10 & 1) == 0)
      {
        -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isDecelerating"))
        {
          -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "_isBouncing");

          if ((v15 & 1) != 0)
          {
LABEL_12:
            v11 = 0;
            goto LABEL_7;
          }
          -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_stopScrollingNotify:pin:", 1, 0);
        }

        goto LABEL_12;
      }
    }
  }
  v11 = 1;
LABEL_7:

  return v11;
}

- (void)_beginScroll
{
  void *v3;
  void *v4;
  id v5;

  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDecelerating") & 1) != 0 || objc_msgSend(v5, "_isBouncing"))
  {
    if (objc_msgSend(v5, "_shouldTrackImmediatelyWhileDecelerating"))
    {
      *((_BYTE *)self + 480) |= 0x20u;
      -[UIGestureRecognizer setState:](self, "setState:", 1);
    }
    else
    {
      objc_msgSend(v5, "_clearParentAdjustment");
    }
    *((_BYTE *)self + 480) = *((_BYTE *)self + 480) & 0xF3 | (4 * (*((_BYTE *)self + 480) & 3));
  }
  if (-[UIScrollViewPanGestureRecognizer _canTransferTrackingFromParentPagingScrollView](self, "_canTransferTrackingFromParentPagingScrollView"))
  {
    *((_BYTE *)self + 480) |= 0x80u;
  }
  objc_msgSend(v5, "_parentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *((_BYTE *)self + 480) |= 0x10u;
  }
  else
  {
    objc_msgSend(v5, "_actingParentScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)self + 480) = *((_BYTE *)self + 480) & 0xEF | (16 * (v4 != 0));

  }
  *((_BYTE *)self + 480) &= 0xFCu;

}

- (BOOL)_canTransferTrackingFromParentPagingScrollView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
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
  unsigned int v28;
  _BOOL4 v29;
  _BOOL4 v31;
  _BOOL4 v32;
  uint64_t v33;
  double v34;
  double v35;

  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_parentScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isPagingEnabled")
    || !objc_msgSend(v3, "_transfersScrollToContainer"))
  {
    goto LABEL_15;
  }
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollViewPanGestureRecognizer translationInView:](self, "translationInView:", v5);
  v33 = v7;
  v35 = v6;

  v8 = objc_msgSend(v3, "_canScrollX");
  v9 = objc_msgSend(v3, "_canScrollY");
  if (objc_msgSend(v4, "_canScrollX"))
    v10 = objc_msgSend(v4, "isScrollEnabled") ^ 1;
  else
    v10 = 1;
  if (objc_msgSend(v4, "_canScrollY", v33))
    v11 = objc_msgSend(v4, "isScrollEnabled");
  else
    v11 = 0;
  objc_msgSend(v3, "contentInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v3, "bounds");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v3, "contentSize");
  v25 = v24;
  v27 = v26;
  v28 = objc_msgSend(v3, "_currentlyAbuttedContentEdges");
  if (((v10 | v8 ^ 1) & 1) != 0 || v19 + v15 + v25 <= v21 || (((v28 >> 1) | (v28 >> 3)) & 1) == 0)
  {
    LOBYTE(v29) = 0;
    if ((v11 & v9) != 1 || v17 + v13 + v27 <= v23)
      goto LABEL_16;
    if (((v28 | (v28 >> 2)) & 1) == 0)
    {
LABEL_15:
      LOBYTE(v29) = 0;
      goto LABEL_16;
    }
  }
  LOBYTE(v29) = 1;
  v31 = ((v28 >> 1) & 1) == 0;
  if (v35 <= 0.0)
    v31 = 1;
  if ((v31 | v10) == 1)
  {
    v32 = ((v28 >> 3) & 1) == 0;
    if (v35 >= 0.0)
      v32 = 1;
    if ((v32 | v10) == 1 && ((v28 & 1) == 0 || v34 <= 0.0 || v11 != 1))
      v29 = (v34 < 0.0) & (v28 >> 2) & v11;
  }
LABEL_16:

  return v29;
}

- (void)setAllowedTouchTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  id v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  -[UIGestureRecognizer allowedTouchTypes](self, "allowedTouchTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  if ((v7 & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIGestureRecognizer setAllowedTouchTypes:](&v14, sel_setAllowedTouchTypes_, v5);
    -[UIGestureRecognizer allowedTouchTypes](self, "allowedTouchTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setAllowedTouchTypesForScrolling:", v8);

  }
  v10 = objc_msgSend(v5, "containsObject:", &unk_1E1A9AEA8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
  objc_msgSend(WeakRetained, "_setEnabledIfAllowed:", v10);

  if ((v10 & 1) != 0)
  {
    self->_indirectScrollingState = 1;
    v12 = objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
    -[UIGestureRecognizer view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_addToViewIfAllowed:", v13);

  }
  else if (self->_indirectScrollingState)
  {
    self->_indirectScrollingState = 2;
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && (id)v5 != v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UIScrollView's built-in pan gesture recognizer must have its scroll view as its delegate."));
  v7.receiver = self;
  v7.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer setDelegate:](&v7, sel_setDelegate_, v4);

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)_resetGestureRecognizer
{
  id WeakRetained;
  objc_super v4;

  *((_BYTE *)self + 480) = *((_BYTE *)self + 480) & 0xFC | (*((_BYTE *)self + 480) >> 2) & 3;
  *((_BYTE *)self + 480) &= 0xF3u;
  *((_BYTE *)self + 480) &= ~0x10u;
  *((_BYTE *)self + 480) &= ~0x20u;
  *((_BYTE *)self + 480) &= ~0x80u;
  *((_BYTE *)self + 481) &= ~1u;
  self->_scrollViewCanScrubWithTouch = 0;
  self->_discreteFastScrollMultiplier = 1.0;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _resetGestureRecognizer](&v4, sel__resetGestureRecognizer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_resetScrollableAncestor");

}

- (BOOL)delaysTouchesBegan
{
  char v3;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewPanGestureRecognizer;
  if (-[UIGestureRecognizer delaysTouchesBegan](&v6, sel_delaysTouchesBegan))
    return 1;
  if (!-[UIGestureRecognizer cancelsTouchesInView](self, "cancelsTouchesInView"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  v3 = objc_msgSend(WeakRetained, "isDecelerating");

  return v3;
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;
  const char *scrollViewAction;
  objc_super v9;

  v6 = a3;
  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    scrollViewAction = self->_scrollViewAction;

    if (scrollViewAction == a4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You can't remove the scroll view's target/action pair from its built-in pan gesture recognizer."));
  }
  else
  {

  }
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIGestureRecognizer removeTarget:action:](&v9, sel_removeTarget_action_, v6, a4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_directionalPressGestureRecognizer);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)setDirectionalLockEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 480) = *((_BYTE *)self + 480) & 0xBF | v3;
}

- (CGPoint)velocityInView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  if ((*((_BYTE *)self + 480) & 0x20) != 0)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v5 = v7;
    v4 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIPanGestureRecognizer velocityInView:](&v8, sel_velocityInView_, a3);
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  if (self->_activeEventIsDiscrete)
  {
    v5 = v7;
    v4 = v6;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)_shouldContinueToWaitToTransferTrackingFromParentScrollView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  unsigned __int8 v10;
  int v11;
  unsigned __int8 v12;
  unsigned int v13;
  BOOL v14;

  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_parentScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDragging") & 1) != 0 || (objc_msgSend(v4, "isDecelerating") & 1) != 0)
    goto LABEL_15;
  -[UIScrollViewPanGestureRecognizer translationInView:](self, "translationInView:", v3);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v3, "_canScrollX");
  v10 = objc_msgSend(v3, "_canScrollY");
  v11 = objc_msgSend(v4, "_canScrollX") ? objc_msgSend(v4, "isScrollEnabled") : 0;
  v12 = objc_msgSend(v4, "_canScrollY") ? objc_msgSend(v4, "isScrollEnabled") : 0;
  if ((v13 = objc_msgSend(v3, "_currentlyAbuttedContentEdges"), (v9 & (v13 >> 1) & v11) == 1) && v6 > 0.0
    || (v9 & (v13 >> 3) & v11) == 1 && v6 < 0.0
    || (v13 & v10 & v12) == 1 && v8 < 0.0)
  {
LABEL_15:
    v14 = 1;
  }
  else if ((*(_DWORD *)&v10 & (v13 >> 2)) == 1)
  {
    if (v8 > 0.0)
      v14 = v12;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldTransferTrackingFromParentScrollViewForCurrentOffset
{
  void *v2;
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
  double v14;
  double v15;
  char v16;
  BOOL v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_parentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_rectForPageContainingView:", v2);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "contentOffset");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v2, "_currentlyAbuttedContentEdges");
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  if (!CGRectIsEmpty(v23))
  {
    if ((v16 & 2) != 0)
    {
      v24.origin.x = v5;
      v24.origin.y = v7;
      v24.size.width = v9;
      v24.size.height = v11;
      if (v13 > CGRectGetMinX(v24))
        goto LABEL_9;
    }
    if ((v16 & 8) != 0)
    {
      objc_msgSend(v3, "bounds");
      v19 = v13 + v18;
      v25.origin.x = v5;
      v25.origin.y = v7;
      v25.size.width = v9;
      v25.size.height = v11;
      if (v19 < CGRectGetMaxX(v25))
        goto LABEL_9;
    }
    if ((v16 & 1) != 0)
    {
      v26.origin.x = v5;
      v26.origin.y = v7;
      v26.size.width = v9;
      v26.size.height = v11;
      if (v15 > CGRectGetMinY(v26))
      {
LABEL_9:
        v17 = 1;
        goto LABEL_12;
      }
    }
    if ((v16 & 4) != 0)
    {
      objc_msgSend(v3, "bounds");
      v21 = v15 + v20;
      v27.origin.x = v5;
      v27.origin.y = v7;
      v27.size.width = v9;
      v27.size.height = v11;
      v17 = v21 < CGRectGetMaxY(v27);
      goto LABEL_12;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)a3
{
  unint64_t v3;
  double v4;
  double v5;
  objc_super v6;
  CGPoint result;

  v3 = ((unint64_t)*((unsigned __int8 *)self + 480) >> 2) & 3;
  if ((_DWORD)v3)
  {
    v4 = -[UIPanGestureRecognizer _shiftPanLocationToNewSceneReferenceLocation:lockingToAxis:]((double *)self, v3, a3.x, a3.y);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIPanGestureRecognizer _adjustSceneReferenceLocation:](&v6, sel__adjustSceneReferenceLocation_, a3.x, a3.y);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 affectingTranslation:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  if ((*((_BYTE *)self + 480) & 0x40) == 0
    || !a5
    || (unint64_t)(self->super.super._state - 1) <= 2
    && self->_reconsideredLockingLocation.x == 9.22337204e18
    && a4 - self->super._lastTouchTime < 0.6)
  {
    goto LABEL_30;
  }
  v10 = -[UIPanGestureRecognizer _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](self, self->super._lastUnadjustedSceneReferenceLocation.x, self->super._lastUnadjustedSceneReferenceLocation.y, a3.x, a3.y);
  v12 = v11;
  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != 0.0 && v12 != 0.0)
  {
    v14 = v12 / v10;
    v15 = atanf(fabsf(v14));
    if (!-[UIPanGestureRecognizer _canPanHorizontally](self, "_canPanHorizontally")
      || !objc_msgSend(v13, "_canScrollX")
      || v15 > 0.34906585)
    {
      if (!-[UIPanGestureRecognizer _canPanVertically](self, "_canPanVertically")
        || !objc_msgSend(v13, "_canScrollY")
        || v15 < 1.22173048)
      {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
LABEL_19:
    v16 = 4;
LABEL_25:
    *((_BYTE *)self + 480) = *((_BYTE *)self + 480) & 0xF3 | v16;
    goto LABEL_26;
  }
  if (v12 == 0.0
    && v10 != 0.0
    && -[UIPanGestureRecognizer _canPanHorizontally](self, "_canPanHorizontally")
    && (objc_msgSend(v13, "_canScrollX") & 1) != 0)
  {
    goto LABEL_19;
  }
  if (v10 == 0.0
    && v12 != 0.0
    && -[UIPanGestureRecognizer _canPanVertically](self, "_canPanVertically")
    && objc_msgSend(v13, "_canScrollY"))
  {
LABEL_24:
    v16 = 8;
    goto LABEL_25;
  }
LABEL_26:

  if (self->_reconsideredLockingLocation.x != 9.22337204e18)
  {
    v17 = vabdd_f64(x, self->_reconsideredLockingLocation.x);
    -[UIScrollViewPanGestureRecognizer _hysteresis](self, "_hysteresis");
    if (v17 >= v18
      || (v19 = vabdd_f64(y, self->_reconsideredLockingLocation.y),
          -[UIScrollViewPanGestureRecognizer _hysteresis](self, "_hysteresis"),
          v19 >= v20))
    {
      self->_reconsideredLockingLocation = (CGPoint)vdupq_n_s64(0x43E0000000000000uLL);
    }
  }
LABEL_30:
  v21.receiver = self;
  v21.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _centroidMovedTo:atTime:affectingTranslation:](&v21, sel__centroidMovedTo_atTime_affectingTranslation_, v5, x, y, a4);
}

- (CGPoint)_velocityIncludingDiscreteScrollInView:(id)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if ((*((_BYTE *)self + 480) & 0x20) != 0)
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIPanGestureRecognizer velocityInView:](&v5, sel_velocityInView_, a3);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UIGestureRecognizerState v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = -[UIGestureRecognizer state](self, "state");
  self->_modifierFlags = objc_msgSend(v6, "_modifierFlags");
  v12.receiver = self;
  v12.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesMoved:withEvent:](&v12, sel_touchesMoved_withEvent_, v7, v6);

  -[UIScrollViewPanGestureRecognizer _handleCaughtDeceleratingScrollViewWithEvent:](self, "_handleCaughtDeceleratingScrollViewWithEvent:", v6);
  if (v8 == UIGestureRecognizerStatePossible
    && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan)
  {
    -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "touchesForGestureRecognizer:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_canCancelContentTouches:", v10);

    if ((v11 & 1) == 0)
      -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)_handleCaughtDeceleratingScrollViewWithEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)self + 480) & 0x20) != 0)
  {
    *((_BYTE *)self + 480) &= ~0x20u;
    v6 = v4;
    if (-[UIScrollViewPanGestureRecognizer _shouldTryToBeginWithEvent:](self, "_shouldTryToBeginWithEvent:", v4))
    {
      if ((*(_QWORD *)&self->super.super._gestureFlags & 0x400000000) != 0)
      {
        -[UIPanGestureRecognizer _removeHysteresisFromTranslation](self, "_removeHysteresisFromTranslation");
        -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_adjustStartOffsetForGrabbedBouncingScrollView");

      }
      else
      {
        *((_BYTE *)self + 481) |= 1u;
      }
    }
    else
    {
      *((_BYTE *)self + 480) |= 0x20u;
    }
    v4 = v6;
  }

}

- (BOOL)_isParentScrollView:(id)a3 consideringEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;

  v6 = a4;
  objc_msgSend(a3, "_panGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 1 << objc_msgSend(v6, "_scrollType");
      v10 = (objc_msgSend(v7, "allowedScrollTypesMask") & v11) != 0;
      goto LABEL_7;
    }
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "touchesForGestureRecognizer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->super._touches);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "intersectsSet:", v9);

LABEL_7:
  return v10;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesCancelled:withEvent:](&v6, sel_touchesCancelled_withEvent_, a3, a4);
  if (!-[UIPanGestureRecognizer numberOfTouches](self, "numberOfTouches"))
  {
    -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelTouchTracking");

  }
}

- (void)_scrollViewDidEndZooming
{
  void *v3;
  UIPanGestureVelocitySample *velocitySample;
  UIPanGestureVelocitySample *previousVelocitySample;

  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  if ((*((_BYTE *)self + 480) & 0x40) != 0)
  {
    self->_reconsideredLockingLocation = self->super._lastUnadjustedSceneReferenceLocation;
    *((_BYTE *)self + 480) &= 0xFCu;
    *((_BYTE *)self + 480) &= 0xF3u;
  }
  velocitySample = self->super._velocitySample;
  self->super._velocitySample = 0;

  previousVelocitySample = self->super._previousVelocitySample;
  self->super._previousVelocitySample = 0;

}

- (BOOL)isDirectionalLockEnabled
{
  return (*((unsigned __int8 *)self + 480) >> 6) & 1;
}

- (BOOL)_caughtDeceleratingScrollView
{
  return (*((unsigned __int8 *)self + 480) >> 5) & 1;
}

- (BOOL)_beganCaughtDeceleratingScrollViewAndMoved
{
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan)
    return *((_BYTE *)self + 481) & 1;
  else
    return 0;
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4;
  uint64_t v5;
  UIGestureRecognizerState v6;
  UIGestureRecognizerState v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "phase");
  v6 = -[UIGestureRecognizer state](self, "state");
  if (v6 == UIGestureRecognizerStateBegan && v5 == 5)
  {
    if ((!self || (*(_QWORD *)&self->super.super._gestureFlags & 0x400000000) == 0)
      && (*((_BYTE *)self + 480) & 0x20) != 0)
    {
      -[UIGestureRecognizer setState:](self, "setState:", 3);
    }
    v9.receiver = self;
    v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
    -[UIPanGestureRecognizer _scrollingChangedWithEvent:](&v9, sel__scrollingChangedWithEvent_, v4);
LABEL_10:
    v7 = -[UIGestureRecognizer state](self, "state");
    if ((unint64_t)(v7 - 1) >= 2)
    {
      if (v7)
      {
LABEL_15:
        if (v5 == 5)
          -[UIPanGestureRecognizer numberOfTouches](self, "numberOfTouches");
        self->_activeEventIsDiscrete = 0;
        goto LABEL_18;
      }
      v8 = 5;
    }
    else
    {
      v8 = 3;
    }
    -[UIGestureRecognizer setState:](self, "setState:", v8);
    goto LABEL_15;
  }
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPanGestureRecognizer;
  -[UIPanGestureRecognizer _scrollingChangedWithEvent:](&v9, sel__scrollingChangedWithEvent_, v4);
  if ((unint64_t)(v5 - 1) < 2)
  {
    if (v6 == UIGestureRecognizerStatePossible)
    {
      self->_activeEventIsDiscrete = objc_msgSend(v4, "_scrollType") == 0;
      -[UIScrollViewPanGestureRecognizer _beginScroll](self, "_beginScroll");
    }
  }
  else
  {
    if ((unint64_t)(v5 - 4) < 2)
      goto LABEL_10;
    if (v5 == 3)
      -[UIScrollViewPanGestureRecognizer _handleCaughtDeceleratingScrollViewWithEvent:](self, "_handleCaughtDeceleratingScrollViewWithEvent:", v4);
  }
LABEL_18:

}

- (id)_asyncDeliveryTargetForScrollEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIScrollViewPanGestureRecognizer scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_asyncDeliveryTargetForScrollEvent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_modifierFlags
{
  return self->_modifierFlags;
}

- (BOOL)_allowsBounce
{
  return 1;
}

- (double)translationScaleFactor
{
  return self->_translationScaleFactor;
}

- (UIScrollViewDirectionalPressGestureRecognizer)directionalPressGestureRecognizer
{
  return (UIScrollViewDirectionalPressGestureRecognizer *)objc_loadWeakRetained((id *)&self->_directionalPressGestureRecognizer);
}

- (void)setDirectionalPressGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_directionalPressGestureRecognizer, a3);
}

- (double)_discreteFastScrollMultiplier
{
  return self->_discreteFastScrollMultiplier;
}

- (void)_setDiscreteFastScrollMultiplier:(double)a3
{
  self->_discreteFastScrollMultiplier = a3;
}

@end
