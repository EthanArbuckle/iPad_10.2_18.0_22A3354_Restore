@implementation DeviceManager

- (void)fetchAADeviceRecordWithAddress:(id)a3 completion:(id)a4
{
  sub_1000A3B54(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1000A4308);
}

- (id)fetchAADeviceRecordSyncWithAddress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15audioaccessoryd13DeviceManager *v7;
  void *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1000A36A8(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)removeAADeviceRecordWithBluetoothAddress:(id)a3 completion:(id)a4
{
  sub_1000A3B54(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1000A46E8);
}

- (void)updateAADeviceRecordWithRecord:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC15audioaccessoryd13DeviceManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1000A49C4(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

+ (_TtC15audioaccessoryd13DeviceManager)singleton
{
  if (qword_100210150 != -1)
    swift_once(&qword_100210150, sub_1000B4764);
  return (_TtC15audioaccessoryd13DeviceManager *)(id)qword_100218C80;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue));
}

- (void)setClientQueue:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_clientQueue) = (Class)a3;
  v3 = a3;

}

- (_TtP15audioaccessoryd14DeviceManaging_)deviceDelegate
{
  return (_TtP15audioaccessoryd14DeviceManaging_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_deviceDelegate, a2);
}

- (void)setDeviceDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_deviceDelegate, a3);
}

- (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_)aaDeviceDelegate
{
  return (_TtP15audioaccessoryd28AudioAccessoryDeviceManaging_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_aaDeviceDelegate, a2);
}

- (void)setAaDeviceDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_aaDeviceDelegate, a3);
}

- (_TtC15audioaccessoryd13DeviceManager)init
{
  return (_TtC15audioaccessoryd13DeviceManager *)sub_1000B4C34();
}

- (void)dealloc
{
  _TtC15audioaccessoryd13DeviceManager *v2;
  uint64_t v3;
  objc_super v4;

  v2 = self;
  v3 = static os_log_type_t.default.getter(v2);
  if (qword_1002101D8 != -1)
    swift_once(&qword_1002101D8, sub_100168748);
  os_log(_:dso:log:_:_:)(v3, &_mh_execute_header, qword_100218DE0, "DeviceManager deinit", 20, 2, _swiftEmptyArrayStorage);
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for DeviceManager();
  -[DeviceManager dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_firstUnlockStateWatcher));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager____lazy_storage___deviceStore));
  sub_1000C7298((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_deviceDelegate);
  sub_1000C7298((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd13DeviceManager_aaDeviceDelegate);
}

- (void)deactivate
{
  _TtC15audioaccessoryd13DeviceManager *v2;

  v2 = self;
  sub_1000B5A28();

}

- (void)fetchCached
{
  _TtC15audioaccessoryd13DeviceManager *v2;

  v2 = self;
  sub_1000B5BB0();

}

- (void)fetchDeviceRecordsWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E85A0, (uint64_t)sub_1000C71FC, (void (*)(uint64_t, uint64_t))sub_1000B625C);
}

- (void)fetchDeviceWithAddress:(id)a3 completion:(id)a4
{
  sub_1000BA0A0(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1001E8578, (uint64_t)sub_1000A4EB8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000B7298);
}

- (id)fetchDeviceSyncWithAddress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15audioaccessoryd13DeviceManager *v7;
  void *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1000B7C2C(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)addAccountMagicKeysWithCloudRecord:(id)a3
{
  id v4;
  _TtC15audioaccessoryd13DeviceManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000B832C(v4);

}

- (void)deleteAccountMagicKeys
{
  _TtC15audioaccessoryd13DeviceManager *v2;

  v2 = self;
  sub_1000B8628();

}

- (void)fetchAccountMagicKeysBlobWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E8550, (uint64_t)sub_1000C755C, (void (*)(uint64_t, uint64_t))sub_1000B88E0);
}

- (void)addDeviceWithRecord:(id)a3 completion:(id)a4
{
  sub_1000B9580(self, (int)a2, a3, a4, (uint64_t)&unk_1001E8528, (uint64_t)sub_1000A4F20, (void (*)(id, uint64_t, uint64_t))sub_1000B8B90);
}

- (void)updateDeviceWithRecord:(id)a3 completion:(id)a4
{
  sub_1000B9580(self, (int)a2, a3, a4, (uint64_t)&unk_1001E8500, (uint64_t)sub_1000A4F20, (void (*)(id, uint64_t, uint64_t))sub_1000B90B0);
}

- (void)removeDeviceWithRecord:(id)a3 completion:(id)a4
{
  sub_1000B9580(self, (int)a2, a3, a4, (uint64_t)&unk_1001E84D8, (uint64_t)sub_1000A4F20, (void (*)(id, uint64_t, uint64_t))sub_1000B9610);
}

- (void)removeDeviceWithBluetoothAddress:(id)a3 completion:(id)a4
{
  sub_1000BA0A0(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1001E84B0, (uint64_t)sub_1000A4F20, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000B9E6C);
}

- (void)fetchDeviceSupportInformationRecordsWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E8488, (uint64_t)sub_1000C71D4, (void (*)(uint64_t, uint64_t))sub_1000BA148);
}

- (void)fetchDeviceSupportInformationRecordWithAddress:(id)a3 completion:(id)a4
{
  sub_1000BA0A0(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1001E8460, (uint64_t)sub_1000C7814, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000BB3BC);
}

- (void)addDeviceSupportInformationWithRecord:(id)a3 completion:(id)a4
{
  sub_1000B9580(self, (int)a2, a3, a4, (uint64_t)&unk_1001E8438, (uint64_t)sub_1000A4F20, (void (*)(id, uint64_t, uint64_t))sub_1000BCF20);
}

- (void)updateDeviceSupportInformationWithDevice:(id)a3 completion:(id)a4
{
  sub_1000B9580(self, (int)a2, a3, a4, (uint64_t)&unk_1001E8410, (uint64_t)sub_1000A4F20, (void (*)(id, uint64_t, uint64_t))sub_1000BD7C8);
}

- (void)removeDeviceSupportInformationWithBluetoothAddress:(id)a3 completion:(id)a4
{
  sub_1000BA0A0(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1001E83E8, (uint64_t)sub_1000A4F20, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000BDC98);
}

- (void)addLegacyMagicPairingRecordsWithCloudRecord:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC15audioaccessoryd13DeviceManager *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1001E83C0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  sub_1000BDEC8(v10, a4, (uint64_t)sub_1000A4F20, v9);

  swift_release(v9);
}

- (void)deleteLegacyMagicPairingRecordsWithUserInitiated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC15audioaccessoryd13DeviceManager *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1001E8398, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_1000BE240(a3, (uint64_t)sub_1000A4F20, v7);

  swift_release(v7);
}

- (void)fetchLegacyMagicPairingRecordsWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E8370, (uint64_t)sub_1000C71CC, (void (*)(uint64_t, uint64_t))sub_1000BE590);
}

- (void)fetchMagicPairingSettingsRecordsWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E8348, (uint64_t)sub_1000C71A4, (void (*)(uint64_t, uint64_t))sub_1000BE884);
}

- (void)fetchMagicSettingsRecordWithAddress:(id)a3 completion:(id)a4
{
  sub_1000BA0A0(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1001E8320, (uint64_t)sub_1000C7814, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000BF1FC);
}

- (void)addDeviceMagicSettingsWithRecord:(id)a3 completion:(id)a4
{
  sub_1000B9580(self, (int)a2, a3, a4, (uint64_t)&unk_1001E82F8, (uint64_t)sub_1000A4F20, (void (*)(id, uint64_t, uint64_t))sub_1000BFC00);
}

- (void)updateDeviceMagicSettingsWithMagicPairingSettings:(id)a3 completion:(id)a4
{
  sub_1000B9580(self, (int)a2, a3, a4, (uint64_t)&unk_1001E82D0, (uint64_t)sub_1000A4F20, (void (*)(id, uint64_t, uint64_t))sub_1000C04A8);
}

- (void)removeDeviceMagicSettingsWithBluetoothAddress:(id)a3 completion:(id)a4
{
  sub_1000BA0A0(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1001E82A8, (uint64_t)sub_1000A4F20, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000C0D4C);
}

- (id)createSoundProfileRecordStagingURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC15audioaccessoryd13DeviceManager *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1000C16A4((uint64_t)v6);

  URL._bridgeToObjectiveC()(v8);
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v10;
}

- (void)addSoundProfileRecordWithURL:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC15audioaccessoryd13DeviceManager *v13;
  uint64_t v14;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1001E8280, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_1000C1994((uint64_t)v10, (uint64_t)sub_1000A4F20, v12);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E8258, (uint64_t)sub_1000C7558, (void (*)(uint64_t, uint64_t))sub_1000C1FA0);
}

- (void)fetchSoundProfileRecordFromCloudWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E8230, (uint64_t)sub_1000C719C, (void (*)(uint64_t, uint64_t))sub_1000C2440);
}

- (void)removeSoundProfileRecordWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E8208, (uint64_t)sub_1000A4F20, (void (*)(uint64_t, uint64_t))sub_1000C29F4);
}

- (void)resetCachedDataWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E81E0, (uint64_t)sub_1000A4F20, (void (*)(uint64_t, uint64_t))sub_1000C2D04);
}

- (void)resetCloudDataWithCompletion:(id)a3
{
  sub_1000B8AC0(self, (int)a2, a3, (uint64_t)&unk_1001E81B8, (uint64_t)sub_1000A4CB8, (void (*)(uint64_t, uint64_t))sub_1000C2FB0);
}

- (id)cloudAccountInfo
{
  _TtC15audioaccessoryd13DeviceManager *v2;
  char *v3;

  v2 = self;
  v3 = sub_1000C3A80();

  return v3;
}

- (id)printDebug
{
  _TtC15audioaccessoryd13DeviceManager *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  NSString v7;

  v2 = self;
  v3 = sub_1000B4AC8();
  sub_1000C3D2C(v3);
  v5 = v4;
  swift_release(v3);
  v6._countAndFlagsBits = 2570;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return v7;
}

- (void)fetchAAProxCardsInfoWithAddress:(id)a3 completion:(id)a4
{
  sub_1000A3B54(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10010EB20);
}

- (id)fetchAAProxCardsInfoSyncWithAddress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15audioaccessoryd13DeviceManager *v7;
  void *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_10010DD1C(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)removeAAProxCardsInfoWithBluetoothAddress:(id)a3 completion:(id)a4
{
  sub_1000A3B54(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10010EDC0);
}

- (void)updateAAProxCardsInfoWithProxCardsInfo:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC15audioaccessoryd13DeviceManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10010F09C(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

@end
