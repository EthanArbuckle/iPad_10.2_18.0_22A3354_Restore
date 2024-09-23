@implementation SBIconScrollView

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  objc_super v10;
  CGPoint v11;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v11 = a3;
  -[BSUIScrollView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (!objc_msgSend(v8, "iconScrollView:shouldSetContentOffset:animated:", self, &v11, v4))
      goto LABEL_7;
    x = v11.x;
    y = v11.y;
  }
  if (v4)
  {
    -[SBIconScrollView setLastAnimatedScrollContentOffset:](self, "setLastAnimatedScrollContentOffset:", x, y);
    x = v11.x;
    y = v11.y;
  }
  v10.receiver = self;
  v10.super_class = (Class)SBIconScrollView;
  -[BSUIScrollView setContentOffset:animated:](&v10, sel_setContentOffset_animated_, v4, x, y);
LABEL_7:

}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  objc_super v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[BSUIScrollView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v9 = x;
  v10 = y;
  if (!v6)
    goto LABEL_4;
  if (objc_msgSend(v6, "iconScrollView:shouldSetContentOffset:animated:", self, &v9, 0))
  {
    x = v9;
    y = v10;
LABEL_4:
    v8.receiver = self;
    v8.super_class = (Class)SBIconScrollView;
    -[BSUIScrollView setContentOffset:](&v8, sel_setContentOffset_, x, y);
  }

}

- (BOOL)cancelTouchTracking
{
  void *v3;

  -[BSUIScrollView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconScrollView isTracking](self, "isTracking"))
  {
    objc_msgSend(v3, "iconScrollViewWillCancelTouchTracking:", self);
    -[SBIconScrollView _forcePanGestureToEndImmediately](self, "_forcePanGestureToEndImmediately");
    objc_msgSend(v3, "iconScrollViewDidCancelTouchTracking:", self);
  }
  else
  {
    -[SBIconScrollView _forcePanGestureToEndImmediately](self, "_forcePanGestureToEndImmediately");
  }

  return 1;
}

- (BOOL)_scrollsToMakeFirstResponderVisible
{
  return 0;
}

- (void)_setContentOffsetWithDecelerationAnimation:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  -[SBIconScrollView setLastAnimatedScrollContentOffset:](self, "setLastAnimatedScrollContentOffset:");
  v6.receiver = self;
  v6.super_class = (Class)SBIconScrollView;
  -[SBIconScrollView _setContentOffsetWithDecelerationAnimation:](&v6, sel__setContentOffsetWithDecelerationAnimation_, x, y);
}

- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  -[BSUIScrollView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "iconScrollView:shouldSetAutoscrollContentOffset:", self, x, y))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconScrollView;
    -[SBIconScrollView _autoScrollAssistantUpdateContentOffset:](&v8, sel__autoScrollAssistantUpdateContentOffset_, x, y);
  }

}

- (CGPoint)lastAnimatedScrollContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastAnimatedScrollContentOffset.x;
  y = self->_lastAnimatedScrollContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastAnimatedScrollContentOffset:(CGPoint)a3
{
  self->_lastAnimatedScrollContentOffset = a3;
}

@end
