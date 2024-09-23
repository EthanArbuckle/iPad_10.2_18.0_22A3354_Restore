@implementation _UIEventDeferringBehavior_iOS

- (BOOL)wantsSystemKeyCommandOverlayRules
{
  if (qword_1ECD80390 != -1)
    dispatch_once(&qword_1ECD80390, &__block_literal_global_496);
  return _MergedGlobals_1220;
}

@end
