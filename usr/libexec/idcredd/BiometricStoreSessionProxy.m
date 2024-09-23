@implementation BiometricStoreSessionProxy

- (void)dealloc
{
  _TtC7idcredd26BiometricStoreSessionProxy *v2;

  v2 = self;
  sub_10001A1A0();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd26BiometricStoreSessionProxy_jetsamTransaction), a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7idcredd26BiometricStoreSessionProxy_connection);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd26BiometricStoreSessionProxy_storage));
}

- (void)bioBindingUnboundACL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100168738, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100168760, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001750C0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100168788, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001750C8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_1001750D0, (uint64_t)v12);
  swift_release(v14);
}

- (void)passcodeBindingUnboundACL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001686C0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001686E8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001750A0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100168710, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001750A8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_1001750B0, (uint64_t)v12);
  swift_release(v14);
}

- (void)setGlobalAuthACL:(NSData *)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  _TtC7idcredd26BiometricStoreSessionProxy *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100168648, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100168670, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100175080;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100168698, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100175088;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  v19 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100175090, (uint64_t)v16);
  swift_release(v19);
}

- (void)setModifiedGlobalAuthACL:(NSData *)a3 externalizedLAContext:(NSData *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  NSData *v18;
  _TtC7idcredd26BiometricStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1001685D0, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1001685F8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100175060;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100168620, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100175068;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100175070, (uint64_t)v16);
  swift_release(v20);
}

- (void)globalAuthACLWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100168558, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100168580, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100175040;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001685A8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100175048;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100175050, (uint64_t)v12);
  swift_release(v14);
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001684E0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100168508, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100175020;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100168530, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100175028;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100175030, (uint64_t)v12);
  swift_release(v14);
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100168468, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100168490, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100175000;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001684B8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100175008;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100175010, (uint64_t)v12);
  swift_release(v14);
}

- (void)generatePrearmTrustCertificateWithNonce:(NSData *)a3 pairingID:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  NSString *v18;
  _TtC7idcredd26BiometricStoreSessionProxy *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1001683F0, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100168418, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100174FE0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100168440, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100174FE8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100174FF0, (uint64_t)v16);
  swift_release(v20);
}

- (void)migratePrearmTrustBlob:(NSData *)a3 completion:(id)a4
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
  _TtC7idcredd26BiometricStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168378, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1001683A0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100174FC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1001683C8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100174FC8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100174FD0, (uint64_t)v14);
  swift_release(v17);
}

- (void)generatePhoneTokenWithNonce:(DCCredentialNonce *)a3 keyBlob:(NSData *)a4 pairingID:(NSString *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  DCCredentialNonce *v19;
  NSData *v20;
  NSString *v21;
  _TtC7idcredd26BiometricStoreSessionProxy *v22;
  uint64_t v23;
  uint64_t v24;

  v11 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_100168300, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_100168328, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100174FA0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_100168350, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100174FA8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  v23 = sub_1000E9578((uint64_t)v13, (uint64_t)&unk_100174FB0, (uint64_t)v18);
  swift_release(v23);
}

- (void)establishPrearmTrustV2:(DCCredentialTrust *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DCCredentialTrust *v15;
  _TtC7idcredd26BiometricStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168288, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1001682B0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100174F80;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1001682D8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100174F88;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100174F90, (uint64_t)v14);
  swift_release(v17);
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100168210, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100168238, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174F60;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100168260, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100174F68;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174F70, (uint64_t)v12);
  swift_release(v14);
}

- (void)revokeCredentialAuthorizationToken:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100168198, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001681C0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174F40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001681E8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100174F48;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174F50, (uint64_t)v12);
  swift_release(v14);
}

- (void)prearmCredentialWithAuthorizationToken:(DCCredentialAuthorizationToken *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DCCredentialAuthorizationToken *v15;
  _TtC7idcredd26BiometricStoreSessionProxy *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100168120, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100168148, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100174F20;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100168170, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100174F28;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1000E9578((uint64_t)v9, (uint64_t)&unk_100174F30, (uint64_t)v14);
  swift_release(v17);
}

- (void)credentialAuthenticationTokenStatus:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001680A8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001680D0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174F00;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001680F8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100174F08;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174F10, (uint64_t)v12);
  swift_release(v14);
}

- (void)getCASDCertificate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100168030, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100168058, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174EE0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100168080, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100174EE8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174EF0, (uint64_t)v12);
  swift_release(v14);
}

- (void)getGlobalProgenitorKeyAttestation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100167FB8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100167FE0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174EC0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100168008, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100174EC8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174ED0, (uint64_t)v12);
  swift_release(v14);
}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100167F40, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100167F68, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174EA0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100167F90, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100174EA8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174EB0, (uint64_t)v12);
  swift_release(v14);
}

- (void)boundAppletPresentmentACL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100167EC8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100167EF0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174E80;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100167F18, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100174E88;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174E90, (uint64_t)v12);
  swift_release(v14);
}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(NSData *)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  _TtC7idcredd26BiometricStoreSessionProxy *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject(&unk_100167E50, 48, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100167E78, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100174E60;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100167EA0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100175980;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  v19 = sub_1000E9578((uint64_t)v11, (uint64_t)&unk_100174E70, (uint64_t)v16);
  swift_release(v19);
}

- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7idcredd26BiometricStoreSessionProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100008E84(&qword_100174E30);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100167DD8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100167E00, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100174E40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100167E28, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100175920;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1000E9578((uint64_t)v7, (uint64_t)&unk_100174E50, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC7idcredd26BiometricStoreSessionProxy)init
{
  _TtC7idcredd26BiometricStoreSessionProxy *result;

  result = (_TtC7idcredd26BiometricStoreSessionProxy *)_swift_stdlib_reportUnimplementedInitializer("idcredd.BiometricStoreSessionProxy", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
