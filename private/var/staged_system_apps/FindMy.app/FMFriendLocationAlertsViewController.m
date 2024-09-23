@implementation FMFriendLocationAlertsViewController

- (_TtC6FindMy36FMFriendLocationAlertsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100128218();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy36FMFriendLocationAlertsViewController *v4;

  v4 = self;
  sub_100124088(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy36FMFriendLocationAlertsViewController *v4;

  v4 = self;
  sub_100124230(a3);

}

- (void)handleFenceTapWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC6FindMy36FMFriendLocationAlertsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100125FE8(v4);

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_myFences));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_friendFences));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_friendsFencesRows));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_myFencesRows));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_friend, &qword_1005D3380);
  v3 = *(_QWORD *)&self->super.super.mediator[OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_viewModel];
  v4 = *(_QWORD *)&self->super.button[OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_viewModel];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.scrollContentView[OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_viewModel]);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy36FMFriendLocationAlertsViewController_peopleSubscription));
}

@end
