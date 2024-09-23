@implementation CredentialStoreSessionProxy

- (void)dealloc
{
  _TtC7idcredd27CredentialStoreSessionProxy *v2;

  v2 = self;
  sub_1000DA10C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd27CredentialStoreSessionProxy_jetsamTransaction), a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7idcredd27CredentialStoreSessionProxy_connection);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd27CredentialStoreSessionProxy_dataContainer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7idcredd27CredentialStoreSessionProxy_partitions));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd27CredentialStoreSessionProxy_storage));
}

- (void)configureWithPartitions:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC7idcredd27CredentialStoreSessionProxy *v8;

  v6 = _Block_copy(a4);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v6);
  v8 = self;
  sub_1000EAC38(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v7);
}

- (void)createCredentialInPartition:(NSString *)a3 options:(DCCredentialOptions *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  DCCredentialOptions *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BE88, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016BEB0, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177F68;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016BED8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177F70;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177F78, (uint64_t)v16);
  swift_release(v20);
}

- (void)generateKeySigningKeyForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016BE10, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BE38, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177F48;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016BE60, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177F50;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177F58, (uint64_t)v14);
  swift_release(v17);
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016BD98, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BDC0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177F28;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016BDE8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177F30;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177F38, (uint64_t)v14);
  swift_release(v17);
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016BD20, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BD48, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177F08;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016BD70, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177F10;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177F18, (uint64_t)v14);
  swift_release(v17);
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016BCA8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BCD0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177EE8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016BCF8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177EF0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177EF8, (uint64_t)v14);
  swift_release(v17);
}

- (void)generateAccountKeyAuthorizationForCredential:(NSString *)a3 accountKeyIdentifier:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BC30, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016BC58, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177EC8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016BC80, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177ED0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177ED8, (uint64_t)v16);
  swift_release(v20);
}

- (void)generateDeviceEncryptionKeyForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016BBB8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BBE0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177EA8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016BC08, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177EB0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177EB8, (uint64_t)v14);
  swift_release(v17);
}

- (void)generatePresentmentKeyForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016BB40, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BB68, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177E88;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016BB90, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177E90;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177E98, (uint64_t)v14);
  swift_release(v17);
}

- (void)generatePresentmentKeysForCredential:(NSString *)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  _TtC7idcredd27CredentialStoreSessionProxy *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BAC8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016BAF0, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177E60;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016BB18, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177E68;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  v19 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177E70, (uint64_t)v16);
  swift_release(v19);
}

- (void)authorizeDeviceKeySigningKeyOfCredential:(NSString *)a3 accountKeyIdentifier:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016BA50, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016BA78, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177E40;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016BAA0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177E48;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177E50, (uint64_t)v16);
  swift_release(v20);
}

- (void)authorizeRemoteKeySigningKeyWithCredential:(NSString *)a3 remoteKey:(NSData *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSData *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B9D8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016BA00, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177E20;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016BA28, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177E28;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177E30, (uint64_t)v16);
  swift_release(v20);
}

- (void)associateExternalPresentmentKeyWithCredential:(NSString *)a3 publicKeyIdentifier:(NSData *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSData *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B960, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B988, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177E00;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016B9B0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177E08;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177E10, (uint64_t)v16);
  swift_release(v20);
}

- (void)credentialIdentifierForPublicKeyIdentifier:(NSData *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSData *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B8E8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B910, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177DE0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B938, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177DE8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177DF0, (uint64_t)v14);
  swift_release(v17);
}

- (void)replacePayloadOfCredential:(NSString *)a3 withPayload:(NSData *)a4 format:(unint64_t)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSData *v20;
  _TtC7idcredd27CredentialStoreSessionProxy *v21;
  uint64_t v22;
  uint64_t v23;

  v11 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B870, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10016B898, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100177DC0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10016B8C0, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100177DC8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  v22 = sub_1000E9578((uint64_t)v13, (uint64_t)&unk_100177DD0, (uint64_t)v18);
  swift_release(v22);
}

- (void)credentialIdentifiersInPartitions:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B7F8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B820, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177DA0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B848, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177DA8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177DB0, (uint64_t)v14);
  swift_release(v17);
}

- (void)credentialIdentifiersInPartitions:(NSArray *)a3 docType:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSString *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B780, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B7A8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177D80;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016B7D0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177D88;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177D90, (uint64_t)v16);
  swift_release(v20);
}

- (void)credentialIdentifiersInPartitions:(NSArray *)a3 docType:(NSString *)a4 region:(NSString *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSArray *v19;
  NSString *v20;
  NSString *v21;
  _TtC7idcredd27CredentialStoreSessionProxy *v22;
  uint64_t v23;
  uint64_t v24;

  v11 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B708, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10016B730, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100177D60;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10016B758, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100177D68;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  v23 = sub_1000E9578((uint64_t)v13, (uint64_t)&unk_100177D70, (uint64_t)v18);
  swift_release(v23);
}

- (void)activeRegionsInPartitions:(NSArray *)a3 docType:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSString *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B690, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B6B8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177D40;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016B6E0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177D48;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177D50, (uint64_t)v16);
  swift_release(v20);
}

- (void)deleteCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B618, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B640, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177D20;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B668, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177D28;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177D30, (uint64_t)v14);
  swift_release(v17);
}

- (void)propertiesOfCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B5A0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B5C8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177D00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B5F0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177D08;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177D10, (uint64_t)v14);
  swift_release(v17);
}

- (void)setStateOfCredential:(NSString *)a3 to:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  _TtC7idcredd27CredentialStoreSessionProxy *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B528, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B550, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177CE0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016B578, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177CE8;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  v19 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177CF0, (uint64_t)v16);
  swift_release(v19);
}

- (void)payloadAuthACLForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B4B0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B4D8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177CC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B500, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177CC8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177CD0, (uint64_t)v14);
  swift_release(v17);
}

- (void)elementsOfCredential:(NSString *)a3 elementIdentifiers:(NSDictionary *)a4 authData:(NSData *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSDictionary *v20;
  NSData *v21;
  _TtC7idcredd27CredentialStoreSessionProxy *v22;
  uint64_t v23;
  uint64_t v24;

  v11 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B438, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10016B460, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100177C98;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10016B488, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100177CA0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  v23 = sub_1000E9578((uint64_t)v13, (uint64_t)&unk_100177CA8, (uint64_t)v18);
  swift_release(v23);
}

- (void)checkCompletenessOfCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B3C0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B3E8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177C78;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B410, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177C80;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177C88, (uint64_t)v14);
  swift_release(v17);
}

- (void)payloadsOfCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B348, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B370, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177C50;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B398, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177C58;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177C60, (uint64_t)v14);
  swift_release(v17);
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B2D0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B2F8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177C30;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B320, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177C38;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177C40, (uint64_t)v14);
  swift_release(v17);
}

- (void)allElementsOfCredential:(NSString *)a3 authData:(NSData *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSData *v18;
  _TtC7idcredd27CredentialStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B258, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10016B280, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100177C08;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10016B2A8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100177C10;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100177C18, (uint64_t)v16);
  swift_release(v20);
}

- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd27CredentialStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10016B1E0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B208, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100177BE0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10016B230, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100177BE8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100177BF0, (uint64_t)v12);
  swift_release(v14);
}

- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7idcredd27CredentialStoreSessionProxy *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B168, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B190, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177BC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B1B8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177BC8;
  v14[5] = v13;
  v15 = self;
  v16 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177BD0, (uint64_t)v14);
  swift_release(v16);
}

- (void)clearPresentmentKeyUsageForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B0F0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B118, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177BA0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B140, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100177BA8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100177BB0, (uint64_t)v14);
  swift_release(v17);
}

- (void)keyInfoForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC7idcredd27CredentialStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10016B050, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10016B078, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100177B58;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10016B0A0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100175920;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100174E50, (uint64_t)v14);
  swift_release(v17);
}

- (_TtC7idcredd27CredentialStoreSessionProxy)init
{
  _TtC7idcredd27CredentialStoreSessionProxy *result;

  result = (_TtC7idcredd27CredentialStoreSessionProxy *)_swift_stdlib_reportUnimplementedInitializer("idcredd.CredentialStoreSessionProxy", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
