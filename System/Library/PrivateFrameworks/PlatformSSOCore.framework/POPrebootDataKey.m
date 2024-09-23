@implementation POPrebootDataKey

+ (NSNumber)prebootEncryptionAlgorithm
{
  if (qword_257366200 != -1)
    swift_once();
  return (NSNumber *)(id)qword_257366970;
}

- (NSString)encryptedKeyData
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setEncryptedKeyData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_24449C404();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSData)keyData
{
  uint64_t *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  v3 = 0;
  v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    v5 = *v2;
    sub_2444648E8(v5, v4);
    v3 = (void *)sub_24449C080();
    sub_244464970(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setKeyData:(id)a3
{
  void *v3;
  _TtC15PlatformSSOCore16POPrebootDataKey *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _TtC15PlatformSSOCore16POPrebootDataKey *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v3 = a3;
  if (a3)
  {
    v5 = self;
    v6 = v3;
    v3 = (void *)sub_24449C098();
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData);
  swift_beginAccess();
  v11 = *v10;
  v12 = v10[1];
  *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_244464970(v11, v12);

}

- (_TtC15PlatformSSOCore16POPrebootDataKey)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_encryptedKeyData);
  *v2 = 0;
  v2[1] = 0;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData) = xmmword_2444A2E90;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for POPrebootDataKey();
  return -[POPrebootDataKey init](&v4, sel_init);
}

+ (id)verifiedKeyWithPrebootData:(id)a3 error:(id *)a4
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  sub_24449C404();
  swift_getObjCClassMetadata();
  v4 = static POPrebootDataKey.verifiedKey(prebootData:)();
  v6 = v5;
  swift_bridgeObjectRelease();
  v7 = (void *)sub_24449C080();
  sub_24446492C(v4, v6);
  return v7;
}

+ (id)createKeyAndReturnError:(id *)a3
{
  swift_getObjCClassMetadata();
  return static POPrebootDataKey.createKey()();
}

+ (id)encryptWithData:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  return sub_244465CE8((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))sub_244466CC0);
}

+ (id)decryptWithData:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  return sub_244465CE8((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))sub_24446713C);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_244464970(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData), *(_QWORD *)&self->encryptedKeyData[OBJC_IVAR____TtC15PlatformSSOCore16POPrebootDataKey_keyData]);
}

@end
