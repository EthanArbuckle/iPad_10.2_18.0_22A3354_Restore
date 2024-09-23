@implementation ASXPCActivityManager

+ (_TtC3asd20ASXPCActivityManager)shared
{
  return (_TtC3asd20ASXPCActivityManager *)static ASXPCActivityManager.shared.getter();
}

- (void)registerWithActivity:(int64_t)a3
{
  _TtC3asd20ASXPCActivityManager *v4;

  v4 = self;
  ASXPCActivityManager.register(activity:)(a3);

}

- (_TtC3asd20ASXPCActivityManager)init
{
  ASXPCActivityManager.init()();
}

- (void).cxx_destruct
{
  sub_100032F94((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd20ASXPCActivityManager_analyticsManager));
}

@end
