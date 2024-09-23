@implementation DMDConfigurationEngine

- (DMDConfigurationEngine)initWithDatabase:(id)a3 policyPersistence:(id)a4 activationManager:(id)a5
{
  id v10;
  id v11;
  id v12;
  DMDConfigurationEngine *v13;
  DMDConfigurationEngine *v14;
  CATOperationQueue *v15;
  CATOperationQueue *queue;
  NSString *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *organizationControllerByIdentifier;
  DMDEngineDatabaseInitializationOperation *v21;
  DMDEngineDatabaseInitializationOperation *databaseInitializationOperation;
  DMDEventSubscriptionManager *v23;
  DMDEventSubscriptionManager *eventSubscriptionManager;
  uint64_t v25;
  CATOperation *initializationOperation;
  void *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v35.receiver = self;
  v35.super_class = (Class)DMDConfigurationEngine;
  v13 = -[DMDConfigurationEngine init](&v35, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_database, a3);
    v15 = objc_opt_new(CATOperationQueue);
    queue = v14->_queue;
    v14->_queue = v15;

    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%p.configuration-engine"), objc_opt_class(v14), v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[CATOperationQueue setName:](v14->_queue, "setName:", v18);

    -[CATOperationQueue setMaxConcurrentOperationCount:](v14->_queue, "setMaxConcurrentOperationCount:", 1);
    -[CATOperationQueue setSuspended:](v14->_queue, "setSuspended:", 1);
    v19 = objc_opt_new(NSMutableDictionary);
    organizationControllerByIdentifier = v14->_organizationControllerByIdentifier;
    v14->_organizationControllerByIdentifier = v19;

    objc_storeStrong((id *)&v14->_activationPredicateObserverManager, a5);
    -[DMDActivationPredicateObserverManager setDelegate:](v14->_activationPredicateObserverManager, "setDelegate:", v14);
    v21 = objc_opt_new(DMDEngineDatabaseInitializationOperation);
    databaseInitializationOperation = v14->_databaseInitializationOperation;
    v14->_databaseInitializationOperation = v21;

    -[DMDEngineDatabaseOperation setDatabase:](v14->_databaseInitializationOperation, "setDatabase:", v10);
    objc_storeStrong((id *)&v14->_policyPersistence, a4);
    v23 = objc_opt_new(DMDEventSubscriptionManager);
    eventSubscriptionManager = v14->_eventSubscriptionManager;
    v14->_eventSubscriptionManager = v23;

    objc_initWeak(&location, v14);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100027B8C;
    v32[3] = &unk_1000BA7A0;
    objc_copyWeak(&v33, &location);
    -[DMDEventSubscriptionManager setEventsHandler:](v14->_eventSubscriptionManager, "setEventsHandler:", v32);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100027E24;
    v30[3] = &unk_1000BA7C8;
    objc_copyWeak(&v31, &location);
    v25 = objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v30));
    initializationOperation = v14->_initializationOperation;
    v14->_initializationOperation = (CATOperation *)v25;

    -[CATOperation addTarget:selector:forOperationEvents:](v14->_initializationOperation, "addTarget:selector:forOperationEvents:", v14, "initializationOperationDidFinish:", 6);
    -[CATOperation addDependency:](v14->_initializationOperation, "addDependency:", v14->_databaseInitializationOperation);
    -[CATOperationQueue addOperation:](v14->_queue, "addOperation:", v14->_databaseInitializationOperation);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    objc_msgSend(v27, "addOperation:", v14->_initializationOperation);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "operations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  v5 = DMFObjectDescription(self, CFSTR("Database:\n%@\nEngine operations:\n%@\nOrganizations:\n%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (void)setDeviceStateProvider:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_deviceStateProvider, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine databaseInitializationOperation](self, "databaseInitializationOperation"));
  objc_msgSend(v6, "setDeviceStateProvider:", v5);

}

- (void)resume
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  _QWORD v9[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 150, CFSTR("%@ must be called from the main thread"), v8);

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028060;
  v9[3] = &unk_1000BA4B0;
  v9[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v9));
  objc_msgSend(v4, "setQueuePriority:", 8);
  -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  objc_msgSend(v5, "setSuspended:", 0);

}

- (void)suspend
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  _QWORD v8[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 165, CFSTR("%@ must be called from the main thread"), v7);

  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000281E8;
  v8[3] = &unk_1000BA4B0;
  v8[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v8));
  objc_msgSend(v4, "setQueuePriority:", 8);
  -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v4);

}

- (void)handleCreateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  DMDEngineCreateConfigurationOrganizationOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    v8 = objc_opt_new(DMDEngineCreateConfigurationOrganizationOperation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v8, "setDatabase:", v9);

    -[DMDEngineCreateConfigurationOrganizationOperation setRequest:](v8, "setRequest:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "organizationIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "organizationDisplayName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Create organization %@ “%@” "), v10, v11));
    -[DMDEngineCreateConfigurationOrganizationOperation setName:](v8, "setName:", v12);

    -[DMDEngineCreateConfigurationOrganizationOperation setQueuePriority:](v8, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v8, v6);

  }
}

- (void)handleDeactivateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  DMDEngineDeactivateConfigurationOrganizationOperation *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    v8 = objc_opt_new(DMDEngineDeactivateConfigurationOrganizationOperation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v8, "setDatabase:", v9);

    -[DMDEngineDeactivateConfigurationOrganizationOperation setRequest:](v8, "setRequest:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Deactivate organization for %@"), v11));
    -[DMDEngineDeactivateConfigurationOrganizationOperation setName:](v8, "setName:", v10);

    -[DMDEngineDeactivateConfigurationOrganizationOperation setQueuePriority:](v8, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v8, v6);

  }
}

- (void)handleFetchConfigurationOrganizationsRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028558;
  v8[3] = &unk_1000BA7F0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

- (void)handleFetchStreamEvents:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002885C;
    v10[3] = &unk_1000BA840;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v10));
    objc_msgSend(v9, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v9);

  }
}

- (void)handleConfigurationSourceRegistrationRequest:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  DMDEngineRegisterConfigurationSourceOperation *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v10)
  {
    v9[2](v9, v10);
  }
  else
  {
    v11 = objc_opt_new(DMDEngineRegisterConfigurationSourceOperation);
    -[DMDEngineRegisterConfigurationSourceOperation setRequest:](v11, "setRequest:", v13);
    -[DMDEngineRegisterConfigurationSourceOperation setClientIdentifier:](v11, "setClientIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v11, "setDatabase:", v12);

    -[DMDEngineRegisterConfigurationSourceOperation setDelegate:](v11, "setDelegate:", self);
    -[DMDEngineRegisterConfigurationSourceOperation setQueuePriority:](v11, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v11, v9);

  }
}

- (void)handleSetDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  DMDEngineSetDeclarationsOperation *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    v9 = DMFConfigurationEngineLog(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));
      v14 = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Engine enqueuing operation to set declarations from %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v12 = objc_opt_new(DMDEngineSetDeclarationsOperation);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v12, "setDatabase:", v13);

    -[DMDEngineSetDeclarationsOperation setRequest:](v12, "setRequest:", v6);
    -[DMDEngineSetDeclarationsOperation setQueuePriority:](v12, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v12, v7);

  }
}

- (void)handleUpdateDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  DMDEngineUpdateDeclarationsOperation *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    v9 = DMFConfigurationEngineLog(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));
      v14 = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Engine enqueuing operation to update declarations from %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v12 = objc_opt_new(DMDEngineUpdateDeclarationsOperation);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v12, "setDatabase:", v13);

    -[DMDEngineUpdateDeclarationsOperation setRequest:](v12, "setRequest:", v6);
    -[DMDEngineUpdateDeclarationsOperation setQueuePriority:](v12, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v12, v7);

  }
}

- (void)handleFetchDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  DMDEngineFetchDeclarationsOperation *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    v9 = DMFConfigurationEngineLog(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));
      v14 = 138543362;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Engine enqueuing operation to fetch declarations for %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v12 = objc_opt_new(DMDEngineFetchDeclarationsOperation);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v12, "setDatabase:", v13);

    -[DMDEngineFetchDeclarationsOperation setRequest:](v12, "setRequest:", v6);
    -[DMDEngineFetchDeclarationsOperation setCompletionHandler:](v12, "setCompletionHandler:", v7);
    -[DMDEngineFetchDeclarationsOperation setQueuePriority:](v12, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v12);

  }
}

- (void)processDeclarationsForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  DMDConfigurationEngine *v16;
  id v17;
  void (**v18)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_100029168;
    v15 = &unk_1000BA840;
    v16 = self;
    v9 = v6;
    v17 = v9;
    v18 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v12));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Process Declarations for %@"), v9, v12, v13, v14, v15, v16));
    objc_msgSend(v10, "setName:", v11);

    objc_msgSend(v10, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v10);

  }
}

- (void)processStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  DMDEngineProcessStatusOperation *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    v9 = objc_opt_new(DMDEngineProcessStatusOperation);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v9, "setDatabase:", v10);

    -[DMDEngineProcessStatusOperation setOrganizationIdentifier:](v9, "setOrganizationIdentifier:", v6);
    -[DMDEngineProcessStatusOperation setQueuePriority:](v9, "setQueuePriority:", 4);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000295D4;
    v11[3] = &unk_1000BA1F8;
    v12 = v7;
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v9, v11);

  }
}

- (void)refreshStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  DMDEngineRefreshStatusOperation *v9;
  void *v10;
  DMDEngineRefreshStatusOperation *v11;
  _QWORD v12[4];
  DMDEngineRefreshStatusOperation *v13;
  void (**v14)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    v9 = objc_opt_new(DMDEngineRefreshStatusOperation);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v9, "setDatabase:", v10);

    -[DMDEngineRefreshStatusOperation setOrganizationIdentifier:](v9, "setOrganizationIdentifier:", v6);
    -[DMDEngineRefreshStatusOperation setQueuePriority:](v9, "setQueuePriority:", 4);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002976C;
    v12[3] = &unk_1000BA890;
    v13 = v9;
    v14 = v7;
    v11 = v9;
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v11, v12);

  }
}

- (void)handleUpdateCommandsRequest:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  DMDEngineUpdateCommandsOperation *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    v8 = objc_opt_new(DMDEngineUpdateCommandsOperation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v8, "setDatabase:", v9);

    -[DMDEngineUpdateCommandsOperation setRequest:](v8, "setRequest:", v10);
    -[DMDEngineUpdateCommandsOperation setQueuePriority:](v8, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v8, v6);

  }
}

- (void)handleInstallSubscriptionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  DMDConfigurationEngine *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029988;
  v11[3] = &unk_1000BA8B8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBackgroundTask:", v11);

}

- (void)handleRemoveSubscriptionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  DMDConfigurationEngine *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029D2C;
  v11[3] = &unk_1000BA8E0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBackgroundTask:", v11);

}

- (void)sendEvents:(id)a3 organizationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(id, void *);

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a5;
  if (!v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 487, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("organizationIdentifier"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A128;
    v17[3] = &unk_1000BA908;
    v17[4] = self;
    v13 = v10;
    v18 = v13;
    v20 = v11;
    v19 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v17));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Send Events for %@"), v13));
    objc_msgSend(v14, "setName:", v15);

    objc_msgSend(v14, "setQueuePriority:", 4);
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v14);

  }
}

- (void)initializationOperationDidFinish:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationOperation](self, "initializationOperation"));

  if (v5 == v4)
    -[DMDConfigurationEngine setInitializationOperation:](self, "setInitializationOperation:", 0);
}

- (void)databaseInitializationOperationDidFinish
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine databaseInitializationOperation](self, "databaseInitializationOperation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  -[DMDConfigurationEngine setDatabaseInitializationOperation:](self, "setDatabaseInitializationOperation:", 0);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeObjectForKey:", DMFErrorFailedConfigurationDatabaseStoreKey);
    objc_msgSend(v6, "removeObjectForKey:", NSUnderlyingErrorKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, objc_msgSend(v4, "code"), v6));
    -[DMDConfigurationEngine setInitializationError:](self, "setInitializationError:", v8);

    v10 = DMFConfigurationEngineLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100073338(v4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
    objc_msgSend(v12, "cancelAllOperations");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
    objc_msgSend(v13, "setSuspended:", 1);

    -[DMDConfigurationEngine delegateWillSuspend](self, "delegateWillSuspend");
  }
  else
  {
    -[DMDConfigurationEngine updateOrganizationControllers](self, "updateOrganizationControllers");
    -[DMDConfigurationEngine updateEventSubscriptions](self, "updateEventSubscriptions");
    -[DMDConfigurationEngine _cleanupOrphanedPolicies](self, "_cleanupOrphanedPolicies");
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_updateOrganizationControllers", CFSTR("DMDConfigurationOrganizationsDidChangeNotification"), 0);
  }

}

- (void)enqueueDatabaseModificationOperation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = objc_retainBlock(a4);
  objc_msgSend(v7, "addTarget:selector:forOperationEvents:userInfo:", self, "declarationModificationOperationDidFinish:completionHandler:", 6, v6);

  -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v7);
}

- (void)declarationModificationOperationDidFinish:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;

  if (a4)
  {
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "error"));
    (*((void (**)(id, void *))a4 + 2))(v7, v8);

  }
  -[DMDConfigurationEngine enqueueDeclarationProcessingOperationIfNeeded](self, "enqueueDeclarationProcessingOperationIfNeeded", a3);
}

- (void)enqueueDeclarationProcessingOperationIfNeeded
{
  void *v4;
  void *v5;
  DMDEngineDatabaseProcessingOperation *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  DMDEngineDatabaseProcessingOperation *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  DMDEngineDatabaseProcessingOperation *v27;
  id v28;
  id buf[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _BYTE v35[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));

  if (!v4)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 582, CFSTR("Cannot enqueue an operation if we failed to initialize the database."));

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  v6 = (DMDEngineDatabaseProcessingOperation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operations"));

  v7 = -[DMDEngineDatabaseProcessingOperation countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9);
      v11 = objc_opt_class(DMDEngineDatabaseProcessingOperation);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[DMDEngineDatabaseProcessingOperation countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    v13 = DMFConfigurationEngineLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Engine enqueuing operation to process pending declarations in database", (uint8_t *)buf, 2u);
    }

    v15 = objc_opt_new(DMDEngineDatabaseProcessingOperation);
    -[DMDEngineDatabaseProcessingOperation setQueuePriority:](v15, "setQueuePriority:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v15, "setDatabase:", v16);

    -[DMDEngineDatabaseProcessingOperation setDelegate:](v15, "setDelegate:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine deviceStateProvider](self, "deviceStateProvider"));
    -[DMDEngineDatabaseProcessingOperation setDeviceStateProvider:](v15, "setDeviceStateProvider:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine taskOperationProvider](self, "taskOperationProvider"));
    -[DMDEngineDatabaseProcessingOperation setTaskOperationProvider:](v15, "setTaskOperationProvider:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine activationPredicateObserverManager](self, "activationPredicateObserverManager"));
    -[DMDEngineDatabaseProcessingOperation setActivationPredicateObserverManager:](v15, "setActivationPredicateObserverManager:", v19);

    objc_initWeak(buf, self);
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_10002AB60;
    v26 = &unk_1000BA930;
    v6 = v15;
    v27 = v6;
    objc_copyWeak(&v28, buf);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", &v23));
    -[DMDEngineDatabaseProcessingOperation setQueuePriority:](v6, "setQueuePriority:", 0, v23, v24, v25, v26);
    objc_msgSend(v20, "addDependency:", v6);
    v34[0] = v6;
    v34[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
    -[DMDConfigurationEngine enqueueOperations:](self, "enqueueOperations:", v21);

    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
  }

}

- (void)enqueueOperation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));

  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 617, CFSTR("Cannot enqueue an operation if we failed to initialize the database."));

    if (v5)
      goto LABEL_3;
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 618, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  -[DMDConfigurationEngine enqueueOperations:](self, "enqueueOperations:", v7);

}

- (void)enqueueOperations:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));

  if (!v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 623, CFSTR("Cannot enqueue an operation if we failed to initialize the database."));

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationOperation](self, "initializationOperation", (_QWORD)v16));
        if (v13)
          objc_msgSend(v12, "addDependency:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  objc_msgSend(v14, "addOperations:waitUntilFinished:", v7, 0);

}

- (void)_updateOrganizationControllers
{
  -[DMDConfigurationEngine performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "updateOrganizationControllers", 0, 0);
}

- (void)updateOrganizationControllers
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  DMDConfigurationOrganizationController *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSString *v28;
  void *v29;
  id v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v28 = NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 638, CFSTR("%@ must be called from the main thread"), v29);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequest](DMDConfigurationOrganization, "fetchRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewContext"));
  v41 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v31, &v41));
  v30 = v41;

  if (!v6)
  {
    v8 = DMFConfigurationEngineLog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100073428(v30);

  }
  obj = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  objc_sync_enter(obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
  v12 = objc_msgSend(v11, "mutableCopy");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v38;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v13);
        v17 = -[DMDConfigurationOrganizationController initWithOrganization:delegate:]([DMDConfigurationOrganizationController alloc], "initWithOrganization:delegate:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v16), self);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](v17, "identifier"));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](v17, "identifier"));
        objc_msgSend(v12, "removeObject:", v20);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v14);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v21);
        v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
        objc_msgSend(v26, "removeObjectForKey:", v25);

        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v22);
  }

  objc_sync_exit(obj);
}

- (void)updateEventSubscriptions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSString *v19;
  void *v20;
  id v21;
  id v22;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 665, CFSTR("%@ must be called from the main thread"), v20);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEventSubscriptionRegistration fetchRequest](DMDEventSubscriptionRegistration, "fetchRequest"));
  objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", &off_1000C2AF0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewContext"));
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v4, &v22));
  v8 = v22;

  if (!v7)
  {
    v10 = DMFConfigurationEngineLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10007351C(v8);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine eventSubscriptionManager](self, "eventSubscriptionManager"));
  v21 = v8;
  v13 = objc_msgSend(v12, "setEventSubscriptionRegistrations:error:", v7, &v21);
  v14 = v21;

  if ((v13 & 1) == 0)
  {
    v16 = DMFConfigurationEngineLog(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000734A4(v14);

  }
}

- (void)_cleanupOrphanedPolicies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  NSMutableDictionary *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = (void *)os_transaction_create("com.apple.dmd.policy.cleanup.org");
  v4 = (void *)os_transaction_create("com.apple.dmd.policy.cleanup.declaration");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10002929C;
  v27 = sub_1000292AC;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10002929C;
  v21 = sub_1000292AC;
  v22 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewContext"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002B640;
  v16[3] = &unk_1000BA958;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v6, "performBlockAndWait:", v16);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine policyPersistence](self, "policyPersistence"));
  v8 = v24[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002BA04;
  v14[3] = &unk_1000BA980;
  v9 = v3;
  v15 = v9;
  objc_msgSend(v7, "removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:completionHandler:", v8, v14);
  v10 = v18[5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002BA5C;
  v12[3] = &unk_1000BA980;
  v11 = v4;
  v13 = v11;
  objc_msgSend(v7, "removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:completionHandler:", v10, v12);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

}

- (void)activationPredicateObserverManager:(id)a3 didObserveChangeForPredicateWithIdentifier:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError", a3, a4));
  if (!v5)
  {
    -[DMDConfigurationEngine enqueueDeclarationProcessingOperationIfNeeded](self, "enqueueDeclarationProcessingOperationIfNeeded");
    v5 = 0;
  }

}

- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *, Block_layout *);
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  DMDConfigurationEngine *v14;
  void (**v15)(id, _QWORD, void *, Block_layout *);

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *, Block_layout *))a4;
  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 757, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v9)
  {
    v8[2](v8, 0, v9, &stru_1000BA9C0);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002BC58;
    v12[3] = &unk_1000BA840;
    v13 = v7;
    v14 = self;
    v15 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDBlockOperation blockOperationWithBlock:](DMDBlockOperation, "blockOperationWithBlock:", v12));
    objc_msgSend(v10, "setQueuePriority:", 8);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:](self, "enqueueDatabaseModificationOperation:completionHandler:", v10, &stru_1000BAA78);

  }
}

- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  DMDConfigurationEngine *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 854, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C840;
  v13[3] = &unk_1000BA8B8;
  v15 = self;
  v16 = v8;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBackgroundTask:", v13);

}

- (id)engineProcessingOperation:(id)a3 enqueuedOperationsForOrganizationWithIdentifier:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "operations"));

  return v5;
}

- (id)engineProcessingOperation:(id)a3 assetResolverForOrganizationWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));

  objc_sync_exit(v8);
  return v10;
}

- (void)registerConfigurationSourceOperation:(id)a3 didUpdateRegistrationForConfigurationSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  DMDConfigurationOrganizationController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  NSString *v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;

  v7 = a3;
  v8 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v35 = NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationEngine.m"), 917, CFSTR("%@ must be called from the main thread"), v36);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "organizationIdentifier"));
  v12 = (DMDConfigurationOrganizationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "organizationIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewContext"));
    v37 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "executeFetchRequest:error:", v14, &v37));
    v18 = v37;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewContext"));
    objc_msgSend(v21, "refreshObject:mergeChanges:", v19, 0);

    v12 = -[DMDConfigurationOrganizationController initWithOrganization:delegate:]([DMDConfigurationOrganizationController alloc], "initWithOrganization:delegate:", v19, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](v12, "identifier"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController configurationSourceWithIdentifier:](v12, "configurationSourceWithIdentifier:", v24));

  if (v25)
  {
    v27 = DMFConfigurationEngineLog(v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      *(_DWORD *)buf = 138543362;
      v39 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Re-registering configuration source %{public}@", buf, 0xCu);

    }
    objc_msgSend(v25, "updateWithConfigurationSource:", v8);
  }
  else
  {
    v30 = DMFConfigurationEngineLog(v26);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      *(_DWORD *)buf = 138543362;
      v39 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Registering new configuration source %{public}@", buf, 0xCu);

    }
    v33 = -[DMDConfigurationOrganizationController registerConfigurationSource:](v12, "registerConfigurationSource:", v8);
  }

  objc_sync_exit(v9);
}

- (void)delegateDidResume
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "configurationEngineDidResume:") & 1) != 0)
    objc_msgSend(v3, "configurationEngineDidResume:", self);

}

- (void)delegateWillSuspend
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "configurationEngineWillSuspend:") & 1) != 0)
    objc_msgSend(v3, "configurationEngineWillSuspend:", self);

}

- (DMDPolicyPersistence)policyPersistence
{
  return (DMDPolicyPersistence *)objc_getProperty(self, a2, 8, 1);
}

- (DMDConfigurationEngineDelegate)delegate
{
  return (DMDConfigurationEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_taskOperationProvider, a3);
}

- (DMDActivationPredicateObserverManager)activationPredicateObserverManager
{
  return self->_activationPredicateObserverManager;
}

- (void)setActivationPredicateObserverManager:(id)a3
{
  objc_storeStrong((id *)&self->_activationPredicateObserverManager, a3);
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSError)initializationError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitializationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (DMDEngineDatabaseInitializationOperation)databaseInitializationOperation
{
  return self->_databaseInitializationOperation;
}

- (void)setDatabaseInitializationOperation:(id)a3
{
  objc_storeStrong((id *)&self->_databaseInitializationOperation, a3);
}

- (CATOperation)initializationOperation
{
  return self->_initializationOperation;
}

- (void)setInitializationOperation:(id)a3
{
  objc_storeStrong((id *)&self->_initializationOperation, a3);
}

- (NSMutableDictionary)organizationControllerByIdentifier
{
  return self->_organizationControllerByIdentifier;
}

- (void)setOrganizationControllerByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_organizationControllerByIdentifier, a3);
}

- (DMDEventSubscriptionManager)eventSubscriptionManager
{
  return self->_eventSubscriptionManager;
}

- (void)setEventSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventSubscriptionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_organizationControllerByIdentifier, 0);
  objc_storeStrong((id *)&self->_initializationOperation, 0);
  objc_storeStrong((id *)&self->_databaseInitializationOperation, 0);
  objc_storeStrong((id *)&self->_initializationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_activationPredicateObserverManager, 0);
  objc_storeStrong((id *)&self->_taskOperationProvider, 0);
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_policyPersistence, 0);
}

@end
