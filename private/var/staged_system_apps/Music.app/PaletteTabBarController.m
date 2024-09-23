@implementation PaletteTabBarController

- (void)viewDidLoad
{
  _TtC5Music23PaletteTabBarController *v2;

  v2 = self;
  sub_100729298();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Music23PaletteTabBarController *v4;

  v3 = a3;
  v4 = self;
  sub_1007293EC(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Music23PaletteTabBarController *v4;

  v4 = self;
  sub_100729540(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Music23PaletteTabBarController *v4;

  v3 = a3;
  v4 = self;
  sub_100729688(v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Music23PaletteTabBarController *v4;

  v4 = self;
  sub_1007297E4(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music23PaletteTabBarController *v2;

  v2 = self;
  sub_10072992C();

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteTabBarController();
  v2 = v3.receiver;
  -[PaletteTabBarController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  sub_10072A820();

}

- (NSArray)viewControllers
{
  uint64_t (*v2)(void);
  _TtC5Music23PaletteTabBarController *v3;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  unint64_t v8;
  NSArray v9;
  objc_super v11;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x90);
  v3 = self;
  v4 = v2();
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for PaletteTabBarController();
  v5 = -[PaletteTabBarController viewControllers](&v11, "viewControllers");
  if (v5)
  {
    v6 = v5;
    v7 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    sub_10072F74C(v8, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
  }
  else
  {

    v9.super.isa = 0;
  }
  swift_bridgeObjectRelease();
  return (NSArray *)v9.super.isa;
}

- (void)setViewControllers:(id)a3
{
  void *isa;
  uint64_t v5;
  _TtC5Music23PaletteTabBarController *v6;
  _TtC5Music23PaletteTabBarController *v7;
  objc_super v8;

  isa = a3;
  if (a3)
  {
    v5 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
    static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v5);
    v6 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PaletteTabBarController();
  -[PaletteTabBarController setViewControllers:](&v8, "setViewControllers:", isa);

}

- (id)_viewControllersInTabBar
{
  uint64_t (*v2)(void);
  _TtC5Music23PaletteTabBarController *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  Class isa;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x90);
  v3 = self;
  v4 = v2();
  v5 = -[PaletteTabBarController childViewControllers](v3, "childViewControllers");
  v6 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  sub_10072F74C(v7, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (NSMutableArray)mutableChildViewControllers
{
  _TtC5Music23PaletteTabBarController *v2;
  id v3;

  v2 = self;
  v3 = sub_10072A520();

  return (NSMutableArray *)v3;
}

- (void)setMutableChildViewControllers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaletteTabBarController();
  -[PaletteTabBarController setMutableChildViewControllers:](&v4, "setMutableChildViewControllers:", a3);
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PaletteTabBarController();
  v6 = a3;
  v7 = v8.receiver;
  -[PaletteTabBarController _setSelectedViewController:performUpdates:](&v8, "_setSelectedViewController:performUpdates:", v6, v4);
  sub_10072A820();

}

- (_TtC5Music23PaletteTabBarController)initWithTabs:(id)a3
{
  uint64_t v4;

  v4 = sub_10004A07C(0, (unint64_t *)&unk_1011C6290, UITab_ptr);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  return (_TtC5Music23PaletteTabBarController *)sub_10072A974();
}

- (_TtC5Music23PaletteTabBarController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC5Music23PaletteTabBarController *)sub_10072AB14(v5, v7, a4);
}

- (_TtC5Music23PaletteTabBarController)initWithCoder:(id)a3
{
  return (_TtC5Music23PaletteTabBarController *)sub_10072ACD4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23PaletteTabBarController_paletteView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23PaletteTabBarController_accessoryView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Music23PaletteTabBarController_paletteViewControllers));
}

@end
