@implementation _UIPlatterItem

- (_UIPlatterItem)initWithView:(id)a3
{
  id v4;
  _UIPlatterItem *v5;
  _UIPlatterItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPlatterItem;
  v5 = -[_UIPlatterItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_heldView, v4);

  return v6;
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  objc_msgSend(WeakRetained, "setCenter:", x, y);

}

- (CGPoint)center
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  objc_msgSend(WeakRetained, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGAffineTransform)transform
{
  id WeakRetained;
  CGAffineTransform *result;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "transform");
    WeakRetained = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGRect)bounds
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  objc_msgSend(WeakRetained, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIView)heldView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_heldView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_heldView);
}

@end
