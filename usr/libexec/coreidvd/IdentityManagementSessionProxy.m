@implementation IdentityManagementSessionProxy

- (void)triggerAssetsUploadWithProofingOptions:(unint64_t)a3 canUploadOnExpensiveNetwork:(BOOL)a4 completion:(id)a5
{
  void *v8;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  swift_retain(self);
  sub_1004B89AC(a3, a4, (uint64_t)self, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_release(self);
}

- (void)prepareForProofingDisplay:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 idType:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v19;
  uint64_t v20;
  uint64_t v21;

  v11 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_100619DE0, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_100619E08, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100643910;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_100619E30, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100643918;
  v18[5] = v17;
  v19 = a3;
  swift_retain(self);
  v20 = sub_1004B685C((uint64_t)v13, (uint64_t)&unk_100643920, (uint64_t)v18);
  swift_release(v20);
}

- (void)prepareForProofingIdentity:(_TtC13CoreIDVShared25IdentityProofingDocuments *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC13CoreIDVShared25IdentityProofingDocuments *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100619D68, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100619D90, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1006438F0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100619DB8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1006438F8;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_100643900, (uint64_t)v14);
  swift_release(v16);
}

- (void)fetchImageQualitySettingsWithCompletion:(id)a3
{
  sub_1004B5070((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1004B8D08);
}

- (void)fetchExtendedReviewDisplayInfo:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100619CF0, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100619D18, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1006438C8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100619D40, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1006438D0;
  v16[5] = v15;
  v17 = a3;
  swift_retain(self);
  v18 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_1006438D8, (uint64_t)v16);
  swift_release(v18);
}

- (void)provisionIdentityWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
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
  uint64_t v18;
  uint64_t v19;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100619C78, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100619CA0, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1006438A8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100619CC8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1006438B0;
  v16[5] = v15;
  v17 = a3;
  swift_retain(self);
  v18 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_1006438B8, (uint64_t)v16);
  swift_release(v18);
}

- (void)proofIdentity:(id)a3 :(unint64_t)a4 :(BOOL)a5 totalUploadAssetsFileSizeInBytes:(int64_t)a6 completion:(id)a7
{
  _BOOL4 v8;
  void *v12;
  uint64_t v13;
  id v14;

  v8 = a5;
  v12 = _Block_copy(a7);
  v13 = swift_allocObject(&unk_100619C50, 24, 7);
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  swift_retain(self);
  sub_1004AE148(v14, a4, v8, a6, (uint64_t)sub_1001FB220, v13);
  swift_release(v13);
  swift_release(self);

}

- (void)fetchTermsAndConditionsWithCompletion:(id)a3
{
  sub_1004B5070((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1004B97EC);
}

- (void)proofIdentityUsing:(id)a3 proofingOptions:(unint64_t)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  _Block_copy(v8);
  swift_retain(self);
  sub_1004B9C50(v9, v11, a4, (uint64_t)self, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_release(self);
  swift_bridgeObjectRelease(v11);
}

- (void)proofingCancelledWithConfiguration:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100619BD8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100619C00, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100643880;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100619C28, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100643888;
  v16[5] = v15;
  v17 = a3;
  swift_retain(self);
  v18 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_100643890, (uint64_t)v16);
  swift_release(v18);
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
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
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100619B60, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100619B88, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100643860;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100619BB0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100643868;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain(self);
  v19 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_100643870, (uint64_t)v16);
  swift_release(v19);
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_100619AE8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100619B10, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100643840;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100619B38, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100643848;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100643850, (uint64_t)v12);
  swift_release(v13);
}

- (void)isWatchPairedWithIdType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100619A70, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100619A98, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100643820;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100619AC0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100643828;
  v14[5] = v13;
  swift_retain(self);
  v15 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_100643830, (uint64_t)v14);
  swift_release(v15);
}

- (void)setGlobalBoundACLWithData:(NSData *)a3 type:(int64_t)a4 completionHandler:(id)a5
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
  uint64_t v18;
  uint64_t v19;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1006199F8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100619A20, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100643800;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100619A48, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100643808;
  v16[5] = v15;
  v17 = a3;
  swift_retain(self);
  v18 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_100643810, (uint64_t)v16);
  swift_release(v18);
}

- (void)setModifiedGlobalBoundACLWithData:(NSData *)a3 externalizedLAContext:(NSData *)a4 completionHandler:(id)a5
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
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100619980, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1006199A8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1006437E0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1006199D0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1006437E8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain(self);
  v19 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_1006437F0, (uint64_t)v16);
  swift_release(v19);
}

- (void)retrieveBioBindingUnboundACLWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_100619908, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100619930, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1006437C0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100619958, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1006437C8;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_1006437D0, (uint64_t)v12);
  swift_release(v13);
}

- (void)retrievePasscodeBindingUnboundACLWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_100619890, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1006198B8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1006437A0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1006198E0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1006437A8;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_1006437B0, (uint64_t)v12);
  swift_release(v13);
}

- (void)retrieveBoundACLWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_100619818, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100619840, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100643780;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100619868, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100643788;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100643790, (uint64_t)v12);
  swift_release(v13);
}

- (void)deleteBoundACLWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_1006197A0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1006197C8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100643760;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1006197F0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100643768;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100643770, (uint64_t)v12);
  swift_release(v13);
}

- (void)fetchBioBindingDetailsWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_100619728, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100619750, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100643740;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100619778, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100643748;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100643750, (uint64_t)v12);
  swift_release(v13);
}

- (void)getLivenessConfigWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_1006196B0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1006196D8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100643720;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100619700, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100643728;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100643730, (uint64_t)v12);
  swift_release(v13);
}

- (void)uploadLivenessVideoWithLivenessVideoURL:(_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)a3 shouldScheduleUploads:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject(&unk_100619638, 48, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100619660, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100643700;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100619688, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100643708;
  v16[5] = v15;
  v17 = a3;
  swift_retain(self);
  v18 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_100643710, (uint64_t)v16);
  swift_release(v18);
}

- (void)saveIdentityProofingBiomeDataSharingUserConsent:(BOOL)a3 state:(NSString *)a4 proofingOptions:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;

  v11 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject(&unk_1006195C0, 56, 7);
  *(_BYTE *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_QWORD *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_1006195E8, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1006436D8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_100619610, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1006436E0;
  v18[5] = v17;
  v19 = a4;
  swift_retain(self);
  v20 = sub_1004B685C((uint64_t)v13, (uint64_t)&unk_1006436E8, (uint64_t)v18);
  swift_release(v20);
}

- (void)fetchBiomeFedStatsUIWithCompletion:(id)a3
{
  sub_1004B5070((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1004BB0E8);
}

- (void)clearDataAfterTerminalProofingStateWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
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
  uint64_t v18;
  uint64_t v19;

  v9 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100619548, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100619570, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1006436B8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100619598, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1006436C0;
  v16[5] = v15;
  v17 = a3;
  swift_retain(self);
  v18 = sub_1004B685C((uint64_t)v11, (uint64_t)&unk_1006436C8, (uint64_t)v16);
  swift_release(v18);
}

- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3
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
  v9 = swift_allocObject(&unk_1006194A8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1006194D0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100643678;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1006194F8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100634BB0;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100631240, (uint64_t)v12);
  swift_release(v13);
}

@end
