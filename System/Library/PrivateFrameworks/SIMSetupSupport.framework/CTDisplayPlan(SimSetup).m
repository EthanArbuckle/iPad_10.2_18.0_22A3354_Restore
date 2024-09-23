@implementation CTDisplayPlan(SimSetup)

- (id)remotePlan
{
  void *v2;
  char isKindOfClass;
  void *v4;

  objc_msgSend(a1, "plan");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "plan");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)isTransferIneligiblePlan
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "transferCapability");
  return (v1 < 0xF) & (0x7A22u >> v1);
}

- (BOOL)isOnDeviceTransferredPlan
{
  return objc_msgSend(a1, "transferCapability") == 7;
}

- (uint64_t)isTransferablePlan
{
  uint64_t v1;
  uint64_t result;

  v1 = objc_msgSend(a1, "transferCapability");
  result = 1;
  if (v1 != 2 && v1 != 4)
  {
    if (v1 == 8)
      return +[TSUtilities inBuddy](TSUtilities, "inBuddy") ^ 1;
    else
      return 0;
  }
  return result;
}

- (BOOL)isNotEligibleActivationPolicyMismatchPlan
{
  return objc_msgSend(a1, "transferCapability") == 11;
}

- (BOOL)isOneClickTransferablePlan
{
  return objc_msgSend(a1, "transferCapability") == 2;
}

- (BOOL)isWebsheetTransferablePlan
{
  return objc_msgSend(a1, "transferCapability") == 4;
}

- (uint64_t)isAccountMemberTransferablePlan
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(a1, "remotePlan");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryAccount");
  v2 = objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "primaryAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "BOOLValue") ^ 1;

  }
  return v2;
}

- (void)transferCapability
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "remotePlan");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "transferAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "transferAttributes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v4, "transferCapability");

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
