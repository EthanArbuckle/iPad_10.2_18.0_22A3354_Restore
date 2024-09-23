@implementation AppleAccountDaemonManager

- (_TtC13appleaccountd25AppleAccountDaemonManager)init
{
  return (_TtC13appleaccountd25AppleAccountDaemonManager *)sub_1001593B0();
}

- (void).cxx_destruct
{
  sub_100006F58(&self->AAFService_opaque[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_loginResponseCache]);
  sub_100006F58(&self->AAFService_opaque[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_urlConfigurationManager]);
  sub_100006F58(&self->AAFService_opaque[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_storageController]);
}

- (NSString)serviceName
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(AADaemonMachService);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AADaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  uint64_t v5;
  uint64_t inited;
  id v7;
  _TtC13appleaccountd25AppleAccountDaemonManager *v8;
  _BYTE v9[40];

  v5 = sub_100007F40();
  inited = swift_initStackObject(v5, v9);
  *(_OWORD *)(inited + 16) = xmmword_100218E30;
  *(_QWORD *)(inited + 32) = sub_10015B478();
  v7 = a3;
  v8 = self;
  NSXPCInterface.aa_setClasses(_:for:argumentIndex:ofReply:)(inited, (uint64_t)"handleAppleAccountDeleteForAccount:completion:", 0, 0);
  swift_setDeallocating(inited);

}

- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC13appleaccountd25AppleAccountDaemonManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10015B0AC(v7, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)cacheLoginResponse:(AALoginAccountResponse *)a3 forAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  AALoginAccountResponse *v18;
  ACAccount *v19;
  _TtC13appleaccountd25AppleAccountDaemonManager *v20;
  uint64_t v21;
  uint64_t v22;

  v9 = sub_1000080B4((uint64_t *)&unk_100294B20);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (_QWORD *)swift_allocObject(&unk_10026AB88, 48, 7);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_10026ABB0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1002941E0;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject(&unk_10026ABD8, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1002941E8;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  v21 = sub_10015ACC8((uint64_t)v12, (uint64_t)&unk_1002941F0, (uint64_t)v17);
  swift_release(v21);
}

- (void)fetchCachedLoginResponseForAccount:(ACAccount *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  ACAccount *v16;
  _TtC13appleaccountd25AppleAccountDaemonManager *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_1000080B4((uint64_t *)&unk_100294B20);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject(&unk_10026AAE8, 40, 7);
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_10026AB10, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002941A8;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject(&unk_10026AB38, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10028E8A0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  v18 = sub_10015ACC8((uint64_t)v10, (uint64_t)&unk_10028E8A8, (uint64_t)v15);
  swift_release(v18);
}

- (void)urlConfigurationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13appleaccountd25AppleAccountDaemonManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10026AAC0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10015A974((uint64_t)sub_10015AB70, v5);

  swift_release(v5);
}

@end
