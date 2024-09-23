@implementation FigaroEventFieldCell

- (_TtC5JSApp20FigaroEventFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  _TtC5JSApp20FigaroEventFieldCell *v8;
  objc_super v10;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FigaroEventFieldCell();
  v8 = -[FigaroEventFieldCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", 3, v7);

  return v8;
}

- (_TtC5JSApp20FigaroEventFieldCell)initWithCoder:(id)a3
{
  _TtC5JSApp20FigaroEventFieldCell *result;

  result = (_TtC5JSApp20FigaroEventFieldCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/FigaroEventFieldViewController.swift", 42, 2, 18, 0);
  __break(1u);
  return result;
}

@end
