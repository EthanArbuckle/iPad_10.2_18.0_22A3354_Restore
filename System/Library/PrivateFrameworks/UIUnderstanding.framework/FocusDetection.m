@implementation FocusDetection

- (BOOL)focused
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_focused);
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_confidence);
}

- (_TtC15UIUnderstanding14FocusDetection)initWithFocused:(BOOL)a3 confidence:(double)a4
{
  objc_super v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_focused) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_confidence) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FocusDetection();
  return -[FocusDetection init](&v5, sel_init);
}

- (_TtC15UIUnderstanding14FocusDetection)init
{
  _TtC15UIUnderstanding14FocusDetection *result;

  result = (_TtC15UIUnderstanding14FocusDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
