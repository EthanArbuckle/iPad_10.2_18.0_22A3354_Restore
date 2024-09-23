@implementation FMItemPhoneNumberViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy31FMItemPhoneNumberViewController *v4;

  v4 = self;
  sub_1002FCC54(a3);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy31FMItemPhoneNumberViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1002FCE78(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)nextActionWithSender:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC6FindMy31FMItemPhoneNumberViewController *v11;

  v4 = a3;
  v11 = self;
  v5 = sub_10037250C();
  if (!v5)
    goto LABEL_5;
  v6 = v5;
  v7 = objc_msgSend(v5, "text");

  if (!v7)
    goto LABEL_5;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  LOBYTE(v8) = sub_1000F2D98(v8, v10);
  swift_bridgeObjectRelease(v10);
  if ((v8 & 1) != 0)
    sub_1002FD264();
  else
LABEL_5:
    sub_100372614();

}

- (void)handleUseEmailAction
{
  _TtC6FindMy31FMItemPhoneNumberViewController *v2;
  _TtC6FindMy31FMItemPhoneNumberViewController *v3;
  uint64_t v4;
  _TtC6FindMy31FMItemPhoneNumberViewController *v5;
  _TtC6FindMy31FMItemPhoneNumberViewController *v6;

  v2 = self;
  v3 = (_TtC6FindMy31FMItemPhoneNumberViewController *)-[FMItemPhoneNumberViewController parentViewController](v2, "parentViewController");
  if (v3)
  {
    v6 = v3;
    v4 = objc_opt_self(UIPageViewController);
    if (swift_dynamicCastObjCClass(v6, v4))
      sub_10010D178(1, 0, 0);

    v5 = v6;
  }
  else
  {
    v5 = v2;
  }

}

- (_TtC6FindMy31FMItemPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy31FMItemPhoneNumberViewController *)sub_1002FD668(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy31FMItemPhoneNumberViewController *)sub_1002FD668(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy31FMItemPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  id v15;
  NSString v16;
  NSString v17;
  _TtC6FindMy31FMItemPhoneNumberViewController *v18;
  objc_super v20;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }
  v13 = &self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy31FMItemPhoneNumberViewController_item];
  v14 = type metadata accessor for FMIPItem(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = a5;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  if (a4)
  {
    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    v17 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for FMItemPhoneNumberViewController(0);
  v18 = -[FMPhoneNumberViewController initWithTitle:detailText:icon:contentLayout:](&v20, "initWithTitle:detailText:icon:contentLayout:", v16, v17, v15, a6);

  return v18;
}

- (void).cxx_destruct
{
  sub_100066780((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMItemPhoneNumberViewController_item);
}

@end
