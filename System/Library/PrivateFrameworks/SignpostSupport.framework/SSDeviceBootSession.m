@implementation SSDeviceBootSession

- (SSDeviceBootSession)initWithIncludeTimelines:(BOOL)a3
{
  SSDeviceBootSession *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *mutableProcessIDToClientSession;
  NSMutableArray *v7;
  NSMutableArray *mutableChronologicalClientSessions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSDeviceBootSession;
  v4 = -[SSDeviceBootSession init](&v10, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableProcessIDToClientSession = v4->_mutableProcessIDToClientSession;
    v4->_mutableProcessIDToClientSession = v5;

    v4->_includeTimelines = a3;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableChronologicalClientSessions = v4->_mutableChronologicalClientSessions;
    v4->_mutableChronologicalClientSessions = v7;

  }
  return v4;
}

- (id)_clientSessionForPID:(int)a3 timebaseRatio:(double)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  SSCAMetalLayerClientSession *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a3;
  -[SSDeviceBootSession processIDToClientSession](self, "processIDToClientSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (SSCAMetalLayerClientSession *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = -[SSCAMetalLayerClientSession initWithPID:includeTimelines:timebaseRatio:]([SSCAMetalLayerClientSession alloc], "initWithPID:includeTimelines:timebaseRatio:", v5, -[SSDeviceBootSession includeTimelines](self, "includeTimelines"), a4);
    -[SSDeviceBootSession mutableProcessIDToClientSession](self, "mutableProcessIDToClientSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    -[SSDeviceBootSession mutableChronologicalClientSessions](self, "mutableChronologicalClientSessions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v9);

  }
  return v9;
}

- (void)_updateDates:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SSDeviceBootSession earliestDate](self, "earliestDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v12, "beginDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSDeviceBootSession setEarliestDate:](self, "setEarliestDate:", v5);

  }
  -[SSDeviceBootSession latestDate](self, "latestDate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  -[SSDeviceBootSession latestDate](self, "latestDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (v10 == -1)
  {
LABEL_5:
    objc_msgSend(v12, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSDeviceBootSession setLatestDate:](self, "setLatestDate:", v11);

  }
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SSDeviceBootSession earliestDate](self, "earliestDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForDate(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kSSDeviceBootSessionKey_EarliestDate);

  -[SSDeviceBootSession latestDate](self, "latestDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForDate(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kSSDeviceBootSessionKey_LatestDate);

  -[SSDeviceBootSession processIDToClientSession](self, "processIDToClientSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[SSDeviceBootSession processIDToClientSession](self, "processIDToClientSession", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, kSSDeviceBootSessionKey_ClientSessions);
  }
  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSDeviceBootSession jsonDescription:](self, "jsonDescription:", 3);
}

- (id)coreAnalyticsEvents
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SSDeviceBootSession processIDToClientSession](self, "processIDToClientSession", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "coreAnalyticsEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;

  return v11;
}

- (NSDictionary)processNameToClientSessions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SSDeviceBootSession mutableChronologicalClientSessions](self, "mutableChronologicalClientSessions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "processName");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = (void *)kSSCAMLUnknownProcessName;
        if (v10)
          v12 = (void *)v10;
        v13 = v12;

        objc_msgSend(v3, "objectForKeyedSubscript:", v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v13);
        }
        objc_msgSend(v14, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestDate, a3);
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (void)setLatestDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestDate, a3);
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (NSMutableArray)mutableChronologicalClientSessions
{
  return self->_mutableChronologicalClientSessions;
}

- (SSCAMetalLayerClientSessionAccumulator)parentAccumulator
{
  return (SSCAMetalLayerClientSessionAccumulator *)objc_loadWeakRetained((id *)&self->_parentAccumulator);
}

- (NSMutableDictionary)mutableProcessIDToClientSession
{
  return self->_mutableProcessIDToClientSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProcessIDToClientSession, 0);
  objc_destroyWeak((id *)&self->_parentAccumulator);
  objc_storeStrong((id *)&self->_mutableChronologicalClientSessions, 0);
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
}

@end
