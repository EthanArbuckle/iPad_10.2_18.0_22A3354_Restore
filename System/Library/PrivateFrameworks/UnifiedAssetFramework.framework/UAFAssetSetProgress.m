@implementation UAFAssetSetProgress

+ (id)getSerialQueue
{
  if (_MergedGlobals_16 != -1)
    dispatch_once(&_MergedGlobals_16, &__block_literal_global_18);
  return (id)qword_2540B1DF0;
}

void __37__UAFAssetSetProgress_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAssetSetProgress.Serial", 0);
  v1 = (void *)qword_2540B1DF0;
  qword_2540B1DF0 = (uint64_t)v0;

}

+ (id)validProgressTypes
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("AutoAsset");
  v3[1] = CFSTR("Trial");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UAFAssetSetProgress)initWithName:(id)a3 maxProgressBeforeComplete:(unint64_t)a4 progressWithStatus:(id)a5
{
  id v9;
  id v10;
  UAFAssetSetProgress *v11;
  UAFAssetSetProgress *v12;
  uint64_t v13;
  NSMutableDictionary *progresses;
  uint64_t v15;
  NSMutableDictionary *statuses;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id progressWithStatus;
  UAFAssetSetProgress *v30;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)UAFAssetSetProgress;
  v11 = -[UAFAssetSetProgress init](&v38, sel_init);
  v12 = v11;
  if (v11)
  {
    v32 = v10;
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_completed = 0;
    v12->_total = 0;
    v12->_maxProgressBeforeComplete = a4;
    v13 = objc_opt_new();
    progresses = v12->_progresses;
    v12->_progresses = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    statuses = v12->_statuses;
    v12->_statuses = (NSMutableDictionary *)v15;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v39[0] = CFSTR("AutoAsset");
    v39[1] = CFSTR("Trial");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v22 = (void *)objc_opt_new();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_progresses, "setObject:forKeyedSubscript:", v22, v21);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v12->_progresses, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("Completed"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v12->_progresses, "objectForKeyedSubscript:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("Total"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_statuses, "setObject:forKeyedSubscript:", v27, v21);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v18);
    }

    *(_OWORD *)&v12->_reportedStatus = 0u;
    *(_OWORD *)&v12->_reportedComplete = 0u;
    v10 = v32;
    v28 = MEMORY[0x22E2C6D60](v32);
    progressWithStatus = v12->_progressWithStatus;
    v12->_progressWithStatus = (id)v28;

    v30 = v12;
  }

  return v12;
}

- (void)reportPercent:(unint64_t)a3 status:(unint64_t)a4 totalKnown:(BOOL)a5
{
  NSObject *v8;
  NSObject *v9;
  NSString *name;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void (**progressWithStatus)(double);
  unint64_t reportedComplete;
  unint64_t reportedTotal;
  unint64_t completed;
  unint64_t total;
  int v20;
  const char *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (self->_reportedStatus == a4
    && (!a5 || self->_reportedComplete == self->_completed && self->_reportedTotal == self->_total))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      reportedComplete = self->_reportedComplete;
      reportedTotal = self->_reportedTotal;
      completed = self->_completed;
      total = self->_total;
      v20 = 136316418;
      v21 = "-[UAFAssetSetProgress reportPercent:status:totalKnown:]";
      v22 = 2048;
      v23 = reportedComplete;
      v24 = 2048;
      v25 = completed;
      v26 = 2048;
      v27 = reportedTotal;
      v28 = 2048;
      v29 = total;
      v30 = 1024;
      LODWORD(v31) = a4;
      _os_log_debug_impl(&dword_229282000, v8, OS_LOG_TYPE_DEBUG, "%s Progress and status has not changed, suppressing update: %llu/%llu %llu/%llu %u", (uint8_t *)&v20, 0x3Au);
    }

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      v11 = self->_completed;
      v12 = self->_total;
      UAFSubscriptionDownloadStatusDescription(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136316418;
      v21 = "-[UAFAssetSetProgress reportPercent:status:totalKnown:]";
      v22 = 2114;
      v23 = (unint64_t)name;
      v24 = 2048;
      v25 = a3;
      v26 = 2048;
      v27 = v11;
      v28 = 2048;
      v29 = v12;
      v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s Progress for %{public}@: %lu percent (%llu / %llu) . Status: %{public}@", (uint8_t *)&v20, 0x3Eu);

    }
    v14 = self->_total;
    self->_reportedComplete = self->_completed;
    self->_reportedTotal = v14;
    self->_reportedStatus = a4;
    progressWithStatus = (void (**)(double))self->_progressWithStatus;
    if (progressWithStatus)
      progressWithStatus[2]((double)a3);
  }
}

- (void)summarize
{
  void *v3;
  char v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  unint64_t *p_total;
  unint64_t reportedPercent;
  double v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  +[UAFAssetSetProgress validProgressTypes](UAFAssetSetProgress, "validProgressTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v23)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    obj = v3;
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_progresses, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Completed"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedLongLongValue");

        -[NSMutableDictionary objectForKeyedSubscript:](self->_progresses, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Total"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedLongLongValue");

        if (v14)
        {
          v15 = 0;
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_statuses, "objectForKeyedSubscript:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "unsignedIntegerValue") == 4)
          {
            v15 = 0;
          }
          else
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_statuses, "objectForKeyedSubscript:", v8);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v17, "unsignedIntegerValue") != 5;

          }
        }
        v6 += v11;
        v5 += v14;
        v4 |= v15;
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v23);

    if (v6 > self->_completed)
      self->_completed = v6;
    p_total = &self->_total;
    if (v5 > self->_total)
      *p_total = v5;
  }
  else
  {

    v4 = 0;
    p_total = &self->_total;
  }
  if ((+[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", self->_statuses) & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    reportedPercent = 100;
  }
  else if ((*p_total == 0) | v4 & 1)
  {
    reportedPercent = 0;
  }
  else
  {
    v20 = (double)self->_completed * (double)self->_maxProgressBeforeComplete / (double)*p_total;
    if (self->_reportedPercent <= (unint64_t)v20)
      reportedPercent = (unint64_t)v20;
    else
      reportedPercent = self->_reportedPercent;
  }
  self->_reportedPercent = reportedPercent;
  -[UAFAssetSetProgress reportPercent:status:totalKnown:](self, "reportPercent:status:totalKnown:");
}

- (void)progress:(id)a3 completed:(unint64_t)a4 total:(unint64_t)a5 status:(unint64_t)a6
{
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  NSString *name;
  _QWORD block[5];
  id v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  +[UAFAssetSetProgress validProgressTypes](UAFAssetSetProgress, "validProgressTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v10);

  if ((v12 & 1) != 0)
  {
    +[UAFAssetSetProgress getSerialQueue](UAFAssetSetProgress, "getSerialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__UAFAssetSetProgress_progress_completed_total_status___block_invoke;
    block[3] = &unk_24F1F86B8;
    block[4] = self;
    v17 = v10;
    v18 = a4;
    v19 = a5;
    v20 = a6;
    dispatch_async(v13, block);

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      *(_DWORD *)buf = 136315650;
      v22 = "-[UAFAssetSetProgress progress:completed:total:status:]";
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = name;
      _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Invalid progress type %{public}@ used for %{public}@", buf, 0x20u);
    }

  }
}

uint64_t __55__UAFAssetSetProgress_progress_completed_total_status___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("Completed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("Total"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statuses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "summarize");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)completed
{
  return self->_completed;
}

- (void)setCompleted:(unint64_t)a3
{
  self->_completed = a3;
}

- (unint64_t)total
{
  return self->_total;
}

- (void)setTotal:(unint64_t)a3
{
  self->_total = a3;
}

- (unint64_t)maxProgressBeforeComplete
{
  return self->_maxProgressBeforeComplete;
}

- (void)setMaxProgressBeforeComplete:(unint64_t)a3
{
  self->_maxProgressBeforeComplete = a3;
}

- (NSMutableDictionary)progresses
{
  return self->_progresses;
}

- (void)setProgresses:(id)a3
{
  objc_storeStrong((id *)&self->_progresses, a3);
}

- (NSMutableDictionary)statuses
{
  return self->_statuses;
}

- (void)setStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_statuses, a3);
}

- (unint64_t)reportedComplete
{
  return self->_reportedComplete;
}

- (void)setReportedComplete:(unint64_t)a3
{
  self->_reportedComplete = a3;
}

- (unint64_t)reportedTotal
{
  return self->_reportedTotal;
}

- (void)setReportedTotal:(unint64_t)a3
{
  self->_reportedTotal = a3;
}

- (unint64_t)reportedStatus
{
  return self->_reportedStatus;
}

- (void)setReportedStatus:(unint64_t)a3
{
  self->_reportedStatus = a3;
}

- (unint64_t)reportedPercent
{
  return self->_reportedPercent;
}

- (void)setReportedPercent:(unint64_t)a3
{
  self->_reportedPercent = a3;
}

- (UAFAssetSetProgress)progressWithStatus
{
  return (UAFAssetSetProgress *)self->_progressWithStatus;
}

- (UAFAssetSetProgress)setProgressWithStatus:(id)a3
{
  UAFAssetSetProgress *result;

  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressWithStatus, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
