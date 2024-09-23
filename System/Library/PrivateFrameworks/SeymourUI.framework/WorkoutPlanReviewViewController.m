@implementation WorkoutPlanReviewViewController

- (_TtC9SeymourUI31WorkoutPlanReviewViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI31WorkoutPlanReviewViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_resignActiveObserver) = 0;
  v4 = a3;

  result = (_TtC9SeymourUI31WorkoutPlanReviewViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI31WorkoutPlanReviewViewController *v2;

  v2 = self;
  WorkoutPlanReviewViewController.viewDidLoad()();

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
  -[WorkoutPlanReviewViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  type metadata accessor for WorkoutPlanReviewPageDataProvider(0);
  sub_22B106EC0(&qword_255B8C878, 255, type metadata accessor for WorkoutPlanReviewPageDataProvider, (uint64_t)&unk_22BAB4640);
  sub_22BA7DC94();
  sub_22B106EC0(&qword_255B8C880, v5, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanReviewViewController);
  sub_22B106EC0(&qword_255B8C888, v6, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanReviewViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI31WorkoutPlanReviewViewController *v4;

  v4 = self;
  WorkoutPlanReviewViewController.viewWillDisappear(_:)(a3);

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
  -[WorkoutPlanReviewViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  sub_22B106EC0(&qword_255B8C880, v5, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanReviewViewController);
  sub_22B106EC0(&qword_255B8C888, v6, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutPlanReviewViewController, (uint64_t)&protocol conformance descriptor for WorkoutPlanReviewViewController);
  sub_22BA7E1E0();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI31WorkoutPlanReviewViewController *v2;

  v2 = self;
  WorkoutPlanReviewViewController.viewDidLayoutSubviews()();

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[WorkoutPlanReviewViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  sub_22B2AF514();

}

- (_TtC9SeymourUI31WorkoutPlanReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI31WorkoutPlanReviewViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI31WorkoutPlanReviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_magicPocketView));
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31WorkoutPlanReviewViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

@end
