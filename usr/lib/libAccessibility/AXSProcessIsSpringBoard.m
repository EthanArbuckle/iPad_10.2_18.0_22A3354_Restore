@implementation AXSProcessIsSpringBoard

uint64_t ___AXSProcessIsSpringBoard_block_invoke()
{
  uint64_t result;

  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  result = objc_msgSend((id)cachedAppID_CachedAppID, "isEqualToString:", CFSTR("com.apple.springboard"));
  if ((_DWORD)result)
    _AXSProcessIsSpringBoard__AXSProcessIsSpringBoard = 1;
  return result;
}

@end
