@implementation SCMLPersonAttributes

- (BOOL)specific
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_specific;
  swift_beginAccess();
  return *v2;
}

- (void)setSpecific:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_specific;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isGroup
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_isGroup;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGroup:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_isGroup;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasAge
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasAge;
  swift_beginAccess();
  return *v2;
}

- (void)setHasAge:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasAge;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasGender
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasGender;
  swift_beginAccess();
  return *v2;
}

- (void)setHasGender:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasGender;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasEthnicity
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasEthnicity;
  swift_beginAccess();
  return *v2;
}

- (void)setHasEthnicity:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasEthnicity;
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)age
{
  return (NSArray *)sub_245C43B34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_age);
}

- (void)setAge:(id)a3
{
  sub_245C43C00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_age);
}

- (NSArray)gender
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_gender);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  type metadata accessor for SCMLPeopleDetectionAttribute();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_245C8EDE8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setGender:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for SCMLPeopleDetectionAttribute();
    v3 = sub_245C8EDF4();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_gender);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSArray)ethnicity
{
  return (NSArray *)sub_245C43B34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_ethnicity);
}

- (void)setEthnicity:(id)a3
{
  sub_245C43C00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_ethnicity);
}

- (BOOL)hasImplicitCategoryRequiringPersonalization
{
  BOOL *v2;

  v2 = (BOOL *)self
     + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasImplicitCategoryRequiringPersonalization;
  swift_beginAccess();
  return *v2;
}

- (void)setHasImplicitCategoryRequiringPersonalization:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self
     + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasImplicitCategoryRequiringPersonalization;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_245C44930(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_245C445FC);
}

- (_TtC26SensitiveContentAnalysisML20SCMLPersonAttributes)init
{
  _TtC26SensitiveContentAnalysisML20SCMLPersonAttributes *result;

  result = (_TtC26SensitiveContentAnalysisML20SCMLPersonAttributes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
