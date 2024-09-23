@implementation PPConnectionsParameters

- (PPConnectionsParameters)init
{
  PPConnectionsParameters *v2;
  qos_class_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PPConnectionsParameters;
  v2 = -[PPConnectionsParameters init](&v12, sel_init);
  if (v2)
  {
    v3 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(0, v3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.PPConnectionsParametersQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    location = 0;
    objc_initWeak(&location, v2);
    v7 = v2->_queue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__PPConnectionsParameters_init__block_invoke;
    v9[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v10, &location);
    dispatch_async(v7, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (int64_t)expirySeconds
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, CFSTR("expirySeconds"), 0);
}

- (double)userActivityExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("userActivityExpirySeconds"), 600);
}

- (double)namedEntitySourceLookBackSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("namedEntitySourceLookBackSeconds"), 3600);
}

- (double)namedEntitySourceExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("namedEntitySourceExpirySeconds"), 4200);
}

- (double)foundInAppsSourceLookBackSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("foundInAppsSourceLookBackSeconds"), 3600);
}

- (double)foundInAppsSourceExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("foundInAppsSourceExpirySeconds"), 4200);
}

- (double)calendarEventLocationLookaheadTimeSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("calendarEventLocationLookaheadTimeSeconds"), 5400);
}

- (double)calendarEventLocationExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("calendarEventLocationExpirySeconds"), 600);
}

- (unint64_t)quickTypePredictionLimit
{
  return -[PPConnectionsParameters unsignedIntegerValueForKey:default:]((id *)&self->super.isa, CFSTR("quickTypePredictionLimit"));
}

- (unint64_t)userActivityBatchSize
{
  return -[PPConnectionsParameters unsignedIntegerValueForKey:default:]((id *)&self->super.isa, CFSTR("userActivityBatchSize"));
}

- (double)userActivityCandidateScore
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("userActivityCandidateScore"), 100);
}

- (int64_t)appSwitcherPredictionExpiry
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, CFSTR("appSwitcherPredictionExpiry"), 30);
}

- (int64_t)locationAppPredictionInstallHalflife
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, CFSTR("locationAppPredictionInstallHalflife"), 14000);
}

- (int64_t)locationAppPredictionInstallMaxScore
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, CFSTR("locationAppPredictionInstallMaxScore"), 65);
}

- (int64_t)locationAppPredictionLaunchTimeOfDayFactor
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, CFSTR("locationAppPredictionLaunchTimeOfDayFactor"), 50);
}

- (int64_t)locationAppPredictionOverallLaunchFactor
{
  return -[PPConnectionsParameters integerValueForKey:default:]((id *)&self->super.isa, CFSTR("locationAppPredictionOverallLaunchFactor"), 80);
}

- (double)linguisticTriggerExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("linguisticTriggerExpirySeconds"), 600);
}

- (double)pasteboardItemExpirySeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("pasteboardItemExpirySeconds"), 600);
}

- (double)locationAppLastUseTimeoutSeconds
{
  return -[PPConnectionsParameters doubleValueForKey:default:]((id *)&self->super.isa, CFSTR("locationAppLastUseTimeoutSeconds"), 7200);
}

- (BOOL)shouldUseAllowedWebsite
{
  return -[PPConnectionsParameters BOOLValueForKey:default:]((id *)&self->super.isa, CFSTR("shouldUseAllowedWebsite"));
}

- (BOOL)shouldUseAllowedApps
{
  return -[PPConnectionsParameters BOOLValueForKey:default:]((id *)&self->super.isa, CFSTR("shouldUseAllowedApps"));
}

- (id)locationPredictionBlockedApps
{
  void *v2;
  void *v3;
  id v4;

  -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, CFSTR("locationPredictionBlockedApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)donationAllowedWebsites
{
  void *v2;
  void *v3;
  id v4;

  -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, CFSTR("donationAllowedWebsites"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)donationBlockedWebsites
{
  void *v2;
  void *v3;
  id v4;

  -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, CFSTR("donationBlockedWebsites"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)donationAllowedApps
{
  void *v2;
  void *v3;
  id v4;

  -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, CFSTR("donationAllowedApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)donationBlockedApps
{
  void *v2;
  void *v3;
  id v4;

  -[PPConnectionsParameters assetValueForKey:]((id *)&self->super.isa, CFSTR("donationBlockedApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (id)assetValueForKey:(id *)a1
{
  id *v2;
  id v3;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    pthread_mutex_lock(&_PPConnectionsParametersAssetMutex);
    objc_msgSend(v2[1], "objectForKeyedSubscript:", v3);
    v2 = (id *)objc_claimAutoreleasedReturnValue();

    pthread_mutex_unlock(&_PPConnectionsParametersAssetMutex);
  }
  return v2;
}

- (uint64_t)BOOLValueForKey:(id *)a1 default:(void *)a2
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  -[PPConnectionsParameters assetValueForKey:](a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (double)doubleValueForKey:(uint64_t)a3 default:
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (!a1)
    return 0.0;
  -[PPConnectionsParameters assetValueForKey:](a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = (double)a3;
  }

  return v7;
}

- (uint64_t)integerValueForKey:(uint64_t)a3 default:
{
  void *v4;
  void *v5;

  if (!a1)
    return 0;
  -[PPConnectionsParameters assetValueForKey:](a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    a3 = objc_msgSend(v4, "integerValue");

  return a3;
}

- (uint64_t)unsignedIntegerValueForKey:(id *)a1 default:(void *)a2
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  -[PPConnectionsParameters assetValueForKey:](a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 1;

  return v4;
}

void __31__PPConnectionsParameters_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "plistForFactorName:namespaceName:", CFSTR("PPConnectionsParameters.plist"), CFSTR("PERSONALIZATION_PORTRAIT_CONNECTIONS"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      pthread_mutex_lock(&_PPConnectionsParametersAssetMutex);
      objc_storeStrong(WeakRetained + 1, v3);
      pthread_mutex_unlock(&_PPConnectionsParametersAssetMutex);
    }
    else
    {
      pp_quicktype_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPConnectionsParameters: Could not find asset path for PPConnectionsParameters.plist", v5, 2u);
      }

    }
  }

}

+ (PPConnectionsParameters)sharedInstance
{
  if (sharedInstance_once_14796 != -1)
    dispatch_once(&sharedInstance_once_14796, &__block_literal_global_14797);
  return (PPConnectionsParameters *)(id)sharedInstance_shared_14798;
}

void __41__PPConnectionsParameters_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_14798;
  sharedInstance_shared_14798 = v0;

}

@end
