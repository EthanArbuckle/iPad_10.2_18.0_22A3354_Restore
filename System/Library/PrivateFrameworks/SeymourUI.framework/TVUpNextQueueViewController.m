@implementation TVUpNextQueueViewController

- (void)viewDidLoad
{
  _TtC9SeymourUI27TVUpNextQueueViewController *v2;

  v2 = self;
  TVUpNextQueueViewController.viewDidLoad()();

}

- (_TtC9SeymourUI27TVUpNextQueueViewController)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC9SeymourUI27TVUpNextQueueViewController *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9SeymourUI27TVUpNextQueueViewController_layout);
  *v4 = xmmword_22BA93A10;
  v4[1] = xmmword_22BA93A20;
  v5 = a3;

  result = (_TtC9SeymourUI27TVUpNextQueueViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27TVUpNextQueueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI27TVUpNextQueueViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI27TVUpNextQueueViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVUpNextQueueViewController_listViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVUpNextQueueViewController_focusedWorkoutController));
  swift_release();
}

@end
