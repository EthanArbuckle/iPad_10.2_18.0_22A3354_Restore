@implementation _DASSharedMemoryBudgetPersistence

+ (id)log
{
  if (qword_1001AB490 != -1)
    dispatch_once(&qword_1001AB490, &stru_10015D8B8);
  return (id)qword_1001AB498;
}

+ (void)initialize
{
  void *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](_DASSharedMemoryBudgetPersistence, "log"));
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.dasd.shmemQueue", v4);
  v6 = (void *)qword_1001AB488;
  qword_1001AB488 = (uint64_t)v5;

  v7 = qword_1001AB488;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D298;
  v9[3] = &unk_10015D8E0;
  v10 = v2;
  v11 = v12;
  v8 = v2;
  dispatch_sync(v7, v9);

  _Block_object_dispose(v12, 8);
}

- (_DASSharedMemoryBudgetPersistence)init
{
  _DASSharedMemoryBudgetPersistence *v2;
  uint64_t v3;
  NSMutableDictionary *budgetToIndex;
  _DASSharedMemoryBudgetPersistence *v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DASSharedMemoryBudgetPersistence;
  v2 = -[_DASSharedMemoryBudgetPersistence init](&v9, "init");
  if (!v2)
    goto LABEL_4;
  if (qword_1001AB4A0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    budgetToIndex = v2->_budgetToIndex;
    v2->_budgetToIndex = (NSMutableDictionary *)v3;

LABEL_4:
    v5 = v2;
    goto LABEL_8;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](_DASSharedMemoryBudgetPersistence, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to obtain Shared Memory! Return nil as we won't be able to persist anything.", v8, 2u);
  }

  v5 = 0;
LABEL_8:

  return v5;
}

+ (id)persistence
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10002D5A8;
  v9 = sub_10002D5B8;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D5C0;
  v4[3] = &unk_10015D908;
  v4[4] = &v5;
  v4[5] = a1;
  if (qword_1001AB4A8 != -1)
    dispatch_once(&qword_1001AB4A8, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)updateBudget:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](_DASSharedMemoryBudgetPersistence, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating budget: %@", buf, 0xCu);
  }

  v6 = qword_1001AB488;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002D704;
  v8[3] = &unk_10015D558;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)saveBudgets:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  _DASSharedMemoryBudgetPersistence *v9;

  v4 = a3;
  v5 = qword_1001AB488;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D894;
  block[3] = &unk_10015D558;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)validatedStringFromStoredValue:(char *)a3 withAllowedNames:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9));
        if (!strncmp(a3, (const char *)objc_msgSend(v10, "UTF8String", (_QWORD)v13), (size_t)objc_msgSend(v10, "length") + 1))
        {
          v11 = v10;
          goto LABEL_11;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)loadBudgetsWithExpectedNames:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = sub_10002D5A8;
  v16 = sub_10002D5B8;
  v17 = &__NSArray0__struct;
  v5 = qword_1001AB488;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DDE0;
  block[3] = &unk_10015D930;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)saveModulationDate:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = qword_1001AB488;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E19C;
  block[3] = &unk_10015D4E0;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

- (id)lastModulationDate
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E3D8;
  block[3] = &unk_10015D610;
  block[4] = &v6;
  dispatch_sync((dispatch_queue_t)qword_1001AB488, block);
  v2 = 0;
  if (v7[3] >= 0.0001)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v3 = objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](_DASSharedMemoryBudgetPersistence, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loaded modulation date: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v6, 8);
  return v2;
}

- (NSMutableDictionary)budgetToIndex
{
  return self->_budgetToIndex;
}

- (void)setBudgetToIndex:(id)a3
{
  objc_storeStrong((id *)&self->_budgetToIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetToIndex, 0);
}

@end
