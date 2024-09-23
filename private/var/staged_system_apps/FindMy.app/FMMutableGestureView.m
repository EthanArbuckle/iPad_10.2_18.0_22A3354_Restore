@implementation FMMutableGestureView

- (_TtC6FindMy20FMMutableGestureView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMMutableGestureView_identifier);
  v9 = (objc_class *)type metadata accessor for FMMutableGestureView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[FMMutableGestureView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy20FMMutableGestureView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMMutableGestureView_identifier);
  v6 = (objc_class *)type metadata accessor for FMMutableGestureView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[FMMutableGestureView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy20FMMutableGestureView_identifier]);
}

@end
