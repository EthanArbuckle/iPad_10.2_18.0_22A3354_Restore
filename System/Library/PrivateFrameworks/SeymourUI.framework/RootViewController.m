@implementation RootViewController

- (_TtC9SeymourUI18RootViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B85CED4();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI18RootViewController *v2;

  v2 = self;
  sub_22B856824();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI18RootViewController *v4;

  v4 = self;
  sub_22B856AE4(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  double v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RootViewController();
  v4 = (char *)v7.receiver;
  -[RootViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI18RootViewController_dataProvider] + 48)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_22B854B84(v5, v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI18RootViewController *v4;

  v4 = self;
  sub_22B856D9C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI18RootViewController *v4;

  v4 = self;
  sub_22B8570E4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  v4 = v5.receiver;
  -[RootViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  v4[OBJC_IVAR____TtC9SeymourUI18RootViewController_engagementPresentability] = 2;
  sub_22B0F3C60(&qword_255BAFAD0, (uint64_t (*)(uint64_t))type metadata accessor for RootViewController, (uint64_t)&protocol conformance descriptor for RootViewController);
  sub_22B0F3C60((unint64_t *)&unk_255BAFAD8, (uint64_t (*)(uint64_t))type metadata accessor for RootViewController, (uint64_t)&protocol conformance descriptor for RootViewController);
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
  v10.super_class = (Class)type metadata accessor for RootViewController();
  v2 = (char *)v10.receiver;
  -[RootViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI18RootViewController_dataProvider] + 48);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC9SeymourUI18RootViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_22B857444((uint64_t)a4, width, height);

  swift_unknownObjectRelease();
}

- (void)accountButtonTapped:(id)a3
{
  id v4;
  _TtC9SeymourUI18RootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22B855AC0();

}

- (_TtC9SeymourUI18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI18RootViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI18RootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_avatarSettingsProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_catalogClient);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_engagementPresentationCoordinator);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_marketingMessageViewControllerHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_storefrontLocalizer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18RootViewController_upNextQueueClient);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_webUserInterfaceCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_accountButton));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_largeTitleUpNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18RootViewController_upNextQueueButton));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI18RootViewController__lastWorkoutPlanTapToRadarAlertTimestamp;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_255B96938);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
