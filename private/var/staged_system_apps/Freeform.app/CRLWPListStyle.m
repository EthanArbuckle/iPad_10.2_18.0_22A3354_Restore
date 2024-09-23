@implementation CRLWPListStyle

+ (unint64_t)defaultLabelNumberType
{
  return 0;
}

+ (NSString)defaultLabelString
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (id)boxedValueForProperty:(unint64_t)a3
{
  _TtC8Freeform14CRLWPListStyle *v4;
  id v5;

  v4 = self;
  v5 = sub_100679B1C(a3);

  return v5;
}

- (_TtC8Freeform14CRLWPListStyle)init
{
  _TtC8Freeform14CRLWPListStyle *result;

  result = (_TtC8Freeform14CRLWPListStyle *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPListStyle", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CB49C(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listFontColor));
  sub_10067AB0C(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___fontName), *(_QWORD *)&self->listType[OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___fontName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listLabelGeometries));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listLabelIndents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listLabelNumbers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listLabelTieredNumbers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listLabelStrings));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listLabelTypes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listTextIndents));
  sub_1004CB49C(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___shadow));
}

- (unint64_t)labelTypeForLevel:(int64_t)a3
{
  _TtC8Freeform14CRLWPListStyle *v4;
  unint64_t result;
  unint64_t v6;
  unint64_t v7;

  if (a3 > 8)
    return 0;
  v4 = self;
  result = sub_10067A010();
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = result;
    if (*(_QWORD *)(result + 16) > (unint64_t)a3)
    {
      v7 = *(_QWORD *)(result + 8 * a3 + 32);

      swift_bridgeObjectRelease(v6);
      return v7;
    }
  }
  __break(1u);
  return result;
}

- (unint64_t)firstLabelType
{
  _TtC8Freeform14CRLWPListStyle *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_10067A3B0();

  return v3;
}

- (float)labelIndentForLevel:(int64_t)a3
{
  float result;

  sub_10067A430(self, (uint64_t)a2, a3, (uint64_t (*)(void))sub_100679E90);
  return result;
}

- (float)textIndentForLevel:(int64_t)a3
{
  float result;

  sub_10067A430(self, (uint64_t)a2, a3, sub_10067A0A4);
  return result;
}

@end
