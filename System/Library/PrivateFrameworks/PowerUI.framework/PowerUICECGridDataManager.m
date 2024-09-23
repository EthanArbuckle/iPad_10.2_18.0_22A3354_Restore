@implementation PowerUICECGridDataManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PowerUICECGridDataManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __43__PowerUICECGridDataManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;

}

- (PowerUICECGridDataManager)init
{
  id v2;
  os_log_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)PowerUICECGridDataManager;
  v2 = -[PowerUICECGridDataManager init](&v36, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.cec", "GridDataManager");
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.powerui.cec"));
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.powerui.cecgriddatamanager.queue", v7);
    v9 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v8;

    objc_msgSend(MEMORY[0x24BE3D650], "managerWithID:locationBundlePath:", CFSTR("com.apple.PowerUIAgent.gridManager"), CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v10;

    *((_QWORD *)v2 + 5) = 0x40CC200000000000;
    objc_msgSend(*((id *)v2 + 2), "objectForKey:", CFSTR("cleanIntervals"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v31 = v12;
      v14 = objc_msgSend(v12, "mutableCopy");
      v15 = (void *)*((_QWORD *)v2 + 8);
      *((_QWORD *)v2 + 8) = v14;

      v16 = *((_QWORD *)v2 + 4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Loaded cleaner intervals:", buf, 2u);
      }
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = *((id *)v2 + 8);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            v22 = *((_QWORD *)v2 + 4);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              v24 = (void *)MEMORY[0x24BDD1500];
              v25 = v22;
              objc_msgSend(v24, "localizedStringFromDate:dateStyle:timeStyle:", v23, 0, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v38 = v26;
              _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        }
        while (v19);
      }

      v13 = v31;
    }
    objc_msgSend(*((id *)v2 + 2), "objectForKey:", CFSTR("testSavingOpportunity"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      *((_BYTE *)v2 + 8) = objc_msgSend(v27, "BOOLValue");
    objc_msgSend(*((id *)v2 + 2), "objectForKey:", CFSTR("testChargeNow"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      *((_BYTE *)v2 + 9) = objc_msgSend(v29, "BOOLValue");

  }
  return (PowerUICECGridDataManager *)v2;
}

- (BOOL)shouldEngageForPluggedInTime:(double)a3
{
  void *v5;
  void *v6;
  int v7;
  NSObject *log;
  BOOL v9;
  NSObject *v10;
  NSObject *queue;
  _QWORD block[7];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;

  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("testSavingOpportunity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "BOOLValue");
      self->_tSavingOpportunity = v7;
      if (v7)
      {
LABEL_4:
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TestMode: Saving Mode set", buf, 2u);
        }

        return 1;
      }
    }
    else if (self->_tSavingOpportunity)
    {
      goto LABEL_4;
    }

  }
  if (a3 >= 3600.0)
  {
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x2020000000;
    v17 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__PowerUICECGridDataManager_shouldEngageForPluggedInTime___block_invoke;
    block[3] = &unk_24D3FC5F8;
    block[4] = self;
    block[5] = buf;
    *(double *)&block[6] = a3;
    dispatch_sync(queue, block);
    v9 = v15[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v10 = self->_log;
    v9 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "Predicted pluggedIn time is short. Not engaging", buf, 2u);
      return 0;
    }
  }
  return v9;
}

void __58__PowerUICECGridDataManager_shouldEngageForPluggedInTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v4 = v2;
    objc_msgSend(v3, "fetchDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v5;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Current forecast fetch date %@", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "fetchDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v7 = *(_QWORD *)(a1 + 32);
  if (v8 >= -*(double *)(v7 + 40))
  {
    v9 = *(_QWORD *)(v7 + 48);

    if (v9)
      goto LABEL_7;
  }
  else
  {

  }
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "fetchForecast");
LABEL_7:
  v11 = *(_QWORD **)(a1 + 32);
  if (v11[6])
  {
    objc_msgSend(v11, "valuesFromForecast:forInterval:", *(double *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v12;
      _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "Relavant forecast is  %@", (uint8_t *)&v18, 0xCu);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "enoughVariationForForecast:", v12) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      v14 = 0;
      if (v17)
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Not enough variation in forecast. Not engaging", (uint8_t *)&v18, 2u);
        v14 = 0;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;

  }
  else
  {
    v15 = v11[4];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "Empty forecast. Not engaging", (uint8_t *)&v18, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

+ (id)cleanIntervalsStringFromDates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  os_log_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v25 = os_log_create("com.apple.powerui.cec", "GridDataManager");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v28 = *(_QWORD *)v31;
    v10 = 0x24BDD1000uLL;
    do
    {
      v11 = 0;
      v26 = v8;
      v27 = v8 + 1;
      v12 = v5;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        objc_msgSend(v13, "timeIntervalSinceDate:", v12);
        if (v14 > 900.0 || v27 + v11 == objc_msgSend(obj, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v4, 0, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x24BDD1500];
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v12, 900.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringFromDate:dateStyle:timeStyle:", v17, 0, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("%@-%@"), v15, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v9)
          {
            objc_msgSend(*(id *)(v10 + 1992), "stringWithFormat:", CFSTR("%@, %@"), v9, v19);
            v21 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v21;
          }
          else
          {
            v9 = v19;
          }
          v22 = v13;

          v4 = v22;
          v10 = 0x24BDD1000;
        }
        v5 = v13;

        ++v11;
        v12 = v5;
      }
      while (v7 != v11);
      v8 = v7 + v26;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  v23 = v9;
  return v23;
}

- (BOOL)enoughVariationForForecast:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSObject *log;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_11);
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v4, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = vabdd_f64(v7, v9);

  if (v10 < 75.0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = log;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      objc_msgSend(v4, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v19 = 134218240;
      v20 = v15;
      v21 = 2048;
      v22 = v17;
      _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Not enough variation in forecast values (%lf - %lf)", (uint8_t *)&v19, 0x16u);

    }
  }

  return v10 >= 75.0;
}

uint64_t __56__PowerUICECGridDataManager_enoughVariationForForecast___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "compare:") == -1)
    return -1;
  else
    return 1;
}

- (void)setupChargingTime:(double)a3 forPluggedInTime:(double)a4
{
  void *v7;
  double v8;
  _GDSEmissionForecast *currentForecast;
  id v10;
  NSObject *log;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  NSObject *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  void *v51;
  uint8_t v52[128];
  uint8_t buf[4];
  double v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  -[_GDSEmissionForecast fetchDate](self->_currentForecast, "fetchDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceNow");
  if (v8 < -self->_refetchPeriod)
  {

LABEL_4:
    v10 = -[PowerUICECGridDataManager fetchForecast](self, "fetchForecast");
    goto LABEL_5;
  }
  currentForecast = self->_currentForecast;

  if (!currentForecast)
    goto LABEL_4;
LABEL_5:
  if (!self->_currentForecast)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "No forecast available. Skipping", buf, 2u);
    }
  }
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v54 = a3 / 60.0;
    v55 = 2048;
    v56 = a4 / 60.0;
    _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Figuring out cleanest %.02lf mins from %.02lf mins", buf, 0x16u);
  }
  -[PowerUICECGridDataManager valuesFromForecast:forInterval:](self, "valuesFromForecast:forInterval:", self->_currentForecast, a4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PowerUICECGridDataManager thresholdFromForecast:forChargeTime:](self, "thresholdFromForecast:forChargeTime:", a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUICECGridDataManager forecastMapFrom:ofInterval:](self, "forecastMapFrom:ofInterval:", self->_currentForecast, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v47;
    v20 = (double)v13;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v25 = v24;

        if (v25 <= v20)
          objc_msgSend(v14, "addObject:", v22);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v18);
  }
  v39 = v16;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("self"), 1);
  v51 = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortUsingDescriptors:", v26);

  v40 = v14;
  objc_storeStrong((id *)&self->_cleanIntervals, v14);
  v27 = self->_log;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v27, OS_LOG_TYPE_DEFAULT, "Cleaner intervals:", buf, 2u);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v28 = self->_cleanIntervals;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v43 != v31)
          objc_enumerationMutation(v28);
        v33 = self->_log;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
          v35 = (void *)MEMORY[0x24BDD1500];
          v36 = v33;
          objc_msgSend(v35, "localizedStringFromDate:dateStyle:timeStyle:", v34, 0, 1);
          v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412290;
          v54 = v37;
          _os_log_impl(&dword_215A71000, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

        }
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v30);
  }

  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_cleanIntervals, CFSTR("cleanIntervals"));
}

- (unint64_t)thresholdFromForecast:(id)a3 forChargeTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *log;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("self"), 1);
      v31[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sortUsingDescriptors:", v10);

      v11 = (unint64_t)(a4 / 900.0) + 1;
      if (v11 >= objc_msgSend(v8, "count"))
        v11 = objc_msgSend(v8, "count") - 1;
      objc_msgSend(v8, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

    }
    else
    {
      v13 = 99999;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[PowerUICECGridDataManager thresholdFromForecast:forChargeTime:].cold.2(log, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    v13 = 99999;
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PowerUICECGridDataManager thresholdFromForecast:forChargeTime:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  return v13;
}

- (BOOL)shouldChargeNow
{
  NSObject *log;
  BOOL v4;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  char v11;

  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild")
    && self->_tChargeNow)
  {
    log = self->_log;
    v4 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TestMode: Charge Now set", buf, 2u);
      return 0;
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    v9 = buf;
    v10 = 0x2020000000;
    v11 = 1;
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke;
    v7[3] = &unk_24D3FC660;
    v7[4] = self;
    v7[5] = buf;
    dispatch_sync(queue, v7);
    v4 = v9[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  return v4;
}

void __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v21 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v7, "timeIntervalSinceNow", (_QWORD)v20);
          if (v8 < 0.0 && v8 > -900.0)
          {
            v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v7;
              _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Current time within clean window startin at %@", buf, 0xCu);
            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

            return;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v4)
          continue;
        break;
      }
    }

    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Current time NOT in clean window intervals %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)fetchForecast
{
  void *v3;
  NSObject *log;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[_GDSManager latestMarginalEmissionForecast](self->_gridManager, "latestMarginalEmissionForecast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = log;
    objc_msgSend(v3, "forecastMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Emission Forecast: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_storeStrong((id *)&self->_currentForecast, v3);
  return v3;
}

- (id)valuesFromForecast:(id)a3 forInterval:(double)a4
{
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "forecastMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = a4 / 900.0;
    if (a4 > 86400.0)
      v6 = 96.0;
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("self"), 1);
    v19[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortUsingDescriptors:", v12);

    v13 = objc_msgSend(v10, "count");
    if (v13 >= v7)
      v14 = v7;
    else
      v14 = v13;
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addObject:", v17);
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)forecastMapFrom:(id)a3 ofInterval:(double)a4
{
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "forecastMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = a4 / 900.0;
    if (a4 > 86400.0)
      v6 = 96.0;
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("self"), 1);
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortUsingDescriptors:", v12);

    if ((_DWORD)v7)
    {
      for (i = 0; i != v7; ++i)
      {
        if (objc_msgSend(v10, "count") <= i)
          break;
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)resetState
{
  _GDSEmissionForecast *currentForecast;
  NSMutableArray *cleanIntervals;

  currentForecast = self->_currentForecast;
  self->_currentForecast = 0;

  cleanIntervals = self->_cleanIntervals;
  self->_cleanIntervals = 0;

  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("cleanIntervals"));
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (double)refetchPeriod
{
  return self->_refetchPeriod;
}

- (void)setRefetchPeriod:(double)a3
{
  self->_refetchPeriod = a3;
}

- (BOOL)tSavingOpportunity
{
  return self->_tSavingOpportunity;
}

- (void)setTSavingOpportunity:(BOOL)a3
{
  self->_tSavingOpportunity = a3;
}

- (BOOL)tChargeNow
{
  return self->_tChargeNow;
}

- (void)setTChargeNow:(BOOL)a3
{
  self->_tChargeNow = a3;
}

- (_GDSEmissionForecast)currentForecast
{
  return self->_currentForecast;
}

- (void)setCurrentForecast:(id)a3
{
  objc_storeStrong((id *)&self->_currentForecast, a3);
}

- (_GDSManager)gridManager
{
  return self->_gridManager;
}

- (void)setGridManager:(id)a3
{
  objc_storeStrong((id *)&self->_gridManager, a3);
}

- (NSMutableArray)cleanIntervals
{
  return self->_cleanIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanIntervals, 0);
  objc_storeStrong((id *)&self->_gridManager, 0);
  objc_storeStrong((id *)&self->_currentForecast, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)thresholdFromForecast:(uint64_t)a3 forChargeTime:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "No forecast to get threshold from", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

- (void)thresholdFromForecast:(uint64_t)a3 forChargeTime:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "Forecast is empty", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

void __44__PowerUICECGridDataManager_shouldChargeNow__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "Clean intervals missing for this session. Bailing out", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

@end
