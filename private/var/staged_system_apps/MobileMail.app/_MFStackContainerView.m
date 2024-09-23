@implementation _MFStackContainerView

- (void)willMoveToWindow:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[_MFStackContainerView delegate](self, "delegate"));
    objc_msgSend(v4, "stackContainerViewWillBecomeVisible:", self);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MFStackContainerView window](self, "window"));

  if (!v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[_MFStackContainerView delegate](self, "delegate"));
    objc_msgSend(v4, "stackContainerViewDidBecomeInvisible:", self);

  }
}

- (_MFStackContainerViewDelegate)delegate
{
  return (_MFStackContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)layoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutInsets.top;
  left = self->_layoutInsets.left;
  bottom = self->_layoutInsets.bottom;
  right = self->_layoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutInsets:(UIEdgeInsets)a3
{
  self->_layoutInsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
