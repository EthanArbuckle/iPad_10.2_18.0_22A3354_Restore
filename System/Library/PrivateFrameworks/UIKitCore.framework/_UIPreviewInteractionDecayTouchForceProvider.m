@implementation _UIPreviewInteractionDecayTouchForceProvider

- (_UIPreviewInteractionDecayTouchForceProvider)initWithTouchForceProvider:(id)a3
{
  id v6;
  _UIPreviewInteractionDecayTouchForceProvider *v7;
  _UIPreviewInteractionDecayTouchForceProvider *v8;
  double v9;
  void *v10;
  uint64_t v11;
  UICoordinateSpace *coordinateSpace;
  CGFloat v13;
  CGFloat v14;
  _UIPreviewInteractionDecayTouchForceProvider *v15;
  void *v17;
  objc_super v18;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionDecayTouchForceProvider.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("touchForceProvider"));

  }
  v18.receiver = self;
  v18.super_class = (Class)_UIPreviewInteractionDecayTouchForceProvider;
  v7 = -[_UIPreviewInteractionDecayTouchForceProvider init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_active = 1;
    objc_storeStrong((id *)&v7->_touchForceProvider, a3);
    objc_msgSend(v6, "touchForce");
    v8->_initialTouchForce = v9;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fixedCoordinateSpace");
    v11 = objc_claimAutoreleasedReturnValue();
    coordinateSpace = v8->_coordinateSpace;
    v8->_coordinateSpace = (UICoordinateSpace *)v11;

    objc_msgSend(v6, "locationInCoordinateSpace:", v8->_coordinateSpace);
    v8->_location.x = v13;
    v8->_location.y = v14;
    v15 = v8;
  }

  return v8;
}

- (double)touchForce
{
  return 0.0;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UICoordinateSpace convertPoint:toCoordinateSpace:](self->_coordinateSpace, "convertPoint:toCoordinateSpace:", a3, self->_location.x, self->_location.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)cancelInteraction
{
  -[_UIPreviewInteractionDecayTouchForceProvider setActive:](self, "setActive:", 0);
  -[_UIPreviewInteractionTouchForceProviding cancelInteraction](self->_touchForceProvider, "cancelInteraction");
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
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_touchForceProvider, 0);
}

@end
