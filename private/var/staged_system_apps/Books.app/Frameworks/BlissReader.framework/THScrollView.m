@implementation THScrollView

- (BOOL)isAncestorScrollViewDragging
{
  uint64_t v3;
  void *v4;
  objc_super v6;

  v3 = objc_opt_class(TSDInteractiveCanvasController, a2);
  v4 = (void *)TSUDynamicCast(v3, -[THScrollView delegate](self, "delegate"));
  if (v4
    && (objc_msgSend(objc_msgSend(objc_msgSend(v4, "layerHost"), "asiOSCVC"), "isDraggingViaGuidedPan") & 1) != 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)THScrollView;
  return -[THScrollView isAncestorScrollViewDragging](&v6, "isAncestorScrollViewDragging");
}

- (void)dealloc
{
  objc_super v3;

  -[THScrollView setDeadTouchRectsForPan:](self, "setDeadTouchRectsForPan:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THScrollView;
  -[THScrollView dealloc](&v3, "dealloc");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  THScrollView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  THScrollView *v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  CGPoint v50;
  CGRect v51;

  y = a3.y;
  x = a3.x;
  v48.receiver = self;
  v48.super_class = (Class)THScrollView;
  v7 = -[THScrollView hitTest:withEvent:](&v48, "hitTest:withEvent:", a4);
  if (-[THScrollView preventChildInducedBounce](self, "preventChildInducedBounce"))
  {
    v8 = v7;
    while (1)
    {
      while (1)
      {
        v9 = objc_msgSend(v8, "superview");
        if (!v9)
          return v7;
        v8 = v9;
        v11 = objc_opt_class(UIScrollView, v10);
        v12 = (THScrollView *)TSUDynamicCast(v11, v8);
        -[THScrollView frame](self, "frame");
        v14 = v13;
        -[THScrollView frame](self, "frame");
        v16 = v15;
        -[THScrollView frame](v12, "frame");
        v18 = v17;
        -[THScrollView frame](v12, "frame");
        if (v12 == self)
          break;
        v20 = v19 >= v16 * 0.9 && v18 >= v14 * 0.9;
        if (v12)
          goto LABEL_11;
      }
      v20 = 0;
      if (v12)
      {
LABEL_11:
        if (!v20)
        {
          if (-[THScrollView suspendScrolling](self, "suspendScrolling"))
            goto LABEL_13;
          if (v12 == self || !-[THScrollView isScrollEnabled](v12, "isScrollEnabled"))
          {
LABEL_22:
            v21 = self;
            v22 = 1;
          }
          else
          {
            v25 = objc_opt_class(THScrollView, v24);
            v26 = (void *)TSUDynamicCast(v25, v12);
            if (v26)
            {
              v27 = v26;
              if (objc_msgSend(v26, "handleNaturally"))
                goto LABEL_22;
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              v29 = objc_msgSend(v27, "deadTouchRectsForPan", 0);
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v45;
                while (2)
                {
                  for (i = 0; i != v31; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v45 != v32)
                      objc_enumerationMutation(v29);
                    objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "CGRectValue");
                    v35 = v34;
                    v37 = v36;
                    v39 = v38;
                    v41 = v40;
                    -[THScrollView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
                    v50.x = v42;
                    v50.y = v43;
                    v51.origin.x = v35;
                    v51.origin.y = v37;
                    v51.size.width = v39;
                    v51.size.height = v41;
                    if (CGRectContainsPoint(v51, v50))
                    {
                      -[THScrollView setScrollEnabled:](self, "setScrollEnabled:", 1);
                      return self;
                    }
                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
                  if (v31)
                    continue;
                  break;
                }
              }
              if (-[THScrollView isSettledOnFirstOrLastPage](v12, "isSettledOnFirstOrLastPage"))
                v22 = objc_msgSend(v27, "disableParentScrollOnFirstOrLastPage") ^ 1;
              else
                v22 = 0;
              v21 = self;
            }
            else
            {
LABEL_13:
              v21 = self;
              v22 = 0;
            }
          }
          -[THScrollView setScrollEnabled:](v21, "setScrollEnabled:", v22);
          return v7;
        }
      }
    }
  }
  if (!-[THScrollView handleNaturally](self, "handleNaturally")
    && objc_msgSend(-[THScrollView parentScrollView](self, "parentScrollView"), "preventChildInducedBounce"))
  {
    v23 = (unint64_t)-[THScrollView pageCount](self, "pageCount") > 2
       || -[THScrollView disableParentScrollOnFirstOrLastPage](self, "disableParentScrollOnFirstOrLastPage");
    -[THScrollView setBounces:](self, "setBounces:", v23);
  }
  return v7;
}

- (void)setContentOffset:(CGPoint)a3
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
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  objc_super v24;

  y = a3.y;
  x = a3.x;
  if (self->mPreventBounceAnimation
    && -[THScrollView isPagingEnabled](self, "isPagingEnabled")
    && -[THScrollView isDecelerating](self, "isDecelerating")
    && (-[THScrollView isTracking](self, "isTracking") & 1) == 0)
  {
    -[THScrollView contentOffset](self, "contentOffset");
    v7 = v6;
    -[THScrollView spi_pageDecelerationTarget](self, "spi_pageDecelerationTarget");
    v9 = v8;
    -[THScrollView bounds](self, "bounds");
    v11 = v10;
    -[THScrollView contentSize](self, "contentSize");
    v13 = v11 * round(v9 / v11);
    if (v11 + v13 <= v12)
      v14 = v13;
    else
      v14 = v12 - v11;
    if (x < v14)
    {
      v15 = v14;
      v16 = v7;
      v17 = fminf(v15, v16);
      v18 = x;
      v19 = fmaxf(v17, v18);
LABEL_12:
      x = v19;
      goto LABEL_13;
    }
    if (x > v14)
    {
      v20 = v14;
      v21 = v7;
      v22 = fmaxf(v20, v21);
      v23 = x;
      v19 = fminf(v22, v23);
      goto LABEL_12;
    }
  }
LABEL_13:
  v24.receiver = self;
  v24.super_class = (Class)THScrollView;
  -[THScrollView setContentOffset:](&v24, "setContentOffset:", x, y);
}

- (id)parentScrollView
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = -[THScrollView superview](self, "superview");
  if (!v2)
    return 0;
  v4 = v2;
  do
  {
    v5 = objc_opt_class(THScrollView, v3);
    v6 = (void *)TSUDynamicCast(v5, v4);
    v7 = objc_msgSend(v4, "superview");
    if (!v7)
      break;
    v4 = v7;
  }
  while (!v6);
  return v6;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  void *i;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  CGPoint v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  -[THScrollView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = objc_opt_class(TSDInteractiveCanvasController, v16);
  v18 = (void *)TSUDynamicCast(v17, -[THScrollView delegate](self, "delegate"));
  if (v18)
  {
    v19 = v18;
    if ((objc_opt_respondsToSelector(objc_msgSend(v18, "delegate"), "interactiveCanvasController:expandBoundsForScrollViewHitTesting:") & 1) != 0)
    {
      objc_msgSend(objc_msgSend(v19, "delegate"), "interactiveCanvasController:expandBoundsForScrollViewHitTesting:", v19, v9, v11, v13, v15);
      v9 = v20;
      v11 = v21;
      v13 = v22;
      v15 = v23;
    }
  }
  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  v37.x = x;
  v37.y = y;
  if (CGRectContainsPoint(v38, v37))
  {
    LOBYTE(v24) = 1;
  }
  else if ((-[THScrollView clipsToBounds](self, "clipsToBounds") & 1) != 0)
  {
    LOBYTE(v24) = 0;
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = -[THScrollView subviews](self, "subviews", 0);
    v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v24)
    {
      v26 = v24;
      v27 = 0;
      v28 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v30, "convertPoint:fromView:", self, x, y);
          if (objc_msgSend(v30, "pointInside:withEvent:", a4))
            v27 = 1;
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v26);
      LOBYTE(v24) = v27;
    }
  }
  return (char)v24;
}

- (BOOL)preventChildInducedBounce
{
  return self->mPreventChildInducedBounce;
}

- (void)setPreventChildInducedBounce:(BOOL)a3
{
  self->mPreventChildInducedBounce = a3;
}

- (NSArray)deadTouchRectsForPan
{
  return self->mDeadTouchRectsForPan;
}

- (void)setDeadTouchRectsForPan:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)suspendScrolling
{
  return self->mSuspendScrolling;
}

- (void)setSuspendScrolling:(BOOL)a3
{
  self->mSuspendScrolling = a3;
}

- (BOOL)handleNaturally
{
  return self->mHandleNaturally;
}

- (void)setHandleNaturally:(BOOL)a3
{
  self->mHandleNaturally = a3;
}

- (BOOL)disableParentScrollOnFirstOrLastPage
{
  return self->mDisableParentScrollOnFirstOrLastPage;
}

- (void)setDisableParentScrollOnFirstOrLastPage:(BOOL)a3
{
  self->mDisableParentScrollOnFirstOrLastPage = a3;
}

- (BOOL)preventBounceAnimation
{
  return self->mPreventBounceAnimation;
}

- (void)setPreventBounceAnimation:(BOOL)a3
{
  self->mPreventBounceAnimation = a3;
}

- (id)_accessibilityQuickSpeakContent
{
  return objc_msgSend(-[THScrollView tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate")), "tsaxValueForKey:", CFSTR("_accessibilityQuickSpeakContent"));
}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  return objc_msgSend(-[THScrollView tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate")), "tsaxValueForKey:", CFSTR("_accessibilitySpeakSelectionTextInputResponder"));
}

@end
