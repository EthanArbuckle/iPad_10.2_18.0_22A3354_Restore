@implementation SBPIPHitTestExtendableView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  unsigned int v8;
  id WeakRetained;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBPIPHitTestExtendableView;
  v8 = -[SBPIPHitTestExtendableView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestExtenderView);
  if (WeakRetained)
  {
    -[SBPIPHitTestExtendableView convertPoint:toView:](self, "convertPoint:toView:", WeakRetained, x, y);
    v8 |= objc_msgSend(WeakRetained, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (UIView)hitTestExtenderView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hitTestExtenderView);
}

- (void)setHitTestExtenderView:(id)a3
{
  objc_storeWeak((id *)&self->_hitTestExtenderView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hitTestExtenderView);
}

@end
