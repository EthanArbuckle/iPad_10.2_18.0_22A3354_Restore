@implementation TTRIListDetailNameTableCell

- (_TtC9Reminders27TTRIListDetailNameTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders27TTRIListDetailNameTableCell *)sub_1004B09CC(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders27TTRIListDetailNameTableCell)initWithCoder:(id)a3
{
  _TtC9Reminders27TTRIListDetailNameTableCell *result;

  result = (_TtC9Reminders27TTRIListDetailNameTableCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIListDetailNameCellContent.swift", 45, 2, 52, 0);
  __break(1u);
  return result;
}

- (void)textFieldEditingDidBegin
{
  void *v2;
  _TtC9Reminders27TTRIListDetailNameTableCell *v3;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders27TTRIListDetailNameTableCell_nameTextField);
  v3 = self;
  objc_msgSend(v2, "setAutocapitalizationType:", 1);
  sub_1004B102C();

}

- (void)textFieldEditingDidEnd
{
  _TtC9Reminders27TTRIListDetailNameTableCell *v2;

  v2 = self;
  sub_1004B102C();

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders27TTRIListDetailNameTableCell_textArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders27TTRIListDetailNameTableCell_nameTextField));
}

@end
