@implementation PointLayer

- (_TtC13EnsembleAgentP33_26E92A52E438E077BCC454CB07601FEC10PointLayer)initWithCoder:(id)a3
{
  sub_100031340();
}

- (_TtC13EnsembleAgentP33_26E92A52E438E077BCC454CB07601FEC10PointLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC13EnsembleAgentP33_26E92A52E438E077BCC454CB07601FEC10PointLayer *)sub_1000313CC(v5);
}

- (void)display
{
  _TtC13EnsembleAgentP33_26E92A52E438E077BCC454CB07601FEC10PointLayer *v2;

  v2 = self;
  sub_1000315E0();

}

- (void)layoutSublayers
{
  _TtC13EnsembleAgentP33_26E92A52E438E077BCC454CB07601FEC10PointLayer *v2;

  v2 = self;
  sub_100031630();

}

- (_TtC13EnsembleAgentP33_26E92A52E438E077BCC454CB07601FEC10PointLayer)init
{
  sub_1000316B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13EnsembleAgentP33_26E92A52E438E077BCC454CB07601FEC10PointLayer_color));
}

@end
