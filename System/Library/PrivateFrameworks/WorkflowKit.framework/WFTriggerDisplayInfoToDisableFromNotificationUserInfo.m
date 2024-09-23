@implementation WFTriggerDisplayInfoToDisableFromNotificationUserInfo

WFTriggerDisplayInfo *__WFTriggerDisplayInfoToDisableFromNotificationUserInfo_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  Class v7;
  WFTriggerDisplayInfo *v8;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("triggerTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("triggerDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFActionIconsFromNotificationUserInfo(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("triggerClassName"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  v7 = NSClassFromString(v6);
  v8 = -[WFTriggerDisplayInfo initWithLocalizedTitle:localizedDescription:actionIcons:triggerClass:]([WFTriggerDisplayInfo alloc], "initWithLocalizedTitle:localizedDescription:actionIcons:triggerClass:", v3, v4, v5, v7);

  return v8;
}

@end
