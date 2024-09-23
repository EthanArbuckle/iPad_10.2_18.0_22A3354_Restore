@implementation RDXPCStorePerformer

- (void)dealloc
{
  _TtC7remindd19RDXPCStorePerformer *v2;

  v2 = self;
  sub_1000090C4();
}

- (void).cxx_destruct
{

  sub_1000178E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity), *(_QWORD *)&self->storeController[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity], *(_QWORD *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity], *(_QWORD *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 8], *(_QWORD *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 16], *(unsigned int *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 24] | ((unint64_t)*(unsigned __int16 *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 28] << 32));
  swift_release(*(_QWORD *)&self->storeController[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_storeProvider]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_dataAccessRequestsWriter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_contactInteractionWriter));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_coreSuggestionsHandler));
  sub_10000882C((uint64_t)self + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_publicCloudDatabaseController, &qword_100846568);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_sharingObserverForAccountID));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_shareRecordIDToRootRecordID));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_shareRecordIDToRootRecordIDLock));
}

- (void)performInvocation:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100017C90);
}

- (_TtC7remindd19RDXPCStorePerformer)init
{
  _TtC7remindd19RDXPCStorePerformer *result;

  result = (_TtC7remindd19RDXPCStorePerformer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDXPCStorePerformer", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)executeFetchRequest:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CA9D0);
}

- (void)performSwiftInvocation:(id)a3 withParametersData:(id)a4 storages:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _TtC7remindd19RDXPCStorePerformer *v20;

  v10 = _Block_copy(a6);
  v11 = a3;
  v12 = a4;
  v20 = self;
  v13 = a5;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;

  if (v13)
  {
    v17 = sub_1000151B0(0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr);
    v18 = sub_1000E51DC((unint64_t *)&qword_10083A1F0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, v17, (char *)&type metadata for Any + 8, v18);

  }
  else
  {
    v19 = 0;
  }
  _Block_copy(v10);
  sub_1004CA4A0(v11, v14, v16, v19, (uint64_t)v20, (uint64_t)v20, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_bridgeObjectRelease();
  sub_1000A71C8(v14, v16);

}

- (void)fetchReplicaManagerForAccountID:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CADBC);
}

- (void)fetchReplicaManagersForAccountID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  _TtC7remindd19RDXPCStorePerformer *v10;

  v8 = _Block_copy(a5);
  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_1004CAF4C((uint64_t)a3, (uint64_t)v10);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)fetchMinimumSearchTermLengthByBaseLanguageWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC7remindd19RDXPCStorePerformer *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001A630(&qword_100839A10);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1007F7090, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1007F70B8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10084CC10;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1007F70E0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10084CC20;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1004C97A4((uint64_t)v7, (uint64_t)&unk_10084CC30, (uint64_t)v12);
  swift_release(v14);
}

- (void)compressedDistributedEvaluationDataWithOptions:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CB0F4);
}

- (void)saveAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5 smartListStorages:(id)a6 smartListSectionStorages:(id)a7 templateStorages:(id)a8 templateSectionStorages:(id)a9 reminderStorages:(id)a10 changedKeys:(id)a11 replicaManagers:(id)a12 author:(id)a13 mode:(unint64_t)a14 synchronously:(BOOL)a15 syncToCloudKit:(BOOL)a16 completion:(id)aBlock
{
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _TtC7remindd19RDXPCStorePerformer *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;

  v23 = _Block_copy(aBlock);
  v24 = sub_1000151B0(0, &qword_10083FF70, REMAccountStorage_ptr);
  v50 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v24);
  v25 = sub_1000151B0(0, (unint64_t *)&unk_100844190, REMListStorage_ptr);
  v48 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v25);
  v26 = sub_1000151B0(0, (unint64_t *)&qword_10083AC08, REMListSectionStorage_ptr);
  v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v26);
  v27 = sub_1000151B0(0, &qword_10083B1D8, REMSmartListStorage_ptr);
  v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v27);
  v28 = sub_1000151B0(0, (unint64_t *)&qword_100840F80, REMSmartListSectionStorage_ptr);
  v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, v28);
  v29 = sub_1000151B0(0, &qword_10083D0D8, REMTemplateStorage_ptr);
  v44 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a8, v29);
  v30 = sub_1000151B0(0, &qword_1008431C8, REMTemplateSectionStorage_ptr);
  v43 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a9, v30);
  v31 = sub_1000151B0(0, &qword_10083FEE8, REMReminderStorage_ptr);
  v42 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a10, v31);
  v32 = sub_1000151B0(0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr);
  v33 = sub_10001A630(&qword_100841A60);
  v34 = sub_1000E51DC((unint64_t *)&qword_10083A1F0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v35 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a11, v32, v33, v34);
  v36 = sub_1000151B0(0, &qword_10083A208, REMReplicaManagerSerializedData_ptr);
  v37 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a12, v32, v36, v34);
  if (a13)
  {
    v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(a13);
    v40 = v39;
  }
  else
  {
    v38 = 0;
    v40 = 0;
  }
  _Block_copy(v23);
  v41 = self;
  sub_1004CC088(v50, v48, v47, v46, v45, v44, v43, v42, v35, v37, v38, v40, a14, a15, a16, v41, v23);
  _Block_release(v23);
  _Block_release(v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fetchShareForObjectWithID:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CCFC4);
}

- (void)createShareForObjectWithID:(id)a3 appIconData:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  _TtC7remindd19RDXPCStorePerformer *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;

  v7 = _Block_copy(a5);
  v8 = a3;
  v9 = self;
  if (a4)
  {
    v10 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v12 = v11;

  }
  else
  {
    v12 = 0xF000000000000000;
  }
  _Block_copy(v7);
  sub_1004CD300((uint64_t)a3, (uint64_t)a4, v12, (uint64_t)self, (void (**)(_QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_1000A71B4((uint64_t)a4, v12);

}

- (void)updateShare:(id)a3 accountID:(id)a4 completion:(id)a5
{
  sub_1004BEB2C(self, (int)a2, a3, (uint64_t)a4, a5, (void (*)(id, uint64_t, uint64_t, id, void *))sub_1004CD64C);
}

- (void)stopShare:(id)a3 accountID:(id)a4 completion:(id)a5
{
  sub_1004BEB2C(self, (int)a2, a3, (uint64_t)a4, a5, (void (*)(id, uint64_t, uint64_t, id, void *))sub_1004CD8B4);
}

- (void)addCKShareObserverIfNeededForAccountID:(id)a3 completion:(id)a4
{
  sub_100104058(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1004CDB1C);
}

- (void)acceptShareWithMetadata:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CE008);
}

- (void)acceptCalDAVShareWithCalendarURL:(id)a3 acAccountID:(id)a4 completion:(id)a5
{
  sub_1001000A0(self, (int)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_1004CE380);
}

- (void)rejectCalDAVShareWithCalendarURL:(id)a3 acAccountID:(id)a4 completion:(id)a5
{
  sub_1001000A0(self, (int)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_1004CE678);
}

- (void)fetchContentAttributesOfTemplateWithObjectID:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CE970);
}

- (void)createOrUpdatePublicLinkForTemplateWithObjectID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  sub_1004C0980(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_1004CEA60);
}

- (void)createPublicContentPreviewOfTemplateWithObjectID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  sub_1004C0980(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_1004CED00);
}

- (void)revokePublicLinkForTemplateWithObjectID:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CEDF4);
}

- (void)downloadPublicTemplateWithPublicLinkURLUUID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC7remindd19RDXPCStorePerformer *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_1004CF080((uint64_t)v10, (uint64_t)v12, (void (**)(_QWORD, _QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)clearGroceryLocalCorrectionsOfListsOwnedByCurrentUserWithCompletion:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_1004CF30C);
}

- (void)fetchSuggestedSectionNamesFromGroceryClassifierWithGroceryLocaleID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _TtC7remindd19RDXPCStorePerformer *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_10001A630(&qword_100839A10);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = swift_allocObject(&unk_1007F6938, 24, 7);
  *(_QWORD *)(v14 + 16) = v10;
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_1007F6960, 64, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v11;
  v16[5] = v13;
  v16[6] = sub_1004D26F8;
  v16[7] = v14;
  v17 = self;
  swift_bridgeObjectRetain(v13);
  swift_retain();
  v18 = sub_1000CAAE0((uint64_t)v9, (uint64_t)&unk_10084CBF8, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release(v14);
  swift_release(v18);
}

- (void)fetchSuggestedSectionsForRemindersWithReminderTitles:(id)a3 fromGroceryClassifierWithGroceryLocaleIDs:(id)a4 maxSuggestionsCountPerReminderTitle:(id)a5 confidenceScoreThreshold:(id)a6 shouldUseGlobalCorrections:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v8;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  _TtC7remindd19RDXPCStorePerformer *v19;

  v8 = a7;
  v14 = _Block_copy(a8);
  v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  v16 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  _Block_copy(v14);
  v17 = a5;
  v18 = a6;
  v19 = self;
  sub_1004CF554(v15, v16, a5, a6, v8, (void (**)(_QWORD, _QWORD, _QWORD))v14);
  _Block_release(v14);
  _Block_release(v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fetchGroceryLocalCorrectionsOfListWithObjectID:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1004CF778);
}

- (void)fetchShouldSuggestConvertToGroceryWithObjectID:(id)a3 usingGroceryClassifierWithGroceryLocaleID:(id)a4 completion:(id)a5
{
  void *v7;
  id v8;
  _TtC7remindd19RDXPCStorePerformer *v9;

  v7 = _Block_copy(a5);
  _Block_copy(v7);
  v8 = a3;
  v9 = self;
  sub_1004CFA94((uint64_t)v8, (uint64_t)v9, v7);
  _Block_release(v7);
  _Block_release(v7);

}

- (void)requestShouldSuggestConvertToGroceryWithObjectID:(id)a3
{
  id v4;
  _TtC7remindd19RDXPCStorePerformer *v5;

  v4 = a3;
  v5 = self;
  sub_1004C33D4((uint64_t)v4);

}

- (void)setOverridingGroceryCategorizationSecondaryGroceryLocales:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC7remindd19RDXPCStorePerformer *v8;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = type metadata accessor for Locale(0);
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  }
  _Block_copy(v6);
  v8 = self;
  sub_1004CFCF0((uint64_t)a3, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)notifyOfInteractionWithPeople:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7remindd19RDXPCStorePerformer *v9;

  v6 = _Block_copy(a4);
  v7 = sub_1000151B0(0, &qword_10084CB80, INPerson_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_1004CFFEC(v8, (uint64_t)v9);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)updateAccountsAndFetchMigrationState:(BOOL)a3 completion:(id)a4
{
  void *v6;
  _TtC7remindd19RDXPCStorePerformer *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1004D0820(a3, (uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)updateAccountWithACAccountID:(id)a3 restartDA:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _TtC7remindd19RDXPCStorePerformer *v12;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  _Block_copy(v8);
  v12 = self;
  sub_1004D0994(v9, v11, a4, (uint64_t)v12, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)removeOrphanedAccountWithCompletion:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_1004D0BBC);
}

- (void)requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
  sub_100104058(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1004D0D5C);
}

- (void)requestToDeleteSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
  void (**v5)(void *, _QWORD);
  id v6;
  _TtC7remindd19RDXPCStorePerformer *v7;

  v5 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = self;
  sub_1004D05B4();
  v6 = objc_msgSend((id)objc_opt_self(REMUserDefaults), "daemonUserDefaults");
  objc_msgSend(v6, "setAcAccountIdentifierToMergeLocalDataIntoSyncData:", 0);

  v5[2](v5, 0);
  _Block_release(v5);

}

- (void)requestToDeleteLocalDataWithCompletion:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_1004D0F64);
}

- (void)uncachedSuggestedAttributesPerformerWithReason:(id)a3 completion:(id)a4
{
  void *v5;
  _TtC7remindd19RDXPCStorePerformer *v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  sub_1004D1100(v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

}

- (void)anchoredBubbleEnabledWithCompletion:(id)a3
{
  void *v4;
  _TtC7remindd19RDXPCStorePerformer *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1004D12F4((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)requestDownloadGroceryModelAssetsFromTrial
{
  _TtC7remindd19RDXPCStorePerformer *v2;

  v2 = self;
  sub_1004C4FB0();

}

- (void)MCIsManagedAccountWithObjectID:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC7remindd19RDXPCStorePerformer *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1004D1508(v7, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)requestToUpdateClientConnectionsWithShouldKeepAlive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _TtC7remindd19RDXPCStorePerformer *v6;
  id v7;
  uint64_t *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = self;
  v7 = objc_msgSend(v5, "defaultCenter");
  if (v3)
  {
    if (qword_1008374A8 != -1)
      swift_once(&qword_1008374A8, sub_1004200AC);
    v8 = &qword_100871EE0;
  }
  else
  {
    if (qword_1008374B0 != -1)
      swift_once(&qword_1008374B0, sub_1004200E0);
    v8 = &qword_100871EE8;
  }
  v9 = (id)*v8;
  objc_msgSend(v7, "postNotificationName:object:", v9, 0);

}

- (void)validatePhantomObjectsWith:(id)a3 shouldRepair:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC7remindd19RDXPCStorePerformer *v12;

  v8 = _Block_copy(a5);
  v9 = sub_1000151B0(0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = swift_allocObject(&unk_1007F65C8, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  sub_1004C55B0(v10, a4, (uint64_t)sub_1004D230C, v11);

  swift_bridgeObjectRelease();
  swift_release(v11);
}

- (void)batchDeleteExpiredRemindersWith:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC7remindd19RDXPCStorePerformer *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1004D1DA4((uint64_t)a3, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)permanentlyHideRemindersWith:(id)a3 accountID:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC7remindd19RDXPCStorePerformer *v12;

  v8 = _Block_copy(a5);
  v9 = type metadata accessor for Date(0);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, v9, &protocol witness table for String);
  _Block_copy(v8);
  v11 = a4;
  v12 = self;
  sub_1004D1FF4(v10, (uint64_t)v11, (uint64_t)v12, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

@end
