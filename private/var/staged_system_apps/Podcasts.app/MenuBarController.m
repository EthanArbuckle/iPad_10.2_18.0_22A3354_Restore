@implementation MenuBarController

- (UIResponder)nextResponder
{
  return (UIResponder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Podcasts17MenuBarController_globalActionController));
}

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC8Podcasts17MenuBarController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100220C34(a3, (uint64_t)v5);
  swift_unknownObjectRelease(a3);

}

- (_TtC8Podcasts17MenuBarController)init
{
  _TtC8Podcasts17MenuBarController *result;

  result = (_TtC8Podcasts17MenuBarController *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.MenuBarController", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Podcasts17MenuBarController_globalActionController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts17MenuBarController_menuBarPresenter));
}

@end
