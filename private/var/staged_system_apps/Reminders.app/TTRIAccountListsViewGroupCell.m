@implementation TTRIAccountListsViewGroupCell

- (_TtC9Reminders29TTRIAccountListsViewGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders29TTRIAccountListsViewGroupCell *)sub_100091314(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders29TTRIAccountListsViewGroupCell)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC9Reminders29TTRIAccountListsViewGroupCell *result;

  v4 = &self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_ttriAccessibilityGroupListCount];
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  *(_QWORD *)&self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_groupObjectID] = 0;
  *(_QWORD *)&self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_collapseTapGestureRecognizer] = 0;
  v5 = a3;

  result = (_TtC9Reminders29TTRIAccountListsViewGroupCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIAccountsListsViewGroupCell.swift", 46, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  char *v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  v6 = (char *)v8.receiver;
  -[TTRIAccountsListsBaseCell setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
  v7 = *(void **)&v6[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_collapseTapGestureRecognizer];
  if (v7)
    objc_msgSend(v7, "setEnabled:", v5 ^ 1, v8.receiver, v8.super_class);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC9Reminders29TTRIAccountListsViewGroupCell *v6;

  v4 = a4;
  v6 = self;
  sub_1000917B0(a3, v4);

}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_100091A18);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_100091BF0);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_100091CCC);
}

- (NSArray)accessibilityCustomActions
{
  _TtC9Reminders29TTRIAccountListsViewGroupCell *v2;
  uint64_t v3;
  _QWORD *v4;
  NSArray v5;

  v2 = self;
  v4 = sub_100091E34((uint64_t)v2, v3);

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

- (void)treeCellViewToggleExpandState
{
  uint64_t ObjectType;
  unsigned __int8 *v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  _TtC9Reminders29TTRIAccountListsViewGroupCell *v11;
  _QWORD v12[5];
  _BYTE v13[24];

  ObjectType = swift_getObjectType(self, a2);
  v4 = &self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_treeCellViewDelegate];
  swift_beginAccess((char *)self + OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_treeCellViewDelegate, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v4 + 1);
    v9 = swift_getObjectType(Strong, v6);
    v12[3] = ObjectType;
    v12[4] = &off_1006069B0;
    v12[0] = self;
    v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 8);
    v11 = self;
    v10(v12, v9, v8);
    swift_unknownObjectRelease(v7);
    sub_100027F10(v12);

  }
}

- (void).cxx_destruct
{

}

@end
