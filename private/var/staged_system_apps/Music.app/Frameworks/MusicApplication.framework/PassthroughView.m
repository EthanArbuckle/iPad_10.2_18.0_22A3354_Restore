@implementation PassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC11MusicCoreUI15PassthroughView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = PassthroughView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC11MusicCoreUI15PassthroughView)initWithFrame:(CGRect)a3
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PassthroughView();
  return -[PassthroughView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MusicCoreUI15PassthroughView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PassthroughView();
  return -[PassthroughView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
