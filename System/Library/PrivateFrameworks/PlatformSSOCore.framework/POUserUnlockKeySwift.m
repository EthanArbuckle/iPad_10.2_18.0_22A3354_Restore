@implementation POUserUnlockKeySwift

+ (NSNumber)prebootEncryptionAlgorithm
{
  if (qword_257366490 != -1)
    swift_once();
  return (NSNumber *)(id)qword_2573669A0;
}

- (NSString)encryptedKeyData
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData;
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
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

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
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
  _TtC15PlatformSSOCore20POUserUnlockKeySwift *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _TtC15PlatformSSOCore20POUserUnlockKeySwift *v9;
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
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData);
  swift_beginAccess();
  v11 = *v10;
  v12 = v10[1];
  *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_244464970(v11, v12);

}

- (_TtC15PlatformSSOCore20POUserUnlockKeySwift)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_encryptedKeyData);
  *v2 = 0;
  v2[1] = 0;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData) = xmmword_2444A2E90;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for POUserUnlockKeySwift();
  return -[POUserUnlockKeySwift init](&v4, sel_init);
}

+ (id)unlockKeyWithEncryptedKey:(id)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __SecKey *v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v6 = sub_24449C404();
  v8 = v7;
  v9 = a4;
  v10 = sub_24446D380(v6, v8, v9);
  v12 = v11;
  swift_bridgeObjectRelease();

  v13 = (void *)sub_24449C080();
  sub_24446492C((uint64_t)v10, v12);
  return v13;
}

+ (id)createUnlockKeyWithPublicKey:(__SecKey *)a3 error:(id *)a4
{
  __SecKey *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = sub_24446D868(v4);

  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_244464970(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData), *(_QWORD *)&self->encryptedKeyData[OBJC_IVAR____TtC15PlatformSSOCore20POUserUnlockKeySwift_keyData]);
}

@end
