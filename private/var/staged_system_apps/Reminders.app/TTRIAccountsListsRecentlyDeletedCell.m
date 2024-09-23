@implementation TTRIAccountsListsRecentlyDeletedCell

- (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *)sub_100252834(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell)initWithCoder:(id)a3
{
  _TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *result;

  result = (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIAccountsListsRecentlyDeletedCell.swift", 52, 2, 37, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityCustomActions
{
  _TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *v2;
  uint64_t v3;
  unint64_t v4;
  NSArray v5;

  v2 = self;
  v4 = sub_100252ABC((uint64_t)v2, v3);

  if (v4)
  {
    sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (void)setAccessibilityCustomActions:(id)isa
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *v8;
  double v9;
  _TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v6 = sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v6);
    v8 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v9 = swift_bridgeObjectRelease(v7).n128_u64[0];
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  -[TTRIAccountsListsRecentlyDeletedCell setAccessibilityCustomActions:](&v11, "setAccessibilityCustomActions:", isa, v9);

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

}

@end
