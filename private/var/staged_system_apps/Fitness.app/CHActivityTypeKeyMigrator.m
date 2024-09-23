@implementation CHActivityTypeKeyMigrator

- (CHActivityTypeKeyMigrator)initWithMigrationKeys:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  CHActivityTypeKeyMigrator *v11;
  objc_class *v12;
  objc_super v14;

  v5 = type metadata accessor for ActivityTypeKeyMigrator(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v10 = (void *)objc_opt_self(NSUserDefaults);
  v11 = self;
  ActivityTypeKeyMigrator.init(migrationKeys:userDefaults:)(v9, objc_msgSend(v10, "standardUserDefaults"));
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v11 + OBJC_IVAR___CHActivityTypeKeyMigrator_activityTypeKeyMigrator, v8, v5);

  v12 = (objc_class *)type metadata accessor for ActivityTypeKeyMigratorBridge(0);
  v14.receiver = v11;
  v14.super_class = v12;
  return -[CHActivityTypeKeyMigrator init](&v14, "init");
}

- (void)migrateIfNeeded
{
  CHActivityTypeKeyMigrator *v2;

  v2 = self;
  ActivityTypeKeyMigrator.migrateIfNeeded()();

}

- (CHActivityTypeKeyMigrator)init
{
  CHActivityTypeKeyMigrator *result;

  result = (CHActivityTypeKeyMigrator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivityTypeKeyMigratorBridge", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CHActivityTypeKeyMigrator_activityTypeKeyMigrator;
  v3 = type metadata accessor for ActivityTypeKeyMigrator(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
