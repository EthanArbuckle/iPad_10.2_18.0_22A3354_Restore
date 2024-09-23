@implementation TTRIRemindersListTipCell

- (_TtC9Reminders24TTRIRemindersListTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  _TtC9Reminders24TTRIRemindersListTipCell *v10;
  _TtC9Reminders24TTRIRemindersListTipCell *v11;
  _TtC9Reminders24TTRIRemindersListTipCell *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v9 = v8;
    a4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = -[TTRIRemindersListTipCell initWithStyle:reuseIdentifier:](&v14, "initWithStyle:reuseIdentifier:", a3, a4);

  v11 = v10;
  UITableViewCell.setSeparatorInsetType(_:)(0);
  v12 = v11;
  UITableViewCell.ttr_registerForRemindersListCellBackgroundConfiguration()();

  return v12;
}

- (_TtC9Reminders24TTRIRemindersListTipCell)initWithCoder:(id)a3
{
  _TtC9Reminders24TTRIRemindersListTipCell *result;

  result = (_TtC9Reminders24TTRIRemindersListTipCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRemindersListTipCell.swift", 40, 2, 27, 0);
  __break(1u);
  return result;
}

@end
