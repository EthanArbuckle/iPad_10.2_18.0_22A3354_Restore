@implementation CDPeopleDaemon

- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v15 = 138543362;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Suggesting message pins for client %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon messagesPinningSuggester](self, "messagesPinningSuggester"));
    v12 = objc_msgSend(v6, "integerValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chatGuidsForPinningHeuristicApproachWithMaxSuggestions:forReferenceDate:", v12, v13));
    v7[2](v7, v14);

  }
}

- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v16 = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Contact suggestions for client %{public}@", (uint8_t *)&v16, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon contactSuggester](self, "contactSuggester"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:", objc_msgSend(v8, "integerValue"), v9));
    v10[2](v10, v15);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CDPeopleDaemonConnection *v13;
  NSObject *v14;
  BOOL v15;
  _DWORD v17[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____CDInteractionXPCProtocol));
  setClassesForCDInteractionXPCInterface();
  objc_msgSend(v5, "setExportedInterface:", v6);
  objc_msgSend(v5, "_setQueue:", self->_workQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.coreduetd.allow")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.coreduetd.people")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.contactsui")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.contacts")));
  v11 = v10;
  if (v7)
  {
    v12 = v7;
  }
  else if (v8)
  {
    v12 = v8;
  }
  else
  {
    if (!v9)
    {
      if (v10 && objc_msgSend(v10, "BOOLValue"))
        goto LABEL_8;
      goto LABEL_13;
    }
    v12 = v9;
  }
  if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
  {
LABEL_8:
    v13 = objc_alloc_init(CDPeopleDaemonConnection);
    -[CDPeopleDaemonConnection setDaemon:](v13, "setDaemon:", self);
    -[CDPeopleDaemonConnection setQueryInteractionsOnlyAuthorization:](v13, "setQueryInteractionsOnlyAuthorization:", 0);
    objc_msgSend(v5, "setExportedObject:", v13);
    v14 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109120;
      v17[1] = objc_msgSend(v5, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Connection from PID %d accepted", (uint8_t *)v17, 8u);
    }

    objc_msgSend(v5, "resume");
    v15 = 1;
    goto LABEL_16;
  }
LABEL_13:
  v13 = (CDPeopleDaemonConnection *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    sub_10002255C(v5, &v13->super);
  v15 = 0;
LABEL_16:

  return v15;
}

- (_PSMessagesPinningSuggester)messagesPinningSuggester
{
  return self->_messagesPinningSuggester;
}

- (BOOL)isClassCLocked
{
  return -[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtection, "isDataAvailableFor:", NSFileProtectionCompleteUntilFirstUserAuthentication) ^ 1;
}

- (_PSContactSuggester)contactSuggester
{
  return self->_contactSuggester;
}

- (CDPeopleDaemon)initWithUserKnowledgeStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CDPeopleDaemon *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths peopleDatabaseDirectory](CDDPaths, "peopleDatabaseDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore storeWithDirectory:knowledgeStore:readOnly:](_CDInteractionStore, "storeWithDirectory:knowledgeStore:readOnly:", v5, v4, 1));
  v7 = -[CDPeopleDaemon initWithKnowledgeStore:interactionStore:](self, "initWithKnowledgeStore:interactionStore:", v4, v6);

  return v7;
}

- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CDPeopleDaemon *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths peopleDatabaseDirectory](CDDPaths, "peopleDatabaseDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore storeWithDirectory:knowledgeStore:readOnly:](_CDInteractionStore, "storeWithDirectory:knowledgeStore:readOnly:", v5, v4, 0));
  v7 = -[CDPeopleDaemon initWithKnowledgeStore:interactionStore:](self, "initWithKnowledgeStore:interactionStore:", v4, v6);

  return v7;
}

+ (BOOL)isKnowledgeAgent
{
  return 0;
}

+ (id)machServiceName
{
  unsigned int v2;
  id *v3;

  v2 = objc_msgSend(a1, "isKnowledgeAgent");
  v3 = (id *)&_CDInteractionMachServiceName;
  if (v2)
    v3 = (id *)&_CDInteractionUserMachServiceName;
  return *v3;
}

- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  CDPeopleDaemon *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  _DKDataProtectionStateMonitor *v16;
  _DKDataProtectionStateMonitor *dataProtection;
  id v18;
  void *v19;
  id v20;
  _PSEnsembleModel *ensembleModel;
  id v22;
  _PSSuggester *v23;
  _PSSuggester *suggester;
  id *p_store;
  _DKDataProtectionStateMonitor *v26;
  _DKDataProtectionStateMonitor *v27;
  uint64_t v28;
  _CDInteractionAdviceEngine *advisor;
  uint64_t v30;
  _CDInteractionPolicies *policies;
  void *v32;
  dispatch_queue_attr_t v33;
  NSObject *v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *v36;
  id v37;
  id v38;
  _PSSuggester *v39;
  _PSSuggester *v40;
  id v41;
  void *v42;
  objc_class *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  dispatch_queue_attr_t v53;
  NSObject *v54;
  dispatch_queue_t v55;
  OS_dispatch_queue *peopleSuggestionQueue;
  dispatch_queue_attr_t v57;
  NSObject *v58;
  dispatch_queue_t v59;
  OS_dispatch_queue *appExtensionQueue;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  objc_super v68;
  objc_super v69;
  os_activity_scope_state_s state;
  Class (*v71)(uint64_t);
  void *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;

  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.CDPeopleDaemon", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  LODWORD(v9) = +[CDPeopleDaemon isKnowledgeAgent](CDPeopleDaemon, "isKnowledgeAgent");
  self->_isKnowledgeAgent = (char)v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CDPeopleDaemon machServiceName](CDPeopleDaemon, "machServiceName"));
  if ((_DWORD)v9)
  {
    v69.receiver = self;
    v69.super_class = (Class)CDPeopleDaemon;
    v11 = -[CDPeopleDaemon initWithMachServiceName:](&v69, "initWithMachServiceName:", v10);

    if (!v11)
      goto LABEL_9;
    objc_storeStrong((id *)&v11->_store, a4);
    -[CDPeopleDaemon setDelegate:](v11, "setDelegate:", v11);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.coreduet.knowledge-agent.people.work", v13);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v14;

    v16 = (_DKDataProtectionStateMonitor *)objc_alloc_init((Class)_DKDataProtectionStateMonitor);
    dataProtection = v11->_dataProtection;
    v11->_dataProtection = v16;

    v18 = objc_msgSend(sub_100008BB4(), "defaultConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_alloc_init((Class)sub_100008C6C());
    -[_CDInteractionStore setReadConcurrently:](v11->_store, "setReadConcurrently:", 1);
    objc_msgSend(v20, "setInteractionStore:", v11->_store);
    objc_msgSend(v20, "setKnowledgeStore:", v7);
    ensembleModel = v11->_ensembleModel;
    v11->_ensembleModel = (_PSEnsembleModel *)v20;
    v22 = v20;

    objc_msgSend(v19, "setSuggestionModel:", v11->_ensembleModel);
    v23 = (_PSSuggester *)objc_msgSend(objc_alloc((Class)_PSSuggester), "initWithConfiguration:", v19);
    suggester = v11->_suggester;
    v11->_suggester = v23;

    -[CDPeopleDaemon populatePeopleSuggesterCaches](v11, "populatePeopleSuggesterCaches");
  }
  else
  {
    v68.receiver = self;
    v68.super_class = (Class)CDPeopleDaemon;
    v11 = -[CDPeopleDaemon initWithMachServiceName:](&v68, "initWithMachServiceName:", v10);

    if (!v11)
      goto LABEL_9;
    p_store = (id *)&v11->_store;
    objc_storeStrong((id *)&v11->_store, a4);
    objc_storeStrong((id *)&v11->_knowledgeStore, a3);
    v26 = (_DKDataProtectionStateMonitor *)objc_alloc_init((Class)_DKDataProtectionStateMonitor);
    v27 = v11->_dataProtection;
    v11->_dataProtection = v26;

    v28 = objc_claimAutoreleasedReturnValue(+[_CDInteractionAdviceEngine interactionAdviceEngineWithStore:](_CDInteractionAdviceEngine, "interactionAdviceEngineWithStore:", v11->_store));
    advisor = v11->_advisor;
    v11->_advisor = (_CDInteractionAdviceEngine *)v28;

    -[CDPeopleDaemon setDelegate:](v11, "setDelegate:", v11);
    v30 = objc_claimAutoreleasedReturnValue(+[_CDInteractionPolicies interactionPolicies](_CDInteractionPolicies, "interactionPolicies"));
    policies = v11->_policies;
    v11->_policies = (_CDInteractionPolicies *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[_CDSiriLearningSettings sharedInstance](_CDSiriLearningSettings, "sharedInstance"));
    objc_msgSend(v32, "startSanitizingInteractionStore:", v11->_store);

    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = dispatch_queue_create("com.apple.coreduetd.people.work", v34);
    v36 = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v35;

    v37 = objc_msgSend(sub_100008BB4(), "defaultConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v38 = objc_alloc_init((Class)sub_100008C6C());
    -[_CDInteractionStore setReadConcurrently:](v11->_store, "setReadConcurrently:", 1);
    objc_msgSend(v38, "setInteractionStore:", v11->_store);
    objc_msgSend(v38, "setKnowledgeStore:", v11->_knowledgeStore);
    objc_msgSend(v38, "registerWithTrial");
    objc_storeStrong((id *)&v11->_ensembleModel, v38);
    objc_msgSend(v19, "setSuggestionModel:", v11->_ensembleModel);
    v39 = (_PSSuggester *)objc_msgSend(objc_alloc((Class)_PSSuggester), "initWithConfiguration:feedbackRecording:", v19, 1);
    v40 = v11->_suggester;
    v11->_suggester = v39;

    v41 = objc_alloc_init((Class)_PSMessagesPinningSuggester);
    objc_msgSend(v41, "setInteractionStore:", v11->_store);
    objc_storeStrong((id *)&v11->_messagesPinningSuggester, v41);
    v74 = 0;
    v75 = &v74;
    v76 = 0x2050000000;
    v42 = (void *)qword_100040E90;
    v77 = qword_100040E90;
    if (!qword_100040E90)
    {
      state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
      state.opaque[1] = 3221225472;
      v71 = sub_10000F104;
      v72 = &unk_100038BF8;
      v73 = &v74;
      sub_10000F104((uint64_t)&state);
      v42 = (void *)v75[3];
    }
    v62 = v8;
    v63 = v7;
    v43 = objc_retainAutorelease(v42);
    _Block_object_dispose(&v74, 8);
    v44 = objc_alloc_init(v43);
    objc_storeStrong((id *)&v11->_familyRecommender, v44);
    v45 = objc_alloc_init((Class)_PSContactSuggester);
    objc_msgSend(v45, "setInteractionStore:", *p_store);
    objc_storeStrong((id *)&v11->_contactSuggester, v45);
    -[CDPeopleDaemon setupDataProtectionChangeHandler](v11, "setupDataProtectionChangeHandler");
    -[CDPeopleDaemon versionCheckAndUpgradeIfNecessaryAndPossible](v11, "versionCheckAndUpgradeIfNecessaryAndPossible");
    -[CDPeopleDaemon populatePeopleSuggesterCaches](v11, "populatePeopleSuggesterCaches");
    objc_msgSend(*p_store, "closeStorage");
    objc_initWeak((id *)&state, v11);
    v46 = _CDInteractionMachServiceName;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100008D24;
    v66[3] = &unk_100038AE0;
    objc_copyWeak(&v67, (id *)&state);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicSchedulerJob jobWithPeriod:schedulerJobName:handler:](_CDPeriodicSchedulerJob, "jobWithPeriod:schedulerJobName:handler:", 2, v46, v66));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance"));
    objc_msgSend(v48, "registerJob:", v47);

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)&state);

    v8 = v62;
    v7 = v63;
  }

LABEL_9:
  if (v11->_isKnowledgeAgent)
  {
    objc_initWeak((id *)&state, v11);
    if (v11->_isKnowledgeAgent)
      v49 = CFSTR("com.apple.coreduet.knowledge-agent.people.refresh-cache");
    else
      v49 = CFSTR("com.apple.coreduetd.people.refresh-cache");
    v50 = v49;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100008DB4;
    v64[3] = &unk_100038AE0;
    objc_copyWeak(&v65, (id *)&state);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicSchedulerJob jobWithPeriod:schedulerJobName:handler:](_CDPeriodicSchedulerJob, "jobWithPeriod:schedulerJobName:handler:", 1, v50, v64));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance"));
    objc_msgSend(v52, "registerJob:", v51);

    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)&state);
  }
  v53 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v54 = objc_claimAutoreleasedReturnValue(v53);
  v55 = dispatch_queue_create("com.apple.peopleSuggestionQueue", v54);
  peopleSuggestionQueue = v11->_peopleSuggestionQueue;
  v11->_peopleSuggestionQueue = (OS_dispatch_queue *)v55;

  v57 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v58 = objc_claimAutoreleasedReturnValue(v57);
  v59 = dispatch_queue_create("com.apple.appExtensionQueue", v58);
  appExtensionQueue = v11->_appExtensionQueue;
  v11->_appExtensionQueue = (OS_dispatch_queue *)v59;

  -[CDPeopleDaemon resume](v11, "resume");
  return v11;
}

- (id)workQueue
{
  return self->_workQueue;
}

- (void)setupDataProtectionChangeHandler
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008F00;
  v3[3] = &unk_100038B08;
  objc_copyWeak(&v4, &location);
  -[_DKDataProtectionStateMonitor setChangeHandler:](self->_dataProtection, "setChangeHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)populatePeopleSuggesterCaches
{
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  _QWORD block[5];
  os_activity_scope_state_s state;

  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000225E0();
  }
  else
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.populatePeopleSuggesterCaches", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    os_activity_scope_leave(&state);

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v3 = dispatch_queue_create("com.apple.coreduet.PeopleSuggesterAppAndPeopleCache", v6);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000091AC;
    block[3] = &unk_100038A70;
    block[4] = self;
    dispatch_async(v3, block);
  }

}

- (void)refreshPeopleSuggesterCaches
{
  id v3;

  if (!-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    objc_msgSend(v3, "refreshCaches");

  }
}

- (void)handleError:(id)a3
{
  id v4;
  OS_dispatch_queue *workQueue;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CDPeopleDaemon *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v4 = a3;
  if (v4
    && +[_CDErrorUtilities isCoreDataFatalError:](_CDErrorUtilities, "isCoreDataFatalError:", v4))
  {
    workQueue = self->_workQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000093F4;
    v10[3] = &unk_100038B30;
    v11 = v4;
    v12 = self;
    v6 = v10;
    v7 = workQueue;
    v8 = (void *)os_transaction_create("cd_dispatch_async_tx");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F1B8;
    block[3] = &unk_100038A98;
    v14 = v8;
    v15 = v6;
    v9 = v8;
    dispatch_async(v7, block);

  }
}

- (int64_t)readVersionNumberFromDefaults
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("InteractionStoreVersion"));

  return (int64_t)v3;
}

- (void)writeVersionNumberToDefaults:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("InteractionStoreVersion"));
  objc_msgSend(v4, "synchronize");

}

- (BOOL)versionCheckAndUpgradeIfNecessaryAndPossible
{
  BOOL v3;
  NSObject *v4;
  _QWORD block[5];

  if ((id)-[CDPeopleDaemon readVersionNumberFromDefaults](self, "readVersionNumberFromDefaults") == (id)1)
    return 1;
  if (!-[_DKDataProtectionStateMonitor isDataAvailableFor:](self->_dataProtection, "isDataAvailableFor:", NSFileProtectionCompleteUntilFirstUserAuthentication))return 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009684;
  block[3] = &unk_100038A70;
  block[4] = self;
  if (qword_100040E70 != -1)
    dispatch_once(&qword_100040E70, block);
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10002260C();

  v3 = 1;
  -[CDPeopleDaemon writeVersionNumberToDefaults:](self, "writeVersionNumberToDefaults:", 1);
  return v3;
}

- (BOOL)adjustPosixPermissionsForStorage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _UNKNOWN **v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSMutableDictionary *v25;
  void *v26;
  _UNKNOWN **v27;
  void *v28;
  unsigned __int8 v29;
  NSObject *v30;
  NSObject *v31;
  BOOL v32;
  void *v34;
  id v35;
  id v36;
  NSMutableArray *obj;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  _QWORD v47[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "directory"));
  v47[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseName"));
  v47[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v6));

  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@C.db"), v7));
  -[NSMutableArray addObject:](v8, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@C.db-wal"), v7));
  -[NSMutableArray addObject:](v8, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@C.db-shm"), v7));
  -[NSMutableArray addObject:](v8, "addObject:", v11);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v8;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (!v12)
  {
    v14 = 0;
    v32 = 1;
    goto LABEL_30;
  }
  v13 = v12;
  v34 = v7;
  v35 = v3;
  v14 = 0;
  v15 = *(_QWORD *)v41;
  v16 = &ADClientAddValueForScalarKey_ptr;
  while (2)
  {
    v17 = 0;
    v36 = v13;
    do
    {
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[46], "defaultManager"));
      v20 = objc_msgSend(v19, "fileExistsAtPath:", v18);

      if ((v20 & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[46], "defaultManager"));
        v39 = v14;
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributesOfItemAtPath:error:", v18, &v39));
        v23 = v39;

        if (!v22)
        {
          v22 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_1000227F0();
          v14 = v23;
          goto LABEL_28;
        }
        if (-[NSObject filePosixPermissions](v22, "filePosixPermissions") == (id)420)
        {
          v24 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "DB file %@ has correct POSIX permissions.", buf, 0xCu);
          }

          v14 = v23;
          goto LABEL_18;
        }
        v25 = objc_opt_new(NSMutableDictionary);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 420));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v26, NSFilePosixPermissions);

        v27 = v16;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[46], "defaultManager"));
        v38 = v23;
        v29 = objc_msgSend(v28, "setAttributes:ofItemAtPath:error:", v25, v18, &v38);
        v14 = v38;

        v30 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
        v31 = v30;
        if ((v29 & 1) == 0)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_100022850();

LABEL_28:
          v32 = 0;
          goto LABEL_29;
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v18;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Changed POSIX permission of %@ to 0644.", buf, 0xCu);
        }

        v13 = v36;
        v16 = v27;
      }
      else
      {
        v22 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v18;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DB file %@ does not exist. Skipping POSIX permissions check.", buf, 0xCu);
        }
      }
LABEL_18:

      v17 = (char *)v17 + 1;
    }
    while (v13 != v17);
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v13)
      continue;
    break;
  }
  v32 = 1;
LABEL_29:
  v7 = v34;
  v3 = v35;
LABEL_30:

  return v32;
}

+ (BOOL)writeRepopulationCheckpoint:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v6 = v5;

  objc_msgSend(v4, "setDouble:forKey:", CFSTR("InteractionRepopluationCheckpoint"), v6);
  objc_msgSend(v4, "synchronize");
  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000228B0();

  return 1;
}

+ (id)readRepopulationCheckpoint
{
  void *v2;
  NSObject *v3;
  double v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "synchronize");
  v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000228DC();

  objc_msgSend(v2, "doubleForKey:", CFSTR("InteractionRepopluationCheckpoint"));
  if (v4 == 0.0)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  return v5;
}

- (BOOL)requestInteractionRepopulation
{
  void *v3;
  NSObject *v4;
  unsigned __int8 v5;
  void *v6;
  NSObject *v7;
  _QWORD handler[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "synchronize");
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100022934();

  v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableInteractionRepopulation"));
  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    +[CDPeopleDaemon writeRepopulationCheckpoint:](CDPeopleDaemon, "writeRepopulationCheckpoint:", v6);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100009F2C;
    handler[3] = &unk_100038B58;
    handler[4] = self;
    xpc_activity_register("com.apple.coreduet.people.repopulate", XPC_ACTIVITY_CHECK_IN, handler);
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100022908();

  }
  return v5;
}

- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _CDInteractionStore *store;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v11[2](v11, 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionPolicies filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:](self->_policies, "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:", v10, v8, v7));
    v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v12, "count");
      v15 = _CDCurrentOrXPCProcessName();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 134218242;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Saving %lu interactions for client %{public}@", buf, 0x16u);

    }
    store = self->_store;
    v20 = 0;
    v18 = -[_CDInteractionStore recordInteractions:error:](store, "recordInteractions:error:", v12, &v20);
    v19 = v20;
    ((void (**)(id, id))v11)[2](v11, v18);
    -[CDPeopleDaemon handleError:](self, "handleError:", v19);

  }
}

- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _CDInteractionStore *store;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v11[2](v11, 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionPolicies filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:](self->_policies, "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:", v10, v8, v7));
    v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v12, "count");
      v15 = _CDCurrentOrXPCProcessName();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 134218242;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating %lu interactions for client %{public}@", buf, 0x16u);

    }
    store = self->_store;
    v20 = 0;
    v18 = -[_CDInteractionStore updateInteractions:error:](store, "updateInteractions:error:", v12, &v20);
    v19 = v20;
    ((void (**)(id, id))v11)[2](v11, v18);
    -[CDPeopleDaemon handleError:](self, "handleError:", v19);

  }
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _CDInteractionStore *store;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = _CDCurrentOrXPCProcessName();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Querying interactions for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A934;
    v17[3] = &unk_100038B80;
    v18 = v12;
    objc_copyWeak(&v19, (id *)buf);
    -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:completionHandler:](store, "queryInteractionsUsingPredicate:sortDescriptors:limit:completionHandler:", v10, v11, a5, v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak((id *)buf);
  }

}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _CDInteractionStore *store;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = _CDCurrentOrXPCProcessName();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Querying contacts for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000ABAC;
    v17[3] = &unk_100038B80;
    v18 = v12;
    objc_copyWeak(&v19, (id *)buf);
    -[_CDInteractionStore queryContactsUsingPredicate:sortDescriptors:limit:completionHandler:](store, "queryContactsUsingPredicate:sortDescriptors:limit:completionHandler:", v10, v11, a5, v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak((id *)buf);
  }

}

- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _CDInteractionStore *store;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v6 = a3;
  v7 = a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Counting interactions for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000AE00;
    v12[3] = &unk_100038BA8;
    v13 = v7;
    objc_copyWeak(&v14, (id *)buf);
    -[_CDInteractionStore countInteractionsUsingPredicate:completionHandler:](store, "countInteractionsUsingPredicate:completionHandler:", v6, v12);
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }

}

- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _CDInteractionStore *store;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v6 = a3;
  v7 = a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Counting contacts for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000B048;
    v12[3] = &unk_100038BA8;
    v13 = v7;
    objc_copyWeak(&v14, (id *)buf);
    -[_CDInteractionStore countContactsUsingPredicate:completionHandler:](store, "countContactsUsingPredicate:completionHandler:", v6, v12);
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }

}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _CDInteractionStore *store;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = _CDCurrentOrXPCProcessName();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deleting interactions matching predicate for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v17 = objc_alloc((Class)NSString);
    v18 = _CDCurrentOrXPCProcessName();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_msgSend(v17, "initWithFormat:", CFSTR("for client %@"), v19);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000B2FC;
    v21[3] = &unk_100038BA8;
    v22 = v12;
    objc_copyWeak(&v23, (id *)buf);
    -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:](store, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:", v10, v11, a5, v20, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _CDInteractionStore *store;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v6 = a3;
  v7 = a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000B544;
    v12[3] = &unk_100038BA8;
    v13 = v7;
    objc_copyWeak(&v14, (id *)buf);
    -[_CDInteractionStore deleteInteractionsWithBundleId:completionHandler:](store, "deleteInteractionsWithBundleId:completionHandler:", v6, v12);
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _CDInteractionStore *store;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id and account for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000B7A0;
    v15[3] = &unk_100038BA8;
    v16 = v10;
    objc_copyWeak(&v17, (id *)buf);
    -[_CDInteractionStore deleteInteractionsWithBundleId:account:completionHandler:](store, "deleteInteractionsWithBundleId:account:completionHandler:", v8, v9, v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _CDInteractionStore *store;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id and domain for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000B9FC;
    v15[3] = &unk_100038BA8;
    v16 = v10;
    objc_copyWeak(&v17, (id *)buf);
    -[_CDInteractionStore deleteInteractionsWithBundleId:domainIdentifier:completionHandler:](store, "deleteInteractionsWithBundleId:domainIdentifier:completionHandler:", v8, v9, v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _CDInteractionStore *store;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id and domains for client %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000BC58;
    v15[3] = &unk_100038BA8;
    v16 = v10;
    objc_copyWeak(&v17, (id *)buf);
    -[_CDInteractionStore deleteInteractionsWithBundleId:domainIdentifiers:completionHandler:](store, "deleteInteractionsWithBundleId:domainIdentifiers:completionHandler:", v8, v9, v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }

}

- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *peopleSuggestionQueue;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(id, void *, id);
  uint8_t buf[4];
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  v11 = -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v12 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100022AA4();

    objc_msgSend(v8, "setSuggestionPath:", CFSTR("suggestionPathClassCLocked"));
    v10[2](v10, &__NSArray0__struct, v8);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = _CDCurrentOrXPCProcessName();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Suggesting interactions for client %{public}@", buf, 0xCu);

    }
    peopleSuggestionQueue = self->_peopleSuggestionQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000BEB0;
    v17[3] = &unk_100038BD0;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    dispatch_async(peopleSuggestionQueue, v17);

  }
}

- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v9 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100022AA4();

    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = _CDCurrentOrXPCProcessName();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v15 = 138543362;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Suggesting extensions for client %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon suggester](self, "suggester"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appExtensionSuggestionsFromContext:", v6));
    v7[2](v7, v14);

    v7 = (void (**)(id, void *))v13;
  }

}

- (void)candidatesForShareSheetRanking:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  uint8_t buf[4];
  void *v12;

  v4 = (void (**)(_QWORD))a3;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10 = objc_opt_new(NSSet);
    v4[2](v4);

  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = _CDCurrentOrXPCProcessName();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Fetching candidates for Share Sheet ranking for client %{public}@", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon suggester](self, "suggester"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "candidatesForShareSheetRankingCompute"));
    ((void (*)(void (**)(_QWORD), void *))v4[2])(v4, v9);

  }
}

- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSDictionary0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fetching ephemeral features for Share Sheet for client: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "computeEphemeralFeaturesWithPredictionContext:", v6));
    v7[2](v7, v12);

  }
}

- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v10 = a4;
  v11 = -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v12 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not Validate CoreML model as device is class C locked", (uint8_t *)&v18, 2u);
    }

    v9[2](v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = _CDCurrentOrXPCProcessName();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v18 = 138543362;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Validating CoreML model for client %{public}@", (uint8_t *)&v18, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "validateCoreMLModelWithRawInput:predictionContext:", v8, v10));

    v9[2](v9, (id)v17);
    v9 = (void (**)(id, id))v17;
    v10 = v16;
  }

}

- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v16 = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting maps for client %{public}@", (uint8_t *)&v16, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "predictWithMapsPredictionContext:maxSuggestions:", v8, objc_msgSend(v9, "integerValue")));
    v10[2](v10, v15);

  }
}

- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v16 = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting zero keyword for client %{public}@", (uint8_t *)&v16, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestZKWSuggestionsWithPredictionContext:maxSuggestions:", v8, objc_msgSend(v9, "integerValue")));
    v10[2](v10, v15);

  }
}

- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Suggesting autocomplete for client %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "autocompleteSearchResultsWithPredictionContext:", v6));
    v7[2](v7, v12);

  }
}

- (void)saveFeedbackInCoreDuetd:(id)a3 forSessionId:(id)a4 feedbackActionType:(int64_t)a5 isFallbackFetch:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v7;
  void (**v11)(id, uint64_t);

  v7 = a6;
  v11 = (void (**)(id, uint64_t))a7;
  +[_PSEnsembleModel saveFeedback:forSessionId:feedbackActionType:isFallbackFetch:](_PSEnsembleModel, "saveFeedback:forSessionId:feedbackActionType:isFallbackFetch:", a3, a4, a5, v7);
  v11[2](v11, 1);

}

- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = _CDCurrentOrXPCProcessName();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Writing feedback for client %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon suggester](self, "suggester"));
  objc_msgSend(v8, "writeFeedbackForContactsAutocompleteSuggestions:", v4);

}

- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v16 = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting ranked names for client %{public}@", (uint8_t *)&v16, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rankedNameSuggestionsWithPredictionContext:name:", v8, v9));
    v10[2](v10, v15);

  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(id, void *);
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v12[2](v12, &__NSArray0__struct);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = _CDCurrentOrXPCProcessName();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v18 = 138543362;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Suggesting ranked global suggestions for client %{public}@", (uint8_t *)&v18, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:", v10, v8, objc_msgSend(v11, "integerValue")));
    v12[2](v12, v17);

  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  id v13;
  void (**v14)(id, void *);
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v8 = a6;
  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *))a7;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v14[2](v14, &__NSArray0__struct);
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = _CDCurrentOrXPCProcessName();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v20 = 138543362;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Suggesting ranked global suggestions with backfill option for client %{public}@", (uint8_t *)&v20, 0xCu);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:", v12, v10, objc_msgSend(v13, "integerValue"), v8));
    v14[2](v14, v19);

  }
}

- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v13[2](v13, &__NSArray0__struct);
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = _CDCurrentOrXPCProcessName();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v19 = 138543362;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Suggesting ranked global suggestions for client %{public}@", (uint8_t *)&v19, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rankedGlobalSuggestionsForSiriNLWithPredictionContext:maxSuggestions:interactionId:", v10, objc_msgSend(v11, "integerValue"), v12));
    v13[2](v13, v18);

  }
}

- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v16 = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting ranked autocomplete suggestions for client %{public}@", (uint8_t *)&v16, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rankedAutocompleteSuggestionsFromContext:candidates:", v8, v9));
    v10[2](v10, v15);

  }
}

- (void)provideMessagesPinningFeedback:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = _CDCurrentOrXPCProcessName();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Feedback for message pins for client %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon messagesPinningSuggester](self, "messagesPinningSuggester"));
  objc_msgSend(v8, "submitMessagesPinningFeedback:", v4);

}

- (void)rankedFamilySuggestionsWithReply:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = (void (**)(id, void *))a3;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v4[2](v4, &__NSArray0__struct);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = _CDCurrentOrXPCProcessName();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ranked family suggestions for client %{public}@", (uint8_t *)&v10, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon familyRecommender](self, "familyRecommender"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "familyRecommendations"));
    v4[2](v4, v9);

  }
}

- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Family recommended suggestions for client %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon familyRecommender](self, "familyRecommender"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "familyRecommendationSuggestionsForShareSheetWithPredictionContext:", v6));
    v7[2](v7, v12);

  }
}

- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Family recommended suggestions for client %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon familyRecommender](self, "familyRecommender"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestionsForPhotosRelationshipsWithPredictionContext:", v6));
    v7[2](v7, v12);

  }
}

- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Family recommended suggestions for client %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon familyRecommender](self, "familyRecommender"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestionsForPhotosContactInferencesWithPredictionContext:", v6));
    v7[2](v7, v12);

  }
}

- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSDictionary0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v16 = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ranked Siri Handle Suggestions for client %{public}@", (uint8_t *)&v16, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rankedSiriMLCRHandles:context:", v9, v8));
    v10[2](v10, v15);

  }
}

- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSDictionary0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ranked Handle Suggestions for client %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rankedHandlesFromCandidateHandles:", v6));
    v7[2](v7, v12);

  }
}

- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSDictionary0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v17 = 138543362;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "App Usage Distribution for client %{public}@", (uint8_t *)&v17, 0xCu);

    }
    v14 = objc_msgSend(v9, "integerValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon knowledgeStore](self, "knowledgeStore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[_PSAppUsageUtilities relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:knowledgeStore:](_PSAppUsageUtilities, "relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:knowledgeStore:", v8, v14, v15));
    v10[2](v10, v16);

  }
}

- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v15 = 138543362;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ranking candidates for client %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionAdviceEngine rankCandidateContacts:usingSettings:](self->_advisor, "rankCandidateContacts:usingSettings:", v8, v9));
    v10[2](v10, v14);

  }
}

- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Advising interactions with people for client %{public}@", (uint8_t *)&v12, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionAdviceEngine adviseInteractionsUsingSettings:](self->_advisor, "adviseInteractionsUsingSettings:", v6));
    v7[2](v7, v11);

  }
}

- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v15 = 138543362;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Advising interactions with people using time of day for client %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionAdviceEngine adviseInteractionsForDate:usingSettings:](self->_advisor, "adviseInteractionsForDate:usingSettings:", v8, v9));
    v10[2](v10, v14);

  }
}

- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = _CDCurrentOrXPCProcessName();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v15 = 138543362;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Advising interactions with people using a query for client %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionAdviceEngine adviseInteractionsForKeywordsInString:usingSettings:](self->_advisor, "adviseInteractionsForKeywordsInString:usingSettings:", v8, v9));
    v10[2](v10, v14);

  }
}

- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v13[2](v13, &__NSArray0__struct);
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = _CDCurrentOrXPCProcessName();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v18 = 138543362;
      v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Advising interactions with people using social cues for client %{public}@", (uint8_t *)&v18, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionAdviceEngine adviseSocialInteractionsForDate:andSeedContacts:usingSettings:](self->_advisor, "adviseSocialInteractionsForDate:andSeedContacts:usingSettings:", v10, v11, v12));
    v13[2](v13, v17);

  }
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = _CDCurrentOrXPCProcessName();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 138543362;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Tuning social advisor for client %{public}@", (uint8_t *)&v14, 0xCu);

  }
  -[_CDInteractionAdviceEngine tuneSocialAdvisorUsingSettings:heartBeatHandler:](self->_advisor, "tuneSocialAdvisorUsingSettings:heartBeatHandler:", v10, v9);

  v8[2](v8);
}

- (void)maintainPrivacy
{
  NSObject *v3;
  OS_dispatch_queue *workQueue;
  _QWORD *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  os_activity_scope_state_s state;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.maintainPrivacy", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E3C0;
  v9[3] = &unk_100038A70;
  v9[4] = self;
  v5 = v9;
  v6 = workQueue;
  v7 = (void *)os_transaction_create("cd_dispatch_async_tx");
  state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
  state.opaque[1] = 3221225472;
  v11 = sub_10000F1B8;
  v12 = &unk_100038A98;
  v13 = v7;
  v14 = v5;
  v8 = v7;
  dispatch_async(v6, &state);

}

- (void)_maintainPrivacy
{
  NSObject *v3;
  NSObject *v4;
  _CDInteractionPolicies **p_policies;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t buf[4];
  char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100022C5C();

  kdebug_trace(725024896, 0, 0, 0, 0);
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost"));
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", " enableTelemetry=YES ", buf, 2u);
  }

  p_policies = &self->_policies;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionPolicies whitelistedFirstPartyBundleIds](self->_policies, "whitelistedFirstPartyBundleIds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionPolicies dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds](self->_policies, "dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleId IN %@ AND startDate < %@"), v6, v7));

  v9 = (char *)-[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self->_store, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v8, &__NSArray0__struct, -[_CDInteractionPolicies maxNumberOfInteractionsDeleted](self->_policies, "maxNumberOfInteractionsDeleted"), CFSTR("_maintainPrivacy allowlisted first party deletion predicate"), 0);
  v10 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_100022BD8((id *)&self->_policies);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionPolicies whitelistedFirstPartyBundleIds](*p_policies, "whitelistedFirstPartyBundleIds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionPolicies dateOfOldestAllowedInteraction](*p_policies, "dateOfOldestAllowedInteraction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT(bundleId IN %@) AND startDate < %@"), v11, v12));

  v14 = -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self->_store, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v13, &__NSArray0__struct, -[_CDInteractionPolicies maxNumberOfInteractionsDeleted](*p_policies, "maxNumberOfInteractionsDeleted"), CFSTR("_maintainPrivacy denylisted apps deletion predicate"), 0);
  v15 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100022B54((id *)&self->_policies);
  v16 = &v9[(_QWORD)v14];

  v17 = -[_CDInteractionStore deleteOldInteractionsIfNeededToLimitTotalNumber:limit:](self->_store, "deleteOldInteractionsIfNeededToLimitTotalNumber:limit:", -[_CDInteractionPolicies maxNumberOfInteractionsStored](*p_policies, "maxNumberOfInteractionsStored"), -[_CDInteractionPolicies maxNumberOfInteractionsDeleted](*p_policies, "maxNumberOfInteractionsDeleted"));
  v18 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_100022AD0((id *)&self->_policies);

  -[CDPeopleDaemon reportPeopleStatistics](self, "reportPeopleStatistics");
  -[_CDInteractionStore closeStorage](self->_store, "closeStorage");
  kdebug_trace(725024900, v16, v17, 0, 0);
  v19 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost"));
  if (os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 134349568;
    v21 = v16;
    v22 = 2050;
    v23 = v17;
    v24 = 2050;
    v25 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", "LifespanLimitDeleted=%{signpost.telemetry:number1,public}lu TotalLimitDeleted=%{signpost.telemetry:number2,public}lu UserDoesNotExistDeleted=%{signpost.telemetry:number3,public}lu", buf, 0x20u);
  }

}

- (void)populateAppUsageCache
{
  NSObject *v3;
  id v4;
  void *v5;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.populateAppUsageCache", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  v4 = sub_10000E858();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon knowledgeStore](self, "knowledgeStore"));
  objc_msgSend(v4, "cacheAppUsageDurations:", v5);

}

- (void)populateAppSharesCache
{
  NSObject *v2;
  os_activity_scope_state_s v3;

  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.populateAppSharesCache", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  os_activity_scope_leave(&v3);

  objc_msgSend(sub_10000E858(), "cacheSharesForEachApp");
}

- (void)logSizeOfStorage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  char *v21;
  _QWORD v22[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "directory"));
  v22[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseName"));

  v22[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v6));

  v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@C.db"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributesOfItemAtPath:error:", v8, 0));

  if (v10)
  {
    v11 = (char *)objc_msgSend(v10, "fileSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@C.db-wal"), v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributesOfItemAtPath:error:", v12, 0));

    if (v14)
    {
      v15 = &v11[(_QWORD)objc_msgSend(v14, "fileSize")];
      v16 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v8;
        v20 = 2048;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "DatabaseSize for %@: %lluB", buf, 0x16u);
      }

      if (v15)
      {
        v17 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost"));
        if (os_signpost_enabled(v17))
        {
          *(_DWORD *)buf = 134349056;
          v19 = v15;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DatabaseSize", "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ", buf, 0xCu);
        }

        +[_CDDiagnosticDataReporter setValue:forScalarKey:](_CDDiagnosticDataReporter, "setValue:forScalarKey:", v15, CFSTR("com.apple.coreduet.interactionStore.databaseSize"));
      }
    }

  }
}

- (void)reportPeopleStatistics
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  os_activity_scope_state_s state;
  _BYTE v21[128];

  v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.reportPeopleStatistics", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionStore interactionCountPerMechanism](self->_store, "interactionCountPerMechanism"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        v7 += (uint64_t)v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.coreduet.interactionStore"), v10));
        +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:](_CDDiagnosticDataReporter, "setValue:forScalarKey:limitingSigDigs:", v12, v13, 2);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.total"), CFSTR("com.apple.coreduet.interactionStore")));
  +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:](_CDDiagnosticDataReporter, "setValue:forScalarKey:limitingSigDigs:", v7, v14, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_CDInteractionStore storage](self->_store, "storage"));
  -[CDPeopleDaemon logSizeOfStorage:](self, "logSizeOfStorage:", v15);

}

- (_CDInteractionStore)store
{
  return self->_store;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_PSSuggester)suggester
{
  return self->_suggester;
}

- (_PSEnsembleModel)ensembleModel
{
  return self->_ensembleModel;
}

- (_PSFamilyRecommender)familyRecommender
{
  return self->_familyRecommender;
}

- (BOOL)isKnowledgeAgent
{
  return self->_isKnowledgeAgent;
}

- (void)setIsKnowledgeAgent:(BOOL)a3
{
  self->_isKnowledgeAgent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSuggester, 0);
  objc_storeStrong((id *)&self->_messagesPinningSuggester, 0);
  objc_storeStrong((id *)&self->_familyRecommender, 0);
  objc_storeStrong((id *)&self->_ensembleModel, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_appExtensionQueue, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_dataProtection, 0);
  objc_storeStrong((id *)&self->_advisor, 0);
}

@end
