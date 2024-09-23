@implementation RPTResizeInteraction

- (RPTResizeInteraction)initWithDragPoint:(CGPoint)a3 sourceSize:(CGSize)a4 destinationSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  CGFloat y;
  CGFloat x;
  RPTResizeInteraction *v11;
  uint64_t v12;
  RPTCoordinateSpaceConverter *conversion;
  objc_super v15;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)RPTResizeInteraction;
  v11 = -[RPTResizeInteraction init](&v15, sel_init);
  if (v11)
  {
    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v12 = objc_claimAutoreleasedReturnValue();
    conversion = v11->_conversion;
    v11->_conversion = (RPTCoordinateSpaceConverter *)v12;

    v11->_dragPoint.x = x;
    v11->_dragPoint.y = y;
    v11->_initialSize.width = v8;
    v11->_initialSize.height = v7;
    v11->_finalSize.width = width;
    v11->_finalSize.height = height;
    v11->_delta.dx = width - v8;
    v11->_delta.dy = height - v7;
    *(_WORD *)&v11->_shouldLift = 257;
  }
  return v11;
}

- (RPTResizeInteraction)initWithDragPoint:(CGPoint)a3 delta:(CGVector)a4 sourceSize:(CGSize)a5
{
  double height;
  double width;
  double dy;
  double dx;
  CGFloat y;
  CGFloat x;
  RPTResizeInteraction *v11;
  RPTResizeInteraction *v12;
  uint64_t v13;
  RPTCoordinateSpaceConverter *conversion;
  objc_super v16;

  height = a5.height;
  width = a5.width;
  dy = a4.dy;
  dx = a4.dx;
  y = a3.y;
  x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)RPTResizeInteraction;
  v11 = -[RPTResizeInteraction init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_dragPoint.x = x;
    v11->_dragPoint.y = y;
    v11->_initialSize.width = width;
    v11->_initialSize.height = height;
    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v13 = objc_claimAutoreleasedReturnValue();
    conversion = v12->_conversion;
    v12->_conversion = (RPTCoordinateSpaceConverter *)v13;

    v12->_finalSize.width = dx + width;
    v12->_finalSize.height = dy + height;
    v12->_delta.dx = dx;
    v12->_delta.dy = dy;
    *(_WORD *)&v12->_shouldLift = 257;
  }
  return v12;
}

- (RPTResizeInteraction)initWithWindow:(id)a3 destinationSize:(CGSize)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGRect v21;
  CGRect v22;

  v5 = a3;
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v10 = CGRectGetMaxX(v21) + -5.0;
  objc_msgSend(v5, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v22.origin.x = v12;
  v22.origin.y = v14;
  v22.size.width = v16;
  v22.size.height = v18;
  return -[RPTResizeInteraction initWithDragPoint:sourceSize:destinationSize:](self, "initWithDragPoint:sourceSize:destinationSize:", v10, CGRectGetMaxY(v22) + -5.0, v7, v9, a4.width, a4.height);
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[RPTResizeInteraction conversion](self, "conversion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:", self->_dragPoint.x, self->_dragPoint.y);
  objc_msgSend(v11, "pointerMoveToPointIfApplicable:");

  if (self->_shouldPress)
  {
    -[RPTResizeInteraction conversion](self, "conversion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertPoint:", self->_dragPoint.x, self->_dragPoint.y);
    objc_msgSend(v11, "pointerOrFingerTapDown:");

  }
  v7 = self->_delta.dx + self->_dragPoint.x;
  v8 = self->_delta.dy + self->_dragPoint.y;
  -[RPTResizeInteraction conversion](self, "conversion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:", v7, v8);
  objc_msgSend(v11, "pointerOrFingerMoveToPoint:duration:");

  if (self->_shouldLift)
  {
    -[RPTResizeInteraction conversion](self, "conversion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:", v7, v8);
    objc_msgSend(v11, "pointerOrFingerTapUp:");

  }
}

- (id)reversedInteraction
{
  RPTResizeInteraction *v3;

  v3 = -[RPTResizeInteraction initWithDragPoint:sourceSize:destinationSize:]([RPTResizeInteraction alloc], "initWithDragPoint:sourceSize:destinationSize:", self->_delta.dx + self->_dragPoint.x, self->_delta.dy + self->_dragPoint.y, self->_finalSize.width, self->_finalSize.height, self->_initialSize.width, self->_initialSize.height);
  -[RPTResizeInteraction setConversion:](v3, "setConversion:", self->_conversion);
  return v3;
}

- (id)interactionByScalingBy:(double)a3
{
  RPTResizeInteraction *v4;

  v4 = -[RPTResizeInteraction initWithDragPoint:delta:sourceSize:]([RPTResizeInteraction alloc], "initWithDragPoint:delta:sourceSize:", self->_dragPoint.x, self->_dragPoint.y, self->_delta.dx * a3, self->_delta.dy * a3, self->_initialSize.width, self->_initialSize.height);
  -[RPTResizeInteraction setConversion:](v4, "setConversion:", self->_conversion);
  return v4;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (CGPoint)dragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_dragPoint.x;
  y = self->_dragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDragPoint:(CGPoint)a3
{
  self->_dragPoint = a3;
}

- (CGVector)delta
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_delta.dx;
  dy = self->_delta.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setDelta:(CGVector)a3
{
  self->_delta = a3;
}

- (CGSize)initialSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialSize.width;
  height = self->_initialSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)finalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_finalSize.width;
  height = self->_finalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldLift
{
  return self->_shouldLift;
}

- (void)setShouldLift:(BOOL)a3
{
  self->_shouldLift = a3;
}

- (BOOL)shouldPress
{
  return self->_shouldPress;
}

- (void)setShouldPress:(BOOL)a3
{
  self->_shouldPress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversion, 0);
}

@end
