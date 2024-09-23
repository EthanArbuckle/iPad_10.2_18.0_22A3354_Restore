@implementation SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems

- (unint64_t)shouldShowLaunchAlertForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v4 = a3;
  -[SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems _telephonyManager](self, "_telephonyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems _airplaneModeController](self, "_airplaneModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "dataUsage");
  if ((objc_msgSend(CFSTR("com.apple.InCallService"), "isEqualToString:", v7) & 1) != 0
    || (v8 & 4) == 0 && (v8 & 1) == 0 && (v8 & 2) == 0)
  {
    goto LABEL_14;
  }
  if (!objc_msgSend(v6, "isInAirplaneMode"))
  {
    if ((v8 & 1) != 0)
      goto LABEL_13;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  v9 = objc_msgSend(v5, "hasNonCellularNetworkConnection") ^ 1 | ((v8 & 4) >> 2);
  if (v9)
    v10 = 2;
  else
    v10 = 0;
  if ((v9 & 1) == 0 && (v8 & 1) != 0)
  {
LABEL_13:
    if ((objc_msgSend(CFSTR("com.apple.MobileSMS"), "isEqualToString:", v7) & 1) == 0)
    {
      v13 = objc_msgSend(v5, "dataConnectionAvailabilityWithCurrentCalls");
      if (v13 == 1)
        v10 = 1;
      else
        v10 = 4 * (v13 == 2);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_15:
  if (objc_msgSend(v4, "hasDisplayedLaunchAlertForType:", v10))
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

- (id)_telephonyManager
{
  SBTelephonyManager *telephonyManager;

  telephonyManager = self->_telephonyManager;
  if (telephonyManager)
    return telephonyManager;
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_airplaneModeController
{
  SBAirplaneModeController *airplaneModeController;

  airplaneModeController = self->_airplaneModeController;
  if (airplaneModeController)
    return airplaneModeController;
  +[SBAirplaneModeController sharedInstance](SBAirplaneModeController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems)init
{
  return -[SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems initWithAirplaneModeController:telephonyManager:](self, "initWithAirplaneModeController:telephonyManager:", 0, 0);
}

- (SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems)initWithAirplaneModeController:(id)a3 telephonyManager:(id)a4
{
  id v7;
  id v8;
  SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems *v9;
  SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems;
  v9 = -[SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_airplaneModeController, a3);
    objc_storeStrong((id *)&v10->_telephonyManager, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_storeStrong((id *)&self->_airplaneModeController, 0);
}

@end
