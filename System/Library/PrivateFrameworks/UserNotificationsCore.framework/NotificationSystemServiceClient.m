@implementation NotificationSystemServiceClient

- (_TtC21UserNotificationsCore31NotificationSystemServiceClient)init
{
  return (_TtC21UserNotificationsCore31NotificationSystemServiceClient *)sub_249AF8040();
}

- (void)dealloc
{
  _TtC21UserNotificationsCore31NotificationSystemServiceClient *v2;

  v2 = self;
  sub_249AF8270();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection));
}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC21UserNotificationsCore31NotificationSystemServiceClient *v7;

  v4 = sub_249B0253C();
  v6 = v5;
  v7 = self;
  sub_249AF8738(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC21UserNotificationsCore31NotificationSystemServiceClient *v9;

  v5 = sub_249B02668();
  v6 = sub_249B0253C();
  v8 = v7;
  v9 = self;
  sub_249AF8A20(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)allBundleIdentifiersForCategories
{
  _TtC21UserNotificationsCore31NotificationSystemServiceClient *v2;
  void *v3;

  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544BE480);
  sub_249B028E4();

  v3 = (void *)sub_249B0265C();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  _TtC21UserNotificationsCore31NotificationSystemServiceClient *v4;
  void *v7;

  sub_249B0253C();
  sub_249B0253C();
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544BD250);
  sub_249B028E4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  _TtC21UserNotificationsCore31NotificationSystemServiceClient *v3;
  void *v4;

  sub_249B0253C();
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544B7D08);
  sub_249B028E4();

  swift_bridgeObjectRelease();
  sub_2499ABC2C(0, (unint64_t *)&qword_2544BDBE0);
  v4 = (void *)sub_249B0265C();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC21UserNotificationsCore31NotificationSystemServiceClient *v9;

  sub_2499ABC2C(0, (unint64_t *)&qword_2544BDBE0);
  v5 = sub_249B02668();
  v6 = sub_249B0253C();
  v8 = v7;
  v9 = self;
  sub_249AF91CC(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
