@implementation TUIStatsCollector

- (TUIStatsCollector)initWithMode:(unint64_t)mode
{
  TUIStatsCollector *v4;
  TUIStatsCollector *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *entries;
  NSMutableArray *v8;
  NSMutableArray *passes;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIStatsCollector;
  v4 = -[TUIStatsCollector init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    v4->_mode = mode;
    if ((mode & 1) != 0)
    {
      v6 = objc_opt_new(NSMutableDictionary);
      entries = v5->_entries;
      v5->_entries = v6;

      mode = v5->_mode;
    }
    if ((mode & 2) != 0)
    {
      v8 = objc_opt_new(NSMutableArray);
      passes = v5->_passes;
      v5->_passes = v8;

    }
    v5->_eventCount[28] = 0;
    *(_OWORD *)&v5->_eventCount[24] = 0u;
    *(_OWORD *)&v5->_eventCount[26] = 0u;
    *(_OWORD *)&v5->_eventCount[20] = 0u;
    *(_OWORD *)&v5->_eventCount[22] = 0u;
    *(_OWORD *)&v5->_eventCount[16] = 0u;
    *(_OWORD *)&v5->_eventCount[18] = 0u;
    *(_OWORD *)&v5->_eventCount[12] = 0u;
    *(_OWORD *)&v5->_eventCount[14] = 0u;
    *(_OWORD *)&v5->_eventCount[8] = 0u;
    *(_OWORD *)&v5->_eventCount[10] = 0u;
    *(_OWORD *)&v5->_eventCount[4] = 0u;
    *(_OWORD *)&v5->_eventCount[6] = 0u;
    *(_OWORD *)v5->_eventCount = 0u;
    *(_OWORD *)&v5->_eventCount[2] = 0u;
  }
  return v5;
}

- (void)updateWithPass:(id)a3 currentEntriesUID:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *currentEntriesUID;
  unint64_t mode;
  uint64_t i;
  double v11;
  uint64_t j;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *k;
  void *v18;
  NSMutableDictionary *entries;
  void *v20;
  TUIStatsFeedEntryCollector *v21;
  TUIStatsFeedEntryCollector *v22;
  unint64_t v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = (NSArray *)objc_msgSend(a4, "copy");
  currentEntriesUID = self->_currentEntriesUID;
  self->_currentEntriesUID = v7;

  mode = self->_mode;
  if ((mode & 4) != 0)
  {
    for (i = 0; i != 5; ++i)
    {
      objc_msgSend(v6, "elapsedTimeForPhase:", i);
      self->_elapsedTime[i] = v11 + self->_elapsedTime[i];
    }
    mode = self->_mode;
    if ((mode & 8) == 0)
    {
LABEL_3:
      if ((mode & 2) == 0)
        goto LABEL_4;
LABEL_12:
      -[NSMutableArray addObject:](self->_passes, "addObject:", v6);
      if ((self->_mode & 1) == 0)
        goto LABEL_23;
      goto LABEL_13;
    }
  }
  else if ((mode & 8) == 0)
  {
    goto LABEL_3;
  }
  for (j = 0; j != 29; ++j)
    self->_eventCount[j] += (unint64_t)objc_msgSend(v6, "countForEvent:", j);
  mode = self->_mode;
  if ((mode & 2) != 0)
    goto LABEL_12;
LABEL_4:
  if ((mode & 1) == 0)
    goto LABEL_23;
LABEL_13:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryPasses"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v15; k = (char *)k + 1)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)k);
        entries = self->_entries;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uid"));
        v21 = (TUIStatsFeedEntryCollector *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](entries, "objectForKeyedSubscript:", v20));

        if (!v21)
        {
          v22 = [TUIStatsFeedEntryCollector alloc];
          v23 = self->_mode;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uid"));
          v21 = -[TUIStatsFeedEntryCollector initWithMode:uid:](v22, "initWithMode:uid:", v23, v24);

          v25 = self->_entries;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uid"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v21, v26);

        }
        -[TUIStatsFeedEntryCollector updateWithPass:](v21, "updateWithPass:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  v6 = v27;
LABEL_23:

}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (NSMutableArray)passes
{
  return self->_passes;
}

- (NSMutableDictionary)entries
{
  return self->_entries;
}

- (NSArray)currentEntriesUID
{
  return self->_currentEntriesUID;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEntriesUID, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

@end
