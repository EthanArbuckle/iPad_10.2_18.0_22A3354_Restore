@implementation FMUTContentViewController

- (_TtC6FindMy25FMUTContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A21F4();
}

- (void)viewDidLoad
{
  _TtC6FindMy25FMUTContentViewController *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = -[FMUTContentViewController view](v2, "view");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 100.0, 100.0);

    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for FMUTContentViewController(0);
    -[FMBaseContentViewController viewDidLoad](&v5, "viewDidLoad");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMUTContentViewController(0);
  v4 = (char *)v6.receiver;
  -[FMUTContentViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC6FindMy25FMUTContentViewController_dataSource];
  *(_BYTE *)(v5 + OBJC_IVAR____TtC6FindMy20FMUTDetailDataSource_updatesEnabled) = 1;
  swift_retain(v5);
  sub_100234B78();

  swift_release(v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC6FindMy25FMUTContentViewController *v4;

  v3 = a3;
  v4 = self;
  sub_100293A58(v3);

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy25FMUTContentViewController *v2;

  v2 = self;
  sub_10029435C();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy25FMUTContentViewController *v4;

  v4 = self;
  sub_100294488(a3);

}

- (void)handleLearnMoreTap
{
  _TtC6FindMy25FMUTContentViewController *v2;

  v2 = self;
  sub_10029ADD4();

}

- (void)ignoreTag
{
  _TtC6FindMy25FMUTContentViewController *v2;

  v2 = self;
  sub_10029BC0C();

}

- (void)handleDisableTap
{
  _TtC6FindMy25FMUTContentViewController *v2;

  v2 = self;
  sub_10029C618();

}

- (void)handlePlaySound
{
  _TtC6FindMy25FMUTContentViewController *v2;

  v2 = self;
  sub_10029FEE0();

}

- (void)handleFindButton
{
  _TtC6FindMy25FMUTContentViewController *v2;

  v2 = self;
  sub_10029F314(0, 0);

}

- (void)dismissWelcomeController
{
  void *v2;
  void *v4;
  _TtC6FindMy25FMUTContentViewController *v5;
  id v6;
  _QWORD v7[6];

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_welcomeController);
  if (v2)
  {
    v7[4] = State.rawValue.getter;
    v7[5] = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_100037DF8;
    v7[3] = &unk_1005562B8;
    v4 = _Block_copy(v7);
    v5 = self;
    v6 = v2;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v4);
    _Block_release(v4);

  }
}

- (void)dismissInformationalControllerWithSender:(id)a3
{
  _TtC6FindMy25FMUTContentViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  sub_1002A12E4();

  sub_100029574(v6);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_welcomeController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_informationalController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_soundPendingAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_accessorySoundPendingAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_playSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_ignoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_firstRowStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_footerLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_imageFetchCancellable));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_utImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_findingExperiencePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_findingExperienceAttentionModule));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_dataSource));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy25FMUTContentViewController_utAnalytics;
  v4 = type metadata accessor for FMIPUTAlertEvent(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
