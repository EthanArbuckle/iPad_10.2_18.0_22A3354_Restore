@implementation IMPassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  IMPassthroughView *v9;
  id WeakRetained;
  void *v11;
  IMPassthroughView *v12;
  IMPassthroughView *v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IMPassthroughView;
  v8 = -[IMPassthroughView hitTest:withEvent:](&v16, "hitTest:withEvent:", v7, x, y);
  v9 = (IMPassthroughView *)objc_claimAutoreleasedReturnValue(v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "passthroughView:shouldAcceptHitAtPoint:onView:withEvent:", self, v9, v7, x, y))v12 = v9;
    else
      v12 = 0;
  }
  else if (v9 == self && !self->_acceptsHits)
  {
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }
  v14 = v12;

  return v14;
}

- (BOOL)acceptsHits
{
  return self->_acceptsHits;
}

- (void)setAcceptsHits:(BOOL)a3
{
  self->_acceptsHits = a3;
}

- (IMPassthroughViewDelegate)delegate
{
  return (IMPassthroughViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
