@implementation SCMLVisualGenerationHandlingResult

- (NSDictionary)people
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for SCMLPersonAttributes();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_245C8ECBC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setPeople:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for SCMLPersonAttributes();
  v4 = sub_245C8ECC8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult_people);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult)init
{
  _TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult *result;

  result = (_TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
