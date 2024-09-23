@implementation NFGeneralStatisticsCALogger

+ (void)postAnalyticsGeneralTransactionStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCALoggerUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.nfcd.generalTransactionStatistic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.generalTransactionStatistic"), v4);

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.generalTransactionStatisticDim"), v4);

  objc_msgSend(a1, "_setupInitValuesForGeneralTransactionStatistics");
}

+ (void)updateAnalyticsGeneralTransactionStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  if (a3)
  {
    v4 = a3;
    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getCALoggerUserDefaults");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", CFSTR("com.apple.nfcd.generalTransactionStatistic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
    }
    else
    {
      objc_msgSend(a1, "_setupInitValuesForGeneralTransactionStatistics");
      objc_msgSend(v11, "objectForKey:", CFSTR("com.apple.nfcd.generalTransactionStatistic"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "mutableCopy");

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__NFGeneralStatisticsCALogger_updateAnalyticsGeneralTransactionStatistics___block_invoke;
    v12[3] = &unk_1E7D7F948;
    v13 = v8;
    v10 = v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);

    objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("com.apple.nfcd.generalTransactionStatistic"));
  }
}

void __75__NFGeneralStatisticsCALogger_updateAnalyticsGeneralTransactionStatistics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &unk_1E7D886D0;
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v5, "integerValue") + v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v12, v13);

  }
}

+ (void)_setupInitValuesForGeneralTransactionStatistics
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&unk_1E7D88BE8, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(&unk_1E7D88BE8);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E7D886D0, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E7D88BE8, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCALoggerUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v2, CFSTR("com.apple.nfcd.generalTransactionStatistic"));
}

+ (void)updateGeneralDeviceStatistic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  if (v4)
  {
    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getCALoggerUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.nfcd.generalDeviceStatistic"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = (void *)objc_msgSend(v7, "mutableCopy");
      }
      else
      {
        objc_msgSend(a1, "_resetGeneralDeviceStatisticToDefaults");
        objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.nfcd.generalDeviceStatistic"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v10, "mutableCopy");

      }
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __60__NFGeneralStatisticsCALogger_updateGeneralDeviceStatistic___block_invoke;
      v15 = &unk_1E7D7F970;
      v11 = v9;
      v16 = v11;
      v17 = &v18;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);
      if (*((_BYTE *)v19 + 24))
      {
        objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("com.apple.nfcd.generalDeviceStatistic"), v12, v13, v14, v15);
        objc_msgSend(v6, "synchronize");
      }

      _Block_object_dispose(&v18, 8);
    }

  }
}

void __60__NFGeneralStatisticsCALogger_updateGeneralDeviceStatistic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("totalDynamicPackages")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = &unk_1E7D886D0;
      if (v6)
        v8 = (void *)v6;
      v9 = v8;

      v10 = (void *)MEMORY[0x1E0CB37E8];
      v11 = objc_msgSend(v9, "integerValue");

      objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v5, "integerValue") + v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v12, v17);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 32);
  if (v14)
  {
    objc_msgSend(v13, "objectForKey:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToNumber:", v5);

    if ((v16 & 1) != 0)
      goto LABEL_15;
LABEL_7:
    v13 = *(void **)(a1 + 32);
  }
  objc_msgSend(v13, "setValue:forKey:", v5, v17);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_15:

}

+ (void)postGeneralDeviceStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCALoggerUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.nfcd.generalDeviceStatistic"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.generalDeviceStatistic"), v5);

    }
    objc_msgSend(a1, "_resetGeneralDeviceStatisticToDefaults");

    v4 = v7;
  }

}

+ (void)_resetGeneralDeviceStatisticToDefaults
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCALoggerUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v3 = (void *)objc_opt_new();
    v4 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("hasFelicaExpressTransactionEnable"));
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("hasAccessExpressTransactionEnable"));
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("hasGenericAExpressEnable"));
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("radioIsEnabled"));
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("hasAttackLogs"));
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("hasOverCurrentErrors"));
    objc_msgSend(v3, "setValue:forKey:", &unk_1E7D886D0, CFSTR("totalDynamicPackages"));
    objc_msgSend(v3, "setValue:forKey:", &unk_1E7D886D0, CFSTR("seCounterMeasureLevel"));
    objc_msgSend(v3, "setValue:forKey:", &unk_1E7D886D0, CFSTR("totalCardProvisioned"));
    objc_msgSend(v3, "setValue:forKey:", &stru_1E7D801F8, CFSTR("currentProvisionedCards"));
    objc_msgSend(v3, "setValue:forKey:", &unk_1E7D886D0, CFSTR("totalPurpleTrustKeys"));
    objc_msgSend(v3, "setValue:forKey:", &unk_1E7D886E8, CFSTR("failForwardState"));
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("com.apple.nfcd.generalDeviceStatistic"));
    objc_msgSend(v5, "synchronize");

  }
}

+ (void)postAnalyticsSetupEndpoints:(unsigned int)a3 totalUnknowntoSE:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    v5 = *(_QWORD *)&a3;
    v9 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("totalIdentifiersUnknowntoSE"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("totalIdentifiersReceived"));

    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.setupEndpointFailureEvent"), v9);

  }
}

+ (void)postPlasticCardEnableStatus:(BOOL)a3 aid:(id)a4
{
  _BOOL8 v4;
  void *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("status");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("aid");
  v12[0] = v7;
  v8 = &stru_1E7D801F8;
  if (v6)
    v8 = v6;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.plasticCardEnableEvent"), v9);
}

@end
