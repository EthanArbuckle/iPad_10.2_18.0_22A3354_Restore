@implementation RESessionRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature sessionFeature](REFeature, "sessionFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (float)_relevanceForProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  NSDate *v17;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    goto LABEL_4;
  }
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_4:
    objc_msgSend(v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v4, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v4, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "earlierDate:", self->_lastDateUpdate);
        v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    objc_msgSend(v4, "startDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v4, "endDate"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      v11 = objc_alloc(MEMORY[0x24BDD1508]);
      objc_msgSend(v4, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

      if (objc_msgSend(v14, "containsDate:", self->_lastDateUpdate))
        v15 = 1.0;
      else
        v15 = 0.0;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v4, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "laterDate:", self->_lastDateUpdate);
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    if (v17 == self->_lastDateUpdate)
      v15 = 1.0;
    else
      v15 = 0.0;

    goto LABEL_19;
  }
  v15 = 1.0;
LABEL_20:

  return v15;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  return objc_msgSend(a3, "isHistoric");
}

- (void)_scheduleUpdatesForSessionProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[RERelevanceProviderManagerUpdate scheduledUpdateForProvider:atDate:](RERelevanceProviderManagerUpdate, "scheduledUpdateForProvider:atDate:", v10, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v6);

  }
  objc_msgSend(v10, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v10, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RERelevanceProviderManagerUpdate scheduledUpdateForProvider:atDate:](RERelevanceProviderManagerUpdate, "scheduledUpdateForProvider:atDate:", v10, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v9);

  }
}

- (void)_prepareForUpdate
{
  NSDate *v3;
  NSDate *lastDateUpdate;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastDateUpdate = self->_lastDateUpdate;
  self->_lastDateUpdate = v3;

}

- (void)resume
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleSignificantTimeChange, v3, 0);

}

- (void)pause
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

}

- (void)_handleSignificantTimeChange
{
  void *v3;
  _QWORD v4[5];

  -[RERelevanceProviderManager _removeAllPendingUpdates](self, "_removeAllPendingUpdates");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__RESessionRelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  v4[3] = &unk_24CF8ACE8;
  v4[4] = self;
  -[RERelevanceProviderManager _enumerateProviders:](self, "_enumerateProviders:", v4);
  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v3);

}

uint64_t __65__RESessionRelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdatesForSessionProvider:", a2);
}

- (NSDate)lastUpdateDate
{
  return self->_lastDateUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDateUpdate, 0);
}

@end
