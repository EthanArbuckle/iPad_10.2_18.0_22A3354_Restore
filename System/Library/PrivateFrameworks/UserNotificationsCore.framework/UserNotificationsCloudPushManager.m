@implementation UserNotificationsCloudPushManager

- (_TtC21UserNotificationsCore33UserNotificationsCloudPushManager)init
{
  _TtC21UserNotificationsCore33UserNotificationsCloudPushManager *result;

  result = (_TtC21UserNotificationsCore33UserNotificationsCloudPushManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_249A0242C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsCloudPushManager_sourceProvider, &qword_2544BCF38);
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  UNCKeyedDataStoreRepository *v6;
  UNCKeyedObservable *v7;
  UNCKeyedObservable *v8;
  _TtC21UserNotificationsCore33UserNotificationsCloudPushManager *v9;
  Swift::String v10;
  UNSNotificationCategoryRepository v11;

  v6 = (UNCKeyedDataStoreRepository *)sub_249B0253C();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  v11.super.isa = (Class)a3;
  v11._repository = v6;
  v11._observable = v8;
  UserNotificationsCloudPushManager.categoryRepository(_:didChangeCategoriesForBundleIdentifier:)(v11, v10);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
