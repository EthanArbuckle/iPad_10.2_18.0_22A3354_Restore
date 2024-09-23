@implementation PUPointDisplayLocationProvider

- (PUPointDisplayLocationProvider)init
{
  return -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:](self, "initWithPoint:inCoordinateSpace:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (PUPointDisplayLocationProvider)initWithPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  PUPointDisplayLocationProvider *v9;
  PUPointDisplayLocationProvider *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUPointDisplayLocationProvider;
  v9 = -[PUPointDisplayLocationProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_point.x = x;
    v9->_point.y = y;
    objc_storeStrong((id *)&v9->_coordinateSpace, a4);
  }

  return v10;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  -[PUPointDisplayLocationProvider point](self, "point");
  v6 = v5;
  v8 = v7;
  -[PUPointDisplayLocationProvider coordinateSpace](self, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v4, v6, v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UICoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
}

@end
