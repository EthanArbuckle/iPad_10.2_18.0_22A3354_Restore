@implementation UAFAutoAssetProgress

+ (id)getSerialQueue
{
  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_8);
  return (id)qword_2540B1CE0;
}

void __38__UAFAutoAssetProgress_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAutoAssetProgress.Serial", 0);
  v1 = (void *)qword_2540B1CE0;
  qword_2540B1CE0 = (uint64_t)v0;

}

- (UAFAutoAssetProgress)initWithAssetSetUsages:(id)a3 configurationManager:(id)a4 detailedProgressWithStatus:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  char *v35;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v43.receiver = self;
  v43.super_class = (Class)UAFAutoAssetProgress;
  v11 = -[UAFAutoAssetProgress init](&v43, sel_init);
  if (v11)
  {
    v37 = v10;
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v14;

    v11[8] = 0;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *((_QWORD *)v11 + 7) = 0;
    v16 = objc_opt_new();
    v17 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v16;

    v18 = objc_opt_new();
    v19 = (void *)*((_QWORD *)v11 + 9);
    *((_QWORD *)v11 + 9) = v18;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = v8;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (!v21)
      goto LABEL_18;
    v22 = v21;
    v23 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v9, "getAssetSet:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (!v26)
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v45 = "-[UAFAutoAssetProgress initWithAssetSetUsages:configurationManager:detailedProgressWithStatus:]";
            v46 = 2114;
            v47 = v25;
            _os_log_error_impl(&dword_229282000, v31, OS_LOG_TYPE_ERROR, "%s Could get not get configuration for for asset set %{public}@", buf, 0x16u);
          }

          v29 = (void *)MEMORY[0x24BDD16E0];
          v30 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v26, "autoAssetType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = (void *)MEMORY[0x24BDD16E0];
          v30 = 1;
LABEL_13:
          objc_msgSend(v29, "numberWithUnsignedInteger:", v30);
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v11 + 8), "setObject:forKeyedSubscript:", v32, v25);
          goto LABEL_16;
        }
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[UAFAutoAssetProgress initWithAssetSetUsages:configurationManager:detailedProgressWithStatus:]";
          v46 = 2114;
          v47 = v25;
          _os_log_debug_impl(&dword_229282000, v32, OS_LOG_TYPE_DEBUG, "%s No auto asset type defined for %{public}@", buf, 0x16u);
        }
LABEL_16:

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (!v22)
      {
LABEL_18:

        v10 = v37;
        v33 = MEMORY[0x22E2C6D60](v37);
        v34 = (void *)*((_QWORD *)v11 + 10);
        *((_QWORD *)v11 + 10) = v33;

        v35 = v11;
        v8 = v38;
        break;
      }
    }
  }

  return (UAFAutoAssetProgress *)v11;
}

- (void)reportStatus:(unint64_t)a3
{
  uint64_t v5;
  NSMutableDictionary *statuses;
  unint64_t totalWork;
  unint64_t completedWork;
  NSObject *v9;
  NSString *name;
  void *v11;
  void (**detailedProgressWithStatus)(id, unint64_t, unint64_t, unint64_t);
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v5 = -[NSMutableDictionary count](self->_statuses, "count");
  if (v5 != -[NSMutableDictionary count](self->_autoAssetSets, "count"))
  {
    statuses = self->_statuses;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__UAFAutoAssetProgress_reportStatus___block_invoke;
    v13[3] = &unk_24F1F7DE8;
    v13[4] = self;
    v13[5] = &v14;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](statuses, "enumerateKeysAndObjectsUsingBlock:", v13);
  }
  if (*((_BYTE *)v15 + 24))
  {
    totalWork = self->_totalWork;
    completedWork = self->_completedWork;
  }
  else
  {
    totalWork = 0;
    completedWork = 0;
  }
  if (self->_reportedCompletedWork != completedWork
    || self->_reportedTotalWork != totalWork
    || self->_reportedStatus != a3)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      UAFSubscriptionDownloadStatusDescription(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v19 = "-[UAFAutoAssetProgress reportStatus:]";
      v20 = 2114;
      v21 = name;
      v22 = 2048;
      v23 = completedWork;
      v24 = 2048;
      v25 = totalWork;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s Progress for %{public}@: %llu / %llu. Status: %{public}@", buf, 0x34u);

    }
    self->_reportedTotalWork = totalWork;
    self->_reportedCompletedWork = completedWork;
    self->_reportedStatus = a3;
    detailedProgressWithStatus = (void (**)(id, unint64_t, unint64_t, unint64_t))self->_detailedProgressWithStatus;
    if (detailedProgressWithStatus)
      detailedProgressWithStatus[2](detailedProgressWithStatus, self->_completedWork, self->_totalWork, a3);
  }
  _Block_object_dispose(&v14, 8);
}

void __37__UAFAutoAssetProgress_reportStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!objc_msgSend(v5, "intValue")
    || objc_msgSend(v5, "intValue") == 2
    || objc_msgSend(v5, "intValue") == 1
    || objc_msgSend(v5, "intValue") == 3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)summarize
{
  unint64_t v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t *p_totalWork;
  unint64_t *p_completedWork;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = +[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", self->_statuses);
  if (!-[NSMutableDictionary count](self->_statuses, "count") && self->_updateIsFinished)
    v3 = 4;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_autoAssetSets;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v20 = v3;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_autoAssetSets, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "downloadProgress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_autoAssetSets, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "downloadProgress");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v7 += objc_msgSend(v15, "totalExpectedBytes");

          -[NSMutableDictionary objectForKeyedSubscript:](self->_autoAssetSets, "objectForKeyedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "downloadProgress");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v8 += objc_msgSend(v17, "totalWrittenBytes");

        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);

    p_totalWork = &self->_totalWork;
    if (v7 > self->_totalWork)
      *p_totalWork = v7;
    p_completedWork = &self->_completedWork;
    v3 = v20;
    if (v8 > self->_completedWork)
      *p_completedWork = v8;
  }
  else
  {

    p_totalWork = &self->_totalWork;
    p_completedWork = &self->_completedWork;
  }
  if (v3 == 4)
    *p_completedWork = *p_totalWork;
  -[UAFAutoAssetProgress reportStatus:](self, "reportStatus:", v3);
}

- (void)started:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[UAFAutoAssetProgress getSerialQueue](UAFAutoAssetProgress, "getSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__UAFAutoAssetProgress_started___block_invoke;
  v7[3] = &unk_24F1F70C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __32__UAFAutoAssetProgress_started___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "summarize");
}

- (void)progress:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[UAFAutoAssetProgress getSerialQueue](UAFAutoAssetProgress, "getSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__UAFAutoAssetProgress_progress___block_invoke;
  v7[3] = &unk_24F1F70C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __33__UAFAutoAssetProgress_progress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    objc_msgSend(*(id *)(a1 + 40), "downloadProgress");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "downloadProgress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v9, "isStalled");

    }
    objc_msgSend(*(id *)(a1 + 32), "statuses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    if (v13 == 3)
    {
      if ((v8 & 1) != 0)
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 32), "summarize");
        return;
      }
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = 2;
    }
    else
    {
      if (v13 != 2 || !(_DWORD)v8)
        goto LABEL_14;
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = 3;
    }
    objc_msgSend(v14, "numberWithUnsignedInteger:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statuses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

    goto LABEL_14;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315394;
    v22 = "-[UAFAutoAssetProgress progress:]_block_invoke";
    v23 = 2114;
    v24 = v20;
    _os_log_error_impl(&dword_229282000, v16, OS_LOG_TYPE_ERROR, "%s Received progress for unknown auto asset set %{public}@", (uint8_t *)&v21, 0x16u);

  }
}

- (void)finished:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  +[UAFAutoAssetProgress getSerialQueue](UAFAutoAssetProgress, "getSerialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__UAFAutoAssetProgress_finished_withStatus___block_invoke;
  block[3] = &unk_24F1F79C8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __44__UAFAutoAssetProgress_finished_withStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
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
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 136315394;
      v9 = "-[UAFAutoAssetProgress finished:withStatus:]_block_invoke";
      v10 = 2114;
      v11 = v7;
      _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, "%s Received progress for unknown auto asset set %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)updateFinished:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[UAFAutoAssetProgress getSerialQueue](UAFAutoAssetProgress, "getSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__UAFAutoAssetProgress_updateFinished___block_invoke;
  v7[3] = &unk_24F1F7560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__UAFAutoAssetProgress_updateFinished___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUpdateIsFinished:", 1);
  objc_msgSend(*(id *)(a1 + 32), "summarize");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)finishedOutOfSpace:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[UAFAutoAssetProgress getSerialQueue](UAFAutoAssetProgress, "getSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__UAFAutoAssetProgress_finishedOutOfSpace___block_invoke;
  v7[3] = &unk_24F1F70C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__UAFAutoAssetProgress_finishedOutOfSpace___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
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
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 136315394;
      v9 = "-[UAFAutoAssetProgress finishedOutOfSpace:]_block_invoke";
      v10 = 2114;
      v11 = v7;
      _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, "%s Received progress for unknown auto asset set %{public}@", (uint8_t *)&v8, 0x16u);
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

- (BOOL)updateIsFinished
{
  return self->_updateIsFinished;
}

- (void)setUpdateIsFinished:(BOOL)a3
{
  self->_updateIsFinished = a3;
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

- (NSMutableDictionary)autoAssetSets
{
  return self->_autoAssetSets;
}

- (void)setAutoAssetSets:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetSets, a3);
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
  objc_storeStrong((id *)&self->_autoAssetSets, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
