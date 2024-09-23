@implementation TVRootViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(void **)((*(_QWORD **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_dataProvider))[6]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI20TVRootViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B590D18();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI20TVRootViewController *v2;

  v2 = self;
  sub_22B58C060();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVRootViewController();
  v4 = v5.receiver;
  -[TVRootViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  v4[OBJC_IVAR____TtC9SeymourUI20TVRootViewController_engagementPresentability] = 1;

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI20TVRootViewController *v4;

  v4 = self;
  sub_22B58C20C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI20TVRootViewController *v4;

  v4 = self;
  sub_22B58C948(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVRootViewController();
  v4 = v5.receiver;
  -[TVRootViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  v4[OBJC_IVAR____TtC9SeymourUI20TVRootViewController_engagementPresentability] = 2;
  sub_22B0F3C60(&qword_255B9EFA8, (uint64_t (*)(uint64_t))type metadata accessor for TVRootViewController, (uint64_t)&protocol conformance descriptor for TVRootViewController);
  sub_22B0F3C60((unint64_t *)&unk_255B9EFB0, (uint64_t (*)(uint64_t))type metadata accessor for TVRootViewController, (uint64_t)&protocol conformance descriptor for TVRootViewController);
  sub_22BA7E1E0();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TVRootViewController();
  v2 = (char *)v10.receiver;
  -[TVRootViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI20TVRootViewController_dataProvider] + 48);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI20TVRootViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B58CCA8((uint64_t)v6, (uint64_t)v7);

}

- (void)handleSignInTapped
{
  _TtC9SeymourUI20TVRootViewController *v2;

  v2 = self;
  sub_22B58E434();

}

- (void)handleSignOutButtonLongPress
{
  _TtC9SeymourUI20TVRootViewController *v2;

  v2 = self;
  sub_22B3CE850();

}

- (void)handleSignOutTapped
{
  _TtC9SeymourUI20TVRootViewController *v2;

  v2 = self;
  sub_22B58E724();

}

- (void)handleUpNextQueueButton
{
  _TtC9SeymourUI20TVRootViewController *v2;

  v2 = self;
  sub_22B58EAA8();

}

- (_TtC9SeymourUI20TVRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI20TVRootViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI20TVRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_accountProvider);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_contentAvailabilityClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_engagementPresentationCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_remoteBrowsingSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_storefrontLocalizer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_timerProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_webUserInterfaceCoordinator));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_workoutPlanClient);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_lastFocusedIndexPath, &qword_255B87230);
  swift_unknownObjectRelease();
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_currentPlanIdentifier, &qword_255B85AE0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_newPlanCellFocusTimer));
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVRootViewController_planCompletionTracker, (uint64_t (*)(_QWORD))type metadata accessor for PlanCompletionPresentationTracker);

}

@end
