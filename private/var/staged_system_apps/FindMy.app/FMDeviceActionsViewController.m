@implementation FMDeviceActionsViewController

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMDeviceActionsViewController(0);
  v2 = v4.receiver;
  v3 = -[FMDeviceActionsViewController viewDidLoad](&v4, "viewDidLoad");
  (*(void (**)(id))((swift_isaMask & *v2) + 0x160))(v3);
  sub_100326E94();
  objc_msgSend(*(id *)((char *)v2 + OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_performButton), "addTarget:action:forControlEvents:", v2, "performAction", 64, v4.receiver, v4.super_class);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy29FMDeviceActionsViewController *v4;

  v4 = self;
  sub_100328C40(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy29FMDeviceActionsViewController *v4;

  v4 = self;
  sub_1003291D4(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy29FMDeviceActionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100327630();

}

- (void)performAction
{
  _TtC6FindMy29FMDeviceActionsViewController *v2;

  v2 = self;
  sub_10032788C();

}

- (void)cancelActionWithSender:(id)a3
{
  void *v5;
  id v6;
  _TtC6FindMy29FMDeviceActionsViewController *v7;
  _QWORD v8[6];

  v8[4] = State.rawValue.getter;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100037DF8;
  v8[3] = &unk_10055ADC0;
  v5 = _Block_copy(v8);
  v6 = a3;
  v7 = self;
  -[FMDeviceActionsViewController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, v5);
  _Block_release(v5);

}

- (_TtC6FindMy29FMDeviceActionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy29FMDeviceActionsViewController *)sub_100329C24(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy29FMDeviceActionsViewController *)sub_100329C24(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy29FMDeviceActionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  return (_TtC6FindMy29FMDeviceActionsViewController *)sub_100329F54(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  void *v3;

  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_mediator]);
  sub_1000051EC((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_device], &qword_1005D6710);
  sub_1000051EC((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_primaryItemPart], (uint64_t *)&unk_1005D3AA0);
  v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_style];

  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_deviceSubscription]);
}

@end
