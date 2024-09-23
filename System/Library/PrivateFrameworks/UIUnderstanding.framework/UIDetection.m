@implementation UIDetection

- (int64_t)label
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_label);
}

- (NSString)labelString
{
  void *v2;

  UIType.toString()();
  v2 = (void *)sub_24972CB94();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_confidence);
}

- (NSString)text
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_text;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_24972CB94();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_24972CBB8();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_text);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC15UIUnderstanding11UIDetection)initWithLabel:(int64_t)a3 confidence:(double)a4 text:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  objc_super v13;

  if (a5)
  {
    v8 = sub_24972CBB8();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_text);
  *v11 = 0;
  v11[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_label) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_confidence) = a4;
  swift_beginAccess();
  *v11 = v8;
  v11[1] = v10;
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UIDetection();
  return -[UIDetection init](&v13, sel_init);
}

- (_TtC15UIUnderstanding11UIDetection)init
{
  _TtC15UIUnderstanding11UIDetection *result;

  result = (_TtC15UIUnderstanding11UIDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
