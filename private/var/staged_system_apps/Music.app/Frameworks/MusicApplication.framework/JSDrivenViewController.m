@implementation JSDrivenViewController

- (_TtC16MusicApplication22JSDrivenViewController)init
{
  return (_TtC16MusicApplication22JSDrivenViewController *)JSDrivenViewController.init()();
}

- (_TtC16MusicApplication22JSDrivenViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication22JSDrivenViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  _TtC16MusicApplication22JSDrivenViewController *v2;

  v2 = self;
  JSDrivenViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_componentController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_pageHeaderContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_promotionalParallaxViewController));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_ppt_onContentIsReady), *(_QWORD *)&self->componentController[OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_ppt_onContentIsReady]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_lifecycleEventQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_presentationSegue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_pushSegue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_offlineMessageView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_networkConnectivityObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewControllerPreparationCompletionHandlers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_artistRadioStationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController____lazy_storage___openInClassicalButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_browseContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController____lazy_storage___contextualActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController____lazy_storage___favoritingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_favoritingBarButtonItem));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_trailingBarButtonItemMap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_previousLeftBarButtonItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_previousRightBarButtonItems));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentNavigationItemBinding));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_favoriteStateChangesBinding));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_metricsPageProperties, &qword_14B1FF0);
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController));
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _TtC16MusicApplication22JSDrivenViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  JSDrivenViewController.preferredContentSizeDidChange(forChildContentContainer:)(a3);

  swift_unknownObjectRelease(a3);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC16MusicApplication22JSDrivenViewController *v5;
  id v6;
  UITraitCollection_optional v7;

  v6 = a3;
  v5 = self;
  v7.value.super.isa = (Class)a3;
  JSDrivenViewController.traitCollectionDidChange(_:)(v7);

}

- (void)viewDidLoad
{
  _TtC16MusicApplication22JSDrivenViewController *v2;

  v2 = self;
  JSDrivenViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication22JSDrivenViewController *v2;

  v2 = self;
  JSDrivenViewController.viewDidLayoutSubviews()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication22JSDrivenViewController *v4;

  v4 = self;
  JSDrivenViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication22JSDrivenViewController *v4;

  v4 = self;
  JSDrivenViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC16MusicApplication22JSDrivenViewController *v4;

  v4 = self;
  JSDrivenViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication22JSDrivenViewController *v4;

  v4 = self;
  JSDrivenViewController.viewDidDisappear(_:)(a3);

}

- (NSString)title
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for JSDrivenViewController(0);
  v2 = v9.receiver;
  v3 = -[JSDrivenViewController title](&v9, "title");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC16MusicApplication22JSDrivenViewController *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  JSDrivenViewController.title.setter(v4, v6);

}

- (UIColor)viewBackgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSDrivenViewController(0);
  return -[JSDrivenViewController viewBackgroundColor](&v3, "viewBackgroundColor");
}

- (void)setViewBackgroundColor:(id)a3
{
  id v4;
  char *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for JSDrivenViewController(0);
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[JSDrivenViewController setViewBackgroundColor:](&v8, "setViewBackgroundColor:", v4);
  v6 = *(id *)&v5[OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController];
  v7 = objc_msgSend(v5, "viewBackgroundColor", v8.receiver, v8.super_class);
  objc_msgSend(v6, "setViewBackgroundColor:", v7);

}

- (void)willMoveToParentViewController:(id)a3
{
  _TtC16MusicApplication22JSDrivenViewController *v5;
  id v6;
  UIViewController_optional v7;

  v6 = a3;
  v5 = self;
  v7.value.super.super.isa = (Class)a3;
  JSDrivenViewController.willMove(toParent:)(v7);

}

- (int64_t)preferredStatusBarStyle
{
  void **v3;
  double v4;
  void *v5;
  _TtC16MusicApplication22JSDrivenViewController *v6;
  id v7;
  int64_t v8;
  _BYTE v10[24];

  v3 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_promotionalParallaxViewController);
  *(_QWORD *)&v4 = swift_beginAccess((char *)self+ OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_promotionalParallaxViewController, v10, 0, 0).n128_u64[0];
  v5 = *v3;
  if (!v5)
    return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController), "preferredStatusBarStyle", v4);
  v6 = self;
  v7 = v5;
  v8 = PromotionalParallaxViewController.preferredStatusBarStyle.getter();

  return v8;
}

- (id)contentScrollView
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController), "contentScrollView");
}

- (UIBarButtonItem)accessibilityContextBarButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contextBarButtonItem));
}

- (UIBarButtonItem)accessibilityFavoritingBarButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_favoritingBarButtonItem));
}

- (_TtC16MusicApplication22JSDrivenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication22JSDrivenViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication22JSDrivenViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSDrivenViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
