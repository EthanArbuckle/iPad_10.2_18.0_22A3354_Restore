@implementation CertificateManager

- (CertificateManager)initWithKeychainManager:(id)a3 certificateRequestManager:(id)a4 cloudKVSManager:(id)a5
{
  CertificateManager *v9;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  v9 = (CertificateManager *)sub_10001CCA4(a3, a4, a5, self);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);
  return v9;
}

- (void)generateCertificateWith:(id)a3 completion:(id)a4
{
  sub_10000DAB8(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10000F66C);
}

- (void)listCertificatesWithCompletion:(id)a3
{
  void *v4;
  CertificateManager *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100012F24((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)listCertificatesForEmail:(id)a3 completion:(id)a4
{
  sub_10000DAB8(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100013598);
}

- (void)updateCertificateDefaultsFor:(id)a3 certInfo:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CertificateManager *v13;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  _Block_copy(v8);
  v13 = self;
  sub_100013DEC(v9, v11, v12, (uint64_t)v13, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v12);
}

- (void)refreshCertificateWith:(id)a3 certId:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  CertificateManager *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100014278(v9, (uint64_t)v10, (char *)v11, v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (CertificateManager)init
{
  CertificateManager *result;

  result = (CertificateManager *)_swift_stdlib_reportUnimplementedInitializer("icloudmailagent.CertificateManager", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000090DC((uint64_t)self + OBJC_IVAR___CertificateManager_signingEndpoint, &qword_10003AC80);
  sub_1000090DC((uint64_t)self + OBJC_IVAR___CertificateManager_encryptEndpoint, &qword_10003AC80);
  sub_1000090DC((uint64_t)self + OBJC_IVAR___CertificateManager_revokeEndpoint, &qword_10003AC80);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CertificateManager_keychainManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CertificateManager_certificateRequestManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CertificateManager_cloudKVSManager));
}

@end
