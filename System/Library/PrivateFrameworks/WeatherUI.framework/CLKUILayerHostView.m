@implementation CLKUILayerHostView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CLKUILayerHostView superviewDelegate](self, "superviewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CLKUILayerHostView superviewDelegate](self, "superviewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pointInside:withEvent:", v7, x, y);

  return v9;
}

- (UIView)superviewDelegate
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_superviewDelegate);
}

- (void)setSuperviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_superviewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_superviewDelegate);
}

@end
