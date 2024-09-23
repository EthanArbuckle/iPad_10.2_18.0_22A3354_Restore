@implementation MobileDocumentReaderSessionProxy

- (void)registerAuditToken:(_TtC7CoreIDV13XPCAuditToken *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV13XPCAuditToken *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100616D08, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100616D30, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FD00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616D58, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FD08;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FD10, (uint64_t)v14);
  swift_release(v16);
}

- (void)readerInstanceIdentifierWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100616C90, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100616CB8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10063FCE0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100616CE0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10063FCE8;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_10063FCF0, (uint64_t)v12);
  swift_release(v13);
}

- (void)prepareWith:(_TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100616C18, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100616C40, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FCC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616C68, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FCC8;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FCD0, (uint64_t)v14);
  swift_release(v16);
}

- (void)merchantFor:(NSString *)a3 completionHandler:(id)a4
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
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100616BA0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100616BC8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FCA0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616BF0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FCA8;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FCB0, (uint64_t)v14);
  swift_release(v16);
}

- (void)canRequestDocument:(_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV30XPCMobileDocumentReaderRequest *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100616B28, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100616B50, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FC80;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616B78, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FC88;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FC90, (uint64_t)v14);
  swift_release(v16);
}

- (void)readDocumentWith:(_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)a3 engagementType:(_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC7CoreIDV30XPCMobileDocumentReaderRequest *v17;
  _TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100616AB0, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100616AD8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10063FC60;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100616B00, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10063FC68;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain(self);
  v19 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_10063FC70, (uint64_t)v16);
  swift_release(v19);
}

- (void)cancelReadWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100616A38, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100616A60, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10063FC40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100616A88, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10063FC48;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_10063FC50, (uint64_t)v12);
  swift_release(v13);
}

- (void)identityKey:(_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1006169C0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1006169E8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FC20;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616A10, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FC28;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FC30, (uint64_t)v14);
  swift_release(v16);
}

- (void)deleteIdentityKey:(_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100616948, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100616970, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FC00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616998, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FC08;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FC10, (uint64_t)v14);
  swift_release(v16);
}

- (void)certificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1006168D0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1006168F8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FBE0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616920, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FBE8;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FBF0, (uint64_t)v14);
  swift_release(v16);
}

- (void)storeCertificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 certificateDER:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100616858, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100616880, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10063FBC0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1006168A8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10063FBC8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain(self);
  v19 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_10063FBD0, (uint64_t)v16);
  swift_release(v19);
}

- (void)deleteCertificate:(_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1006167E0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100616808, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063FBA0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100616830, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063FBA8;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063FBB0, (uint64_t)v14);
  swift_release(v16);
}

- (void)cachedIssuerRootsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100616768, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100616790, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10063FB80;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1006167B8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10063FB88;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_10063FB90, (uint64_t)v12);
  swift_release(v13);
}

- (void)clearCachedIssuerRootsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1006166F0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100616718, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10063FB60;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100616740, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10063FB68;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_10063FB70, (uint64_t)v12);
  swift_release(v13);
}

- (void)loadIssuerRootsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100616678, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1006166A0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10063FB50;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1006166C8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100634BB0;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100631240, (uint64_t)v12);
  swift_release(v13);
}

- (_TtC8coreidvd32MobileDocumentReaderSessionProxy)init
{
  _TtC8coreidvd32MobileDocumentReaderSessionProxy *result;

  swift_defaultActor_initialize(self, a2);
  result = (_TtC8coreidvd32MobileDocumentReaderSessionProxy *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.MobileDocumentReaderSessionProxy", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
