@implementation SCMLPeopleDetectionAttribute

- (NSString)term
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_245C8ED04();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTerm:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_245C8ED10();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute_term);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (unsigned)gender
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute_gender);
  swift_beginAccess();
  return *v2;
}

- (void)setGender:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute_gender);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_245C44930(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_245C42D1C);
}

- (_TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute)init
{
  _TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute *result;

  result = (_TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
