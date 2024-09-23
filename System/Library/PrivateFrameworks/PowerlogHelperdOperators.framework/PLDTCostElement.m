@implementation PLDTCostElement

+ (id)getCostElementInstance
{
  if (getCostElementInstance_onceCostElement != -1)
    dispatch_once(&getCostElementInstance_onceCostElement, &__block_literal_global_22);
  return (id)getCostElementInstance_singletonCostElement;
}

void __41__PLDTCostElement_getCostElementInstance__block_invoke()
{
  PLDTCostElement *v0;
  void *v1;

  v0 = objc_alloc_init(PLDTCostElement);
  v1 = (void *)getCostElementInstance_singletonCostElement;
  getCostElementInstance_singletonCostElement = (uint64_t)v0;

}

- (PLDTCostElement)init
{
  PLDTCostElement *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLDTCostElement;
  v2 = -[PLDTCostElement init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)_trackedProcesses;
    _trackedProcesses = v3;

  }
  return v2;
}

- (PLDTCostElement)initWithTime:(id)a3
{
  id v5;
  PLDTCostElement *v6;
  PLDTCostElement *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLDTCostElement;
  v6 = -[PLDTCostElement init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startDate, a3);
    objc_storeStrong((id *)&v7->_costReturnedTillDate, a3);
    v7->_costAggregated = 0.0;
    v8 = objc_opt_new();
    v9 = (void *)_trackedProcesses;
    _trackedProcesses = v8;

  }
  return v7;
}

- (void)addEvent:(double)a3 atTime:(id)a4
{
  double v6;
  id v7;

  v7 = a4;
  objc_sync_enter(CFSTR("___Sync___"));
  -[PLDTCostElement costAggregated](self, "costAggregated");
  -[PLDTCostElement setCostAggregated:](self, "setCostAggregated:", v6 + a3);
  if (a3 > 0.0)
    -[PLDTCostElement setLastOverheadStart:](self, "setLastOverheadStart:", v7);
  objc_sync_exit(CFSTR("___Sync___"));

}

- (void)addNetworkingEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6 withQueryCount:(int)a7
{
  uint64_t v7;
  uint64_t v9;
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
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v44 = a4;
  objc_sync_enter(CFSTR("___Sync___"));
  v11 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)_trackedProcesses;
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v16);

    v17 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("networkingCostReturnedTillDate"));

  }
  v22 = a6 == 8 || a6 == 4;
  if (a3 > 0.0 && v22)
  {
    v23 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("networkingCostAggregated"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v30 = (void *)MEMORY[0x1E0CB37E8];
      v31 = (void *)_trackedProcesses;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("networkingCostAggregated"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      objc_msgSend(v30, "numberWithDouble:", v35 + a3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v36, CFSTR("networkingCostAggregated"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v32, CFSTR("networkingCostAggregated"));
    }

    v37 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKey:", v44, CFSTR("lastNetworkingOverheadStart"));

    v40 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKey:", v43, CFSTR("lastNetworkingOverheadStartCount"));

  }
  objc_sync_exit(CFSTR("___Sync___"));

}

- (void)addLocationEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v6 = *(_QWORD *)&a5;
  v31 = a4;
  objc_sync_enter(CFSTR("___Sync___"));
  v8 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)_trackedProcesses;
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v13);

  }
  if (a3 > 0.0)
  {
    v14 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("locationCostAggregated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = (void *)_trackedProcesses;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("locationCostAggregated"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      objc_msgSend(v21, "numberWithDouble:", v26 + a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v27, CFSTR("locationCostAggregated"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("locationCostAggregated"));
    }

    v28 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("lastLocationOverheadStart"));

  }
  objc_sync_exit(CFSTR("___Sync___"));

}

- (void)addCpuEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v7 = *(_QWORD *)&a5;
  v34 = a4;
  objc_sync_enter(CFSTR("___Sync___"));
  v9 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)_trackedProcesses;
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v14);

  }
  v16 = a6 == 8 || a6 == 4;
  if (a3 > 0.0 && v16)
  {
    v17 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("cpuCostAggregated"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v24 = (void *)MEMORY[0x1E0CB37E8];
      v25 = (void *)_trackedProcesses;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("cpuCostAggregated"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      objc_msgSend(v24, "numberWithDouble:", v29 + a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v30, CFSTR("cpuCostAggregated"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("cpuCostAggregated"));
    }

    v31 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v34, CFSTR("lastCpuOverheadStart"));

  }
  objc_sync_exit(CFSTR("___Sync___"));

}

- (void)addGpuEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v7;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v7 = *(_QWORD *)&a5;
  v32 = a4;
  objc_sync_enter(CFSTR("___Sync___"));
  v9 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)_trackedProcesses;
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v14);

  }
  if (a3 > 0.0 && a6 == 8)
  {
    v15 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("gpuCostAggregated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      v23 = (void *)_trackedProcesses;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("gpuCostAggregated"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      objc_msgSend(v22, "numberWithDouble:", v27 + a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v28, CFSTR("gpuCostAggregated"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v24, CFSTR("gpuCostAggregated"));
    }

    v29 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("lastGpuOverheadStart"));

  }
  objc_sync_exit(CFSTR("___Sync___"));

}

- (void)addDisplayEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v7;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v7 = *(_QWORD *)&a5;
  v32 = a4;
  objc_sync_enter(CFSTR("___Sync___"));
  v9 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)_trackedProcesses;
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v14);

  }
  if (a3 > 0.0 && a6 == 8)
  {
    v15 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("displayCostAggregated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      v23 = (void *)_trackedProcesses;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("displayCostAggregated"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      objc_msgSend(v22, "numberWithDouble:", v27 + a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v28, CFSTR("displayCostAggregated"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v24, CFSTR("displayCostAggregated"));
    }

    v29 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("lastDisplayOverheadStart"));

  }
  objc_sync_exit(CFSTR("___Sync___"));

}

- (id)getCostUptoTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PLDTCostElement costReturnedTillDate](self, "costReturnedTillDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  v8 = v7;

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("cost"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("overhead"));
  if (v8 >= 0.0)
  {
    objc_sync_enter(CFSTR("___Sync___"));
    if (v8 > 0.0)
    {
      -[PLDTCostElement costAggregated](self, "costAggregated");
      if (v9 > 0.0)
      {
        -[PLDTCostElement costAggregated](self, "costAggregated");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(v10 / v8 * 0.0009765625 * 0.0009765625 * 500.0 + 500.0, 1000.0));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("cost"));

      }
    }
    -[PLDTCostElement lastOverheadStart](self, "lastOverheadStart");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (v14 < 5.0)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA1C0C50, CFSTR("overhead"));
    -[PLDTCostElement setCostAggregated:](self, "setCostAggregated:", 0.0);
    objc_sync_exit(CFSTR("___Sync___"));
  }
  -[PLDTCostElement setCostReturnedTillDate:](self, "setCostReturnedTillDate:", v4);

  return v5;
}

- (id)getNetworkingCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7 withQueryCount:(int)a8
{
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  id v44;

  v11 = *(_QWORD *)&a4;
  v12 = a3;
  v44 = a5;
  v42 = a6;
  v13 = (void *)objc_opt_new();
  v14 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("networkingCostReturnedTillDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v17);
  v19 = v18;

  objc_sync_enter(CFSTR("___Sync___"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("cost"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("overhead"));
  v20 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("lastNetworkingOverheadStartCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("networkingCostAggregated"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 > 0.0)
  {
    objc_msgSend(v27, "doubleValue", v42, v44);
    if (v28 > 0.0)
    {
      objc_msgSend(v27, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(v29 / v19 * 0.0009765625 * 0.0009765625 * 500.0 + 500.0, 1000.0));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("cost"));

    }
  }
  if ((int)(a8 - objc_msgSend(v23, "intValue", v42)) <= 11)
  {
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 != v31)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C0C50, CFSTR("overhead"));
    }
  }
  v32 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("networkingCostAggregated"));

  v35 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, CFSTR("lastNetworkingOverheadStartCount"));

  objc_sync_exit(CFSTR("___Sync___"));
  v38 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v12, CFSTR("networkingCostReturnedTillDate"));

  return v13;
}

- (id)getLocationCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  objc_sync_enter(CFSTR("___Sync___"));
  v14 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("locationCostAggregated"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("cost"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("overhead"));
  v18 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("locationCostAggregated"));

  objc_sync_exit(CFSTR("___Sync___"));
  return v13;
}

- (id)getCpuCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  objc_sync_enter(CFSTR("___Sync___"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("cost"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("overhead"));
  if (a7 == 8 || a7 == 4)
  {
    v15 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cpuCostAggregated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("cost"));

  }
  v19 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("cpuCostAggregated"));

  objc_sync_exit(CFSTR("___Sync___"));
  return v14;
}

- (id)getGpuCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  objc_sync_enter(CFSTR("___Sync___"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("cost"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("overhead"));
  if (a7 == 8)
  {
    v15 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("gpuCostAggregated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("cost"));

  }
  v19 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("gpuCostAggregated"));

  objc_sync_exit(CFSTR("___Sync___"));
  return v14;
}

- (id)getApplicationCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v7 = *(_QWORD *)&a7;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  objc_sync_enter(CFSTR("___Sync___"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("cost"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("overhead"));
  if ((_DWORD)v7 == 4)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA1C0C68, CFSTR("cost"));
  objc_sync_exit(CFSTR("___Sync___"));

  return v13;
}

- (id)getDisplayCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  objc_sync_enter(CFSTR("___Sync___"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("cost"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("overhead"));
  if (a7 == 8)
  {
    v15 = (void *)_trackedProcesses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("displayCostAggregated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("cost"));

  }
  v19 = (void *)_trackedProcesses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA1C0C38, CFSTR("displayCostAggregated"));

  objc_sync_exit(CFSTR("___Sync___"));
  return v14;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)costReturnedTillDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCostReturnedTillDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)costAggregated
{
  return self->_costAggregated;
}

- (void)setCostAggregated:(double)a3
{
  self->_costAggregated = a3;
}

- (NSDate)lastOverheadStart
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastOverheadStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOverheadStart, 0);
  objc_storeStrong((id *)&self->_costReturnedTillDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
