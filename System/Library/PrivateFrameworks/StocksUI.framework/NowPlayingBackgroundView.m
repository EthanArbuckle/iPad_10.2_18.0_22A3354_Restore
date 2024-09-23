@implementation NowPlayingBackgroundView

- (_TtC8StocksUI24NowPlayingBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8StocksUI24NowPlayingBackgroundView *v7;
  void *v8;
  _TtC8StocksUI24NowPlayingBackgroundView *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v7 = -[NowPlayingBackgroundView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_secondarySystemBackgroundColor);
  -[NowPlayingBackgroundView setBackgroundColor:](v9, sel_setBackgroundColor_, v10);

  return v9;
}

- (_TtC8StocksUI24NowPlayingBackgroundView)initWithCoder:(id)a3
{
  _TtC8StocksUI24NowPlayingBackgroundView *result;

  result = (_TtC8StocksUI24NowPlayingBackgroundView *)sub_1DC409838();
  __break(1u);
  return result;
}

@end
