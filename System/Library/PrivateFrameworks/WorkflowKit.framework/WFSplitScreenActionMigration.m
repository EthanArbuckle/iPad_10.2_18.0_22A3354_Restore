@implementation WFSplitScreenActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  char v4;

  sub_1C1B0F164();
  sub_1C1B0F224();
  v4 = static SplitScreenActionMigration.workflowNeedsMigration(_:fromClientVersion:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)migrateWorkflow
{
  WFSplitScreenActionMigration *v2;

  v2 = self;
  SplitScreenActionMigration.migrateWorkflow()();

}

- (WFSplitScreenActionMigration)init
{
  return (WFSplitScreenActionMigration *)SplitScreenActionMigration.init()();
}

@end
