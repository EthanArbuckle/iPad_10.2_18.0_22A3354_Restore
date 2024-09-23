@implementation NowPlayingTabController_iOS

- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_9C740(0xD00000000000002ELL, 0x8000000000188630, 127);
}

- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_9C740(0xD000000000000025, 0x8000000000183FF0, 132);
}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v2;

  v2 = self;
  NowPlayingTabController_iOS.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v2;

  v2 = self;
  NowPlayingTabController_iOS.viewDidLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v6;
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  NowPlayingTabController_iOS.traitCollectionDidChange(_:)(v8);

}

- (void)presentNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  id v10;
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v11;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject(&unk_1CD2E8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = (void (*)(void))sub_2BE9C;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_miniPlayerPaletteInteraction);
  if (v9)
  {
    v11 = self;
    v10 = v9;
    sub_141DEC(v8, v7);

    sub_145A0((uint64_t)v8, v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)dismissNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v8;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1CD2C0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_2BE90;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  NowPlayingTabController_iOS.dismissNowPlaying(animated:completion:)(a3, v6, v7);
  sub_145A0((uint64_t)v6, v7);

}

- (BOOL)isNowPlayingPresented
{
  void *Strong;
  void *v3;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_nowPlayingViewController);
  v3 = Strong;
  if (Strong)

  return v3 != 0;
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  uint64_t v7;
  Swift::OpaquePointer v8;
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v9;

  v7 = sub_F174(0, (unint64_t *)&qword_1F9F30, UIViewController_ptr);
  v8._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = self;
  NowPlayingTabController_iOS._setViewControllers(_:animated:)(v8, a4);

  swift_bridgeObjectRelease(v8._rawValue);
}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 1;
}

- (id)_viewControllersInTabBar
{
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  Class isa;

  v2 = self;
  v3 = -[NowPlayingTabController_iOS childViewControllers](v2, "childViewControllers");
  v4 = sub_F174(0, (unint64_t *)&qword_1F9F30, UIViewController_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  v6 = sub_9C528(v5, (char *)v2);
  swift_bridgeObjectRelease(v5);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (void)_rebuildTabBarItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  char v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v5 = OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems;
  v6 = *((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NowPlayingTabController_iOS();
  v7 = v8.receiver;
  -[NowPlayingTabController_iOS _rebuildTabBarItemsAnimated:](&v8, "_rebuildTabBarItemsAnimated:", v3);
  *((_BYTE *)&self->super.super.super.super.isa + v5) = v6;

}

- (void)_updateLayoutForTraitCollection:(id)a3
{
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  objc_super v9;

  v5 = OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems;
  v6 = *((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems) = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NowPlayingTabController_iOS();
  v7 = a3;
  v8 = v9.receiver;
  -[NowPlayingTabController_iOS _updateLayoutForTraitCollection:](&v9, "_updateLayoutForTraitCollection:", v7);
  *((_BYTE *)&self->super.super.super.super.isa + v5) = v6;

}

- (NSMutableArray)mutableChildViewControllers
{
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *v2;
  id v3;

  v2 = self;
  v3 = NowPlayingTabController_iOS.mutableChildViewControllers.getter();

  return (NSMutableArray *)v3;
}

- (void)setMutableChildViewControllers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingTabController_iOS();
  -[NowPlayingTabController_iOS setMutableChildViewControllers:](&v4, "setMutableChildViewControllers:", a3);
}

- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithTabs:(id)a3
{
  _TtC12NowPlayingUI27NowPlayingTabController_iOS *result;

  result = (_TtC12NowPlayingUI27NowPlayingTabController_iOS *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NowPlayingTabController_iOS", 40, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS____lazy_storage___paletteView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS____lazy_storage___miniPlayerViewController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->paletteVisible[OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_automaticallyPresentedContentItemIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_miniPlayerAnimator));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_nowPlayingViewController);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_separator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_paletteViewControllers));
}

@end
