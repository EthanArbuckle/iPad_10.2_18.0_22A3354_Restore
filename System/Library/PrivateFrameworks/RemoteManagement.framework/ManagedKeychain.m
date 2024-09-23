@implementation ManagedKeychain

+ (_TtC16RemoteManagement15ManagedKeychain)sharedInstance
{
  if (qword_254FFC810 != -1)
    swift_once();
  return (_TtC16RemoteManagement15ManagedKeychain *)(id)qword_254FFC818;
}

+ (NSString)assignedPersistentRef
{
  return (NSString *)sub_218873098((uint64_t)a1, (uint64_t)a2, &qword_254FFC820);
}

+ (NSString)assignedUserName
{
  return (NSString *)sub_218873098((uint64_t)a1, (uint64_t)a2, &qword_254FFC838);
}

- (BOOL)storeWithPkcs12Data:(id)a3 password:(id)a4 assetKey:(id)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  _TtC16RemoteManagement15ManagedKeychain *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  v16 = a7;
  v17 = sub_2188A5C3C();
  v19 = v18;

  v20 = sub_2188A5D20();
  v22 = v21;

  v23 = sub_2188A5D20();
  if (v16)
  {
    v24 = sub_2188A5D20();
    v26 = v25;

  }
  else
  {
    v24 = 0;
    v26 = 0;
  }
  sub_21887CFCC(v17, v19, v20, v22);
  v28 = v27;
  type metadata accessor for MKRepo();
  sub_21888127C(a6, v24, v26, *(uint64_t *)((char *)&v15->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)&v15->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup]);
  v29 = sub_218879FF4(v23);
  sub_2188902D8((uint64_t)v28, v29, v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21887A168(v17, v19);
  return 1;
}

- (BOOL)storeWithDerData:(id)a3 assetKey:(id)a4 scope:(int64_t)a5 persona:(id)a6 error:(id *)a7
{
  return sub_21887363C(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (uint64_t (*)(uint64_t, unint64_t))sub_21887D87C);
}

- (BOOL)storeWithPemData:(id)a3 assetKey:(id)a4 scope:(int64_t)a5 persona:(id)a6 error:(id *)a7
{
  return sub_21887363C(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (uint64_t (*)(uint64_t, unint64_t))sub_21887D9C0);
}

- (BOOL)storeWithPassword:(id)a3 userName:(id)a4 assetKey:(id)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _TtC16RemoteManagement15ManagedKeychain *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v26;
  uint64_t v27;

  v10 = sub_2188A5D20();
  v12 = v11;
  v13 = sub_2188A5D20();
  v15 = v14;
  v16 = sub_2188A5D20();
  v26 = v13;
  v27 = v10;
  if (a7)
  {
    v17 = sub_2188A5D20();
    a7 = v18;
  }
  else
  {
    v17 = 0;
  }
  type metadata accessor for MKRepo();
  v19 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v20 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v21 = self;
  sub_21888127C(a6, v17, (unint64_t)a7, v19, v20);
  v22 = sub_218879FF4(v16);
  sub_218890B44(v27, v12, v26, v15, v22, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)storeSCEPIdentityWithUrl:(id)a3 caInstanceName:(id)a4 caFingerprint:(id)a5 caCapabilities:(id)a6 challenge:(id)a7 subject:(id)a8 keySize:(unint64_t)a9 usageFlags:(unint64_t)a10 subjectAltName:(id)a11 retries:(unint64_t)a12 retryDelay:(unsigned int)a13 assetKey:(id)a14 scope:(int64_t)a15 persona:(id)a16 error:(id *)a17
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _TtC16RemoteManagement15ManagedKeychain *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _TtC16RemoteManagement15ManagedKeychain *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v23 = sub_2188A5D20();
  v60 = v24;
  v59 = v23;
  if (a4)
  {
    v25 = sub_2188A5D20();
    v62 = v26;
  }
  else
  {
    v25 = 0;
    v62 = 0;
  }
  v58 = v25;
  if (a5)
  {
    v27 = a5;
    v28 = a6;
    v29 = a7;
    v30 = a8;
    v31 = a11;
    v32 = a14;
    v33 = a16;
    v34 = self;
    v35 = sub_2188A5C3C();
    v56 = v36;
    v57 = v35;

    if (a6)
      goto LABEL_6;
  }
  else
  {
    v38 = a6;
    v39 = a7;
    v40 = a8;
    v41 = a11;
    v42 = a14;
    v43 = a16;
    v44 = self;
    v56 = (void *)0xF000000000000000;
    v57 = 0;
    if (a6)
    {
LABEL_6:
      v53 = (_QWORD *)sub_2188A5E04();

      if (a7)
        goto LABEL_7;
LABEL_11:
      v52 = 0;
      v55 = 0;
      if (a8)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  v53 = 0;
  if (!a7)
    goto LABEL_11;
LABEL_7:
  v52 = sub_2188A5D20();
  v55 = v37;

  if (a8)
  {
LABEL_8:
    __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8F8);
    v54 = (void *)sub_2188A5E04();

    goto LABEL_13;
  }
LABEL_12:
  v54 = 0;
LABEL_13:
  if (a11)
  {
    v61 = sub_2188A5CFC();

  }
  else
  {
    v61 = 0;
  }
  v45 = sub_2188A5D20();
  v47 = v46;

  if (a16)
  {
    v48 = sub_2188A5D20();
    v50 = v49;

  }
  else
  {
    v48 = 0;
    v50 = 0;
  }
  sub_218873A94(v59, v60, v58, v62, v57, v56, v53, v52, v55, v54, a9, a10, v61, a12, a13, v45, v47, a15, v48, v50);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21887A154(v57, (unint64_t)v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)storeACMEIdentityWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(unint64_t)a5 keyType:(id)a6 hardwareBound:(BOOL)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(unint64_t)a10 extendedKeyUsage:(id)a11 attest:(BOOL)a12 isUserEnrollment:(BOOL)a13 assetKey:(id)a14 scope:(int64_t)a15 persona:(id)a16 error:(id *)a17
{
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _TtC16RemoteManagement15ManagedKeychain *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v37;
  void **v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;

  v37 = a7;
  v18 = a16;
  v35 = sub_2188A5D20();
  v40 = v19;
  v34 = sub_2188A5D20();
  v41 = v20;
  v21 = sub_2188A5D20();
  v23 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254FFC8F8);
  v39 = sub_2188A5E04();
  if (a9)
    v24 = sub_2188A5CFC();
  else
    v24 = 0;
  v38 = (void **)sub_2188A5E04();
  v33 = sub_2188A5D20();
  if (a16)
  {
    v25 = sub_2188A5D20();
    v18 = v26;
  }
  else
  {
    v25 = 0;
  }
  v27 = self;
  sub_21887CAA0(v35, v40, v34, v41, a5, v21, v23, v37, v39, v24, (id *)a10, v38, a12, a13, v25, (unint64_t)v18);
  v29 = v28;
  type metadata accessor for MKRepo();
  sub_21888127C(a15, v25, (unint64_t)v18, *(uint64_t *)((char *)&v27->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(_QWORD *)&v27->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup]);
  v30 = sub_218879FF4(v33);
  sub_2188902D8((uint64_t)v29, v30, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deleteWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  return sub_218874CF4((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (unint64_t)a5, (uint64_t)a6, (void (*)(uint64_t))sub_218890E7C);
}

- (BOOL)hasAssetForAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC16RemoteManagement15ManagedKeychain *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;

  v8 = sub_2188A5D20();
  if (a5)
  {
    v9 = sub_2188A5D20();
    a5 = v10;
  }
  else
  {
    v9 = 0;
  }
  type metadata accessor for MKRepo();
  v11 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v12 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v13 = self;
  sub_21888127C(a4, v9, (unint64_t)a5, v11, v12);
  v14 = sub_218879FF4(v8);
  v16 = sub_2188911A8(v14, v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16 & 1;
}

- (id)assignCertWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 error:(id *)a9
{
  return sub_218874700((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2188874C0);
}

- (id)assignIdentityWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 error:(id *)a9
{
  return sub_218874700((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_218887710);
}

- (id)assignPasswordWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 returnUserName:(id *)a9 error:(id *)a10
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _TtC16RemoteManagement15ManagedKeychain *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v31;

  v14 = sub_2188A5D20();
  v16 = v15;
  v31 = v14;
  if (a5)
  {
    v17 = sub_2188A5D20();
    a5 = v18;
  }
  else
  {
    v17 = 0;
  }
  v19 = sub_2188A5D20();
  v21 = v20;
  v22 = sub_2188A5D20();
  v24 = v23;
  swift_unknownObjectRetain();
  v25 = self;
  v26 = sub_218874908(v31, v16, a4, v17, (unint64_t)a5, v19, v21, (uint64_t)a7, v22, v24, a9);
  v28 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_2188A5C24();
  sub_21887A168(v26, v28);
  return v29;
}

- (BOOL)unassignAllAssetsFromConfigurationKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  return sub_218874CF4((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (unint64_t)a5, (uint64_t)a6, (void (*)(uint64_t))sub_218888710);
}

- (id)assetKeysForCertificatesWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC16RemoteManagement15ManagedKeychain *v12;
  uint64_t v13;
  void *v14;

  if (a4)
  {
    v7 = sub_2188A5D20();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  type metadata accessor for MKRepo();
  v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v11 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v12 = self;
  sub_21888127C(a3, v7, v9, v10, v11);
  swift_beginAccess();
  v13 = swift_bridgeObjectRetain();
  sub_218879D14(v13);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_2188A5DEC();
  swift_release();
  return v14;
}

- (id)assetKeysForIdentitiesWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC16RemoteManagement15ManagedKeychain *v12;
  uint64_t v13;
  void *v14;

  if (a4)
  {
    v7 = sub_2188A5D20();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  type metadata accessor for MKRepo();
  v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v11 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v12 = self;
  sub_21888127C(a3, v7, v9, v10, v11);
  swift_beginAccess();
  v13 = swift_bridgeObjectRetain();
  sub_218879D14(v13);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_2188A5DEC();
  swift_release();
  return v14;
}

- (id)assetKeysForPasswordsWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC16RemoteManagement15ManagedKeychain *v12;
  uint64_t v13;
  void *v14;

  if (a4)
  {
    v7 = sub_2188A5D20();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  type metadata accessor for MKRepo();
  v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v11 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v12 = self;
  sub_21888127C(a3, v7, v9, v10, v11);
  swift_beginAccess();
  v13 = swift_bridgeObjectRetain();
  sub_218879D14(v13);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_2188A5DEC();
  swift_release();
  return v14;
}

- (id)certificatePersistentRefWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16RemoteManagement15ManagedKeychain *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;

  v9 = sub_2188A5D20();
  if (a5)
  {
    v10 = sub_2188A5D20();
    a5 = v11;
  }
  else
  {
    v10 = 0;
  }
  type metadata accessor for MKRepo();
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v13 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v14 = self;
  sub_21888127C(a4, v10, (unint64_t)a5, v12, v13);
  v15 = sub_218879FF4(v9);
  v17 = sub_218891DFC(v15, v16);
  v19 = v18;
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = (void *)sub_2188A5C24();
  sub_21887A168(v17, v19);
  return v20;
}

- (id)certificatePersistentRefsWithAssetKeys:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _TtC16RemoteManagement15ManagedKeychain *v12;
  void *v13;

  v9 = sub_2188A5E04();
  if (a5)
  {
    v10 = sub_2188A5D20();
    a5 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = self;
  sub_2188755A0(v9, a4, v10, (unint64_t)a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v13 = (void *)sub_2188A5CF0();
  swift_bridgeObjectRelease();
  return v13;
}

- (__SecCertificate)copyCertificateWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16RemoteManagement15ManagedKeychain *v14;
  uint64_t v15;
  uint64_t v16;
  __SecCertificate *v17;

  v9 = sub_2188A5D20();
  if (a5)
  {
    v10 = sub_2188A5D20();
    a5 = v11;
  }
  else
  {
    v10 = 0;
  }
  type metadata accessor for MKRepo();
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v13 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v14 = self;
  sub_21888127C(a4, v10, (unint64_t)a5, v12, v13);
  v15 = sub_218879FF4(v9);
  v17 = (__SecCertificate *)sub_218891FB0(v15, v16);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)debugStateWithScope:(int64_t)a3 persona:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC16RemoteManagement15ManagedKeychain *v11;
  void *v12;

  if (a4)
  {
    v6 = sub_2188A5D20();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  type metadata accessor for MKRepo();
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  v10 = *(_QWORD *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  v11 = self;
  sub_21888127C(a3, v6, v8, v9, v10);
  sub_21888277C();

  swift_release();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2188A5CF0();
  swift_bridgeObjectRelease();
  return v12;
}

- (_TtC16RemoteManagement15ManagedKeychain)init
{
  _TtC16RemoteManagement15ManagedKeychain *result;

  result = (_TtC16RemoteManagement15ManagedKeychain *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
