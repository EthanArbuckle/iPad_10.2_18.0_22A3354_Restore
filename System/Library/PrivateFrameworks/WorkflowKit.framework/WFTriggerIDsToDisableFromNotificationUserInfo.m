@implementation WFTriggerIDsToDisableFromNotificationUserInfo

uint64_t __WFTriggerIDsToDisableFromNotificationUserInfo_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKey:", CFSTR("triggerID"));
}

@end
