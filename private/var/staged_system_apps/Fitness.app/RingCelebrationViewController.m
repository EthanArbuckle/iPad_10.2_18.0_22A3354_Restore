@implementation RingCelebrationViewController

- (void)dealloc
{
  _TtC10FitnessApp29RingCelebrationViewController *v2;

  v2 = self;
  sub_1005A037C();
}

- (void).cxx_destruct
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_observers), a2, v2, v3, v4, v5, v6, v7);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_player));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_playerLayer));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_url, &qword_10081E640);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_timeObserverToken, (uint64_t *)&unk_100828420);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_bottomLabelConstraint));
}

- (void)viewDidLoad
{
  _TtC10FitnessApp29RingCelebrationViewController *v2;

  v2 = self;
  sub_1005A05D4();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RingCelebrationViewController(0);
  v2 = (char *)v6.receiver;
  -[RingCelebrationViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_playerLayer];
  if (v3)
  {
    v4 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_containerView];
    v5 = v3;
    objc_msgSend(v4, "bounds", v6.receiver, v6.super_class);
    objc_msgSend(v5, "setFrame:");

    v2 = v5;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp29RingCelebrationViewController *v4;

  v4 = self;
  sub_1005A15FC(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RingCelebrationViewController(0);
  v4 = v5.receiver;
  -[RingCelebrationViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  objc_msgSend(v4, "teardownPlayer", v5.receiver, v5.super_class);

}

- (void)textSizeChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  _TtC10FitnessApp29RingCelebrationViewController *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp29RingCelebrationViewController_bottomLabelConstraint);
  v10 = (void *)objc_opt_self(UIFont);
  v11 = self;
  v12 = v9;
  v13 = objc_msgSend(v10, "preferredFontForTextStyle:", UIFontTextStyleFootnote);
  objc_msgSend(v13, "_scaledValueForValue:", -40.0);
  v15 = v14;

  objc_msgSend(v12, "setConstant:", v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)appWillResignActive:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  -[RingCelebrationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)beginFadeOut
{
  _TtC10FitnessApp29RingCelebrationViewController *v2;

  v2 = self;
  sub_1005A1E6C();

}

- (_TtC10FitnessApp29RingCelebrationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  CHWorkoutDetailHeartRateTableViewCell *v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10FitnessApp29RingCelebrationViewController *)sub_1005A22A0(v5, v7, a4);
}

- (_TtC10FitnessApp29RingCelebrationViewController)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp29RingCelebrationViewController *)sub_1005A2628(a3);
}

- (void)configurePlayer
{
  _TtC10FitnessApp29RingCelebrationViewController *v2;

  v2 = self;
  sub_1005A29FC();

}

- (void)teardownPlayer
{
  _TtC10FitnessApp29RingCelebrationViewController *v2;

  v2 = self;
  sub_1005A3208();

}

@end
