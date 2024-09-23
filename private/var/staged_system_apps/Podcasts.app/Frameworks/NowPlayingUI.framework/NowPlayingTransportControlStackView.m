@implementation NowPlayingTransportControlStackView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC12NowPlayingUI35NowPlayingTransportControlStackView *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_131C48(v4, x, y);

  return v4 & 1;
}

- (_TtC12NowPlayingUI35NowPlayingTransportControlStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI35NowPlayingTransportControlStackView_useBoundsAsPointInside) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NowPlayingTransportControlStackView();
  return -[NowPlayingTransportControlStackView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI35NowPlayingTransportControlStackView)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI35NowPlayingTransportControlStackView_useBoundsAsPointInside) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingTransportControlStackView();
  return -[NowPlayingTransportControlStackView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
