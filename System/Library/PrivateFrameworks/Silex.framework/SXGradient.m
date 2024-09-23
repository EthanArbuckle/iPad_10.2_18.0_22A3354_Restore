@implementation SXGradient

- (SXGradient)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 colors:(id)a5 locations:(id)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  id v12;
  id v13;
  SXGradient *v14;
  SXGradient *v15;
  uint64_t v16;
  NSArray *colors;
  uint64_t v18;
  NSArray *locations;
  objc_super v21;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SXGradient;
  v14 = -[SXGradient init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_startPoint.x = v10;
    v14->_startPoint.y = v9;
    v14->_endPoint.x = x;
    v14->_endPoint.y = y;
    v16 = objc_msgSend(v12, "copy");
    colors = v15->_colors;
    v15->_colors = (NSArray *)v16;

    v18 = objc_msgSend(v13, "copy");
    locations = v15->_locations;
    v15->_locations = (NSArray *)v18;

  }
  return v15;
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
