@implementation PointTrail

- (_TtC7Measure10PointTrail)initWithCoder:(id)a3
{
  id v4;
  _TtC7Measure10PointTrail *result;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_pointNodes) = (Class)_swiftEmptyArrayStorage;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_minDistance) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_stretchingRate) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_isStarted) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_minDistanceSquared) = 0;
  v4 = a3;

  result = (_TtC7Measure10PointTrail *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/PointTrail.swift", 24, 2, 31, 0);
  __break(1u);
  return result;
}

- (_TtC7Measure10PointTrail)init
{
  _TtC7Measure10PointTrail *result;

  result = (_TtC7Measure10PointTrail *)_swift_stdlib_reportUnimplementedInitializer("Measure.PointTrail", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_pointNodes));
}

@end
