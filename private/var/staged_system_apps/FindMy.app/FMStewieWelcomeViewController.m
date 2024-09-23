@implementation FMStewieWelcomeViewController

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMStewieWelcomeViewController(0);
  v2 = (char *)v3.receiver;
  -[FMStewieWelcomeViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10037D218();
  sub_10037D71C();
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_performButton], "addTarget:action:forControlEvents:", v2, "performAction", 64, v3.receiver, v3.super_class);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy29FMStewieWelcomeViewController *v4;

  v4 = self;
  sub_10037DDEC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy29FMStewieWelcomeViewController *v4;

  v4 = self;
  sub_10037E1BC(a3);

}

- (void)performAction
{
  _TtC6FindMy29FMStewieWelcomeViewController *v2;

  v2 = self;
  sub_10038083C();

}

- (void)cancelActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy29FMStewieWelcomeViewController *v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t updated;
  _BYTE v10[32];

  v4 = a3;
  v5 = self;
  v6 = sub_10037D1D4((uint64_t)v10);
  v8 = v7;
  updated = type metadata accessor for FMFSatelliteLocationUpdateEvent(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(updated - 8) + 48))(v8, 1, updated))
    FMFSatelliteLocationUpdateEvent.updateFlowCanceled.setter(1);
  ((void (*)(_BYTE *, _QWORD))v6)(v10, 0);
  -[FMStewieWelcomeViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (_TtC6FindMy29FMStewieWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy29FMStewieWelcomeViewController *)sub_100381244(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy29FMStewieWelcomeViewController *)sub_100381244(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy29FMStewieWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  return (_TtC6FindMy29FMStewieWelcomeViewController *)sub_1003815BC(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  void *v3;

  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_mediator]);
  sub_10005E190((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_delegate]);
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_viewModel]);
  v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_style];

  sub_1003820E4(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], *(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], *(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], *(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState + 8], *(_QWORD *)&self->viewModel[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState], self->style[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_currentViewState]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_cancellables]);
  sub_1000051EC((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMStewieWelcomeViewController_stewieAnalyticsEvent], &qword_1005E1B98);
}

@end
