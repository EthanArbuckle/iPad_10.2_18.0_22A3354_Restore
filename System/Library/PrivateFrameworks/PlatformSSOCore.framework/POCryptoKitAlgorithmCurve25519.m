@implementation POCryptoKitAlgorithmCurve25519

- (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519)init
{
  objc_class *ObjectType;
  void *v4;
  void *v5;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)sub_24449C3F8();
  v5 = (void *)sub_24449C3F8();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[POJWTSigning initWithSecKeyAlgorithm:algorithmName:alg:](&v8, sel_initWithSecKeyAlgorithm_algorithmName_alg_, 0, v4, v5);

  return v6;
}

- (id)signData:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  __SecKey *v13;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __SecKey *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];

  v8 = sub_24449C1AC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = sub_24449C098();
  v17 = v16;

  v18 = v13;
  sub_24449C194();
  v25[1] = v15;
  v25[2] = v17;
  sub_244466024();
  v19 = sub_24449C1A0();
  v21 = v20;
  v22 = v19;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  sub_24446492C(v15, v17);
  v23 = (void *)sub_24449C080();
  sub_24446492C(v22, v21);
  return v23;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingKey:(__SecKey *)a5
{
  id v8;
  id v9;
  __SecKey *v10;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_24449C098();
  v14 = v13;

  v15 = sub_24449C098();
  v17 = v16;

  LOBYTE(v9) = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on5usingSb10Foundation4DataV_AISo9SecKeyRefatF_0(v12, v14, v15, v17, v10);
  sub_24446492C(v15, v17);
  sub_24446492C(v12, v14);

  return v9 & 1;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingCertificateString:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_24449C098();
  v14 = v13;

  v15 = sub_24449C098();
  v17 = v16;

  sub_24449C404();
  LOBYTE(v9) = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on22usingCertificateStringSb10Foundation4DataV_AISStF_0(v12, v14, v15, v17);
  swift_bridgeObjectRelease();
  sub_24446492C(v15, v17);
  sub_24446492C(v12, v14);

  return v9 & 1;
}

- (BOOL)verifyKey:(__SecKey *)a3
{
  __SecKey *v4;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C9verifyKeyySbSo03SecH3RefaF_0(v4);

  return v6 & 1;
}

- (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519)initWithSecKeyAlgorithm:(const __CFString *)a3 algorithmName:(id)a4 alg:(id)a5
{
  const __CFString *v5;
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *result;

  v5 = (id)a3;
  result = (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
