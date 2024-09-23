@implementation NavigationInterceptionWindow

- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B28A210();
}

- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithWindowScene:(id)a3
{
  id v3;
  _TtC9SeymourUI28NavigationInterceptionWindow *result;

  v3 = a3;
  result = (_TtC9SeymourUI28NavigationInterceptionWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI28NavigationInterceptionWindow)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI28NavigationInterceptionWindow *result;

  result = (_TtC9SeymourUI28NavigationInterceptionWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_placeholderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_navigationController));
  swift_release();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_onRequestApplicationDeactivation));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI28NavigationInterceptionWindow_onRequestApplicationTermination));
}

@end
