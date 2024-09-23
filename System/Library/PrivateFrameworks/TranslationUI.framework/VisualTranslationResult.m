@implementation VisualTranslationResult

- (NSUUID)uuid
{
  return (NSUUID *)(id)sub_1D2D9C6CC();
}

- (NSString)string
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D2D9DCB0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isPassthrough
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_isPassthrough);
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topLeft);
  v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topLeft];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topRight);
  v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topRight];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomLeft);
  v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomLeft];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomRight);
  v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomRight];
  result.y = v3;
  result.x = v2;
  return result;
}

- (_TtC13TranslationUI23VisualTranslationResult)init
{
  _TtC13TranslationUI23VisualTranslationResult *result;

  result = (_TtC13TranslationUI23VisualTranslationResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_uuid;
  v3 = sub_1D2D9C6FC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
