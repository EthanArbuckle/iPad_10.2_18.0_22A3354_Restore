@implementation PECopyEditsConfiguration

- (PECopyEditsConfiguration)initWithCompositionController:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  PECopyEditsConfiguration *v9;
  PECopyEditsConfiguration *v10;
  void *v11;
  uint64_t v12;
  NSArray *settings;
  id v15;
  id v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PECopyEditsConfiguration;
  v9 = -[PECopyEditsConfiguration init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_compositionController, a3);
    +[PECopyEditsSetting allSettings](PECopyEditsSetting, "allSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    v16 = v8;
    PFFilter();
    v12 = objc_claimAutoreleasedReturnValue();
    settings = v10->_settings;
    v10->_settings = (NSArray *)v12;

  }
  return v10;
}

- (id)result
{
  PECopyEditsConfigurationResult *v3;
  void *v4;
  PECopyEditsConfigurationResult *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  PECopyEditsConfiguration *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = [PECopyEditsConfigurationResult alloc];
  -[PECopyEditsConfiguration compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PECopyEditsConfigurationResult initWithCompositionController:](v3, "initWithCompositionController:", v4);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = self;
  -[PECopyEditsConfiguration settings](self, "settings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "identifier");
        if (v11 <= 9)
        {
          if (v11 == 6)
          {
            -[PECopyEditsConfigurationResult setSmartCopyEnabled:](v5, "setSmartCopyEnabled:", objc_msgSend(v10, "enabled"));
          }
          else if ((objc_msgSend(v10, "enabled") & 1) == 0)
          {
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            objc_msgSend(v10, "compositionKeys");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v26;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v26 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
                  -[PECopyEditsConfigurationResult compositionController](v5, "compositionController");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "removeAdjustmentWithKey:", v17);

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              }
              while (v14);
            }

          }
        }
        ++v9;
      }
      while (v9 != v7);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v7 = v19;
    }
    while (v19);
  }

  -[PECopyEditsConfiguration settings](v23, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PEAnalyticsUtility analyticPayloadForCopyEditsSettings:](PEAnalyticsUtility, "analyticPayloadForCopyEditsSettings:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PECopyEditsConfigurationResult setAnalyticsPayload:](v5, "setAnalyticsPayload:", v21);

  return v5;
}

- (NSArray)settings
{
  return self->_settings;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

uint64_t __64__PECopyEditsConfiguration_initWithCompositionController_asset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isApplicableToCompositionController:asset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
