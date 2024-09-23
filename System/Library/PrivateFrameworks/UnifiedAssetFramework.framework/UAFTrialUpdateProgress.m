@implementation UAFTrialUpdateProgress

+ (id)getSerialQueue
{
  if (_MergedGlobals_11 != -1)
    dispatch_once(&_MergedGlobals_11, &__block_literal_global_12);
  return (id)qword_2540B1D50;
}

void __40__UAFTrialUpdateProgress_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAutoAssetProgress.Serial", 0);
  v1 = (void *)qword_2540B1D50;
  qword_2540B1D50 = (uint64_t)v0;

}

- (UAFTrialUpdateProgress)initWithTrialFactors:(id)a3 detailedProgressWithStatus:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)UAFTrialUpdateProgress;
  v8 = -[UAFTrialUpdateProgress init](&v33, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
    }

    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v19;

    *((_QWORD *)v8 + 7) = 0;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    v21 = objc_opt_new();
    v22 = (void *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = v21;

    v23 = objc_opt_new();
    v24 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = v23;

    *((_WORD *)v8 + 4) = 0;
    v25 = MEMORY[0x22E2C6D60](v7);
    v26 = (void *)*((_QWORD *)v8 + 10);
    *((_QWORD *)v8 + 10) = v25;

    v27 = v8;
  }

  return (UAFTrialUpdateProgress *)v8;
}

- (void)reportStatus:(unint64_t)a3
{
  NSObject *v5;
  unint64_t completedWork;
  unint64_t totalWork;
  NSString *name;
  void *v9;
  unint64_t v10;
  void (**detailedProgressWithStatus)(void);
  int v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_OWORD *)&self->_reportedTotalWork != *(_OWORD *)&self->_totalWork || self->_reportedStatus != a3)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      totalWork = self->_totalWork;
      completedWork = self->_completedWork;
      name = self->_name;
      UAFSubscriptionDownloadStatusDescription(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136316162;
      v13 = "-[UAFTrialUpdateProgress reportStatus:]";
      v14 = 2114;
      v15 = name;
      v16 = 2048;
      v17 = completedWork;
      v18 = 2048;
      v19 = totalWork;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s Progress for %{public}@: %llu / %llu. Status: %{public}@", (uint8_t *)&v12, 0x34u);

    }
    v10 = self->_completedWork;
    self->_reportedTotalWork = self->_totalWork;
    self->_reportedCompletedWork = v10;
    self->_reportedStatus = a3;
    detailedProgressWithStatus = (void (**)(void))self->_detailedProgressWithStatus;
    if (detailedProgressWithStatus)
      detailedProgressWithStatus[2]();
  }
}

- (void)summarize
{
  unint64_t v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  NSMutableDictionary *obj;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = +[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", self->_statuses);
  v4 = v3;
  if (!self->_onDemandFactorsHaveStarted)
  {
    if (v3 != 4)
      goto LABEL_25;
    return;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_factors;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v6)
  {

    goto LABEL_21;
  }
  v7 = v6;
  v26 = v4;
  v27 = 0;
  obj = v5;
  v29 = 0;
  v8 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_factors, "objectForKeyedSubscript:", v10, v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TrialFactorSize"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_11;
      v13 = (void *)v12;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_factors, "objectForKeyedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("TrialFactorFractionCompleted"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_factors, "objectForKeyedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TrialFactorSize"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 += objc_msgSend(v17, "unsignedIntegerValue");

        -[NSMutableDictionary objectForKeyedSubscript:](self->_factors, "objectForKeyedSubscript:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TrialFactorSize"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntegerValue");

        if (v20)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_factors, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TrialFactorSize"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (double)(unint64_t)objc_msgSend(v21, "unsignedLongLongValue");
          -[NSMutableDictionary objectForKeyedSubscript:](self->_factors, "objectForKeyedSubscript:", v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TrialFactorFractionCompleted"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v27 += (unint64_t)(v25 * v22);

LABEL_11:
          continue;
        }
      }
    }
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  }
  while (v7);

  v4 = v26;
  if (v29 > self->_totalWork)
    self->_totalWork = v29;
  if (v27 > self->_completedWork)
    self->_completedWork = v27;
LABEL_21:
  if (v4 == 4)
  {
    self->_completedWork = self->_totalWork;
    if (self->_outOfSpace)
      v4 = 5;
    else
      v4 = 4;
  }
LABEL_25:
  -[UAFTrialUpdateProgress reportStatus:](self, "reportStatus:", v4);
}

- (void)updateStarted
{
  NSObject *v3;
  _QWORD block[5];

  +[UAFTrialUpdateProgress getSerialQueue](UAFTrialUpdateProgress, "getSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__UAFTrialUpdateProgress_updateStarted__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __39__UAFTrialUpdateProgress_updateStarted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("TrialUpdate"));

  return objc_msgSend(*(id *)(a1 + 32), "summarize");
}

- (void)updateFinished
{
  NSObject *v3;
  _QWORD block[5];

  +[UAFTrialUpdateProgress getSerialQueue](UAFTrialUpdateProgress, "getSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__UAFTrialUpdateProgress_updateFinished__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __40__UAFTrialUpdateProgress_updateFinished__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("TrialUpdate"));

  return objc_msgSend(*(id *)(a1 + 32), "summarize");
}

- (void)onDemandFactorsStarted
{
  NSObject *v3;
  _QWORD block[5];

  +[UAFTrialUpdateProgress getSerialQueue](UAFTrialUpdateProgress, "getSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__UAFTrialUpdateProgress_onDemandFactorsStarted__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __48__UAFTrialUpdateProgress_onDemandFactorsStarted__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOnDemandFactorsHaveStarted:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "summarize");
}

- (void)outOfSpaceEncountered
{
  NSObject *v3;
  _QWORD block[5];

  +[UAFTrialUpdateProgress getSerialQueue](UAFTrialUpdateProgress, "getSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UAFTrialUpdateProgress_outOfSpaceEncountered__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __47__UAFTrialUpdateProgress_outOfSpaceEncountered__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOutOfSpace:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "summarize");
}

- (id)getFactorProgressKey:(id)a3 factor:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
}

- (void)trialFactorStarted:(id)a3 namespace:(id)a4 size:(unint64_t)a5 status:(unint64_t)a6
{
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unint64_t v15;

  -[UAFTrialUpdateProgress getFactorProgressKey:factor:](self, "getFactorProgressKey:factor:", a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFTrialUpdateProgress getSerialQueue](UAFTrialUpdateProgress, "getSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__UAFTrialUpdateProgress_trialFactorStarted_namespace_size_status___block_invoke;
  v12[3] = &unk_24F1F80A8;
  v12[4] = self;
  v13 = v9;
  v14 = a6;
  v15 = a5;
  v11 = v9;
  dispatch_async(v10, v12);

}

uint64_t __67__UAFTrialUpdateProgress_trialFactorStarted_namespace_size_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "factors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "factors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

  }
  if (v2 == 4)
    v9 = 1.0;
  else
    v9 = 0.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "factors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("TrialFactorSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "factors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("TrialFactorFractionCompleted"));

  return objc_msgSend(*(id *)(a1 + 32), "summarize");
}

- (void)trialFactorProgress:(id)a3 namespace:(id)a4 fractionCompleted:(double)a5 status:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  double v21;
  unint64_t v22;

  v10 = a3;
  v11 = a4;
  -[UAFTrialUpdateProgress getFactorProgressKey:factor:](self, "getFactorProgressKey:factor:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFTrialUpdateProgress getSerialQueue](UAFTrialUpdateProgress, "getSerialQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__UAFTrialUpdateProgress_trialFactorProgress_namespace_fractionCompleted_status___block_invoke;
  v17[3] = &unk_24F1F80D0;
  v17[4] = self;
  v18 = v12;
  v19 = v10;
  v20 = v11;
  v21 = a5;
  v22 = a6;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(v13, v17);

}

void __81__UAFTrialUpdateProgress_trialFactorProgress_namespace_fractionCompleted_status___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "factors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statuses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "factors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("TrialFactorFractionCompleted"));

    objc_msgSend(*(id *)(a1 + 32), "summarize");
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 64);
      UAFSubscriptionDownloadStatusDescription(*(_QWORD *)(a1 + 72));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136316162;
      v15 = "-[UAFTrialUpdateProgress trialFactorProgress:namespace:fractionCompleted:status:]_block_invoke";
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2048;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Received progress for unknown factor %{public}@ in namespace %{public}@ with fraction completed %f and status %{public}@", (uint8_t *)&v14, 0x34u);

    }
  }
}

- (void)trialFactorFinished:(id)a3 namespace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[UAFTrialUpdateProgress getFactorProgressKey:factor:](self, "getFactorProgressKey:factor:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFTrialUpdateProgress getSerialQueue](UAFTrialUpdateProgress, "getSerialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__UAFTrialUpdateProgress_trialFactorFinished_namespace___block_invoke;
  v13[3] = &unk_24F1F80F8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __56__UAFTrialUpdateProgress_trialFactorFinished_namespace___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statuses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "summarize");
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v9 = 136315650;
      v10 = "-[UAFTrialUpdateProgress trialFactorFinished:namespace:]_block_invoke";
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, "%s Received finished status for unknown factor %{public}@ in namespace %{public}@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)totalWork
{
  return self->_totalWork;
}

- (void)setTotalWork:(unint64_t)a3
{
  self->_totalWork = a3;
}

- (unint64_t)completedWork
{
  return self->_completedWork;
}

- (void)setCompletedWork:(unint64_t)a3
{
  self->_completedWork = a3;
}

- (unint64_t)reportedTotalWork
{
  return self->_reportedTotalWork;
}

- (void)setReportedTotalWork:(unint64_t)a3
{
  self->_reportedTotalWork = a3;
}

- (unint64_t)reportedCompletedWork
{
  return self->_reportedCompletedWork;
}

- (void)setReportedCompletedWork:(unint64_t)a3
{
  self->_reportedCompletedWork = a3;
}

- (unint64_t)reportedStatus
{
  return self->_reportedStatus;
}

- (void)setReportedStatus:(unint64_t)a3
{
  self->_reportedStatus = a3;
}

- (NSMutableDictionary)statuses
{
  return self->_statuses;
}

- (void)setStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_statuses, a3);
}

- (NSMutableDictionary)factors
{
  return self->_factors;
}

- (void)setFactors:(id)a3
{
  objc_storeStrong((id *)&self->_factors, a3);
}

- (BOOL)onDemandFactorsHaveStarted
{
  return self->_onDemandFactorsHaveStarted;
}

- (void)setOnDemandFactorsHaveStarted:(BOOL)a3
{
  self->_onDemandFactorsHaveStarted = a3;
}

- (BOOL)outOfSpace
{
  return self->_outOfSpace;
}

- (void)setOutOfSpace:(BOOL)a3
{
  self->_outOfSpace = a3;
}

- (id)detailedProgressWithStatus
{
  return self->_detailedProgressWithStatus;
}

- (void)setDetailedProgressWithStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_detailedProgressWithStatus, 0);
  objc_storeStrong((id *)&self->_factors, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
