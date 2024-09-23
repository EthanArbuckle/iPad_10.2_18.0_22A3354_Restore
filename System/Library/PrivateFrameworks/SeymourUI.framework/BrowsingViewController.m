@implementation BrowsingViewController

- (void)viewDidLoad
{
  char *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BrowsingViewController();
  v2 = (char *)v4.receiver;
  -[BrowsingViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_pictureInPicturePresenter]
     + OBJC_IVAR____TtC9SeymourUI25PictureInPicturePresenter_display;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = &protocol witness table for BrowsingViewController;
  swift_unknownObjectWeakAssign();

}

- (_TtC9SeymourUI22BrowsingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA74060();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI22BrowsingViewController *v4;

  v4 = self;
  sub_22BA71014(a3);

}

- (int64_t)preferredStatusBarStyle
{
  _TtC9SeymourUI22BrowsingViewController *v2;
  _TtC9SeymourUI22BrowsingViewController *v3;
  _TtC9SeymourUI22BrowsingViewController *v4;
  int64_t v5;

  v2 = self;
  v3 = (_TtC9SeymourUI22BrowsingViewController *)-[BrowsingViewController topViewController](v2, sel_topViewController);
  if (v3)
  {
    v4 = v3;
    v5 = -[BrowsingViewController preferredStatusBarStyle](v3, sel_preferredStatusBarStyle);

    v2 = v4;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BrowsingViewController();
  swift_unknownObjectRetain();
  v7 = (char *)v8.receiver;
  -[BrowsingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_paletteViewController], sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();

}

- (void)scrollToTop
{
  _TtC9SeymourUI22BrowsingViewController *v2;

  v2 = self;
  sub_22BA71F4C();

}

- (_TtC9SeymourUI22BrowsingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC9SeymourUI22BrowsingViewController *result;

  result = (_TtC9SeymourUI22BrowsingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI22BrowsingViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC9SeymourUI22BrowsingViewController *result;

  v3 = a3;
  result = (_TtC9SeymourUI22BrowsingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI22BrowsingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI22BrowsingViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI22BrowsingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_purchaseCoordinator));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_pictureInPicturePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_rootViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_siriUserActivityHandler);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController__analyticsConsentShowingEnabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BA1020);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController__forceAnalayticsConsentAcknowledgement, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_palette));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_paletteViewController));
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_planCompletionTracker, (uint64_t (*)(_QWORD))type metadata accessor for PlanCompletionPresentationTracker);
  v5((char *)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController__welcomeAcknowledgementShowingEnabled, v4);
}

@end
