@implementation FMItemEmailViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy25FMItemEmailViewController *v4;

  v4 = self;
  sub_100301038(a3);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy25FMItemEmailViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1003011A4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)nextActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy25FMItemEmailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100301F94();

}

- (void)handleUsePhoneNumberAction
{
  _TtC6FindMy25FMItemEmailViewController *v2;
  _TtC6FindMy25FMItemEmailViewController *v3;
  uint64_t v4;
  _TtC6FindMy25FMItemEmailViewController *v5;
  _TtC6FindMy25FMItemEmailViewController *v6;

  v2 = self;
  v3 = (_TtC6FindMy25FMItemEmailViewController *)-[FMItemEmailViewController parentViewController](v2, "parentViewController");
  if (v3)
  {
    v6 = v3;
    v4 = objc_opt_self(UIPageViewController);
    if (swift_dynamicCastObjCClass(v6, v4))
      sub_10010D700(0, 0);

    v5 = v6;
  }
  else
  {
    v5 = v2;
  }

}

- (_TtC6FindMy25FMItemEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC6FindMy25FMItemEmailViewController *)sub_1003018C4(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy25FMItemEmailViewController *)sub_1003018C4(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy25FMItemEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a5;
  return (_TtC6FindMy25FMItemEmailViewController *)sub_100301AA4(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  sub_100066780((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMItemEmailViewController_item);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy25FMItemEmailViewController_primaryEmailAddress]);
}

@end
