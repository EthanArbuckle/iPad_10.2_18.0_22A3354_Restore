@implementation BKTabBarController

- (void)_setSelectedViewController:(id)a3
{
  id v5;
  BKTabBarController *v6;
  BKTabBarController *v7;
  UIViewController_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  TabBarController._setSelectedViewController(_:)(v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  BKTabBarController *v4;
  id v5;
  void *v6;
  objc_super v7;
  _QWORD v8[3];
  char v9;

  v3 = a3;
  v8[1] = 0;
  v8[2] = 0;
  v8[0] = a3;
  v9 = 0;
  v4 = self;
  PassthroughSubject.send(_:)(v8);
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TabBarController(0);
  -[MiniPlayerHostingTabBarController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = -[BKTabBarController view](v4, "view");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setAccessibilityElementsHidden:", 0);

  }
  else
  {
    __break(1u);
  }
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  id v4;
  BKTabBarController *v5;
  id v6;
  void *v7;
  id v8;
  int v10;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "selectedViewController");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "supportedInterfaceOrientations");

    return (unint64_t)v8;
  }
  else
  {
    v10 = isPad();

    if (v10)
      return 30;
    else
      return 2;
  }
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4;
  BKTabBarController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[BKTabBarController selectedViewController](v5, "selectedViewController");

  if (!v6)
    return 0;

  return v6 == v4;
}

- (BOOL)prefersStatusBarHidden
{
  BKTabBarController *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v8;

  v2 = self;
  v3 = -[BKTabBarController bc_windowForViewController](v2, "bc_windowForViewController");
  v4 = objc_msgSend(v3, "windowScene");

  if (v4)
  {
    v7 = objc_msgSend(v4, "interfaceOrientation");

  }
  else
  {
    v7 = 0;
  }
  v8 = isPad(v5, v6);

  return (v8 & 1) == 0 && sub_10004DFF4((uint64_t)v7);
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  BKTabBarController *v2;
  id v3;

  v2 = self;
  v3 = TabBarController.childForStatusBarHidden.getter();

  return (UIViewController *)v3;
}

- (BKRootBarCoordinating)bk_rootBarCoordinator
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR___BKTabBarController__rootBarCoordinator;
  swift_beginAccess((char *)self + OBJC_IVAR___BKTabBarController__rootBarCoordinator, v4, 0, 0);
  return (BKRootBarCoordinating *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (id)flowControllers
{
  uint64_t v3;
  uint64_t v4;
  BKTabBarController *v5;
  Class isa;

  v3 = sub_10004CFD4(&qword_1009D4B80);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_10070CCA0;
  *(_QWORD *)(v4 + 56) = type metadata accessor for TabBarController(0);
  *(_QWORD *)(v4 + 32) = self;
  v5 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  BKTabBarController *v2;
  id v3;

  v2 = self;
  v3 = TabBarController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_10000FF24(self, (uint64_t)a2, a3, 1, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidLoad
{
  BKTabBarController *v2;

  v2 = self;
  TabBarController.viewDidLoad()();

}

- (BKTabBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004F7688();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BKTabBarController *v4;

  v4 = self;
  TabBarController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_10000FF24(self, (uint64_t)a2, a3, 3, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  BKTabBarController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  TabBarController.viewWillTransition(to:with:)((uint64_t (*)(uint64_t, uint64_t))a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  BKTabBarController *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  _s5Books33MiniPlayerHostingTabBarControllerC11viewDidMove2to23shouldAppearOrDisappearySo8UIWindowCSg_SbtF_0();

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void)didReceiveMemoryWarning
{
  BKTabBarController *v2;

  v2 = self;
  TabBarController.didReceiveMemoryWarning()();

}

- (int64_t)preferredStatusBarStyle
{
  BKTabBarController *v2;
  id v3;

  v2 = self;
  v3 = TabBarController.preferredStatusBarStyle.getter();

  return (int64_t)v3;
}

- (BKTabBarController)initWithTabs:(id)a3
{
  BKTabBarController *result;

  result = (BKTabBarController *)_swift_stdlib_reportUnimplementedInitializer("Books.TabBarController", 22, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (BKTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BKTabBarController *result;

  v4 = a4;
  result = (BKTabBarController *)_swift_stdlib_reportUnimplementedInitializer("Books.TabBarController", 22, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKTabBarController_viewControllerProvider);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR___BKTabBarController_rootBarEventSubject));
  v3 = (char *)self + OBJC_IVAR___BKTabBarController__cachedSelectedItem;
  v4 = sub_10004CFD4(&qword_1009D33C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKTabBarController__rootBarCoordinator);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR___BKTabBarController_items));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___BKTabBarController_isCreatingContentForNavigationController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR___BKTabBarController_cancellables));
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  BKTabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1004F7838(v7);

}

- (NSString)bc_stringForReturnToRootBarItem
{
  BKTabBarController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  TabBarController.bc_stringForReturnToRootBarItem.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BSUIRootBarWrapperViewController)activeRootBarWrapperViewController
{
  BKTabBarController *v2;
  BKTabBarController *v3;
  BKTabBarController *v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = (BKTabBarController *)-[BKTabBarController selectedViewController](v2, "selectedViewController");
  if (!v3
    || (v4 = v3,
        v5 = objc_opt_self(BSUIRootBarWrapperViewController),
        v6 = (void *)swift_dynamicCastObjCClass(v4, v5),
        v2,
        v2 = v4,
        !v6))
  {

    v6 = 0;
  }
  return (BSUIRootBarWrapperViewController *)v6;
}

+ (NSString)rootBarReadyNotification
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  if (qword_1009CE748 != -1)
    swift_once(&qword_1009CE748, sub_100064CCC);
  static String._unconditionallyBridgeFromObjectiveC(_:)(static NSNotificationName.rootBarReady);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

@end
