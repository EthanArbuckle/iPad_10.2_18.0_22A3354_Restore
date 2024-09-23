@implementation CubicSpringTimingParameters

- (id)copyWithZone:(void *)a3
{
  _TtC12NowPlayingUI27CubicSpringTimingParameters *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  v4 = self;
  sub_106440((uint64_t)a3, v9);

  v5 = v10;
  v6 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  __swift_destroy_boxed_opaque_existential_0(v9);
  return v7;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return (UICubicTimingParameters *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                            + OBJC_IVAR____TtC12NowPlayingUI27CubicSpringTimingParameters_springCubicTimingParameters));
}

- (_TtC12NowPlayingUI27CubicSpringTimingParameters)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI27CubicSpringTimingParameters_springCubicTimingParameters) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CubicSpringTimingParameters();
  return -[CubicSpringTimingParameters init](&v3, "init");
}

- (_TtC12NowPlayingUI27CubicSpringTimingParameters)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI27CubicSpringTimingParameters_springCubicTimingParameters) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CubicSpringTimingParameters();
  return -[CubicSpringTimingParameters initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC12NowPlayingUI27CubicSpringTimingParameters)initWithDampingRatio:(double)a3 initialVelocity:(CGVector)a4
{
  double dy;
  double dx;
  objc_super v8;

  dy = a4.dy;
  dx = a4.dx;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI27CubicSpringTimingParameters_springCubicTimingParameters) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CubicSpringTimingParameters();
  return -[CubicSpringTimingParameters initWithDampingRatio:initialVelocity:](&v8, "initWithDampingRatio:initialVelocity:", a3, dx, dy);
}

- (_TtC12NowPlayingUI27CubicSpringTimingParameters)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(CGVector)a6
{
  double dy;
  double dx;
  objc_super v12;

  dy = a6.dy;
  dx = a6.dx;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI27CubicSpringTimingParameters_springCubicTimingParameters) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CubicSpringTimingParameters();
  return -[CubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](&v12, "initWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, dx, dy);
}

- (_TtC12NowPlayingUI27CubicSpringTimingParameters)initWithDuration:(double)a3 bounce:(double)a4 initialVelocity:(CGVector)a5
{
  double dy;
  double dx;
  objc_super v10;

  dy = a5.dy;
  dx = a5.dx;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI27CubicSpringTimingParameters_springCubicTimingParameters) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CubicSpringTimingParameters();
  return -[CubicSpringTimingParameters initWithDuration:bounce:initialVelocity:](&v10, "initWithDuration:bounce:initialVelocity:", a3, a4, dx, dy);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27CubicSpringTimingParameters_springCubicTimingParameters));
}

@end
