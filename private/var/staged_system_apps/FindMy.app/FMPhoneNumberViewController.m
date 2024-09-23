@implementation FMPhoneNumberViewController

- (void)viewDidLayoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  v2 = (char *)v3.receiver;
  -[FMPhoneNumberViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_tableView], "invalidateIntrinsicContentSize", v3.receiver, v3.super_class);

}

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  v2 = v6.receiver;
  v3 = -[FMPhoneNumberViewController viewDidLoad](&v6, "viewDidLoad");
  (*(void (**)(id))((swift_isaMask & *v2) + 0x178))(v3);
  sub_100371E20();
  v4 = objc_allocWithZone((Class)UITapGestureRecognizer);
  v5 = objc_msgSend(v4, "initWithTarget:action:", v2, "handleUseEmailAction", v6.receiver, v6.super_class);
  objc_msgSend(*(id *)((char *)v2 + OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_useEmailLabel), "addGestureRecognizer:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  v4 = v5.receiver;
  -[FMPhoneNumberViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_100372CA8();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  v4 = v7.receiver;
  -[FMPhoneNumberViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  v5 = sub_10037250C();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "resignFirstResponder", v7.receiver, v7.super_class);

  }
  sub_100372F04();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  sub_100374170();
  if (v4)
  {
    v5 = v4;
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy27FMPhoneNumberViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100371AD8(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC6FindMy27FMPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy27FMPhoneNumberViewController *)sub_10037319C(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy27FMPhoneNumberViewController *)sub_10037319C(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy27FMPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  return (_TtC6FindMy27FMPhoneNumberViewController *)sub_1003734A8(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  void *v3;

  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_mediator]);
  sub_1002A64A4(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_passcode], *(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_passcode]);
  v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_style];

  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_keyboardWillShowObserver]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_keyboardWillHideObserver]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_phoneNumberWarning]);
}

@end
