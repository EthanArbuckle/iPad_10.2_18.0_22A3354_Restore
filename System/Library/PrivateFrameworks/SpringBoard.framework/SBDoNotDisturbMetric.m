@implementation SBDoNotDisturbMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 == 49)
  {
    objc_msgSend(v6, "eventPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD40]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      if (-[SBDoNotDisturbMetric location](self, "location") == 4)
      {
        -[SBDoNotDisturbMetric primaryBundleIdentifier](self, "primaryBundleIdentifier");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[SBDoNotDisturbMetric sideBundleIdentifier](self, "sideBundleIdentifier");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[SBDoNotDisturbMetric floatingBundleIdentifier](self, "floatingBundleIdentifier");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = CFSTR("none");
        v14 = CFSTR("none");
        v15 = CFSTR("none");
      }
      v23[0] = CFSTR("Reason");
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD48]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v19;
      v23[1] = CFSTR("Location");
      NSStringFromAnalyticsLayoutLocation(-[SBDoNotDisturbMetric location](self, "location"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v20;
      v24[2] = v13;
      v23[2] = CFSTR("PrimaryBundleID");
      v23[3] = CFSTR("SideBundleID");
      v23[4] = CFSTR("FloatingBundleID");
      v24[3] = v14;
      v24[4] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDoNotDisturbMetric sendCoreAnalyticsEventWithName:payload:](self, "sendCoreAnalyticsEventWithName:payload:", CFSTR("com.apple.SpringBoard.Analytics.DoNotDisturbEnabled"), v21);

    }
  }
  else
  {
    if (a3 == 5)
    {
      -[SBDoNotDisturbMetric _bundleIdentifierForElementWithLayoutRole:fromContext:](self, "_bundleIdentifierForElementWithLayoutRole:fromContext:", 1, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDoNotDisturbMetric _bundleIdentifierForElementWithLayoutRole:fromContext:](self, "_bundleIdentifierForElementWithLayoutRole:fromContext:", 2, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDoNotDisturbMetric _bundleIdentifierForElementWithLayoutRole:fromContext:](self, "_bundleIdentifierForElementWithLayoutRole:fromContext:", 3, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDoNotDisturbMetric setPrimaryBundleIdentifier:](self, "setPrimaryBundleIdentifier:", v16);
      -[SBDoNotDisturbMetric setSideBundleIdentifier:](self, "setSideBundleIdentifier:", v17);
      -[SBDoNotDisturbMetric setFloatingBundleIdentifier:](self, "setFloatingBundleIdentifier:", v18);

    }
    else
    {
      if (a3 != 3)
      {
        LOBYTE(v12) = 0;
        goto LABEL_14;
      }
      objc_msgSend(v6, "eventPayload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBDoNotDisturbMetric setLocation:](self, "setLocation:", SBAnalyticsLayoutLocationForDisplayLayoutElements(v9));
    }
    LOBYTE(v12) = 1;
  }
LABEL_14:

  return v12;
}

- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  _QWORD v12[5];

  objc_msgSend(a4, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__SBDoNotDisturbMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v12[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v12[4] = a3;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DABE30]);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = CFSTR("none");
  v10 = v8;

  return v10;
}

- (void)setSideBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setPrimaryBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setFloatingBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

BOOL __78__SBDoNotDisturbMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DABE48]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (SBDoNotDisturbMetric)initWithAnalyticsClient:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBDoNotDisturbMetric *v7;

  v4 = (void *)MEMORY[0x1E0D1D758];
  v5 = a3;
  objc_msgSend(v4, "serviceForClientIdentifier:", CFSTR("com.apple.springboard.SBDoNotDisturbMetric"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDoNotDisturbMetric initWithAnalyticsClient:dndStateService:](self, "initWithAnalyticsClient:dndStateService:", v5, v6);

  return v7;
}

- (SBDoNotDisturbMetric)initWithAnalyticsClient:(id)a3 dndStateService:(id)a4
{
  id v7;
  id v8;
  SBDoNotDisturbMetric *v9;
  SBDoNotDisturbMetric *v10;
  NSString *primaryBundleIdentifier;
  NSString *sideBundleIdentifier;
  NSString *floatingBundleIdentifier;
  DNDStateService *dndStateService;
  uint64_t v15;
  SBDoNotDisturbMetric *v16;
  SBFAnalyticsClient *analyticsClient;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[4];
  SBDoNotDisturbMetric *v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBDoNotDisturbMetric;
  v9 = -[SBDoNotDisturbMetric init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dndStateService, a4);
    objc_storeStrong((id *)&v10->_analyticsClient, a3);
    primaryBundleIdentifier = v10->_primaryBundleIdentifier;
    v10->_location = 0;
    v10->_primaryBundleIdentifier = (NSString *)CFSTR("none");

    sideBundleIdentifier = v10->_sideBundleIdentifier;
    v10->_sideBundleIdentifier = (NSString *)CFSTR("none");

    floatingBundleIdentifier = v10->_floatingBundleIdentifier;
    v10->_floatingBundleIdentifier = (NSString *)CFSTR("none");

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](v10->_dndStateService, "addStateUpdateListener:withCompletionHandler:", v10, 0);
    dndStateService = v10->_dndStateService;
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke;
    v22[3] = &unk_1E8EBCE00;
    v16 = v10;
    v23 = v16;
    -[DNDStateService queryCurrentStateWithCompletionHandler:](dndStateService, "queryCurrentStateWithCompletionHandler:", v22);
    objc_initWeak(&location, v16);
    analyticsClient = v10->_analyticsClient;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_3;
    v19[3] = &unk_1E8EA63B8;
    objc_copyWeak(&v20, &location);
    -[SBFAnalyticsClient registerForQueryName:handler:](analyticsClient, "registerForQueryName:handler:", 5, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v10;
}

void __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_2;
  v5[3] = &unk_1E8E9E820;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "isActive");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

id __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  _QWORD block[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_4;
  block[3] = &unk_1E8E9DFA0;
  v8 = &v9;
  v2 = WeakRetained;
  v7 = v2;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v13 = *MEMORY[0x1E0DABD40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v10 + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDoNotDisturbActive");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SBDoNotDisturbMetric)init
{
  void *v3;
  SBDoNotDisturbMetric *v4;

  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDoNotDisturbMetric initWithAnalyticsClient:](self, "initWithAnalyticsClient:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[DNDStateService removeStateUpdateListener:](self->_dndStateService, "removeStateUpdateListener:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDoNotDisturbMetric;
  -[SBDoNotDisturbMetric dealloc](&v3, sel_dealloc);
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  SBFAnalyticsClient *analyticsClient;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");
  self->_doNotDisturbActive = v7;
  analyticsClient = self->_analyticsClient;
  v13[0] = *MEMORY[0x1E0DABD40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v13[1] = *MEMORY[0x1E0DABD48];
  v10 = objc_msgSend(v5, "reason");

  if (v10 > 4)
    v11 = CFSTR("NotEnumerated");
  else
    v11 = off_1E8EBCE20[v10];
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFAnalyticsClient emitEvent:withPayload:](analyticsClient, "emitEvent:withPayload:", 49, v12);

}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v4;
  char v5;
  id v7;

  v7 = a4;
  v4 = v7;
  v5 = AnalyticsSendEventLazy();

  return v5;
}

id __63__SBDoNotDisturbMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isDoNotDisturbActive
{
  return self->_doNotDisturbActive;
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (SBFAnalyticsClient)analyticsClient
{
  return self->_analyticsClient;
}

- (unint64_t)location
{
  return self->_location;
}

- (NSString)primaryBundleIdentifier
{
  return self->_primaryBundleIdentifier;
}

- (NSString)sideBundleIdentifier
{
  return self->_sideBundleIdentifier;
}

- (NSString)floatingBundleIdentifier
{
  return self->_floatingBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsClient, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
}

@end
