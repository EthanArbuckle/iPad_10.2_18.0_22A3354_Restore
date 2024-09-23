@implementation FMMeViewController

- (_TtC6FindMy18FMMeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100071460();
}

- (void)dealloc
{
  _TtC6FindMy18FMMeViewController *v2;

  v2 = self;
  sub_1000681D4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_locationSettings));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy18FMMeViewController_stewieViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_stewieSettings));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_locationAlerts));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_notificationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_editFindMyNotificationSettingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_editSafetyAlertsNotificationSettingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_nameLocationButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_clearIgnoredTagsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_helpFriendView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_coarseLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy18FMMeViewController_peopleSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy18FMMeViewController_deviceSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy18FMMeViewController_conditionsSubscription));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy18FMMeViewController_displayAddress]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy18FMMeViewController_cancellables));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy18FMMeViewController_delegate);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy18FMMeViewController *v4;

  v4 = self;
  sub_1000684F4(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy18FMMeViewController *v4;

  v4 = self;
  sub_10006AA6C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy18FMMeViewController *v4;

  v4 = self;
  sub_10006B270(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy18FMMeViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10006B894((uint64_t)a3);

}

- (void)update
{
  _TtC6FindMy18FMMeViewController *v2;

  v2 = self;
  sub_1000689D0();

}

- (void)handleEditFindMyNotificationsLabel
{
  _TtC6FindMy18FMMeViewController *v2;

  v2 = self;
  sub_10006E464(0xD000000000000031, 0x80000001004A5750);

}

- (void)handleEditSafetyAlertsNotificationsLabel
{
  _TtC6FindMy18FMMeViewController *v2;

  v2 = self;
  sub_10006E464(0xD00000000000004ALL, 0x80000001004A5700);

}

- (void)handleLocationLabel
{
  _TtC6FindMy18FMMeViewController *v2;

  v2 = self;
  sub_10006D4BC();

}

- (void)handleClearTags
{
  _TtC6FindMy18FMMeViewController *v2;

  v2 = self;
  sub_10006EA40();

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy18FMMeViewController *v2;

  v2 = self;
  sub_10006FBE4();

}

@end
