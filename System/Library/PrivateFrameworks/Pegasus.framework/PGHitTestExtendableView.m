@implementation PGHitTestExtendableView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  unsigned __int8 v8;
  id WeakRetained;
  id v10;
  char v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGHitTestExtendableView;
  v8 = -[PGHitTestExtendableView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestExtenderView);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)&self->_hitTestExtenderView);
    -[PGHitTestExtendableView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    v11 = objc_msgSend(v10, "pointInside:withEvent:", v7);

    v8 |= v11;
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
