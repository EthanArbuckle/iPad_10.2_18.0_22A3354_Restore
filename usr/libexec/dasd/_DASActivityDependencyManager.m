@implementation _DASActivityDependencyManager

+ (_DASActivityDependencyManager)sharedInstance
{
  if (qword_1001ABA50 != -1)
    dispatch_once(&qword_1001ABA50, &stru_10015E9B0);
  return (_DASActivityDependencyManager *)(id)qword_1001ABA58;
}

- (_DASActivityDependencyManager)init
{
  _DASActivityDependencyManager *v2;
  uint64_t v3;
  NSMutableDictionary *dependencyGroups;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  os_log_t v9;
  OS_os_log *log;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DASActivityDependencyManager;
  v2 = -[_DASActivityDependencyManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    dependencyGroups = v2->_dependencyGroups;
    v2->_dependencyGroups = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.dasd.DependencyManager", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = os_log_create("com.apple.duetactivityscheduler", "DependencyManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

  }
  return v2;
}

- (void)refreshGroupsWithFileProtection:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EBD8;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)beginDependencyMonitoringForActivity:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSObject *log;
  int v7;
  id v8;

  v4 = a3;
  v5 = -[_DASActivityDependencyManager shouldMonitorDependenciesForActivity:](self, "shouldMonitorDependenciesForActivity:", v4);
  log = self->_log;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Beginning dependencies monitoring for %@", (uint8_t *)&v7, 0xCu);
    }
    -[_DASActivityDependencyManager addActivityToDependencyGroups:](self, "addActivityToDependencyGroups:", v4);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E3AF8();
  }

}

- (void)addActivityToDependencyGroups:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _DASActivityDependencyManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F00C;
  block[3] = &unk_10015D558;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)endDependencyMonitoringForActivity:(id)a3
{
  id v4;
  unsigned __int8 v5;
  _BOOL4 v6;

  v4 = a3;
  v5 = -[_DASActivityDependencyManager shouldMonitorDependenciesForActivity:](self, "shouldMonitorDependenciesForActivity:", v4);
  v6 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v6)
      sub_1000E3B58();
    -[_DASActivityDependencyManager removeActivityFromDependencyGroups:](self, "removeActivityFromDependencyGroups:", v4);
  }
  else if (v6)
  {
    sub_1000E3BB8();
  }

}

- (void)removeActivityFromDependencyGroups:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _DASActivityDependencyManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F390;
  block[3] = &unk_10015D558;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (BOOL)reportActivity:(id)a3 consumedResults:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *log;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  char v14;
  _QWORD block[4];
  id v17;
  id v18;
  _DASActivityDependencyManager *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10006F90C;
  v26 = sub_10006F91C;
  v27 = 0;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[_DASActivityDependencyManager reportActivity:consumedResults:error:]";
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: %@ reporting result consumption: %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F924;
  block[3] = &unk_10015EA00;
  v12 = v9;
  v17 = v12;
  v20 = &v22;
  v13 = v8;
  v21 = &v28;
  v18 = v13;
  v19 = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (!*((_BYTE *)v29 + 24) || v23[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E3C18();
      if (!a5)
        goto LABEL_8;
      goto LABEL_7;
    }
    if (a5)
LABEL_7:
      *a5 = objc_retainAutorelease((id)v23[5]);
  }
LABEL_8:
  v14 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (BOOL)reportActivity:(id)a3 producedResults:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *log;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  char v14;
  _QWORD block[4];
  id v17;
  id v18;
  _DASActivityDependencyManager *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10006F90C;
  v26 = sub_10006F91C;
  v27 = 0;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[_DASActivityDependencyManager reportActivity:producedResults:error:]";
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: %@ reporting result production: %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FFEC;
  block[3] = &unk_10015EA00;
  v12 = v9;
  v17 = v12;
  v20 = &v22;
  v13 = v8;
  v21 = &v28;
  v18 = v13;
  v19 = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (!*((_BYTE *)v29 + 24) || v23[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E3D18();
      if (!a5)
        goto LABEL_8;
      goto LABEL_7;
    }
    if (a5)
LABEL_7:
      *a5 = objc_retainAutorelease((id)v23[5]);
  }
LABEL_8:
  v14 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (void)reportActivityDidFinishRunning:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[_DASActivityDependencyManager shouldMonitorDependenciesForActivity:](self, "shouldMonitorDependenciesForActivity:", v4))
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100070468;
    v6[3] = &unk_10015D558;
    v6[4] = self;
    v7 = v4;
    dispatch_sync((dispatch_queue_t)queue, v6);

  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E3E18();
  }

}

- (BOOL)areDependenciesSatisfiedFor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  OS_dispatch_queue *queue;
  _QWORD block[4];
  id v13;
  _DASActivityDependencyManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dependencies"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dependencies")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    if (!objc_msgSend(v4, "dependenciesPreCleared"))
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000707D8;
      block[3] = &unk_10015D930;
      v13 = v4;
      v14 = self;
      v15 = &v16;
      dispatch_sync((dispatch_queue_t)queue, block);
      v9 = *((_BYTE *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000E3F70();
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E3F04();
  }
  v9 = 1;
LABEL_9:

  return v9;
}

- (BOOL)resetDependenciesForIdentifier:(id)a3 byActivity:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *log;
  OS_dispatch_queue *queue;
  id v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = a3;
  v8 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[_DASActivityDependencyManager resetDependenciesForIdentifier:byActivity:error:]";
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: %@ resetting result production: %@", buf, 0x20u);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100070C28;
  v13[3] = &unk_10015D558;
  v13[4] = self;
  v14 = v7;
  v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, v13);

  return 1;
}

- (BOOL)isDependentActivity:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dependencies"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)resetFastPassDependencies
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = objc_msgSend((id)objc_opt_class(_DASBGSystemTask), "allFastPassIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7);
        objc_msgSend((id)objc_opt_class(_DASActivityCompletionDependencyGroup), "resetDependenciesContainingSubstring:", v8);
        objc_msgSend((id)objc_opt_class(_DASActivityResultDependencyGroup), "resetDependenciesContainingSubstring:", v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)resetFastPassDependenciesForActivity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(_DASBGSystemTask), "allFastPassIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v3, "containsString:", v10))
        {
          objc_msgSend((id)objc_opt_class(_DASActivityCompletionDependencyGroup), "resetDependenciesContainingSubstring:", v10);
          objc_msgSend((id)objc_opt_class(_DASActivityResultDependencyGroup), "resetDependenciesContainingSubstring:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)queue_dependencyGroupCreateIfDoesNotExist:(id)a3
{
  id v4;
  NSMutableDictionary *dependencyGroups;
  void *v6;
  void *v7;
  __objc2_class *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dependencyGroups = self->_dependencyGroups;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](dependencyGroups, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    if (objc_msgSend(v4, "isActivityCompletionBased"))
      v8 = _DASActivityCompletionDependencyGroup;
    else
      v8 = _DASActivityResultDependencyGroup;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class groupFromPersistence:](v8, "groupFromPersistence:", v9));

    v10 = self->_dependencyGroups;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, v11);

  }
  return v7;
}

- (id)queue_checkedResultDependencyGroupForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_dependencyGroups, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityResultDependencyGroup groupFromPersistence:](_DASActivityResultDependencyGroup, "groupFromPersistence:", v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dependencyGroups, "setObject:forKeyedSubscript:", v5, v4);
  }
  v6 = objc_opt_class(_DASActivityResultDependencyGroup);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (id)queue_checkedCompletionDependencyGroupForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_dependencyGroups, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityCompletionDependencyGroup groupFromPersistence:](_DASActivityCompletionDependencyGroup, "groupFromPersistence:", v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dependencyGroups, "setObject:forKeyedSubscript:", v5, v4);
  }
  v6 = objc_opt_class(_DASActivityCompletionDependencyGroup);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (BOOL)shouldMonitorDependenciesForActivity:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dependencies"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "producedResultIdentifiers"));
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (NSMutableDictionary)dependencyGroups
{
  return self->_dependencyGroups;
}

- (void)setDependencyGroups:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyGroups, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dependencyGroups, 0);
}

- (id)queue_dependencyGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_dependencyGroups, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityResultDependencyGroup groupFromDefaultsWithoutCreation:](_DASActivityResultDependencyGroup, "groupFromDefaultsWithoutCreation:", v4));
    if (!v5)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityCompletionDependencyGroup groupFromPersistenceWithoutCreation:](_DASActivityCompletionDependencyGroup, "groupFromPersistenceWithoutCreation:", v4));
  }
  v6 = v5;

  return v6;
}

- (void)dastool_forceResetOfResultIdentifier:(id)a3
{
  id v4;
  NSObject *log;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[_DASActivityDependencyManager(Dastool) dastool_forceResetOfResultIdentifier:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: resetting result production/consumption on behalf of dastool: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100071398;
  v8[3] = &unk_10015D558;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, v8);

}

- (id)dastool_queryStatusOfResultIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10006F90C;
  v16 = sub_10006F91C;
  v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000714A0;
  block[3] = &unk_10015D930;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end
