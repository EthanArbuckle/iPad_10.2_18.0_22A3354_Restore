@implementation MiniPlayerHostingTabBarController

- (void)_updateLayoutForTraitCollection:(id)a3
{
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  objc_super v9;

  v5 = OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems;
  v6 = *((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems) = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  v7 = a3;
  v8 = v9.receiver;
  -[MiniPlayerHostingTabBarController _updateLayoutForTraitCollection:](&v9, "_updateLayoutForTraitCollection:", v7);
  *((_BYTE *)&self->super.super.super.super.isa + v5) = v6;

}

- (void)viewDidLayoutSubviews
{
  id v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat Height;
  void (*v17)(_BYTE *, _QWORD);
  uint64_t v18;
  _BYTE v19[32];
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  v2 = v20.receiver;
  -[MiniPlayerHostingTabBarController viewDidLayoutSubviews](&v20, "viewDidLayoutSubviews");
  v3 = sub_1004F0F80();
  v5 = v4;
  ObjectType = swift_getObjectType();
  v7 = objc_msgSend(v2, "tabBar");
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  Height = CGRectGetHeight(v21);
  v17 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 32))(v19, ObjectType, v5);
  *(CGFloat *)(v18 + 16) = Height;
  v17(v19, 0);

  _s5Books33MiniPlayerHostingTabBarControllerC11viewDidMove2to23shouldAppearOrDisappearySo8UIWindowCSg_SbtF_0();
}

- (void)_rebuildTabBarItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  char v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v5 = OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems;
  v6 = *((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_isRebuildingTabBarItems) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  v7 = v8.receiver;
  -[MiniPlayerHostingTabBarController _rebuildTabBarItemsAnimated:](&v8, "_rebuildTabBarItemsAnimated:", v3);
  *((_BYTE *)&self->super.super.super.super.isa + v5) = v6;

}

- (NSMutableArray)mutableChildViewControllers
{
  _TtC5Books33MiniPlayerHostingTabBarController *v2;
  id v3;

  v2 = self;
  v3 = MiniPlayerHostingTabBarController.mutableChildViewControllers.getter();

  return (NSMutableArray *)v3;
}

- (id)_viewControllersInTabBar
{
  _TtC5Books33MiniPlayerHostingTabBarController *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  Class isa;

  v2 = self;
  v3 = -[MiniPlayerHostingTabBarController childViewControllers](v2, "childViewControllers");
  v4 = sub_100009E04(0, (unint64_t *)&qword_1009D8D70, UIViewController_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  v6 = sub_1004F7278(v5, (id *)&v2->super.super.super.super.isa);
  swift_bridgeObjectRelease(v5);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (_TtC5Books33MiniPlayerHostingTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  return (_TtC5Books33MiniPlayerHostingTabBarController *)MiniPlayerHostingTabBarController.init(nibName:bundle:)(v5, v7, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Books33MiniPlayerHostingTabBarController *v4;

  v4 = self;
  MiniPlayerHostingTabBarController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Books33MiniPlayerHostingTabBarController *v4;

  v4 = self;
  MiniPlayerHostingTabBarController.viewDidAppear(_:)(a3);

}

- (UITabBarAppearance)bc_preferredTabBarScrollEdgeAppearance
{
  return (UITabBarAppearance *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                       + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController__bc_preferredTabBarScrollEdgeAppearance));
}

- (void)bc_setPreferredTabBarScrollEdgeAppearance:(id)a3
{
  _TtC5Books33MiniPlayerHostingTabBarController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1004F7504(a3);

}

- (BKDockableMiniPlayer)miniPlayerViewController
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController, v4, 0, 0);
  return (BKDockableMiniPlayer *)*v2;
}

- (void)setMiniPlayerViewController:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC5Books33MiniPlayerHostingTabBarController *v8;
  _BYTE v9[24];

  v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController, v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_1004F0744(v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5Books33MiniPlayerHostingTabBarController *v4;

  v4 = self;
  MiniPlayerHostingTabBarController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Books33MiniPlayerHostingTabBarController *v4;

  v4 = self;
  MiniPlayerHostingTabBarController.viewDidDisappear(_:)(a3);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5;
  _TtC5Books33MiniPlayerHostingTabBarController *v6;

  v5 = a3;
  v6 = self;
  _s5Books33MiniPlayerHostingTabBarControllerC11viewDidMove2to23shouldAppearOrDisappearySo8UIWindowCSg_SbtF_0();

}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 1;
}

- (NSArray)viewControllers
{
  id *v2;
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  Class isa;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  v2 = (id *)v10.receiver;
  v3 = -[MiniPlayerHostingTabBarController viewControllers](&v10, "viewControllers");
  if (v3)
  {
    v4 = v3;
    v5 = sub_100009E04(0, (unint64_t *)&qword_1009D8D70, UIViewController_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

    v7 = sub_1004F7278(v6, v2);
    swift_bridgeObjectRelease(v6);

    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    return (NSArray *)isa;
  }
  else
  {

    return (NSArray *)0;
  }
}

- (void)setViewControllers:(id)a3
{
  void *isa;
  uint64_t v5;
  uint64_t v6;
  _TtC5Books33MiniPlayerHostingTabBarController *v7;
  _TtC5Books33MiniPlayerHostingTabBarController *v8;
  objc_super v9;

  isa = a3;
  if (a3)
  {
    v5 = sub_100009E04(0, (unint64_t *)&qword_1009D8D70, UIViewController_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v5);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  -[MiniPlayerHostingTabBarController setViewControllers:](&v9, "setViewControllers:", isa);

}

- (void)setMutableChildViewControllers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MiniPlayerHostingTabBarController();
  -[MiniPlayerHostingTabBarController setMutableChildViewControllers:](&v4, "setMutableChildViewControllers:", a3);
}

- (_TtC5Books33MiniPlayerHostingTabBarController)initWithTabs:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100009E04(0, &qword_1009E87C8, UITab_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  return (_TtC5Books33MiniPlayerHostingTabBarController *)MiniPlayerHostingTabBarController.init(tabs:)(v5);
}

- (_TtC5Books33MiniPlayerHostingTabBarController)initWithCoder:(id)a3
{
  return (_TtC5Books33MiniPlayerHostingTabBarController *)MiniPlayerHostingTabBarController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController__bc_preferredTabBarScrollEdgeAppearance));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_bottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController____lazy_storage___hostContainerView));
}

- (void)dockMiniPlayer:(id)a3
{
  id v4;
  _TtC5Books33MiniPlayerHostingTabBarController *v5;

  v4 = a3;
  v5 = self;
  MiniPlayerHostingTabBarController.dockMiniPlayer(_:)(v4);

}

- (void)undockMiniPlayer
{
  void **v3;
  void *v4;
  _TtC5Books33MiniPlayerHostingTabBarController *v5;
  _BYTE v6[24];

  v3 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Books33MiniPlayerHostingTabBarController_miniPlayerViewController, v6, 1, 0);
  v4 = *v3;
  *v3 = 0;
  v5 = self;
  sub_1004F0744(v4);

}

@end
