@implementation WFShazamActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  char v4;

  sub_1C1B0F164();
  sub_1C1B0F224();
  v4 = static ShazamActionMigration.workflowNeedsMigration(_:fromClientVersion:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)migrateWorkflow
{
  WFShazamActionMigration *v2;

  v2 = self;
  ShazamActionMigration.migrateWorkflow()();

}

- (WFShazamActionMigration)init
{
  return (WFShazamActionMigration *)ShazamActionMigration.init()();
}

@end
