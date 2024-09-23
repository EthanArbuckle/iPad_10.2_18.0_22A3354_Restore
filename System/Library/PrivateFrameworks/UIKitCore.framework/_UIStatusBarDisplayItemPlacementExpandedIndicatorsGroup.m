@implementation _UIStatusBarDisplayItemPlacementExpandedIndicatorsGroup

+ (id)activityItemDisplayIdentifier
{
  return +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarActivityItem_SyncOnly, "defaultDisplayIdentifier");
}

@end
