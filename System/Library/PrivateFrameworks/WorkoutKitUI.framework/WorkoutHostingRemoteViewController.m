@implementation WorkoutHostingRemoteViewController

- (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC12WorkoutKitUI34WorkoutHostingRemoteViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController) = 0;
  v5 = a3;

  result = (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController *)sub_24A633924();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC12WorkoutKitUI34WorkoutHostingRemoteViewController *v2;

  v2 = self;
  sub_24A632018();

}

- (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12WorkoutKitUI34WorkoutHostingRemoteViewController *result;

  v4 = a4;
  result = (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_workout;
  v4 = sub_24A6338E8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_24A631B1C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController));
}

@end
