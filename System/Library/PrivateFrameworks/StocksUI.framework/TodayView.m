@implementation TodayView

- (_TtC8StocksUI9TodayView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI9TodayView *)sub_1DC09FBF4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI9TodayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC147004();
}

- (NSString)accessibilityLabel
{
  _TtC8StocksUI9TodayView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DC146CDC();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DC408A1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
