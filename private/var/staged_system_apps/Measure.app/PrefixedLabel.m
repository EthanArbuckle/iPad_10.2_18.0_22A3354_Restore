@implementation PrefixedLabel

- (NSString)text
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->prefix[OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC7Measure13PrefixedLabel *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_10006634C(v4, v6);

}

- (_TtC7Measure13PrefixedLabel)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PrefixedLabel();
  return -[PrefixedLabel initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC7Measure13PrefixedLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix);
  *v7 = 0;
  v7[1] = 0xE000000000000000;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PrefixedLabel();
  return -[PrefixedLabel initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure13PrefixedLabel)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PrefixedLabel();
  return -[PrefixedLabel initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->prefix[OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix]);
}

@end
