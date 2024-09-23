@implementation BookContentViewController

- (_TtC8BookEPUB25BookContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_176BAC();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _TtC8BookEPUB25BookContentViewController *v7;
  id v8;

  v8 = a3;
  v7 = self;
  sub_16521C((uint64_t)a3, a4);

}

- (_TtC8BookEPUB25BookContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8BookEPUB25BookContentViewController *result;

  v4 = a4;
  result = (_TtC8BookEPUB25BookContentViewController *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.BookContentViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5[18];
  uint64_t v6[18];

  sub_52128((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_bookEntity, &qword_3B7018);
  swift_release();
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_contentLayoutProviderProviding);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_contentEventHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_contentNavigationEventHandler));
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_readingSettingsProvider);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_layoutModeProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_paginatingService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_unhandledTapRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___readingLoupeOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___readingLoupeView));
  swift_release();
  sub_49AD8((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_axCurrentLocation, (uint64_t)v5);
  sub_49B44(v5);
  sub_49AD8((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_failedLocation, (uint64_t)v6);
  sub_49B44(v6);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_contentHostEnvironmentProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_pageNumberProvider));
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_stateHandler));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_debugLayers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_readingLoupeLongPressTipController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_paginatingHostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___pagedModeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___scrollContainerView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_scrollGestureHostView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController__uberScrollContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___pageLabelContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_bookmarkCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___bookmarkWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_bookmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_slidePanRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_curlPanRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_contentSnapshotView));
  sub_176FB8((Class *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_cancellables));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bookEntity[OBJC_IVAR____TtC8BookEPUB25BookContentViewController_ConstraintPrefix]);
}

- (void)pageDrag:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _TtC8BookEPUB25BookContentViewController *v15;

  v4 = a3;
  v15 = self;
  v5 = -[BookContentViewController view](v15, "view");
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = -[BookContentViewController view](v15, "view");
  objc_msgSend(v4, "velocityInView:", v10);
  v12 = v11;
  v14 = v13;

  BookContentViewController.performPageDrag(translation:velocity:gestureState:)((uint64_t)objc_msgSend(v4, "state"), v7, v9, v12, v14);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC8BookEPUB25BookContentViewController *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = BookContentViewController.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)((UIGestureRecognizer)v6, (UIGestureRecognizer)v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8BookEPUB25BookContentViewController *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = BookContentViewController.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer)v6, (UITouch)v7);

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC8BookEPUB25BookContentViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = BookContentViewController.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC8BookEPUB25BookContentViewController *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = BookContentViewController.gestureRecognizer(_:shouldRequireFailureOf:)((UIGestureRecognizer)v6, (UIGestureRecognizer)v7);

  return v9;
}

- (void)viewDidLoad
{
  _TtC8BookEPUB25BookContentViewController *v2;

  v2 = self;
  BookContentViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8BookEPUB25BookContentViewController *v4;

  v4 = self;
  BookContentViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8BookEPUB25BookContentViewController *v4;

  v4 = self;
  BookContentViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8BookEPUB25BookContentViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  BookContentViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC8BookEPUB25BookContentViewController *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v9);
  swift_unknownObjectRelease(a3);
  sub_176E84();

  sub_34488(v9);
}

- (void)cleanupSnapshotView
{
  _TtC8BookEPUB25BookContentViewController *v2;

  v2 = self;
  sub_16F304();

}

- (void)viewDidLayoutSubviews
{
  _TtC8BookEPUB25BookContentViewController *v2;

  v2 = self;
  BookContentViewController.viewDidLayoutSubviews()();

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  return 0;
}

- (void)unhandledDirectTapGesture:(id)a3
{
  id v4;
  _TtC8BookEPUB25BookContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_171A3C(v4);

}

- (void)unhandledTapAction:(id)a3
{
  id v4;
  _TtC8BookEPUB25BookContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_172030(v4);

}

@end
