@implementation WFMainViewController

- (WFMainViewController)initWithDatabase:(id)a3
{
  WFMainViewController *result;

  sub_10001A2CC(a3);
  return result;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  WFMainViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10002170C();

}

- (NSUndoManager)undoManager
{
  id v2;

  sub_10001A0A4();
  return (NSUndoManager *)v2;
}

- (void)viewDidLoad
{
  WFMainViewController *v2;

  v2 = self;
  sub_100007B18();

}

- (WFMainViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001A618();
}

- (void)viewDidAppear:(BOOL)a3
{
  WFMainViewController *v4;

  v4 = self;
  sub_10001A724(a3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  WFMainViewController *v6;
  id v7;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_10001A7B0(v7, a4);

  swift_unknownObjectRelease(a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  WFMainViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10001A9E8((uint64_t)a3);

}

- (void)didBecomeActive:(id)a3
{
  WFMainViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_10001AAE8();

}

- (NSArray)keyCommands
{
  WFMainViewController *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10001F988();

  if (v3)
  {
    sub_10000EAA8(0, &qword_1000D1230, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)createFolderFromKeyboard
{
  WFMainViewController *v2;

  v2 = self;
  sub_10002028C();

}

- (void)switchToShortcutsViewController
{
  WFMainViewController *v2;

  v2 = self;
  sub_1000202C8();

}

- (void)switchToAutomationsViewController
{
  WFMainViewController *v2;

  v2 = self;
  sub_100020308();

}

- (void)switchToGalleryViewController
{
  WFMainViewController *v2;

  v2 = self;
  sub_1000203D4();

}

- (void)switchToFolderWithSender:(id)a3
{
  WFMainViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1000204A0();

}

- (void)switchToLastFolder
{
  WFMainViewController *v2;

  v2 = self;
  sub_1000209F8();

}

- (void)switchToNextViewController
{
  WFMainViewController *v2;

  v2 = self;
  sub_100020BDC();

}

- (void)switchToPreviousViewController
{
  WFMainViewController *v2;

  v2 = self;
  sub_100020F50();

}

- (void)beginSearching
{
  WFMainViewController *v2;

  v2 = self;
  sub_1000211F0();

}

- (void)createWorkflowFromKeyboard
{
  WFMainViewController *v2;

  v2 = self;
  sub_100021230();

}

- (void)toggleSidebarDisplay
{
  WFMainViewController *v2;

  v2 = self;
  sub_1000212AC((uint64_t)v2);

}

- (WFMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100021334();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___WFMainViewController_initialDestination;
  v4 = sub_100026B08();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10001222C((uint64_t)self + OBJC_IVAR___WFMainViewController_currentDestination, &qword_1000D1100);
  sub_100026D28(OBJC_IVAR___WFMainViewController_runCoordinator);
  sub_100026D28(OBJC_IVAR___WFMainViewController_autoShortcutsDataSource);
  sub_100026D28(OBJC_IVAR___WFMainViewController_mainUndoManager);
  sub_100026D28(OBJC_IVAR___WFMainViewController____lazy_storage___columnSidebar);
  sub_100026D28(OBJC_IVAR___WFMainViewController____lazy_storage___compactSidebar);
  sub_100026D28(OBJC_IVAR___WFMainViewController____lazy_storage___columnGalleryViewController);
  sub_100026D28(OBJC_IVAR___WFMainViewController____lazy_storage___compactGalleryViewController);
  sub_100026D28(OBJC_IVAR___WFMainViewController____lazy_storage___searchStateController);
  sub_100026D28(OBJC_IVAR___WFMainViewController_content);

}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  WFMainViewController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100021DE8();

  return v9 & 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  WFMainViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000220F8();

}

- (void)runCoordinator:(id)a3 showSettingsForWorkflow:(id)a4 inDatabase:(id)a5 presentingViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFMainViewController *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_100022720((uint64_t)v14, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13);

}

- (void)runCoordinator:(id)a3 accessibilityAnnounce:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  WFMainViewController *v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = a3;
  v9 = self;
  sub_1000227C0();

  swift_bridgeObjectRelease(v7);
}

- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  WFMainViewController *v10;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1000C0770, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_100026580;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_100022990(v9, 0, (uint64_t)v7, v8);
  sub_10000A798((uint64_t)v7, v8);

}

- (void)documentMenuDidDuplicateWorkflow:(id)a3
{
  id v4;
  WFMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100022AD0();

}

- (void)runCoordinator:(id)a3 didChangeRunningStateWithProgress:(double)a4 waiting:(BOOL)a5 cancelled:(BOOL)a6 forWorkflow:(id)a7
{
  id v12;
  id v13;
  WFMainViewController *v14;

  v12 = a3;
  v13 = a7;
  v14 = self;
  sub_100022B84(a4, (uint64_t)v14, a5, a6);

}

- (void)runCoordinator:(id)a3 didFinishRunningWorkflow:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  WFMainViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_100022E54();

}

- (void)runWorkflowFromState:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  WFMainViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100023324();

}

- (void)highlightAutomationWithTriggerID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  WFMainViewController *v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  sub_10002360C();

  swift_bridgeObjectRelease(v5);
}

- (void)importShortcutFileWithResult:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  WFMainViewController *v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject(&unk_1000C06A8, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = self;
  sub_100023744();

  swift_release(v8);
}

@end
