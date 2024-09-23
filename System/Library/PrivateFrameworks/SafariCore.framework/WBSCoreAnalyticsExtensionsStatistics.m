@implementation WBSCoreAnalyticsExtensionsStatistics

- (WBSCoreAnalyticsExtensionsStatistics)initWithExtensionsList:(id)a3 extractDeveloperIdentifier:(id)a4 extractComposedIdentifier:(id)a5 extensionTelemetryDataPredicate:(id)a6
{
  void (**v9)(id, _QWORD);
  void (**v10)(id, _QWORD);
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSArray *telemetryDataForExtensions;
  WBSCoreAnalyticsExtensionsStatistics *v21;
  id v23;
  id obj;
  NSArray *v25;
  WBSCoreAnalyticsExtensionsStatistics *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v9 = (void (**)(id, _QWORD))a4;
  v10 = (void (**)(id, _QWORD))a6;
  v31.receiver = self;
  v31.super_class = (Class)WBSCoreAnalyticsExtensionsStatistics;
  v26 = -[WBSCoreAnalyticsExtensionsStatistics init](&v31, sel_init);
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v23;
    v11 = 0;
    v12 = 0;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v9[2](v9, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
            v10[2](v10, v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "enabled");
            if (!v26->_hasExtensionThatCanOverrideNewTabPage
              && objc_msgSend(v18, "canOverrideNewTabPage"))
            {
              v26->_hasExtensionThatCanOverrideNewTabPage = 1;
            }
            -[NSArray addObject:](v25, "addObject:", v18, v23);

            v11 += v19;
            v12 += v19 ^ 1;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v13);
    }

    v26->_enabledCount = v11;
    v26->_disabledCount = v12;
    telemetryDataForExtensions = v26->_telemetryDataForExtensions;
    v26->_telemetryDataForExtensions = v25;

    v21 = v26;
  }

  return v26;
}

- (WBSCoreAnalyticsExtensionsStatistics)initWithExtensionsList:(id)a3 extractDeveloperIdentifier:(id)a4 extractComposedIdentifier:(id)a5 extensionTelemetryDataPredicate:(id)a6 newTabPageIsOverridden:(BOOL)a7
{
  self->_newTabPageIsOverridden = a7;
  return -[WBSCoreAnalyticsExtensionsStatistics initWithExtensionsList:extractDeveloperIdentifier:extractComposedIdentifier:extensionTelemetryDataPredicate:](self, "initWithExtensionsList:extractDeveloperIdentifier:extractComposedIdentifier:extensionTelemetryDataPredicate:", a3, a4, a5, a6);
}

- (unint64_t)enabledCount
{
  return self->_enabledCount;
}

- (unint64_t)disabledCount
{
  return self->_disabledCount;
}

- (NSArray)telemetryDataForExtensions
{
  return self->_telemetryDataForExtensions;
}

- (BOOL)hasExtensionThatCanOverrideNewTabPage
{
  return self->_hasExtensionThatCanOverrideNewTabPage;
}

- (BOOL)newTabPageIsOverridden
{
  return self->_newTabPageIsOverridden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryDataForExtensions, 0);
}

@end
