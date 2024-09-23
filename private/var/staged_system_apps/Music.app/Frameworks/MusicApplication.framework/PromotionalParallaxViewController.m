@implementation PromotionalParallaxViewController

- (_TtC16MusicApplication33PromotionalParallaxViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication33PromotionalParallaxViewController *v9;

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
  v9 = (_TtC16MusicApplication33PromotionalParallaxViewController *)sub_7DFE88(v5, v7, (uint64_t)a4);

  return v9;
}

- (void)dealloc
{
  _TtC16MusicApplication33PromotionalParallaxViewController *v2;

  v2 = self;
  PromotionalParallaxViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_contentViewConfigurationHandler), *(_QWORD *)&self->contentViewConfigurationHandler[OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_contentViewConfigurationHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_sourceScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_pageHeaderContentViewController));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_pendingCompletionHandler), *(_QWORD *)&self->contentViewConfigurationHandler[OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_pendingCompletionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_headerItem));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_promotionalImageryView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController____lazy_storage___promotionalImageryViewCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_promotionalParallaxContentView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_upsellBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_sourceScrollViewContentSizeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_artworkVideoPlaybackController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_artworkVideoReportingController));
}

- (_TtC16MusicApplication33PromotionalParallaxViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication33PromotionalParallaxViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (int64_t)preferredStatusBarStyle
{
  _TtC16MusicApplication33PromotionalParallaxViewController *v2;
  int64_t v3;

  v2 = self;
  v3 = PromotionalParallaxViewController.preferredStatusBarStyle.getter();

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication33PromotionalParallaxViewController *v4;

  v4 = self;
  PromotionalParallaxViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication33PromotionalParallaxViewController *v4;

  v4 = self;
  PromotionalParallaxViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC16MusicApplication33PromotionalParallaxViewController *v4;

  v4 = self;
  PromotionalParallaxViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[PromotionalParallaxViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  sub_7DD078();
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_artworkVideoPlaybackController];
  if (v5)
  {
    swift_retain(*(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_artworkVideoPlaybackController]);
    sub_81B110();

    swift_release(v5);
  }
  else
  {

  }
}

- (void)loadView
{
  _TtC16MusicApplication33PromotionalParallaxViewController *v2;

  v2 = self;
  PromotionalParallaxViewController.loadView()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication33PromotionalParallaxViewController *v6;
  _TtC16MusicApplication33PromotionalParallaxViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PromotionalParallaxViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication33PromotionalParallaxViewController *v2;

  v2 = self;
  PromotionalParallaxViewController.viewDidLayoutSubviews()();

}

- (void)viewDidLoad
{
  char *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  -[PromotionalParallaxViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_textDrawingCache];
  v4 = objc_msgSend(v2, "traitCollection");
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  swift_beginAccess(v3 + 16, v7, 1, 0);
  *(_QWORD *)(v3 + 16) = v6;
  sub_277264();

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16MusicApplication33PromotionalParallaxViewController *v6;
  _TtC16MusicApplication33PromotionalParallaxViewController *v7;
  UIViewController_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  PromotionalParallaxViewController.willMove(toParent:)(v8);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16MusicApplication33PromotionalParallaxViewController *v6;
  _TtC16MusicApplication33PromotionalParallaxViewController *v7;
  UIViewController_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  PromotionalParallaxViewController.didMove(toParent:)(v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC16MusicApplication33PromotionalParallaxViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  PromotionalParallaxViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease(a4);

}

@end
