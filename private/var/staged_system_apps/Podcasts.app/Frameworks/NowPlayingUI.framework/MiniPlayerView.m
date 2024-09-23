@implementation MiniPlayerView

- (_TtC12NowPlayingUI14MiniPlayerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC12NowPlayingUI14MiniPlayerView_controller, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MiniPlayerView();
  return -[MiniPlayerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI14MiniPlayerView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC12NowPlayingUI14MiniPlayerView_controller, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MiniPlayerView();
  return -[MiniPlayerView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC12NowPlayingUI14MiniPlayerView_controller);
}

@end
