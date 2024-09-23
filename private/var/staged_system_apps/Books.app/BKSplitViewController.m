@implementation BKSplitViewController

- (BKRootBarCoordinating)bk_rootBarCoordinator
{
  char *v2;
  _BYTE v4[24];

  v2 = *(char **)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKSplitViewController_contentHostingController)
     + OBJC_IVAR___BKSplitViewContentHostingController_rootBarCoordinator;
  swift_beginAccess(v2, v4, 0, 0);
  return (BKRootBarCoordinating *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (BKSplitViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BKSplitViewController *result;

  v5 = OBJC_IVAR___BKSplitViewController_rootBarEventSubject;
  v6 = sub_10004CFD4((uint64_t *)&unk_1009CEEA0);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)PassthroughSubject.init()(a3);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKSplitViewController_cancellables) = (Class)&_swiftEmptySetSingleton;
  v7 = (char *)self + OBJC_IVAR___BKSplitViewController_lastCollectionCreated;
  v8 = sub_10004CFD4(&qword_1009D3408);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (BKSplitViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/SplitViewController.swift", 31, 2, 111, 0);
  __break(1u);
  return result;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  BKSplitViewController *v7;
  uint64_t v8;
  BKSplitViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  _QWORD v19[3];
  uint64_t v20;

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v9 = self;
  }
  sub_100646588((uint64_t)a3, (uint64_t)v18, v19);

  sub_100010960((uint64_t)v18, (uint64_t *)&unk_1009D04E0);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_10003F198(v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  _s5Books15CurrentPageViewVwxx_0(v19);
  return v16;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BKSplitViewController *v7;
  uint64_t v8;
  BKSplitViewController *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_10064697C((uint64_t)a3, (uint64_t)v12);

  sub_100010960((uint64_t)v12, (uint64_t *)&unk_1009D04E0);
  return v10 & 1;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SplitViewController(0);
  v2 = v5.receiver;
  -[BKSplitViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  BKSplitViewController *v4;
  objc_super v5;
  _QWORD v6[3];
  char v7;

  v3 = a3;
  v6[1] = 0;
  v6[2] = 0;
  v6[0] = a3;
  v7 = 0;
  v4 = self;
  PassthroughSubject.send(_:)(v6);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for SplitViewController(0);
  -[BKSplitViewController viewWillAppear:](&v5, "viewWillAppear:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_100647154(self, (uint64_t)a2, a3, 1, 0, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_100647154(self, (uint64_t)a2, a3, 2, 1, (SEL *)&selRef_viewWillDisappear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  BKSplitViewController *v4;
  objc_super v5;
  _QWORD v6[3];
  char v7;

  v3 = a3;
  v6[1] = 0;
  v6[2] = 0;
  v6[0] = a3;
  v7 = 3;
  v4 = self;
  PassthroughSubject.send(_:)(v6);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for SplitViewController(0);
  -[BKSplitViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  BKSplitViewController *v8;
  objc_super v9;
  CGSize v10;
  id v11;
  char v12;

  height = a3.height;
  width = a3.width;
  v10 = a3;
  v11 = a4;
  v12 = 4;
  swift_unknownObjectRetain(a4);
  v8 = self;
  PassthroughSubject.send(_:)(&v10);
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for SplitViewController(0);
  -[BKSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  BKSplitViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10064736C();

  return (UIViewController *)v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  BKSplitViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100647460();

  return (UIViewController *)v3;
}

- (int64_t)preferredStatusBarStyle
{
  BKSplitViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100647520();

  return (int64_t)v3;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  BKSplitViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10064760C();

  return (UIViewController *)v3;
}

- (BOOL)prefersStatusBarHidden
{
  BKSplitViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1006477D0();

  return v3 & 1;
}

- (BKSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BKSplitViewController *result;

  v4 = a4;
  result = (BKSplitViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.SplitViewController", 25, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (BKSplitViewController)initWithStyle:(int64_t)a3
{
  BKSplitViewController *result;

  result = (BKSplitViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.SplitViewController", 25, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKSplitViewController_contentHostingController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___BKSplitViewController_rootBarEventSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKSplitViewController_cancellables));
  sub_100010960((uint64_t)self + OBJC_IVAR___BKSplitViewController_lastCollectionCreated, &qword_1009F26C8);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  BKSplitViewController *v7;

  v6 = a3;
  v7 = self;
  sub_100649640(v6, a4);

}

- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3
{
  return (unint64_t)objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___BKSplitViewController_contentHostingController)+ OBJC_IVAR___BKSplitViewContentHostingController_viewController), "supportedInterfaceOrientations", a3);
}

- (NSString)bc_stringForReturnToRootBarItem
{
  BKSplitViewController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100647C0C();
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
  BKSplitViewController *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = sub_100647D1C();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "activeRootBarWrapperViewController");

    swift_unknownObjectRelease(v4);
  }
  else
  {

    v5 = 0;
  }
  return (BSUIRootBarWrapperViewController *)v5;
}

- (void)books_createCollection:(id)a3
{
  BKSplitViewController *v5;
  uint64_t v6;
  BKSplitViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1006480C4((uint64_t)_swiftEmptyArrayStorage);

  sub_100010960((uint64_t)v8, (uint64_t *)&unk_1009D04E0);
}

- (void)books_createCollectionFromSelection:(id)a3
{
  BKSplitViewController *v5;
  uint64_t v6;
  BKSplitViewController *v7;
  _QWORD *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v7 = self;
  }
  v8 = sub_100646474();
  sub_1006480C4((uint64_t)v8);

  swift_bridgeObjectRelease(v8);
  sub_100010960((uint64_t)v9, (uint64_t *)&unk_1009D04E0);
}

- (void)books_addSelectionToCollection:(id)a3
{
  BKSplitViewController *v5;
  uint64_t v6;
  BKSplitViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100648E80((uint64_t)v8);

  sub_100010960((uint64_t)v8, (uint64_t *)&unk_1009D04E0);
}

@end
