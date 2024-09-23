@implementation PageCurlViewController

- (_TtC5Books22PageCurlViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100502B74();
}

- (void)viewDidLoad
{
  _TtC5Books22PageCurlViewController *v2;

  v2 = self;
  sub_1004F8D28();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[PageCurlViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = objc_msgSend(v2, "viewIfLoaded", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "window");

    if (v5)
    {
      sub_1004F9200(v5);

      v2 = v5;
    }
  }

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5;
  _TtC5Books22PageCurlViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100502DD0();

}

- (BOOL)canNavigateInDirection:(int64_t)a3
{
  _TtC5Books22PageCurlViewController *v4;

  v4 = self;
  LOBYTE(a3) = sub_1004FBD44(a3);

  return a3 & 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC5Books22PageCurlViewController *v12;
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = sub_10004CFD4((uint64_t *)&unk_1009E8E70);
  __chkstk_darwin(v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  swift_unknownObjectRetain(a4);
  v12 = self;
  -[PageCurlViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v13 = type metadata accessor for SpreadPaginationEntity(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  sub_1004FA040((uint64_t)v11);
  sub_100010960((uint64_t)v11, (uint64_t *)&unk_1009E8E70);
  swift_unknownObjectRelease(a4);

}

- (_TtC5Books22PageCurlViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  _TtC5Books22PageCurlViewController *result;

  result = (_TtC5Books22PageCurlViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.PageCurlViewController", 28, "init(transitionStyle:navigationOrientation:options:)", 52, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_actionMenuState]);
  swift_unknownObjectRelease(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_bookLayoutController]);
  sub_10028D108((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_containerBuilder]);
  swift_release(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_state]);
  sub_1001FE9A0((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_contentLayoutProviderProviding]);
  swift_unknownObjectRelease(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_currentLocationProvider]);
  swift_unknownObjectRelease(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_locationController]);
  swift_weakDestroy(&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_bookContentLayoutController]);
  swift_unknownObjectWeakDestroy(&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_liveContentViewController]);
  sub_1001FE9A0((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_readingSettingsProvider]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_beganCurls]);
  sub_100010960((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_spreadForResetAfterCurlEnd], (uint64_t *)&unk_1009E8E70);

  sub_100010960((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_spreadBeforeCurl], (uint64_t *)&unk_1009E8E70);
  sub_100010960((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_pendingDestinationSpread], (uint64_t *)&unk_1009E8E70);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_tapActionViews]);
  swift_release(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_curlHappenedPublisher]);
  swift_release(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_curlCompletedPublisher]);
  swift_unknownObjectRelease(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_paginatingService]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_cancellables]);

}

- (double)interactiveAnimationDuration
{
  _TtC5Books22PageCurlViewController *v2;
  double v3;

  v2 = self;
  v3 = sub_1004FF360();

  return v3;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return sub_1004FF7E8(self, (uint64_t)a2, a3, a4, 1);
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return sub_1004FF7E8(self, (uint64_t)a2, a3, a4, 0);
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  id v9;
  _TtC5Books22PageCurlViewController *v10;

  v7 = sub_100009E04(0, (unint64_t *)&qword_1009D8D70, UIViewController_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1004FF87C(v9, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  _TtC5Books22PageCurlViewController *v9;

  v6 = a6;
  v8 = a3;
  v9 = self;
  sub_100503678(v8, v6);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return sub_1005011EC(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC5Books22PageCurlViewController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100500F58(v6, (uint64_t)v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _TtC5Books22PageCurlViewController *v5;
  _TtC5Books22PageCurlViewController *v6;
  id v7;
  _TtC5Books22PageCurlViewController *Strong;
  _TtC5Books22PageCurlViewController *v9;
  unsigned __int8 v10;

  sub_100009E04(0, (unint64_t *)&qword_1009D9DA0, NSObject_ptr);
  v5 = (_TtC5Books22PageCurlViewController *)a3;
  v6 = self;
  v7 = sub_1004F8B60();
  LOBYTE(self) = static NSObject.== infix(_:_:)(v5, v7);

  if ((self & 1) != 0
    && (Strong = (_TtC5Books22PageCurlViewController *)swift_unknownObjectWeakLoadStrong(&v6->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_liveContentViewController])) != 0)
  {
    v9 = Strong;
    v10 = -[PageCurlViewController gestureRecognizerShouldBegin:](Strong, "gestureRecognizerShouldBegin:", v5);

    v5 = v6;
    v6 = v9;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return sub_1005011EC(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_gestureRecognizer_shouldRequireFailureOfGestureRecognizer_);
}

- (int64_t)validateTapDirection:(int64_t)a3
{
  _TtC5Books22PageCurlViewController *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_1005012D8(a3);

  return v5;
}

- (BOOL)passThroughView:(id)a3 gestureRecognizer:(id)a4 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a5
{
  uint64_t Strong;
  void *v10;
  id v11;
  id v12;
  id v13;
  _TtC5Books22PageCurlViewController *v14;
  Swift::Bool v15;

  Strong = swift_unknownObjectWeakLoadStrong(&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_liveContentViewController]);
  if (Strong)
  {
    v10 = (void *)Strong;
    v11 = a3;
    v12 = a4;
    v13 = a5;
    v14 = self;
    v15 = BookContentViewController.passThroughView(_:gestureRecognizer:shouldRecognizeSimultaneouslyWith:)((UIView)v11, (UIGestureRecognizer)v12, (UIGestureRecognizer)v13);

  }
  else
  {
    return 0;
  }
  return v15;
}

- (BOOL)passThroughView:(id)a3 shouldPassthroughHitAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC5Books22PageCurlViewController *v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  LOBYTE(self) = sub_1005015AC(v7, x, y);

  return self & 1;
}

@end
