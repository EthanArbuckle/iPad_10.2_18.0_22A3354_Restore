@implementation MainSplitViewController

- (_TtC6Health23MainSplitViewController)init
{
  return (_TtC6Health23MainSplitViewController *)sub_10004B6F8();
}

- (_TtC6Health23MainSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10004F9EC();
}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MainSplitViewController();
  v4 = v7.receiver;
  -[MainSplitViewController viewIsAppearing:](&v7, "viewIsAppearing:", v3);
  v5 = sub_10004B66C();
  v6 = objc_msgSend(v5, "navigationBar", v7.receiver, v7.super_class);

  objc_msgSend(v6, "setPrefersLargeTitles:", 1);
}

- (void)viewDidLoad
{
  _TtC6Health23MainSplitViewController *v2;

  v2 = self;
  sub_10004BA98();

}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  char *v6;
  char *v7;
  char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MainSplitViewController();
  v6 = (char *)a3;
  v7 = (char *)v9.receiver;
  -[MainSplitViewController setViewController:forColumn:](&v9, "setViewController:forColumn:", v6, a4);
  if (a4 == 2)
  {
    v8 = sub_10004B438();
    sub_1000A9848(v6);

    v6 = v7;
    v7 = v8;
  }

}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC6Health23MainSplitViewController *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_10004FBD4(v7);
  swift_unknownObjectRelease(a3);

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
  v9.super_class = (Class)type metadata accessor for MainSplitViewController();
  swift_unknownObjectRetain(a4);
  v7 = v9.receiver;
  -[MainSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  if (qword_1000EC140 != -1)
    swift_once(&qword_1000EC140, sub_100014684);
  v8 = sub_1000086CC();
  dispatch thunk of HealthAppAnalyticsManager.submitResizeWindowInteraction(with:)(v7);
  swift_unknownObjectRelease(a4);

  swift_release(v8);
}

- (void)showAndActivateSearchBar
{
  _TtC6Health23MainSplitViewController *v2;
  char *v3;
  id v4;
  id v5;

  v2 = self;
  sub_10004BF14();
  sub_10004D6F8();
  v3 = sub_10004B438();
  v4 = sub_1000A87CC();

  v5 = objc_msgSend(v4, "searchBar");
  objc_msgSend(v5, "becomeFirstResponder");

}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  sub_10004C1EC((char *)self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1000DF188, (uint64_t)sub_1000503B8, (uint64_t)&unk_1000DF1A0);
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  sub_10004C1EC((char *)self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1000DF138, (uint64_t)sub_100050388, (uint64_t)&unk_1000DF150);
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  id v7;
  _TtC6Health23MainSplitViewController *v8;
  uint64_t v9;
  id v10;
  _TtC6Health23MainSplitViewController *v11;
  _OWORD v12[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    v9 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v9);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v10 = a3;
    v11 = self;
  }
  sub_10004C2D4(a3, (uint64_t)v12);

  sub_1000114C0((uint64_t)v12, (uint64_t)&qword_1000EDBD0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))sub_1000138C8);
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  id v4;
  _TtC6Health23MainSplitViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10004C48C(v4);

}

- (void)splitViewControllerDidExpand:(id)a3
{
  id v4;
  _TtC6Health23MainSplitViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10004CC4C(v4);

}

- (_TtC6Health23MainSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6Health23MainSplitViewController *result;

  v4 = a4;
  result = (_TtC6Health23MainSplitViewController *)_swift_stdlib_reportUnimplementedInitializer("Health.MainSplitViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (_TtC6Health23MainSplitViewController)initWithStyle:(int64_t)a3
{
  _TtC6Health23MainSplitViewController *result;

  result = (_TtC6Health23MainSplitViewController *)_swift_stdlib_reportUnimplementedInitializer("Health.MainSplitViewController", 30, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s6Health23OpenSleepScheduleIntentVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                   + OBJC_IVAR____TtC6Health23MainSplitViewController_pinnedContentManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController_providedHealthStore));
  _s6Health23OpenSleepScheduleIntentVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                   + OBJC_IVAR____TtC6Health23MainSplitViewController_providedHealthExperienceStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___providedHealthToolbox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController_ppt_selectedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___summaryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___summaryNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sharingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sharingNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___browseViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___browseNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___mainTabBarController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sidebarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sidebarNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController_observerDelegates));
}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC6Health23MainSplitViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10004DD5C(v4);

}

@end
