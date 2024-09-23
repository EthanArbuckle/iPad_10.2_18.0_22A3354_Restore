@implementation RavioliManagerObjC

+ (_TtC3asd18RavioliManagerObjC)shared
{
  return (_TtC3asd18RavioliManagerObjC *)static RavioliManagerObjC.shared.getter();
}

- (_TtC3asd18RavioliManagerObjC)init
{
  return (_TtC3asd18RavioliManagerObjC *)sub_100062120();
}

- (void)triggerRavioliFetchWithBagID:(id)a3 notificationId:(id)a4 completion:(id)a5
{
  sub_100062F9C();
}

- (void)triggerImmediateRavioliFetchWithBagID:(id)a3 notificationId:(id)a4 completion:(id)a5
{
  sub_100062F9C();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd18RavioliManagerObjC_manager));
}

@end
