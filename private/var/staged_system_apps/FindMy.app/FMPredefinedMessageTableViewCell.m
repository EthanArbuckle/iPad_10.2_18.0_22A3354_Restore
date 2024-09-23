@implementation FMPredefinedMessageTableViewCell

- (_TtC6FindMy32FMPredefinedMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC6FindMy32FMPredefinedMessageTableViewCell *)sub_1000D04E0(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy32FMPredefinedMessageTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _TtC6FindMy32FMPredefinedMessageTableViewCell *result;

  v4 = OBJC_IVAR____TtC6FindMy32FMPredefinedMessageTableViewCell__style;
  v5 = qword_1005D1BE0;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_1005D1BE0, sub_1000D04C8);
  v7 = (void *)qword_1005D4DE0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)qword_1005D4DE0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6FindMy32FMPredefinedMessageTableViewCell_message);
  *v8 = 0;
  v8[1] = 0;
  v9 = v7;

  result = (_TtC6FindMy32FMPredefinedMessageTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPredefinedMessageTableViewCell.swift", 45, 2, 43, 0);
  __break(1u);
  return result;
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPredefinedMessageTableViewCell();
  return -[FMPlatteredTableViewCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _TtC6FindMy32FMPredefinedMessageTableViewCell *v4;

  v4 = self;
  sub_1000D081C(a3);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _TtC6FindMy32FMPredefinedMessageTableViewCell *v6;

  v6 = self;
  sub_1000D08D0(a3, a4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPredefinedMessageTableViewCell__style));
  swift_bridgeObjectRelease(*(_QWORD *)&self->_style[OBJC_IVAR____TtC6FindMy32FMPredefinedMessageTableViewCell_message]);
}

@end
