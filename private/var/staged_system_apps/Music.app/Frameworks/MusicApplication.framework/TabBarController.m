@implementation TabBarController

- (_TtC16MusicApplication16TabBarController)init
{
  return (_TtC16MusicApplication16TabBarController *)sub_2FF4E4();
}

- (_TtC16MusicApplication16TabBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_304648();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication16TabBarController *v2;

  v2 = self;
  sub_300470();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication16TabBarController *v4;

  v4 = self;
  sub_300A30(a3);

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
  v4[OBJC_IVAR____TtC16MusicApplication16TabBarController_canLoadTabRootViewControllers] = 0;

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication16TabBarController *v2;

  v2 = self;
  sub_300B7C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication16TabBarController *v6;

  v5 = a3;
  v6 = self;
  sub_300E4C((uint64_t)a3);

}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 1;
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC16MusicApplication16TabBarController *v10;

  v7 = sub_4E684(0, (unint64_t *)&qword_14C9D90, UIViewController_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = a3;
  v10 = self;
  sub_301618(v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  id v7;
  _TtC16MusicApplication16TabBarController *v8;

  v7 = a3;
  v8 = self;
  sub_301988(a3, a4);

}

- (_TtC16MusicApplication16TabBarController)initWithTabs:(id)a3
{
  id v3;
  _TtC16MusicApplication16TabBarController *result;

  v3 = a3;
  result = (_TtC16MusicApplication16TabBarController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.TabBarController", 33, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplication16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication16TabBarController *result;

  v4 = a4;
  result = (_TtC16MusicApplication16TabBarController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.TabBarController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16TabBarController_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16TabBarController_bottomPlayerViewController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MusicApplication16TabBarController_jsApplication);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication16TabBarController_pendingJSSingletonAccessBlocks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication16TabBarController__pendingTabIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication16TabBarController__tabIdentifiers));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16TabBarController_playerTabsViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication16TabBarController_bindings));
}

- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication16TabBarController *v10;
  char v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_39B574((uint64_t)v8, (uint64_t)a4, a5);

  return v11 & 1;
}

- (id)drop:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC16MusicApplication16TabBarController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_39B6F0((uint64_t)v6, a4);

  return v8;
}

- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC16MusicApplication16TabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_4D446C((uint64_t)v6, (uint64_t)v7);

}

- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication16TabBarController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_4D46F8((uint64_t)v8, (uint64_t)v9, a5);

}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC16MusicApplication16TabBarController *v15;

  v9 = sub_4E684(0, &qword_14ACC50, _UITab_ptr);
  v10 = sub_4D5130();
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v9, v10);
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_4D49A4((uint64_t)v12, (uint64_t)v13);

  swift_bridgeObjectRelease(v11);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  sub_4D4CDC(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_configureItem_);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5
{
  sub_4D4CDC(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_updateItem_);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
  sub_4D4DD4(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_willBeginDisplayingTab_);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
  sub_4D4DD4(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef__tabBarController_sidebar_didEndDisplayingTab_);
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication16TabBarController *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_4D41D0();
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

@end
