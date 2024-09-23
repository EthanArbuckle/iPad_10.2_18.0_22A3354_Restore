@implementation PKHittableDashboardButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  PKHittableDashboardButton *v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[PKHittableDashboardButton hitRect](self, "hitRect", a4);
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v10, v9))
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[PKHittableDashboardButton hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

@end
