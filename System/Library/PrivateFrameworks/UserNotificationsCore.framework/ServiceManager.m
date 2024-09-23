@implementation ServiceManager

- (_TtC21UserNotificationsCore14ServiceManager)init
{
  return (_TtC21UserNotificationsCore14ServiceManager *)ServiceManager.init()();
}

- (void).cxx_destruct
{
  sub_249A0242C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_workingDirectory, (uint64_t *)&unk_2544BCEF0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_notificationService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_settingsPersistenceListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_contentProtectionManager));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_coreServiceClient));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_systemServiceClient));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_attachmentsRepository));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_idsCloudReceiver));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_cloudSenderPriorityObserver));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  _TtC21UserNotificationsCore14ServiceManager *v4;

  v4 = self;
  ServiceManager.contentProtectionStateChanged(forFirstUnlock:)(a3);

}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC21UserNotificationsCore14ServiceManager *v11;

  sub_2499ABC2C(0, qword_2544BDC20);
  v7 = sub_249B02668();
  v8 = sub_249B0253C();
  v10 = v9;
  swift_unknownObjectRetain();
  v11 = self;
  ServiceManager.notificationRepository(_:didPerform:forBundleIdentifier:)((uint64_t)a3, v7, v8, v10);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TtC21UserNotificationsCore14ServiceManager *v9;
  id v10;

  v5 = sub_249B0253C();
  v7 = v6;
  objc_opt_self();
  if (swift_dynamicCastObjCClass()
    || (v8 = *(Class *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC21UserNotificationsCore14ServiceManager_systemServiceClient)) == 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain();
    v9 = self;
    v10 = v8;
    sub_249AF8738(v5, v7);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
}

- (NSString)description
{
  _TtC21UserNotificationsCore14ServiceManager *v2;
  void *v3;

  v2 = self;
  ServiceManager.description.getter();

  v3 = (void *)sub_249B02530();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
