@implementation ActivitySharingFriendDetailViewController

- (void)viewDidLoad
{
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *v2;

  v2 = self;
  sub_100336448();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivitySharingFriendDetailViewController();
  v4 = (char *)v6.receiver;
  -[ActivitySharingFriendDetailViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator];
  *(_QWORD *)&v4[OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator] = 0;

}

- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_dataProviderObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp41ActivitySharingFriendDetailViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivitySharingFriendDetailViewController.swift", 58, 2, 91, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_10033D754(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1003371B0(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_100338370(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_10033863C(v6, a4);
  v9 = v8;

  return v9;
}

- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithStyle:(int64_t)a3
{
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *result;

  result = (_TtC10FitnessApp41ActivitySharingFriendDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingFriendDetailViewController", 52, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp41ActivitySharingFriendDetailViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp41ActivitySharingFriendDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingFriendDetailViewController", 52, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_pauseRingsCoordinator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_dataProviderObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator));
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator));
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

@end
