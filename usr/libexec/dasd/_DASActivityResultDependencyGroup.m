@implementation _DASActivityResultDependencyGroup

+ (id)groupFromPersistence:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("DependencyGroupPersistence")));
  v7 = BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ActivityScheduler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "Dependency"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "Result"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publisher"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10009BA80;
  v28[3] = &unk_10015F768;
  v13 = v4;
  v29 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filterWithIsIncluded:", v28));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10009BAD8;
  v26[3] = &unk_10015F3E8;
  v27 = v6;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10009BB30;
  v22[3] = &unk_10015F790;
  v23 = v27;
  v15 = v5;
  v24 = v15;
  v25 = v13;
  v16 = v13;
  v17 = v27;
  v18 = objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v26, v22);

  v19 = v25;
  v20 = v15;

  return v20;
}

- (_DASActivityResultDependencyGroup)initWithIdentifier:(id)a3
{
  id v5;
  _DASActivityResultDependencyGroup *v6;
  _DASActivityResultDependencyGroup *v7;
  _DASActivityResult *v8;
  _DASActivityResult *cumulativelyProducedResult;
  uint64_t v10;
  NSMutableDictionary *cumulativeResultConsumption;
  uint64_t v12;
  NSMutableSet *consumers;
  _DASActivity *producer;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BMStream *resultStream;
  id v21;
  const char *v22;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  os_log_t v27;
  OS_os_log *log;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_DASActivityResultDependencyGroup;
  v6 = -[_DASActivityResultDependencyGroup init](&v30, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultIdentifier, a3);
    v8 = (_DASActivityResult *)objc_msgSend(objc_alloc((Class)_DASActivityResult), "initWithIdentifier:", v5);
    cumulativelyProducedResult = v7->_cumulativelyProducedResult;
    v7->_cumulativelyProducedResult = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cumulativeResultConsumption = v7->_cumulativeResultConsumption;
    v7->_cumulativeResultConsumption = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    consumers = v7->_consumers;
    v7->_consumers = (NSMutableSet *)v12;

    producer = v7->_producer;
    v7->_producer = 0;

    v15 = BiomeLibrary();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ActivityScheduler"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "Dependency"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "Result"));
    resultStream = v7->_resultStream;
    v7->_resultStream = (BMStream *)v19;

    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasd.DependencyGroup.%@"), v7->_resultIdentifier)));
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_create(v22, v24);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v25;

    v27 = os_log_create("com.apple.duetactivityscheduler", "ResultDependencyGroup");
    log = v7->_log;
    v7->_log = (OS_os_log *)v27;

  }
  return v7;
}

- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3
{
  BMStream *resultStream;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  resultStream = self->_resultStream;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream configuration](resultStream, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeConfig"));
  v7 = objc_msgSend(v6, "protectionClass");

  v8 = objc_msgSend(v4, "asBiomeProtectionClass");
  return v8 <= v7;
}

- (void)handleActivitySubmission:(id)a3
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
  block[2] = sub_10009BF1C;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (BOOL)registerProducer:(id)a3 error:(id *)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10009C08C;
  v19 = sub_10009C09C;
  v20 = 0;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009C0A4;
  v11[3] = &unk_10015F7B8;
  v11[4] = self;
  v13 = &v21;
  v14 = &v15;
  v8 = v6;
  v12 = v8;
  dispatch_sync((dispatch_queue_t)queue, v11);
  if (!*((_BYTE *)v22 + 24) || v16[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E88F8();
      if (!a4)
        goto LABEL_6;
      goto LABEL_5;
    }
    if (a4)
LABEL_5:
      *a4 = objc_retainAutorelease((id)v16[5]);
  }
LABEL_6:
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (void)deregisterDependent:(id)a3
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
  block[2] = sub_10009C308;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (BOOL)deregisterProducer:(id)a3 error:(id *)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10009C08C;
  v19 = sub_10009C09C;
  v20 = 0;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009C478;
  v11[3] = &unk_10015F7E0;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v21;
  v14 = &v15;
  dispatch_sync((dispatch_queue_t)queue, v11);
  if (!*((_BYTE *)v22 + 24) || v16[5])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E8964();
      if (!a4)
        goto LABEL_6;
      goto LABEL_5;
    }
    if (a4)
LABEL_5:
      *a4 = objc_retainAutorelease((id)v16[5]);
  }
LABEL_6:
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (BOOL)isDependencySatisfiedForActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dependencyForIdentifier:", self->_resultIdentifier));
  if (v5)
  {
    v6 = objc_msgSend(v5, "isSatisfiedByAvailableResultCount:", -[_DASActivityResultDependencyGroup computeNumberOfAvailableResultsForActivity:](self, "computeNumberOfAvailableResultsForActivity:", v4));
    -[_DASActivityResultDependencyGroup updateDependenciesPreClearedOnActivity:withValue:](self, "updateDependenciesPreClearedOnActivity:withValue:", v4, v6);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

- (BOOL)reportActivity:(id)a3 consumedResult:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  char v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10009C08C;
  v24 = sub_10009C09C;
  v25 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009C800;
  block[3] = &unk_10015F808;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v18 = &v20;
  v19 = &v26;
  v12 = v9;
  v17 = v12;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (!*((_BYTE *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E89D0();
      if (!a5)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (a5)
LABEL_4:
      *a5 = objc_retainAutorelease((id)v21[5]);
  }
LABEL_5:
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)reportActivity:(id)a3 producedResult:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  char v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10009C08C;
  v24 = sub_10009C09C;
  v25 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009CC50;
  block[3] = &unk_10015F830;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v18 = &v20;
  v12 = v9;
  v17 = v12;
  v19 = &v26;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (!*((_BYTE *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000E8A44();
      if (!a5)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (a5)
LABEL_4:
      *a5 = objc_retainAutorelease((id)v21[5]);
  }
LABEL_5:
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

+ (void)resetDependenciesContainingSubstring:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ActivityScheduler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "Dependency"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "Result"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pruner"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009CF4C;
  v11[3] = &unk_10015F858;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v8, "deleteEventsPassingTest:", v11);

}

- (void)persistUpdatedResultProductionBy:(id)a3
{
  BMStream *resultStream;
  id v5;
  void *v6;
  id v7;
  NSString *resultIdentifier;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];

  resultStream = self->_resultStream;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream pruner](resultStream, "pruner"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009D108;
  v13[3] = &unk_10015F858;
  v13[4] = self;
  objc_msgSend(v6, "deleteEventsPassingTest:", v13);

  v7 = objc_alloc((Class)BMActivitySchedulerDependencyResult);
  resultIdentifier = self->_resultIdentifier;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[_DASActivityResult count](self->_cumulativelyProducedResult, "count")));
  v11 = objc_msgSend(v7, "initWithResultIdentifier:activityIdentifier:resultCount:type:", resultIdentifier, v9, v10, 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_resultStream, "source"));
  objc_msgSend(v12, "sendEvent:", v11);

}

- (void)persistUpdatedResultConsumptionBy:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSString *resultIdentifier;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[_DASActivityResultDependencyGroup pruneConsumptionEventsForActivityIdentifier:](self, "pruneConsumptionEventsForActivityIdentifier:", v8);

  v9 = objc_alloc((Class)BMActivitySchedulerDependencyResult);
  resultIdentifier = self->_resultIdentifier;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

  v12 = objc_msgSend(v6, "count");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
  v15 = objc_msgSend(v9, "initWithResultIdentifier:activityIdentifier:resultCount:type:", resultIdentifier, v11, v13, 2);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_resultStream, "source"));
  objc_msgSend(v14, "sendEvent:", v15);

}

- (void)pruneConsumptionEventsForActivityIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _DASActivityResultDependencyGroup *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream pruner](self->_resultStream, "pruner"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D338;
  v7[3] = &unk_10015F880;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "deleteEventsPassingTest:", v7);

}

- (BOOL)queue_isConsumerActivity:(id)a3
{
  return -[NSMutableSet containsObject:](self->_consumers, "containsObject:", a3);
}

- (BOOL)queue_isProducerActivity:(id)a3
{
  _DASActivity *producer;
  id v4;
  void *v5;
  void *v6;

  producer = self->_producer;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity name](producer, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)queue_aggregateResultConsumptionForActivity:(id)a3
{
  id v4;
  NSMutableDictionary *cumulativeResultConsumption;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  cumulativeResultConsumption = self->_cumulativeResultConsumption;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cumulativeResultConsumption, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)_DASActivityResult), "initWithIdentifier:", self->_resultIdentifier);
    v8 = self->_cumulativeResultConsumption;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (int64_t)computeNumberOfAvailableResultsForActivity:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D5D0;
  block[3] = &unk_10015D930;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)updateDependenciesPreClearedOnActivity:(id)a3 withValue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(v6, "dependenciesPreCleared") & 1) == 0 && v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = log;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityResultDependencyGroup description](self, "description"));
      v10 = 136315650;
      v11 = "-[_DASActivityResultDependencyGroup updateDependenciesPreClearedOnActivity:withValue:]";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ dependency has been satisfied on %@, marking as pre-cleared", (uint8_t *)&v10, 0x20u);

    }
  }
  objc_msgSend(v6, "setDependenciesPreCleared:", objc_msgSend(v6, "dependenciesPreCleared") | v4);

}

- (void)resetAccumulation
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D798;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)dictionary
{
  void *v3;
  void *v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _DASActivityResult *cumulativelyProducedResult;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  _DASActivityResultDependencyGroup *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  queue = self->_queue;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10009DA9C;
  v17 = &unk_10015D530;
  v18 = self;
  v6 = v3;
  v19 = v6;
  v7 = v4;
  v20 = v7;
  dispatch_sync((dispatch_queue_t)queue, &v14);
  cumulativelyProducedResult = self->_cumulativelyProducedResult;
  v22[0] = self->_resultIdentifier;
  v21[0] = CFSTR("resultIdentifier");
  v21[1] = CFSTR("producedResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[_DASActivityResult count](cumulativelyProducedResult, "count", v14, v15, v16, v17, v18)));
  v22[1] = v9;
  v22[2] = v6;
  v21[2] = CFSTR("consumedResults");
  v21[3] = CFSTR("registeredConsumers");
  v22[3] = v7;
  v21[4] = CFSTR("registeredProducer");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity name](self->_producer, "name"));
  v11 = v10;
  if (!v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 5));
  if (!v10)

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithIdentifier:", self->_resultIdentifier);
  v6 = -[_DASActivityResult copyWithZone:](self->_cumulativelyProducedResult, "copyWithZone:", a3);
  objc_msgSend(v5, "setCumulativelyProducedResult:", v6);

  v7 = -[NSMutableDictionary copyWithZone:](self->_cumulativeResultConsumption, "copyWithZone:", a3);
  objc_msgSend(v5, "setCumulativeResultConsumption:", v7);

  v8 = -[NSMutableSet copyWithZone:](self->_consumers, "copyWithZone:", a3);
  objc_msgSend(v5, "setConsumers:", v8);

  v9 = -[_DASActivity copyWithZone:](self->_producer, "copyWithZone:", a3);
  objc_msgSend(v5, "setProducer:", v9);

  return v5;
}

- (NSString)description
{
  NSMutableString *v3;
  void *v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  _DASActivityResultDependencyGroup *v11;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p> Identifier: %@, "), objc_opt_class(self), self, self->_resultIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DE18;
  block[3] = &unk_10015D558;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  NSMutableString *v3;
  void *v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  _DASActivityResultDependencyGroup *v11;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p> Identifier: %@, "), objc_opt_class(self), self, self->_resultIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DF2C;
  block[3] = &unk_10015D558;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (_DASActivityResult)cumulativelyProducedResult
{
  return (_DASActivityResult *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCumulativelyProducedResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)cumulativeResultConsumption
{
  return self->_cumulativeResultConsumption;
}

- (void)setCumulativeResultConsumption:(id)a3
{
  objc_storeStrong((id *)&self->_cumulativeResultConsumption, a3);
}

- (NSMutableSet)consumers
{
  return self->_consumers;
}

- (void)setConsumers:(id)a3
{
  objc_storeStrong((id *)&self->_consumers, a3);
}

- (_DASActivity)producer
{
  return self->_producer;
}

- (void)setProducer:(id)a3
{
  objc_storeStrong((id *)&self->_producer, a3);
}

- (BMStream)resultStream
{
  return self->_resultStream;
}

- (void)setResultStream:(id)a3
{
  objc_storeStrong((id *)&self->_resultStream, a3);
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
  objc_storeStrong((id *)&self->_resultStream, 0);
  objc_storeStrong((id *)&self->_producer, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_cumulativeResultConsumption, 0);
  objc_storeStrong((id *)&self->_cumulativelyProducedResult, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

+ (id)groupFromDefaultsWithoutCreation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("DependencyGroupPersistence")));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v6 = BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ActivityScheduler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "Dependency"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "Result"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisher"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10009E2B8;
  v22[3] = &unk_10015F768;
  v12 = v4;
  v23 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterWithIsIncluded:", v22));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009E310;
  v20[3] = &unk_10015F3E8;
  v14 = v5;
  v21 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10009E368;
  v19[3] = &unk_10015F8A8;
  v19[4] = &v24;
  v15 = objc_msgSend(v13, "sinkWithCompletion:shouldContinue:", v20, v19);

  if (*((_BYTE *)v25 + 24))
  {
    v16 = objc_msgSend((id)objc_opt_class(a1), "groupFromPersistence:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v17;
}

@end
