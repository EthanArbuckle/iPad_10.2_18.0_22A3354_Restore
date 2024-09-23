@implementation CAMediaTimingFunction

+ (CAMediaTimingFunction)functionWithControlPoints:(const CGPoint *)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat v5;
  CGFloat v6;

  x = a3->x;
  y = a3->y;
  *(float *)&x = a3->x;
  *(float *)&y = y;
  v5 = a3[1].x;
  v6 = a3[1].y;
  *(float *)&v5 = v5;
  *(float *)&v6 = v6;
  return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", x, y, v5, v6);
}

@end
