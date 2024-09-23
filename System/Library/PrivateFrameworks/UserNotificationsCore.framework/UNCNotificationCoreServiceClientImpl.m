@implementation UNCNotificationCoreServiceClientImpl

- (UNCNotificationCoreServiceClientDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___UNCNotificationCoreServiceClientImpl_delegate;
  swift_beginAccess();
  return (UNCNotificationCoreServiceClientDelegate *)(id)MEMORY[0x24BCFF16C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (UNCNotificationCoreServiceClientImpl)init
{
  return (UNCNotificationCoreServiceClientImpl *)NotificationCoreServiceClient.init()();
}

- (void)dealloc
{
  UNCNotificationCoreServiceClientImpl *v2;

  v2 = self;
  NotificationCoreServiceClient.__deallocating_deinit();
}

- (void).cxx_destruct
{

  sub_249A03038((uint64_t)self + OBJC_IVAR___UNCNotificationCoreServiceClientImpl_delegate);
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  sub_249AA10CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, qword_2544BDC20, (uint64_t)off_251AD8DD8, (void (*)(uint64_t, uint64_t, uint64_t))sub_249A9E0B0);
}

- (id)allBundleIdentifiersForNotifications
{
  return sub_249AA0A08(self);
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  return sub_249AA0EA4(self, (uint64_t)a2, (uint64_t)a3, &qword_2578B3EA8, (uint64_t)sub_249AA27B0, (unint64_t *)&qword_2578B23B0);
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_249AA0C50(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t *)&unk_2578B3EB0);
}

- (void)save:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  UNCNotificationCoreServiceClientImpl *v18;

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
  v17 = a4;
  v18 = self;
  sub_249A9E3B0(v16, a4, a5, v12, v14, (uint64_t)v11, v15);
  sub_2499AAB44((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (void)save:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  UNCNotificationCoreServiceClientImpl *v17;
  uint64_t v18;

  v6 = a4;
  v9 = sub_249B01AA4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B01A80();
  v13 = sub_249B0253C();
  v15 = v14;
  v16 = a3;
  v17 = self;
  sub_249A9EA2C(v16, v6, (uint64_t)v12, v13, v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)removeNotificationRecordsForIdentifiersWithIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UNCNotificationCoreServiceClientImpl *v9;

  v5 = sub_249B02668();
  v6 = sub_249B0253C();
  v8 = v7;
  v9 = self;
  sub_249A9EF98(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  sub_249AA10CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (unint64_t *)&qword_2578B23B0, (uint64_t)off_251AD8FB0, (void (*)(uint64_t, uint64_t, uint64_t))sub_249A9F300);
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  sub_249AA086C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_249A9F424);
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  sub_249AA086C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_249A9F48C);
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  sub_249AA086C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_249A9F6E8);
}

- (void)removeStoreForBundleIdentifier:(id)a3
{
  sub_249AA086C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_249A9F750);
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  UNCNotificationCoreServiceClientImpl *v3;
  void *v6;

  sub_249B0253C();
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(qword_2578B4EA0);
  sub_249B028E4();

  swift_bridgeObjectRelease();
  return v6;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UNCNotificationCoreServiceClientImpl *v12;
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
  sub_249A9F978(a3, v8, v10, (uint64_t)v7, v11);
  sub_2499AAB44((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UNCNotificationCoreServiceClientImpl *v12;

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
  sub_249A9FDF0(a3, v8, v10, (uint64_t)v7, v11);
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
  UNCNotificationCoreServiceClientImpl *v14;

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
  sub_249AA0280(v8, (uint64_t)a3, v10, v12, (uint64_t)v7, v13);
  sub_2499AAB44((uint64_t)v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)categoryRepositoryDidChangeCategories:(id)a3
{
  sub_249AA086C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_249AA074C);
}

- (id)allBundleIdentifiersForCategories
{
  return sub_249AA0A08(self);
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return sub_249AA0C50(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &qword_2544BD250);
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return sub_249AA0EA4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_2544B7D08, (uint64_t)sub_249AA2788, (unint64_t *)&qword_2544BDBE0);
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  sub_249AA10CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (unint64_t *)&qword_2544BDBE0, (uint64_t)off_251AD8DC0, (void (*)(uint64_t, uint64_t, uint64_t))sub_249AA0F74);
}

- (void)performAction:(id)a3 forNotification:(id)a4 inApp:(id)a5 withUserText:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  UNCNotificationCoreServiceClientImpl *v19;

  v8 = sub_249B0253C();
  v10 = v9;
  v11 = sub_249B0253C();
  v13 = v12;
  v14 = sub_249B0253C();
  v16 = v15;
  if (a6)
  {
    v17 = sub_249B0253C();
    a6 = v18;
  }
  else
  {
    v17 = 0;
  }
  v19 = self;
  sub_249AA1160(v8, v10, v11, v13, v14, v16, v17, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
