@implementation WDEDatabaseManager

- (WDEDatabaseManager)init
{
  return (WDEDatabaseManager *)DatabaseManager.init()();
}

- (void)checkpoint
{
  WDEDatabaseManager *v2;

  v2 = self;
  DatabaseManager.checkpoint()();

}

@end
