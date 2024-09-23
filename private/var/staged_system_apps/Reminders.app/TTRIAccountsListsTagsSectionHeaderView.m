@implementation TTRIAccountsListsTagsSectionHeaderView

- (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView *)sub_1002A07D0(v3, v4);
}

- (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView)initWithCoder:(id)a3
{
  id v4;
  _TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView_menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView____lazy_storage___menuButton) = 0;
  v4 = a3;

  result = (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIAccountsListsTagsSectionHeaderView.swift", 54, 2, 92, 0);
  __break(1u);
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView_menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView____lazy_storage___menuButton));
}

@end
