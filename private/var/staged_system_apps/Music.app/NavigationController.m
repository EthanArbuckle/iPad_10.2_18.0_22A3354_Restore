@implementation NavigationController

- (_TtC5Music20NavigationController)init
{
  type metadata accessor for NavigationBar();
  return -[NavigationController initWithNavigationBarClass:toolbarClass:](self, "initWithNavigationBarClass:toolbarClass:", swift_getObjCClassFromMetadata(), 0);
}

- (_TtC5Music20NavigationController)initWithRootViewController:(id)a3
{
  id v4;
  _TtC5Music20NavigationController *v5;

  v4 = a3;
  v5 = -[NavigationController init](self, "init");
  -[TraitNavigationController pushViewController:animated:](v5, "pushViewController:animated:", v4, 0);

  return v5;
}

- (_TtC5Music20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
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
    return (_TtC5Music20NavigationController *)sub_100861AAC(ObjCClassMetadata, v6);
  }
  ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_getObjCClassMetadata(a4);
  return (_TtC5Music20NavigationController *)sub_100861AAC(ObjCClassMetadata, v6);
}

- (_TtC5Music20NavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100866D9C();
}

- (id)_targetNavigationBarForUISplitViewControllerSidebarButton
{
  _TtC5Music20NavigationController *v2;
  id v3;

  v2 = self;
  v3 = sub_100861C18();

  return v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  void *v3;
  _TtC5Music20NavigationController *v4;
  id v5;
  id v6;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v5 = -[NavigationController topViewController](self, "topViewController");
  }
  v6 = v3;

  return (UIViewController *)v5;
}

- (void)viewDidLayoutSubviews
{
  _TtC5Music20NavigationController *v2;

  v2 = self;
  sub_100861DBC();

}

- (void)viewDidLoad
{
  _TtC5Music20NavigationController *v2;

  v2 = self;
  sub_100862114();

}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  char *v7;
  char *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for NavigationController();
  v4 = (char *)v10.receiver;
  v5 = a3;
  -[NavigationController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController];
  if (v6)
  {
    v7 = *(char **)&v4[OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController];
LABEL_5:
    v9 = v6;
    sub_10086147C(v7, 0);

    v5 = v4;
    v4 = v7;
    goto LABEL_6;
  }
  v8 = (char *)objc_msgSend(v4, "topViewController", v10.receiver, v10.super_class);
  if (v8)
  {
    v7 = v8;
    v6 = 0;
    goto LABEL_5;
  }
LABEL_6:

}

- (UINavigationControllerDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NavigationController();
  return -[NavigationController delegate](&v3, "delegate");
}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  if (a3)
  {
    if (a3 == self)
    {
      v4.receiver = a3;
      v4.super_class = (Class)type metadata accessor for NavigationController();
      -[NavigationController setDelegate:](&v4, "setDelegate:", a3);
    }
  }
}

- (NSArray)viewControllers
{
  id v2;
  NSArray *v3;
  uint64_t v4;
  Class isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NavigationController();
  v2 = v7.receiver;
  v3 = -[NavigationController viewControllers](&v7, "viewControllers");
  v4 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setViewControllers:(id)a3
{
  uint64_t v5;
  _TtC5Music20NavigationController *v6;
  id v7;
  void *v8;
  Class isa;
  objc_super v10;

  v5 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v6 = self;
  v7 = -[NavigationController existingPaletteForEdge:](v6, "existingPaletteForEdge:", 2);
  if (v7)
  {
    v8 = v7;
    -[NavigationController detachPalette:](v6, "detachPalette:", v7);

  }
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for NavigationController();
  -[NavigationController setViewControllers:](&v10, "setViewControllers:", isa);

  sub_100861754();
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  id v7;
  _TtC5Music20NavigationController *v8;

  v7 = a3;
  v8 = self;
  sub_100862548(a3, a4);

}

- (void)detachPalette:(id)a3
{
  id v5;
  _TtC5Music20NavigationController *v6;

  v5 = a3;
  v6 = self;
  sub_100862918(a3);

}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _TtC5Music20NavigationController *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray v7;

  v4 = self;
  sub_100860FB0(a3, 1);
  v6 = v5;

  if (v6)
  {
    sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _TtC5Music20NavigationController *v4;
  id v5;

  v4 = self;
  v5 = sub_100862D04(a3);

  return v5;
}

- (BOOL)_allowChildSplitViewControllers
{
  return 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _TtC5Music20NavigationController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_100866A54(v9, a5);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC5Music20NavigationController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_100866AE0(v8);

}

- (void)navigationBar:(id)a3 didPushItem:(id)a4
{
  id v6;
  id v7;
  _TtC5Music20NavigationController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100866BF4(v6, (uint64_t)sub_100866D8C);

}

- (void)navigationBar:(id)a3 didPopItem:(id)a4
{
  id v6;
  id v7;
  _TtC5Music20NavigationController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100866BF4(v6, (uint64_t)sub_100866D8C);

}

- (_TtC5Music20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music20NavigationController *result;

  v4 = a4;
  result = (_TtC5Music20NavigationController *)_swift_stdlib_reportUnimplementedInitializer("Music.NavigationController", 26, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Music20NavigationController_onWillShowViewController), *(_QWORD *)&self->onWillShowViewController[OBJC_IVAR____TtC5Music20NavigationController_onWillShowViewController]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Music20NavigationController_onDidShowViewController), *(_QWORD *)&self->onWillShowViewController[OBJC_IVAR____TtC5Music20NavigationController_onDidShowViewController]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music20NavigationController_existingTopPalette));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music20NavigationController____lazy_storage___statusBarEffectView));
}

@end
