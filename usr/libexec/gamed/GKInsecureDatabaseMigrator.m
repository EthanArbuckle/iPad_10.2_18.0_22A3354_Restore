@implementation GKInsecureDatabaseMigrator

- (GKInsecureDatabaseMigrator)initWithInsecureDatabaseURL:(id)a3 secureDatabaseURL:(id)a4 persistentStoreCoordinator:(id)a5 options:(id)a6 fileManager:(id)a7 bundleID:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  GKInsecureDatabaseMigrator *result;
  uint64_t v28;

  v14 = sub_100161BD0(&qword_100315B00);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v28 - v18;
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v20 = type metadata accessor for URL(0);
    v21 = 0;
  }
  else
  {
    v20 = type metadata accessor for URL(0);
    v21 = 1;
  }
  v22 = 1;
  sub_100161B54((uint64_t)v19, v21, 1, v20);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v22 = 0;
  }
  v23 = type metadata accessor for URL(0);
  sub_100161B54((uint64_t)v17, v22, 1, v23);
  v24 = (uint64_t *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  sub_10019E098((uint64_t)v19, (uint64_t)v17, (uint64_t)a5, v24, (uint64_t)a7, v25, v26);
  return result;
}

- (void)migrate
{
  GKInsecureDatabaseMigrator *v2;

  v2 = self;
  InsecureDatabaseMigrator.migrate()();

}

- (GKInsecureDatabaseMigrator)init
{
  InsecureDatabaseMigrator.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  uint64_t v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR___GKInsecureDatabaseMigrator_insecureDatabaseURL;
  v4 = sub_10019FB28();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___GKInsecureDatabaseMigrator_secureDatabaseURL, v4);

  sub_100161FE0((Class *)((char *)&self->super.isa + OBJC_IVAR___GKInsecureDatabaseMigrator_persistentStoreCoordinator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKInsecureDatabaseMigrator_options), v6);
  swift_bridgeObjectRelease(*(_QWORD *)&self->fileManager[OBJC_IVAR___GKInsecureDatabaseMigrator_bundleID], v7);
}

@end
