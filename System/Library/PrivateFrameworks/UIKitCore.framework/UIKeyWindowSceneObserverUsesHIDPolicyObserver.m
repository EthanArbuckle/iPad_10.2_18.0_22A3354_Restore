@implementation UIKeyWindowSceneObserverUsesHIDPolicyObserver

uint64_t ___UIKeyWindowSceneObserverUsesHIDPolicyObserver_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  _MergedGlobals_1184 = result;
  return result;
}

@end
