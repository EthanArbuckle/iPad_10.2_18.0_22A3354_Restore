@implementation UIEventDeferringBehavioriOSWantsSystemKeyCommandOverlayRules

uint64_t ___UIEventDeferringBehavioriOSWantsSystemKeyCommandOverlayRules_block_invoke()
{
  uint64_t result;

  if ((_UIApplicationProcessIsSpotlight() & 1) != 0)
    result = 1;
  else
    result = _UIApplicationProcessIsOverlayUI();
  _MergedGlobals_1220 = result;
  return result;
}

@end
