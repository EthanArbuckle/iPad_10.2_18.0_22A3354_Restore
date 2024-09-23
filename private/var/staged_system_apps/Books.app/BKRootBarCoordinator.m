@implementation BKRootBarCoordinator

- (void)willMoveTo:(id)a3
{
  id v4;
  BKRootBarCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100012724(v4);

}

- (BKRootBarCoordinator)initWithSceneController:(id)a3 presentersProvider:(id)a4 viewControllerProvider:(id)a5
{
  id v7;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  return (BKRootBarCoordinator *)sub_10002FD70(v7, (uint64_t)a4, (uint64_t)a5);
}

- (BKRootBarItem)selectedItem
{
  BKRootBarCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100017380();

  return (BKRootBarItem *)v3;
}

- (id)currentTitleForRootBarItem:(id)a3
{
  id v4;
  BKRootBarCoordinator *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a3;
  v5 = self;
  sub_10002DB98((uint64_t)v4);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (UIViewController)hostingViewController
{
  unint64_t v2;

  v2 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_activeRootBarKind);
  if ((v2 & 0x8000000000000000) != 0)
    v2 = *(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR___BKSplitViewController_contentHostingController)
                   + OBJC_IVAR___BKSplitViewContentHostingController_viewController);
  return (UIViewController *)(id)v2;
}

- (UINavigationController)selectedNavigationController
{
  BKRootBarCoordinator *v2;
  id v3;

  v2 = self;
  v3 = sub_10004C36C();

  return (UINavigationController *)v3;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___BKRootBarCoordinator_rootViewController));
}

- (BKRootBarStandardItemsProcessing)standardItemsManager
{
  return (BKRootBarStandardItemsProcessing *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_standardItemsManager));
}

+ (NSString)rootViewControllerDidDisappearNotification
{
  return (NSString *)sub_1000541DC((uint64_t)a1, (uint64_t)a2, &qword_1009CDCC8, &qword_100A1E350, (uint64_t)sub_100064C30);
}

+ (NSString)didSwitchRootBarItemNotification
{
  return (NSString *)sub_1000541DC((uint64_t)a1, (uint64_t)a2, &qword_1009CDCC0, &qword_100A1E348, (uint64_t)sub_100064C64);
}

- (BKDockableMiniPlayer)miniPlayerViewController
{
  return (BKDockableMiniPlayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___BKRootBarCoordinator_miniPlayerViewController));
}

- (void)setMiniPlayerViewController:(id)a3
{
  void *v4;
  BKRootBarCoordinator *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_miniPlayerViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_miniPlayerViewController) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_10021BEA0((uint64_t)v4);

}

- (BOOL)isMiniPlayerHidden
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_isMiniPlayerHidden);
}

- (void)setIsMiniPlayerHidden:(BOOL)a3
{
  uint64_t v3;
  BKRootBarCoordinator *v4;

  v3 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_isMiniPlayerHidden);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_isMiniPlayerHidden) = a3;
  v4 = self;
  sub_10021C000(v3);

}

- (BKRootBarCoordinator)init
{
  BKRootBarCoordinator *result;

  result = (BKRootBarCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Books.RootBarCoordinator", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_standardItemsManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_selectedItemPublisher));

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKRootBarCoordinator_sceneController);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKRootBarCoordinator_presentersProvider);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_cancellables));
}

- (UIViewController)selectedTopViewController
{
  BKRootBarCoordinator *v2;
  id v3;

  v2 = self;
  v3 = sub_10021C644();

  return (UIViewController *)v3;
}

- (void)selectWithIdentifier:(id)a3 isUserAction:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  BKRootBarCoordinator *v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  sub_10021C7B8(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (BOOL)hasStandardItemWithIdentifier:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BKRootBarCoordinator *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_10021CBAC(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (id)navigationControllerForIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BKRootBarCoordinator *v8;
  id v9;
  Swift::String v10;
  void *v11;
  void *v12;
  BKRootBarCoordinator *v13;
  id v14;
  Swift::String v15;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_activeRootBarKind);
  if ((v7 & 0x8000000000000000) != 0)
  {
    v12 = *(void **)(v7 + OBJC_IVAR___BKSplitViewController_contentHostingController);
    v13 = self;
    v14 = (id)(v7 & 0x7FFFFFFFFFFFFFFFLL);
    v9 = v12;
    v15._countAndFlagsBits = v4;
    v15._object = v6;
    v11 = (void *)SplitViewContentHostingController.navigationController(forIdentifier:)(v15);

    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
    v9 = (id)v7;
    v10._countAndFlagsBits = v4;
    v10._object = v6;
    v11 = (void *)TabBarController.navigationController(forIdentifier:)(v10);

    swift_bridgeObjectRelease(v6);
  }

  return v11;
}

- (id)topViewControllerForIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  BKRootBarCoordinator *v7;
  id v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_10021CEBC(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)windowSceneTraitCollectionDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  BKRootBarCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10021D154(v6, v7);

}

- (void)dismissCardStackForCurrentlySelected
{
  BKRootBarCoordinator *v2;

  v2 = self;
  sub_10021D350();

}

- (void)dockMiniPlayer:(id)a3
{
  id v4;
  BKRootBarCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10021D630(v4);

}

- (void)undockMiniPlayer
{
  BKRootBarCoordinator *v2;

  v2 = self;
  sub_10021D748();

}

- (void)presentFullPlayer:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  id v8;
  BKRootBarCoordinator *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1008F49D8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1002219B4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10021D820(v8, (uint64_t)v6, v7);
  sub_10002AD00((uint64_t)v6, v7);

}

- (void)presentFullPlayerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  BKRootBarCoordinator *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1008F4988, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_10004DE24;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10021DAF0((void (*)(void))v7, v6);
  sub_10002AD00((uint64_t)v7, v6);

}

- (void)registerFullPlayer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_fullPlayerViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarCoordinator_fullPlayerViewController) = (Class)a3;
  v3 = a3;

}

- (id)presentingViewControllerFor:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___BKRootBarCoordinator_rootViewController));
}

- (id)presentedViewControllerFor:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___BKRootBarCoordinator_fullPlayerViewController));
}

- (id)coordinatedViewControllersFor:(id)a3
{
  sub_10004CFD4(&qword_1009D3398);
  return Array._bridgeToObjectiveC()().super.isa;
}

- (id)donationTargets
{
  type metadata accessor for PresentationDonationTarget();
  return Array._bridgeToObjectiveC()().super.isa;
}

- (id)donationItemFor:(id)a3 intent:(int64_t)a4
{
  return 0;
}

@end
