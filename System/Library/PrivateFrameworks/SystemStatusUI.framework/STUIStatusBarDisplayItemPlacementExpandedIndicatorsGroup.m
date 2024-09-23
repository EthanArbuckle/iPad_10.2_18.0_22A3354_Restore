@implementation STUIStatusBarDisplayItemPlacementExpandedIndicatorsGroup

+ (id)activityItemDisplayIdentifier
{
  return +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarActivityItem_SyncOnly, "defaultDisplayIdentifier");
}

@end
