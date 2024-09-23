@implementation WorkoutPlanScheduleViewController

- (_TtC9SeymourUI33WorkoutPlanScheduleViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B681D64();
}

- (void)viewDidLoad
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[WorkoutPlanScheduleViewController viewDidLoad](&v4, sel_viewDidLoad);
  sub_22B67EF00();
  sub_22B6DBFC0();
  sub_22B67F280();
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  if (v3)
    objc_msgSend(v3, sel_setAlwaysBounceVertical_, 0, v4.receiver, v4.super_class);

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v2 = (char *)v9.receiver;
  -[WorkoutPlanScheduleViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  v3 = *(_QWORD *)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_dataProvider]
                 + OBJC_IVAR____TtC9SeymourUI36WorkoutPlanSchedulePageDataProviderX_page);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_impressionsTracker), *(_QWORD *)(v3 + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_impressionsTracker + 24));
  v4 = *(void **)(v3 + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_collectionView);
  swift_unknownObjectRetain();
  objc_msgSend(v4, sel_bounds, v9.receiver, v9.super_class);
  sub_22B47C120(v5, v6, v7, v8);

  swift_unknownObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[WorkoutPlanScheduleViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  sub_22B67F280();
  sub_22B458E70();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_22B6802A0(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(objc_class *, uint64_t, uint64_t))MEMORY[0x24BE8E9F8]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI33WorkoutPlanScheduleViewController *v4;

  v4 = self;
  WorkoutPlanScheduleViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_22B6802A0(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (void (*)(objc_class *, uint64_t, uint64_t))MEMORY[0x24BE8EA00]);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC9SeymourUI33WorkoutPlanScheduleViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  WorkoutPlanScheduleViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)backButtonPressed
{
  _TtC9SeymourUI33WorkoutPlanScheduleViewController *v2;
  _TtC9SeymourUI33WorkoutPlanScheduleViewController *v3;
  id v4;
  _TtC9SeymourUI33WorkoutPlanScheduleViewController *v5;
  _TtC9SeymourUI33WorkoutPlanScheduleViewController *v6;

  v6 = self;
  v2 = (_TtC9SeymourUI33WorkoutPlanScheduleViewController *)-[WorkoutPlanScheduleViewController navigationController](v6, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    v4 = -[WorkoutPlanScheduleViewController popViewControllerAnimated:](v2, sel_popViewControllerAnimated_, 1);

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }

}

- (_TtC9SeymourUI33WorkoutPlanScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI33WorkoutPlanScheduleViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI33WorkoutPlanScheduleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_storefrontLocalizer);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanScheduleViewController_navigationTitleView));
}

@end
