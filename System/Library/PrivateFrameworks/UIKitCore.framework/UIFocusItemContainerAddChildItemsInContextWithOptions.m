@implementation UIFocusItemContainerAddChildItemsInContextWithOptions

_UIFocusRegionContainerProxy *___UIFocusItemContainerAddChildItemsInContextWithOptions_block_invoke(uint64_t a1)
{
  _UIFocusRegionContainerProxy *v1;

  v1 = -[_UIFocusRegionContainerProxy initWithEnvironmentContainer:]([_UIFocusRegionContainerProxy alloc], "initWithEnvironmentContainer:", *(_QWORD *)(a1 + 32));
  -[_UIFocusRegionContainerProxy setShouldCreateRegionForOwningItem:](v1, "setShouldCreateRegionForOwningItem:", 0);
  -[_UIFocusRegionContainerProxy setShouldCreateRegionForGuideBehavior:](v1, "setShouldCreateRegionForGuideBehavior:", 0);
  -[_UIFocusRegionContainerProxy setAllowsLazyLoading:](v1, "setAllowsLazyLoading:", 0);
  return v1;
}

@end
