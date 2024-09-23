@implementation _SBHLibraryZoomAnimatorTouchForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_SBHLibraryZoomAnimatorTouchForwardingView touchForwardingTargetView](self, "touchForwardingTargetView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SBHLibraryZoomAnimatorTouchForwardingView;
    -[_SBHLibraryZoomAnimatorTouchForwardingView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (UIView)touchForwardingTargetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_touchForwardingTargetView);
}

- (void)setTouchForwardingTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_touchForwardingTargetView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchForwardingTargetView);
}

@end
