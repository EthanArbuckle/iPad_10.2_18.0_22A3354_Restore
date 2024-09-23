@implementation RemoteBadgeService

- (_TtC21UserNotificationsCore18RemoteBadgeService)init
{
  _TtC21UserNotificationsCore18RemoteBadgeService *result;

  result = (_TtC21UserNotificationsCore18RemoteBadgeService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore18RemoteBadgeService_systemServiceClient));
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  _TtC21UserNotificationsCore18RemoteBadgeService *v4;
  void *v6;

  sub_249B0253C();
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(qword_2578B4EA0);
  sub_249B028E4();

  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)setBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  _TtC21UserNotificationsCore18RemoteBadgeService *v7;
  id v8;
  _TtC21UserNotificationsCore18RemoteBadgeService *v9;
  char v10;
  _OWORD v12[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_249B02A04();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v8 = a4;
    v9 = self;
  }
  sub_249B0253C();

  v10 = sub_249AECB74((uint64_t)v12);
  swift_bridgeObjectRelease();
  sub_2499B1CA0((uint64_t)v12);
  return v10 & 1;
}

@end
