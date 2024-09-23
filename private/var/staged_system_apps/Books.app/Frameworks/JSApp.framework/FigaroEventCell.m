@implementation FigaroEventCell

- (_TtC5JSApp15FigaroEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  _TtC5JSApp15FigaroEventCell *v8;
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
  v10.super_class = (Class)type metadata accessor for FigaroEventCell();
  v8 = -[FigaroEventCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", 3, v7);

  return v8;
}

- (_TtC5JSApp15FigaroEventCell)initWithCoder:(id)a3
{
  _TtC5JSApp15FigaroEventCell *result;

  result = (_TtC5JSApp15FigaroEventCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/FigaroEventViewController.swift", 37, 2, 18, 0);
  __break(1u);
  return result;
}

@end
