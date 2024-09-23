@implementation RPTDragInteraction

- (id)initByDraggingWindow:(id)a3 byDelta:(CGVector)a4
{
  double dy;
  double dx;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  RPTDragInteraction *v12;
  RPTDragInteraction *v13;
  uint64_t v14;
  RPTCoordinateSpaceConverter *conversion;
  double v16;
  double v17;
  CGFloat v18;
  objc_super v20;

  dy = a4.dy;
  dx = a4.dx;
  v7 = a3;
  objc_msgSend(v7, "rpt_accessibilityActivationPointAttribute");
  v9 = v8;
  v11 = v10;
  v20.receiver = self;
  v20.super_class = (Class)RPTDragInteraction;
  v12 = -[RPTDragInteraction init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_sourceLocation.x = v9;
    v12->_sourceLocation.y = v11;
    +[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    conversion = v13->_conversion;
    v13->_conversion = (RPTCoordinateSpaceConverter *)v14;

    -[RPTCoordinateSpaceConverter convertVector:](v13->_conversion, "convertVector:", dx, dy);
    v18 = v17 + v13->_sourceLocation.y;
    v13->_destinationLocation.x = v16 + v13->_sourceLocation.x;
    v13->_destinationLocation.y = v18;
    v13->__locationsAreAlreadyScreenSpace = 1;
  }

  return v13;
}

- (id)initFromSourceLocation:(CGPoint)a3 toDestinationLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  RPTDragInteraction *v8;
  RPTDragInteraction *v9;
  uint64_t v10;
  RPTCoordinateSpaceConverter *conversion;
  objc_super v13;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)RPTDragInteraction;
  v8 = -[RPTDragInteraction init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sourceLocation.x = v7;
    v8->_sourceLocation.y = v6;
    v8->_destinationLocation.x = x;
    v8->_destinationLocation.y = y;
    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v10 = objc_claimAutoreleasedReturnValue();
    conversion = v9->_conversion;
    v9->_conversion = (RPTCoordinateSpaceConverter *)v10;

    v9->__locationsAreAlreadyScreenSpace = 0;
  }
  return v9;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  double x;
  double y;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  if (-[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"))
  {
    x = self->_sourceLocation.x;
    y = self->_sourceLocation.y;
  }
  else
  {
    -[RPTDragInteraction conversion](self, "conversion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:", self->_sourceLocation.x, self->_sourceLocation.y);
    x = v9;
    y = v10;

  }
  if (-[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"))
  {
    v11 = self->_destinationLocation.x;
    v12 = self->_destinationLocation.y;
  }
  else
  {
    -[RPTDragInteraction conversion](self, "conversion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertPoint:", self->_destinationLocation.x, self->_destinationLocation.y);
    v11 = v14;
    v12 = v15;

  }
  objc_msgSend(v16, "pointerMoveToPointIfApplicable:", x, y);
  objc_msgSend(v16, "pointerOrFingerTapDown:", x, y);
  objc_msgSend(v16, "pointerOrFingerMoveToPoint:duration:", v11, v12, a4);
  objc_msgSend(v16, "pointerOrFingerTapUp:", v11, v12);

}

- (id)reversedInteraction
{
  id v3;

  v3 = -[RPTDragInteraction initFromSourceLocation:toDestinationLocation:]([RPTDragInteraction alloc], "initFromSourceLocation:toDestinationLocation:", self->_destinationLocation.x, self->_destinationLocation.y, self->_sourceLocation.x, self->_sourceLocation.y);
  objc_msgSend(v3, "set_locationsAreAlreadyScreenSpace:", -[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"));
  objc_msgSend(v3, "setConversion:", self->_conversion);
  return v3;
}

- (id)interactionByScalingBy:(double)a3
{
  id v4;

  v4 = -[RPTDragInteraction initFromSourceLocation:toDestinationLocation:]([RPTDragInteraction alloc], "initFromSourceLocation:toDestinationLocation:", self->_sourceLocation.x, self->_sourceLocation.y, vaddq_f64((float64x2_t)self->_sourceLocation, vmulq_n_f64(vsubq_f64((float64x2_t)self->_destinationLocation, (float64x2_t)self->_sourceLocation), a3)));
  objc_msgSend(v4, "set_locationsAreAlreadyScreenSpace:", -[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"));
  objc_msgSend(v4, "setConversion:", self->_conversion);
  return v4;
}

- (id)_andThenDragBy:(CGVector)a3
{
  double dy;
  double dx;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  dy = a3.dy;
  dx = a3.dx;
  -[RPTDragInteraction conversion](self, "conversion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertVector:", dx, dy);
  v8 = v7;
  v10 = v9;

  v11 = -[RPTDragInteraction initFromSourceLocation:toDestinationLocation:]([RPTDragInteraction alloc], "initFromSourceLocation:toDestinationLocation:", self->_destinationLocation.x, self->_destinationLocation.y, v8 + self->_destinationLocation.x, v10 + self->_destinationLocation.y);
  objc_msgSend(v11, "set_locationsAreAlreadyScreenSpace:", -[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"));
  objc_msgSend(v11, "setConversion:", self->_conversion);
  return v11;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (CGPoint)sourceLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_sourceLocation.x;
  y = self->_sourceLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSourceLocation:(CGPoint)a3
{
  self->_sourceLocation = a3;
}

- (CGPoint)destinationLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_destinationLocation.x;
  y = self->_destinationLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDestinationLocation:(CGPoint)a3
{
  self->_destinationLocation = a3;
}

- (BOOL)_locationsAreAlreadyScreenSpace
{
  return self->__locationsAreAlreadyScreenSpace;
}

- (void)set_locationsAreAlreadyScreenSpace:(BOOL)a3
{
  self->__locationsAreAlreadyScreenSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversion, 0);
}

@end
