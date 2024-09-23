@implementation WorkoutPlanWeekdayDetailViewController

- (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B48F934();
}

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[WorkoutPlanWeekdayDetailViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_22B2AAC28(0);
  sub_22B2AD238();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_dataProvider]+ 256)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_setAlwaysBounceVertical_, 0, v3.receiver, v3.super_class);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[WorkoutPlanWeekdayDetailViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B1205E4();
  sub_22B48F8B0(&qword_255B996C8, (uint64_t)&protocol conformance descriptor for WorkoutPlanWeekdayDetailViewController);
  sub_22B48F8B0(qword_255B996D0, (uint64_t)&protocol conformance descriptor for WorkoutPlanWeekdayDetailViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_22BA799A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = self;
  -[WorkoutPlanWeekdayDetailViewController viewWillDisappear:](&v12, sel_viewWillDisappear_, v3);
  v11[1] = v10;
  sub_22BA79998();
  sub_22B48F8B0(&qword_255B996C8, (uint64_t)&protocol conformance descriptor for WorkoutPlanWeekdayDetailViewController);
  sub_22BA7E114();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[WorkoutPlanWeekdayDetailViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B48F8B0(&qword_255B996C8, (uint64_t)&protocol conformance descriptor for WorkoutPlanWeekdayDetailViewController);
  sub_22B48F8B0(qword_255B996D0, (uint64_t)&protocol conformance descriptor for WorkoutPlanWeekdayDetailViewController);
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
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  -[WorkoutPlanWeekdayDetailViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_dataProvider] + 256);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_dynamicOfferCoordinator));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_pageNavigator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_purchaseHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38WorkoutPlanWeekdayDetailViewController_webUserInterfaceCoordinator));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
