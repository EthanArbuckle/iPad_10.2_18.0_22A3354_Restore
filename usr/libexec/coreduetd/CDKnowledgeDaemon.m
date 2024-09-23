@implementation CDKnowledgeDaemon

- (void)handleError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4
    && +[_CDErrorUtilities isCoreDataFatalError:](_CDErrorUtilities, "isCoreDataFatalError:", v4))
  {
    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.deletedDB.knowledgebase.corrupted"));
    v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100023008();

    -[_DKKnowledgeStorage deleteStorage](self->_storage, "deleteStorage");
  }

}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  v5 = a5;
  v7 = a4;
  v12 = v7;
  if (v5)
  {
    objc_msgSend(v7, "invoke");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "exportedObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processName"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10003BB80, "objectForKeyedSubscript:", v9));
    v11 = objc_msgSend(v10, "unsignedIntValue");

    if (v11 > 0x32)
      objc_msgSend(v12, "invoke");
    else
      ((void (*)(id))*(&off_100039138 + v11))(v12);

  }
}

- (void)executeQuery:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  _DKKnowledgeStorage *storage;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v7[2](v7, 0, v8);

  }
  else
  {
    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.knowledgeStore.executeQueryCount"));
    storage = self->_storage;
    v13 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeStorage executeQuery:error:](storage, "executeQuery:error:", v6, &v13));
    v11 = v13;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v11));
    ((void (**)(id, void *, void *))v7)[2](v7, v10, v12);

    -[CDKnowledgeDaemon handleError:](self, "handleError:", v11);
  }

}

- (BOOL)isClassCLocked
{
  return -[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtection, "isDataAvailableFor:", NSFileProtectionCompleteUntilFirstUserAuthentication) ^ 1;
}

+ (id)defaultDaemon
{
  if (qword_100040ED8 != -1)
    dispatch_once(&qword_100040ED8, &stru_100038FA8);
  return (id)qword_100040ED0;
}

+ (id)defaultUserDaemon
{
  if (qword_100040EF0 != -1)
    dispatch_once(&qword_100040EF0, &stru_100038FC8);
  return (id)qword_100040EE8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CDKnowledgeDaemonConnection *v10;
  char *v11;
  char *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unsigned int v18;
  void *v20;
  audit_token_t audittoken;
  uint8_t buf[4];
  unsigned int v23;
  char buffer[4096];

  v5 = a4;
  v6 = _DKDaemonInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "setExportedInterface:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.coreduetd.allow")));
  v9 = v8;
  if (v8 && objc_msgSend(v8, "BOOLValue"))
  {
    v10 = objc_alloc_init(CDKnowledgeDaemonConnection);
    -[CDKnowledgeDaemonConnection setDaemon:](v10, "setDaemon:", self);
    memset(&audittoken, 0, sizeof(audittoken));
    if (v5)
      objc_msgSend(v5, "auditToken");
    if (proc_pidpath_audittoken(&audittoken, buffer, 0x1000u) < 1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("application-identifier")));
      if (!v13)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.application-identifier")));
        -[CDKnowledgeDaemonConnection setProcessName:](v10, "setProcessName:", v20);

        goto LABEL_15;
      }
    }
    else
    {
      v11 = strrchr(buffer, 47);
      if (v11)
        v12 = v11 + 1;
      else
        v12 = buffer;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
    }
    -[CDKnowledgeDaemonConnection setProcessName:](v10, "setProcessName:", v13);
LABEL_15:

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection processName](v10, "processName"));
    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pid:%d"), objc_msgSend(v5, "processIdentifier")));
      -[CDKnowledgeDaemonConnection setProcessName:](v10, "setProcessName:", v16);

    }
    -[CDKnowledgeDaemonConnection setAuthorizedEventStreamsToRead:](v10, "setAuthorizedEventStreamsToRead:", 0);
    objc_msgSend(v5, "setExportedObject:", v10);
    objc_msgSend(v5, "setDelegate:", self);
    v17 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v5, "processIdentifier");
      *(_DWORD *)buf = 67109120;
      v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Connection from PID %d accepted", buf, 8u);
    }

    objc_msgSend(v5, "resume");
    v14 = 1;
    goto LABEL_20;
  }
  v10 = (CDKnowledgeDaemonConnection *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    sub_10002255C(v5, &v10->super);
  v14 = 0;
LABEL_20:

  return v14;
}

- (CDKnowledgeDaemon)init
{
  return -[CDKnowledgeDaemon initWithMachServiceName:](self, "initWithMachServiceName:", _DKMachServiceName);
}

- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3
{
  id v4;
  void *v5;
  CDKnowledgeDaemon *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths knowledgeDatabaseDirectory](CDDPaths, "knowledgeDatabaseDirectory"));
  v6 = -[CDKnowledgeDaemon initWithMachServiceName:storePath:](self, "initWithMachServiceName:storePath:", v4, v5);

  return v6;
}

- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3 storePath:(id)a4
{
  id v6;
  id v7;
  CDKnowledgeDaemon *v8;
  uint64_t v9;
  _DKKnowledgeStorage *storage;
  _DKDataProtectionStateMonitor *v11;
  _DKDataProtectionStateMonitor *dataProtection;
  uint64_t v13;
  _DKRateLimitPolicyEnforcer *rateLimitEnforcer;
  uint64_t v15;
  _DKPrivacyPolicyEnforcer *privacyEnforcer;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  NSDate *bookmark;
  xpc_object_t v31;
  void *v32;
  uint64_t i;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  id location;
  objc_super v42;
  xpc_object_t values[8];
  os_activity_scope_state_s state;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;

  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)CDKnowledgeDaemon;
  v8 = -[CDKnowledgeDaemon initWithMachServiceName:](&v42, "initWithMachServiceName:", v6);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStorage storageWithDirectory:readOnly:](_DKKnowledgeStorage, "storageWithDirectory:readOnly:", v7, 0));
    storage = v8->_storage;
    v8->_storage = (_DKKnowledgeStorage *)v9;

    v11 = (_DKDataProtectionStateMonitor *)objc_alloc_init((Class)_DKDataProtectionStateMonitor);
    dataProtection = v8->_dataProtection;
    v8->_dataProtection = v11;

    -[CDKnowledgeDaemon setDelegate:](v8, "setDelegate:", v8);
    v13 = objc_claimAutoreleasedReturnValue(+[_DKRateLimitPolicyEnforcer rateLimitPolicyEnforcer](_DKRateLimitPolicyEnforcer, "rateLimitPolicyEnforcer"));
    rateLimitEnforcer = v8->_rateLimitEnforcer;
    v8->_rateLimitEnforcer = (_DKRateLimitPolicyEnforcer *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[_DKPrivacyPolicyEnforcer privacyPolicyEnforcer](_DKPrivacyPolicyEnforcer, "privacyPolicyEnforcer"));
    privacyEnforcer = v8->_privacyEnforcer;
    v8->_privacyEnforcer = (_DKPrivacyPolicyEnforcer *)v15;

    v17 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.startSanitizingKnowledgeStore", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v17, &state);
    os_activity_scope_leave(&state);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[_CDSiriLearningSettings sharedInstance](_CDSiriLearningSettings, "sharedInstance"));
    objc_msgSend(v18, "startSanitizingKnowledgeStore:", v8->_storage);

    objc_initWeak(&location, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", XPC_ACTIVITY_INTERVAL_1_DAY));
    objc_msgSend(v19, "doubleValue");
    v21 = v20;
    v35 = _NSConcreteStackBlock;
    v36 = 3221225472;
    v37 = sub_10001AAAC;
    v38 = &unk_100038FF0;
    v39 = 0;
    objc_copyWeak(&v40, &location);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicSchedulerJob jobWithInterval:schedulerJobName:handler:](_CDPeriodicSchedulerJob, "jobWithInterval:schedulerJobName:handler:", v6, &v35, v21));

    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v45 = XPC_ACTIVITY_PRIORITY;
    v46 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v47 = XPC_ACTIVITY_POWER_NAP;
    v48 = XPC_ACTIVITY_ALLOW_BATTERY;
    v49 = XPC_ACTIVITY_MEMORY_INTENSIVE;
    v50 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    v23 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v24 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v25 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    v26 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    v27 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    v28 = &_xpc_BOOL_true;
    values[7] = &_xpc_BOOL_true;
    v29 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast", v35, v36, v37, v38));
    bookmark = v8->_bookmark;
    v8->_bookmark = (NSDate *)v29;

    v31 = xpc_dictionary_create((const char *const *)&state, values, 8uLL);
    objc_msgSend(v22, "setExecutionCriteria:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance"));
    objc_msgSend(v32, "registerJob:", v22);

    -[CDKnowledgeDaemon resume](v8, "resume");
    for (i = 7; i != -1; --i)

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)classCError
{
  void *v2;
  void *v3;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("device is not class C unlocked");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet"), 0, v2));

  return v3;
}

- (void)saveObjects:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _DKKnowledgeStorage *storage;
  id v14;
  id v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v7[2](v7, 0, v8);

  }
  else
  {
    v9 = objc_autoreleasePoolPush();
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DKRateLimitPolicyEnforcer filterObjectsByEnforcingRateLimit:](self->_rateLimitEnforcer, "filterObjectsByEnforcingRateLimit:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DKPrivacyPolicyEnforcer enforcePrivacy:](self->_privacyEnforcer, "enforcePrivacy:", v10));
    v12 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_10002306C(v11);

    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", objc_msgSend(v11, "count"), CFSTR("com.apple.coreduet.knowledgeStore.saveObjectsCount"));
    storage = self->_storage;
    v17 = 0;
    v14 = -[_DKKnowledgeStorage saveObjects:error:](storage, "saveObjects:error:", v11, &v17);
    v15 = v17;
    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v15));
      ((void (**)(id, id, void *))v7)[2](v7, v14, v16);

    }
    -[CDKnowledgeDaemon handleError:](self, "handleError:", v15);

    objc_autoreleasePoolPop(v9);
  }

}

- (void)deleteObjects:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  _DKKnowledgeStorage *storage;
  id v12;
  id v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v7[2](v7, 0, v8);

  }
  else
  {
    -[_DKRateLimitPolicyEnforcer creditForDeletion:](self->_rateLimitEnforcer, "creditForDeletion:", v6);
    v9 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000230D8(v6);

    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", objc_msgSend(v6, "count"), CFSTR("com.apple.coreduet.knowledgeStore.deleteObjectsCount"));
    v10 = objc_autoreleasePoolPush();
    storage = self->_storage;
    v15 = 0;
    v12 = -[_DKKnowledgeStorage deleteObjects:error:](storage, "deleteObjects:error:", v6, &v15);
    v13 = v15;
    if (v7)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v13));
      ((void (**)(id, id, void *))v7)[2](v7, v12, v14);

    }
    -[CDKnowledgeDaemon handleError:](self, "handleError:", v13);

    objc_autoreleasePoolPop(v10);
  }

}

- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", a3));
  -[CDKnowledgeDaemon deleteAllEventsMatchingPredicate:reply:](self, "deleteAllEventsMatchingPredicate:reply:", v7, v6);

}

- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  unsigned int v9;
  id v10;
  _DKKnowledgeStorage *storage;
  id v12;
  NSObject *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (!-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    if (v6)
    {
      v15 = 0;
      v9 = +[_DKPredicateValidator validatePredicate:allowedKeys:error:](_DKPredicateValidator, "validatePredicate:allowedKeys:error:", v6, 0, &v15);
      v10 = v15;
      if (!v9)
      {
        v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          sub_100023144();

        v7[2](v7, 0, v10);
        goto LABEL_10;
      }
      objc_msgSend(v6, "allowEvaluation");

    }
    storage = self->_storage;
    v14 = 0;
    v12 = -[_DKKnowledgeStorage deleteAllEventsMatchingPredicate:error:](storage, "deleteAllEventsMatchingPredicate:error:", v6, &v14);
    v10 = v14;
    ((void (**)(id, id, id))v7)[2](v7, v12, v10);
LABEL_10:

    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
  v7[2](v7, 0, v8);

LABEL_11:
}

- (void)maintainPrivacyWithActivity:(id)a3
{
  _xpc_activity_s *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  id v21;
  CDKnowledgeDaemon *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  CDKnowledgeDaemon *v38;
  void *v39;
  void *v40;
  void *v41;
  _xpc_activity_s *activity;
  CDKnowledgeDaemon *v43;
  id obj;
  id v45;
  uint64_t v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[8];
  _BYTE v57[128];
  _BYTE v58[128];

  v4 = (_xpc_activity_s *)a3;
  v5 = (void *)os_transaction_create("CDKnowledgeDaemon.m:602");
  v6 = objc_autoreleasePoolPush();
  v43 = self;
  +[_DKStandingQueryExecutor executeAllStandingQueriesWithStorage:activity:](_DKStandingQueryExecutor, "executeAllStandingQueriesWithStorage:activity:", self->_storage, v4);
  objc_autoreleasePoolPop(v6);
  if (!v4 || !xpc_activity_should_defer(v4))
  {
    v40 = v5;
    activity = v4;
    v45 = objc_alloc_init((Class)NSMutableArray);
    v8 = objc_alloc_init((Class)NSMutableArray);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0));
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v9)
    {
      v10 = v9;
      v46 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v46)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          v13 = objc_autoreleasePoolPush();
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
          if (v14)
            objc_msgSend(v45, "addObject:", v14);
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationExtensionRecords", v40));
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v49 != v18)
                  objc_enumerationMutation(v15);
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j), "effectiveBundleIdentifier"));
                if (v20)
                  objc_msgSend(v8, "addObject:", v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v17);
          }

          objc_autoreleasePoolPop(v13);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v10);
    }

    v7 = v45;
    v21 = v8;
    v4 = activity;
    if (activity)
    {
      v22 = v43;
      if (xpc_activity_should_defer(activity))
      {
        v23 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
        v5 = v40;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = "Privacy maintenance deferred after installedApps query.";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      v26 = objc_autoreleasePoolPush();
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:](_DKPrivacyMaintainer, "maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:", v43->_storage, v7, v21, 4000, 100000, activity, 2419200.0);
      objc_autoreleasePoolPop(v26);
      if (xpc_activity_should_defer(activity))
      {
        v23 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
        v5 = v40;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = "Privacy maintenance deferred after maintain privacy.";
          goto LABEL_31;
        }
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {
      v25 = objc_autoreleasePoolPush();
      v22 = v43;
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:](_DKPrivacyMaintainer, "maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:", v43->_storage, v7, v21, 4000, 100000, 0, 2419200.0);
      objc_autoreleasePoolPop(v25);
    }
    v27 = objc_autoreleasePoolPush();
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon airplayTaskScheduler](v22, "airplayTaskScheduler"));
    objc_msgSend(v28, "executeCorrelationTask");

    v29 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.AirPlayRoutePrediction"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("LastAnalyticsCollectionDate")));
    v32 = (void *)v31;
    if (v31)
      v33 = (void *)v31;
    else
      v33 = v30;
    v34 = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "laterDate:", v34));
    if (objc_msgSend(v34, "compare:", v35) == (id)-1)
    {
      v36 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v34, v35);
      ARPCollectAndSendAnalyticsEvents(v22->_storage, v36);

    }
    objc_msgSend(v29, "setObject:forKey:", v30, CFSTR("LastAnalyticsCollectionDate"), v40);

    objc_autoreleasePoolPop(v27);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10001B6F4;
    v47[3] = &unk_100038A70;
    v47[4] = v22;
    v23 = objc_retainBlock(v47);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon intentSpotlightIndex](v22, "intentSpotlightIndex"));

    v38 = v22;
    v5 = v41;
    if (v37)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon intentSpotlightIndex](v38, "intentSpotlightIndex"));
      objc_msgSend(v39, "triggerIndexIncludingAdditions:completion:", 1, v23);

    }
    else
    {
      ((void (*))v23[2].isa)(v23);
    }
    goto LABEL_40;
  }
  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Privacy maintenance deferred after standing queries.", buf, 2u);
  }
LABEL_41:

}

- (void)logSizeOfStorage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  _BOOL4 v23;
  const __CFString *v24;
  uint8_t buf[4];
  char *v26;
  __int16 v27;
  char *v28;
  _QWORD v29[2];

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "directory"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseName")),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "directory"));
    v29[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseName"));
    v29[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    v10 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v9));

    v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@C.db"), v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributesOfItemAtPath:error:", v11, 0));

    if (v13)
    {
      v14 = (char *)objc_msgSend(v13, "fileSize");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@C.db-wal"), v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributesOfItemAtPath:error:", v15, 0));

      if (v17)
      {
        v18 = &v14[(_QWORD)objc_msgSend(v17, "fileSize")];
        v19 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v11;
          v27 = 2048;
          v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "DatabaseSize for %@: %lluB", buf, 0x16u);
        }

        if (v18)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseName"));
          v21 = objc_msgSend(v20, "containsString:", CFSTR("sync"));

          v22 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost"));
          v23 = os_signpost_enabled(v22);
          if (v21)
          {
            if (v23)
            {
              *(_DWORD *)buf = 134349056;
              v26 = v18;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SyncDatabaseSize", "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ", buf, 0xCu);
            }
            v24 = CFSTR("com.apple.coreduet.knowledgeStore.syncDatabaseSize");
          }
          else
          {
            if (v23)
            {
              *(_DWORD *)buf = 134349056;
              v26 = v18;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DatabaseSize", "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ", buf, 0xCu);
            }
            v24 = CFSTR("com.apple.coreduet.knowledgeStore.databaseSize");
          }

          +[_CDDiagnosticDataReporter setValue:forScalarKey:](_CDDiagnosticDataReporter, "setValue:forScalarKey:", v18, v24);
        }
      }

    }
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1000231A4();
  }

}

- (void)reportEventStatistics
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CDKnowledgeDaemon *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  os_activity_scope_state_s state;
  _BYTE v24[128];

  v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.reportEventStatistics", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v18 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeStorage eventCountPerStreamName](self->_storage, "eventCountPerStreamName"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        v7 += (uint64_t)v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.coreduet.knowledgeStore.eventCount"), v13));
        +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:](_CDDiagnosticDataReporter, "setValue:forScalarKey:limitingSigDigs:", v12, v14, 2);
        _cdknowledge_signpost_event_count(v12, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.total"), CFSTR("com.apple.coreduet.knowledgeStore.eventCount")));
  +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:](_CDDiagnosticDataReporter, "setValue:forScalarKey:limitingSigDigs:", v7, v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeStorage storage](v18->_storage, "storage"));
  -[CDKnowledgeDaemon logSizeOfStorage:](v18, "logSizeOfStorage:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeStorage syncStorage](v18->_storage, "syncStorage"));
  -[CDKnowledgeDaemon logSizeOfStorage:](v18, "logSizeOfStorage:", v17);

}

- (id)confirmDatabaseConnectionError
{
  void *v2;
  void *v3;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("unable to confirm underlying database connection.");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet"), 0, v2));

  return v3;
}

- (void)confirmDatabaseConnectionWithReply:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void (**v9)(id, _QWORD, uint64_t);

  v9 = (void (**)(id, _QWORD, uint64_t))a3;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
LABEL_6:
    v8 = (void *)v4;
    v9[2](v9, 0, v4);

    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](self, "storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storage"));
  v7 = objc_msgSend(v6, "confirmDatabaseConnectionFor:", NSFileProtectionCompleteUntilFirstUserAuthentication);

  if (!v7)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon confirmDatabaseConnectionError](self, "confirmDatabaseConnectionError"));
    goto LABEL_6;
  }
  v9[2](v9, 1, 0);
LABEL_7:

}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v5)(id, void *, id);
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void (**)(id, void *, id))a4;
  v6 = objc_alloc((Class)BMAccessClient);
  v7 = objc_msgSend(v6, "initWithUseCase:", BMUseCaseConnectionProxy);
  v10 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestEndpointForDomain:error:", v4, &v10));
  v9 = v10;
  v5[2](v5, v8, v9);

}

- (void)registerDataCollectionTasks
{
  if (+[_CDDeviceInfo isRunningOnInternalBuild](_CDDeviceInfo, "isRunningOnInternalBuild"))
  {
    -[CDKnowledgeDaemon registerCDInteractionDataCollectionTask](self, "registerCDInteractionDataCollectionTask");
    -[CDKnowledgeDaemon registerCDFTCPInteractionDataCollectionTask](self, "registerCDFTCPInteractionDataCollectionTask");
    -[CDKnowledgeDaemon registerPersonLinkingDataCollectionTask](self, "registerPersonLinkingDataCollectionTask");
    -[CDKnowledgeDaemon registerVisionSignalGradingDataCollectionTask](self, "registerVisionSignalGradingDataCollectionTask");
  }
  -[CDKnowledgeDaemon registerAirPlayTasks](self, "registerAirPlayTasks");
  -[CDKnowledgeDaemon macSleepModelingDataCollectionTasks](self, "macSleepModelingDataCollectionTasks");
  -[CDKnowledgeDaemon registerMailIntelligencePETDataCollectionTask](self, "registerMailIntelligencePETDataCollectionTask");
}

- (void)registerCDInteractionDataCollectionTask
{
  xpc_activity_register("com.apple.coreduetd.datacollection.cdinteraction.task", XPC_ACTIVITY_CHECK_IN, &stru_100039010);
}

- (void)registerCDFTCPInteractionDataCollectionTask
{
  xpc_activity_register("com.apple.coreduetd.datacollection.cdftcpinteraction.task", XPC_ACTIVITY_CHECK_IN, &stru_100039030);
}

- (void)registerAirPlayTasks
{
  id v3;
  ARPCorrelationTaskScheduler *v4;
  ARPCorrelationTaskScheduler *airplayTaskScheduler;
  id v6;

  if (!self->_airplayTaskScheduler)
  {
    v3 = objc_alloc((Class)ARPCorrelationTaskScheduler);
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](self, "storage"));
    v4 = (ARPCorrelationTaskScheduler *)objc_msgSend(v3, "initWithKnowledgeStore:", v6);
    airplayTaskScheduler = self->_airplayTaskScheduler;
    self->_airplayTaskScheduler = v4;

  }
}

- (void)registerPersonLinkingDataCollectionTask
{
  xpc_activity_register("com.apple.coreduetd.datacollection.PersonLinking", XPC_ACTIVITY_CHECK_IN, &stru_100039050);
}

- (void)registerVisionSignalGradingDataCollectionTask
{
  xpc_activity_register("com.apple.coreduetd.datacollection.VisionSignalGrading", XPC_ACTIVITY_CHECK_IN, &stru_100039070);
}

- (void)registerCloudFamilyPredictionTask
{
  xpc_activity_register("com.apple.coreduetd.cloudfamily.task", XPC_ACTIVITY_CHECK_IN, &stru_100039090);
}

- (void)registerContactsAutocompleteFeedbackProcessingTask
{
  xpc_activity_register("com.apple.coreduetd.feedback.cna.task", XPC_ACTIVITY_CHECK_IN, &stru_1000390B0);
}

- (void)registerARPHomeControlNotificationTask
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100023204(v2, v3, v4, v5, v6, v7, v8, v9);

  xpc_activity_register("com.apple.coreduetd.homecontrolsuggestion.notification.task", XPC_ACTIVITY_CHECK_IN, &stru_1000390D0);
}

- (void)registerMediaAnalysisProcessingTask
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD handler[5];

  v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100023234(v3, v4, v5, v6, v7, v8, v9, v10);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001CED4;
  handler[3] = &unk_100038B58;
  handler[4] = self;
  xpc_activity_register("com.apple.coreduetd.mediaanalysis.proc.task", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)synchronizeWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001D2CC;
    v8[3] = &unk_100039118;
    v9 = v4;
    objc_msgSend(v6, "syncWithReply:", v8);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser"));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

  }
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001D420;
    v13[3] = &unk_100039118;
    v14 = v9;
    objc_msgSend(v11, "synchronizeWithUrgency:client:reply:", a3, v8, v13);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser"));
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v12);

  }
}

- (void)deleteRemoteState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon syncCoordinator](self, "syncCoordinator"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001D550;
    v8[3] = &unk_100039118;
    v9 = v4;
    objc_msgSend(v6, "deleteRemoteStateWithReply:", v8);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser"));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

  }
}

- (void)sourceDeviceIdentityWithReply:(id)a3
{
  void *v4;
  void (*v5)(void);
  void *v6;
  void *v7;
  _QWORD *v8;

  v8 = a3;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v5 = (void (*)(void))v8[2];
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](self, "storage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceDeviceIdentity"));

    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser"));
      ((void (*)(_QWORD *, _QWORD, void *))v8[2])(v8, 0, v7);

      goto LABEL_7;
    }
    v5 = (void (*)(void))v8[2];
  }
  v5();
LABEL_7:

}

- (void)deviceUUIDWithReply:(id)a3
{
  void *v4;
  void (*v5)(void);
  void *v6;
  void *v7;
  _QWORD *v8;

  v8 = a3;
  if (-[CDKnowledgeDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon classCError](self, "classCError"));
    v5 = (void (*)(void))v8[2];
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](self, "storage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceUUID"));

    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser"));
      ((void (*)(_QWORD *, _QWORD, void *))v8[2])(v8, 0, v7);

      goto LABEL_7;
    }
    v5 = (void (*)(void))v8[2];
  }
  v5();
LABEL_7:

}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (_DKSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_syncCoordinator, a3);
}

- (_CDIntentSpotlightIndex)intentSpotlightIndex
{
  return self->_intentSpotlightIndex;
}

- (void)setIntentSpotlightIndex:(id)a3
{
  objc_storeStrong((id *)&self->_intentSpotlightIndex, a3);
}

- (ARPCorrelationTaskScheduler)airplayTaskScheduler
{
  return self->_airplayTaskScheduler;
}

- (void)setAirplayTaskScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_airplayTaskScheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayTaskScheduler, 0);
  objc_storeStrong((id *)&self->_intentSpotlightIndex, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_privacyEnforcer, 0);
  objc_storeStrong((id *)&self->_rateLimitEnforcer, 0);
  objc_storeStrong((id *)&self->_dataProtection, 0);
}

@end
