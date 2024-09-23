@implementation PXAutoScroller

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didAutoscrollWithTimestamp = objc_opt_respondsToSelector() & 1;
  }

}

- (PXAutoScroller)initWithTargetScrollView:(id)a3
{
  id v5;
  PXAutoScroller *v6;
  PXAutoScroller *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAutoScroller;
  v6 = -[PXAutoScroller init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollView, a3);
    *(_OWORD *)&v7->__margin = xmmword_1A7C0C540;
  }

  return v7;
}

- (PXAutoScroller)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAutoScroller.m"), 29, CFSTR("%s is not available as initializer"), "-[PXAutoScroller init]");

  abort();
}

- (void)updateWithUserInteractionLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  id v5;
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
  CGFloat v16;
  id v17;
  CGRect v18;

  v5 = a4;
  -[PXAutoScroller scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAutoScroller visibleRectForScrollView:](self, "visibleRectForScrollView:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXAutoScroller _margin](self, "_margin");
  v16 = v15;
  v17 = v6;
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();

  v18.origin.x = v8;
  v18.origin.y = v10;
  v18.size.width = v12;
  v18.size.height = v14;
  CGRectInset(v18, v16, v16);
  PXRectClampPoint();
  PXPointSubtract();
  -[PXAutoScroller _setAutoscrollDirection:](self, "_setAutoscrollDirection:");

}

- (void)stop
{
  -[PXAutoScroller _setAutoscrollDirection:](self, "_setAutoscrollDirection:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)updateWithTimestamp:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v18;
  double v20;
  uint64_t v21;
  float64_t v22;
  float64_t v23;
  double v24;
  void *v25;

  if (-[PXAutoScroller _isRepeating](self, "_isRepeating"))
  {
    -[PXAutoScroller _lastUpdateTimestamp](self, "_lastUpdateTimestamp");
    v6 = v5;
    -[PXAutoScroller _setLastUpdateTimestamp:](self, "_setLastUpdateTimestamp:", a3);
    if (v6 > 0.0)
    {
      v7 = a3 - v6;
      if (a3 - v6 < 0.0)
        v7 = 0.0;
      v24 = fmin(v7, 0.25);
      -[PXAutoScroller _autoscrollDirection](self, "_autoscrollDirection");
      v22 = v9;
      v23 = v8;
      -[PXAutoScroller _margin](self, "_margin");
      v21 = v10;
      -[PXAutoScroller _maximumSpeed](self, "_maximumSpeed");
      v11.f64[0] = v23;
      v11.f64[1] = v22;
      v12 = vdivq_f64(v11, (float64x2_t)vdupq_lane_s64(v21, 0));
      __asm { FMOV            V2.2D, #-1.0 }
      v18 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, v12), (int8x16_t)_Q2, (int8x16_t)v12);
      __asm { FMOV            V2.2D, #1.0 }
      if (-[PXAutoScroller autoscrollWithOffset:](self, "autoscrollWithOffset:", vmulq_n_f64(vmulq_n_f64(vminnmq_f64(v18, _Q2), v20), v24)))
      {
        if (self->_delegateRespondsTo.didAutoscrollWithTimestamp)
        {
          -[PXAutoScroller delegate](self, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "autoScroller:didAutoscrollWithTimestamp:", self, a3);

        }
      }
    }
  }
}

- (CGRect)visibleRectForScrollView:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAutoScroller.m"), 92, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAutoScroller visibleRectForScrollView:]", v8);

  abort();
}

- (void)startRepeating
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAutoScroller.m"), 96, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAutoScroller startRepeating]", v6);

  abort();
}

- (void)stopRepeating
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAutoScroller.m"), 100, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAutoScroller stopRepeating]", v6);

  abort();
}

- (BOOL)autoscrollWithOffset:(CGPoint)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAutoScroller.m"), 104, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAutoScroller autoscrollWithOffset:]", v7);

  abort();
}

- (void)_setAutoscrollDirection:(CGPoint)a3
{
  _BOOL8 v4;

  if (a3.x != self->__autoscrollDirection.x || a3.y != self->__autoscrollDirection.y)
  {
    self->__autoscrollDirection = a3;
    v4 = a3.y != *(double *)(MEMORY[0x1E0C9D538] + 8) || a3.x != *MEMORY[0x1E0C9D538];
    -[PXAutoScroller _setRepeating:](self, "_setRepeating:", v4);
  }
}

- (void)_setRepeating:(BOOL)a3
{
  if (self->__repeating != a3)
  {
    self->__repeating = a3;
    if (a3)
    {
      -[PXAutoScroller _setLastUpdateTimestamp:](self, "_setLastUpdateTimestamp:", 0.0);
      -[PXAutoScroller startRepeating](self, "startRepeating");
    }
    else
    {
      -[PXAutoScroller stopRepeating](self, "stopRepeating");
    }
  }
}

- (PXAnonymousScrollView)scrollView
{
  return self->_scrollView;
}

- (PXAutoScrollerDelegate)delegate
{
  return (PXAutoScrollerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)_margin
{
  return self->__margin;
}

- (double)_maximumSpeed
{
  return self->__maximumSpeed;
}

- (CGPoint)_autoscrollDirection
{
  double x;
  double y;
  CGPoint result;

  x = self->__autoscrollDirection.x;
  y = self->__autoscrollDirection.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)_isRepeating
{
  return self->__repeating;
}

- (double)_lastUpdateTimestamp
{
  return self->__lastUpdateTimestamp;
}

- (void)_setLastUpdateTimestamp:(double)a3
{
  self->__lastUpdateTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
