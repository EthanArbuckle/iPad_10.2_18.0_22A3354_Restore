@implementation PRDismissalOverlayView

- (PRDismissalOverlayView)initWithFrame:(CGRect)a3
{
  char *v3;
  PRDismissalOverlayView *v4;
  __int128 v5;
  UIView *v6;
  UIView *leftTapRecognizerView;
  UIView *v8;
  UIView *rightTapRecognizerView;
  UIView *v10;
  UIView *topTapRecognizerView;
  UIView *v12;
  UIView *bottomTapRecognizerView;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _QWORD v28[4];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)PRDismissalOverlayView;
  v3 = -[PRDismissalOverlayView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (PRDismissalOverlayView *)v3;
  if (v3)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v3 + 456) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v3 + 472) = v5;
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    leftTapRecognizerView = v4->_leftTapRecognizerView;
    v4->_leftTapRecognizerView = v6;

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    rightTapRecognizerView = v4->_rightTapRecognizerView;
    v4->_rightTapRecognizerView = v8;

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topTapRecognizerView = v4->_topTapRecognizerView;
    v4->_topTapRecognizerView = v10;

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    bottomTapRecognizerView = v4->_bottomTapRecognizerView;
    v4->_bottomTapRecognizerView = v12;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v28[0] = v4->_leftTapRecognizerView;
    v28[1] = v4->_rightTapRecognizerView;
    v28[2] = v4->_topTapRecognizerView;
    v28[3] = v4->_bottomTapRecognizerView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v19, "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setHitTestsAsOpaque:", 1);

          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__tapGestureRecognized_);
          objc_msgSend(v19, "addGestureRecognizer:", v21);
          -[PRDismissalOverlayView addSubview:](v4, "addSubview:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v16);
    }

  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;
  CGPoint v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(self->_touchPassthroughRect, v11))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PRDismissalOverlayView;
    -[PRDismissalOverlayView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)setTouchPassthroughRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_touchPassthroughRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_touchPassthroughRect = &self->_touchPassthroughRect;
  if (!CGRectEqualToRect(a3, self->_touchPassthroughRect))
  {
    p_touchPassthroughRect->origin.x = x;
    p_touchPassthroughRect->origin.y = y;
    p_touchPassthroughRect->size.width = width;
    p_touchPassthroughRect->size.height = height;
    -[PRDismissalOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  CGRect *p_touchPassthroughRect;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  UIView *topTapRecognizerView;
  double v9;
  UIView *leftTapRecognizerView;
  double MinY;
  double MinX;
  UIView *rightTapRecognizerView;
  double MaxX;
  double v15;
  double v16;
  UIView *bottomTapRecognizerView;
  double MaxY;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v20.receiver = self;
  v20.super_class = (Class)PRDismissalOverlayView;
  -[PRDismissalOverlayView layoutSubviews](&v20, sel_layoutSubviews);
  p_touchPassthroughRect = &self->_touchPassthroughRect;
  if (!CGRectEqualToRect(self->_touchPassthroughRect, *MEMORY[0x1E0C9D628]))
  {
    -[PRDismissalOverlayView bounds](self, "bounds");
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    topTapRecognizerView = self->_topTapRecognizerView;
    v9 = CGRectGetWidth(v21);
    v22.origin.x = p_touchPassthroughRect->origin.x;
    v22.origin.y = self->_touchPassthroughRect.origin.y;
    v22.size.width = self->_touchPassthroughRect.size.width;
    v22.size.height = self->_touchPassthroughRect.size.height;
    -[UIView setFrame:](topTapRecognizerView, "setFrame:", 0.0, 0.0, v9, CGRectGetMinY(v22));
    leftTapRecognizerView = self->_leftTapRecognizerView;
    v23.origin.x = p_touchPassthroughRect->origin.x;
    v23.origin.y = self->_touchPassthroughRect.origin.y;
    v23.size.width = self->_touchPassthroughRect.size.width;
    v23.size.height = self->_touchPassthroughRect.size.height;
    MinY = CGRectGetMinY(v23);
    v24.origin.x = p_touchPassthroughRect->origin.x;
    v24.origin.y = self->_touchPassthroughRect.origin.y;
    v24.size.width = self->_touchPassthroughRect.size.width;
    v24.size.height = self->_touchPassthroughRect.size.height;
    MinX = CGRectGetMinX(v24);
    v25.origin.x = p_touchPassthroughRect->origin.x;
    v25.origin.y = self->_touchPassthroughRect.origin.y;
    v25.size.width = self->_touchPassthroughRect.size.width;
    v25.size.height = self->_touchPassthroughRect.size.height;
    -[UIView setFrame:](leftTapRecognizerView, "setFrame:", 0.0, MinY, MinX, CGRectGetHeight(v25));
    rightTapRecognizerView = self->_rightTapRecognizerView;
    v26.origin.x = p_touchPassthroughRect->origin.x;
    v26.origin.y = self->_touchPassthroughRect.origin.y;
    v26.size.width = self->_touchPassthroughRect.size.width;
    v26.size.height = self->_touchPassthroughRect.size.height;
    MaxX = CGRectGetMaxX(v26);
    v27.origin.x = p_touchPassthroughRect->origin.x;
    v27.origin.y = self->_touchPassthroughRect.origin.y;
    v27.size.width = self->_touchPassthroughRect.size.width;
    v27.size.height = self->_touchPassthroughRect.size.height;
    v15 = CGRectGetMinY(v27);
    v28.origin.x = p_touchPassthroughRect->origin.x;
    v28.origin.y = self->_touchPassthroughRect.origin.y;
    v28.size.width = self->_touchPassthroughRect.size.width;
    v28.size.height = self->_touchPassthroughRect.size.height;
    v16 = width - CGRectGetMaxX(v28);
    v29.origin.x = p_touchPassthroughRect->origin.x;
    v29.origin.y = self->_touchPassthroughRect.origin.y;
    v29.size.width = self->_touchPassthroughRect.size.width;
    v29.size.height = self->_touchPassthroughRect.size.height;
    -[UIView setFrame:](rightTapRecognizerView, "setFrame:", MaxX, v15, v16, CGRectGetHeight(v29));
    bottomTapRecognizerView = self->_bottomTapRecognizerView;
    MaxY = CGRectGetMaxY(*p_touchPassthroughRect);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v19 = CGRectGetWidth(v30);
    -[UIView setFrame:](bottomTapRecognizerView, "setFrame:", 0.0, MaxY, v19, height - CGRectGetMaxY(*p_touchPassthroughRect));
  }
}

- (void)_tapGestureRecognized:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dismissalOverlayViewDidDismiss:", self);

}

- (PRDismissalOverlayViewDelegate)delegate
{
  return (PRDismissalOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)touchPassthroughRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_touchPassthroughRect.origin.x;
  y = self->_touchPassthroughRect.origin.y;
  width = self->_touchPassthroughRect.size.width;
  height = self->_touchPassthroughRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIView)leftTapRecognizerView
{
  return self->_leftTapRecognizerView;
}

- (void)setLeftTapRecognizerView:(id)a3
{
  objc_storeStrong((id *)&self->_leftTapRecognizerView, a3);
}

- (UIView)rightTapRecognizerView
{
  return self->_rightTapRecognizerView;
}

- (void)setRightTapRecognizerView:(id)a3
{
  objc_storeStrong((id *)&self->_rightTapRecognizerView, a3);
}

- (UIView)topTapRecognizerView
{
  return self->_topTapRecognizerView;
}

- (void)setTopTapRecognizerView:(id)a3
{
  objc_storeStrong((id *)&self->_topTapRecognizerView, a3);
}

- (UIView)bottomTapRecognizerView
{
  return self->_bottomTapRecognizerView;
}

- (void)setBottomTapRecognizerView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomTapRecognizerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomTapRecognizerView, 0);
  objc_storeStrong((id *)&self->_topTapRecognizerView, 0);
  objc_storeStrong((id *)&self->_rightTapRecognizerView, 0);
  objc_storeStrong((id *)&self->_leftTapRecognizerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
