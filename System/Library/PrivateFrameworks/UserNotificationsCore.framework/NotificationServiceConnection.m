@implementation NotificationServiceConnection

- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2499AF97C);
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  sub_2499AD060(self, (int)a2, a3, (int)a4, a5, (void (*)(void *, uint64_t, uint64_t, id, void *))sub_2499AD108);
}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2499AC45C);
}

- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2499ACA40);
}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t (*v5)();
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v10;

  v5 = (uint64_t (*)())_Block_copy(a4);
  v6 = sub_249B0253C();
  v8 = v7;
  if (v5)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v5;
    v5 = sub_2499A99A0;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  sub_2499AAB54(v6, v8, (void (*)(_QWORD, _QWORD))v5, v9);
  sub_2499AAB44((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v8;

  sub_2499ABC2C(0, &qword_2544BD588);
  sub_2499ABC64((unint64_t *)&unk_2544BD590, &qword_2544BD588);
  sub_249B027F4();
  v5 = sub_249B0253C();
  v7 = v6;
  v8 = self;
  os_transaction_create();
  sub_2499AB730(v8, v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v11;

  v7 = _Block_copy(a5);
  v8 = sub_249B0253C();
  v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_2499ABDF4(a3, v8, v10, v11, (void (**)(_QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_2499AA098);
}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  sub_2499AD060(self, (int)a2, a3, (int)a4, a5, (void (*)(void *, uint64_t, uint64_t, id, void *))sub_2499A9A30);
}

- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v11;

  v6 = _Block_copy(a5);
  sub_2499ABC2C(0, &qword_2544B7768);
  sub_2499ABC64(&qword_2544B7790, &qword_2544B7768);
  v7 = sub_249B027F4();
  v8 = sub_249B0253C();
  v10 = v9;
  _Block_copy(v6);
  v11 = self;
  sub_2499A9170(v7, v8, v10, v11, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCore29NotificationServiceConnection)init
{
  _TtC21UserNotificationsCore29NotificationServiceConnection *result;

  result = (_TtC21UserNotificationsCore29NotificationServiceConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_clientConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_clientAuditToken));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore29NotificationServiceConnection_queue_serverConnection));
}

- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v9;

  v6 = sub_249B0253C();
  v8 = v7;
  v9 = self;
  os_transaction_create();
  sub_249A5E344(v9, v6, v8, a3);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v12;

  v7 = _Block_copy(a5);
  v8 = sub_249B0253C();
  v10 = v9;
  _Block_copy(v7);
  v11 = a3;
  v12 = self;
  sub_249A61BDC((uint64_t)v11, v8, v10, v12, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6
{
  uint64_t (*v8)();
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v17;

  v8 = (uint64_t (*)())_Block_copy(a6);
  v9 = sub_249B0253C();
  v11 = v10;
  v12 = sub_249B0253C();
  v14 = v13;
  if (v8)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v8;
    v8 = sub_2499B1FF8;
  }
  else
  {
    v15 = 0;
  }
  v16 = a5;
  v17 = self;
  sub_249A5E95C(v9, v11, v12, v14, (uint64_t)v16, (void (*)(_QWORD))v8, v15);
  sub_2499AAB44((uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v8;

  sub_2499ABC2C(0, &qword_2544B7760);
  sub_249B02668();
  v5 = sub_249B0253C();
  v7 = v6;
  v8 = self;
  os_transaction_create();
  sub_249A5F000(v8, v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_249A621B4);
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v12;

  v6 = (uint64_t (*)())_Block_copy(a5);
  v7 = sub_249B02668();
  v8 = sub_249B0253C();
  v10 = v9;
  if (v6)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v6;
    v6 = sub_2499A99A0;
  }
  else
  {
    v11 = 0;
  }
  v12 = self;
  sub_249A5F5B4(v7, v8, v10, (void (*)(_QWORD, _QWORD))v6, v11);
  sub_2499AAB44((uint64_t)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v12;

  v6 = (uint64_t (*)())_Block_copy(a5);
  sub_2499ABC2C(0, &qword_2544B7760);
  v7 = sub_249B02668();
  v8 = sub_249B0253C();
  v10 = v9;
  if (v6)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v6;
    v6 = sub_2499A99A0;
  }
  else
  {
    v11 = 0;
  }
  v12 = self;
  sub_249A5FC40(v7, v8, v10, (void (*)(_QWORD, _QWORD))v6, v11);
  sub_2499AAB44((uint64_t)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_249A62774);
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v12;

  v6 = (uint64_t (*)())_Block_copy(a5);
  v7 = sub_249B02668();
  v8 = sub_249B0253C();
  v10 = v9;
  if (v6)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v6;
    v6 = sub_2499A99A0;
  }
  else
  {
    v11 = 0;
  }
  v12 = self;
  sub_249A603D4(v7, v8, v10, (void (*)(_QWORD, _QWORD))v6, v11);
  sub_2499AAB44((uint64_t)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t (*v5)();
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v10;

  v5 = (uint64_t (*)())_Block_copy(a4);
  v6 = sub_249B0253C();
  v8 = v7;
  if (v5)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v5;
    v5 = sub_2499A99A0;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  sub_249A60A60(v6, v8, (void (*)(_QWORD, _QWORD))v5, v9);
  sub_2499AAB44((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v13;

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
  _Block_copy(v7);
  v13 = self;
  sub_249A62D34(v8, (uint64_t)a3, v10, v12, v13, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_249A63334);
}

- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  sub_2499AC3D0(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_249A63954);
}

- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v10;

  v5 = _Block_copy(a4);
  v6 = sub_249B0253C();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_249A61190(v6, v8, (uint64_t)sub_249A61BD0, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC21UserNotificationsCore29NotificationServiceConnection *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = sub_249B019E4();
  v10 = v9;

  sub_249B0253C();
  sub_249A61930();
  swift_bridgeObjectRelease();
  sub_249A06D1C(v8, v10);

}

@end
