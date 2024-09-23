@implementation APOdmlAssetManagersForPlacement

- (id)assetManagerForType:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    objc_msgSend_counterfactualAssetManager(self, a2, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    OdmlLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = a3;
      v6 = v9;
      _os_log_impl(&dword_1B69D6000, v5, OS_LOG_TYPE_ERROR, "[%@] The following asset manager type is not supported: %lu", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    objc_msgSend_runtimeAssetManager(self, a2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (APOdmlAssetManager)runtimeAssetManager
{
  return self->_runtimeAssetManager;
}

- (APOdmlAssetManagersForPlacement)initWithPlacementType:(unint64_t)a3 trialClient:(id)a4
{
  id v6;
  APOdmlAssetManagersForPlacement *v7;
  APOdmlAssetManager *v8;
  const char *v9;
  uint64_t v10;
  APOdmlAssetManager *v11;
  APOdmlAssetManager *v12;
  const char *v13;
  uint64_t v14;
  NSObject *p_super;
  APOdmlAssetManager *v16;
  const char *v17;
  uint64_t v18;
  APOdmlAssetManager *runtimeAssetManager;
  APOdmlAssetManager *v20;
  const char *v21;
  uint64_t v22;
  APOdmlAssetManager *counterfactualAssetManager;
  void *v24;
  id v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)APOdmlAssetManagersForPlacement;
  v7 = -[APOdmlAssetManagersForPlacement init](&v27, sel_init);
  if (v7)
  {
    if (a3 == 1)
    {
      v16 = [APOdmlAssetManager alloc];
      v18 = objc_msgSend_initWithNamespace_andClient_(v16, v17, (uint64_t)CFSTR("SLP_ADS_RUNTIME"), v6);
      runtimeAssetManager = v7->_runtimeAssetManager;
      v7->_runtimeAssetManager = (APOdmlAssetManager *)v18;

      v20 = [APOdmlAssetManager alloc];
      v22 = objc_msgSend_initWithNamespace_andClient_(v20, v21, (uint64_t)CFSTR("SLP_ADS_COUNTERFACTUAL"), v6);
      counterfactualAssetManager = v7->_counterfactualAssetManager;
      v7->_counterfactualAssetManager = (APOdmlAssetManager *)v22;

    }
    else if (!a3)
    {
      v8 = [APOdmlAssetManager alloc];
      v10 = objc_msgSend_initWithNamespace_andClient_(v8, v9, (uint64_t)CFSTR("AD_PLATFORMS_ODML"), v6);
      v11 = v7->_runtimeAssetManager;
      v7->_runtimeAssetManager = (APOdmlAssetManager *)v10;

      v12 = [APOdmlAssetManager alloc];
      v14 = objc_msgSend_initWithNamespace_andClient_(v12, v13, (uint64_t)CFSTR("SEARCH_ADS_COUNTERFACTUAL"), v6);
      p_super = &v7->_counterfactualAssetManager->super;
      v7->_counterfactualAssetManager = (APOdmlAssetManager *)v14;
LABEL_8:

      goto LABEL_9;
    }
    OdmlLogForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v24;
      v30 = 2048;
      v31 = a3;
      v25 = v24;
      _os_log_impl(&dword_1B69D6000, p_super, OS_LOG_TYPE_ERROR, "[%@] The following placement type is not supported: %lu", buf, 0x16u);

    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (APOdmlAssetManager)counterfactualAssetManager
{
  return self->_counterfactualAssetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterfactualAssetManager, 0);
  objc_storeStrong((id *)&self->_runtimeAssetManager, 0);
}

@end
