@implementation NCReactiveListUI

uint64_t ___NCReactiveListUI_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  _NCReactiveListUI___reactiveUI = result;
  return result;
}

@end
