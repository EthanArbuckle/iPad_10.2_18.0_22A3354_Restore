@implementation _UISelectionBandVisualProvider_iOS

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIPointerInteraction *v11;
  id v12;
  void *v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[_UISelectionBandVisualProvider_iOS setInitialPoint:](self, "setInitialPoint:", 1.79769313e308, 1.79769313e308);
    -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeInteraction:", v8);

    v9 = objc_storeWeak((id *)&self->_view, obj);
    v5 = obj;
    if (obj)
    {
      -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", self);
        -[_UISelectionBandVisualProvider_iOS setPtrInteraction:](self, "setPtrInteraction:", v11);

      }
      v12 = objc_loadWeakRetained((id *)&self->_view);
      -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addInteraction:", v13);

      v5 = obj;
    }
  }

}

- (UIPointerInteraction)ptrInteraction
{
  return self->_ptrInteraction;
}

- (void)setPtrInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_ptrInteraction, a3);
}

- (void)setInitialPoint:(CGPoint)a3
{
  self->_initialPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ptrInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (BOOL)enabled
{
  void *v2;
  char v3;

  -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)beginAtPoint:(CGPoint)a3
{
  id v4;

  -[_UISelectionBandVisualProvider_iOS setInitialPoint:](self, "setInitialPoint:", a3.x, a3.y);
  -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)endAtPoint:(CGPoint)a3
{
  id v4;

  -[_UISelectionBandVisualProvider_iOS setInitialPoint:](self, "setInitialPoint:", 1.79769313e308, 1.79769313e308);
  -[_UISelectionBandVisualProvider_iOS ptrInteraction](self, "ptrInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (BOOL)_isActive
{
  double v2;
  double v3;

  -[_UISelectionBandVisualProvider_iOS initialPoint](self, "initialPoint");
  return v3 != 1.79769313e308 || v2 != 1.79769313e308;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (-[_UISelectionBandVisualProvider_iOS _isActive](self, "_isActive"))
  {
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", CFSTR("UIBandSelectionInteraction.band"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setLatchingAxes:", 3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;

  -[_UISelectionBandVisualProvider_iOS initialPoint](self, "initialPoint", a3, a4);
  +[UIPointerShape _elasticRectShapePinnedAtPoint:](UIPointerShape, "_elasticRectShapePinnedAtPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithShape:constrainedAxes:](UIPointerStyle, "styleWithShape:constrainedAxes:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (CGPoint)initialPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialPoint.x;
  y = self->_initialPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
