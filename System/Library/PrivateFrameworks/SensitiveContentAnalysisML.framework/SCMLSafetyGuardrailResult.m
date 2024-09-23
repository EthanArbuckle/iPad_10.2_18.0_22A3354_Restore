@implementation SCMLSafetyGuardrailResult

- (BOOL)safe
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult_safe);
}

- (NSArray)labels
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_245C8EDE8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult)initWithResult:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_245C8ED10();
  return (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult *)SCMLSafetyGuardrailResult.init(result:)(v3, v4);
}

- (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult)init
{
  _TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult *result;

  result = (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
