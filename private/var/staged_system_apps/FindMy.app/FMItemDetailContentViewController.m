@implementation FMItemDetailContentViewController

- (_TtC6FindMy33FMItemDetailContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10031BEEC();
}

- (void)viewDidLoad
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = -[FMItemDetailContentViewController view](v2, "view");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 100.0, 100.0);

    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for FMItemDetailContentViewController(0);
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
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMItemDetailContentViewController(0);
  v4 = (char *)v5.receiver;
  -[FMItemDetailContentViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  *(_BYTE *)(*(_QWORD *)&v4[OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_dataSource]
           + OBJC_IVAR____TtC6FindMy22FMItemDetailDataSource_updatesEnabled) = 1;
  sub_1000DC224();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMItemDetailContentViewController(0);
  v4 = v5.receiver;
  -[FMItemDetailContentViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_100310060();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy33FMItemDetailContentViewController *v4;

  v4 = self;
  sub_100307934(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_100307E48();

}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC6FindMy33FMItemDetailContentViewController *v9;
  uint64_t v10;
  _BYTE v12[24];

  v5 = type metadata accessor for FMItemDetailViewModel(0);
  __chkstk_darwin(v5);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = a3;
  v9 = self;
  sub_100228580(v8);
  v10 = *(uint64_t *)((char *)&v9->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_dataSource)
      + OBJC_IVAR____TtC6FindMy22FMItemDetailDataSource_itemViewModel;
  swift_beginAccess(v10, v12, 0, 0);
  sub_10004FC74(v10, (uint64_t)v7, type metadata accessor for FMItemDetailViewModel);
  sub_10030A518((uint64_t)v7);
  sub_10004FCB8((uint64_t)v7, type metadata accessor for FMItemDetailViewModel);

}

- (void)handleLowBattery
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10030E144();

}

- (void)handleDirections
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10030EE64();

}

- (void)handleSerialNumberTap
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10030F784();

}

- (void)handleFind
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10030F970();

}

- (void)handlePlaySound
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_100316D54();

}

- (void)handleNotifyMe
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_1003174F8();

}

- (void)handleRemoveItem
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_1003177F4();

}

- (void)handleSeparation
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_100317844();

}

- (void)handleRename
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_100318BEC();

}

- (void)handleLostMode
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10031A458();

}

- (void)handleNotificationsOffAttentionTap
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10031E234(0xD000000000000031, 0x80000001004A5750);

}

- (void)handleInnaccurateLocationAttentionTap
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10031A850();

}

- (void)handleLocationServicesOffTap
{
  _TtC6FindMy33FMItemDetailContentViewController *v2;

  v2 = self;
  sub_10031E234(0xD000000000000020, 0x80000001004BEA20);

}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_delegate);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_playSoundDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_playSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_directionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_markAsLostView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_sharingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_trustedLocationsDetailViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_notificationsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_accessoryDetailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_locationServicesAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_lowBatteryAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_inaccurateAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_separationAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_soundErrorAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_sharingCircleUpdatedAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_notificationsOffAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_firstButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_bottomActionsModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_verticalStackBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_itemConnectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_findingExperiencePresenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_conditionSubscription));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_locationSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_errorConditionsAttentionModule));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_pendingSafeLocation, (uint64_t *)&unk_1005E2270);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_separationAddress]);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_separationEvent, &qword_1005E4440);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy33FMItemDetailContentViewController_geocodingCache));
}

@end
