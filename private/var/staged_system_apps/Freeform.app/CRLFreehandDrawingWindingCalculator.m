@implementation CRLFreehandDrawingWindingCalculator

- (void)addPoint:(CGPoint)a3
{
  double y;
  double x;
  CGPoint *lastInputPoints;
  CGPoint *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a3.y;
  x = a3.x;
  lastInputPoints = self->_lastInputPoints;
  v7 = &self->_lastInputPoints[1];
  if (self->_hasPoints)
  {
    v8 = self->_lastInputPoints[0].x;
    v9 = sub_1000603B8(self->_lastInputPoints[1].x, self->_lastInputPoints[1].y, v8);
    v11 = v10;
    v12 = sub_1000603B8(x, y, v8);
    v14 = sub_100060C0C(v9, v11, v12, v13) + self->_totalCrossProduct;
    *lastInputPoints = *v7;
    self->_lastInputPoints[1].x = x;
    self->_lastInputPoints[1].y = y;
    self->_totalCrossProduct = v14;
  }
  else
  {
    self->_lastInputPoints[1] = a3;
    *lastInputPoints = *v7;
    self->_hasPoints = 1;
  }
}

- (BOOL)isWindingClockwise
{
  id v3;

  if (!self->_hasPoints)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Can't compute path winding if the calculator doesn't have any points"), 0));
    objc_exception_throw(v3);
  }
  return self->_totalCrossProduct < 0.0;
}

@end
