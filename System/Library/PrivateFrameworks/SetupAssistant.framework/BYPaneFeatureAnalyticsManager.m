@implementation BYPaneFeatureAnalyticsManager

- (BYPaneFeatureAnalyticsManager)initWithAnalyticsManager:(id)a3 runState:(id)a4 host:(id)a5 flowItemDispositionProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BYPaneFeatureAnalyticsManager *v15;
  BYPaneFeatureAnalyticsManager *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BYPaneFeatureAnalyticsManager;
  v15 = -[BYPaneFeatureAnalyticsManager init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_analyticsManager, a3);
    objc_storeStrong((id *)&v16->_runState, a4);
    objc_storeStrong((id *)&v16->_host, a5);
    objc_storeStrong((id *)&v16->_flowItemDispositionProvider, a6);
  }

  return v16;
}

- (void)recordActionWithValue:(id)a3 forFeature:(int64_t)a4
{
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:previousValue:forFeature:](self, "recordActionWithValue:previousValue:forFeature:", a3, 0, a4);
}

- (void)recordActionWithValue:(id)a3 previousValue:(id)a4 forFeature:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v24 = v8;
  v25[0] = CFSTR("feature");
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_nameForFeature:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  v26[1] = v10;
  v25[1] = CFSTR("value");
  v25[2] = CFSTR("differsFromExpress");
  -[BYPaneFeatureAnalyticsManager _isValueDifferentFromExpressForFeature:value:](self, "_isValueDifferentFromExpressForFeature:value:", a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v11;
  v25[3] = CFSTR("hasCompletedInitialSetup");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BYPaneFeatureAnalyticsManager runState](self, "runState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "hasCompletedInitialRun"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v14;
  v25[4] = CFSTR("host");
  -[BYPaneFeatureAnalyticsManager host](self, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v15;
  v25[5] = CFSTR("disposition");
  -[BYPaneFeatureAnalyticsManager flowItemDispositionProvider](self, "flowItemDispositionProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BYStringForFlowItemDispositions(objc_msgSend(v16, "dispositions"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[BYPaneFeatureAnalyticsManager runState](self, "runState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasCompletedInitialRun");

    if (v21)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("previousValue"));
  }
  -[BYPaneFeatureAnalyticsManager analyticsManager](self, "analyticsManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.paneFeatureAction"), v19, 0);

}

- (void)clearActionForFeature:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[BYPaneFeatureAnalyticsManager analyticsManager](self, "analyticsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__BYPaneFeatureAnalyticsManager_clearActionForFeature___block_invoke;
  v6[3] = &unk_1E4E26C78;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "removeEventsUsingBlock:", v6);

}

uint64_t __55__BYPaneFeatureAnalyticsManager_clearActionForFeature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.setupassistant.ios.paneFeatureAction")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feature"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_nameForFeature:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setExpressDataSource:(id)a3 features:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[BYPaneFeatureAnalyticsManager setExpressDataSource:](self, "setExpressDataSource:", a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYPaneFeatureAnalyticsManager setExpressSetupFeatures:](self, "setExpressSetupFeatures:", v6);

  }
  else
  {
    -[BYPaneFeatureAnalyticsManager setExpressSetupFeatures:](self, "setExpressSetupFeatures:", 0);
  }

}

+ (id)_nameForFeature:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10)
    return CFSTR("Screen Time");
  else
    return *(&off_1E4E26C98 + a3 - 1);
}

- (id)_isValueDifferentFromExpressForFeature:(int64_t)a3 value:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[BYPaneFeatureAnalyticsManager _isFeatureForPaneIncludedInExpress:](self, "_isFeatureForPaneIncludedInExpress:", a3))
    {
      v8 = 0;
      switch(a3)
      {
        case 0:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "screenTimeEnabled");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 1:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "softwareUpdateAutoUpdateEnabled");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 2:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "softwareUpdateAutoDownloadEnabled");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 4:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appAnalyticsOptIn");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 5:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deviceAnalyticsOptIn");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 6:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "locationServicesOptIn");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 7:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "siriOptIn");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 8:
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "siriDataSharingOptIn");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 9:
          v12 = (void *)MEMORY[0x1E0CB37E8];
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v9, "userInterfaceStyleModeValue"));
          v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v8 = (void *)v10;
          goto LABEL_16;
        case 10:
          v14 = (void *)MEMORY[0x1E0CB37E8];
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "watchMigrationData");
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        case 15:
          v14 = (void *)MEMORY[0x1E0CB37E8];
          -[BYPaneFeatureAnalyticsManager expressDataSource](self, "expressDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "walletMetadata");
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_24:
          v16 = (void *)v15;
          objc_msgSend(v14, "numberWithInt:", v15 != 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
          break;
        default:
          break;
      }
      if (objc_msgSend(v8, "isEqualToNumber:", v6))
        v11 = CFSTR("Not Different");
      else
        v11 = CFSTR("Different");

    }
    else
    {
      v11 = CFSTR("Not Present in Express");
    }
  }
  else
  {
    v11 = CFSTR("Not Applicable");
  }

  return (id)v11;
}

- (BOOL)_isFeatureForPaneIncludedInExpress:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend((id)objc_opt_class(), "_featuresForPane:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYPaneFeatureAnalyticsManager expressSetupFeatures](self, "expressSetupFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intersectsSet:", v4);

  return v6;
}

+ (id)_featuresForPane:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E34380;
      goto LABEL_13;
    case 1:
    case 2:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E34398;
      goto LABEL_13;
    case 4:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E4E343B0, &unk_1E4E343C8, 0);
      goto LABEL_6;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E4E343E0, &unk_1E4E343C8, 0);
LABEL_6:
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 6:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E343F8;
      goto LABEL_13;
    case 7:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E34410;
      goto LABEL_13;
    case 8:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E34428;
      goto LABEL_13;
    case 9:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E34440;
      goto LABEL_13;
    case 10:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E34458;
      goto LABEL_13;
    case 15:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v5 = &unk_1E4E34470;
LABEL_13:
      objc_msgSend(v4, "setWithObject:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BYFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
}

- (BYExpressSetupDataSource)expressDataSource
{
  return self->_expressDataSource;
}

- (void)setExpressDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_expressDataSource, a3);
}

- (NSSet)expressSetupFeatures
{
  return self->_expressSetupFeatures;
}

- (void)setExpressSetupFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_expressSetupFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressSetupFeatures, 0);
  objc_storeStrong((id *)&self->_expressDataSource, 0);
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end
