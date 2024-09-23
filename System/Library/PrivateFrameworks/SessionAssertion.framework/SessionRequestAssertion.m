@implementation SessionRequestAssertion

- (NSString)description
{
  _TtC16SessionAssertion23SessionRequestAssertion *v2;
  void *v3;

  v2 = self;
  sub_1B40B3F00();

  v3 = (void *)sub_1B40BC9D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)explanation
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B40BC9D8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setExplanation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1B40BC9E4();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)sessionIdentifiers
{
  _TtC16SessionAssertion23SessionRequestAssertion *v2;
  void *v3;

  v2 = self;
  sub_1B40B46CC();

  v3 = (void *)sub_1B40BCAA4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC16SessionAssertion23SessionRequestAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidateOnSessionRequest:(BOOL)a5 invalidationHandler:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = _Block_copy(a6);
  v9 = sub_1B40BC9E4();
  v11 = v10;
  if (v8)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v8;
    v8 = sub_1B40B56C0;
  }
  else
  {
    v12 = 0;
  }
  return (_TtC16SessionAssertion23SessionRequestAssertion *)SessionRequestAssertion.init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(v9, v11, a4, a5, (uint64_t)v8, v12);
}

- (_TtC16SessionAssertion23SessionRequestAssertion)initWithExplanation:(id)a3 target:(id)a4 options:(id)a5 invalidationHandler:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = _Block_copy(a6);
  v9 = sub_1B40BC9E4();
  v11 = v10;
  if (v8)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v8;
    v8 = sub_1B40B56C0;
  }
  else
  {
    v12 = 0;
  }
  return (_TtC16SessionAssertion23SessionRequestAssertion *)SessionRequestAssertion.init(explanation:target:options:invalidationHandler:)(v9, v11, a4, (unsigned __int8 *)a5, (uint64_t)v8, v12);
}

- (void)invalidate
{
  _TtC16SessionAssertion23SessionRequestAssertion *v2;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion))
  {
    v2 = self;
    swift_retain();
    sub_1B40B6554();

    swift_release();
  }
}

- (unint64_t)snaInvalidationReason
{
  _TtC16SessionAssertion23SessionRequestAssertion *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B40B4EC4();

  return v3;
}

- (unint64_t)snaState
{
  _TtC16SessionAssertion23SessionRequestAssertion *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B40B4FBC();

  return v3;
}

- (SNAAssertionTarget)snaTarget
{
  id v3;
  _TtC16SessionAssertion23SessionRequestAssertion *v4;
  void *v5;
  id v6;

  swift_beginAccess();
  v3 = objc_allocWithZone((Class)SNAAssertionTarget);
  v4 = self;
  sub_1B40A41C0();
  v5 = (void *)sub_1B40BC9D8();
  sub_1B40A4278();
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_, v5);

  return (SNAAssertionTarget *)v6;
}

- (_TtC16SessionAssertion23SessionRequestAssertion)init
{
  _TtC16SessionAssertion23SessionRequestAssertion *result;

  result = (_TtC16SessionAssertion23SessionRequestAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B40A5F54(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_invalidationHandler));
  sub_1B40A4278();
  swift_bridgeObjectRelease();
}

@end
