@implementation WGWidgetDataSourceManager

+ (id)_widgetExtensionsDiscoveryAttributes
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0C48];
  v4[0] = CFSTR("com.apple.widget-extension");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)discoverAvailableWidgetsWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1550];
  objc_msgSend(a1, "_widgetExtensionsDiscoveryAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionsWithMatchingAttributes:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

WGWidgetDatum *__63__WGWidgetDataSourceManager_discoverAvailableWidgetsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WGWidgetDatum *v3;

  v2 = a2;
  v3 = -[WGWidgetDatum initWithExtension:]([WGWidgetDatum alloc], "initWithExtension:", v2);

  return v3;
}

- (WGWidgetDataSourceManager)init
{
  WGWidgetDataSourceManager *v2;
  WGWidgetDataSource *v3;
  WGWidgetDataSource *widgetDataSource;
  WGWidgetVisibilityManager *v5;
  WGWidgetVisibilityManager *widgetVisbilityManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WGWidgetDataSourceManager;
  v2 = -[WGWidgetDataSourceManager init](&v8, sel_init);
  if (v2)
  {
    v3 = -[WGWidgetDataSource initWithIdentifier:]([WGWidgetDataSource alloc], "initWithIdentifier:", CFSTR("com.apple.notificationcenter.widgetdatasource"));
    widgetDataSource = v2->_widgetDataSource;
    v2->_widgetDataSource = v3;

    v5 = objc_alloc_init(WGWidgetVisibilityManager);
    widgetVisbilityManager = v2->_widgetVisbilityManager;
    v2->_widgetVisbilityManager = v5;

    -[WGWidgetVisibilityManager setDelegate:](v2->_widgetVisbilityManager, "setDelegate:", v2);
  }
  return v2;
}

- (NSArray)dataSources
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->_widgetDataSource;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_start:(id)a3
{
  void *v4;
  id didStartBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  didStartBlock = self->_didStartBlock;
  self->_didStartBlock = v4;

  self->_isPublishing = 1;
  -[WGWidgetDataSourceManager _beginContinuousPlugInDiscovery](self, "_beginContinuousPlugInDiscovery");
  -[_WGParentDataSourceManager childDataSourceManagerDataSourcesDidChange:](self->_parentDataSourceManager, "childDataSourceManagerDataSourcesDidChange:", self);
}

- (void)_stop:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  self->_isPublishing = 0;
  -[WGWidgetDataSourceManager _endContinuousPlugInDiscovery](self, "_endContinuousPlugInDiscovery");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (BOOL)_shouldPublishWidgetExtension:(id)a3
{
  WGWidgetVisibilityManager *widgetVisbilityManager;
  void *v4;

  widgetVisbilityManager = self->_widgetVisbilityManager;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(widgetVisbilityManager) = -[WGWidgetVisibilityManager isWidgetWithIdentifierVisible:](widgetVisbilityManager, "isWidgetWithIdentifierVisible:", v4);

  return (char)widgetVisbilityManager;
}

- (void)_updateDataSourceWithExtension:(id)a3
{
  id v4;
  WGWidgetDatum *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[WGWidgetDatum initWithExtension:]([WGWidgetDatum alloc], "initWithExtension:", v4);

    -[WGWidgetDataSource replaceWithDatum:](self->_widgetDataSource, "replaceWithDatum:", v5);
  }
}

- (void)_revokeExtensionWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    -[WGWidgetDataSource removeDatumWithIdentifier:](self->_widgetDataSource, "removeDatumWithIdentifier:", v4);

}

- (void)_updatePublishedWidgetExtensions:(id)a3
{
  id v4;
  _BOOL4 isPublishing;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void (**didStartBlock)(void);
  id v31;
  id v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  isPublishing = self->_isPublishing;
  v6 = WGLogWidgets;
  v7 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG);
  if (isPublishing)
  {
    if (v7)
      -[WGWidgetDataSourceManager _updatePublishedWidgetExtensions:].cold.2(v6, v4);
    -[WGWidgetDataSource widgetIdentifiers](self->_widgetDataSource, "widgetIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (objc_msgSend(v4, "count"))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = v4;
      v10 = v4;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v40;
        v33 = v10;
        v34 = v9;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v40 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            if (-[WGWidgetDataSourceManager _shouldPublishWidgetExtension:](self, "_shouldPublishWidgetExtension:", v15))
            {
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v9, "containsObject:", v16))
              {
                -[WGWidgetDataSource widgetDatumWithIdentifier:](self->_widgetDataSource, "widgetDatumWithIdentifier:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "representedExtension");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v18, "_plugIn");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "_plugIn");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                if ((v21 & 1) == 0)
                {
                  v22 = (void *)WGLogWidgets;
                  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
                  {
                    v23 = v22;
                    objc_msgSend(v18, "wg_description");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v45 = v16;
                    v46 = 2114;
                    v47 = v24;
                    _os_log_debug_impl(&dword_2172E1000, v23, OS_LOG_TYPE_DEBUG, "Widget extension with ID '%{public}@' has changed: %{public}@ ", buf, 0x16u);

                  }
                  -[WGWidgetDataSourceManager _updateDataSourceWithExtension:](self, "_updateDataSourceWithExtension:", v15);
                }
                v9 = v34;
                objc_msgSend(v34, "removeObject:", v16);

                v10 = v33;
              }
              else
              {
                -[WGWidgetDataSourceManager _updateDataSourceWithExtension:](self, "_updateDataSourceWithExtension:", v15);
              }

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v12);
      }

      v4 = v32;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v9;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          -[WGWidgetDataSourceManager _revokeExtensionWithIdentifier:](self, "_revokeExtensionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v27);
    }

    didStartBlock = (void (**)(void))self->_didStartBlock;
    if (didStartBlock)
    {
      didStartBlock[2]();
      v31 = self->_didStartBlock;
      self->_didStartBlock = 0;

    }
  }
  else if (v7)
  {
    -[WGWidgetDataSourceManager _updatePublishedWidgetExtensions:].cold.1(v6);
  }

}

- (void)_updatePublishedWidgetExtensions
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDD1550];
  objc_msgSend((id)objc_opt_class(), "_widgetExtensionsDiscoveryAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke;
  v4[3] = &unk_24D731648;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "extensionsWithMatchingAttributes:completion:", v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_cold_1();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_2;
    v7[3] = &unk_24D731620;
    objc_copyWeak(&v9, (id *)(a1 + 32));
    v8 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

    objc_destroyWeak(&v9);
  }

}

void __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePublishedWidgetExtensions:", *(_QWORD *)(a1 + 32));

}

- (void)_beginContinuousPlugInDiscovery
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_2172E1000, a2, a3, "New discovery token: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  id *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)WGLogWidgets;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_2();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_14;
    block[3] = &unk_24D7314D8;
    v9 = &v13;
    v13 = WeakRetained;
    v10 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_1(v7, v5);
    v11 = objc_loadWeakRetained((id *)(a1 + 32));
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_13;
    v14[3] = &unk_24D731670;
    v9 = &v15;
    v15 = v11;
    v16 = v5;
    v10 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

  }
}

uint64_t __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_13(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_widgetVisbilityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateVisibilityForExtensions:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updatePublishedWidgetExtensions:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_14(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPlugInDiscoveryToken:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_beginContinuousPlugInDiscovery");
}

- (void)_endContinuousPlugInDiscovery
{
  id plugInDiscoveryToken;

  if (self->_plugInDiscoveryToken)
  {
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
    plugInDiscoveryToken = self->_plugInDiscoveryToken;
    self->_plugInDiscoveryToken = 0;

  }
}

- (id)_plugInDiscoveryToken
{
  return self->_plugInDiscoveryToken;
}

- (void)_setPlugInDiscoveryToken:(id)a3
{
  objc_storeStrong(&self->_plugInDiscoveryToken, a3);
}

- (_WGParentDataSourceManager)parentDataSourceManager
{
  return self->_parentDataSourceManager;
}

- (void)setParentDataSourceManager:(id)a3
{
  self->_parentDataSourceManager = (_WGParentDataSourceManager *)a3;
}

- (WGWidgetVisibilityManager)_widgetVisbilityManager
{
  return self->_widgetVisbilityManager;
}

- (void)setWidgetVisbilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_widgetVisbilityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didStartBlock, 0);
  objc_storeStrong(&self->_plugInDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_widgetVisbilityManager, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
}

- (void)_updatePublishedWidgetExtensions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2172E1000, log, OS_LOG_TYPE_DEBUG, "Skip loading widgets extensions because we aren't publishing yet", v1, 2u);
}

- (void)_updatePublishedWidgetExtensions:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "valueForKey:", CFSTR("wg_description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2172E1000, v3, v5, "Extensions to update: %{public}@", v6);

  OUTLINED_FUNCTION_3();
}

void __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2172E1000, v0, v1, "Encountered error requestion widget extensions: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "valueForKey:", CFSTR("wg_description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2172E1000, v3, v5, "Discovered widget plug-ins: %{public}@", v6);

  OUTLINED_FUNCTION_3();
}

void __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2172E1000, v0, v1, "Encountered errors discovering widget plug-ins: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
