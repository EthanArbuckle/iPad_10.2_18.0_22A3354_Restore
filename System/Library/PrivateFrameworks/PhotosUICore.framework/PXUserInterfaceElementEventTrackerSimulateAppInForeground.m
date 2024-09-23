@implementation PXUserInterfaceElementEventTrackerSimulateAppInForeground

uint64_t __PXUserInterfaceElementEventTrackerSimulateAppInForeground_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAppActive:", *(unsigned __int8 *)(a1 + 40));
}

@end
