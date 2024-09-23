@implementation CRLWPTopicNumbers

- (_TtC8Freeform17CRLWPTopicNumbers)initWithStorage:(id)a3
{
  uint64_t v5;
  _TtC8Freeform17CRLWPTopicNumbers *v6;
  uint64_t v7;
  _TtC8Freeform17CRLWPTopicNumbers *v8;
  objc_super v10;

  v5 = OBJC_IVAR____TtC8Freeform17CRLWPTopicNumbers_topicNumberData;
  swift_unknownObjectRetain(a3);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_1008D83C0((uint64_t)_swiftEmptyArrayStorage);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Freeform17CRLWPTopicNumbers_invalidCharIndex) = 0;
  v7 = type metadata accessor for CRLWPStorage();
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Freeform17CRLWPTopicNumbers_storage) = (Class)swift_dynamicCastClassUnconditional(a3, v7, 0, 0, 0);
  swift_unknownObjectRetain(a3);

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for CRLWPTopicNumbers();
  v8 = -[CRLWPTopicNumbers init](&v10, "init");
  swift_unknownObjectRelease(a3);
  return v8;
}

- (void)invalidateFromCharIndex:(int64_t)a3
{
  _TtC8Freeform17CRLWPTopicNumbers *v4;

  v4 = self;
  CRLWPTopicNumbers.invalidate(from:)(a3);

}

- (unint64_t)listNumberForCharIndex:(int64_t)a3
{
  _TtC8Freeform17CRLWPTopicNumbers *v4;
  Swift::UInt v5;

  v4 = self;
  v5 = CRLWPTopicNumbers.listNumber(for:)(a3);

  return v5;
}

- (id)numberedListLabelForCharIndex:(int64_t)a3 includeFormatting:(BOOL)a4
{
  _TtC8Freeform17CRLWPTopicNumbers *v6;
  NSString v7;

  v6 = self;
  CRLWPTopicNumbers.numberedListLabel(for:includeFormatting:)(a3, a4);

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC8Freeform17CRLWPTopicNumbers)init
{
  _TtC8Freeform17CRLWPTopicNumbers *result;

  result = (_TtC8Freeform17CRLWPTopicNumbers *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPTopicNumbers", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform17CRLWPTopicNumbers_topicNumberData));
}

@end
