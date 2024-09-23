@implementation MCCSecretAgentService

- (_TtC15icloudmailagent21MCCSecretAgentService)init
{
  return (_TtC15icloudmailagent21MCCSecretAgentService *)sub_10001C080();
}

- (void)pingWithcompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _TtC15icloudmailagent21MCCSecretAgentService *v11;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = qword_10003A9D8;
  v11 = self;
  if (v5 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_1000073A0(v6, (uint64_t)qword_10003B300);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "MCCSecretAgentService ping", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  (*((void (**)(void *, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)generateCertificateWithContext:(id)a3 completion:(id)a4
{
  sub_10000DAB8(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10001CDB4);
}

- (void)listCertificatesWithCompletion:(id)a3
{
  sub_10001C81C(self, (int)a2, a3, "MCCSecretAgentService listCertificatesWithCompletion is called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_certificateManager, (void (*)(uint64_t, void *))sub_100012F24);
}

- (void)listCertificatesForEmail:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC15icloudmailagent21MCCSecretAgentService *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_10001CECC(v7, v9, (uint64_t)v10, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)fetchSigningAndEncryptingStatusForEmailAddress:(id)a3 completion:(id)a4
{
  sub_10001C4F0(self, (int)a2, (uint64_t)a3, a4, "MCCSecretAgentService fetchSigningAndEncryptingStatus is called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_cloudKitKVSManager, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_10000AD6C);
}

- (void)fetchSigningAndEncrytionMessagesStatusForEmailAddress:(id)a3 completion:(id)a4
{
  sub_10001C4F0(self, (int)a2, (uint64_t)a3, a4, "MCCSecretAgentService fetchSigningAndEncrytionMessagesStatusForAddress is called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_cloudKitKVSManager, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_10000B56C);
}

- (void)setEncryptIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  sub_10001C5DC(self, (int)a2, a3, (uint64_t)a4, a5, "MCCSecretAgentService setEncryptIsEnabled:forAddress: is called", (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, void *))sub_10000B9E4);
}

- (void)setSignIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  sub_10001C5DC(self, (int)a2, a3, (uint64_t)a4, a5, "MCCSecretAgentService setSignIsEnabled:forAddress: is called", (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, void *))sub_10000B980);
}

- (void)setSigningAndEncrytingStatusTo:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  sub_10001C5DC(self, (int)a2, a3, (uint64_t)a4, a5, "MCCSecretAgentService setSigningAndEncrytingStatus is called", (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, void *))sub_10000AFE4);
}

- (void)updateCertificateDefaultsForEmailAddress:(id)a3 certInfo:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC15icloudmailagent21MCCSecretAgentService *v13;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  _Block_copy(v8);
  v13 = self;
  sub_10001D204(v9, v11, v12, (uint64_t)v13, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v12);
}

- (void)refreshCertificateWithContext:(id)a3 certId:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC15icloudmailagent21MCCSecretAgentService *v12;

  v8 = _Block_copy(a5);
  LODWORD(a4) = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_10001D334(v11, (int)a4, v10, (uint64_t)v12, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v10);
}

- (void)predictCommerceEmailWithContext:(id)a3 completion:(id)a4
{
  sub_10000DAB8(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10001D474);
}

- (void)isModelReadyWithCompletion:(id)a3
{
  sub_10001C81C(self, (int)a2, a3, "isModelReady MCCSecretAgentService called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager, (void (*)(uint64_t, void *))sub_100023944);
}

- (void)invokeModelDownloadWithCompletion:(id)a3
{
  sub_10001C81C(self, (int)a2, a3, "invokeModelDownload MCCSecretAgentService called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager, (void (*)(uint64_t, void *))sub_100023A3C);
}

- (void)registerCategoryRulesCallbackListener:(id)a3 completion:(id)a4
{
  void *v6;
  char *v7;
  id v8;
  _TtC15icloudmailagent21MCCSecretAgentService *v9;

  v6 = _Block_copy(a4);
  v7 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  _Block_copy(v6);
  v8 = a3;
  v9 = self;
  sub_100023C9C((uint64_t)v8, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)sendPendingRulesWithCompletion:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (void)createWebRule:(id)a3 completion:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)getIABCategoryID:(id)a3 completion:(id)a4
{
  sub_10001C4F0(self, (int)a2, (uint64_t)a3, a4, "getIABCategoryID MCCSecretAgentService called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_1000241D4);
}

- (void)isPersonalDomain:(id)a3 completion:(id)a4
{
  sub_10001C4F0(self, (int)a2, (uint64_t)a3, a4, "isPersonalDomain MCCSecretAgentService called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager, (void (*)(uint64_t, uint64_t, uint64_t, void *))sub_1000242DC);
}

- (void)getBlackPearlVersionWithCompletion:(id)a3
{
  sub_10001C81C(self, (int)a2, a3, "MCCSecretAgentService getBlackPearlVersion called", &OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager, (void (*)(uint64_t, void *))sub_1000243E4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_certificateManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_cloudKitKVSManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager));
}

@end
