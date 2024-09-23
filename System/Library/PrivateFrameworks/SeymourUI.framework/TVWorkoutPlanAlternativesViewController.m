@implementation TVWorkoutPlanAlternativesViewController

- (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_visibility) = 1;
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_lastFocusedIndexPath;
  v6 = sub_22BA79C14();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_settlingTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_resignActiveObserver) = 0;
  v7 = a3;

  result = (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *v2;

  v2 = self;
  TVWorkoutPlanAlternativesViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *v2;

  v2 = self;
  TVWorkoutPlanAlternativesViewController.viewDidLayoutSubviews()();

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
  -[TVWorkoutPlanAlternativesViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  type metadata accessor for TVWorkoutPlanAlternativesPageDataProvider();
  sub_22B0F3C60(&qword_255B8ED58, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesPageDataProvider, (uint64_t)&unk_22BAA7C38);
  sub_22BA7DC94();
  sub_22B0F3C60(&qword_255B8ED60, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanAlternativesViewController);
  sub_22B0F3C60((unint64_t *)&unk_255B8ED68, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanAlternativesViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *v4;

  v4 = self;
  TVWorkoutPlanAlternativesViewController.viewWillDisappear(_:)(a3);

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
  -[TVWorkoutPlanAlternativesViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B0F3C60(&qword_255B8ED60, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanAlternativesViewController);
  sub_22B0F3C60((unint64_t *)&unk_255B8ED68, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanAlternativesViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanAlternativesViewController);
  sub_22BA7E1E0();

}

- (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI39TVWorkoutPlanAlternativesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_pageNavigator);
  swift_release();
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_lastFocusedIndexPath, &qword_255B87230);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI39TVWorkoutPlanAlternativesViewController_timerProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
