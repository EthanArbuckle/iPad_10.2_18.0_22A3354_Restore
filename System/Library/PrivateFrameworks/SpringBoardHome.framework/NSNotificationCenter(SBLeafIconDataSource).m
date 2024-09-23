@implementation NSNotificationCenter(SBLeafIconDataSource)

+ (id)sbh_leafIconDataSourceNotificationCenter
{
  if (sbh_leafIconDataSourceNotificationCenter_onceToken != -1)
    dispatch_once(&sbh_leafIconDataSourceNotificationCenter_onceToken, &__block_literal_global_273);
  return (id)sbh_leafIconDataSourceNotificationCenter_sbh_leafIconDataSourceNotificationCenter;
}

@end
