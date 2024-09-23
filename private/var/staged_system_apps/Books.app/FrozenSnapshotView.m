@implementation FrozenSnapshotView

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18FrozenSnapshotView_childView);
  if (v2)
  {
    objc_msgSend(v2, "frame");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v6 = 480.0;
    v4 = 320.0;
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtC5Books18FrozenSnapshotView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18FrozenSnapshotView_childView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FrozenSnapshotView();
  return -[FrozenSnapshotView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books18FrozenSnapshotView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18FrozenSnapshotView_childView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FrozenSnapshotView();
  return -[FrozenSnapshotView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
