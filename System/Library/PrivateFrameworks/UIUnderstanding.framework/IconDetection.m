@implementation IconDetection

- (int64_t)label
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_label);
}

- (NSString)labelString
{
  void *v2;

  IconLabel.toString()();
  v2 = (void *)sub_24972CB94();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_confidence);
}

- (_TtC15UIUnderstanding13IconDetection)initWithLabel:(int64_t)a3 confidence:(double)a4
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_label) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_confidence) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IconDetection();
  return -[IconDetection init](&v5, sel_init);
}

- (_TtC15UIUnderstanding13IconDetection)init
{
  _TtC15UIUnderstanding13IconDetection *result;

  result = (_TtC15UIUnderstanding13IconDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
