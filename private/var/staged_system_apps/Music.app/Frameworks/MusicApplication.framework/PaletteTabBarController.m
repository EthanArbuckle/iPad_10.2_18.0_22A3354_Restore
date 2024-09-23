@implementation PaletteTabBarController

- (void)viewDidLoad
{
  _TtC16MusicApplication23PaletteTabBarController *v2;

  v2 = self;
  sub_2FDC10();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16MusicApplication23PaletteTabBarController *v4;

  v3 = a3;
  v4 = self;
  sub_2FDD64(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication23PaletteTabBarController *v4;

  v4 = self;
  sub_2FDEB8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16MusicApplication23PaletteTabBarController *v4;

  v3 = a3;
  v4 = self;
  sub_2FE000(v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication23PaletteTabBarController *v4;

  v4 = self;
  sub_2FE15C(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication23PaletteTabBarController *v2;

  v2 = self;
  sub_2FE2A4();

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteTabBarController();
  v2 = v3.receiver;
  -[PaletteTabBarController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  sub_2FF1AC();

}

- (NSArray)viewControllers
{
  uint64_t (*v2)(void);
  _TtC16MusicApplication23PaletteTabBarController *v3;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  NSArray v10;
  objc_super v12;

  v2 = *(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & (uint64_t)self->super.super.super.super.isa));
  v3 = self;
  v4 = v2();
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for PaletteTabBarController();
  v5 = -[PaletteTabBarController viewControllers](&v12, "viewControllers");
  if (v5)
  {
    v6 = v5;
    v7 = sub_4E684(0, (unint64_t *)&qword_14C9D90, UIViewController_ptr);
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    v9 = sub_303300(v8, v4);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v4);
    v10.super.isa = Array._bridgeToObjectiveC()().super.isa;
    v4 = (uint64_t)v9;
  }
  else
  {

    v10.super.isa = 0;
  }
  swift_bridgeObjectRelease(v4);
  return (NSArray *)v10.super.isa;
}

- (void)setViewControllers:(id)a3
{
  void *isa;
  uint64_t v5;
  uint64_t v6;
  _TtC16MusicApplication23PaletteTabBarController *v7;
  _TtC16MusicApplication23PaletteTabBarController *v8;
  objc_super v9;

  isa = a3;
  if (a3)
  {
    v5 = sub_4E684(0, (unint64_t *)&qword_14C9D90, UIViewController_ptr);
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
  v9.super_class = (Class)type metadata accessor for PaletteTabBarController();
  -[PaletteTabBarController setViewControllers:](&v9, "setViewControllers:", isa);

}

- (id)_viewControllersInTabBar
{
  uint64_t (*v2)(void);
  _TtC16MusicApplication23PaletteTabBarController *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  Class isa;

  v2 = *(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & (uint64_t)self->super.super.super.super.isa));
  v3 = self;
  v4 = v2();
  v5 = -[PaletteTabBarController childViewControllers](v3, "childViewControllers");
  v6 = sub_4E684(0, (unint64_t *)&qword_14C9D90, UIViewController_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  swift_bridgeObjectRetain();
  v8 = sub_303300(v7, v4);

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease_n(v4, 2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (NSMutableArray)mutableChildViewControllers
{
  _TtC16MusicApplication23PaletteTabBarController *v2;
  id v3;

  v2 = self;
  v3 = sub_2FEEAC();

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
  sub_2FF1AC();

}

- (_TtC16MusicApplication23PaletteTabBarController)initWithTabs:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC16MusicApplication23PaletteTabBarController *v6;

  v4 = sub_4E684(0, &qword_14C0A48, UITab_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  v6 = (_TtC16MusicApplication23PaletteTabBarController *)sub_304264();
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (_TtC16MusicApplication23PaletteTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication23PaletteTabBarController *v9;

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
  v9 = (_TtC16MusicApplication23PaletteTabBarController *)sub_3043BC(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication23PaletteTabBarController)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication23PaletteTabBarController *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication23PaletteTabBarController *)sub_304524((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23PaletteTabBarController_paletteView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23PaletteTabBarController_accessoryView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication23PaletteTabBarController_paletteViewControllers));
}

@end
