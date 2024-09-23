@implementation TVWorkoutPlanHandoffViewController

- (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9SeymourUI34TVWorkoutPlanHandoffViewController *result;

  v5 = OBJC_IVAR____TtC9SeymourUI34TVWorkoutPlanHandoffViewController_handoffView;
  v6 = objc_allocWithZone((Class)type metadata accessor for TVWorkoutPlanHandoffView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI34TVWorkoutPlanHandoffViewController *v2;

  v2 = self;
  sub_22BA2271C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI34TVWorkoutPlanHandoffViewController *v4;

  v4 = self;
  sub_22BA22880(a3);

}

- (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI34TVWorkoutPlanHandoffViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVWorkoutPlanHandoffViewController_handoffView));
}

@end
