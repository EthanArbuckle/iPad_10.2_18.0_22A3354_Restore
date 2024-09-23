@implementation TransportContainer

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC5Books18TransportContainer *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_100347654((uint64_t)a4, x, y);

  return v10;
}

@end
