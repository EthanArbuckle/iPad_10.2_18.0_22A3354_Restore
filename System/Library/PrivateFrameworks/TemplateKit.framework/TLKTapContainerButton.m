@implementation TLKTapContainerButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TLKTapContainerButton containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[TLKTapContainerButton containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pointInside:withEvent:", v7, x, y);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TLKTapContainerButton;
    v10 = -[TLKTapContainerButton pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  }

  return v10;
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
}

@end
