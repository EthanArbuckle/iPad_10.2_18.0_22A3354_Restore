@implementation PresentationAssertion

- (NSString)description
{
  _TtC16SessionAssertion21PresentationAssertion *v2;
  void *v3;

  v2 = self;
  sub_1B40AD590();

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
  sub_1B40A52E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
}

- (NSString)explanation
{
  return (NSString *)sub_1B40A5214();
}

- (void)setExplanation:(id)a3
{
  sub_1B40A52E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation);
}

- (_TtC16SessionAssertion21PresentationAssertion)initWithExplanation:(id)a3 activityIdentifier:(id)a4 presentationState:(unint64_t)a5 invalidationHandler:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);

  v7 = _Block_copy(a6);
  v8 = sub_1B40BC9E4();
  v10 = v9;
  v11 = sub_1B40BC9E4();
  v13 = v12;
  if (v7)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v7;
    v15 = sub_1B40A5F08;
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  return (_TtC16SessionAssertion21PresentationAssertion *)PresentationAssertion.init(explanation:activityIdentifier:presentationState:invalidationHandler:)(v8, v10, v11, v13, a5, (uint64_t)v15, v14);
}

- (void)invalidate
{
  _TtC16SessionAssertion21PresentationAssertion *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion))
  {
    v2 = self;
    swift_retain();
    sub_1B40B6554();

    swift_release();
  }
}

- (unint64_t)snaInvalidationReason
{
  _TtC16SessionAssertion21PresentationAssertion *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B40ADF20();

  return v3;
}

- (unint64_t)snaState
{
  _TtC16SessionAssertion21PresentationAssertion *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B40AE018();

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

- (_TtC16SessionAssertion21PresentationAssertion)init
{
  _TtC16SessionAssertion21PresentationAssertion *result;

  result = (_TtC16SessionAssertion21PresentationAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B40A5F54(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_invalidationHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
