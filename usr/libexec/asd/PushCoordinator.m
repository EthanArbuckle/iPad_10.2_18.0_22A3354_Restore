@implementation PushCoordinator

+ (_TtC3asd15PushCoordinator)shared
{
  return (_TtC3asd15PushCoordinator *)static PushCoordinator.shared.getter();
}

+ (void)configurePush
{
  static PushCoordinator.configurePush()();
}

- (_TtC3asd15PushCoordinator)init
{
  return (_TtC3asd15PushCoordinator *)sub_10007A6B4();
}

- (void)registerICloud
{
  _TtC3asd15PushCoordinator *v2;

  v2 = self;
  PushCoordinator.registerICloud()();

}

- (void)unregister
{
  _TtC3asd15PushCoordinator *v2;

  v2 = self;
  PushCoordinator.unregister()();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd15PushCoordinator_pushServiceManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd15PushCoordinator_pdsManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd15PushCoordinator_cloudChannelManager));
}

@end
