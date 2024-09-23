@implementation _UIPreviewInteractionSimulatingTouchForceProvider

- (_UIPreviewInteractionSimulatingTouchForceProvider)initWithTouchForce:(double)a3 location:(CGPoint)a4 coordinateSpace:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  _UIPreviewInteractionSimulatingTouchForceProvider *v10;
  _UIPreviewInteractionSimulatingTouchForceProvider *v11;
  _UIPreviewInteractionSimulatingTouchForceProvider *v12;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_UIPreviewInteractionSimulatingTouchForceProvider;
  v10 = -[_UIPreviewInteractionSimulatingTouchForceProvider init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_active = 1;
    v10->_targetTouchForce = a3;
    v10->_location.x = x;
    v10->_location.y = y;
    objc_storeWeak((id *)&v10->_coordinateSpace, v9);
    v12 = v11;
  }

  return v11;
}

- (double)touchForce
{
  return self->_targetTouchForce;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  UICoordinateSpace **p_coordinateSpace;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  p_coordinateSpace = &self->_coordinateSpace;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:toCoordinateSpace:", v5, self->_location.x, self->_location.y);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)cancelInteraction
{
  -[_UIPreviewInteractionSimulatingTouchForceProvider setActive:](self, "setActive:", 0);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinateSpace);
}

@end
