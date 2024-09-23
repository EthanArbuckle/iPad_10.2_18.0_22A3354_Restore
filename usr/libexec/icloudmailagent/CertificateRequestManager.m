@implementation CertificateRequestManager

- (id)resultFromServerFor:(id)a3 endpoint:(id)a4 email:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CertificateRequestManager *v20;
  uint64_t v21;
  Class isa;
  uint64_t v24;

  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (void (*)(char *, uint64_t))((char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = v15;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;
  v20 = self;
  v21 = sub_100018BC0(v14, v16, v13, v17, v19);
  (*(void (**)(_QWORD, uint64_t))(v11 + 8))(v13, v10);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  return isa;
}

- (id)generateCertificateRequestStringWith:(id)a3 subjectAltName:(id)a4 privateKey:(__SecKey *)a5 encrypt:(BOOL)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __SecKey *v14;
  CertificateRequestManager *v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;

  v11 = sub_1000073FC(&qword_10003AC88);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v14 = a5;
  v15 = self;
  sub_1000196F4(v12, v13, v14, a6);
  v17 = v16;

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  if (v17)
  {
    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (__SecCertificate)certificateFor:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CertificateRequestManager *v8;
  SecCertificateRef v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = sub_100019908(v5, v7);
  swift_bridgeObjectRelease(v7);

  return v9;
}

- (BOOL)revokeResultFromServerFor:(id)a3 endpoint:(id)a4 error:(id *)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  CertificateRequestManager *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;

  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = a3;
  v16 = a4;
  v17 = self;
  v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v20 = v19;

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v16);
  _Block_copy(v14);
  sub_10001AF3C(v18, v20, (uint64_t)v13, (void (**)(const void *, void *))v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  _Block_release(v14);
  sub_100008F94(v18, v20);
  return 1;
}

- (CertificateRequestManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CertificateRequestManager();
  return -[CertificateRequestManager init](&v3, "init");
}

@end
