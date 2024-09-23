@implementation DisableAPIThrottlingAssertion

- (NSString)description
{
  _TtC16SessionAssertion29DisableAPIThrottlingAssertion *v2;
  void *v3;

  v2 = self;
  sub_1B40A4F34();

  v3 = (void *)sub_1B40BC9D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)activityIdentifier
{
  return (NSString *)sub_1B40A5214();
}

- (void)setActivityIdentifier:(id)a3
{
  sub_1B40A52E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
}

- (NSString)explanation
{
  return (NSString *)sub_1B40A5214();
}

- (void)setExplanation:(id)a3
{
  sub_1B40A52E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation);
}

- (_TtC16SessionAssertion29DisableAPIThrottlingAssertion)initWithExplanation:(id)a3 activityIdentifier:(id)a4 invalidationHandler:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);

  v5 = _Block_copy(a5);
  v6 = sub_1B40BC9E4();
  v8 = v7;
  v9 = sub_1B40BC9E4();
  v11 = v10;
  if (v5)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v5;
    v13 = sub_1B40A5F08;
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  return (_TtC16SessionAssertion29DisableAPIThrottlingAssertion *)DisableAPIThrottlingAssertion.init(explanation:activityIdentifier:invalidationHandler:)(v6, v8, v9, v11, (uint64_t)v13, v12);
}

- (void)invalidate
{
  _TtC16SessionAssertion29DisableAPIThrottlingAssertion *v2;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion))
  {
    v2 = self;
    swift_retain();
    sub_1B40B6554();

    swift_release();
  }
}

- (unint64_t)snaInvalidationReason
{
  _TtC16SessionAssertion29DisableAPIThrottlingAssertion *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B40A58FC();

  return v3;
}

- (unint64_t)snaState
{
  _TtC16SessionAssertion29DisableAPIThrottlingAssertion *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B40A59F4();

  return v3;
}

- (NSString)snaSessionIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B40BC9D8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC16SessionAssertion29DisableAPIThrottlingAssertion)init
{
  _TtC16SessionAssertion29DisableAPIThrottlingAssertion *result;

  result = (_TtC16SessionAssertion29DisableAPIThrottlingAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B40A5F54(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_invalidationHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
