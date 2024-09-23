@implementation DebugLineView

- (_TtC7Measure13DebugLineView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangles) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangleLabels) = (Class)&_swiftEmptyArrayStorage;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[DebugLineView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure13DebugLineView)initWithCoder:(id)a3
{
  id v4;
  _TtC7Measure13DebugLineView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangles) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangleLabels) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC7Measure13DebugLineView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/DebugLineView.swift", 27, 2, 179, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangles));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangleLabels));
}

@end
