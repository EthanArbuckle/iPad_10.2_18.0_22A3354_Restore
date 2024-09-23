@implementation TTRITreeViewContextMenuItemIdentifier

- (BOOL)isEqual:(id)a3
{
  _TtC9Reminders37TTRITreeViewContextMenuItemIdentifier *v5;
  uint64_t v6;
  _TtC9Reminders37TTRITreeViewContextMenuItemIdentifier *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1004681DC((uint64_t)v10, v6);

  sub_10002CAA0((uint64_t)v10);
  return v8 & 1;
}

- (int64_t)hash
{
  _TtC9Reminders37TTRITreeViewContextMenuItemIdentifier *v2;
  int64_t v3;

  v2 = self;
  v3 = AnyHashable.hashValue.getter();

  return v3;
}

- (_TtC9Reminders37TTRITreeViewContextMenuItemIdentifier)init
{
  _TtC9Reminders37TTRITreeViewContextMenuItemIdentifier *result;

  result = (_TtC9Reminders37TTRITreeViewContextMenuItemIdentifier *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRITreeViewContextMenuItemIdentifier", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100041DDC((uint64_t)self + OBJC_IVAR____TtC9Reminders37TTRITreeViewContextMenuItemIdentifier_itemID);
  sub_10002CAA0((uint64_t)self + OBJC_IVAR____TtC9Reminders37TTRITreeViewContextMenuItemIdentifier_userInfo);
}

@end
