@implementation PassThroughView

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (void)didMoveToSuperview
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "passThroughView:didMoveToView:");

  if ((v4 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PassThroughView delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView superview](self, "superview"));
    objc_msgSend(v6, "passThroughView:didMoveToView:", self, v5);

  }
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_targetView, a3);
}

- (PassThroughViewDelegate)delegate
{
  return (PassThroughViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_targetView);
}

@end
