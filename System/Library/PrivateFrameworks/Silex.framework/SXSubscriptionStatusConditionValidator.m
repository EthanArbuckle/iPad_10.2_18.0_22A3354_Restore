@implementation SXSubscriptionStatusConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  int v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "subscriptionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "subscriptionStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("bundle"));

    if (v9)
    {
      v10 = objc_msgSend(v6, "isBundleSubscriber");
    }
    else
    {
      objc_msgSend(v5, "subscriptionStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("subscribed"));

      if (v13)
      {
        v10 = objc_msgSend(v6, "isChannelSubscriber");
      }
      else
      {
        objc_msgSend(v5, "subscriptionStatus");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("bundle_trial_eligible"));

        if (!v15)
        {
          v11 = 0;
          goto LABEL_10;
        }
        v10 = objc_msgSend(v6, "isBundleTrialEligible");
      }
    }
    v11 = v10;
  }
  else
  {
    v11 = 1;
  }
LABEL_10:

  return v11;
}

@end
