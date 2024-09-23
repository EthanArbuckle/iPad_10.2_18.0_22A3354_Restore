@implementation TabBarController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC9SeymourUI16TabBarController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _TtC9SeymourUI16TabBarController *result;

  v4 = OBJC_IVAR____TtC9SeymourUI16TabBarController_paletteView;
  v5 = qword_255B82680;
  v6 = a3;
  if (v5 != -1)
    swift_once();
  v7 = (void *)qword_255BAE650;
  v8 = objc_allocWithZone((Class)type metadata accessor for PaletteContainerView());
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_22B81FCC0(v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI16TabBarController_miniPlayerViewController) = 0;

  result = (_TtC9SeymourUI16TabBarController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI16TabBarController *v2;

  v2 = self;
  sub_22B5923E0();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI16TabBarController *v2;

  v2 = self;
  sub_22B5925CC();

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  void *v5;
  _TtC9SeymourUI16TabBarController *v7;

  v5 = a3;
  if (a3)
  {
    sub_22B0F1718(0, (unint64_t *)&qword_255B87240);
    v5 = (void *)sub_22BA808BC();
  }
  v7 = self;
  sub_22B592988(v5, a4);

  swift_bridgeObjectRelease();
}

- (_TtC9SeymourUI16TabBarController)initWithTabs:(id)a3
{
  _TtC9SeymourUI16TabBarController *result;

  result = (_TtC9SeymourUI16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI16TabBarController *result;

  v4 = a4;
  result = (_TtC9SeymourUI16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TabBarController_paletteView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TabBarController_miniPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TabBarController_miniPlayerHostPresenter));
  swift_unknownObjectRelease();
  swift_release();
}

@end
