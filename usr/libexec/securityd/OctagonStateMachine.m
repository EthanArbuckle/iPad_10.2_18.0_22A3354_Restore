@implementation OctagonStateMachine

- (OctagonStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 unexpectedStateErrorDomain:(id)a9 lockStateTracker:(id)a10 reachabilityTracker:(id)a11
{
  OctagonStateMachine *v18;
  OctagonStateMachine *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSSet *allowableStates;
  NSOperationQueue *v24;
  NSOperationQueue *operationQueue;
  OctagonFlags *v26;
  OctagonFlags *currentFlags;
  uint64_t v28;
  NSOperation *holdStateMachineOperation;
  uint64_t v30;
  NSMutableSet *testHoldStates;
  NSMutableDictionary *v32;
  NSMutableDictionary *mutableStateConditions;
  void *v34;
  id v35;
  uint64_t v36;
  void *i;
  uint64_t v38;
  CKKSCondition *v39;
  void *v40;
  uint64_t v41;
  NSMutableArray *stateMachineRequests;
  uint64_t v43;
  NSMutableArray *stateMachineWatchers;
  uint64_t v45;
  NSMutableDictionary *pendingFlags;
  CKKSNearFutureScheduler *v47;
  void *v48;
  CKKSNearFutureScheduler *v49;
  CKKSNearFutureScheduler *pendingFlagsScheduler;
  void *v51;
  CKKSCondition *v52;
  CKKSCondition *paused;
  uint64_t v54;
  CKKSResultOperation *nextStateMachineCycleOperation;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id obj;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id location;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];

  v61 = a3;
  v65 = a4;
  v62 = a5;
  v60 = a6;
  v64 = a7;
  obj = a8;
  v57 = a9;
  v58 = a10;
  v59 = a11;
  v73.receiver = self;
  v73.super_class = (Class)OctagonStateMachine;
  v18 = -[OctagonStateMachine init](&v73, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_lockStateTracker, a10);
    objc_storeStrong((id *)&v19->_reachabilityTracker, a11);
    v19->_conditionChecksInFlight = 0;
    v19->_currentConditions = 0;
    v20 = objc_msgSend(v65, "mutableCopy");
    objc_msgSend(v20, "setObject:forKeyedSubscript:", &off_10030A718, CFSTR("not_started"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", &off_10030A730, CFSTR("halted"));
    objc_storeStrong((id *)&v19->_stateNumberMap, v20);
    objc_storeStrong((id *)&v19->_unexpectedStateErrorDomain, a9);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
    v22 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));
    allowableStates = v19->_allowableStates;
    v19->_allowableStates = (NSSet *)v22;

    objc_storeStrong((id *)&v19->_queue, a7);
    v24 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v24;

    v26 = -[OctagonFlags initWithQueue:flags:]([OctagonFlags alloc], "initWithQueue:flags:", v64, v62);
    currentFlags = v19->_currentFlags;
    v19->_currentFlags = v26;

    objc_storeWeak((id *)&v19->_stateEngine, obj);
    v28 = objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &stru_1002DEAE0));
    holdStateMachineOperation = v19->_holdStateMachineOperation;
    v19->_holdStateMachineOperation = (NSOperation *)v28;

    v30 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    testHoldStates = v19->_testHoldStates;
    v19->_testHoldStates = (NSMutableSet *)v30;

    v19->_halted = 0;
    v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableStateConditions = v19->_mutableStateConditions;
    v19->_mutableStateConditions = v32;

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v36)
            objc_enumerationMutation(v34);
          v38 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          v39 = objc_alloc_init(CKKSCondition);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine mutableStateConditions](v19, "mutableStateConditions"));
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, v38);

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v35);
    }

    -[OctagonStateMachine setCurrentState:](v19, "setCurrentState:", CFSTR("not_started"));
    v41 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    stateMachineRequests = v19->_stateMachineRequests;
    v19->_stateMachineRequests = (NSMutableArray *)v41;

    v43 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    stateMachineWatchers = v19->_stateMachineWatchers;
    v19->_stateMachineWatchers = (NSMutableArray *)v43;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v19->_allowPendingFlags = 1;
    v45 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pendingFlags = v19->_pendingFlags;
    v19->_pendingFlags = (NSMutableDictionary *)v45;

    v47 = [CKKSNearFutureScheduler alloc];
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-pending-flag"), v61, v57, v58));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10011C07C;
    v66[3] = &unk_1002EB598;
    objc_copyWeak(&v67, &location);
    v49 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v47, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", v48, 100000000, 0, 1006, v66);
    pendingFlagsScheduler = v19->_pendingFlagsScheduler;
    v19->_pendingFlagsScheduler = v49;

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("initialize"), v60));
    objc_msgSend(v51, "addDependency:", v19->_holdStateMachineOperation);
    -[NSOperationQueue addOperation:](v19->_operationQueue, "addOperation:", v51);
    v52 = objc_alloc_init(CKKSCondition);
    paused = v19->_paused;
    v19->_paused = v52;

    v54 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine createOperationToFinishAttempt:](v19, "createOperationToFinishAttempt:", v51));
    nextStateMachineCycleOperation = v19->_nextStateMachineCycleOperation;
    v19->_nextStateMachineCycleOperation = (CKKSResultOperation *)v54;

    -[NSOperationQueue addOperation:](v19->_operationQueue, "addOperation:", v19->_nextStateMachineCycleOperation);
    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);

  }
  return v19;
}

- (NSDictionary)stateConditions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10011B900;
  v11 = sub_10011B910;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011C02C;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)pendingFlagsString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));

  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlagsString](self, "pendingFlagsString"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (pending: %@)"), v5));

  }
  else
  {
    v6 = &stru_1002EE888;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonStateMachine(%@,%@,%@)>"), v7, v8, v6));

  return v9;
}

- (OctagonStateString)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;
  CKKSCondition *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = (unint64_t)a3;
  v7 = (void *)v6;
  if (v6 | (unint64_t)self->_currentState)
  {
    v16 = (id)v6;
    v8 = objc_msgSend((id)v6, "isEqualToString:");
    v7 = v16;
    if ((v8 & 1) == 0)
    {
      if (self->_currentState)
      {
        v9 = objc_alloc_init(CKKSCondition);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine mutableStateConditions](self, "mutableStateConditions"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, self->_currentState);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine allowableStates](self, "allowableStates"));
      v12 = objc_msgSend(v11, "containsObject:", v16);

      if ((v12 & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OctagonStateMachine.m"), 182, CFSTR("state machine tried to enter unknown state %@"), v16);

      }
      objc_storeStrong((id *)&self->_currentState, a3);
      v7 = v16;
      if (v16)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine mutableStateConditions](self, "mutableStateConditions"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v16));
        objc_msgSend(v14, "fulfill");

        v7 = v16;
      }
    }
  }

}

- (id)waitForState:(id)a3 wait:(unint64_t)a4
{
  OctagonStateString *v6;
  void *v7;
  void *v8;
  id v9;
  OctagonStateString *currentState;
  OctagonStateString *v11;

  v6 = (OctagonStateString *)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateConditions](self, "stateConditions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
  v9 = objc_msgSend(v8, "wait:", a4);

  currentState = v6;
  if (v9)
    currentState = self->_currentState;
  v11 = currentState;

  return v11;
}

- (id)_onqueueNextStateMachineTransition
{
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OctagonStateMachine halted](self, "halted"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("halted"));

    if ((v5 & 1) != 0)
      return 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("halt"), CFSTR("halted")));
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateMachineRequests](self, "stateMachineRequests"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceStates"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
          v15 = objc_msgSend(v13, "containsObject:", v14);

          if (v15)
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_onqueueStart"));
            if (v16)
            {
              v19 = (void *)v16;
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
              v21 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v20, CFSTR("state")));
              v22 = objc_claimAutoreleasedReturnValue(v21);

              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
                *(_DWORD *)buf = 138412546;
                v29 = v12;
                v30 = 2112;
                v31 = v23;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Running state machine request %@ (from %@)", buf, 0x16u);

              }
              goto LABEL_17;
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
          continue;
        break;
      }
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateEngine](self, "stateEngine"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_onqueueNextStateMachineTransition:flags:pendingFlags:", v17, v18, self));

LABEL_17:
  }
  return v19;
}

- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CKKSCondition *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine testHoldStates](self, "testHoldStates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
      v11 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v10, CFSTR("state")));
      v12 = objc_claimAutoreleasedReturnValue(v11);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "In test hold for state %@; pausing",
          buf,
          0xCu);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine paused](self, "paused"));
      objc_msgSend(v14, "fulfill");
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine _onqueueNextStateMachineTransition](self, "_onqueueNextStateMachineTransition"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
      v16 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v15, CFSTR("state")));
      v17 = objc_claimAutoreleasedReturnValue(v16);

      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          v30 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Beginning state transition attempt %@", buf, 0xCu);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine createOperationToFinishAttempt:](self, "createOperationToFinishAttempt:", v14));
        -[OctagonStateMachine setNextStateMachineCycleOperation:](self, "setNextStateMachineCycleOperation:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
        objc_msgSend(v20, "addOperation:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
        objc_msgSend(v14, "addNullableDependency:", v22);

        objc_msgSend(v14, "setQualityOfService:", 25);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
        objc_msgSend(v23, "addOperation:", v14);

        if (a3)
          goto LABEL_15;
        v24 = objc_alloc_init(CKKSCondition);
        -[OctagonStateMachine setPaused:](self, "setPaused:", v24);
      }
      else
      {
        if (v18)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "contentsAsString"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlagsString](self, "pendingFlagsString"));
          *(_DWORD *)buf = 138412802;
          v30 = v25;
          v31 = 2112;
          v32 = v27;
          v33 = 2112;
          v34 = v28;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "State machine rests (%@, f:[%@] p:[%@])", buf, 0x20u);

        }
        v24 = (CKKSCondition *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine paused](self, "paused"));
        -[CKKSCondition fulfill](v24, "fulfill");
      }

    }
LABEL_15:

  }
}

- (id)createOperationToFinishAttempt:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10011BBE4;
  v9[3] = &unk_1002EA8C8;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("octagon-state-follow-up"), v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
  objc_msgSend(v6, "addNullableDependency:", v7);

  objc_msgSend(v6, "addNullableDependency:", v5);
  objc_msgSend(v6, "setQualityOfService:", 25);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (void)pokeStateMachine
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011BBDC;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_onqueuePokeStateMachine
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[OctagonStateMachine _onqueueStartNextStateMachineOperation:](self, "_onqueueStartNextStateMachineOperation:", 0);
}

- (void)handleFlag:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011BBD0;
  block[3] = &unk_1002E9728;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_onqueueHandleFlag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
  objc_msgSend(v6, "_onqueueSetFlag:", v4);

  -[OctagonStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
}

- (void)handlePendingFlag:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011BBC4;
  block[3] = &unk_1002E9728;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_onqueueHandlePendingFlagLater:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011BBB8;
  v8[3] = &unk_1002E9728;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_onqueueHandlePendingFlag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flag"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "afterOperation"));
  if (v8)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10011BA84;
    v15 = &unk_1002EB598;
    objc_copyWeak(&v16, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v12));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "afterOperation", v12, v13, v14, v15));
    objc_msgSend(v9, "addNullableDependency:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
    objc_msgSend(v11, "addOperation:", v9);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  -[OctagonStateMachine _onqueueRecheckConditions](self, "_onqueueRecheckConditions");
  -[OctagonStateMachine _onqueueSendAnyPendingFlags](self, "_onqueueSendAnyPendingFlags");

}

- (void)disablePendingFlags
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011BA78;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)dumpPendingFlags
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10011B900;
  v11 = sub_10011B910;
  v12 = (id)0xAAAAAAAAAAAAAAAALL;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011B918;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)possiblePendingFlags
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  return v3;
}

- (void)_onqueueRecheckConditions
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  unsigned __int8 v13;
  char v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  unsigned int v18;
  void *v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  const void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[8];
  id location;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];

  v4 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[OctagonStateMachine allowPendingFlags](self, "allowPendingFlags"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
    v7 = objc_msgSend(v6, "copy");

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v11)
            objc_enumerationMutation(v8);
          v10 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "conditions");
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v9);

      if (v10)
      {
        v13 = -[OctagonStateMachine conditionChecksInFlight](self, "conditionChecksInFlight");
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        v14 = v10 & ~v13;
        if ((v14 & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
          v16 = v15 == 0;

          if (v16)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OctagonStateMachine.m"), 419, CFSTR("Must have a lock state tracker to wait for unlock"));

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
          v18 = objc_msgSend(v17, "isLocked");

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
            v20 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v19, CFSTR("pending-flag")));
            v21 = objc_claimAutoreleasedReturnValue(v20);

            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Waiting for unlock", buf, 2u);
            }

            -[OctagonStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[OctagonStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFELL);
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_10011B650;
            v45[3] = &unk_1002EB598;
            objc_copyWeak(&v46, &location);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v45));
            -[OctagonStateMachine setCheckUnlockOperation:](self, "setCheckUnlockOperation:", v22);

            -[OctagonStateMachine setConditionChecksInFlight:](self, "setConditionChecksInFlight:", -[OctagonStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "unlockDependency"));
            objc_msgSend(v23, "addNullableDependency:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            objc_msgSend(v26, "addOperation:", v27);

            objc_destroyWeak(&v46);
          }
          else
          {
            -[OctagonStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[OctagonStateMachine currentConditions](self, "currentConditions") | 1);
          }
        }
        if ((v14 & 2) != 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine reachabilityTracker](self, "reachabilityTracker"));
          v29 = v28 == 0;

          if (v29)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OctagonStateMachine.m"), 447, CFSTR("Must have a network reachability tracker to use network reachability pending flags"));

          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine reachabilityTracker](self, "reachabilityTracker"));
          v31 = objc_msgSend(v30, "currentReachability");

          if ((v31 & 1) != 0)
          {
            -[OctagonStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[OctagonStateMachine currentConditions](self, "currentConditions") | 2);
          }
          else
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
            v33 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v32, CFSTR("pending-flag")));
            v34 = objc_claimAutoreleasedReturnValue(v33);

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Waiting for network reachability", buf, 2u);
            }

            -[OctagonStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[OctagonStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFDLL);
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_10011B6D4;
            v43[3] = &unk_1002EB598;
            objc_copyWeak(&v44, &location);
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v43));
            -[OctagonStateMachine setCheckReachabilityOperation:](self, "setCheckReachabilityOperation:", v35);

            -[OctagonStateMachine setConditionChecksInFlight:](self, "setConditionChecksInFlight:", -[OctagonStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine reachabilityTracker](self, "reachabilityTracker"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "reachabilityDependency"));
            objc_msgSend(v36, "addNullableDependency:", v38);

            v39 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            objc_msgSend(v39, "addOperation:", v40);

            objc_destroyWeak(&v44);
          }
        }
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }
}

- (void)_onqueueSendAnyPendingFlags
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  const void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  void *v34;
  const void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  unint64_t v43;
  void *v44;
  char v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OctagonStateMachine allowPendingFlags](self, "allowPendingFlags"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
    v6 = objc_msgSend(v5, "copy");

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (!v8)
    {

      goto LABEL_37;
    }
    v9 = v8;
    v10 = 0;
    v45 = 0;
    v11 = *(_QWORD *)v49;
    obj = v7;
LABEL_4:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fireTime"));

      if (!v14)
      {
        v17 = 1;
        goto LABEL_16;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fireTime"));
      v16 = objc_msgSend(v15, "compare:", v47);

      v17 = v16 == (id)-1;
      if (v16 == (id)-1)
        break;
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fireTime"));
      v19 = v18;
      if (v10)
      {
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "earlierDate:", v18));

        v10 = (void *)v20;
LABEL_14:

        goto LABEL_16;
      }
      v17 = 0;
      v10 = (void *)v18;
LABEL_16:
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "afterOperation"));

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "afterOperation"));
        v26 = objc_msgSend(v25, "isFinished");

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
          v28 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v27, CFSTR("pending-flag")));
          v29 = objc_claimAutoreleasedReturnValue(v28);

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "afterOperation"));
            *(_DWORD *)buf = 138412546;
            v53 = v30;
            v54 = 2112;
            v55 = v31;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Operation has ended for pending flag %@: %@", buf, 0x16u);

          }
        }
        else
        {
          v17 = 0;
        }
      }
      if (!objc_msgSend(v13, "conditions"))
        goto LABEL_27;
      v32 = (unint64_t)objc_msgSend(v13, "conditions");
      v33 = (id)(-[OctagonStateMachine currentConditions](self, "currentConditions") & v32);
      if (v33 == objc_msgSend(v13, "conditions"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
        v35 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v34, CFSTR("pending-flag")));
        v36 = objc_claimAutoreleasedReturnValue(v35);

        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
          *(_DWORD *)buf = 138412290;
          v53 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Conditions are right for %@", buf, 0xCu);

        }
LABEL_27:
        if (v17)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
          objc_msgSend(v38, "_onqueueSetFlag:", v39);

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
          objc_msgSend(v40, "setObject:forKeyedSubscript:", 0, v41);

          v45 = 1;
        }
      }
      if (v9 == (id)++v12)
      {
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (!v9)
        {

          if (v10)
          {
            objc_msgSend(v10, "timeIntervalSinceDate:", v47);
            v43 = (unint64_t)(v42 * 1000000000.0);
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlagsScheduler](self, "pendingFlagsScheduler"));
            objc_msgSend(v44, "triggerAt:", v43);

            if ((v45 & 1) == 0)
            {
LABEL_38:

              return;
            }
LABEL_36:
            -[OctagonStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
            goto LABEL_38;
          }
          if ((v45 & 1) != 0)
            goto LABEL_36;
LABEL_37:
          v10 = 0;
          goto LABEL_38;
        }
        goto LABEL_4;
      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
    v22 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v21, CFSTR("pending-flag")));
    v19 = objc_claimAutoreleasedReturnValue(v22);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
      *(_DWORD *)buf = 138412290;
      v53 = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Delay has ended for pending flag %@", buf, 0xCu);

    }
    goto LABEL_14;
  }
}

- (void)testPauseStateMachineAfterEntering:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B610;
  block[3] = &unk_1002E9728;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)testReleaseStateMachinePause:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B504;
  block[3] = &unk_1002E9728;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)isPaused
{
  OctagonStateMachine *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011B4C8;
  v5[3] = &unk_1002EB140;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)startOperation
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B440;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)haltOperation
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B3A8;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  objc_msgSend(v4, "waitUntilFinished");

}

- (id)timeoutErrorForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateNumberMap](self, "stateNumberMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine unexpectedStateErrorDomain](self, "unexpectedStateErrorDomain"));
    v8 = objc_msgSend(v6, "integerValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current state: '%@'"), v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", v7, v8, v9));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)handleExternalRequest:(id)a3 startTimeout:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B214;
  block[3] = &unk_1002EB3B0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (void)registerStateTransitionWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B080;
  block[3] = &unk_1002EB3B0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (void)registerMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011B070;
  block[3] = &unk_1002EB3B0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "states"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    objc_msgSend(v6, "onqueueEnterState:", v10);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateMachineWatchers](self, "stateMachineWatchers"));
    objc_msgSend(v11, "addObject:", v6);

    -[OctagonStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
    if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v12 = dispatch_time(0, a4);
      v13 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10011AFFC;
      block[3] = &unk_1002EA8C8;
      objc_copyWeak(&v16, &location);
      v15 = v6;
      dispatch_after(v12, v13, block);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }

}

- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  OctagonStateTransitionRequest *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _BYTE buf[24];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
  v15 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v14, CFSTR("state-rpc")));
  v16 = objc_claimAutoreleasedReturnValue(v15);

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning a '%@' rpc", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v18, "recheck");

  }
  v19 = [OctagonStateTransitionRequest alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v21 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:](v19, "init:sourceStates:serialQueue:transitionOp:", v10, v12, v20, v11);

  -[OctagonStateMachine handleExternalRequest:startTimeout:](self, "handleExternalRequest:startTimeout:", v21, 30000000000);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-callback"), v10));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10011AEB0;
  v28[3] = &unk_1002DEB08;
  objc_copyWeak(&v32, (id *)buf);
  v23 = v10;
  v29 = v23;
  v24 = v11;
  v30 = v24;
  v25 = v13;
  v31 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", v22, v28));

  objc_msgSend(v26, "addDependency:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
  objc_msgSend(v27, "addOperation:", v26);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

}

- (void)setWatcherTimeout:(unint64_t)a3
{
  -[OctagonStateMachine setTimeout:](self, "setTimeout:", a3);
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("intial-transition-%@"), v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "initialState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", v14, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:](self, "doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:", v13, v12, v11, v16, v10));
  return v17;
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  OctagonStateTransitionRequest *v22;
  void *v23;
  id v24;
  OctagonStateTransitionWatcher *v25;
  void *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;

  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
  v18 = sub_10000EF90((const __CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v17, CFSTR("state-rpc")));
  v19 = objc_claimAutoreleasedReturnValue(v18);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Beginning a '%@' rpc", buf, 0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v21, "recheck");

  }
  v22 = [OctagonStateTransitionRequest alloc];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v24 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:](v22, "init:sourceStates:serialQueue:transitionOp:", v12, v16, v23, v14);

  v25 = [OctagonStateTransitionWatcher alloc];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("watcher-%@"), v12));
  v27 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:](v25, "initNamed:stateMachine:path:initialRequest:", v26, self, v15, v24);

  v28 = -[OctagonStateMachine timeout](self, "timeout");
  if (v28)
    v29 = v28;
  else
    v29 = 120000000000;
  -[OctagonStateMachine registerStateTransitionWatcher:startTimeout:](self, "registerStateTransitionWatcher:startTimeout:", v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-callback"), v12));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10011AD08;
  v40[3] = &unk_1002DEB30;
  v40[4] = self;
  v41 = v12;
  v42 = v27;
  v43 = v13;
  v31 = v13;
  v32 = v27;
  v33 = v12;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlockTakingSelf:](CKKSResultOperation, "named:withBlockTakingSelf:", v30, v40));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "result"));
  objc_msgSend(v34, "addDependency:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
  objc_msgSend(v36, "addOperation:", v34);

  v37 = -[OctagonStateMachine timeout](self, "timeout");
  if (v37)
    v38 = v37;
  else
    v38 = 120000000000;
  -[OctagonStateMachine handleExternalRequest:startTimeout:](self, "handleExternalRequest:startTimeout:", v24, v38);

  return v34;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (CKKSCondition)paused
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPaused:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)stateNumberMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)unexpectedStateErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 72, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 80, 1);
}

- (OctagonStateMachineEngine)stateEngine
{
  return (OctagonStateMachineEngine *)objc_loadWeakRetained((id *)&self->_stateEngine);
}

- (void)setStateEngine:(id)a3
{
  objc_storeWeak((id *)&self->_stateEngine, a3);
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMutableStateConditions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (OctagonFlags)currentFlags
{
  return (OctagonFlags *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSOperation)holdStateMachineOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setHoldStateMachineOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableSet)testHoldStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTestHoldStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CKKSResultOperation)nextStateMachineCycleOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNextStateMachineCycleOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableArray)stateMachineRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStateMachineRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableArray)stateMachineWatchers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStateMachineWatchers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (BOOL)allowPendingFlags
{
  return self->_allowPendingFlags;
}

- (void)setAllowPendingFlags:(BOOL)a3
{
  self->_allowPendingFlags = a3;
}

- (NSMutableDictionary)pendingFlags
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPendingFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (CKKSNearFutureScheduler)pendingFlagsScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPendingFlagsScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (unint64_t)conditionChecksInFlight
{
  return self->_conditionChecksInFlight;
}

- (void)setConditionChecksInFlight:(unint64_t)a3
{
  self->_conditionChecksInFlight = a3;
}

- (unint64_t)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(unint64_t)a3
{
  self->_currentConditions = a3;
}

- (NSOperation)checkUnlockOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCheckUnlockOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSOperation)checkReachabilityOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCheckReachabilityOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkReachabilityOperation, 0);
  objc_storeStrong((id *)&self->_checkUnlockOperation, 0);
  objc_storeStrong((id *)&self->_pendingFlagsScheduler, 0);
  objc_storeStrong((id *)&self->_pendingFlags, 0);
  objc_storeStrong((id *)&self->_stateMachineWatchers, 0);
  objc_storeStrong((id *)&self->_stateMachineRequests, 0);
  objc_storeStrong((id *)&self->_nextStateMachineCycleOperation, 0);
  objc_storeStrong((id *)&self->_testHoldStates, 0);
  objc_storeStrong((id *)&self->_holdStateMachineOperation, 0);
  objc_storeStrong((id *)&self->_currentFlags, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_mutableStateConditions, 0);
  objc_destroyWeak((id *)&self->_stateEngine);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_unexpectedStateErrorDomain, 0);
  objc_storeStrong((id *)&self->_stateNumberMap, 0);
  objc_storeStrong((id *)&self->_allowableStates, 0);
  objc_storeStrong((id *)&self->_paused, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
