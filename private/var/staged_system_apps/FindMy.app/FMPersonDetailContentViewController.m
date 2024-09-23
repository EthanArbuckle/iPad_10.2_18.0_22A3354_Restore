@implementation FMPersonDetailContentViewController

- (_TtC6FindMy35FMPersonDetailContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10010AA5C();
}

- (void)viewDidLoad
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = -[FMPersonDetailContentViewController view](v2, "view");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 100.0, 100.0);

    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for FMPersonDetailContentViewController(0);
    -[FMBaseContentViewController viewDidLoad](&v5, "viewDidLoad");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy35FMPersonDetailContentViewController *v4;

  v4 = self;
  sub_1000FA2BC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy35FMPersonDetailContentViewController *v4;

  v4 = self;
  sub_1000FA4A0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy35FMPersonDetailContentViewController *v4;

  v4 = self;
  sub_1000FA5E4(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_1000FACE0();

}

- (void)handleDirections
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100102CB8();

}

- (void)handleFind
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100103064();

}

- (void)handleLocationLabel
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100104960();

}

- (void)handleContact
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100105024();

}

- (void)handleStartFollowing
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_1001052B0();

}

- (void)handleRemoveFriend
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100105D54();

}

- (void)handleStartSharing
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100105F60();

}

- (void)handleStopSharing
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100106354();

}

- (void)handleTapNotificationsPausedAttention
{
  uint64_t v3;
  id v4;
  _TtC6FindMy35FMPersonDetailContentViewController *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator);
  v4 = objc_allocWithZone((Class)type metadata accessor for FMPauseNotificationsViewController(0));
  v5 = self;
  v6 = swift_retain(v3);
  v7 = sub_10036C580(v6);
  v8 = objc_allocWithZone((Class)type metadata accessor for FMActivityIndicatingNavigationController());
  v9 = v7;
  v10 = sub_1000A750C(v9, 2);
  -[FMPersonDetailContentViewController presentViewController:animated:completion:](v5, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)handleFavorite
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100107A2C();

}

- (void)handleUnfavorite
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100107A74();

}

- (void)handleInnaccurateLocationAttentionTap
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_100107D1C();

}

- (void)handleNotificationsOffAttentionTap
{
  _TtC6FindMy35FMPersonDetailContentViewController *v2;

  v2 = self;
  sub_10010B3A4(0xD000000000000031, 0x80000001004A5750);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_dataSource));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_conditionsSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_findingExperiencePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_contactButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_directionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_notifications));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_timeRemaining));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_inaccurateAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_notificationsPausedAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_stewieLocationAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_notificationsOffAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_errorConditionsAttentionModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_unfavoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_nameThisLocationButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_startFollowingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_startSharingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_stopSharingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_removeFriendButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_firstButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_verticalStackBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_presentedModelViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_connectionManager));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_tokenSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_peerToken));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_discoveryAnimationEndTask));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_connectionManagerUpdateTask));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_tokenReevaluationTask));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_startDiscoveryTimestamp, (uint64_t *)&unk_1005D3320);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMPersonDetailContentViewController_peopleFindingAnalytics, &qword_1005D63F0);
}

@end
