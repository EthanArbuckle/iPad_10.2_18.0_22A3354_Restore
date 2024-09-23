@implementation TTRIRemindersListCompletedCell

- (_TtC9Reminders30TTRIRemindersListCompletedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  _TtC9Reminders30TTRIRemindersListCompletedCell *v10;
  _TtC9Reminders30TTRIRemindersListCompletedCell *v11;
  _TtC9Reminders30TTRIRemindersListCompletedCell *v12;
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
  v10 = -[TTRIRemindersListCompletedCell initWithStyle:reuseIdentifier:](&v14, "initWithStyle:reuseIdentifier:", a3, a4);

  v11 = v10;
  -[TTRIRemindersListCompletedCell _setIgnoresMultipleSelectionDuringEditing:](v11, "_setIgnoresMultipleSelectionDuringEditing:", 1);
  v12 = v11;
  UITableViewCell.ttr_registerForRemindersListCellBackgroundConfiguration()();

  return v12;
}

- (_TtC9Reminders30TTRIRemindersListCompletedCell)initWithCoder:(id)a3
{
  _TtC9Reminders30TTRIRemindersListCompletedCell *result;

  result = (_TtC9Reminders30TTRIRemindersListCompletedCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRemindersListCompletedCell.swift", 46, 2, 39, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityElements
{
  _TtC9Reminders30TTRIRemindersListCompletedCell *v2;
  id v3;
  id v4;
  uint64_t v5;
  NSArray v6;

  v2 = self;
  v3 = -[TTRIRemindersListCompletedCell contentView](v2, "contentView");
  v4 = objc_msgSend(v3, "accessibilityElements");

  if (v4)
  {
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, (char *)&type metadata for Any + 8);

    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
  }
  else
  {

    v6.super.isa = 0;
  }
  return (NSArray *)v6.super.isa;
}

@end
