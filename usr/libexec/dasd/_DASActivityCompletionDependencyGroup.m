@implementation _DASActivityCompletionDependencyGroup

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
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithTrackedActivityIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("DependencyGroupPersistence")));
  v7 = BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ActivityScheduler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "Dependency"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "Completion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publisher"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000A2E1C;
  v26[3] = &unk_10015F768;
  v27 = v4;
  v13 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filterWithIsIncluded:", v26));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A2E74;
  v24[3] = &unk_10015F3E8;
  v25 = v6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A2ECC;
  v21[3] = &unk_10015F970;
  v22 = v25;
  v15 = v5;
  v23 = v15;
  v16 = v25;
  v17 = objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v24, v21);

  v18 = v23;
  v19 = v15;

  return v19;
}

- (_DASActivityCompletionDependencyGroup)initWithTrackedActivityIdentifier:(id)a3
{
  id v5;
  _DASActivityCompletionDependencyGroup *v6;
  _DASActivityCompletionDependencyGroup *v7;
  uint64_t v8;
  NSMutableSet *dependents;
  uint64_t v10;
  NSMutableSet *haveRunActivities;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BMStream *completionStream;
  id v18;
  const char *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  os_log_t v24;
  OS_os_log *log;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_DASActivityCompletionDependencyGroup;
  v6 = -[_DASActivityCompletionDependencyGroup init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trackedActivityIdentifier, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    dependents = v7->_dependents;
    v7->_dependents = (NSMutableSet *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    haveRunActivities = v7->_haveRunActivities;
    v7->_haveRunActivities = (NSMutableSet *)v10;

    v7->_hasDependencyRun = 0;
    v12 = BiomeLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ActivityScheduler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "Dependency"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "Completion"));
    completionStream = v7->_completionStream;
    v7->_completionStream = (BMStream *)v16;

    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasd.CompletionDependencyGroup.%@"), v5)));
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_create(v19, v21);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v22;

    v24 = os_log_create("com.apple.duetactivityscheduler", "CompletionDependencyGroup");
    log = v7->_log;
    v7->_log = (OS_os_log *)v24;

  }
  return v7;
}

- (BOOL)isPersistenceAvailableWithFileProtection:(id)a3
{
  BMStream *completionStream;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  completionStream = self->_completionStream;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream configuration](completionStream, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeConfig"));
  v7 = objc_msgSend(v6, "protectionClass");

  v8 = objc_msgSend(v4, "asBiomeProtectionClass");
  return v8 <= v7;
}

- (void)handleActivitySubmission:(id)a3
{
  id v4;
  NSObject *log;
  NSString *trackedActivityIdentifier;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  NSString *v16;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    trackedActivityIdentifier = self->_trackedActivityIdentifier;
    *(_DWORD *)buf = 136315650;
    v12 = "-[_DASActivityCompletionDependencyGroup handleActivitySubmission:]";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = trackedActivityIdentifier;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Adding %@ to tracked dependents for %@", buf, 0x20u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A32B8;
  v9[3] = &unk_10015D558;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);

}

- (void)deregisterDependent:(id)a3
{
  id v4;
  NSObject *log;
  NSString *trackedActivityIdentifier;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  NSString *v16;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    trackedActivityIdentifier = self->_trackedActivityIdentifier;
    *(_DWORD *)buf = 136315650;
    v12 = "-[_DASActivityCompletionDependencyGroup deregisterDependent:]";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = trackedActivityIdentifier;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: Removing %@ from tracked dependents for %@", buf, 0x20u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A33E0;
  v9[3] = &unk_10015D558;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);

}

- (void)reportTrackedActivityDidRun:(id)a3
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
  block[2] = sub_1000A3468;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)reportDependentActivityDidRun:(id)a3
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
  block[2] = sub_1000A351C;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (BOOL)isDependencySatisfiedForActivity:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  BOOL hasDependencyRun;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3638;
  block[3] = &unk_10015DB40;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
  hasDependencyRun = 0;
  if (!*((_BYTE *)v13 + 24))
    hasDependencyRun = self->_hasDependencyRun;

  _Block_object_dispose(&v12, 8);
  return hasDependencyRun;
}

- (void)resetAccumulation
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A36E4;
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
  NSString *trackedActivityIdentifier;
  void *v9;
  void *v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  _DASActivityCompletionDependencyGroup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  _QWORD v20[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  queue = self->_queue;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000A38A0;
  v15 = &unk_10015D530;
  v16 = self;
  v17 = v3;
  v18 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_sync((dispatch_queue_t)queue, &v12);
  trackedActivityIdentifier = self->_trackedActivityIdentifier;
  v19[0] = CFSTR("trackedActivityIdentifier");
  v19[1] = CFSTR("dependents");
  v20[0] = trackedActivityIdentifier;
  v20[1] = v7;
  v20[2] = v6;
  v19[2] = CFSTR("haveRunIdentifiers");
  v19[3] = CFSTR("hasDependencyRun");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasDependencyRun, v12, v13, v14, v15, v16));
  v20[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));

  return v10;
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
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "Completion"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pruner"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A3B1C;
  v11[3] = &unk_10015F858;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v8, "deleteEventsPassingTest:", v11);

}

- (void)updateStreamForTrackedActivityDidRun:(id)a3
{
  id v4;

  v4 = a3;
  -[_DASActivityCompletionDependencyGroup pruneStreamOfGroup](self, "pruneStreamOfGroup");
  -[_DASActivityCompletionDependencyGroup persistTrackedActivityDidRun:](self, "persistTrackedActivityDidRun:", v4);

}

- (void)pruneStreamOfGroup
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream pruner](self->_completionStream, "pruner"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A3C70;
  v4[3] = &unk_10015F858;
  v4[4] = self;
  objc_msgSend(v3, "deleteEventsPassingTest:", v4);

}

- (void)persistTrackedActivityDidRun:(id)a3
{
  void *v4;
  id v5;

  v5 = objc_msgSend(objc_alloc((Class)BMActivitySchedulerDependencyCompletion), "initWithIdentifier:consumerIdentifier:type:", self->_trackedActivityIdentifier, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_completionStream, "source"));
  objc_msgSend(v4, "sendEvent:", v5);

}

- (void)persistActivityDidConsume:(id)a3
{
  id v4;
  id v5;
  NSString *trackedActivityIdentifier;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_alloc((Class)BMActivitySchedulerDependencyCompletion);
  trackedActivityIdentifier = self->_trackedActivityIdentifier;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v9 = objc_msgSend(v5, "initWithIdentifier:consumerIdentifier:type:", trackedActivityIdentifier, v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_completionStream, "source"));
  objc_msgSend(v8, "sendEvent:", v9);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithTrackedActivityIdentifier:", self->_trackedActivityIdentifier);
  v6 = -[NSMutableSet copyWithZone:](self->_dependents, "copyWithZone:", a3);
  objc_msgSend(v5, "setDependents:", v6);

  v7 = -[NSMutableSet copyWithZone:](self->_haveRunActivities, "copyWithZone:", a3);
  objc_msgSend(v5, "setHaveRunActivities:", v7);

  objc_msgSend(v5, "setHasDependencyRun:", self->_hasDependencyRun);
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
  _DASActivityCompletionDependencyGroup *v11;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p> Identifier: %@, "), objc_opt_class(self), self, self->_trackedActivityIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3F20;
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
  _DASActivityCompletionDependencyGroup *v11;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p> Identifier: %@, "), objc_opt_class(self), self, self->_trackedActivityIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A404C;
  block[3] = &unk_10015D558;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)trackedActivityIdentifier
{
  return self->_trackedActivityIdentifier;
}

- (NSMutableSet)dependents
{
  return self->_dependents;
}

- (void)setDependents:(id)a3
{
  objc_storeStrong((id *)&self->_dependents, a3);
}

- (NSMutableSet)haveRunActivities
{
  return self->_haveRunActivities;
}

- (void)setHaveRunActivities:(id)a3
{
  objc_storeStrong((id *)&self->_haveRunActivities, a3);
}

- (BOOL)hasDependencyRun
{
  return self->_hasDependencyRun;
}

- (void)setHasDependencyRun:(BOOL)a3
{
  self->_hasDependencyRun = a3;
}

- (BMStream)completionStream
{
  return self->_completionStream;
}

- (void)setCompletionStream:(id)a3
{
  objc_storeStrong((id *)&self->_completionStream, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_completionStream, 0);
  objc_storeStrong((id *)&self->_haveRunActivities, 0);
  objc_storeStrong((id *)&self->_dependents, 0);
  objc_storeStrong((id *)&self->_trackedActivityIdentifier, 0);
}

+ (id)groupFromPersistenceWithoutCreation:(id)a3
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
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "Completion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisher"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A43A8;
  v22[3] = &unk_10015F768;
  v12 = v4;
  v23 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterWithIsIncluded:", v22));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000A4400;
  v20[3] = &unk_10015F3E8;
  v14 = v5;
  v21 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A4458;
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
