@implementation TabBarController

- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC5Music16TabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000D9B80((uint64_t)v6, (uint64_t)v7);

}

- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5
{
  id v8;
  id v9;
  _TtC5Music16TabBarController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1000D9E0C((uint64_t)v8, (uint64_t)v9, a5);

}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC5Music16TabBarController *v14;

  v9 = sub_10004A07C(0, &qword_10119D458, _UITab_ptr);
  v10 = sub_1000DA838();
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v9, v10);
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1000DA0B8((uint64_t)v12, (uint64_t)v13);

  swift_bridgeObjectRelease(v11);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  sub_1000DA3E0(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_configureItem_);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5
{
  sub_1000DA3E0(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_updateItem_);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
  sub_1000DA4D8(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_willBeginDisplayingTab_);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
  sub_1000DA4D8(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_didEndDisplayingTab_);
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Music16TabBarController *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_1000D98F8();
  if (!v12)
  {

LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  v13 = v12;
  if ((objc_msgSend(v12, "respondsToSelector:", "_tabBarController:sidebar:contextMenuConfigurationForTab:") & 1) == 0)
  {

    swift_unknownObjectRelease(v13);
    goto LABEL_6;
  }
  v14 = objc_msgSend(v13, "_tabBarController:sidebar:contextMenuConfigurationForTab:", v8, v9, v10);

  swift_unknownObjectRelease(v13);
LABEL_7:

  return v14;
}

- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _TtC5Music16TabBarController *v10;
  char v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_1000E52EC((uint64_t)v8, (uint64_t)a4, a5);

  return v11 & 1;
}

- (id)drop:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC5Music16TabBarController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1000E5468((uint64_t)v6, a4);

  return v8;
}

- (_TtC5Music16TabBarController)init
{
  return (_TtC5Music16TabBarController *)sub_10072AEB8();
}

- (_TtC5Music16TabBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10072FC00();
}

- (void)viewDidLoad
{
  _TtC5Music16TabBarController *v2;

  v2 = self;
  sub_10072BEA8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Music16TabBarController *v4;

  v4 = self;
  sub_10072C460(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[PaletteTabBarController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  v4[OBJC_IVAR____TtC5Music16TabBarController_canLoadTabRootViewControllers] = 0;

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music16TabBarController *v2;

  v2 = self;
  sub_10072C5AC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music16TabBarController *v6;

  v5 = a3;
  v6 = self;
  sub_10072C87C((uint64_t)a3);

}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 1;
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC5Music16TabBarController *v9;

  v7 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = self;
  sub_10072D0AC(v8, a4);

  swift_bridgeObjectRelease();
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  id v7;
  _TtC5Music16TabBarController *v8;

  v7 = a3;
  v8 = self;
  sub_10072D408(a3, a4);

}

- (_TtC5Music16TabBarController)initWithTabs:(id)a3
{
  _TtC5Music16TabBarController *result;

  result = (_TtC5Music16TabBarController *)_swift_stdlib_reportUnimplementedInitializer("Music.TabBarController", 22, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (_TtC5Music16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music16TabBarController *result;

  v4 = a4;
  result = (_TtC5Music16TabBarController *)_swift_stdlib_reportUnimplementedInitializer("Music.TabBarController", 22, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_bottomPlayerViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Music16TabBarController_observers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Music16TabBarController__pendingTabIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Music16TabBarController__tabIdentifiers));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_playerTabsViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Music16TabBarController_bindings));
}

@end
