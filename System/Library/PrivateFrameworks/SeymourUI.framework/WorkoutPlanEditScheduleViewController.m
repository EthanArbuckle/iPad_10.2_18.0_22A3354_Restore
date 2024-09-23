@implementation WorkoutPlanEditScheduleViewController

- (CGSize)preferredContentSize
{
  objc_class *ObjectType;
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *v4;
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
    -[WorkoutPlanEditScheduleViewController preferredContentSize](&v12, sel_preferredContentSize);
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
  -[WorkoutPlanEditScheduleViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_resignActiveObserver) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_primaryActionButton) = 0;
  v4 = a3;

  result = (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *v2;

  v2 = self;
  WorkoutPlanEditScheduleViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[WorkoutPlanEditScheduleViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  type metadata accessor for WorkoutPlanEditSchedulePageDataProvider(0);
  sub_22B106EC0(&qword_255B8D3B8, 255, type metadata accessor for WorkoutPlanEditSchedulePageDataProvider, (uint64_t)&unk_22BA981E0);
  sub_22BA7DC94();
  sub_22B106EC0(&qword_255B8D3C0, v5, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanEditScheduleViewController);
  sub_22B106EC0(&qword_255B8D3C8, v6, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanEditScheduleViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *v4;

  v4 = self;
  WorkoutPlanEditScheduleViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[WorkoutPlanEditScheduleViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  sub_22B106EC0(&qword_255B8D3C0, v5, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanEditScheduleViewController);
  sub_22B106EC0(&qword_255B8D3C8, v6, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanEditScheduleViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanEditScheduleViewController);
  sub_22BA7E1E0();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *v2;

  v2 = self;
  WorkoutPlanEditScheduleViewController.viewDidLayoutSubviews()();

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[WorkoutPlanEditScheduleViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  sub_22B2AF658();

}

- (void)onActionButtonTapped
{
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *v2;

  v2 = self;
  sub_22B2D35DC();

}

- (void)onCancelButtonTapped
{
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *v2;

  v2 = self;
  sub_22B2D3964();

}

- (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI37WorkoutPlanEditScheduleViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI37WorkoutPlanEditScheduleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_magicPocketView));
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanEditScheduleViewController_primaryActionButton));
}

@end
