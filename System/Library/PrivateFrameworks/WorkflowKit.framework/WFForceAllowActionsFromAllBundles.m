@implementation WFForceAllowActionsFromAllBundles

uint64_t __WFForceAllowActionsFromAllBundles_block_invoke()
{
  uint64_t result;

  result = VCIsInternalBuild();
  if ((_DWORD)result)
    result = objc_msgSend(MEMORY[0x1E0C99EA0], "allowActionsFromAllBundles");
  WFForceAllowActionsFromAllBundles_forceAllowActionsFromAllBundles = result;
  return result;
}

@end
