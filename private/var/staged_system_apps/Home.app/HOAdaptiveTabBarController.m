@implementation HOAdaptiveTabBarController

+ (BOOL)isAdaptiveTabBarEnabled
{
  char v2;
  char v3;
  _QWORD v5[3];
  ValueMetadata *v6;
  unint64_t v7;

  v6 = &type metadata for UIKitFeatures;
  v7 = sub_10005E8A8();
  v2 = isFeatureEnabled(_:)(v5);
  sub_10005A0DC(v5);
  if ((v2 & 1) != 0)
  {
    v6 = &type metadata for HomeAppFeatures;
    v7 = sub_10005E8EC();
    LOBYTE(v5[0]) = 5;
    v3 = isFeatureEnabled(_:)(v5);
    sub_10005A0DC(v5);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (HOBaseController)baseController
{
  HOAdaptiveTabBarController *v2;
  id v3;

  v2 = self;
  v3 = AdaptiveTabBarController.baseController.getter();

  return (HOBaseController *)v3;
}

- (void)setBaseController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___baseController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___baseController) = (Class)a3;
  v3 = a3;

}

- (HOAdaptiveTabBarController)init
{
  return (HOAdaptiveTabBarController *)AdaptiveTabBarController.init()();
}

- (HOAdaptiveTabBarController)initWithCoder:(id)a3
{
  sub_10005FD7C(a3);
  return 0;
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t *v4;
  uint64_t v5;
  HOAdaptiveTabBarController *v6;
  objc_super v7;
  _BYTE v8[24];

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (uint64_t *)((char *)self + OBJC_IVAR___HOAdaptiveTabBarController_controllers);
  swift_beginAccess((char *)self + OBJC_IVAR___HOAdaptiveTabBarController_controllers, v8, 1, 0);
  v5 = *v4;
  *v4 = (uint64_t)&_swiftEmptyDictionarySingleton;
  v6 = self;
  swift_bridgeObjectRelease(v5);
  v7.receiver = v6;
  v7.super_class = ObjectType;
  -[HOAdaptiveTabBarController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___baseController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___navigator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController_dashboardContext));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController_categoriesElements));

  v3 = (char *)self + OBJC_IVAR___HOAdaptiveTabBarController__viewIsVisible;
  v4 = sub_100059788(&qword_1000D1C60);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___HOAdaptiveTabBarController_controllers));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___HOAdaptiveTabBarController_initialLoadSignPost));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___HOAdaptiveTabBarController_localeAvailability));
}

- (void)viewDidLoad
{
  HOAdaptiveTabBarController *v2;

  v2 = self;
  AdaptiveTabBarController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  id v8;
  char v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = v10.receiver;
  -[HOAdaptiveTabBarController viewDidAppear:](&v10, "viewDidAppear:", v3);
  KeyPath = swift_getKeyPath(&unk_100089AB0);
  v6 = swift_getKeyPath(&unk_100089AD8);
  v9 = 1;
  v7 = v4;
  static Published.subscript.setter(&v9, v7, KeyPath, v6);
  v8 = AdaptiveTabBarController.baseController.getter();
  objc_msgSend(v8, "reloadInitialSetup");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t KeyPath;
  uint64_t v7;
  HOAdaptiveTabBarController *v8;
  objc_super v9;
  char v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  KeyPath = swift_getKeyPath(&unk_100089AB0);
  v7 = swift_getKeyPath(&unk_100089AD8);
  v10 = 0;
  v8 = self;
  static Published.subscript.setter(&v10, v8, KeyPath, v7);
  v9.receiver = v8;
  v9.super_class = ObjectType;
  -[HOAdaptiveTabBarController viewDidDisappear:](&v9, "viewDidDisappear:", v3);

}

- (id)selectCurrentTab
{
  return -[HOAdaptiveTabBarController navigationController](self, "navigationController");
}

- (void)switchToRoom:(id)a3
{
  id v4;
  HOAdaptiveTabBarController *v5;

  v4 = a3;
  v5 = self;
  AdaptiveTabBarController.switchTo(room:)((HMRoom)v4);

}

- (void)switchToAccessoryTypeGroup:(id)a3
{
  id v4;
  HOAdaptiveTabBarController *v5;

  v4 = a3;
  v5 = self;
  AdaptiveTabBarController.switchTo(accessoryTypeGroup:)(v4);

}

- (void)switchToHome:(id)a3
{
  id v4;
  HOAdaptiveTabBarController *v5;

  v4 = a3;
  v5 = self;
  AdaptiveTabBarController.switchTo(home:)((HMHome)v4);

}

- (HOAdaptiveTabBarController)initWithTabs:(id)a3
{
  HOAdaptiveTabBarController *result;

  result = (HOAdaptiveTabBarController *)_swift_stdlib_reportUnimplementedInitializer("HomeApp.AdaptiveTabBarController", 32, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (HOAdaptiveTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  HOAdaptiveTabBarController *result;

  v4 = a4;
  result = (HOAdaptiveTabBarController *)_swift_stdlib_reportUnimplementedInitializer("HomeApp.AdaptiveTabBarController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (id)currentViewController
{
  HOAdaptiveTabBarController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)AdaptiveTabBarController.currentViewController()();

  return v3;
}

- (void)setLoadingViewController:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  HOAdaptiveTabBarController *v8;
  Class isa;
  uint64_t v10;

  v5 = sub_100059788((uint64_t *)&unk_1000D1CD0);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100089750;
  *(_QWORD *)(v6 + 32) = a3;
  v10 = v6;
  specialized Array._endMutation()(v6);
  sub_10005D394(0, &qword_1000D1678, UIViewController_ptr);
  v7 = a3;
  v8 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  -[HOAdaptiveTabBarController setViewControllers:](v8, "setViewControllers:", isa);

}

- (id)selectTabWithIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  HOAdaptiveTabBarController *v13;
  void *v14;
  uint64_t v16;

  v5 = sub_100059788(&qword_1000D23E0);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = swift_allocObject(&unk_1000BAB88, 24, 7);
  swift_unknownObjectWeakInit(v9 + 16, self);
  v10 = swift_allocObject(&unk_1000BABE8, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = a3;
  v11 = sub_10005D394(0, &qword_1000D1D00, UINavigationController_ptr);
  v12 = a3;
  v13 = self;
  v14 = (void *)static NAFutureHelper.futureOnMainActor<A>(priority:descriptor:with:)(v7, 0, 0, &unk_1000D2110, v10, v11);
  swift_release(v10);
  sub_10005D3D4((uint64_t)v7, &qword_1000D23E0);

  return v14;
}

- (BOOL)wantsAccessoryControlsCard
{
  HOAdaptiveTabBarController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = AdaptiveTabBarController.wantsAccessoryControlsCard.getter();

  return v3 & 1;
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6;
  id v7;
  HOAdaptiveTabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  AdaptiveTabBarController._tabElementGroup(_:didSelect:)(v6, v7);

}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  uint64_t v6;
  id v7;
  HOAdaptiveTabBarController *v8;

  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v7 = a3;
  v8 = self;
  sub_100069A20(v6);

  swift_bridgeObjectRelease(v6);
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  HOAdaptiveTabBarController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();

}

- (void)home:(void *)a3 didAddAccessory:(void *)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();

}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  id v4;
  HOAdaptiveTabBarController *v5;

  v4 = a3;
  v5 = self;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();

}

- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5;
  HOAdaptiveTabBarController *v6;

  v5 = a3;
  v6 = self;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HOAdaptiveTabBarController *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  _BYTE v13[16];
  id v14;
  HOAdaptiveTabBarController *v15;

  v4 = a4;
  v14 = a3;
  v15 = self;
  v12[2] = a3;
  v12[3] = self;
  v6 = a3;
  v7 = self;
  v8 = debug_assert(_:_:file:line:)(sub_10006AB48, v13, sub_10006AB4C, v12, "/Library/Caches/com.apple.xbs/Sources/Home/HomeApp/AdaptiveChrome/AdaptiveTabBar/AdaptiveTabBarController.swift", 111, 2, 551);
  if (HUIsPhoneIdiom(v8))
  {
    v9 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    objc_msgSend(v9, "setOrientation:animated:", 1, 0);

  }
  v10 = -[HOAdaptiveTabBarController hu_dismissViewControllerAnimated:](v7, "hu_dismissViewControllerAnimated:", v4);

  return v10;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  HOAdaptiveTabBarController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100069CA0(v7);

  return v9 & 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  HOAdaptiveTabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100069E68(v7);

}

- (id)tabBarController:(id)a3 animationControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  HOAdaptiveTabBarController *v13;
  id v14;

  v9 = objc_allocWithZone((Class)HUPreloadedTransitionController);
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = objc_msgSend(v9, "init");

  return v14;
}

- (HUDashboardNavigator)dashboardNavigator
{
  HOAdaptiveTabBarController *v2;
  id v3;

  v2 = self;
  v3 = _s7HomeApp24AdaptiveTabBarControllerC18dashboardNavigatorSo011HUDashboardH0_pSgvg_0();

  return (HUDashboardNavigator *)v3;
}

- (unint64_t)_uip_tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5
{
  id v8;
  id v9;
  HOAdaptiveTabBarController *v10;
  unint64_t v11;
  unint64_t v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_10006A184(v9, a5);
  v12 = v11;

  swift_unknownObjectRelease(a5);
  return v12;
}

- (void)_uip_tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5
{
  id v8;
  id v9;
  HOAdaptiveTabBarController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_10006A420(v9, a5);

  swift_unknownObjectRelease(a5);
}

@end
