@implementation PPSRecipeEngine

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_6);
  return (id)sharedInstance_recipeEngine;
}

void __33__PPSRecipeEngine_sharedInstance__block_invoke()
{
  PPSRecipeEngine *v0;
  void *v1;

  v0 = objc_alloc_init(PPSRecipeEngine);
  v1 = (void *)sharedInstance_recipeEngine;
  sharedInstance_recipeEngine = (uint64_t)v0;

}

- (id)createEventRecipeForMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "subsystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@::%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSReaderLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine createEventRecipeForMetric:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }
  -[PPSRecipeEngine eventRecipeHandlers](self, "eventRecipeHandlers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = v9;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (id)createMetricRecipeForMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "subsystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@::%@::%@"), v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSReaderLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine createEventRecipeForMetric:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }
  -[PPSRecipeEngine metricRecipeHandlers](self, "metricRecipeHandlers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = v10;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

- (id)createTimeSeriesRecipeForMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "subsystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@::%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PPSReaderLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine createEventRecipeForMetric:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }
  -[PPSRecipeEngine timeSeriesRecipeHandlers](self, "timeSeriesRecipeHandlers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = v9;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (id)executeEventRecipe:(id)a3 on:(id)a4 metrics:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PPSRecipeEngine eventRecipeHandlers](self, "eventRecipeHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    ((void (**)(_QWORD, id, id, id *))v14)[2](v14, v11, v12, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*a6)
    {
      v26 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v26, "setMetrics:", v15);
      goto LABEL_11;
    }
    PPSReaderLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine executeEventRecipe:on:metrics:error:].cold.2();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Curated event recipe is not supported %@"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v29[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PPSRecipeEngine"), 3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    PPSReaderLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine executeEventRecipe:on:metrics:error:].cold.1((uint64_t)v10, v19, v20, v21, v22, v23, v24, v25);

  }
  v26 = 0;
LABEL_11:

  return v26;
}

- (id)executeMetricRecipe:(id)a3 on:(id)a4 metric:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PPSRecipeEngine metricRecipeHandlers](self, "metricRecipeHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Curated metric recipe is not supported %@"), v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PPSRecipeEngine"), 3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    PPSReaderLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:].cold.1((uint64_t)v10, v19, v20, v21, v22, v23, v24, v25);

    v15 = 0;
    goto LABEL_8;
  }
  ((void (**)(_QWORD, id, id, id *))v14)[2](v14, v11, v12, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a6)
  {
    PPSReaderLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:].cold.2();
LABEL_8:

  }
  return v15;
}

- (id)executeTimeSeriesRecipe:(id)a3 on:(id)a4 metrics:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PPSRecipeEngine timeSeriesRecipeHandlers](self, "timeSeriesRecipeHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Curated time series recipe is not supported %@"), v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PPSRecipeEngine"), 3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    PPSReaderLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:].cold.1((uint64_t)v10, v19, v20, v21, v22, v23, v24, v25);

    v15 = 0;
    goto LABEL_8;
  }
  ((void (**)(_QWORD, id, id, id *))v14)[2](v14, v11, v12, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a6)
  {
    PPSReaderLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:].cold.2();
LABEL_8:

  }
  return v15;
}

- (PPSRecipeEngine)init
{
  PPSRecipeEngine *v2;
  PPSRecipeEngine *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSRecipeEngine;
  v2 = -[PPSRecipeEngine init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PPSRecipeEngine setupHandlers](v2, "setupHandlers");
  return v3;
}

- (void)setupHandlers
{
  NSMutableDictionary *v3;
  NSMutableDictionary *eventRecipeHandlers;
  NSMutableDictionary *v5;
  NSMutableDictionary *metricRecipeHandlers;
  NSMutableDictionary *v7;
  NSMutableDictionary *timeSeriesRecipeHandlers;
  void *v9;
  _QWORD v10[5];

  v3 = (NSMutableDictionary *)objc_opt_new();
  eventRecipeHandlers = self->_eventRecipeHandlers;
  self->_eventRecipeHandlers = v3;

  v5 = (NSMutableDictionary *)objc_opt_new();
  metricRecipeHandlers = self->_metricRecipeHandlers;
  self->_metricRecipeHandlers = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  timeSeriesRecipeHandlers = self->_timeSeriesRecipeHandlers;
  self->_timeSeriesRecipeHandlers = v7;

  +[PPSRecipeEngine recipeHandlers](PPSRecipeEngine, "recipeHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __32__PPSRecipeEngine_setupHandlers__block_invoke;
  v10[3] = &unk_25142CC50;
  v10[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

uint64_t __32__PPSRecipeEngine_setupHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerHandlersForClass:", a2);
}

- (void)registerHandlersForClass:(Class)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  -[objc_class eventRecipes](a3, "eventRecipes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class metricRecipes](a3, "metricRecipes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class timeSeriesRecipes](a3, "timeSeriesRecipes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[PPSRecipeEngine eventRecipeHandlers](self, "eventRecipeHandlers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          PPSReaderLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v11;
            _os_log_error_impl(&dword_2439D9000, v14, OS_LOG_TYPE_ERROR, "Attempting to register duplicate handler for %@, skipping", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v14 = objc_claimAutoreleasedReturnValue();
          -[PPSRecipeEngine eventRecipeHandlers](self, "eventRecipeHandlers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v8);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v36;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[PPSRecipeEngine metricRecipeHandlers](self, "metricRecipeHandlers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          PPSReaderLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v21;
            _os_log_error_impl(&dword_2439D9000, v24, OS_LOG_TYPE_ERROR, "Attempting to register duplicate handler for %@, skipping", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", v21);
          v24 = objc_claimAutoreleasedReturnValue();
          -[PPSRecipeEngine metricRecipeHandlers](self, "metricRecipeHandlers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v21);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v18);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v37;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
        -[PPSRecipeEngine timeSeriesRecipeHandlers](self, "timeSeriesRecipeHandlers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          PPSReaderLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v31;
            _os_log_error_impl(&dword_2439D9000, v34, OS_LOG_TYPE_ERROR, "Attempting to register duplicate handler for %@, skipping", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", v31);
          v34 = objc_claimAutoreleasedReturnValue();
          -[PPSRecipeEngine timeSeriesRecipeHandlers](self, "timeSeriesRecipeHandlers");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v31);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v28);
  }

}

+ (id)recipeHandlers
{
  if (recipeHandlers_onceToken != -1)
    dispatch_once(&recipeHandlers_onceToken, &__block_literal_global_17);
  return (id)recipeHandlers_recipeHandlers;
}

void __33__PPSRecipeEngine_recipeHandlers__block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "addObject:", NSClassFromString(CFSTR("PPSBasebandRecipeHandler")));
  objc_msgSend(v0, "addObject:", NSClassFromString(CFSTR("PPSModelURLRecipeHandler")));
  objc_msgSend(v0, "addObject:", NSClassFromString(CFSTR("PPSSampleRecipeHandler")));
  v1 = (void *)recipeHandlers_recipeHandlers;
  recipeHandlers_recipeHandlers = (uint64_t)v0;

}

- (NSMutableDictionary)eventRecipeHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventRecipeHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)metricRecipeHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricRecipeHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)timeSeriesRecipeHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimeSeriesRecipeHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSeriesRecipeHandlers, 0);
  objc_storeStrong((id *)&self->_metricRecipeHandlers, 0);
  objc_storeStrong((id *)&self->_eventRecipeHandlers, 0);
}

- (void)createEventRecipeForMetric:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_2439D9000, a1, a3, "Nil metric sent to RecipeEngine", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_0();
}

- (void)executeEventRecipe:(uint64_t)a3 on:(uint64_t)a4 metrics:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2439D9000, a2, a3, "Curated event recipe is not supported %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)executeEventRecipe:on:metrics:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_2439D9000, v0, v1, "Error fetching response for event recipe: %@ error: %@");
  OUTLINED_FUNCTION_7();
}

- (void)executeMetricRecipe:(uint64_t)a3 on:(uint64_t)a4 metric:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2439D9000, a2, a3, "Curated metric recipe is not supported %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)executeMetricRecipe:on:metric:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_2439D9000, v0, v1, "Error fetching response for metric recipe: %@ error: %@");
  OUTLINED_FUNCTION_7();
}

@end
