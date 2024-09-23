@implementation TTRIRemindersListSharingStatusCellTableViewCell

- (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell *)sub_100406B04(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell)initWithCoder:(id)a3
{
  _TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell *result;

  result = (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRemindersListSharingStatusCell.swift", 50, 2, 82, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityDragSourceDescriptors
{
  return (NSArray *)0;
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell_stackedAvatarsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell_statusLabel));
}

@end
