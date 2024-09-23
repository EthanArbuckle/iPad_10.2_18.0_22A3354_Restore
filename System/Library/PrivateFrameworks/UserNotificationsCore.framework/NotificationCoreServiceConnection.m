@implementation NotificationCoreServiceConnection

- (void)dealloc
{
  void *v2;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_connection);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for NotificationCoreServiceConnection();
  -[NotificationCoreServiceConnection dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_connection));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_delegate);
}

- (_TtC21UserNotificationsCore33NotificationCoreServiceConnection)init
{
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *result;

  result = (_TtC21UserNotificationsCore33NotificationCoreServiceConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v4;
  void *v5;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v6;
  void *v7;
  void *v8;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v9;

  sub_2499ABC2C(0, qword_2544BDC20);
  sub_249B02668();
  sub_249B0253C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = self;
    swift_unknownObjectRetain();
    v7 = (void *)sub_249B0265C();
    v8 = (void *)sub_249B02530();
    objc_msgSend(v5, sel_notifyDidPerformUpdates_forBundleIdentifier_, v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    v9 = self;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

}

- (id)allBundleIdentifiersForNotifications
{
  return sub_249AE68A0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  return sub_249AE6A2C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository, (SEL *)&selRef_notificationRecordsForBundleIdentifier_, (unint64_t *)&qword_2578B23B0);
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_249AE6938((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository, (SEL *)&selRef_notificationRecordForIdentifier_bundleIdentifier_);
}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(id)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v18;
  id v19;

  v11 = _Block_copy(a7);
  v12 = sub_249B0253C();
  v14 = v13;
  if (v11)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v11;
    v11 = sub_249AA2668;
  }
  else
  {
    v15 = 0;
  }
  v16 = a3;
  v17 = a5;
  v18 = self;
  v19 = a4;
  sub_249AE5C54((uint64_t)v16, (uint64_t)a4, v17, v12, v14, (uint64_t)v11, v15);
  sub_2499AAB44((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(id)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  id v14;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = sub_249B01AA4();
  v9 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B01A80();
  sub_249B0253C();
  v12 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = objc_msgSend(v14, sel_BOOLValue);
  v17 = (void *)sub_249B01A2C();
  v18 = (void *)sub_249B02530();
  objc_msgSend(v12, sel_saveNotificationRequest_shouldRepost_apsMessageTimestamp_forBundleIdentifier_, v13, v16, v17, v18);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5;
  void *v6;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v7;
  void *v8;
  id v9;

  v5 = sub_249B02668();
  sub_249B0253C();
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
  v7 = self;
  sub_249A775A4(v5);
  v8 = (void *)sub_249B027E8();
  swift_bridgeObjectRelease();
  v9 = (id)sub_249B02530();
  objc_msgSend(v6, sel_removeNotificationRecordsForIdentifiers_bundleIdentifier_, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  sub_249AE6B34((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (unint64_t *)&qword_2578B23B0, (uint64_t)off_251AD8FB0, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository, (SEL *)&selRef_removeSimilarNotificationRecords_bundleIdentifier_);
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  sub_249AE6180((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier_);
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  sub_249AE6180((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeInvalidNotificationRecordsForBundleIdentifier_);
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  sub_249AE6180((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeAllNotificationRecordsForBundleIdentifier_);
}

- (void)removeStoreForBundleIdentifier:(id)a3
{
  sub_249AE6180((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeStoreForBundleIdentifier_);
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  void *v4;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v5;
  void *v6;
  id v7;

  sub_249B0253C();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_notificationRepository);
  v5 = self;
  v6 = (void *)sub_249B02530();
  v7 = objc_msgSend(v4, sel_badgeNumberForBundleIdentifier_, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v12;
  id v13;

  v7 = (uint64_t (*)())_Block_copy(a5);
  v8 = sub_249B0253C();
  v10 = v9;
  if (v7)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v7;
    v7 = sub_2499B1FF8;
  }
  else
  {
    v11 = 0;
  }
  v12 = self;
  v13 = a3;
  sub_249AE6298((uint64_t)a3, v8, v10, v7, v11);
  sub_2499AAB44((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v13;

  v7 = (uint64_t (*)())_Block_copy(a5);
  v8 = sub_249B0253C();
  v10 = v9;
  if (v7)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v7;
    v7 = sub_2499B1FF8;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = self;
  sub_249AE6438(v12, v8, v10, v7, v11);
  sub_2499AAB44((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v14;

  v7 = _Block_copy(a5);
  if (a3)
  {
    v8 = sub_249B0253C();
    a3 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = sub_249B0253C();
  v12 = v11;
  if (v7)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v7;
    v7 = sub_2499AA044;
  }
  else
  {
    v13 = 0;
  }
  v14 = self;
  sub_249AE65E8(v8, (uint64_t)a3, v10, v12, v7, v13);
  sub_2499AAB44((uint64_t)v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  _TtC21UserNotificationsCore33NotificationCoreServiceConnection *v6;
  id v7;

  sub_249B0253C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = self;
    swift_unknownObjectRetain();
    v7 = (id)sub_249B02530();
    objc_msgSend(v5, sel_notifyDidChangeCategoriesForBundleIdentifier_, v7);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)allBundleIdentifiersForCategories
{
  return sub_249AE68A0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_categoryRepository);
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_249AE6938((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_categoryRepository, (SEL *)&selRef_categoryWithIdentifier_bundleIdentifier_);
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return sub_249AE6A2C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_categoryRepository, (SEL *)&selRef_categoriesForBundleIdentifier_, (unint64_t *)&qword_2544BDBE0);
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  sub_249AE6B34((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (unint64_t *)&qword_2544BDBE0, (uint64_t)off_251AD8DC0, &OBJC_IVAR____TtC21UserNotificationsCore33NotificationCoreServiceConnection_categoryRepository, (SEL *)&selRef_setCategories_forBundleIdentifier_);
}

@end
