@implementation _UIFocusLinearMovementDebugViewLineElement

+ (id)elementWithCGPathElement:(const CGPathElement *)a3
{
  double v3;
  double v4;
  CGPoint *points;
  double x;
  double y;
  double v8;
  double v9;
  CGPoint *v10;
  CGPoint *v11;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  switch(a3->type)
  {
    case kCGPathElementMoveToPoint:
    case kCGPathElementAddLineToPoint:
      points = a3->points;
      x = points->x;
      y = points->y;
      goto LABEL_4;
    case kCGPathElementAddQuadCurveToPoint:
      v10 = a3->points;
      x = v10[1].x;
      y = v10[1].y;
      v8 = v10->x;
      v9 = v10->y;
      break;
    case kCGPathElementAddCurveToPoint:
      v11 = a3->points;
      x = v11[2].x;
      y = v11[2].y;
      v8 = v11->x;
      v9 = v11->y;
      v3 = v11[1].x;
      v4 = v11[1].y;
      break;
    default:
      x = *MEMORY[0x1E0C9D538];
      y = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_4:
      v8 = *MEMORY[0x1E0C9D538];
      v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      break;
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:point:cp1:cp2:", a3->type, x, y, v8, v9, v3, v4);
}

- (_UIFocusLinearMovementDebugViewLineElement)initWithType:(int)a3 point:(CGPoint)a4 cp1:(CGPoint)a5 cp2:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _UIFocusLinearMovementDebugViewLineElement *result;
  objc_super v14;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusLinearMovementDebugViewLineElement;
  result = -[_UIFocusLinearMovementDebugViewLineElement init](&v14, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_point.x = v11;
    result->_point.y = v10;
    result->_cp1.x = v9;
    result->_cp1.y = v8;
    result->_cp2.x = x;
    result->_cp2.y = y;
  }
  return result;
}

- (int)type
{
  return self->_type;
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

- (CGPoint)cp1
{
  double x;
  double y;
  CGPoint result;

  x = self->_cp1.x;
  y = self->_cp1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)cp2
{
  double x;
  double y;
  CGPoint result;

  x = self->_cp2.x;
  y = self->_cp2.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
