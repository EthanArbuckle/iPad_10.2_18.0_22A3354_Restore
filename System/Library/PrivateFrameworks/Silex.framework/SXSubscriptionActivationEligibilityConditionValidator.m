@implementation SXSubscriptionActivationEligibilityConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "subscriptionActivationEligibility"))
    goto LABEL_4;
  if (objc_msgSend(v5, "subscriptionActivationEligibility") != 2)
  {
    v8 = objc_msgSend(v5, "subscriptionActivationEligibility");
    v9 = objc_msgSend(v6, "subscriptionActivationEligibility");
LABEL_7:
    v7 = v8 == v9;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "subscriptionActivationEligibility") != 3)
  {
    v8 = objc_msgSend(v6, "subscriptionActivationEligibility");
    v9 = 4;
    goto LABEL_7;
  }
LABEL_4:
  v7 = 1;
LABEL_8:

  return v7;
}

@end
