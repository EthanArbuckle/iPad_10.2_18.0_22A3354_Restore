@implementation TTRIListDetailBadgeCellTableCell

- (_TtC9Reminders32TTRIListDetailBadgeCellTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders32TTRIListDetailBadgeCellTableCell *)sub_100130524(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders32TTRIListDetailBadgeCellTableCell)initWithCoder:(id)a3
{
  _TtC9Reminders32TTRIListDetailBadgeCellTableCell *result;

  result = (_TtC9Reminders32TTRIListDetailBadgeCellTableCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIListDetailBadgeCellContent.swift", 46, 2, 120, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TTRIListDetailBadgeCellTableCell layoutSubviews](&v3, "layoutSubviews");
  objc_msgSend(v2, "setSeparatorStyle:", 0, v3.receiver, v3.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRIListDetailBadgeCellTableCell_badgeView));
}

@end
