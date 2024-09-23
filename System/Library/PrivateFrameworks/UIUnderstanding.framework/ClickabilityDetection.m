@implementation ClickabilityDetection

- (BOOL)clickable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickable);
}

- (int64_t)clickType
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickType);
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_confidence);
}

- (_TtC15UIUnderstanding21ClickabilityDetection)initWithClickable:(BOOL)a3 clickType:(int64_t)a4 confidence:(double)a5
{
  objc_super v6;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickable) = a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickType) = (Class)a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_confidence) = a5;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClickabilityDetection();
  return -[ClickabilityDetection init](&v6, sel_init);
}

- (_TtC15UIUnderstanding21ClickabilityDetection)init
{
  _TtC15UIUnderstanding21ClickabilityDetection *result;

  result = (_TtC15UIUnderstanding21ClickabilityDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
