@implementation FMPlusButtonTableViewCell

- (_TtC6FindMy25FMPlusButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC6FindMy25FMPlusButtonTableViewCell *)sub_10007BD1C(v4, v5);
}

- (_TtC6FindMy25FMPlusButtonTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy25FMPlusButtonTableViewCell *result;
  __int128 v9[3];

  v4 = OBJC_IVAR____TtC6FindMy25FMPlusButtonTableViewCell_addButton;
  v5 = qword_1005D1CB0;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_1005D1CB0, sub_1001DCCA0);
  v9[0] = xmmword_1005F5160;
  v9[1] = *(_OWORD *)&qword_1005F5170;
  v9[2] = xmmword_1005F5180;
  v7 = objc_allocWithZone((Class)type metadata accessor for FMAddButton());
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_1001DCD18(0, 0xE000000000000000, v9);

  result = (_TtC6FindMy25FMPlusButtonTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPlusButtonTableViewCell.swift", 38, 2, 24, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMPlusButtonTableViewCell_addButton));
}

@end
