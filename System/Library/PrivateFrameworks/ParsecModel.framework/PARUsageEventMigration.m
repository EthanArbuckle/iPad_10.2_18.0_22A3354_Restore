@implementation PARUsageEventMigration

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  PARUsageEventMigration *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  sub_217DC7E9C(v9, v10, v11);

  return 1;
}

- (PARUsageEventMigration)init
{
  return (PARUsageEventMigration *)PARUsageEventMigration.init()();
}

@end
