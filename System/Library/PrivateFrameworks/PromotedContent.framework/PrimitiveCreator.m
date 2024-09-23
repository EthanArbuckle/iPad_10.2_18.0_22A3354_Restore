@implementation PrimitiveCreator

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
  void *v11;
  _TtC15PromotedContent16PrimitiveCreator *v15;

  v11 = a5;
  if (a5)
  {
    sub_1B11FFBAC((uint64_t *)&unk_1ED391450);
    v11 = (void *)sub_1B128980C();
  }
  if (a6)
  {
    sub_1B11FFBAC(&qword_1ED391410);
    a6 = (id)sub_1B128980C();
  }
  v15 = self;
  sub_1B1207654(a3, a4, v11, (unint64_t)a6, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC15PromotedContent16PrimitiveCreator)init
{
  _TtC15PromotedContent16PrimitiveCreator *result;

  result = (_TtC15PromotedContent16PrimitiveCreator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B11E2C70((uint64_t)self + OBJC_IVAR____TtC15PromotedContent16PrimitiveCreator_eventPipeline);
}

@end
