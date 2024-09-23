@implementation MainTabBarController

- (unint64_t)supportedInterfaceOrientations
{
  _TtC6Health20MainTabBarController *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  __objc2_prot *v8;

  v2 = self;
  v3 = -[MainTabBarController selectedViewController](v2, "selectedViewController");
  if (!v3)
  {

    return 2;
  }
  v4 = v3;
  v8 = &OBJC_PROTOCOL___UIInterfaceOrientationMaskOverride;
  v5 = (void *)swift_dynamicCastObjCProtocolConditional(v3, 1, &v8);
  if (!v5)
  {

    return 2;
  }
  v6 = objc_msgSend(v5, "overrideMask");

  return (unint64_t)v6;
}

- (_TtC6Health20MainTabBarController)init
{
  return (_TtC6Health20MainTabBarController *)sub_10000AE80();
}

- (void)viewDidLoad
{
  _TtC6Health20MainTabBarController *v2;

  v2 = self;
  sub_10000AC94();

}

- (_TtC6Health20MainTabBarController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC6Health20MainTabBarController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6Health20MainTabBarController____lazy_storage___providedHealthToolbox) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC6Health20MainTabBarController_providedPresentation;
  v6 = enum case for Presentation.summaryFeed(_:);
  v7 = type metadata accessor for Presentation(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  v8 = a3;

  result = (_TtC6Health20MainTabBarController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B8850, "Health/MainTabBarController.swift", 33, 2, 51, 0);
  __break(1u);
  return result;
}

- (void)tabBar:(id)a3 didSelectItem:(id)a4
{
  id v6;
  id v7;
  _TtC6Health20MainTabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100035FC8((uint64_t)v7);

}

- (void)showAndActivateSearchBar
{
  _TtC6Health20MainTabBarController *v2;

  v2 = self;
  sub_100034674();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MainTabBarController(0);
  swift_unknownObjectRetain(a4);
  v7 = v9.receiver;
  -[MainTabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  if (qword_1000EC140 != -1)
    swift_once(&qword_1000EC140, sub_100014684);
  v8 = sub_1000086CC();
  dispatch thunk of HealthAppAnalyticsManager.submitResizeWindowInteraction(with:)(v7);
  swift_unknownObjectRelease(a4);

  swift_release(v8);
}

- (_TtC6Health20MainTabBarController)initWithTabs:(id)a3
{
  _TtC6Health20MainTabBarController *result;

  result = (_TtC6Health20MainTabBarController *)_swift_stdlib_reportUnimplementedInitializer("Health.MainTabBarController", 27, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (_TtC6Health20MainTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6Health20MainTabBarController *result;

  v4 = a4;
  result = (_TtC6Health20MainTabBarController *)_swift_stdlib_reportUnimplementedInitializer("Health.MainTabBarController", 27, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health20MainTabBarController_providedHealthStore));
  _s6Health23OpenSleepScheduleIntentVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                   + OBJC_IVAR____TtC6Health20MainTabBarController_providedHealthExperienceStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health20MainTabBarController____lazy_storage___providedHealthToolbox));
  v3 = (char *)self + OBJC_IVAR____TtC6Health20MainTabBarController_providedPresentation;
  v4 = type metadata accessor for Presentation(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  _s6Health23OpenSleepScheduleIntentVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                   + OBJC_IVAR____TtC6Health20MainTabBarController_pinnedContentManager));
}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC6Health20MainTabBarController *v5;

  v4 = a3;
  v5 = self;
  sub_1000353E8(v4);

}

@end
