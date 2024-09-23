@implementation FMPFRingView

- (_TtC10TVRemoteUI12FMPFRingView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _TtC10TVRemoteUI12FMPFRingView *result;

  v4 = OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_style;
  v5 = one-time initialization token for default;
  v6 = a3;
  if (v5 != -1)
    swift_once();
  v7 = (char *)self + v4;
  v8 = qword_25513C4C8;
  v9 = (void *)qword_25513C4D0;
  *(_OWORD *)v7 = static FMPFRingViewStyle.default;
  *((_QWORD *)v7 + 2) = v8;
  *((_QWORD *)v7 + 3) = v9;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_additionalRadiusScale) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_startAngle) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_endAngle) = 0;
  v10 = v9;

  result = (_TtC10TVRemoteUI12FMPFRingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  type metadata accessor for SKConstraint(0, &lazy cache variable for type metadata for CAShapeLayer);
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)description
{
  _TtC10TVRemoteUI12FMPFRingView *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = FMR1HapticsController.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x22075C584](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10TVRemoteUI12FMPFRingView *v2;

  v2 = self;
  FMPFRingView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_style));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI12FMPFRingView_additionalRadiusScaleSpring));

}

- (void)drawRect:(CGRect)a3
{
  _TtC10TVRemoteUI12FMPFRingView *v3;

  v3 = self;
  specialized FMPFRingView.draw(_:)();

}

- (_TtC10TVRemoteUI12FMPFRingView)initWithFrame:(CGRect)a3
{
  _TtC10TVRemoteUI12FMPFRingView *result;

  result = (_TtC10TVRemoteUI12FMPFRingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
