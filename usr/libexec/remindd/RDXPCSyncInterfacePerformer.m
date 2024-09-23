@implementation RDXPCSyncInterfacePerformer

- (void)syncCloudKitWithReason:(id)a3 discretionary:(BOOL)a4 bypassThrottler:(BOOL)a5 completion:(id)a6
{
  sub_100139030(self, (int)a2, a3, a4, a5, a6, (uint64_t)&unk_1007E60D8, (uint64_t)sub_100119B24, (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))sub_1001333A8);
}

- (void)restartCloudKitSyncWithReason:(id)a3 bypassThrottler:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC7remindd27RDXPCSyncInterfacePerformer *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1007E5FC0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  sub_100134824(v10, a4, (uint64_t)sub_100119B24, v9);

  swift_release(v9);
}

- (void)syncDataAccessAccountsWithAccountIDs:(id)a3 bypassThrottler:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC7remindd27RDXPCSyncInterfacePerformer *v11;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v10 = swift_allocObject(&unk_1007E5F48, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = self;
  sub_100135788(v9, v5, (uint64_t)sub_100119B24, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)deleteApplicationDataFromCloudKitWithAccountID:(id)a3 completion:(id)a4
{
  sub_10013ACC8(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1007E5DE0, (uint64_t)sub_100119B24, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100136B7C);
}

- (void)migrateICloudCalDavToCloudKitWithAccountID:(id)a3 disableCache:(BOOL)a4 userInitiated:(BOOL)a5 completion:(id)a6
{
  sub_100139030(self, (int)a2, a3, a4, a5, a6, (uint64_t)&unk_1007E5C50, (uint64_t)sub_100009438, (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))sub_100137AD4);
}

- (void)debugDownloadMigrationCacheWithAccountID:(id)a3 completion:(id)a4
{
  sub_10013ACC8(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1007E5BB0, (uint64_t)sub_10013CFE0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1001390DC);
}

- (void)fetchUserRecordWithAccountID:(id)a3 completion:(id)a4
{
  sub_10013ACC8(self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_1007E5AE8, (uint64_t)sub_100009434, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100139F84);
}

- (void)setMigrationStateToDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 createZoneAccountIfFinishMigration:(BOOL)a5 accountID:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _TtC7remindd27RDXPCSyncInterfacePerformer *v16;

  v9 = a4;
  v10 = a3;
  v12 = _Block_copy(a7);
  if (a6)
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v14;
  }
  else
  {
    v13 = 0;
  }
  v15 = swift_allocObject(&unk_1007E59F8, 24, 7);
  *(_QWORD *)(v15 + 16) = v12;
  v16 = self;
  sub_10013AD7C(v10, v9, a5, v13, (uint64_t)a6, (uint64_t)sub_10011701C, v15);

  swift_release(v15);
  swift_bridgeObjectRelease(a6);
}

- (void)fetchServerRecordFor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7remindd27RDXPCSyncInterfacePerformer *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1007E5980, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_10013BFE4(v8, (uint64_t)sub_100009434, v7);

  swift_release(v7);
}

- (void)observeCloudKitNetworkActivityChanges
{
  uint64_t v2;
  _TtC7remindd27RDXPCSyncInterfacePerformer *v3;

  v3 = self;
  sub_10013C74C((uint64_t)v3, v2);

}

- (_TtC7remindd27RDXPCSyncInterfacePerformer)init
{
  _TtC7remindd27RDXPCSyncInterfacePerformer *result;

  result = (_TtC7remindd27RDXPCSyncInterfacePerformer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDXPCSyncInterfacePerformer", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_cloudKitThrottler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_discretionaryCloudKitThrottler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_dataAccessThrottler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_dataAccessRequestsWriter));
  swift_release(*(_QWORD *)&self->queue[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_storeProvider]);
  sub_1000178E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity), *(_QWORD *)&self->queue[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(_QWORD *)&self->storeController[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(_QWORD *)&self->cloudKitThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(_QWORD *)&self->discretionaryCloudKitThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity], *(unsigned int *)&self->dataAccessThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity] | ((unint64_t)*(unsigned __int16 *)&self->dataAccessThrottler[OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientIdentity + 4] << 32));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7remindd27RDXPCSyncInterfacePerformer_clientConnection);
}

@end
