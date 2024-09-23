@implementation TTRIGroupMembershipCell

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (NSString)accessibilityLabel
{
  _TtC9Reminders23TTRIGroupMembershipCell *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = self;
  v3 = -[TTRIGroupMembershipCell textLabel](v2, "textLabel");
  if (v3 && (v4 = v3, v5 = objc_msgSend(v3, "text"), v4, v5))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (NSString)accessibilityHint
{
  _TtC9Reminders23TTRIGroupMembershipCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1002EBC88();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)accessibilityActivate
{
  _TtC9Reminders23TTRIGroupMembershipCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1002EBFD4();

  return v3 & 1;
}

- (_TtC9Reminders23TTRIGroupMembershipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSString v9;
  char *v10;
  _TtC9Reminders23TTRIGroupMembershipCell *v11;
  objc_super v13;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = (char *)self + OBJC_IVAR____TtC9Reminders23TTRIGroupMembershipCell_ttriAccessibilityDelegate;
    *((_QWORD *)v8 + 1) = 0;
    swift_unknownObjectWeakInit(v8, 0);
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR____TtC9Reminders23TTRIGroupMembershipCell_ttriAccessibilityDelegate;
    *((_QWORD *)v10 + 1) = 0;
    swift_unknownObjectWeakInit(v10, 0);
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TTRIGroupMembershipCell();
  v11 = -[TTRIGroupMembershipCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v9);

  return v11;
}

- (_TtC9Reminders23TTRIGroupMembershipCell)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC9Reminders23TTRIGroupMembershipCell_ttriAccessibilityDelegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIGroupMembershipCell();
  return -[TTRIGroupMembershipCell initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders23TTRIGroupMembershipCell_ttriAccessibilityDelegate);
}

@end
