@implementation CTDisplayPlan(SettingsCellular)

- (BOOL)isPendingInstallPlan
{
  return objc_msgSend(a1, "status") == 1;
}

- (BOOL)isAddOnPurchasablePlan
{
  return objc_msgSend(a1, "status") == 11;
}

@end
