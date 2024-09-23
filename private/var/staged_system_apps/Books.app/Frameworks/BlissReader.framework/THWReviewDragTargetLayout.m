@implementation THWReviewDragTargetLayout

- (THWReviewDragTargetLayout)initWithIndex:(unint64_t)a3
{
  THWReviewDragTargetLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewDragTargetLayout;
  result = -[THWReviewDragTargetLayout initWithInfo:](&v5, "initWithInfo:", 0);
  if (result)
    result->_index = a3;
  return result;
}

- (THWReviewDragTargetLayout)init
{
  return -[THWReviewDragTargetLayout initWithIndex:](self, "initWithIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewDragTargetRep, a2);
}

- (double)distanceSquaredToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  y = a3.y;
  x = a3.x;
  objc_msgSend(-[THWReviewDragTargetLayout geometry](self, "geometry"), "frame");
  v9 = TSDCenterOfRect(v5, v6, v7, v8);
  TSDDistanceSquared(x, y, v9, v10);
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

@end
