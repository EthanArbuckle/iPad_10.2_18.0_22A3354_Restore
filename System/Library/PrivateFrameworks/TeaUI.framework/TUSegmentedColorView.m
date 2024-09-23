@implementation TUSegmentedColorView

- (UIColor)startColor
{
  return (UIColor *)SegmentedColorView.startColor.getter();
}

- (void)setStartColor:(id)a3
{
  id v4;
  TUSegmentedColorView *v5;

  v4 = a3;
  v5 = self;
  SegmentedColorView.startColor.setter();

}

- (UIColor)endColor
{
  return (UIColor *)SegmentedColorView.endColor.getter();
}

- (void)setEndColor:(id)a3
{
  id v4;
  TUSegmentedColorView *v5;

  v4 = a3;
  v5 = self;
  SegmentedColorView.endColor.setter();

}

- (int64_t)numberOfSegments
{
  int64_t result;

  SegmentedColorView.numberOfSegments.getter();
  return result;
}

- (void)setNumberOfSegments:(int64_t)a3
{
  TUSegmentedColorView *v3;

  v3 = self;
  SegmentedColorView.numberOfSegments.setter();

}

- (int64_t)direction
{
  int64_t result;

  SegmentedColorView.direction.getter();
  return result;
}

- (void)setDirection:(int64_t)a3
{
  TUSegmentedColorView *v3;

  v3 = self;
  SegmentedColorView.direction.setter();

}

- (TUSegmentedColorView)initWithFrame:(CGRect)a3
{
  return (TUSegmentedColorView *)SegmentedColorView.init(frame:)();
}

- (TUSegmentedColorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B159C404();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TUSegmentedColorView *v7;
  __C::CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  SegmentedColorView.draw(_:)(v8);

}

- (void).cxx_destruct
{

}

@end
