@implementation RCHitTestForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return -[RCHitTestForwardingView targetView](self, "targetView", a4, a3.x, a3.y);
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
  objc_storeStrong((id *)&self->_targetView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
}

@end
