@implementation FlowNavigationController

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v6;

  if (!a3)
  {
    ObjCClassMetadata = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return (_TtC23ShelfKitCollectionViews24FlowNavigationController *)FlowNavigationController.init(navigationBarClass:toolbarClass:)(ObjCClassMetadata, v6);
  }
  ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_getObjCClassMetadata(a4);
  return (_TtC23ShelfKitCollectionViews24FlowNavigationController *)FlowNavigationController.init(navigationBarClass:toolbarClass:)(ObjCClassMetadata, v6);
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC23ShelfKitCollectionViews24FlowNavigationController *)FlowNavigationController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)init
{
  uint64_t v3;

  v3 = sub_E710(0, &qword_3D31F8, &off_378870);
  return -[FlowNavigationController initWithNavigationBarClass:toolbarClass:](self, "initWithNavigationBarClass:toolbarClass:", swift_getObjCClassFromMetadata(v3), 0);
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithCoder:(id)a3
{
  _QWORD *v4;
  char *v5;
  _QWORD *v6;
  id v7;
  _TtC23ShelfKitCollectionViews24FlowNavigationController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_macNavigationBar);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_flowController;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_actionRunner);
  *v6 = 0;
  v6[1] = 0;
  v7 = a3;

  result = (_TtC23ShelfKitCollectionViews24FlowNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/FlowNavigationController.swift", 54, 2, 278, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = v10.receiver;
  -[FlowNavigationController viewDidLoad](&v10, "viewDidLoad");
  v3 = objc_msgSend(v2, "navigationBar", v10.receiver, v10.super_class);
  v4 = objc_msgSend(v2, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    v7 = v6;

    v8 = SizeClass.init(width:)(v7);
    v9 = SizeClass.margins(width:)(v8, v7);
    objc_msgSend(v3, "setLayoutMargins:", 0.0, v9, 0.0, v9);

  }
  else
  {
    __break(1u);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v4 = v13.receiver;
  v5 = a3;
  -[FlowNavigationController traitCollectionDidChange:](&v13, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "navigationBar", v13.receiver, v13.super_class);
  v7 = objc_msgSend(v4, "view");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "bounds");
    v10 = v9;

    v11 = SizeClass.init(width:)(v10);
    v12 = SizeClass.margins(width:)(v11, v10);
    objc_msgSend(v6, "setLayoutMargins:", 0.0, v12, 0.0, v12);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain(a4);
  v7 = v11.receiver;
  -[FlowNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = objc_msgSend(v7, "navigationBar", v11.receiver, v11.super_class);
  v9 = SizeClass.init(width:)(width);
  v10 = SizeClass.margins(width:)(v9, width);
  objc_msgSend(v8, "setLayoutMargins:", 0.0, v10, 0.0, v10);
  swift_unknownObjectRelease(a4);

}

- (void)viewWillLayoutSubviews
{
  objc_class *ObjectType;
  _TtC23ShelfKitCollectionViews24FlowNavigationController *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = -[FlowNavigationController navigationBar](v4, "navigationBar");
  v6 = -[FlowNavigationController view](v4, "view");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "bounds");
    v9 = v8;

    v10 = SizeClass.init(width:)(v9);
    v11 = SizeClass.margins(width:)(v10, v9);
    objc_msgSend(v5, "setLayoutMargins:", 0.0, v11, 0.0, v11);

    v12.receiver = v4;
    v12.super_class = ObjectType;
    -[FlowNavigationController viewWillLayoutSubviews](&v12, "viewWillLayoutSubviews");

  }
  else
  {
    __break(1u);
  }
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)-[FlowNavigationController topViewController](self, "topViewController");
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_class *ObjectType;
  _TtC23ShelfKitCollectionViews24FlowNavigationController *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = -[FlowNavigationController topViewController](v4, "topViewController");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "supportedInterfaceOrientations");

  }
  else
  {
    v9.receiver = v4;
    v9.super_class = ObjectType;
    v7 = -[FlowNavigationController supportedInterfaceOrientations](&v9, "supportedInterfaceOrientations");

  }
  return (unint64_t)v7;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews24FlowNavigationController *v4;
  unint64_t v5;
  NSArray v6;

  v4 = self;
  v5 = (unint64_t)FlowNavigationController.popToRootViewController(animated:)(a3);

  if (v5)
  {
    sub_E710(0, (unint64_t *)&qword_3D2B40, UIViewController_ptr);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6.super.isa = 0;
  }
  return v6.super.isa;
}

- (_TtC23ShelfKitCollectionViews24FlowNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC23ShelfKitCollectionViews24FlowNavigationController *result;

  v3 = a3;
  result = (_TtC23ShelfKitCollectionViews24FlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.FlowNavigationController", 48, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_macNavigationBar));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_flowController, &qword_3D31A0);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews24FlowNavigationController_actionRunner));
}

@end
