@implementation InheritanceRequestManager

- (NSArray)preConnectEntitlements
{
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (void)configureExportedInterface:(id)a3
{
  id v4;
  _TtC13appleaccountd25InheritanceRequestManager *v5;

  v4 = a3;
  v5 = self;
  sub_100007820();

}

- (void)fetchBeneficiariesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC13appleaccountd25InheritanceRequestManager *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100265160, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  v6 = swift_allocObject(&unk_100265188, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_100005F28;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain(v5);
  sub_100006A8C((uint64_t)sub_1000057C8, v6);

  swift_release(v5);
  swift_release(v6);
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AAInheritanceDaemonProtocol;
}

- (_TtC13appleaccountd25InheritanceRequestManager)init
{
  return (_TtC13appleaccountd25InheritanceRequestManager *)sub_1000AAE6C();
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;

  v3 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__accountStore];
  v4 = sub_1000080B4(&qword_10028FA50);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__cleanupController];
  v6 = sub_1000080B4(&qword_10028FB08);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__beneficiaryDeclinedHandler];
  v8 = sub_1000080B4(&qword_10028FC00);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__responseHandler];
  v10 = sub_1000080B4(&qword_10028FC08);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__invitationHandler];
  v12 = sub_1000080B4(&qword_10028FC10);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__accessKeyHandler];
  v14 = sub_1000080B4(&qword_10028FC18);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__beneficiaryRemovedMessageHandler];
  v16 = sub_1000080B4((uint64_t *)&unk_10028FC20);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v17 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__messageProcessor];
  v18 = sub_1000080B4(&qword_10028FBB0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  swift_unknownObjectRelease(*(_QWORD *)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_controller]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->ownerHandle[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_ownerHandle]);
  sub_100006F58(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  sub_100006F58(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_setupMessenger]);
  sub_100006F58(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_idsMessenger]);
  swift_unknownObjectRelease(*(_QWORD *)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_messagingService]);

  swift_unknownObjectRelease(*(_QWORD *)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_securityManager]);
  sub_100006F58(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager]);
  swift_release(*(_QWORD *)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_cloudSharingController]);
  sub_1000B9D40(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_invitationResponder]);
  swift_unknownObjectRelease(*(_QWORD *)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_securityController]);
}

- (NSString)serviceName
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(AAInheritanceMachService);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)fetchManifestOptionsForContact:(id)a3 completion:(id)a4
{
  void *v6;
  _TtC13appleaccountd25InheritanceRequestManager *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_1000B7638((uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease(a3);

}

- (void)isRecipient:(id)a3 capableOf:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC13appleaccountd25InheritanceRequestManager *v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = *sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_idsMessenger], *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_idsMessenger]);
  _Block_copy(v8);
  v13 = a4;
  v14 = self;
  sub_100075830(v9, v11, v13, v12, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

- (void)setupBeneficiaryManifest:(id)a3 contactInfo:(id)a4 setupAuthToken:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC13appleaccountd25InheritanceRequestManager *v15;

  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = v12;
  _Block_copy(v10);
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  sub_1000B77E4(v14, a4, v11, v13, (char *)v15, v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_unknownObjectRelease(a4);
  swift_bridgeObjectRelease(v13);
}

- (void)updateBeneficiaryManifest:(id)a3 contactInfo:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  _TtC13appleaccountd25InheritanceRequestManager *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  swift_unknownObjectRetain(a4);
  v10 = self;
  sub_1000B7DF8((uint64_t)v9, (uint64_t)v10, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_unknownObjectRelease(a4);
}

- (void)updateAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
  sub_1000AE354(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_1000B7FB4);
}

- (void)removeBeneficiary:(id)a3 manifest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC13appleaccountd25InheritanceRequestManager *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1000B8940(v9, v11, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)removeBenefactor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC13appleaccountd25InheritanceRequestManager *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100265228, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1000AD4C8(v8, (uint64_t)sub_1000891D0, v7);

  swift_release(v7);
}

- (void)removeAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
  sub_1000AE354(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_1000B90B0);
}

- (void)fetchBenefactorsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _TtC13appleaccountd25InheritanceRequestManager *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1002650C0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  v6 = swift_allocObject(&unk_100264D28, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, self);
  v7 = (_QWORD *)swift_allocObject(&unk_1002650E8, 40, 7);
  v7[2] = sub_1000B9984;
  v7[3] = v5;
  v7[4] = v6;
  v8 = self;
  swift_retain(v5);
  swift_retain(v6);
  sub_1000CC71C((uint64_t)sub_1000B99B0, (uint64_t)v7);

  swift_release(v5);
  swift_release(v6);
  swift_release(v7);
}

- (void)fetchSuggestedBeneficiariesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t (*)(uint64_t, char), uint64_t, uint64_t, uint64_t);
  _TtC13appleaccountd25InheritanceRequestManager *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100265070, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager];
  v7 = *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager + 8];
  sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager], v6);
  v8 = swift_allocObject(&unk_100265098, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_1000B995C;
  *(_QWORD *)(v8 + 24) = v5;
  v9 = *(void (**)(uint64_t (*)(uint64_t, char), uint64_t, uint64_t, uint64_t))(v7 + 16);
  v10 = self;
  swift_retain(v5);
  v9(sub_100088B60, v8, v6, v7);

  swift_release(v5);
  swift_release(v8);
}

- (void)sendInvitationToContact:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC13appleaccountd25InheritanceRequestManager *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100264FA8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_1000AE818(a3, (uint64_t)sub_1000891D0, v7);
  swift_unknownObjectRelease(a3);

  swift_release(v7);
}

- (void)fetchInvitationsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC13appleaccountd25InheritanceRequestManager *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100264F58, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  v6 = swift_allocObject(&unk_100264F80, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_1000B971C;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain(v5);
  sub_1000C8D40((uint64_t)sub_1000B9744, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)fetchInvitationWithBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _TtC13appleaccountd25InheritanceRequestManager *v21;
  uint64_t v22;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v11 = __chkstk_darwin(v7, v10);
  v12 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v13);
  v15 = (char *)&v22 - v14;
  v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = swift_allocObject(&unk_100264F08, 24, 7);
  *(_QWORD *)(v17 + 16) = v16;
  sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v15, v7);
  v18 = *(unsigned __int8 *)(v8 + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = swift_allocObject(&unk_100264F30, v19 + v9, v18 | 7);
  *(_QWORD *)(v20 + 16) = sub_1000891CC;
  *(_QWORD *)(v20 + 24) = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v20 + v19, v12, v7);
  v21 = self;
  swift_retain(v17);
  sub_1000C8F4C((uint64_t)v15, (uint64_t)sub_1000B96DC, v20);

  swift_release(v17);
  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
}

- (void)removeInvitation:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC13appleaccountd25InheritanceRequestManager *v10;
  id v11;
  _TtC13appleaccountd25InheritanceRequestManager *v12;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100264EB8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000891D0;
  }
  else
  {
    v7 = 0;
  }
  sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  v8 = (_QWORD *)swift_allocObject(&unk_100264E90, 48, 7);
  v8[2] = a3;
  v8[3] = v6;
  v8[4] = v7;
  v8[5] = self;
  v9 = a3;
  v10 = self;
  v11 = v9;
  v12 = v10;
  sub_10000E1C0((uint64_t)v6, v7);
  sub_1000C8D40((uint64_t)sub_1000B9604, (uint64_t)v8);
  swift_release(v8);
  sub_10000D98C((uint64_t)v6, v7);

}

- (void)respondToInvitation:(id)a3 accepted:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)();
  uint64_t v15;
  _TtC13appleaccountd25InheritanceRequestManager *v16;
  uint64_t v17;

  v6 = a4;
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t (*)())_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (v14)
  {
    v15 = swift_allocObject(&unk_100264E18, 24, 7);
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_1000891D0;
  }
  else
  {
    v15 = 0;
  }
  v16 = self;
  sub_1000B079C((uint64_t)v13, v6, (uint64_t)v14, v15);
  sub_10000D98C((uint64_t)v14, v15);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)fetchAllHealthInfoWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC13appleaccountd25InheritanceRequestManager *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100264DC8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10000732C(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(_QWORD *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  v6 = swift_allocObject(&unk_100264DF0, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_1000B9400;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain(v5);
  sub_1000CDEE4((uint64_t)sub_1000B9428, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)presentInheritanceInvitationUIWithBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  _TtC13appleaccountd25InheritanceRequestManager *v14;
  uint64_t v15;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = swift_allocObject(&unk_100264D00, 24, 7);
  *(_QWORD *)(v13 + 16) = v12;
  v14 = self;
  sub_1000B127C((uint64_t)v11, (uint64_t)sub_1000889B4, v13);

  swift_release(v13);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)setupBeneficiaryAliasWithAccessKey:(id)a3 password:(id)a4 firstName:(id)a5 lastName:(id)a6 authToken:(id)a7 completion:(id)a8
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _TtC13appleaccountd25InheritanceRequestManager *v26;
  uint64_t v27;
  uint64_t v29;

  v13 = _Block_copy(a8);
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = v16;
  if (!a5)
  {
    v18 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v19;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v21;
LABEL_6:
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  v24 = v23;
  v25 = swift_allocObject(&unk_100264C88, 24, 7);
  *(_QWORD *)(v25 + 16) = v13;
  v26 = self;
  sub_1000B1C30(v29, v15, v27, v17, v18, (uint64_t)a5, v20, (uint64_t)a6, v22, v24, (uint64_t)sub_1000B93B4, v25);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v24);
  swift_release(v25);
  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(a5);
}

@end
