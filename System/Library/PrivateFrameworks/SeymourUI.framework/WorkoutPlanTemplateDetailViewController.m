@implementation WorkoutPlanTemplateDetailViewController

- (CGSize)preferredContentSize
{
  objc_class *ObjectType;
  _TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = sub_22BA7D46C();
  if (v5 == sub_22BA7D46C())
  {

    v6 = 0x4087E00000000000;
    v7 = 0x4083800000000000;
  }
  else
  {
    v12.receiver = v4;
    v12.super_class = ObjectType;
    -[WorkoutPlanTemplateDetailViewController preferredContentSize](&v12, sel_preferredContentSize);
    v7 = v8;
    v6 = v9;

  }
  v10 = *(double *)&v7;
  v11 = *(double *)&v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v5;

  height = a3.height;
  width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  -[WorkoutPlanTemplateDetailViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_resignActiveObserver) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_currentContentInsetBehavior;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = -4;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_isTransitioningContentInset) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_visibility) = 1;
  v5 = a3;

  result = (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *v2;

  v2 = self;
  WorkoutPlanTemplateDetailViewController.viewDidLoad()();

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
  -[WorkoutPlanTemplateDetailViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B7A49E8();
  sub_22B549DD8();
  sub_22B54D36C(&qword_255B9D118, (uint64_t)&protocol conformance descriptor for WorkoutPlanTemplateDetailViewController);
  sub_22BA7DC94();
  sub_22B54D36C(&qword_255B9D120, (uint64_t)&protocol conformance descriptor for WorkoutPlanTemplateDetailViewController);
  sub_22B54D36C(qword_255B9D128, (uint64_t)&protocol conformance descriptor for WorkoutPlanTemplateDetailViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *v4;

  v4 = self;
  WorkoutPlanTemplateDetailViewController.viewWillDisappear(_:)(a3);

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
  -[WorkoutPlanTemplateDetailViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B54D36C(&qword_255B9D120, (uint64_t)&protocol conformance descriptor for WorkoutPlanTemplateDetailViewController);
  sub_22B54D36C(qword_255B9D128, (uint64_t)&protocol conformance descriptor for WorkoutPlanTemplateDetailViewController);
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
  -[WorkoutPlanTemplateDetailViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)handleDoneButtonTapped
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  _TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *v9;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_dataProvider);
  v4 = v3 + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_delegate;
  if (MEMORY[0x22E2F3FFC](v3 + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_delegate, a2))
  {
    v5 = *(_QWORD *)(v4 + 8);
    ObjectType = swift_getObjectType();
    v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9SeymourUI41WorkoutPlanTemplateDetailPageDataProvider_page);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 248);
    v9 = self;
    v8(v7, ObjectType, v5);

    swift_unknownObjectRelease();
  }
}

- (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI39WorkoutPlanTemplateDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39WorkoutPlanTemplateDetailViewController_storefrontLocalizer);
  swift_release();
}

@end
