@implementation TTRIAccountsListsViewListCell

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC9Reminders29TTRIAccountsListsViewListCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10002B800(x, y, width, height);

}

- (_TtC9Reminders29TTRIAccountsListsViewListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders29TTRIAccountsListsViewListCell *)sub_10001DC9C(a3, (uint64_t)a4, v6);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TTRIAccountsListsViewListCell(0);
  -[TTRIAccountsListsViewListCell frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_TtC9Reminders29TTRIAccountsListsViewListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004F71AC();
}

- (void)toggleSmartListVisibility:(id)a3
{
  _TtC9Reminders29TTRIAccountsListsViewListCell *v5;
  _TtC9Reminders29TTRIAccountsListsViewListCell *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_1004F4C74();

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (BOOL)accessibilityActivate
{
  _TtC9Reminders29TTRIAccountsListsViewListCell *v2;
  void *v3;
  BOOL v4;
  objc_super v6;

  v2 = self;
  if (-[TTRIAccountsListsViewListCell isEditing](v2, "isEditing")
    && (v3 = *(void **)&v2->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_checkmarkButton],
        (objc_msgSend(v3, "isHidden") & 1) == 0))
  {
    objc_msgSend(v3, "sendActionsForControlEvents:", 64);

    return 1;
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for TTRIAccountsListsViewListCell(0);
    v4 = -[TTRIAccountsListsBaseCell accessibilityActivate](&v6, "accessibilityActivate");

  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  _TtC9Reminders29TTRIAccountsListsViewListCell *v2;
  UIAccessibilityTraits v3;

  v2 = self;
  v3 = sub_1004F5058();

  return v3;
}

- (NSString)accessibilityHint
{
  _TtC9Reminders29TTRIAccountsListsViewListCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1004F5168();
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

- (NSAttributedString)accessibilityAttributedValue
{
  _TtC9Reminders29TTRIAccountsListsViewListCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1004F5348();

  return (NSAttributedString *)v3;
}

- (NSArray)accessibilityCustomActions
{
  return (NSArray *)sub_1004F5DC8(self, (uint64_t)a2, (uint64_t (*)(void))sub_1004F57DC, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
}

- (void)setAccessibilityCustomActions:(id)a3
{
  sub_1004F63F0(self, (uint64_t)a2, (objc_class *)a3, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr, (SEL *)&selRef_setAccessibilityCustomActions_);
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)sub_1004F5DC8(self, (uint64_t)a2, sub_1004F5E4C, &qword_100664C58, UIAccessibilityLocationDescriptor_ptr);
}

- (void)setAccessibilityDropPointDescriptors:(id)a3
{
  sub_1004F63F0(self, (uint64_t)a2, (objc_class *)a3, &qword_100664C58, UIAccessibilityLocationDescriptor_ptr, (SEL *)&selRef_setAccessibilityDropPointDescriptors_);
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_listsViewListCellDelegate);

  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_listItem, (uint64_t *)&unk_100640EF0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.ttriAccessibilityCount[OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_ttriAccessibilityEditingCustomActionName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.ttriAccessibilityCount[OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_ttriAccessibilityShareListActionName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.ttriAccessibilityCount[OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_ttriAccessibilityShareListActionSFSymbolName]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.ttriAccessibilityCount[OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_dynamicGlyph]);
}

@end
