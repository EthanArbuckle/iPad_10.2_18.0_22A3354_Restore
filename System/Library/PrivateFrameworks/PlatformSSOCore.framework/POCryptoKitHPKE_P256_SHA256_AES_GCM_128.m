@implementation POCryptoKitHPKE_P256_SHA256_AES_GCM_128

- (NSNumber)encryptionAlgorithm
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

- (_TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128)init
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;

  v3 = sub_24449C2B4();
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24449C29C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24449C2A8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24449C290();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm) = (Class)&unk_251520FA8;
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDC6768], v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDC6758], v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v5, *MEMORY[0x24BDC6778], v20);
  v17 = &unk_251520FA8;
  sub_24449C284();
  return (_TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128 *)POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v16);
}

- (void)addValuesTo:(id)a3 psk:(BOOL)a4 auth:(BOOL)a5
{
  id v6;
  _TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128 *v7;

  v6 = a3;
  v7 = self;
  _s15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128C9addValues2to3psk4authySo18POMutableJWTHeaderC_S2btF_0(v6);

}

- (id)encValueForPsk:(BOOL)a3 auth:(BOOL)a4
{
  void *v4;

  v4 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)decodeAndDecryptJWT:(id)a3 privateKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPublicKey:(__SecKey *)a8 error:(id *)a9
{
  uint64_t v15;
  uint64_t v16;
  id v17;
  __SecKey *v18;
  id v19;
  id v20;
  __SecKey *v21;
  _TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128 *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  __SecKey *v29;
  _TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128 *v30;
  uint64_t v32;

  if (a5)
  {
    v32 = sub_24449C404();
    v16 = v15;
  }
  else
  {
    v32 = 0;
    v16 = 0;
  }
  v17 = a3;
  v18 = a4;
  if (!a6)
  {
    v28 = a7;
    v29 = a8;
    v30 = self;
    v24 = 0xF000000000000000;
    if (a7)
      goto LABEL_6;
LABEL_8:
    v25 = 0;
    v27 = 0xF000000000000000;
    goto LABEL_9;
  }
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = self;
  a6 = (id)sub_24449C098();
  v24 = v23;

  if (!a7)
    goto LABEL_8;
LABEL_6:
  v25 = sub_24449C098();
  v27 = v26;

LABEL_9:
  POCryptoKitHPKE_P256_SHA256_AES_GCM_128.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v17, v18, v32, v16, (uint64_t)a6, v24, v25, v27, a8);

  sub_244464970(v25, v27);
  sub_244464970((uint64_t)a6, v24);
  swift_bridgeObjectRelease();
  return 1;
}

- (id)encodeAndEncryptJWT:(id)a3 publicKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPrivateKey:(__SecKey *)a8 auth_kid:(id)a9 error:(id *)a10
{
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  __SecKey *v20;
  id v21;
  _TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128 *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  __SecKey *v31;
  id v32;
  _TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128 *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  __SecKey *v38;
  unint64_t v39;

  if (a5)
  {
    v37 = sub_24449C404();
    v16 = v15;
  }
  else
  {
    v37 = 0;
    v16 = 0;
  }
  v17 = a3;
  v38 = a4;
  if (a6)
  {
    v18 = a6;
    v19 = a7;
    v20 = a8;
    v21 = a9;
    v22 = self;
    v36 = sub_24449C098();
    v24 = v23;

    if (a7)
      goto LABEL_6;
LABEL_9:
    v25 = 0;
    v27 = 0xF000000000000000;
    if (a9)
      goto LABEL_7;
LABEL_10:
    v28 = 0;
    v39 = 0xF000000000000000;
    goto LABEL_11;
  }
  v30 = a7;
  v31 = a8;
  v32 = a9;
  v33 = self;
  v36 = 0;
  v24 = 0xF000000000000000;
  if (!a7)
    goto LABEL_9;
LABEL_6:
  v25 = sub_24449C098();
  v27 = v26;

  if (!a9)
    goto LABEL_10;
LABEL_7:
  v28 = sub_24449C098();
  v39 = v29;

LABEL_11:
  POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v17, v38, v37, v16, v36, v24, v25, v27, a8, v28, v39);

  sub_244464970(v28, v39);
  sub_244464970(v25, v27);
  sub_244464970(v36, v24);
  swift_bridgeObjectRelease();
  v34 = (void *)sub_24449C3F8();
  swift_bridgeObjectRelease();
  return v34;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

@end
