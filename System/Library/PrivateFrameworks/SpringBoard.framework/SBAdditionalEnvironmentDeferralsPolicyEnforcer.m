@implementation SBAdditionalEnvironmentDeferralsPolicyEnforcer

- (SBAdditionalEnvironmentDeferralsPolicyEnforcer)init
{
  void *v3;
  SBAdditionalEnvironmentDeferralsPolicyEnforcer *v4;

  objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBAdditionalEnvironmentDeferralsPolicyEnforcer initWithDebugName:deliveryManager:](self, "initWithDebugName:deliveryManager:", CFSTR("SBAdditionalEnvironmentDeferralsPolicyEnforcer"), v3);

  return v4;
}

- (SBAdditionalEnvironmentDeferralsPolicyEnforcer)initWithDebugName:(id)a3 deliveryManager:(id)a4
{
  id v6;
  id v7;
  SBAdditionalEnvironmentDeferralsPolicyEnforcer *v8;
  SBAdditionalEnvironmentDeferralsPolicyEnforcer *v9;
  uint64_t v10;
  NSString *debugName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBAdditionalEnvironmentDeferralsPolicyEnforcer;
  v8 = -[SBAdditionalEnvironmentDeferralsPolicyEnforcer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deliveryManager, a4);
    v10 = objc_msgSend(v6, "copy");
    debugName = v9->_debugName;
    v9->_debugName = (NSString *)v10;

  }
  return v9;
}

- (void)enforce:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  BKSHIDEventDeliveryManager *deliveryManager;
  void *v19;
  void *v20;
  NSObject *v21;
  NSMutableArray *rules;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  SBAdditionalEnvironmentDeferralsPolicyEnforcer *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBAdditionalEnvironmentDeferralsPolicyEnforcer stopEnforcing](self, "stopEnforcing");
  v23 = v4;
  objc_msgSend(v4, "keyboardFocusTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "additionalEnvironmentDeferralsForFocusTarget:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = v7;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
        {
          v15 = (void *)objc_msgSend(MEMORY[0x1E0D00D80], "new");
          objc_msgSend(v15, "setEnvironment:", v12);
          v16 = (void *)objc_msgSend(MEMORY[0x1E0D00D90], "new");
          objc_msgSend(v25, "objectForKeyedSubscript:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setToken:", v17);

          objc_msgSend(v16, "setPid:", objc_msgSend(v5, "pid"));
          deliveryManager = v26->_deliveryManager;
          -[SBKeyboardFocusTarget deferringTarget]((uint64_t)v5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKSHIDEventDeliveryManager deferEventsMatchingPredicate:toTarget:withReason:](deliveryManager, "deferEventsMatchingPredicate:toTarget:withReason:", v15, v19, CFSTR("SpringBoard: outbound to service-requested target"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v24, "addObject:", v20);

          SBLogKeyboardFocus();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v12;
            v34 = 2114;
            v35 = v5;
            _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "rules: (additionalEnvironments) by service request, deferring (%{public}@) -> %{public}@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v9);
  }

  rules = v26->_rules;
  v26->_rules = v24;

}

- (void)stopEnforcing
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *rules;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_rules;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  rules = self->_rules;
  self->_rules = 0;

}

- (SBAdditionalEnvironmentDeferralsPolicyEnforcerDelegate)delegate
{
  return (SBAdditionalEnvironmentDeferralsPolicyEnforcerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end
