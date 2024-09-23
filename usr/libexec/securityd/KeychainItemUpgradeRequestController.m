@implementation KeychainItemUpgradeRequestController

- (KeychainItemUpgradeRequestController)initWithLockStateTracker:(id)a3
{
  id v5;
  KeychainItemUpgradeRequestController *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  OctagonStateMachine *v11;
  void *v12;
  void *v13;
  void *v14;
  OctagonStateMachine *v15;
  OctagonStateMachine *stateMachine;
  CKKSNearFutureScheduler *v17;
  CKKSNearFutureScheduler *v18;
  CKKSNearFutureScheduler *persistentReferenceUpgrader;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;
  const __CFString *v25;
  _QWORD v26[4];
  _QWORD v27[4];

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)KeychainItemUpgradeRequestController;
  v6 = -[KeychainItemUpgradeRequestController init](&v24, "init");
  if (v6)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("KeychainItemUpgradeControllerQueue", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_lockStateTracker, a3);
    v11 = [OctagonStateMachine alloc];
    v26[0] = CFSTR("nothing_to_do");
    v26[1] = CFSTR("wait_for_unlock");
    v27[0] = &off_10030AF88;
    v27[1] = &off_10030AFA0;
    v26[2] = CFSTR("upgrade_persistent_ref");
    v26[3] = CFSTR("wait_for_trigger");
    v27[2] = &off_10030AFB8;
    v27[3] = &off_10030AFD0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
    v25 = CFSTR("schedule_pref_upgrade");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
    v15 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:](v11, "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:", CFSTR("keychainitemupgrade"), v12, v14, CFSTR("upgrade_persistent_ref"), v6->_queue, v6, CFSTR("com.apple.security.keychainitemupgrade.state"), v5, 0);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v15;

    v17 = [CKKSNearFutureScheduler alloc];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001BA2B0;
    v21[3] = &unk_1002EB598;
    objc_copyWeak(&v22, &location);
    v18 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v17, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("persistent-ref-upgrader"), 5000000000, 300000000000, 0, 0, v21, 2.0);
    persistentReferenceUpgrader = v6->_persistentReferenceUpgrader;
    v6->_persistentReferenceUpgrader = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  OctagonPendingFlag *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  unsigned int v21;
  CFTypeRef v22;
  const void *v23;
  NSObject *v24;
  const void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  const void *v29;
  NSObject *v30;
  BOOL v32;
  char v33;
  const void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  const __CFString *v38;
  const __CFString *v39;
  CFTypeRef v40;
  unsigned __int8 v41;
  CFTypeRef cf;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  __int128 buf;
  BOOL (*v50)(uint64_t, uint64_t);
  void *v51;
  _QWORD *v52;
  uint64_t *v53;
  unsigned __int8 *v54;
  CFTypeRef *p_cf;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("wait_for_unlock")))
  {
    v12 = sub_10000EF14("keychainitemupgrade");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "waiting for unlock before continuing with state machine", (uint8_t *)&buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("wait-for-unlock"), CFSTR("nothing_to_do")));
    v15 = (OctagonPendingFlag *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonPendingFlag unlockDependency](v15, "unlockDependency"));
    objc_msgSend(v14, "addNullableDependency:", v16);

LABEL_5:
    goto LABEL_29;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("upgrade_persistent_ref")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("wait_for_trigger")))
    {
      v23 = sub_10000EF14("keychainitemupgrade");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "waiting for trigger to occur", (uint8_t *)&buf, 2u);
      }

      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("schedule_pref_upgrade")))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("schedule_pref_upgrade"));
        v25 = sub_10000EF14("keychainitemupgrade");
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "handling persistent ref flag, attempting to upgrade next batch", (uint8_t *)&buf, 2u);
        }

        goto LABEL_21;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("nothing_to_do")))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController persistentReferenceUpgrader](self, "persistentReferenceUpgrader"));
      objc_msgSend(v28, "cancel");

      if (objc_msgSend(v9, "_onqueueContains:", CFSTR("schedule_pref_upgrade")))
        objc_msgSend(v9, "_onqueueRemoveFlag:", CFSTR("schedule_pref_upgrade"));
      v29 = sub_10000EF14("keychainitemupgrade");
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "nothing to do", (uint8_t *)&buf, 2u);
      }

    }
    v14 = 0;
    goto LABEL_29;
  }
  v17 = sub_10000EF14("keychainitemupgrade");
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "upgrading persistent refs", (uint8_t *)&buf, 2u);
  }

  cf = 0;
  v43[0] = 0;
  v41 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2000000000;
  v48 = 0;
  v43[1] = v43;
  v43[2] = 0x2000000000;
  v44 = 0;
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 0x40000000;
  v50 = sub_100138300;
  v51 = &unk_1002E7C18;
  v52 = v43;
  v53 = &v45;
  v54 = &v41;
  p_cf = &cf;
  sub_100011A30(1, 1, 0, (uint64_t)&v44, (uint64_t)&buf);
  _Block_object_dispose(v43, 8);
  v19 = *((unsigned __int8 *)v46 + 24);
  _Block_object_dispose(&v45, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
  v21 = objc_msgSend(v20, "isLockedError:", cf);

  if (v21)
  {
    v15 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("schedule_pref_upgrade"), 1);
    objc_msgSend(v10, "_onqueueHandlePendingFlagLater:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("after-upgrade--attempt-wait-for-unlock"), CFSTR("wait_for_unlock")));
    v22 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v22);
    }
    goto LABEL_5;
  }
  v27 = v41;
  if (v41 && !cf)
  {
LABEL_21:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("upgrade-persistent-refs"), CFSTR("upgrade_persistent_ref")));
    goto LABEL_29;
  }
  if (cf)
    v32 = 1;
  else
    v32 = v19 == 0;
  v33 = !v32;
  v34 = sub_10000EF14("keychainitemupgrade");
  v35 = objc_claimAutoreleasedReturnValue(v34);
  v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (!v27 || (v33 & 1) != 0)
  {
    if (v36)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "finished upgrading items!", (uint8_t *)&buf, 2u);
    }

    v38 = CFSTR("nothing-to-do");
    v39 = CFSTR("nothing_to_do");
  }
  else
  {
    if (v36)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = cf;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "hit an error, triggering CKKSNFS: %@", (uint8_t *)&buf, 0xCu);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController persistentReferenceUpgrader](self, "persistentReferenceUpgrader"));
    objc_msgSend(v37, "trigger");

    v38 = CFSTR("wait-for-trigger");
    v39 = CFSTR("wait_for_trigger");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", v38, v39));
  v40 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v40);
  }
LABEL_29:

  return v14;
}

- (void)triggerKeychainItemUpdateRPC:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OctagonStateTransitionRequest *v11;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController stateMachine](self, "stateMachine"));
  objc_msgSend(v5, "startOperation");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController lockStateTracker](self, "lockStateTracker"));
    objc_msgSend(v7, "recheck");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionOperation named:entering:](OctagonStateTransitionOperation, "named:entering:", CFSTR("upgrade-persistent-ref"), CFSTR("upgrade_persistent_ref")));
  v15 = CFSTR("nothing_to_do");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

  v11 = [OctagonStateTransitionRequest alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController queue](self, "queue"));
  v13 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:](v11, "init:sourceStates:serialQueue:transitionOp:", CFSTR("request-item-upgrade"), v10, v12, v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainItemUpgradeRequestController stateMachine](self, "stateMachine"));
  objc_msgSend(v14, "handleExternalRequest:startTimeout:", v13, 10000000000);

  v4[2](v4, 0);
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKKSNearFutureScheduler)persistentReferenceUpgrader
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPersistentReferenceUpgrader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)haveRecordedDate
{
  return self->_haveRecordedDate;
}

- (void)setHaveRecordedDate:(BOOL)a3
{
  self->_haveRecordedDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistentReferenceUpgrader, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end
