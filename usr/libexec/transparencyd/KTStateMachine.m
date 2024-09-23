@implementation KTStateMachine

- (KTStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 idsConfigBag:(id)a11
{
  id v18;
  id v19;
  id v20;
  KTStateMachine *v21;
  KTStateMachine *v22;
  void *v23;
  uint64_t v24;
  NSSet *allowableStates;
  NSOperationQueue *v26;
  NSOperationQueue *operationQueue;
  KTFlags *v28;
  KTFlags *currentFlags;
  uint64_t v30;
  NSOperation *holdStateMachineOperation;
  uint64_t v32;
  NSMutableSet *testHoldStates;
  NSMutableDictionary *v34;
  NSMutableDictionary *mutableStateConditions;
  KTStateMachine *v36;
  uint64_t v37;
  NSMutableArray *stateMachineRequests;
  uint64_t v39;
  NSMutableArray *stateMachineWatchers;
  uint64_t v41;
  NSMutableDictionary *pendingFlags;
  KTNearFutureScheduler *v43;
  void *v44;
  KTNearFutureScheduler *v45;
  KTNearFutureScheduler *pendingFlagsScheduler;
  void *v47;
  KTCondition *v48;
  KTCondition *paused;
  uint64_t v50;
  KTResultOperation *nextStateMachineCycleOperation;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id location;
  _QWORD v62[4];
  KTStateMachine *v63;
  objc_super v64;
  _QWORD v65[3];

  v57 = a3;
  v18 = a4;
  v58 = a5;
  v56 = a6;
  v19 = a7;
  v20 = a8;
  v53 = a9;
  v54 = a10;
  v55 = a11;
  v64.receiver = self;
  v64.super_class = (Class)KTStateMachine;
  v21 = -[KTStateMachine init](&v64, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a3);
    objc_storeStrong((id *)&v22->_lockStateTracker, a9);
    objc_storeStrong((id *)&v22->_reachabilityTracker, a10);
    v22->_conditionChecksInFlight = 0;
    v22->_currentConditions = 0;
    v65[0] = CFSTR("not_started");
    v65[1] = CFSTR("halted");
    v65[2] = CFSTR("KTDisabled");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 3));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "setByAddingObjectsFromArray:", v23));
    allowableStates = v22->_allowableStates;
    v22->_allowableStates = (NSSet *)v24;

    objc_storeStrong((id *)&v22->_queue, a7);
    v26 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v22->_operationQueue;
    v22->_operationQueue = v26;

    v28 = -[KTFlags initWithQueue:flags:]([KTFlags alloc], "initWithQueue:flags:", v19, v58);
    currentFlags = v22->_currentFlags;
    v22->_currentFlags = v28;

    objc_storeWeak((id *)&v22->_stateEngine, v20);
    v30 = objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &stru_100246708));
    holdStateMachineOperation = v22->_holdStateMachineOperation;
    v22->_holdStateMachineOperation = (NSOperation *)v30;

    v32 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    testHoldStates = v22->_testHoldStates;
    v22->_testHoldStates = (NSMutableSet *)v32;

    v22->_halted = 0;
    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableStateConditions = v22->_mutableStateConditions;
    v22->_mutableStateConditions = v34;

    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100121990;
    v62[3] = &unk_100246730;
    v36 = v22;
    v63 = v36;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v62);
    -[KTStateMachine setCurrentState:](v36, "setCurrentState:", CFSTR("not_started"));
    v37 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    stateMachineRequests = v36->_stateMachineRequests;
    v36->_stateMachineRequests = (NSMutableArray *)v37;

    v39 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    stateMachineWatchers = v36->_stateMachineWatchers;
    v36->_stateMachineWatchers = (NSMutableArray *)v39;

    objc_storeStrong((id *)&v36->_idsConfigBag, a11);
    location = 0;
    objc_initWeak(&location, v36);
    v36->_allowPendingFlags = 1;
    v41 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pendingFlags = v36->_pendingFlags;
    v36->_pendingFlags = (NSMutableDictionary *)v41;

    v43 = [KTNearFutureScheduler alloc];
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-pending-flag"), v57));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100121A00;
    v59[3] = &unk_10023A970;
    objc_copyWeak(&v60, &location);
    v45 = -[KTNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v43, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", v44, 100000000, 0, 1, v59);
    pendingFlagsScheduler = v36->_pendingFlagsScheduler;
    v36->_pendingFlagsScheduler = v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("initialize"), v56));
    objc_msgSend(v47, "addDependency:", v22->_holdStateMachineOperation);
    -[NSOperationQueue addOperation:](v22->_operationQueue, "addOperation:", v47);
    v48 = objc_alloc_init(KTCondition);
    paused = v36->_paused;
    v36->_paused = v48;

    v50 = objc_claimAutoreleasedReturnValue(-[KTStateMachine createOperationToFinishAttempt:](v36, "createOperationToFinishAttempt:", v47));
    nextStateMachineCycleOperation = v36->_nextStateMachineCycleOperation;
    v36 = (KTStateMachine *)((char *)v36 + 128);
    v36->super.isa = (Class)v50;

    -[NSOperationQueue addOperation:](v22->_operationQueue, "addOperation:", v36->super.isa);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);

  }
  return v22;
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
  v10 = sub_100121B74;
  v11 = sub_100121B84;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100121B8C;
  v6[3] = &unk_100246758;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlagsString](self, "pendingFlagsString"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (pending: %@)"), v5));

  }
  else
  {
    v6 = &stru_1002508B8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTStateMachine(%@,%@,%@)>"), v7, v8, v6));

  return v9;
}

- (KTStateString)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;
  KTCondition *v9;
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
        v9 = objc_alloc_init(KTCondition);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine mutableStateConditions](self, "mutableStateConditions"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, self->_currentState);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine allowableStates](self, "allowableStates"));
      v12 = objc_msgSend(v11, "containsObject:", v16);

      if ((v12 & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KTStateMachine.m"), 172, CFSTR("state machine tried to enter unknown state %@"), v16);

      }
      objc_storeStrong((id *)&self->_currentState, a3);
      v7 = v16;
      if (v16)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine mutableStateConditions](self, "mutableStateConditions"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v16));
        objc_msgSend(v14, "fulfill");

        v7 = v16;
      }
    }
  }

}

- (id)waitForState:(id)a3 wait:(unint64_t)a4
{
  KTStateString *v6;
  void *v7;
  void *v8;
  id v9;
  KTStateString *currentState;
  KTStateString *v11;

  v6 = (KTStateString *)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateConditions](self, "stateConditions"));
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
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateMachine halted](self, "halted"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("halted"));

    if ((v5 & 1) != 0)
      return 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", CFSTR("halt"), CFSTR("halted")));
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateMachineRequests](self, "stateMachineRequests", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceStates"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
          v15 = objc_msgSend(v13, "containsObject:", v14);

          if (v15)
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_onqueueStart"));
            if (v16)
            {
              v19 = (void *)v16;
              if (qword_1002A7678 != -1)
                dispatch_once(&qword_1002A7678, &stru_100246778);
              v20 = (void *)qword_1002A7680;
              if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
              {
                v21 = v20;
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
                *(_DWORD *)buf = 138543618;
                v28 = v12;
                v29 = 2114;
                v30 = v22;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Running state machine request %{public}@ (from %{public}@)", buf, 0x16u);

              }
              goto LABEL_18;
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
          continue;
        break;
      }
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateEngine](self, "stateEngine"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_onqueueNextStateMachineTransition:flags:pendingFlags:", v17, v18, self));

LABEL_18:
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
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  KTCondition *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine testHoldStates](self, "testHoldStates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      if (qword_1002A7678 != -1)
        dispatch_once(&qword_1002A7678, &stru_100246798);
      v10 = (void *)qword_1002A7680;
      if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
        v27 = 138412290;
        v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "In test hold for state %@; pausing",
          (uint8_t *)&v27,
          0xCu);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine paused](self, "paused"));
      objc_msgSend(v13, "fulfill");
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine _onqueueNextStateMachineTransition](self, "_onqueueNextStateMachineTransition"));
      if (v13)
      {
        if (qword_1002A7678 != -1)
          dispatch_once(&qword_1002A7678, &stru_1002467B8);
        v14 = qword_1002A7680;
        if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 138543362;
          v28 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning state transition attempt %{public}@", (uint8_t *)&v27, 0xCu);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine createOperationToFinishAttempt:](self, "createOperationToFinishAttempt:", v13));
        -[KTStateMachine setNextStateMachineCycleOperation:](self, "setNextStateMachineCycleOperation:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
        objc_msgSend(v16, "addOperation:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
        objc_msgSend(v13, "addNullableDependency:", v18);

        objc_msgSend(v13, "setQualityOfService:", 25);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
        objc_msgSend(v19, "addOperation:", v13);

        if (a3)
          goto LABEL_21;
        v20 = objc_alloc_init(KTCondition);
        -[KTStateMachine setPaused:](self, "setPaused:", v20);
      }
      else
      {
        if (qword_1002A7678 != -1)
          dispatch_once(&qword_1002A7678, &stru_1002467D8);
        v21 = (void *)qword_1002A7680;
        if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentsAsString"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlagsString](self, "pendingFlagsString"));
          v27 = 138543874;
          v28 = v23;
          v29 = 2114;
          v30 = v25;
          v31 = 2114;
          v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "State machine rests (%{public}@, f:[%{public}@] p:[%{public}@])", (uint8_t *)&v27, 0x20u);

        }
        v20 = (KTCondition *)objc_claimAutoreleasedReturnValue(-[KTStateMachine paused](self, "paused"));
        -[KTCondition fulfill](v20, "fulfill");
      }

    }
LABEL_21:

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
  location = 0;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012276C;
  v9[3] = &unk_100246840;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", CFSTR("KT-state-follow-up"), v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
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

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122C90;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_onqueuePokeStateMachine
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[KTStateMachine _onqueueStartNextStateMachineOperation:](self, "_onqueueStartNextStateMachineOperation:", 0);
}

- (void)handleFlag:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122D68;
  block[3] = &unk_10023B3A8;
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
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
  objc_msgSend(v6, "_onqueueSetFlag:", v4);

  -[KTStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
}

- (void)handlePendingFlag:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122E74;
  block[3] = &unk_10023B3A8;
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
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100122F30;
  v8[3] = &unk_10023B3A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_onqueueCancelPendingFlag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
  objc_msgSend(v7, "_onqueueRemoveFlag:", v4);

}

- (void)cancelPendingFlag:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100123060;
  v7[3] = &unk_10023B3A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

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
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flag"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "afterOperation"));
  if (v8)
  {
    location = 0;
    objc_initWeak(&location, self);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_100123200;
    v15 = &unk_10023A970;
    objc_copyWeak(&v16, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v12));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "afterOperation", v12, v13, v14, v15));
    objc_msgSend(v9, "addNullableDependency:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
    objc_msgSend(v11, "addOperation:", v9);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  -[KTStateMachine _onqueueRecheckConditions](self, "_onqueueRecheckConditions");
  -[KTStateMachine _onqueueSendAnyPendingFlags](self, "_onqueueSendAnyPendingFlags");

}

- (void)disablePendingFlags
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001233B0;
  block[3] = &unk_10023A390;
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
  v10 = sub_100121B74;
  v11 = sub_100121B84;
  v12 = 0;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001234B4;
  v6[3] = &unk_10023D540;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)dumpCurrentFlags
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
  v10 = sub_100121B74;
  v11 = sub_100121B84;
  v12 = 0;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10012370C;
  v6[3] = &unk_10023D540;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
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
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  unsigned __int8 v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void **v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[8];
  id location;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v4 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[KTStateMachine allowPendingFlags](self, "allowPendingFlags"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
    v7 = objc_msgSend(v6, "copy");

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          v10 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "conditions");
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v9);

      if (v10)
      {
        v13 = -[KTStateMachine conditionChecksInFlight](self, "conditionChecksInFlight");
        location = 0;
        objc_initWeak(&location, self);
        v14 = v10 & ~v13;
        if ((v14 & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
          v16 = v15 == 0;

          if (v16)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KTStateMachine.m"), 438, CFSTR("Must have a lock state tracker to wait for unlock"));

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
          v18 = objc_msgSend(v17, "isLocked");

          if (v18)
          {
            if (qword_1002A7678 != -1)
              dispatch_once(&qword_1002A7678, &stru_100246880);
            v19 = qword_1002A7680;
            if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Waiting for unlock", buf, 2u);
            }
            -[KTStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[KTStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFELL);
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_100123E8C;
            v44[3] = &unk_10023A970;
            objc_copyWeak(&v45, &location);
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v44));
            -[KTStateMachine setCheckUnlockOperation:](self, "setCheckUnlockOperation:", v20);

            -[KTStateMachine setConditionChecksInFlight:](self, "setConditionChecksInFlight:", -[KTStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "unlockDependency"));
            objc_msgSend(v21, "addNullableDependency:", v23);

            v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            objc_msgSend(v24, "addOperation:", v25);

            objc_destroyWeak(&v45);
          }
          else
          {
            -[KTStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[KTStateMachine currentConditions](self, "currentConditions") | 1);
          }
        }
        if ((v14 & 2) != 0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine reachabilityTracker](self, "reachabilityTracker"));
          v27 = v26 == 0;

          if (v27)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KTStateMachine.m"), 468, CFSTR("Must have a network reachability tracker to use network reachability pending flags"));

          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine reachabilityTracker](self, "reachabilityTracker"));
          v29 = objc_msgSend(v28, "currentReachability");

          if ((v29 & 1) != 0)
          {
            -[KTStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[KTStateMachine currentConditions](self, "currentConditions") | 2);
          }
          else
          {
            if (qword_1002A7678 != -1)
              dispatch_once(&qword_1002A7678, &stru_1002468C0);
            v30 = qword_1002A7680;
            if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Waiting for network reachability", buf, 2u);
            }
            -[KTStateMachine setCurrentConditions:](self, "setCurrentConditions:", -[KTStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFDLL);
            v39 = _NSConcreteStackBlock;
            v40 = 3221225472;
            v41 = sub_100124024;
            v42 = &unk_10023A970;
            objc_copyWeak(&v43, &location);
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v39));
            -[KTStateMachine setCheckReachabilityOperation:](self, "setCheckReachabilityOperation:", v31, v39, v40, v41, v42);

            -[KTStateMachine setConditionChecksInFlight:](self, "setConditionChecksInFlight:", -[KTStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 2);
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine reachabilityTracker](self, "reachabilityTracker"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "reachabilityDependency"));
            objc_msgSend(v32, "addNullableDependency:", v34);

            v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            objc_msgSend(v35, "addOperation:", v36);

            objc_destroyWeak(&v43);
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
  KTStateMachine *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  KTStateMachine *v31;
  id v32;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  double v45;
  unint64_t v46;
  void *v47;
  __int128 v48;
  void *v49;
  char v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateMachine allowPendingFlags](v2, "allowPendingFlags"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](v2, "pendingFlags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
    v6 = objc_msgSend(v5, "copy");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v8 = v6;
    v51 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (!v51)
    {

      goto LABEL_41;
    }
    v10 = 0;
    v50 = 0;
    v11 = *(_QWORD *)v53;
    *(_QWORD *)&v9 = 138543618;
    v48 = v9;
LABEL_4:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fireTime", v48));

      if (!v14)
        goto LABEL_15;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fireTime"));
      v16 = objc_msgSend(v15, "compare:", v7);

      if (v16 == (id)-1)
        break;
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fireTime"));
      v18 = (void *)v17;
      if (v10)
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "earlierDate:", v17));

        v20 = 0;
        v10 = (void *)v19;
      }
      else
      {
        v20 = 0;
        v10 = (void *)v17;
      }
LABEL_16:
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "afterOperation"));

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "afterOperation"));
        v26 = objc_msgSend(v25, "isFinished");

        if (v26)
        {
          if (qword_1002A7678 != -1)
            dispatch_once(&qword_1002A7678, &stru_100246920);
          v27 = (void *)qword_1002A7680;
          if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
          {
            v28 = v27;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
            v49 = v10;
            v30 = v11;
            v31 = v2;
            v32 = v8;
            v33 = v7;
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "afterOperation"));
            *(_DWORD *)buf = v48;
            v57 = v29;
            v58 = 2114;
            v59 = v34;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Operation has ended for pending flag %{public}@: %{public}@", buf, 0x16u);

            v7 = v33;
            v8 = v32;
            v2 = v31;
            v11 = v30;
            v10 = v49;

          }
        }
        else
        {
          v20 = 0;
        }
      }
      if (!objc_msgSend(v13, "conditions"))
        goto LABEL_29;
      v35 = (unint64_t)objc_msgSend(v13, "conditions");
      v36 = (id)(-[KTStateMachine currentConditions](v2, "currentConditions") & v35);
      if (v36 == objc_msgSend(v13, "conditions"))
      {
        if (qword_1002A7678 != -1)
          dispatch_once(&qword_1002A7678, &stru_100246940);
        v37 = (void *)qword_1002A7680;
        if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
          *(_DWORD *)buf = 138543362;
          v57 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Conditions are right for %{public}@", buf, 0xCu);

        }
LABEL_29:
        if (v20)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](v2, "currentFlags"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
          objc_msgSend(v40, "_onqueueSetFlag:", v41);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](v2, "pendingFlags"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
          objc_msgSend(v42, "setObject:forKeyedSubscript:", 0, v43);

          v50 = 1;
        }
      }
      if (v51 == (id)++v12)
      {
        v44 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        v51 = v44;
        if (!v44)
        {

          if (v10)
          {
            objc_msgSend(v10, "timeIntervalSinceDate:", v7);
            v46 = (unint64_t)(v45 * 1000000000.0);
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlagsScheduler](v2, "pendingFlagsScheduler"));
            objc_msgSend(v47, "triggerAt:", v46);

            if ((v50 & 1) == 0)
            {
LABEL_42:

              return;
            }
LABEL_40:
            -[KTStateMachine _onqueuePokeStateMachine](v2, "_onqueuePokeStateMachine");
            goto LABEL_42;
          }
          if ((v50 & 1) != 0)
            goto LABEL_40;
LABEL_41:
          v10 = 0;
          goto LABEL_42;
        }
        goto LABEL_4;
      }
    }
    if (qword_1002A7678 != -1)
      dispatch_once(&qword_1002A7678, &stru_100246900);
    v21 = (void *)qword_1002A7680;
    if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flag"));
      *(_DWORD *)buf = 138543362;
      v57 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Delay has ended for pending flag %{public}@", buf, 0xCu);

    }
LABEL_15:
    v20 = 1;
    goto LABEL_16;
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
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124814;
  block[3] = &unk_10023B3A8;
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
  _QWORD block[4];
  id v8;
  KTStateMachine *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001248EC;
  block[3] = &unk_10023B3A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)isPaused
{
  KTStateMachine *v2;
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
  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100124AC4;
  v5[3] = &unk_100246758;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)waitToResting
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  do
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
    objc_msgSend(v3, "waitUntilFinished");

    v4 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100124BE8;
    v5[3] = &unk_100246758;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(v4, v5);

  }
  while (!*((_BYTE *)v7 + 24));
  _Block_object_dispose(&v6, 8);
}

- (void)startOperation
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124C90;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)haltOperation
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124D9C;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  objc_msgSend(v4, "waitUntilFinished");

}

- (void)handleExternalRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124ECC;
  block[3] = &unk_10023B3A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)registerStateTransitionWatcher:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124FA0;
  block[3] = &unk_10023B3A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)registerMultiStateArrivalWatcher:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125074;
  block[3] = &unk_10023B3A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "states"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    objc_msgSend(v4, "onqueueEnterState:", v9);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateMachineWatchers](self, "stateMachineWatchers"));
    objc_msgSend(v8, "addObject:", v4);

    -[KTStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
  }
}

- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  KTStateTransitionRequest *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (qword_1002A7678 != -1)
    dispatch_once(&qword_1002A7678, &stru_100246980);
  v14 = qword_1002A7680;
  if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning a '%{public}@' rpc", buf, 0xCu);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v16, "recheck");

  }
  v17 = [KTStateTransitionRequest alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v19 = -[KTStateTransitionRequest init:sourceStates:serialQueue:timeout:transitionOp:](v17, "init:sourceStates:serialQueue:timeout:transitionOp:", v10, v12, v18, 30000000000, v11);

  -[KTStateMachine handleExternalRequest:](self, "handleExternalRequest:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-callback"), v10));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001253FC;
  v26[3] = &unk_10023D6C0;
  v27 = v10;
  v28 = v11;
  v29 = v13;
  v21 = v13;
  v22 = v11;
  v23 = v10;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", v20, v26));

  objc_msgSend(v24, "addDependency:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
  objc_msgSend(v25, "addOperation:", v24);

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
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", v14, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:](self, "doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:", v13, v12, v11, v16, v10));
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
  NSObject *v18;
  void *v19;
  void *v20;
  KTStateTransitionRequest *v21;
  void *v22;
  id v23;
  KTStateTransitionWatcher *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v14;
  if (qword_1002A7678 != -1)
    dispatch_once(&qword_1002A7678, &stru_1002469C0);
  v18 = qword_1002A7680;
  if (os_log_type_enabled((os_log_t)qword_1002A7680, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Beginning a '%{public}@' rpc", buf, 0xCu);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v20, "recheck");

  }
  v21 = [KTStateTransitionRequest alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v23 = -[KTStateTransitionRequest init:sourceStates:serialQueue:timeout:transitionOp:](v21, "init:sourceStates:serialQueue:timeout:transitionOp:", v12, v13, v22, 30000000000, v15);

  v24 = [KTStateTransitionWatcher alloc];
  v40 = v13;
  v25 = v15;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("watcher-%@"), v12));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v28 = -[KTStateTransitionWatcher initNamed:serialQueue:path:initialRequest:](v24, "initNamed:serialQueue:path:initialRequest:", v26, v27, v17, v23);

  v29 = -[KTStateMachine timeout](self, "timeout");
  if (v29)
    v30 = v29;
  else
    v30 = 120000000000;
  v31 = objc_msgSend(v28, "timeout:", v30);
  -[KTStateMachine registerStateTransitionWatcher:](self, "registerStateTransitionWatcher:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-callback"), v12));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1001259E0;
  v41[3] = &unk_100246A08;
  v42 = v12;
  v43 = v28;
  v44 = v16;
  v33 = v16;
  v34 = v28;
  v35 = v12;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlockTakingSelf:](KTResultOperation, "named:withBlockTakingSelf:", v32, v41));

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "result"));
  objc_msgSend(v36, "addDependency:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
  objc_msgSend(v38, "addOperation:", v36);

  -[KTStateMachine handleExternalRequest:](self, "handleExternalRequest:", v23);
  return v36;
}

- (KTCondition)paused
{
  return (KTCondition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPaused:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 48, 1);
}

- (KTReachabilityTracker)reachabilityTracker
{
  return (KTReachabilityTracker *)objc_getProperty(self, a2, 56, 1);
}

- (KTStateMachineEngine)stateEngine
{
  return (KTStateMachineEngine *)objc_loadWeakRetained((id *)&self->_stateEngine);
}

- (void)setStateEngine:(id)a3
{
  objc_storeWeak((id *)&self->_stateEngine, a3);
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMutableStateConditions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (KTFlags)currentFlags
{
  return (KTFlags *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSOperation)holdStateMachineOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHoldStateMachineOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableSet)testHoldStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTestHoldStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (KTResultOperation)nextStateMachineCycleOperation
{
  return (KTResultOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextStateMachineCycleOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableArray)stateMachineRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStateMachineRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSMutableArray)stateMachineWatchers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setStateMachineWatchers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
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
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPendingFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (KTNearFutureScheduler)pendingFlagsScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPendingFlagsScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
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
  return (NSOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCheckUnlockOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSOperation)checkReachabilityOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCheckReachabilityOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSOperation)checkIDSDisableOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCheckIDSDisableOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (TransparencyIDSConfigBag)idsConfigBag
{
  return (TransparencyIDSConfigBag *)objc_getProperty(self, a2, 208, 1);
}

- (void)setIdsConfigBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsConfigBag, 0);
  objc_storeStrong((id *)&self->_checkIDSDisableOperation, 0);
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mutableStateConditions, 0);
  objc_destroyWeak((id *)&self->_stateEngine);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_allowableStates, 0);
  objc_storeStrong((id *)&self->_paused, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
