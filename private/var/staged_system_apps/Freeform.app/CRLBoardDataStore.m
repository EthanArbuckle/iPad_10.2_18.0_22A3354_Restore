@implementation CRLBoardDataStore

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_queue));
}

- (NSURL)storeURL
{
  id v2;

  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_storeURL);
  return (NSURL *)v2;
}

- (OS_os_log)logCategory
{
  return (OS_os_log *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_logCategory));
}

- (NSString)storeName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->queue[OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_storeName];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (double)lastFetchResultsTime
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_lastFetchResultsTime);
}

- (void)setLastFetchResultsTime:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_lastFetchResultsTime) = a3;
}

- (NSSet)recordIDsToOverwrite
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_recordIDsToOverwrite);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_recordIDsToOverwrite, v6, 0, 0);
  v3 = *v2;
  sub_1004B8930(0, &qword_1013E8810, CKRecordID_ptr);
  sub_1005A15B8(&qword_1013E8818, &qword_1013E8810, CKRecordID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  swift_bridgeObjectRetain(v3);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (void)setRecordIDsToOverwrite:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  _BYTE v9[24];

  v5 = sub_1004B8930(0, &qword_1013E8810, CKRecordID_ptr);
  v6 = sub_1005A15B8(&qword_1013E8818, &qword_1013E8810, CKRecordID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_recordIDsToOverwrite);
  swift_beginAccess(v8, v9, 1, 0);
  *v8 = v7;
  swift_bridgeObjectRelease();
}

- (_TtC8Freeform15CRLAssetManager)assetManager
{
  _TtC8Freeform17CRLBoardDataStore *v2;
  id v3;

  v2 = self;
  v3 = sub_100A667BC();

  return (_TtC8Freeform15CRLAssetManager *)v3;
}

- (_TtC8Freeform19CRLAssetFileManager)assetFileManager
{
  _TtC8Freeform17CRLBoardDataStore *v2;
  id v3;

  v2 = self;
  v3 = sub_100A64F70();

  return (_TtC8Freeform19CRLAssetFileManager *)v3;
}

- (CRContext)crdtContext
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_crdtContext));
}

- (NSBundle)assetBundle
{
  return (NSBundle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_assetBundle));
}

- (void)openDatabaseWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8Freeform17CRLBoardDataStore *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_101293758, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100A9EEDC((uint64_t)sub_1006DD77C, v5, (uint64_t)&OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue, (uint64_t)&unk_101293708, (uint64_t)sub_100B01080, (uint64_t)&unk_101293720);
  swift_release(v5);

}

- (void)openDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform17CRLBoardDataStore *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101293668, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101293690, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1014055A0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1012936B8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1014055A8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_1014055B0, (uint64_t)v12);
  swift_release(v14);
}

- (void)closeDatabaseWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8Freeform17CRLBoardDataStore *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_101293640, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100A9EEDC((uint64_t)sub_100565828, v5, (uint64_t)&OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue, (uint64_t)&unk_1012935F0, (uint64_t)sub_100B00FBC, (uint64_t)&unk_101293608);
  swift_release(v5);

}

- (void)closeDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform17CRLBoardDataStore *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101293550, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101293578, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101405580;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1012935A0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_101405588;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405590, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC8Freeform17CRLBoardDataStore)init
{
  _TtC8Freeform17CRLBoardDataStore *result;

  result = (_TtC8Freeform17CRLBoardDataStore *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardDataStore", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_storeURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_database));

  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_storeName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_recordIDsToOverwrite));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_syncHelper));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore__assetManagerLock));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore__assetFileManagerLock));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore__assetDownloadManagerLock));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore__assetDownloadManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_assetUploadTracker));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_accountUtilities));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_transientSyncExclusions));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_deletedBoardsCleanupWorkItem));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_sideStore));

}

+ (id)newTransientStoreWithQueue:(id)a3 error:(id *)a4
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = sub_100AFD864(v4);

  return v5;
}

- (void)beginExclusiveRead
{
  dispatch_suspend(*(dispatch_object_t *)((char *)&self->super.isa
                                        + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue));
}

- (void)endExclusiveRead
{
  dispatch_resume(*(dispatch_object_t *)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_writeQueue));
}

- (BOOL)ensureOwnershipOfDataAndReturnError:(id *)a3
{
  return sub_100AD3300(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)sub_100B00F14);
}

- (void)upgradeForRdar_102994991
{
  _TtC8Freeform17CRLBoardDataStore *v2;

  v2 = self;
  sub_100A760AC();

}

- (void)upgradeForRdar_119152219
{
  _TtC8Freeform17CRLBoardDataStore *v2;

  v2 = self;
  sub_100A76374();

}

- (void)upgradeSyncMetadataToNewFormat_105187224
{
  _TtC8Freeform17CRLBoardDataStore *v2;

  v2 = self;
  sub_100A769A4();

}

- (void)scheduleCleanupForBoardsPastTTLOnCleanup:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  _TtC8Freeform17CRLBoardDataStore *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_101293488, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1006DBA10;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100A98BBC((uint64_t)v7, v6);
  sub_1004C1024((uint64_t)v7, v6);

}

- (BOOL)shouldPerformFetchWithLastSaveChangesTime:(double)a3
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLBoardDataStore_lastFetchResultsTime) >= a3;
}

- (id)fetchZonesNeedingRefetchFor:(unint64_t)a3 error:(id *)a4
{
  _TtC8Freeform17CRLBoardDataStore *v4;
  uint64_t v5;
  Class isa;
  _QWORD v8[5];

  v8[2] = self;
  v8[3] = a3;
  v4 = self;
  v5 = sub_1004B804C(&qword_1013E0238);
  OS_dispatch_queue.sync<A>(execute:)(sub_100B00D68, v8, v5);

  sub_1004B8930(0, (unint64_t *)&qword_1013E1770, CKRecordZoneID_ptr);
  sub_1005A15B8((unint64_t *)&qword_1013E1778, (unint64_t *)&qword_1013E1770, CKRecordZoneID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)fetchZonesNeedingRefetchFor:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC8Freeform17CRLBoardDataStore *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1012933C0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1012933E8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_101405558;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_101293410, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_101405560;
  v14[5] = v13;
  v15 = self;
  v16 = sub_100C46C50((uint64_t)v9, (uint64_t)&unk_101405568, (uint64_t)v14);
  swift_release(v16);
}

- (void)addZonesToRefetch:(NSSet *)a3 version:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSSet *v17;
  _TtC8Freeform17CRLBoardDataStore *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1012932F8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_101293320, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_101405530;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_101293348, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_101405538;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  v19 = sub_100C46C50((uint64_t)v11, (uint64_t)&unk_101405540, (uint64_t)v16);
  swift_release(v19);
}

- (BOOL)_addZonesToRefetch:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8Freeform17CRLBoardDataStore *v11;

  v8 = sub_1004B8930(0, (unint64_t *)&qword_1013E1770, CKRecordZoneID_ptr);
  v9 = sub_1005A15B8((unint64_t *)&qword_1013E1778, (unint64_t *)&qword_1013E1770, CKRecordZoneID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v8, v9);
  v11 = self;
  sub_100AB15FC(v10, a4);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)removeZoneToRefetch:(CKRecordZoneID *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CKRecordZoneID *v15;
  _TtC8Freeform17CRLBoardDataStore *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_101293208, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_101293230, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_101405510;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_101293258, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_101405518;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100C46C50((uint64_t)v9, (uint64_t)&unk_101405520, (uint64_t)v14);
  swift_release(v17);
}

- (void)updateRefetchStatusAfterSuccessfulRefetchFor:(CKRecordZoneID *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CKRecordZoneID *v15;
  _TtC8Freeform17CRLBoardDataStore *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_101293140, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_101293168, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1014054F0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_101293190, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1014054F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100C46C50((uint64_t)v9, (uint64_t)&unk_101405500, (uint64_t)v14);
  swift_release(v17);
}

- (void)addUnsupportedZonesToRefetch:(NSSet *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSSet *v15;
  _TtC8Freeform17CRLBoardDataStore *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_101293078, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1012930A0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1014054D0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1012930C8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1014054D8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100C46C50((uint64_t)v9, (uint64_t)&unk_1014054E0, (uint64_t)v14);
  swift_release(v17);
}

- (BOOL)_addUnsupportedZonesToRefetch:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform17CRLBoardDataStore *v9;

  v6 = sub_1004B8930(0, (unint64_t *)&qword_1013E1770, CKRecordZoneID_ptr);
  v7 = sub_1005A15B8((unint64_t *)&qword_1013E1778, (unint64_t *)&qword_1013E1770, CKRecordZoneID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v6, v7);
  v9 = self;
  sub_100AB3B88(v8);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)removeUnsupportedZoneToRefetch:(CKRecordZoneID *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CKRecordZoneID *v15;
  _TtC8Freeform17CRLBoardDataStore *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_101292FB0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_101292FD8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1014054C0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_101293000, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10140B7B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100C46C50((uint64_t)v9, (uint64_t)&unk_101405D50, (uint64_t)v14);
  swift_release(v17);
}

- (BOOL)saveAssetEntryWithAssetUUID:(id)a3 fileExtension:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC8Freeform17CRLBoardDataStore *v16;
  _BYTE v18[16];

  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  __chkstk_darwin(v12);
  *(_QWORD *)&v18[-32] = self;
  *(_QWORD *)&v18[-24] = v11;
  *(_QWORD *)&v18[-16] = v15;
  *(_QWORD *)&v18[-8] = v14;
  v16 = self;
  OS_dispatch_queue.sync<A>(execute:)(sub_100B001C4, &v18[-48], (char *)&type metadata for () + 8);
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)removeAllTombstoneDataAndReturnError:(id *)a3
{
  return sub_100AD3300(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)sub_100B00184);
}

- (BOOL)sync_resetSyncStateAndRemoveTombstonesAndReturnError:(id *)a3
{
  return sub_100AD3300(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)sub_100B00144);
}

- (BOOL)sync_removeAllAccountDataAndReturnError:(id *)a3
{
  return sub_100AD3300(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)sub_100B00104);
}

@end
