@implementation TabNavigationController

- (_TtC5Music23TabNavigationController)initWithCoder:(id)a3
{
  id v5;
  _TtC5Music23TabNavigationController *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Music23TabNavigationController__tabBarController, 0);
  v5 = a3;

  result = (_TtC5Music23TabNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/TabNavigationController.swift", 35, 2, 96, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  -[NavigationController viewDidLoad](&v2, "viewDidLoad");
}

- (_TtC5Music23TabNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC5Music23TabNavigationController *result;

  result = (_TtC5Music23TabNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Music.TabNavigationController", 29, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Music23TabNavigationController_tabDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23TabNavigationController_rootTabElement));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23TabNavigationController_activeStackElement));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Music23TabNavigationController_tabElementStacks));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Music23TabNavigationController__tabBarController, v3);
}

@end
