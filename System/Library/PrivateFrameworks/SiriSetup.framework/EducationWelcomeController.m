@implementation EducationWelcomeController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SiriSetup26EducationWelcomeController *v4;

  v4 = self;
  sub_22775605C(a3);

}

- (void)continueTapped
{
  _TtC9SiriSetup26EducationWelcomeController *v2;

  v2 = self;
  sub_22775629C();

}

- (_TtC9SiriSetup26EducationWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9SiriSetup26EducationWelcomeController *result;

  result = (_TtC9SiriSetup26EducationWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup26EducationWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9SiriSetup26EducationWelcomeController *result;

  v6 = a5;
  result = (_TtC9SiriSetup26EducationWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_orbView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController));
}

@end
