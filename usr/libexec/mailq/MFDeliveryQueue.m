@implementation MFDeliveryQueue

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003400;
  block[3] = &unk_1000185F0;
  block[4] = a1;
  if (qword_10001EB70 != -1)
    dispatch_once(&qword_10001EB70, block);
  return (id)qword_10001EB68;
}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000034E4;
  block[3] = &unk_1000185F0;
  block[4] = a1;
  if (qword_10001EB80 != -1)
    dispatch_once(&qword_10001EB80, block);
  return (id)qword_10001EB78;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

- (MFDeliveryQueue)init
{
  MFDeliveryQueue *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *stateQueue;
  MFInvocationQueue *v8;
  MFInvocationQueue *jobQueue;
  uint64_t v10;
  NSHashTable *observers;
  uint64_t v12;
  EFScheduler *observationScheduler;
  NSMutableArray *v14;
  NSMutableArray *delayedMessages;
  uint64_t v16;
  EFScheduler *delayedMessageScheduler;
  void *v18;
  void *v19;
  NSObject *v20;
  unsigned int v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  __CFNotificationCenter *LocalCenter;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  _QWORD v38[4];
  MFDeliveryQueue *v39;
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  unsigned int v44;

  v40.receiver = self;
  v40.super_class = (Class)MFDeliveryQueue;
  v3 = -[MFDeliveryQueue init](&v40, "init");
  if (v3)
  {
    if ((+[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence") & 1) == 0)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("MFDeliveryQueue.m"), 149, CFSTR("App is in daemon mode, but accessing database"));

    }
    v3->_state = 2;
    -[MFDeliveryQueue setHasAdequateFreeSpace:](v3, "setHasAdequateFreeSpace:", 0);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.mobilemail.delivery", v5);
    stateQueue = v3->_stateQueue;
    v3->_stateQueue = (OS_dispatch_queue *)v6;

    v8 = (MFInvocationQueue *)objc_alloc_init((Class)MFInvocationQueue);
    jobQueue = v3->_jobQueue;
    v3->_jobQueue = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.MFDeliveryQueue.ObservationScheduler"), 17));
    observationScheduler = v3->_observationScheduler;
    v3->_observationScheduler = (EFScheduler *)v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    delayedMessages = v3->_delayedMessages;
    v3->_delayedMessages = v14;

    v3->_delayedMessagesLock._os_unfair_lock_opaque = 0;
    v16 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.MFDeliveryQueue.delayedMessagesScheduler"), 17));
    delayedMessageScheduler = v3->_delayedMessageScheduler;
    v3->_delayedMessageScheduler = (EFScheduler *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](v3, "_outboxStore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _messagesInProgress](v3, "_messagesInProgress"));
    if (objc_msgSend(v19, "count"))
    {
      v20 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 67109120;
        v44 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Resetting delivery state for %d messages", buf, 8u);
      }

      v41[0] = MessageIsBeingDelivered;
      v41[1] = MessageQueuedForDelivery;
      v42[0] = &__kCFBooleanFalse;
      v42[1] = &__kCFBooleanTrue;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
      v23 = objc_msgSend(v18, "setFlagsFromDictionary:forMessages:", v22, v19);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
    if (objc_msgSend(v24, "isNetworkReachable"))
      v25 = 4;
    else
      v25 = 0;
    *((_BYTE *)v3 + 56) = *((_BYTE *)v3 + 56) & 0xFB | v25;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v3, "_mailAccountsChanged:", ECMailAccountsDidChangeNotification, 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v3, "_queueProcessingDidFinish:", CFSTR("MFDeliveryQueueProcessingFinishedNotification"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v3, "_messagesCompacted:", MailMessageStoreMessagesCompacted, 0);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v3, (CFNotificationCallback)sub_100003B80, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
    objc_msgSend(v28, "addNetworkReachableObserver:selector:", v3, "_reachabilityChanged:");

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MFDiagnostics sharedController](MFDiagnostics, "sharedController"));
    objc_msgSend(v29, "addDiagnosticsGenerator:", v3);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentUser"));
    v32 = objc_msgSend(v31, "uid");
    LOBYTE(v32) = v32 == getuid();

    if ((v32 & 1) != 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue freeSpaceMonitor](v3, "freeSpaceMonitor"));
      objc_msgSend(v26, "addObserver:selector:name:object:", v3, "_freeSpaceStatusDidChange:", CFSTR("MFDiskFreeSpaceMonitorDidChangeNotification"), v33);

      v34 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Checking free space status", buf, 2u);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue freeSpaceMonitor](v3, "freeSpaceMonitor"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100003BF8;
      v38[3] = &unk_100018640;
      v39 = v3;
      objc_msgSend(v35, "getFreeSpaceStatusWithCompletionHandler:", v38);

    }
    else
    {
      v3->_state = 0;
      -[MFDeliveryQueue setHasAdequateFreeSpace:](v3, "setHasAdequateFreeSpace:", 2);
      -[MFDeliveryQueue _updateCounts](v3, "_updateCounts");
    }

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
  objc_msgSend(v3, "removeNetworkReachableObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFDeliveryQueue;
  -[MFDeliveryQueue dealloc](&v4, "dealloc");
}

+ (id)sharedDeliveryQueue
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003D98;
  block[3] = &unk_1000185F0;
  block[4] = a1;
  if (qword_10001EB88 != -1)
    dispatch_once(&qword_10001EB88, block);
  return (id)qword_10001EB90;
}

- (id)freeSpaceMonitor
{
  return +[MFDiskFreeSpaceMonitor defaultMonitor](MFDiskFreeSpaceMonitor, "defaultMonitor");
}

- (EDMessagePersistence)messagePersistence
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messagePersistence"));

  return (EDMessagePersistence *)v4;
}

- (BOOL)isReady
{
  return self->_state == 0;
}

- (BOOL)isProcessing
{
  return self->_state == 1;
}

- (BOOL)isSuspended
{
  return self->_state == 2;
}

- (BOOL)isBusy
{
  return -[MFDeliveryQueue isProcessing](self, "isProcessing") || self->_numberOfCurrentSynchronousDeliveries > 0;
}

- (void)processQueue
{
  -[MFDeliveryQueue processQueueAndPlaySoundOnSuccess:forceAll:](self, "processQueueAndPlaySoundOnSuccess:forceAll:", 0, 0);
}

- (void)processQueueAndPlaySoundOnSuccess:(BOOL)a3 forceAll:(BOOL)a4
{
  -[MFDeliveryQueue processQueueAndPlaySoundOnSuccess:forceAll:isUserRequested:](self, "processQueueAndPlaySoundOnSuccess:forceAll:isUserRequested:", a3, a4, 0);
}

- (void)processQueueAndPlaySoundOnSuccess:(BOOL)a3 forceAll:(BOOL)a4 isUserRequested:(BOOL)a5
{
  NSObject *stateQueue;
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;
  BOOL v9;

  stateQueue = self->_stateQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003F1C;
  v6[3] = &unk_100018668;
  v6[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_async(stateQueue, v6);
}

- (void)suspend
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000413C;
  block[3] = &unk_100018618;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)resume
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000042DC;
  block[3] = &unk_100018618;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_freeSpaceStatusDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue freeSpaceMonitor](self, "freeSpaceMonitor", a3));
  v5 = objc_msgSend(v4, "isFreeSpaceCritical");

  v6 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "low disk mode turned ON, stopping delivery", buf, 2u);
    }

    -[MFDeliveryQueue setHasAdequateFreeSpace:](self, "setHasAdequateFreeSpace:", 1);
    -[MFDeliveryQueue suspend](self, "suspend");
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "low disk mode turned OFF, resuming delivery", v8, 2u);
    }

    -[MFDeliveryQueue setHasAdequateFreeSpace:](self, "setHasAdequateFreeSpace:", 2);
    -[MFDeliveryQueue resume](self, "resume");
  }
}

- (unint64_t)numberOfPendingMessages
{
  return self->_messagesFromActiveAccounts;
}

- (id)append:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v8 = MessageQueuedForDelivery;
  v9 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _append:flags:](self, "_append:flags:", v4, v5));

  return v6;
}

- (id)deliverSynchronously:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _deliveryResultIfNotHasAdequateFreeSpace](self, "_deliveryResultIfNotHasAdequateFreeSpace"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxCopyFromMessageDelivery:](self, "_outboxCopyFromMessageDelivery:", v4));
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _deliverSynchronously:outboxCopy:](self, "_deliverSynchronously:outboxCopy:", v4, v8));

  }
  return v7;
}

- (id)_deliveryResultIfNotHasAdequateFreeSpace
{
  NSObject *v3;
  id v4;
  id v5;
  uint8_t v7[16];

  if ((id)-[MFDeliveryQueue hasAdequateFreeSpace](self, "hasAdequateFreeSpace") == (id)1)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Aborting synchronus delivery to inadequate free space", v7, 2u);
    }

    v4 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", NSPOSIXErrorDomain, 28, 0);
    v5 = objc_msgSend(objc_alloc((Class)EMMessageDeliveryResult), "initWithStatus:error:", 2, v4);

    return v5;
  }
  else
  {
    if (!-[MFDeliveryQueue hasAdequateFreeSpace](self, "hasAdequateFreeSpace"))
      -[MFDeliveryQueue suspend](self, "suspend");
    return 0;
  }
}

- (id)_outboxCopyFromMessageDelivery:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "message"));
  v8 = MessageIsBeingDelivered;
  v9 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _append:flags:](self, "_append:flags:", v4, v5));

  return v6;
}

- (id)_deliverSynchronously:(id)a3 outboxCopy:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  os_signpost_id_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  _QWORD v78[2];
  _QWORD v79[2];

  v6 = a3;
  v66 = a4;
  ++self->_numberOfCurrentSynchronousDeliveries;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
  v65 = (void *)v7;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountThatMessageIsFrom:includingInactive:](MailAccount, "accountThatMessageIsFrom:includingInactive:", v7, 1));
  v8 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue signpostLog](MFDeliveryQueue, "signpostLog"));
  v9 = -[MFDeliveryQueue signpostID](self, "signpostID");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    v72 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EMAIL DELIVERY", "Begin Delivery Message : %@", buf, 0xCu);
  }

  v10 = objc_opt_class(MFMailDropMailDelivery);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0
    || (v11 = objc_opt_class(MFLibraryMessage), (objc_opt_isKindOfClass(v7, v11) & 1) != 0)
    || (v12 = objc_opt_class(MFOutgoingMessage), (objc_opt_isKindOfClass(v7, v12) & 1) != 0))
  {
    v13 = v6;
  }
  else
  {
    v13 = +[MFMailDropMailDeliveryUI newWithMessage:](MFMailDropMailDeliveryUI, "newWithMessage:", v66);

    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setIsUserRequested:", 1);
    objc_msgSend(v13, "setArchiveAccount:", v64);
  }
  v78[0] = CFSTR("MFDeliveryQueueMonitorKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  v78[1] = CFSTR("MFDeliveryQueueMailboxKey");
  v79[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "mailbox"));
  v79[1] = v15;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 2));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("MFDeliveryQueueDeliverSynchronouslyStartNotification"), v63);

  objc_msgSend(v13, "setIsUserRequested:", 1);
  if (!v66)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to append message to outbox, continuing with delivery", buf, 2u);
    }

  }
  if ((*((_BYTE *)self + 56) & 4) == 0)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Network may not be reachable, but attempting delivery anyway", buf, 2u);
    }

  }
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10000547C;
  v68[3] = &unk_100018690;
  v19 = v66;
  v69 = v19;
  v61 = v62;
  v70 = v61;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deliverSynchronouslyWithCompletion:", v68));
  v20 = objc_opt_class(MFMailDropMailDelivery);
  if ((objc_opt_isKindOfClass(v13, v20) & 1) != 0)
  {
    v21 = v13;
    if (objc_msgSend(v67, "status") == (id)8)
      objc_msgSend(v21, "setMailDropState:", objc_msgSend(v67, "attributes"));
    v22 = objc_msgSend(v21, "mailDropState");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue messagePersistence](self, "messagePersistence"));
    objc_msgSend(v23, "setMailDropDeliveryState:forMessage:", v22, v19);

  }
  -[MFDeliveryQueue _logDeliveryResult:forMessage:account:](self, "_logDeliveryResult:forMessage:account:", v67, v65, v64);
  v24 = (uint64_t)objc_msgSend(v67, "status");
  if (v66)
    -[MFDeliveryQueue _setDeliveryFlag:state:](self, "_setDeliveryFlag:state:", v19, 0);
  if (objc_msgSend(v64, "supportsThreadOperations") && objc_msgSend(v13, "conversationFlags"))
  {
    v25 = objc_msgSend(v13, "originalConversationId");
    if (!v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "message"));
      v25 = objc_msgSend(v26, "messageIDHash");

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "persistence"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "conversationPersistence"));
    v30 = objc_msgSend(v13, "conversationFlags");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v25));
    v77 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));
    objc_msgSend(v29, "setPersistenceConversationFlags:forConversationIDs:reason:", v30, v32, 4);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v33, "postNotificationName:object:", CFSTR("MFDeliveryQueueDeliverSynchronouslyFinishNotification"), v63);

  if (v24 == 9)
  {
    v36 = objc_msgSend(v13, "retryCount");
    if ((uint64_t)v36 <= 0)
      v24 = 9;
    else
      v24 = 2;
    if (v66 && (uint64_t)v36 <= 0)
    {
      v76 = v19;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
      objc_msgSend(v61, "deleteMessages:moveToTrash:", v37, 0);

      v35 = 0;
      objc_msgSend(v61, "doCompact");
      v24 = 9;
      goto LABEL_49;
    }
  }
  else if (!v24)
  {
    v34 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Message delivery succeeded", buf, 2u);
    }

    if (v66)
    {
      v35 = 0;
      objc_msgSend(v61, "doCompact");
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v35 = 0;
    }
    goto LABEL_49;
  }
  v35 = 0;
  if (v24 != 4 && v24 != 9)
  {
    v38 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Message delivery failed", buf, 2u);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "error"));

    if (!v35)
    {
      v40 = MFLookupLocalizedString(CFSTR("FAILED_SEND"), CFSTR("Check the account settings for the outgoing server “%@”."), CFSTR("Delayed"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "hostname"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v43));

      v45 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", MFMessageErrorDomain, 1030, v44, v46, &off_100019B90));

    }
    if (v66)
    {
      v75 = v19;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v75, 1));
      objc_msgSend(v61, "setFlag:state:forMessages:", MessageQueuedForDelivery, 1, v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));
      objc_msgSend(v35, "setUserInfoObject:forKey:", v48, CFSTR("account"));

      -[MFDeliveryQueue _updateDeliveryInfoFromResult:forMessage:](self, "_updateDeliveryInfoFromResult:forMessage:", v67, v19);
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v19, "libraryID")));
      -[MFDeliveryQueue _setErrorForMessageLibraryID:error:](self, "_setErrorForMessageLibraryID:error:", v49, v35);

      -[MFDeliveryQueue _updateCounts](self, "_updateCounts");
      v24 = 6;
    }
  }
LABEL_49:
  --self->_numberOfCurrentSynchronousDeliveries;
  v50 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue signpostLog](MFDeliveryQueue, "signpostLog"));
  v51 = -[MFDeliveryQueue signpostID](self, "signpostID");
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    v52 = MFMessageDeliveryStatusString(objc_msgSend(v67, "status"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    *(_DWORD *)buf = 138412546;
    v72 = (uint64_t)v65;
    v73 = 2112;
    v74 = v53;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, v51, "EMAIL DELIVERY", "Delivered Message : %@ with result %@", buf, 0x16u);

  }
  if (v35)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "domain"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v54, objc_msgSend(v35, "code"), 0));

    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedDescription"));
    v57 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v55, NSUnderlyingErrorKey);
    if (v56)
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, NSLocalizedDescriptionKey);
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSError em_internalErrorWithReason:userInfo:](NSError, "em_internalErrorWithReason:userInfo:", CFSTR("Message delivery failed with underlying error"), v57));

  }
  else
  {
    v58 = 0;
  }
  v59 = objc_msgSend(objc_alloc((Class)EMMessageDeliveryResult), "initWithStatus:error:", v24, v58);

  return v59;
}

- (void)deliverAsynchronously:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  void *v13;
  DelayedMessage *v14;
  void *v15;
  DelayedMessage *v16;
  id v17;
  id v18;
  DelayedMessage *v19;
  _QWORD v20[4];
  DelayedMessage *v21;
  _QWORD v22[4];
  DelayedMessage *v23;
  id v24;
  id v25;
  void (**v26)(id, void *);
  id v27;
  _BYTE buf[12];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _deliveryResultIfNotHasAdequateFreeSpace](self, "_deliveryResultIfNotHasAdequateFreeSpace"));
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxCopyFromMessageDelivery:](self, "_outboxCopyFromMessageDelivery:", v6));
    if (v9)
    {
      v19 = objc_alloc_init(DelayedMessage);
      -[DelayedMessage setCompletion:](v19, "setCompletion:", v7);
      -[DelayedMessage setOutboxCopy:](v19, "setOutboxCopy:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"));
      objc_msgSend(v10, "retainAssertionWithIdentifier:", CFSTR("com.apple.message.delivery"));

      v11 = sub_1000059A8((uint64_t)self);
      v12 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deliver message asynchronously with delay: %f", buf, 0xCu);
      }

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue delayedMessageScheduler](self, "delayedMessageScheduler"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100005A48;
      v22[3] = &unk_1000186E0;
      objc_copyWeak(&v27, (id *)buf);
      v14 = v19;
      v23 = v14;
      v24 = v6;
      v25 = v9;
      v26 = v7;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "afterDelay:performBlock:", v22, v11));
      -[DelayedMessage setToken:](v14, "setToken:", v15);

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100005E80;
      v20[3] = &unk_100018708;
      v16 = v14;
      v21 = v16;
      sub_100005DE4((os_unfair_lock_s *)self, v20);
      -[MFDeliveryQueue notifyObserversOfDelayedMessagesDidChange:](self, "notifyObserversOfDelayedMessagesDidChange:", 1);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v17 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0);
      v18 = objc_msgSend(objc_alloc((Class)EMMessageDeliveryResult), "initWithStatus:error:", 2, v17);
      v7[2](v7, v18);

    }
  }

}

- (BOOL)cancelLastDelayedMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  void *v23;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100005D58;
  v17 = sub_100005D68;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006100;
  v12[3] = &unk_1000186B8;
  v12[4] = &v13;
  v12[5] = &v19;
  sub_100005DE4((os_unfair_lock_s *)self, v12);
  v3 = (void *)v14[5];
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "token"));
    objc_msgSend(v4, "cancel");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14[5], "outboxCopy"));
    v23 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_msgSend(v5, "deleteMessages:moveToTrash:", v7, 0);

    v8 = objc_msgSend(objc_alloc((Class)EMMessageDeliveryResult), "initWithStatus:error:", 4, 0);
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14[5], "completion"));
    ((void (**)(_QWORD, id))v9)[2](v9, v8);

    -[MFDeliveryQueue notifyObserversOfDelayedMessagesDidChange:](self, "notifyObserversOfDelayedMessagesDidChange:", *((_BYTE *)v20 + 24) == 0);
    v10 = v14[5] != 0;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (id)lastErrorForMessage:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *lastErrorForMessage;
  void *v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v5 = objc_msgSend(v4, "libraryID"),
        lastErrorForMessage = self->_lastErrorForMessage,
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v5)),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lastErrorForMessage, "objectForKey:", v7)),
        v7,
        !v8))
  {
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", NSClassFromString(CFSTR("MailAppController")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GENERIC_DELIVERY_ERROR_MESSAGE"), &stru_100019298, CFSTR("Main")));
    v12 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", MFMessageErrorDomain, 1030, v11, v13, &off_100019BB8));

  }
  return v8;
}

- (id)_outboxStore
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10001EBA0);
  if (!qword_10001EB98)
    goto LABEL_9;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10001EB98, "mailbox"));
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "isValid") & 1) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "detected stale store", v12, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, 0, qword_10001EB98);

    v7 = (void *)qword_10001EB98;
    qword_10001EB98 = 0;

  }
  if (qword_10001EB98)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001EBA0);
  }
  else
  {
LABEL_9:
    v8 = objc_claimAutoreleasedReturnValue(+[MailAccount outboxMessageStore:](MailAccount, "outboxMessageStore:", 1));
    v9 = (void *)qword_10001EB98;
    qword_10001EB98 = v8;

    objc_msgSend((id)qword_10001EB98, "openSynchronously");
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001EBA0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_flagsChanged:", MailMessageStoreMessageFlagsChanged, qword_10001EB98);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_messagesAdded:", MailMessageStoreMessagesAdded, qword_10001EB98);

  }
  return (id)qword_10001EB98;
}

- (id)_messagesInProgress
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
  v3 = objc_msgSend(v2, "copyOfAllMessagesWithOptions:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_filter:", &stru_100018748));
  return v4;
}

- (void)_setErrorForMessageLibraryID:(id)a3 error:(id)a4
{
  id v6;
  NSMutableDictionary *lastErrorForMessage;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  lastErrorForMessage = self->_lastErrorForMessage;
  if (v6)
  {
    if (!lastErrorForMessage)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_lastErrorForMessage;
      self->_lastErrorForMessage = v8;

      lastErrorForMessage = self->_lastErrorForMessage;
    }
    -[NSMutableDictionary setObject:forKey:](lastErrorForMessage, "setObject:forKey:", v6, v10);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](lastErrorForMessage, "removeObjectForKey:", v10);
  }

}

- (void)_setErrorForMessage:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector(v8, "libraryID") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "libraryID")));
    -[MFDeliveryQueue _setErrorForMessageLibraryID:error:](self, "_setErrorForMessageLibraryID:error:", v7, v6);

  }
}

- (void)_sendProcessingStartedNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v3 = a3;
  v6 = CFSTR("MFDeliveryQueueMonitorKey");
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("MFDeliveryQueueProcessingStartedNotification"), v4);

}

- (void)_sendProcessingFinishedNotificationWithSentMessages:(id)a3 failedMessages:(id)a4 playSound:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("sent"));
  objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("failed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("playSound"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MFDeliveryQueueProcessingFinishedNotification"), 0, v8);

}

- (void)_setDeliveryFlag:(id)a3 state:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
  -[MFDeliveryQueue mf_lock](self, "mf_lock");
  v9 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(v7, "setFlag:state:forMessages:", MessageIsBeingDelivered, v4, v8);

  -[MFDeliveryQueue mf_unlock](self, "mf_unlock");
}

- (void)_updateCounts
{
  id v2;
  unint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  MFDeliveryQueue *v14;
  NSObject *v16;
  unint64_t hasAdequateFreeSpace;
  NSObject *v18;
  unint64_t messagesFromActiveAccounts;
  NSObject *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  _BYTE v31[128];

  if (self->_hasAdequateFreeSpace)
  {
    v20 = objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
    -[MFDeliveryQueue mf_lock](self, "mf_lock");
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = -[NSObject copyOfAllMessagesWithOptions:](v20, "copyOfAllMessagesWithOptions:", 2048);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v2)
    {
      v3 = 0;
      v4 = 0;
      v5 = 0;
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (((unint64_t)objc_msgSend(v8, "messageFlags") & 0x4000000000) != 0)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountThatMessageIsFrom:includingInactive:](MailAccount, "accountThatMessageIsFrom:includingInactive:", v8, 1));
            v10 = v9;
            if (v9)
            {
              ++v4;
              v3 += objc_msgSend(v9, "isActive");
            }
            else
            {
              v11 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v28 = (unint64_t)v8;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "purging orphaned messsage: %@", buf, 0xCu);
              }

              if (!v5)
                v5 = objc_alloc_init((Class)NSMutableArray);
              objc_msgSend(v5, "addObject:", v8);
            }

          }
        }
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v2);

      if (v5)
      {
        v12 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v5, "count");
          *(_DWORD *)buf = 134217984;
          v28 = (unint64_t)v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Delete messagesToPurge: %lu before continuing", buf, 0xCu);
        }

        -[NSObject deleteMessages:moveToTrash:](v20, "deleteMessages:moveToTrash:", v5, 0);
        v14 = self;
        goto LABEL_26;
      }
    }
    else
    {

      v5 = 0;
      v4 = 0;
      v3 = 0;
    }
    v14 = self;
LABEL_26:
    if (v3 != v14->_messagesFromActiveAccounts)
    {
      v14->_messagesFromActiveAccounts = v3;
      -[MFDeliveryQueue notifyObserversOfUpdatedPendingMessageCount:](v14, "notifyObserversOfUpdatedPendingMessageCount:", v3);
    }
    -[MFDeliveryQueue mf_unlock](v14, "mf_unlock");
    v18 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      messagesFromActiveAccounts = self->_messagesFromActiveAccounts;
      *(_DWORD *)buf = 134218240;
      v28 = (unint64_t)v4;
      v29 = 2048;
      v30 = messagesFromActiveAccounts;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%lu message(s) total, %lu from active accounts", buf, 0x16u);
    }

    v16 = v20;
    goto LABEL_31;
  }
  v16 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    hasAdequateFreeSpace = self->_hasAdequateFreeSpace;
    *(_DWORD *)buf = 134217984;
    v28 = hasAdequateFreeSpace;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not updating counts - hasAdequateDiskSpace:%lu", buf, 0xCu);
  }
LABEL_31:

}

- (id)_append:(id)a3 flags:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  MessageDeliveryInfo *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
    objc_msgSend(v9, "setCanBeCancelled:", 0);

    -[MFDeliveryQueue mf_lock](self, "mf_lock");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageChangeManager"));

    v29 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailbox"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "addNewMessages:mailboxURL:userInitiated:", v11, v13, 0));

    v15 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = objc_msgSend(v14, "count");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%lu messages added", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));
    v26 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v18 = objc_msgSend(v8, "setFlagsFromDictionary:forMessages:", v7, v17);

    v19 = objc_alloc_init(MessageDeliveryInfo);
    -[MessageDeliveryInfo setMessageSize:](v19, "setMessageSize:", objc_msgSend(v16, "messageSize"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue messagePersistence](self, "messagePersistence"));
    objc_msgSend(v20, "setDeliveryInfo:forMessage:", v19, v16);

    v21 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v16, "libraryID");
      *(_DWORD *)buf = 134217984;
      v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Saved message to outbox (libraryId: %lld)", buf, 0xCu);
    }

    -[MFDeliveryQueue mf_unlock](self, "mf_unlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
    objc_msgSend(v23, "setCanBeCancelled:", 1);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_shouldSend:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v17;
  unsigned __int8 v18;
  char v19;
  int v20;
  _QWORD v21[2];

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "messageFlags") & 2) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "skipping message because it is marked as deleted", (uint8_t *)&v20, 2u);
    }
    goto LABEL_7;
  }
  if (((unint64_t)objc_msgSend(v6, "messageFlags") & 0x2000000000) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "skipping message because delivery is in progress", (uint8_t *)&v20, 2u);
    }
LABEL_7:

LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((objc_msgSend(v7, "forceAll") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue messagePersistence](self, "messagePersistence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deliveryInfoForMessage:", v6));

    if (v11)
    {
      if (objc_msgSend(v11, "lastStatus") == (id)7)
      {
        v12 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          v13 = "skipping message because last failure was permanent";
LABEL_20:
          v14 = v12;
          v15 = 2;
          goto LABEL_21;
        }
      }
      else
      {
        if ((uint64_t)objc_msgSend(v11, "numberOfFailures") < 10)
        {
          if (objc_msgSend(v11, "lastStatus") != (id)2
            || (unint64_t)objc_msgSend(v11, "messageSize") <= 0xA00000
            || ((v17 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance")), v18 = objc_msgSend(v17, "isFatPipe"), v17, (uint64_t)objc_msgSend(v11, "failedCellularAttempts") < 4)? (v19 = 1): (v19 = v18), (v19 & 1) != 0))
          {

            goto LABEL_4;
          }
          v12 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          v20 = 67109376;
          LODWORD(v21[0]) = 10485760;
          WORD2(v21[0]) = 1024;
          *(_DWORD *)((char *)v21 + 6) = 3;
          v13 = "skipping message because it is larger than %d bytes and had more than %d transient failures. It will onl"
                "y re-send once wifi becomes available";
          v14 = v12;
          v15 = 14;
          goto LABEL_21;
        }
        v12 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          v13 = "skipping message because maximum number of retries exceeded";
          goto LABEL_20;
        }
      }
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134217984;
        v21[0] = objc_msgSend(v6, "libraryID");
        v13 = "skipping message as no deliveryInfo metadata not found for libraryId: %lld";
        v14 = v12;
        v15 = 12;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);
      }
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_4:
  v8 = 1;
LABEL_24:

  return v8;
}

- (id)_sortedMessages
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
  -[MFDeliveryQueue mf_lock](self, "mf_lock");
  v4 = objc_msgSend(v3, "copyOfAllMessagesWithOptions:", 2048);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007650;
  v10[3] = &unk_100018770;
  v10[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_map:", v10));
  -[MFDeliveryQueue mf_unlock](self, "mf_unlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_1000187B0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_map:", &stru_1000187F0));
  v8 = objc_msgSend(v7, "mutableCopy");

  return v8;
}

- (void)_updateDeliveryInfoFromResult:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue messagePersistence](self, "messagePersistence"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deliveryInfoForMessage:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v9, "setLastAttempt:", v10);

  objc_msgSend(v9, "setLastStatus:", objc_msgSend(v6, "status"));
  objc_msgSend(v9, "setNumberOfFailures:", (char *)objc_msgSend(v9, "numberOfFailures") + 1);
  if (objc_msgSend(v9, "lastStatus") == (id)2)
  {
    objc_msgSend(v6, "duration");
    if (v11 > 0.0 && (objc_msgSend(v6, "isWifi") & 1) == 0)
      objc_msgSend(v9, "setFailedCellularAttempts:", (char *)objc_msgSend(v9, "failedCellularAttempts") + 1);
  }
  v12 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "delivery info for %@: %@", (uint8_t *)&v14, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue messagePersistence](self, "messagePersistence"));
  objc_msgSend(v13, "setDeliveryInfo:forMessage:", v9, v7);

}

- (void)_logDeliveryResult:(id)a3 forMessage:(id)a4 account:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v8;
    v29 = 2112;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "delivery result for %@: %@", buf, 0x16u);
  }

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "loggingIdentifier"));
  v12 = (void *)v11;
  v13 = CFSTR("nil");
  if (v11)
    v13 = (const __CFString *)v11;
  v26[0] = v13;
  v25[0] = CFSTR("account");
  v25[1] = CFSTR("status");
  v14 = MFMessageDeliveryStatusString(objc_msgSend(v7, "status"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v26[1] = v15;
  v25[2] = CFSTR("duration");
  objc_msgSend(v7, "duration");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2fs"), v16));
  v26[2] = v17;
  v25[3] = CFSTR("tx");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "bytesSent")));
  v26[3] = v18;
  v25[4] = CFSTR("wifi");
  v19 = NSStringFromBOOL(objc_msgSend(v7, "isWifi"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v26[4] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 5));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v21));

  +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", CFSTR("DELIVER"), v22);
  if (!objc_msgSend(v7, "status"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue deliveryHookResponder](self, "deliveryHookResponder"));
    objc_msgSend(v23, "deliveredMessage:account:", v8, v9);

  }
}

- (EDMessageDeliveryHookResponder)deliveryHookResponder
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hookRegistry"));

  return (EDMessageDeliveryHookResponder *)v4;
}

+ (id)newDeliveryObjectFactoryForMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  id v9;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagePersistence"));

  if (objc_msgSend(v6, "mailDropDeliveryStateForMessage:", v3))
    goto LABEL_4;
  v7 = objc_msgSend(v3, "mailDropDeliveryState");
  if (v7)
  {
    objc_msgSend(v6, "setMailDropDeliveryState:forMessage:", v7, v3);
LABEL_4:
    v8 = (id *)MFMailDropMailDeliveryUI_ptr;
    goto LABEL_5;
  }
  if (+[MFAttachmentPlaceholder hasPlaceholderRepresentation:](MFAttachmentPlaceholder, "hasPlaceholderRepresentation:", v3))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing placeholder delivery for message", buf, 2u);
    }
    v8 = (id *)MFPlaceholderMailDeliveryUI_ptr;
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Performing standard delivery for message", v12, 2u);
    }
    v8 = (id *)MFOutgoingMessageDelivery_ptr;
  }

LABEL_5:
  v9 = objc_msgSend(*v8, "newWithMessage:", v3);

  return v9;
}

- (void)_processQueueWithOptions:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  id v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  NSObject *v43;
  void *v44;
  void *v45;
  const char *v46;
  NSObject *v47;
  void *v49;
  NSObject *v50;
  id v51;
  id v52;
  _BOOL8 v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  uint8_t v67[4];
  uint64_t v68;
  uint8_t buf[4];
  _BYTE v70[24];
  __int16 v71;
  void *v72;

  v61 = a3;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _outboxStore](self, "_outboxStore"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  -[MFDeliveryQueue _sendProcessingStartedNotification:](self, "_sendProcessingStartedNotification:");
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _sortedMessages](self, "_sortedMessages"));
  v4 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v62, "count");
    v6 = objc_msgSend(v62, "count");
    v7 = CFSTR("messages");
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v70 = v5;
    *(_WORD *)&v70[4] = 2112;
    if (v6 == (id)1)
      v7 = CFSTR("message");
    *(_QWORD *)&v70[6] = v7;
    *(_WORD *)&v70[14] = 2112;
    *(_QWORD *)&v70[16] = v61;
    v71 = 2112;
    v72 = v62;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "processing %d outbox %@ (%@): %@", buf, 0x26u);
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"));
  objc_msgSend(v8, "retainAssertionWithIdentifier:", CFSTR("com.apple.message.delivery"));

  v9 = 1;
  v54 = MFMessageErrorDomain;
  while ((objc_msgSend(v62, "ef_isEmpty") & 1) == 0 && (*((_BYTE *)self + 56) & 3) == 0)
  {
    if (objc_msgSend(v63, "shouldCancel"))
    {
      v47 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v46 = "activity was cancelled (possible due to timed out power assertion)";
        goto LABEL_42;
      }
LABEL_43:

      break;
    }
    v10 = MFUserAgent();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (objc_msgSend(v11, "isMobileMail"))
    {
      v12 = (*((_BYTE *)self + 56) & 4) == 0;

      if (v12)
      {
        v47 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v46 = "network is not reachable, aborting queue processing";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v46, buf, 2u);
        }
        goto LABEL_43;
      }
    }
    else
    {

    }
    if (v9 == 1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "mailbox"));
      objc_msgSend(v63, "setMailbox:", v13);

      v14 = MFLookupLocalizedString(CFSTR("MF_SENDING_FORMAT"), CFSTR("Sending %@ of %@"), CFSTR("Message"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v63, "setDisplayName:maxCount:", v15, objc_msgSend(v62, "count"));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "ef_popElement"));
    objc_msgSend(v63, "setCurrentCount:", v9);
    if (-[MFDeliveryQueue _shouldSend:options:](self, "_shouldSend:options:", v16, v61))
    {
      -[MFDeliveryQueue _setDeliveryFlag:state:](self, "_setDeliveryFlag:state:", v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountThatMessageIsFrom:includingInactive:](MailAccount, "accountThatMessageIsFrom:includingInactive:", v16, 1));
      if (objc_msgSend(v17, "isActive"))
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deliveryAccount"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v18, "identifier"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", v19));

        if (!v20)
          v20 = v18;
        v58 = v20;
        v21 = objc_msgSend((id)objc_opt_class(self), "newDeliveryObjectFactoryForMessage:", v16);
        objc_msgSend(v21, "setAccount:", v20);
        objc_msgSend(v21, "setDelegate:", self);
        objc_msgSend(v21, "setArchiveAccount:", v17);
        objc_msgSend(v21, "setIsUserRequested:", objc_msgSend(v61, "isUserRequested"));
        v22 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_opt_class(v17);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v70 = v16;
          *(_WORD *)&v70[8] = 2112;
          *(_QWORD *)&v70[10] = v23;
          v24 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "sending %@ (account class: %@)", buf, 0x16u);

        }
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_100008B14;
        v64[3] = &unk_100018690;
        v65 = v60;
        v25 = v16;
        v66 = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deliverSynchronouslyWithCompletion:", v64));
        -[MFDeliveryQueue _logDeliveryResult:forMessage:account:](self, "_logDeliveryResult:forMessage:account:", v26, v25, v17);
        v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "account"));
        if (objc_msgSend(v26, "status"))
        {
          objc_msgSend(v57, "addObject:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "error"));
          -[MFDeliveryQueue _updateDeliveryInfoFromResult:forMessage:](self, "_updateDeliveryInfoFromResult:forMessage:", v26, v25);
          if (!v27)
          {
            v28 = MFLookupLocalizedString(CFSTR("FAILED_SEND"), CFSTR("Check the account settings for the outgoing server “%@”."), CFSTR("Delayed"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject hostname](v18, "hostname"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v30));

            v32 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v54, 1030, v31, v33, 0));

          }
          v34 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ef_publicDescription"));
            sub_10000D624(v35, v67, &v68, v34);
          }
          goto LABEL_33;
        }
        objc_msgSend(v56, "addObject:", v25);
        if (v59 == v58
          || (v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v58, "identifier")),
              v42 = v41 == 0,
              v41,
              v42))
        {
          v40 = 0;
        }
        else
        {
          v43 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v59, "ef_publicDescription"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v58, "ef_publicDescription"));
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v70 = v44;
            *(_WORD *)&v70[8] = 2112;
            *(_QWORD *)&v70[10] = v45;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "account %@{public} became an alternate for %@{public}", buf, 0x16u);

          }
          v34 = objc_claimAutoreleasedReturnValue(-[NSObject identifier](v58, "identifier"));
          objc_msgSend(v55, "setValue:forKey:", v59, v34);
          v27 = 0;
LABEL_33:

          v40 = v27;
        }
        objc_msgSend(v40, "setUserInfoObject:forKey:", v59, CFSTR("account"));

      }
      else
      {
        v36 = MFLookupLocalizedString(CFSTR("MF_FAILED_SEND_INACTIVE_ACCOUNT"), CFSTR("This account is inactive. Check the settings in Settings > Apps > Mail > Accounts."), CFSTR("Delayed"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v38 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v54, 1051, v37, v39, 0));

        objc_msgSend(v40, "setUserInfoObject:forKey:", v17, CFSTR("account"));
        v18 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "skipping message from  inactive account", buf, 2u);
        }
      }

      usleep(0x7A120u);
      -[MFDeliveryQueue _setDeliveryFlag:state:](self, "_setDeliveryFlag:state:", v16, 0);
      -[MFDeliveryQueue _setErrorForMessage:error:](self, "_setErrorForMessage:error:", v16, v40);
      objc_msgSend(v63, "setError:", 0);

    }
    ++v9;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"));
  objc_msgSend(v49, "releaseAssertionWithIdentifier:", CFSTR("com.apple.message.delivery"));

  v50 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = objc_msgSend(v56, "count");
    v52 = objc_msgSend(v57, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v70 = v51;
    *(_WORD *)&v70[8] = 2048;
    *(_QWORD *)&v70[10] = v52;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "done processing queue: %lu messages sent, %lu failures", buf, 0x16u);
  }

  objc_msgSend(v63, "reset");
  objc_msgSend(v60, "doCompact");
  if (objc_msgSend(v61, "playSound"))
    v53 = objc_msgSend(v56, "count") != 0;
  else
    v53 = 0;
  -[MFDeliveryQueue _sendProcessingFinishedNotificationWithSentMessages:failedMessages:playSound:](self, "_sendProcessingFinishedNotificationWithSentMessages:failedMessages:playSound:", v56, v57, v53);

}

- (void)setPercentDone:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  objc_msgSend(v4, "setPercentDoneOfCurrentItem:", a3);

}

- (void)_queueProcessingDidFinish:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C6C;
  block[3] = &unk_100018618;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_mailAccountsChanged:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MFDeliveryQueue *v9;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008DA8;
  v7[3] = &unk_100018818;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

- (void)_flagsChanged:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MFDeliveryQueue *v9;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008EE0;
  v7[3] = &unk_100018818;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

- (void)_messagesAdded:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009048;
  block[3] = &unk_100018618;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_reachabilityChanged:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *stateQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = objc_msgSend(v5, "isEqualToString:", CPNetworkObserverNetworkReachableNotification);

  if (v6)
  {
    stateQueue = self->_stateQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000918C;
    v8[3] = &unk_100018818;
    v8[4] = self;
    v9 = v4;
    dispatch_async(stateQueue, v8);

  }
}

- (void)_messagesCompacted:(id)a3
{
  void *v4;
  void *v5;
  NSObject *stateQueue;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", MailMessageStoreMessageKey));
  if (objc_msgSend(v5, "ef_any:", &stru_100018858))
  {
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000093D0;
    block[3] = &unk_100018618;
    block[4] = self;
    dispatch_async(stateQueue, block);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue observationScheduler](self, "observationScheduler"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009498;
  v7[3] = &unk_100018818;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue observationScheduler](self, "observationScheduler"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000095A8;
  v7[3] = &unk_100018818;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)notifyObserversOfUpdatedPendingMessageCount:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue observationScheduler](self, "observationScheduler"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009684;
  v6[3] = &unk_100018880;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)notifyObserversOfDelayedMessagesDidChange:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue observationScheduler](self, "observationScheduler"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009824;
  v6[3] = &unk_1000188A8;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)test_waitForObservers
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDeliveryQueue.m"), 1231, CFSTR("%s can only be called from unit tests"), "-[MFDeliveryQueue test_waitForObservers]");

  }
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue observationScheduler](self, "observationScheduler"));
  objc_msgSend(v4, "performSyncBlock:", &stru_1000188E8);

}

- (id)copyDiagnosticInformation
{
  id v3;
  NSString *v4;
  void *v5;
  int64_t state;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(v3, "addObject:", CFSTR("==== Outbox ===="));
  state = self->_state;
  v7 = CFSTR("MFDeliveryQueueStateReady");
  if (state == 1)
    v7 = CFSTR("MFDeliveryQueueStateProcessing");
  if (state == 2)
    v8 = CFSTR("MFDeliveryQueueStateSuspended");
  else
    v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  state: %@"), v8));
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(v3, "addObject:", CFSTR("==== Pending Messages (Sorted by Size) ===="));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFDeliveryQueue _sortedMessages](self, "_sortedMessages"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009BA0;
  v14[3] = &unk_100018910;
  v14[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_map:", v14));
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  return v12;
}

- (EFScheduler)observationScheduler
{
  return self->_observationScheduler;
}

- (void)setObservationScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_observationScheduler, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (EFScheduler)delayedMessageScheduler
{
  return self->_delayedMessageScheduler;
}

- (void)setDelayedMessageScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_delayedMessageScheduler, a3);
}

- (NSMutableArray)delayedMessages
{
  return self->_delayedMessages;
}

- (void)setDelayedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_delayedMessages, a3);
}

- (unint64_t)hasAdequateFreeSpace
{
  return self->_hasAdequateFreeSpace;
}

- (void)setHasAdequateFreeSpace:(unint64_t)a3
{
  self->_hasAdequateFreeSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedMessages, 0);
  objc_storeStrong((id *)&self->_delayedMessageScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_lastErrorForMessage, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end
