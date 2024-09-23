@implementation TTRIAccountsListsViewPinnedListsCell

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TTRIAccountsListsViewPinnedListsCell layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  sub_100015744();

}

- (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell *)sub_10000A460(a3, (uint64_t)a4, v6);
}

+ (Class)layerClass
{
  uint64_t v2;

  v2 = type metadata accessor for CellLayer();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

+ (Class)containerViewClass
{
  uint64_t v2;

  v2 = type metadata accessor for TTRIPinnedListsView(0);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  id v6;
  _TtC9Reminders36TTRIAccountsListsViewPinnedListsCell *result;

  v5 = &self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIAccountsListsViewPinnedListsCell_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(_QWORD *)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIAccountsListsViewPinnedListsCell_dynamicDateGlyphCache] = 0;
  v6 = a3;

  result = (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIAccountsListsViewPinnedListsCell.swift", 52, 2, 91, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType(self, a2);
  -[TTRIAccountsListsViewPinnedListsCell prepareForReuse](&v2, "prepareForReuse");
}

- (UIColor)separatorColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
}

- (NSArray)preferredFocusEnvironments
{
  _TtC9Reminders36TTRIAccountsListsViewPinnedListsCell *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_100258E20();

  sub_10002A750((uint64_t *)&unk_100652070);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIAccountsListsViewPinnedListsCell_delegate]);
  swift_release();
}

@end
