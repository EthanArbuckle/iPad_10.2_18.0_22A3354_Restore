@implementation TUIVSpacerLayout

- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3
{
  double x;
  double y;
  double width;
  double height;
  objc_super v7;
  CGRect result;

  if ((a3 & 2) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIVSpacerLayout;
    -[TUILayout computedBoundsPrimitiveWithFlags:](&v7, "computedBoundsPrimitiveWithFlags:");
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
