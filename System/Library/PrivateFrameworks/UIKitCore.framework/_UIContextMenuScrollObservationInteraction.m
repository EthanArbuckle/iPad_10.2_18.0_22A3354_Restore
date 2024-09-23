@implementation _UIContextMenuScrollObservationInteraction

+ (id)interactionWithDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDelegate:", v3);

  return v4;
}

- (void)willMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (BOOL)_descendentScrollViewShouldScrollHorizontally:(id)a3
{
  return 1;
}

- (BOOL)_descendentScrollViewShouldScrollVertically:(id)a3
{
  return 0;
}

- (BOOL)_descendentScrollView:(id)a3 shouldPreserveStartOffset:(CGPoint)a4
{
  double y;
  BOOL v5;
  double v6;

  y = a4.y;
  v5 = a4.y < _scrollRange(a3);
  return y > v6 || v5;
}

- (BOOL)_descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:(id)a3
{
  return 0;
}

- (CGPoint)_scrollView:(id)a3 adjustedUnconstrainedOffsetForUnconstrainedOffset:(CGPoint)a4 startOffset:(CGPoint)a5 horizontalVelocity:(double *)a6 verticalVelocity:(double *)a7 animator:(id *)a8
{
  double y;
  double v9;
  id v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  CGPoint v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGPoint result;

  y = a5.y;
  v9 = a4.y;
  v11 = a3;
  objc_msgSend(v11, "panGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuScrollObservationInteraction view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationInView:", v13);
  self->_currentLocation.x = v14;
  self->_currentLocation.y = v15;

  if (self->_isActive)
  {
    v32 = 0u;
    v33 = 0u;
    v16 = y - v9;
    v31 = 0u;
    -[_UIContextMenuScrollObservationInteraction view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UIGetTransformBetweenViews(v11, v17, 1, (uint64_t)&v31);

    v18 = *(double *)&v33 + *(double *)&v31 * 0.0 + (y - v9) * *(double *)&v32;
    v19 = *((double *)&v33 + 1) + *((double *)&v31 + 1) * 0.0 + v16 * *((double *)&v32 + 1);
    if (v9 < _scrollRange(v11) || v9 > v20)
    {
      v19 = v19 - self->_consumedTranslation.y;
      -[_UIContextMenuScrollObservationInteraction delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scrollObservationInteraction:didUpdateWithTranslation:location:ended:", self, 0, v18, v19, self->_currentLocation.x, self->_currentLocation.y);

      v21 = 16;
      v22 = 8;
    }
    else
    {
      v21 = 32;
      v22 = 24;
    }
    *(double *)((char *)&self->super.isa + v22) = v18;
    *(double *)((char *)&self->super.isa + v21) = v19;
  }
  else
  {
    v23 = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_currentTranslation = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_consumedTranslation = v23;
    self->_isActive = 1;
    -[_UIContextMenuScrollObservationInteraction delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scrollObservationInteraction:willBeginAtLocation:", self, self->_currentLocation.x, self->_currentLocation.y);

  }
  v26 = _scrollRange(v11);
  v28 = fmax(v26, fmin(v9, v27));

  v29 = 0.0;
  v30 = v28;
  result.y = v30;
  result.x = v29;
  return result;
}

- (void)_descendentScrollViewDidEndDragging:(id)a3
{
  -[_UIContextMenuScrollObservationInteraction _endInteractionWithTranslation:location:](self, "_endInteractionWithTranslation:location:", a3, self->_currentTranslation.x, self->_currentTranslation.y, self->_currentLocation.x, self->_currentLocation.y);
}

- (void)_descendentScrollViewDidCancelDragging:(id)a3
{
  -[_UIContextMenuScrollObservationInteraction _endInteractionWithTranslation:location:](self, "_endInteractionWithTranslation:location:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)_endInteractionWithTranslation:(CGPoint)a3 location:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  void *v9;

  if (self->_isActive)
  {
    y = a4.y;
    x = a4.x;
    v7 = a3.y;
    v8 = a3.x;
    -[_UIContextMenuScrollObservationInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollObservationInteraction:didUpdateWithTranslation:location:ended:", self, 1, v8, v7, x, y);

  }
  self->_isActive = 0;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UIContextMenuScrollObservationInteractionDelegate)delegate
{
  return (_UIContextMenuScrollObservationInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
