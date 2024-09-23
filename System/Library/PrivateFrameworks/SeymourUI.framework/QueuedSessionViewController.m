@implementation QueuedSessionViewController

- (unint64_t)supportedInterfaceOrientations
{
  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI27QueuedSessionViewController_platform) == 1)
    return 30;
  else
    return 24;
}

- (_TtC9SeymourUI27QueuedSessionViewController)initWithCoder:(id)a3
{
  _TtC9SeymourUI27QueuedSessionViewController *result;

  result = (_TtC9SeymourUI27QueuedSessionViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[QueuedSessionViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_22B6937A4();

}

- (_TtC9SeymourUI27QueuedSessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI27QueuedSessionViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI27QueuedSessionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
