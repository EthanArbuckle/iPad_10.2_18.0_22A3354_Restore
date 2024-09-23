@implementation RouteStepCalloutCell

+ (RouteStepCalloutCell)cellWithRoute:(id)a3 stepIndex:(unint64_t)a4 type:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithRoute:stepIndex:type:", v8, a4, v5);

  return (RouteStepCalloutCell *)v9;
}

- (RouteStepCalloutCell)initWithRoute:(id)a3 stepIndex:(unint64_t)a4 type:(unsigned int)a5
{
  id v8;
  RouteStepCalloutCell *v9;
  RouteStepCalloutCell *v10;
  UIColor *v11;
  UIColor *calloutTextColor;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RouteStepCalloutCell;
  v9 = -[RouteStepCalloutCell init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    -[RouteStepCalloutCell setRoute:](v9, "setRoute:", v8);
    -[RouteStepCalloutCell setStepIndex:](v10, "setStepIndex:", a4);
    v11 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.396078431, 0.62745098, 0.992156863, 1.0);
    calloutTextColor = v10->_calloutTextColor;
    v10->_calloutTextColor = v11;

    v10->_calloutType = a5;
    v10->_numberOfAttemptedRotations = 0;
  }

  return v10;
}

- (GEOComposedRouteStep)routeStep
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", self->_stepIndex));

  return (GEOComposedRouteStep *)v4;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  __int128 v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  v4 = *(_OWORD *)&a3->a;
  v5 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_t.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_t.tx = v5;
  *(_OWORD *)&self->_t.a = v4;
  -[RouteStepCalloutCell _frameForType:](self, "_frameForType:", self->_calloutType);
  self->_frame.origin.x = v6;
  self->_frame.origin.y = v7;
  self->_frame.size.width = v8;
  self->_frame.size.height = v9;
}

- (CGRect)_frameForType:(unsigned int)a3
{
  void *v4;
  MKMapPoint v5;
  float x;
  double v7;
  float y;
  double v9;
  double v10;
  unsigned int calloutType;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CLLocationCoordinate2D v23;
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCalloutCell routeStep](self, "routeStep", *(_QWORD *)&a3));
  objc_msgSend(v4, "startCoordinate");
  v5 = MKMapPointForCoordinate(v23);

  x = v5.x;
  v7 = x;
  y = v5.y;
  v9 = self->_t.c * y + self->_t.a * v7;
  v10 = self->_t.d * y + self->_t.b * v7;
  calloutType = self->_calloutType;
  if (calloutType - 4 < 2)
  {
    v13 = 18.0;
    v12 = 9.0;
  }
  else if (calloutType != 2 && calloutType)
  {
    v13 = 29.5;
    v12 = 34.0;
  }
  else
  {
    v12 = 29.0;
    v13 = 34.0;
  }
  v14 = self->_t.tx + v9;
  v15 = self->_t.ty + v10;
  switch(calloutType)
  {
    case 0u:
      v14 = v14 - v12 * 0.5;
      v15 = v15 - v13 + 4.0;
      v17 = v15 + 0.5;
      goto LABEL_12;
    case 1u:
      v14 = v14 + -4.0;
      v15 = v15 + v13 * -0.5;
      v16 = v14 + 5.5 + -0.5;
      goto LABEL_15;
    case 2u:
      v14 = v14 + v12 * -0.5;
      v15 = v15 + -4.0;
      v17 = v15 + 5.5 + -1.0;
LABEL_12:
      v16 = v14;
      goto LABEL_16;
    case 3u:
      v14 = v14 - v12 + 4.0;
      v15 = v15 + v13 * -0.5 + -0.5;
      goto LABEL_14;
    case 4u:
    case 5u:
      v14 = v14 + v12 * -0.5;
      v15 = v15 - v13;
      v16 = v14 + -9.5;
      v17 = v15 + -9.5;
      goto LABEL_16;
    default:
LABEL_14:
      v16 = v14;
LABEL_15:
      v17 = v15;
LABEL_16:
      self->_frame.origin.x = v14;
      self->_frame.origin.y = v15;
      self->_frame.size.width = v12;
      self->_frame.size.height = v13;
      self->_contentRect.origin.x = v16 + 9.5;
      self->_contentRect.origin.y = v17 + 9.5;
      __asm { FMOV            V4.2D, #10.0 }
      self->_contentRect.size = _Q4;
      result.size.height = v13;
      result.size.width = v12;
      result.origin.y = v15;
      result.origin.x = v14;
      return result;
  }
}

- (BOOL)shouldRotateWithCallout:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGRect v9;

  objc_msgSend(a3, "contentRect");
  v9.origin.x = v4;
  v9.origin.y = v5;
  v9.size.width = v6;
  v9.size.height = v7;
  return CGRectIntersectsRect(self->_contentRect, v9);
}

- (BOOL)rotate
{
  unint64_t numberOfAttemptedRotations;
  uint64_t calloutType;
  unsigned int v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;

  numberOfAttemptedRotations = self->_numberOfAttemptedRotations;
  if (numberOfAttemptedRotations == 5)
    return 0;
  calloutType = (int)self->_calloutType;
  if ((calloutType & 0xFFFFFFFE) == 4)
    return 0;
  self->_numberOfAttemptedRotations = numberOfAttemptedRotations + 1;
  if (calloutType > 3)
    v6 = 0;
  else
    v6 = dword_100E37338[calloutType];
  self->_calloutType = v6;
  -[RouteStepCalloutCell _frameForType:](self, "_frameForType:");
  self->_frame.origin.x = v7;
  self->_frame.origin.y = v8;
  self->_frame.size.width = v9;
  self->_frame.size.height = v10;
  return 1;
}

- (void)drawInRect:(CGRect)a3
{
  void *v4;
  double MidX;
  double MidY;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", self->_calloutType, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  if ((self->_calloutType & 0xFFFFFFFE) != 4)
  {
    -[UIColor set](self->_calloutTextColor, "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_stepIndex));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v4, 0));

    MidX = CGRectGetMidX(self->_contentRect);
    MidY = CGRectGetMidY(self->_contentRect);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 10.0));
    objc_msgSend(v13, "_maps_sizeWithFont:", v7);
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 10.0));
    objc_msgSend(v13, "_maps_drawAtPoint:withFont:", v12, MidX - v9 * 0.5, MidY - v11 * 0.5);

  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutTextColor, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
