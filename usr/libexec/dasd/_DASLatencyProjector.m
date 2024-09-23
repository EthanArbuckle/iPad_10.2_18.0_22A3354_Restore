@implementation _DASLatencyProjector

- (_DASLatencyProjector)init
{
  _DASLatencyProjector *v2;
  uint64_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASLatencyProjector;
  v2 = -[_DASLatencyProjector init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latencyProjector")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CF5E8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABE30 != -1)
    dispatch_once(&qword_1001ABE30, block);
  return (id)qword_1001ABE28;
}

- (id)exactTaskNamePredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.TaskName == %@"), a3);
}

- (id)exactFeatureCode:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.FeatureCode == %@"), a3);
}

- (BOOL)isDASTaskCheckpoint:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "metricKeysAndValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
  v5 = (unint64_t)objc_msgSend(v4, "unsignedLongValue");

  return (v5 < 0x33) & (0x4210040108400uLL >> v5);
}

- (id)findLastTaskSubmissionEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *log;
  uint64_t v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricKeysAndValues"));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TaskName")));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metricKeysAndValues"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
        v15 = objc_msgSend(v14, "unsignedLongValue");

        if (v15 == (id)40 && v9 != 0)
        {
          v18 = 0;
LABEL_18:

          v9 = v18;
          continue;
        }
        if (-[_DASLatencyProjector isDASTaskCheckpoint:](self, "isDASTaskCheckpoint:", v12))
          v17 = v9 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          v19 = v9;

          v21 = (void *)v24;
          v20 = v25;
          goto LABEL_26;
        }
        if (v15 == (id)10)
        {
          v18 = v12;
          goto LABEL_18;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (!v8)
        goto LABEL_23;
    }
  }
  v9 = 0;
LABEL_23:

  log = self->_log;
  v21 = (void *)v24;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v24;
    v33 = 2112;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Last submission event for %@: %@", buf, 0x16u);
  }
  v19 = v9;
  v20 = v25;
LABEL_26:

  return v19;
}

- (id)findLastCheckpointEvent:(id)a3 checkpoint:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *log;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  unint64_t v30;
  __int16 v31;
  void *v32;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metricKeysAndValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TaskName")));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v30 = a4;
    v31 = 2112;
    v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Finding the last event for checkpoint %lu of %@", buf, 0x16u);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v22 = v9;
    v23 = v6;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metricKeysAndValues", v22, v23));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
        v19 = objc_msgSend(v18, "unsignedLongValue");

        if (v19 == (id)a4)
        {
          v20 = v16;
          goto LABEL_13;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
        continue;
      break;
    }
    v20 = 0;
LABEL_13:
    v9 = v22;
    v6 = v23;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)findLastDASTaskCheckpointEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *log;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricKeysAndValues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TaskName")));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000EB648((uint64_t)v7, log, v9);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (-[_DASLatencyProjector isDASTaskCheckpoint:](self, "isDASTaskCheckpoint:", v15))
        {
          v16 = v15;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (id)removeImmediatelyPrecedingSubmissions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricKeysAndValues"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      if (v13 != (id)10)
        break;
      objc_msgSend(v4, "addObject:", v10);
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v14, "removeObjectsInArray:", v4);

  return v14;
}

- (id)getTaskCheckpointPairings:(id)a3
{
  id v3;
  _DASTaskCheckpointPair *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  _DASTaskCheckpointPair *v16;
  _DASTaskCheckpointPair *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (_DASTaskCheckpointPair *)v3;
  v5 = -[_DASTaskCheckpointPair countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricKeysAndValues"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
        v13 = (unint64_t)objc_msgSend(v12, "unsignedLongValue");

        if (v13 == 20)
        {
          v14 = v10;
LABEL_14:

          v7 = v14;
          continue;
        }
        if (v7)
        {
          if (v13 <= 0x32 && ((1 << v13) & 0x4010040000000) != 0)
          {
            v16 = -[_DASTaskCheckpointPair initWithParams:terminalEvent:]([_DASTaskCheckpointPair alloc], "initWithParams:terminalEvent:", v7, v10);
            objc_msgSend(v19, "addObject:", v16);

            v14 = 0;
            goto LABEL_14;
          }
        }
      }
      v6 = -[_DASTaskCheckpointPair countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v6)
      {

        if (v7)
        {
          v17 = -[_DASTaskCheckpointPair initWithParams:terminalEvent:]([_DASTaskCheckpointPair alloc], "initWithParams:terminalEvent:", v7, v7);
          objc_msgSend(v19, "addObject:", v17);
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
  }
  v7 = 0;
  v17 = v4;
LABEL_20:

LABEL_21:
  return v19;
}

- (id)getRecentUniqueProgressEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *log;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricKeysAndValues"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TaskName")));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting the recent unique progress events for %@", buf, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metricKeysAndValues"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("WorkloadCategory")));

        if ((objc_msgSend(v10, "containsObject:", v18) & 1) == 0)
        {
          objc_msgSend(v10, "addObject:", v18);
          objc_msgSend(v9, "insertObject:atIndex:", v16, 0);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  return v9;
}

- (unint64_t)computeOverallProgressPercentage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *log;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricKeysAndValues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TaskName")));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Computing Overall Progress Percentage for %@", buf, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getRecentUniqueProgressEvents:](self, "getRecentUniqueProgressEvents:", v4));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v10)
    goto LABEL_12;
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v13)
        objc_enumerationMutation(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "metricKeysAndValues"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CompletedPercentage")));

      v12 += (unint64_t)objc_msgSend(v16, "unsignedIntegerValue");
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v11);
  if (v12)
    v17 = v12 / (unint64_t)objc_msgSend(v9, "count");
  else
LABEL_12:
    v17 = 0;

  return v17;
}

- (id)getRecentUniqueInstallationEvents:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _BYTE v23[128];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting the recent unique installation events", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metricKeysAndValues"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));

        if (v15 && (objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v15);
          objc_msgSend(v6, "insertObject:atIndex:", v13, 0);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)findActivitiesByName:(id)a3
{
  id v4;
  NSObject *log;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000EB6B4((uint64_t)v4, log, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allTasks"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name", (_QWORD)v20));
        v17 = objc_msgSend(v4, "containsObject:", v16);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v18);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  return v7;
}

- (void)flushPPSCaches
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *log;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector lastPPSFlush](self, "lastPPSFlush"));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector lastPPSFlush](self, "lastPPSFlush"));
  if (!v6 || v5 < -3.0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000EB720(log);
    PLQueryRegistered(1, CFSTR("XPCCacheFlush"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[_DASLatencyProjector setLastPPSFlush:](self, "setLastPPSFlush:", v8);

  }
}

- (id)getTasksForFeatures:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
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
  void *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v30 = v8;
  v31 = v7;
  v29 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadTasksForFeatures:metrics:timeFilter:filepath:", v7, 0, v8, v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "metricKeysAndValues"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("FeatureCodes")));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "metricKeysAndValues"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("TaskName")));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v22));

        if (!v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v25);

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v26));

        if ((objc_msgSend(v27, "containsObject:", v21) & 1) == 0)
          objc_msgSend(v27, "addObject:", v21);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  return v12;
}

- (id)getLastOSUpgradeTimestamp:(id)a3 endDate:(id)a4 eraseInstallOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getRecentUniqueInstallationEvents:](self, "getRecentUniqueInstallationEvents:", a3));
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSince1970");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("LastUpgradeSystemTimestamp <= %lf"), v10));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v11));

    v9 = (void *)v12;
  }
  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("InstallType = 0")));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v13));

    v9 = (void *)v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reverseObjectEnumerator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nextObject"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metricKeysAndValues"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));
  objc_msgSend(v18, "doubleValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));

  return v19;
}

- (id)computeBlockedDurations:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *i;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[3];

  v51 = a3;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRequiresPluggedInPolicy policyInstance](_DASRequiresPluggedInPolicy, "policyInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "policyName"));
  v43 = +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](_DASDeviceActivityPolicy, "policyInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "policyName"));
  v41 = +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", v6);

  v50 = +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", CFSTR("Incompatibility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v7));

  v46 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectEnumerator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "policyName", v41));
      objc_msgSend(v10, "addObject:", v13);

      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
      v12 = (void *)v14;
    }
    while (v14);
  }
  v45 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRequiresPluggedInPolicy policyInstance](_DASRequiresPluggedInPolicy, "policyInstance", v41));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "policyName"));
  v63[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](_DASDeviceActivityPolicy, "policyInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "policyName"));
  v63[1] = v18;
  v63[2] = CFSTR("Incompatibility");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 3));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));
  objc_msgSend(v10, "minusSet:", v20);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v25)
          objc_enumerationMutation(v21);
        v24 |= +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }
  v44 = v21;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = v51;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v52 = 0;
    v49 = 0;
    v31 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j), "metricKeysAndValues"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Maintenance")));

        if (((unint64_t)objc_msgSend(v34, "unsignedLongValue") & (v42 | v43)) != 0)
        {
          ++v30;
        }
        else if (((unint64_t)objc_msgSend(v34, "unsignedLongValue") & v50) != 0)
        {
          ++v52;
        }
        else
        {
          v35 = (unint64_t)objc_msgSend(v34, "unsignedLongValue");
          v36 = v49;
          if ((v35 & v24) != 0)
            v36 = v49 + 1;
          v49 = v36;
        }

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
    v52 = 0;
    v49 = 0;
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 900 * v30));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v37, CFSTR("UnpluggedOrDeviceActive"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 900 * v52));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v38, CFSTR("Incompatibility"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 900 * v49));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v39, CFSTR("SystemConditions"));

  return v48;
}

- (id)computeElapsedRunTimeFromPairings:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *log;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startEvent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metricKeysAndValues"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TaskName")));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Computing Elapsed Run Time for %@", buf, 0xCu);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v16)
  {
    v17 = v16;
    v37 = v13;
    v38 = v8;
    v18 = 0;
    v19 = *(_QWORD *)v40;
    v20 = 0.0;
    do
    {
      v21 = 0;
      v22 = v18;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v15);
        v18 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v21);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "terminalEvent"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startEvent"));

        if (v23 == v24)
        {
          if (!v7)
            v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v7, "timeIntervalSince1970", v37, v38, (_QWORD)v39);
          v32 = v31;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startEvent"));
          objc_msgSend(v25, "epochTimestamp");
          v30 = v32 - v33;
        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "terminalEvent"));
          objc_msgSend(v25, "epochTimestamp");
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startEvent"));
          objc_msgSend(v28, "epochTimestamp");
          v30 = v27 - v29;

        }
        v20 = v20 + v30;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dictionaryRepresentation"));
        objc_msgSend(v9, "addObject:", v34);

        v21 = (char *)v21 + 1;
        v22 = v18;
      }
      while (v17 != v21);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v17);

    v13 = v37;
    v8 = v38;
  }
  else
  {
    v20 = 0.0;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, CFSTR("Elapsed Runtime"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Checkpoint Pairings"));
  return v8;
}

- (id)computeElapsedRunTimesFromCheckpoints:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = objc_msgSend(v7, "copy");

  v10 = objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findLastTaskSubmissionEvent:](self, "findLastTaskSubmissionEvent:", v9));
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      objc_msgSend(v11, "epochTimestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("@epochTimestamp >= %lf"), v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getTaskCheckpointPairings:](self, "getTaskCheckpointPairings:", v14));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeElapsedRunTimeFromPairings:endDate:](self, "computeElapsedRunTimeFromPairings:endDate:", v15, v6));
      v17 = v6;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionaryRepresentation"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("Submission Event"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findLastDASTaskCheckpointEvent:](self, "findLastDASTaskCheckpointEvent:", v9));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dictionaryRepresentation"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("Last DAS Checkpoint Event"));

      objc_msgSend(v8, "insertObject:atIndex:", v16, 0);
      objc_msgSend(v11, "epochTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("@epochTimestamp < %lf"), v21));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v22));
      v9 = (id)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector removeImmediatelyPrecedingSubmissions:](self, "removeImmediatelyPrecedingSubmissions:", v23));

      v6 = v17;
      v24 = objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findLastTaskSubmissionEvent:](self, "findLastTaskSubmissionEvent:", v9));

      v11 = (void *)v24;
    }
    while (v24);
  }
  if (objc_msgSend(v9, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getTaskCheckpointPairings:](self, "getTaskCheckpointPairings:", v9));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeElapsedRunTimeFromPairings:endDate:](self, "computeElapsedRunTimeFromPairings:endDate:", v25, v6));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findLastDASTaskCheckpointEvent:](self, "findLastDASTaskCheckpointEvent:", v9));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dictionaryRepresentation"));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("Last DAS Checkpoint Event"));

    objc_msgSend(v8, "addObject:", v26);
  }

  return v8;
}

- (id)computeElapsedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadTaskCheckpoints:metrics:timeFilter:filepath:", v8, 0, v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
  v25 = v10;
  v26 = v9;
  if (v12)
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)v13;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v8;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "array"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "filteredArrayUsingPredicate:", v20));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeElapsedRunTimesFromCheckpoints:endDate:](self, "computeElapsedRunTimesFromCheckpoints:endDate:", v22, v14));

        objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, v19);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  return v29;
}

- (id)computeEstimatedRunTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 activity:(id)a6 endDate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _UNKNOWN **v67;
  void *v68;
  void *v70;
  double v71;
  void *v72;
  unint64_t v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];

  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v75 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "array"));
  v81 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeElapsedRunTimesFromCheckpoints:endDate:](self, "computeElapsedRunTimesFromCheckpoints:endDate:", v16, v13));

  v82 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Submission Event")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("epoch")));
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("@epochTimestamp >= %lf"), v21));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredTimeSeriesUsingPredicate:"));

  v78 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "array"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getRecentUniqueProgressEvents:](self, "getRecentUniqueProgressEvents:", v23));

  v25 = -[_DASLatencyProjector computeOverallProgressPercentage:](self, "computeOverallProgressPercentage:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Elapsed Runtime")));
  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Last DAS Checkpoint Event")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
  v30 = (unint64_t)objc_msgSend(v29, "unsignedIntegerValue");

  v80 = v18;
  objc_msgSend(v15, "addEntriesFromDictionary:", v18);
  v74 = v12;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fastPass"));
  v32 = v31 != 0;
  v72 = v31;

  v73 = v25;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("Overall Progress"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v34, CFSTR("hasFastPass"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v32));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v35, CFSTR("isFastPass"));

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v36 = v24;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v88 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Recent Progress Events")));

        if (!v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v43, CFSTR("Recent Progress Events"));

        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Recent Progress Events")));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dictionaryRepresentation"));
        objc_msgSend(v44, "addObject:", v45);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    }
    while (v38);
  }

  if (v30 > 0x32)
    goto LABEL_14;
  if (((1 << v30) & 0x4200040000000) != 0)
  {
LABEL_31:
    v66 = v74;
    v65 = v75;
    v67 = &AnalyticsSendEvent_ptr;
    goto LABEL_32;
  }
  if (((1 << v30) & 0x8400) != 0)
  {
    if (v28 == 0.0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "reverseObjectEnumerator"));
      v47 = objc_msgSend(v46, "nextObject");
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v48 = v46;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      if (v49)
      {
        v50 = v49;
        v51 = 0;
        v52 = *(_QWORD *)v84;
LABEL_18:
        v53 = 0;
        v54 = v51;
        while (1)
        {
          if (*(_QWORD *)v84 != v52)
            objc_enumerationMutation(v48);
          v51 = *(id *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v53);

          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Last DAS Checkpoint Event")));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
          v57 = objc_msgSend(v56, "unsignedIntegerValue");

          if (v57 == (id)30)
            break;

          v53 = (char *)v53 + 1;
          v54 = v51;
          if (v50 == v53)
          {
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
            if (v50)
              goto LABEL_18;

            goto LABEL_25;
          }
        }
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Elapsed Runtime")));
        objc_msgSend(v58, "doubleValue");
        v60 = v59;

        if (!v51)
          goto LABEL_28;
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Last DAS Checkpoint Event")));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Submission Event")));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("epoch")));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v63, CFSTR("Previous Instance Submission Time"));

        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("epoch")));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v64, CFSTR("Previous Instance Completion Time"));

        v28 = v60;
        goto LABEL_31;
      }
LABEL_25:

LABEL_28:
    }
  }
  else if (((1 << v30) & 0x10000100000) == 0)
  {
LABEL_14:
    v28 = -1.0;
    goto LABEL_31;
  }
  if (v73)
  {
    v28 = v28 / (float)((float)v73 / 100.0);
    goto LABEL_31;
  }
  v66 = v74;
  v65 = v75;
  v67 = &AnalyticsSendEvent_ptr;
  if (v72)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRuntimeLimiter sharedLimiter](_DASRuntimeLimiter, "sharedLimiter"));
    objc_msgSend(v70, "maximumRuntimeForActivity:", v74);
    v28 = v71;

  }
  else
  {
    v28 = v28 + 3600.0;
  }
LABEL_32:
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67[133], "numberWithDouble:", v28));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v68, CFSTR("Estimated Runtime"));

  return v15;
}

- (id)computeEstimatedRunTimes:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v33 = 0;
  }
  else
  {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findActivitiesByName:](self, "findActivitiesByName:", v8));
  }
  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadTaskCheckpoints:metrics:timeFilter:filepath:", v8, 0, v9, v10));
  v27 = v11;
  v28 = v10;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadTaskProgress:metrics:timeFilter:filepath:", v8, 0, v9, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
  v29 = v9;
  if (v12)
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)v13;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "filteredTimeSeriesUsingPredicate:", v20));

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v19));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "filteredTimeSeriesUsingPredicate:", v22));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v19));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:](self, "computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:", v19, v21, v23, v24, v14));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v25, v19);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v16);
  }

  return v34;
}

- (id)getConditionsPenalty:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  _UNKNOWN **v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000EB760(log, v4);
    v7 = objc_msgSend(v4, "requiresSignificantUserInactivity");
    if (objc_msgSend(v4, "requiresPlugin"))
      v7 |= 2uLL;
    if (objc_msgSend(v4, "requiresNetwork"))
      v8 = v7 | 4;
    else
      v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileProtection"));

    if (v9)
      v10 = v8 | 8;
    else
      v10 = v8;
    if (objc_msgSend(v4, "requiresDeviceInactivity"))
      v10 |= 0x10uLL;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("Blocking Criteria Bitmask"));

    if (v10 > 0x1F)
      v12 = &off_10016EE70;
    else
      v12 = (&off_100160318)[v10];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("Conditions Penalty"));
  }

  return v5;
}

- (id)getConditionsPenalties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findActivitiesByName:](self, "findActivitiesByName:", v4));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12, (_QWORD)v16));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getConditionsPenalty:](self, "getConditionsPenalty:", v13));

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)computeFeatureTimeline:(id)a3 installations:(id)a4
{
  id v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id obj;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v5 = a3;
  v28 = a4;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metricKeysAndValues"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FeatureState")));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("FeatureState"));

        objc_msgSend(v7, "epochTimestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("epoch"));

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "reverseObjectEnumerator"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));
              objc_msgSend(v18, "doubleValue");
              v20 = v19;

              objc_msgSend(v7, "epochTimestamp");
              if (v20 < v21)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "indexOfObject:", v17)));
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("InstallationEventIndex"));

                goto LABEL_16;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_16:

        objc_msgSend(v26, "addObject:", v8);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }

  return v26;
}

- (id)computeActivityTimeline:(id)a3 installations:(id)a4
{
  id v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id obj;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v5 = a3;
  v28 = a4;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metricKeysAndValues"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("CheckpointState"));

        objc_msgSend(v7, "epochTimestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("epoch"));

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "reverseObjectEnumerator"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));
              objc_msgSend(v18, "doubleValue");
              v20 = v19;

              objc_msgSend(v7, "epochTimestamp");
              if (v20 < v21)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "indexOfObject:", v17)));
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("InstallationEventIndex"));

                goto LABEL_16;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_16:

        objc_msgSend(v26, "addObject:", v8);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }

  return v26;
}

- (id)computePlugInStatus:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metricKeysAndValues"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsPluggedIn")));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("plugInState"));

        objc_msgSend(v9, "epochTimestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("epoch"));

        objc_msgSend(v4, "addObject:", v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)computeUserActivityStatus:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metricKeysAndValues"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UserActivityStatus")));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("UserActivityStatus"));

        objc_msgSend(v9, "epochTimestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("epoch"));

        objc_msgSend(v4, "addObject:", v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)computeProgressTimeline:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metricKeysAndValues"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CompletedPercentage")));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("CompletedPercentage"));

        objc_msgSend(v9, "epochTimestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("epoch"));

        objc_msgSend(v4, "addObject:", v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)computeActivityBlockingReason:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metricKeysAndValues"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BlockingPolicies")));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("BlockingPolicies"));

        objc_msgSend(v9, "epochTimestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("timestamp"));

        objc_msgSend(v4, "addObject:", v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *k;
  void *v49;
  void *v50;
  void *v51;
  void *m;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *n;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  void *ii;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id obj;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  _DASLatencyProjector *v101;
  id v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];

  v98 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "loadConfig:timeFilter:filepath:", 0, v8, v9));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "array"));

  v101 = self;
  v86 = (void *)v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getRecentUniqueInstallationEvents:](self, "getRecentUniqueInstallationEvents:", v11));
  v89 = v9;
  v90 = v8;
  if (v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    objc_msgSend(v13, "timeIntervalSince1970");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    objc_msgSend(v16, "timeIntervalSince1970");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("LastUpgradeSystemTimestamp >= %lf AND LastUpgradeSystemTimestamp <= %lf"), v15, v17));

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v18));
    v12 = (void *)v19;
  }
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  obj = v12;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v125 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "metricKeysAndValues"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("LastUpgradeSystemTimestamp"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "metricKeysAndValues"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Build")));
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("Build"));

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "metricKeysAndValues"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("InstallType")));
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("InstallType"));

        objc_msgSend(v103, "addObject:", v25);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
    }
    while (v21);
  }

  objc_msgSend(v88, "setObject:forKeyedSubscript:", v103, CFSTR("Installation Events"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "loadFeatureCheckpoints:metrics:timeFilter:filepath:", v98, 0, v90, v89));
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v32 = v98;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v121;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v121 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)j);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactFeatureCode:](v101, "exactFeatureCode:", v37));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "filteredTimeSeriesUsingPredicate:", v38));

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "array"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeFeatureTimeline:installations:](v101, "computeFeatureTimeline:installations:", v40, v103));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringValue"));
        objc_msgSend(v96, "setObject:forKeyedSubscript:", v41, v42);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
    }
    while (v34);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getTasksForFeatures:timeFilter:filepath:](v101, "getTasksForFeatures:timeFilter:filepath:", v32, 0, v89));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v102 = v43;
  v45 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v117;
    do
    {
      for (k = 0; k != v46; k = (char *)k + 1)
      {
        if (*(_QWORD *)v117 != v47)
          objc_enumerationMutation(v102);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)k)));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v49));
        objc_msgSend(v44, "unionSet:", v50);

      }
      v46 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
    }
    while (v46);
  }
  v85 = v32;

  v87 = v44;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "loadTaskCheckpoints:metrics:timeFilter:filepath:", v44, 0, v90, v89));
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v92 = v51;
  v99 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v112, v130, 16);
  if (v99)
  {
    v94 = *(_QWORD *)v113;
    do
    {
      for (m = 0; m != v99; m = (char *)m + 1)
      {
        if (*(_QWORD *)v113 != v94)
          objc_enumerationMutation(v92);
        v53 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)m);
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "metricKeysAndValues"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("CheckpointState")));
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v56, CFSTR("CheckpointState"));

        objc_msgSend(v53, "epochTimestamp");
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v57, CFSTR("epoch"));

        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "metricKeysAndValues"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("TaskName")));
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v59, CFSTR("TaskName"));

        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "reverseObjectEnumerator"));
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v108, v129, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v109;
          while (2)
          {
            for (n = 0; n != v62; n = (char *)n + 1)
            {
              if (*(_QWORD *)v109 != v63)
                objc_enumerationMutation(v60);
              v65 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)n);
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));
              objc_msgSend(v66, "doubleValue");
              v68 = v67;

              objc_msgSend(v53, "epochTimestamp");
              if (v68 < v69)
              {
                v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v103, "indexOfObject:", v65)));
                objc_msgSend(v54, "setObject:forKeyedSubscript:", v70, CFSTR("InstallationEventIndex"));

                goto LABEL_41;
              }
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v108, v129, 16);
            if (v62)
              continue;
            break;
          }
        }
LABEL_41:

        objc_msgSend(v95, "addObject:", v54);
      }
      v99 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v112, v130, 16);
    }
    while (v99);
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "loadTaskProgress:metrics:timeFilter:filepath:", v87, 0, v90, v89));
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v100 = v71;
  v73 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v104, v128, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v105;
    do
    {
      for (ii = 0; ii != v74; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v105 != v75)
          objc_enumerationMutation(v100);
        v77 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)ii);
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "metricKeysAndValues"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("CompletedPercentage")));
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v80, CFSTR("CompletedPercentage"));

        objc_msgSend(v77, "epochTimestamp");
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v81, CFSTR("epoch"));

        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "metricKeysAndValues"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("TaskName")));
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v83, CFSTR("TaskName"));

        objc_msgSend(v72, "addObject:", v78);
      }
      v74 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v104, v128, 16);
    }
    while (v74);
  }

  objc_msgSend(v88, "setObject:forKeyedSubscript:", v96, CFSTR("Feature Checkpoints"));
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v102, CFSTR("Feature To Tasks Mapping"));
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v95, CFSTR("Task Checkpoints"));
  objc_msgSend(v88, "setObject:forKeyedSubscript:", v72, CFSTR("Progress Checkpoints"));

  return v88;
}

- (id)getDeviceConditionTimelines:(id)a3 filepath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  if (!a4)
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("IsPluggedIn")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsBattery"), 0, v9, v6, 0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computePlugInStatus:](self, "computePlugInStatus:", v11));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("Device PlugIn Status"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("UserActivityStatus")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsPowerManagement"), 0, v13, v6, 0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "array"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeUserActivityStatus:](self, "computeUserActivityStatus:", v15));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("Device User Activity Status"));
  return v7;
}

- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
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
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *n;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *j;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *k;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  void *m;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  id obj;
  uint64_t v100;
  void *v101;
  void *v102;
  _DASLatencyProjector *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v93 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "loadConfig:timeFilter:filepath:", 0, v9, v10));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "array"));

  v92 = (void *)v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getRecentUniqueInstallationEvents:](self, "getRecentUniqueInstallationEvents:", v12));
  v95 = v9;
  v96 = v8;
  v103 = self;
  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
    objc_msgSend(v17, "timeIntervalSince1970");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("LastUpgradeSystemTimestamp >= %lf AND LastUpgradeSystemTimestamp <= %lf"), v16, v18));

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v19));
    v13 = (void *)v20;
  }
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  obj = v13;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v132, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v125 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metricKeysAndValues"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("LastUpgradeSystemTimestamp"));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metricKeysAndValues"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Build")));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("Build"));

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metricKeysAndValues"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("InstallType")));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, CFSTR("InstallType"));

        objc_msgSend(v107, "addObject:", v26);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v132, 16);
    }
    while (v22);
  }

  v33 = v94;
  objc_msgSend(v94, "setObject:forKeyedSubscript:", v107, CFSTR("Installation Events"));
  v34 = v96;
  v35 = v95;
  v36 = v93;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "loadTaskCheckpoints:metrics:timeFilter:filepath:", v96, 0, v95, v93));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "loadTaskBlockingReasons:metrics:timeFilter:filepath:", v96, 0, v95, v93));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "loadTaskProgress:metrics:timeFilter:filepath:", v96, 0, v95, v93));
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (!objc_msgSend(v96, "count"))
  {
    v118 = 0uLL;
    v119 = 0uLL;
    v116 = 0uLL;
    v117 = 0uLL;
    v55 = v37;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "array"));
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v117;
      do
      {
        for (j = 0; j != v58; j = (char *)j + 1)
        {
          if (*(_QWORD *)v117 != v59)
            objc_enumerationMutation(v56);
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)j), "metricKeysAndValues"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("TaskName")));

          if (v62)
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", v62));

            if (!v63)
            {
              v64 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v103, "exactTaskNamePredicate:", v62));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "filteredTimeSeriesUsingPredicate:", v64));

              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "array"));
              v67 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeActivityTimeline:installations:](v103, "computeActivityTimeline:installations:", v66, v107));
              objc_msgSend(v106, "setObject:forKeyedSubscript:", v67, v62);

            }
          }

        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
      }
      while (v58);
    }

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "array"));
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v113;
      do
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(_QWORD *)v113 != v71)
            objc_enumerationMutation(v68);
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)k), "metricKeysAndValues"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("TaskName")));

          if (v74)
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", v74));

            if (!v75)
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v103, "exactTaskNamePredicate:", v74));
              v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "filteredTimeSeriesUsingPredicate:", v76));

              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "array"));
              v79 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeActivityBlockingReason:](v103, "computeActivityBlockingReason:", v78));
              objc_msgSend(v105, "setObject:forKeyedSubscript:", v79, v74);

            }
          }

        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
      }
      while (v70);
    }

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v98 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "array"));
    v80 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
    v35 = v95;
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v109;
      do
      {
        for (m = 0; m != v81; m = (char *)m + 1)
        {
          if (*(_QWORD *)v109 != v82)
            objc_enumerationMutation(v98);
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)m), "metricKeysAndValues"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("TaskName")));

          if (v85)
          {
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", v85));

            if (!v86)
            {
              v87 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v103, "exactTaskNamePredicate:", v85));
              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "filteredTimeSeriesUsingPredicate:", v87));

              v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "array"));
              v90 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeProgressTimeline:](v103, "computeProgressTimeline:", v89));
              objc_msgSend(v104, "setObject:forKeyedSubscript:", v90, v85);

            }
          }

        }
        v81 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
      }
      while (v81);
    }
    v36 = v93;
    v33 = v94;
    v37 = v55;
    goto LABEL_52;
  }
  v122 = 0uLL;
  v123 = 0uLL;
  v120 = 0uLL;
  v121 = 0uLL;
  v98 = v96;
  v38 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
  if (v38)
  {
    v39 = v38;
    v100 = *(_QWORD *)v121;
    do
    {
      for (n = 0; n != v39; n = (char *)n + 1)
      {
        if (*(_QWORD *)v121 != v100)
          objc_enumerationMutation(v98);
        v41 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)n);
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v103, "exactTaskNamePredicate:", v41));
        v43 = v37;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "filteredTimeSeriesUsingPredicate:", v42));

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v103, "exactTaskNamePredicate:", v41));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "filteredTimeSeriesUsingPredicate:", v45));

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](v103, "exactTaskNamePredicate:", v41));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "filteredTimeSeriesUsingPredicate:", v47));

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "array"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeActivityTimeline:installations:](v103, "computeActivityTimeline:installations:", v49, v107));
        objc_msgSend(v106, "setObject:forKeyedSubscript:", v50, v41);

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "array"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeActivityBlockingReason:](v103, "computeActivityBlockingReason:", v51));
        objc_msgSend(v105, "setObject:forKeyedSubscript:", v52, v41);

        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "array"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeProgressTimeline:](v103, "computeProgressTimeline:", v53));
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v54, v41);

        v37 = v43;
      }
      v39 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
    }
    while (v39);
    v33 = v94;
    v35 = v95;
    v36 = v93;
LABEL_52:
    v34 = v96;
  }

  objc_msgSend(v33, "setObject:forKeyedSubscript:", v106, CFSTR("Activity Checkpoints"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v105, CFSTR("Activity Blocking Reasons"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v104, CFSTR("Progress Checkpoints"));

  return v33;
}

- (id)computeEstimatedMADCompletionTime:(id)a3 checkpointTimeSeries:(id)a4 progressTimeSeries:(id)a5 blockingReasonsTimeSeries:(id)a6 activity:(id)a7 osUpgradeTimestamp:(id)a8 endDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  double v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  float v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  id v54;
  id v55;
  unsigned int v56;
  void *v57;
  id v58;

  v58 = a6;
  v15 = a8;
  v16 = a9;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:](self, "computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:", v20, v19, v18, v17, v16));

  if (v22
    && (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Estimated Runtime"))),
        objc_msgSend(v23, "doubleValue"),
        v25 = v24,
        v23,
        v26 = -1.0,
        v25 != -1.0))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Overall Progress")));
    v56 = objc_msgSend(v28, "unsignedIntValue");

    objc_msgSend(v16, "timeIntervalSinceDate:", v15);
    v30 = (unint64_t)v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Estimated Runtime")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Elapsed Runtime")));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "array"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeBlockedDurations:](self, "computeBlockedDurations:", v33));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("UnpluggedOrDeviceActive")));
    v55 = objc_msgSend(v35, "unsignedLongValue");

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Incompatibility")));
    v54 = objc_msgSend(v36, "unsignedLongValue");

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SystemConditions")));
    v53 = objc_msgSend(v37, "unsignedLongValue");

    v57 = v31;
    objc_msgSend(v31, "doubleValue");
    v39 = v38;
    objc_msgSend(v32, "doubleValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v39 - v40));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v41, CFSTR("Estimated Runtime Remaining"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v30));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v42, CFSTR("Time Since Upgrade"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v56));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v43, CFSTR("Overall Progress"));

    v44 = -1.0;
    v45 = -1.0;
    v46 = -1.0;
    if (v56)
    {
      v47 = (float)v56 / (float)(100 - (unint64_t)v56);
      v26 = (float)((float)v30 / v47);
      v44 = (float)((float)(v30 - (unint64_t)v55) / v47);
      v45 = (float)((float)(v30 - (unint64_t)v54) / v47);
      v46 = (float)((float)(v30 - (unint64_t)v53) / v47);
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26, v53));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v48, CFSTR("Remaining Estimated Completion Time"));

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v44));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v49, CFSTR("TimePluggedInOrDeviceInactive"));

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v45));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v50, CFSTR("TimeCompatible"));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v46));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v51, CFSTR("TimeSystemConditionsFavorable"));

    v27 = v21;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)computeEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v41 = 0;
  }
  else
  {
    -[_DASLatencyProjector flushPPSCaches](self, "flushPPSCaches");
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector findActivitiesByName:](self, "findActivitiesByName:", v8));
  }
  v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  if (!v9)
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = objc_alloc((Class)NSDateInterval);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0));
  v14 = objc_msgSend(v12, "initWithStartDate:endDate:", v13, v9);

  v33 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadConfig:timeFilter:filepath:", 0, v14, v10));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "array"));

  v32 = (void *)v16;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector getLastOSUpgradeTimestamp:endDate:eraseInstallOnly:](self, "getLastOSUpgradeTimestamp:endDate:eraseInstallOnly:", v16, v9, 0));
  v17 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v40, v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadTaskCheckpoints:metrics:timeFilter:filepath:", v8, 0, v17, v10));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadTaskProgress:metrics:timeFilter:filepath:", v8, 0, v17, v10));
  v34 = v11;
  v35 = v10;
  v31 = v17;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadIntensiveTaskBlockingReasons:metrics:filepath:", v17, 0, v10));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "filteredTimeSeriesUsingPredicate:", v23));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector exactTaskNamePredicate:](self, "exactTaskNamePredicate:", v22));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "filteredTimeSeriesUsingPredicate:", v25));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v22));
        v28 = v9;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[_DASLatencyProjector computeEstimatedMADCompletionTime:checkpointTimeSeries:progressTimeSeries:blockingReasonsTimeSeries:activity:osUpgradeTimestamp:endDate:](self, "computeEstimatedMADCompletionTime:checkpointTimeSeries:progressTimeSeries:blockingReasonsTimeSeries:activity:osUpgradeTimestamp:endDate:", v22, v24, v26, v37, v27, v40, v9));
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v29, v22);

        v9 = v28;
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v19);
  }

  return v42;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSDate)lastPPSFlush
{
  return self->_lastPPSFlush;
}

- (void)setLastPPSFlush:(id)a3
{
  objc_storeStrong((id *)&self->_lastPPSFlush, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPPSFlush, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
