@implementation UIDynamicButtonEventShouldCollectStandAloneGestureRecognizers

uint64_t ___UIDynamicButtonEventShouldCollectStandAloneGestureRecognizers_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)UIApp, "isFrontBoard");
  _MergedGlobals_25_2 = result;
  return result;
}

@end
