@implementation PCInterfaceUsabilityMonitor

- (BOOL)_isInterfaceUsable
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v3 = self->_isPathSatisfied && self->_linkQuality != -2;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v3;
}

+ (id)stringForLinkQuality:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = CFSTR("off");
  v4 = CFSTR("bad");
  v5 = CFSTR("good");
  if (a3 < 0x33)
    v5 = CFSTR("poor");
  if (a3 >= 0xB)
    v4 = v5;
  if (a3 >= -1)
    v3 = v4;
  if (a3 == -1)
    return CFSTR("unknown");
  else
    return (id)v3;
}

- (int)linkQuality
{
  int linkQuality;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  linkQuality = self->_linkQuality;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return linkQuality;
}

- (PCInterfaceUsabilityMonitor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PCInterfaceUsabilityMonitor.m"), 27, CFSTR("Must specify an interface identifier for PCInterfaceUsabilityMonitor"));

  return self;
}

- (PCInterfaceUsabilityMonitor)initWithInterfaceIdentifier:(int64_t)a3 delegateQueue:(id)a4
{
  id v7;
  PCInterfaceUsabilityMonitor *v8;
  PCInterfaceUsabilityMonitor *v9;
  NSRecursiveLock *v10;
  NSRecursiveLock *recursiveLock;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *scQueue;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PCInterfaceUsabilityMonitor;
  v8 = -[PCInterfaceUsabilityMonitor init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)a3 > 1)
    {

      v9 = 0;
    }
    else
    {
      v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
      recursiveLock = v9->_recursiveLock;
      v9->_recursiveLock = v10;

      objc_storeStrong((id *)&v9->_delegateQueue, a4);
      v9->_interfaceIdentifier = a3;
      v9->_linkQuality = -1;
      v9->_isPathSatisfied = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("com.apple.PersistentConnection.PCInterfaceUsabilityMonitor-SCDynamicStore", v12);
      scQueue = v9->_scQueue;
      v9->_scQueue = (OS_dispatch_queue *)v13;

      -[PCInterfaceUsabilityMonitor _updatePathParameters](v9, "_updatePathParameters");
    }
  }

  return v9;
}

- (void)dealloc
{
  __CFString *lqKey;
  objc_super v4;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_dynamicStore)
    -[PCInterfaceUsabilityMonitor _unscheduleLinkQualityMonitor](self, "_unscheduleLinkQualityMonitor");
  if (self->_evaluator)
    -[PCInterfaceUsabilityMonitor _unschedulePathEvaluator](self, "_unschedulePathEvaluator");
  lqKey = self->_lqKey;
  if (lqKey)
    CFRelease(lqKey);
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  v4.receiver = self;
  v4.super_class = (Class)PCInterfaceUsabilityMonitor;
  -[PCInterfaceUsabilityMonitor dealloc](&v4, sel_dealloc);
}

- (id)currentInterfaceName
{
  NSObject *lastInterface;
  void *v4;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  lastInterface = self->_lastInterface;
  if (lastInterface)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_interface_get_name(lastInterface));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v4;
}

- (void)_updateOffTransitionsForLinkQualityChange
{
  NSMutableArray *offTransitions;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_trackUsability)
  {
    if (self->_linkQuality == -2)
    {
      offTransitions = self->_offTransitions;
      if (!offTransitions)
      {
        v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v5 = self->_offTransitions;
        self->_offTransitions = v4;

        offTransitions = self->_offTransitions;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray insertObject:atIndex:](offTransitions, "insertObject:atIndex:", v6, 0);

    }
    -[PCInterfaceUsabilityMonitor _flushStaleTransitions](self, "_flushStaleTransitions");
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)_flushStaleTransitions
{
  void *v3;
  unint64_t thresholdOffTransitionCount;
  unint64_t v5;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  void *v9;
  double v10;
  NSMutableArray *v11;
  NSMutableArray *offTransitions;
  NSMutableArray *v13;

  v3 = (void *)MEMORY[0x1D17A4604](self, a2);
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_trackUsability)
  {
    thresholdOffTransitionCount = self->_thresholdOffTransitionCount;
    v5 = -[NSMutableArray count](self->_offTransitions, "count");
    if (thresholdOffTransitionCount >= v5)
      v6 = v5;
    else
      v6 = thresholdOffTransitionCount;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_thresholdOffTransitionCount);
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = 0;
      while (1)
      {
        -[NSMutableArray objectAtIndex:](self->_offTransitions, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        if (self->_trackedTimeInterval <= -v10)
          break;
        -[NSMutableArray addObject:](v7, "addObject:", v9);

        if (v6 == ++v8)
          goto LABEL_12;
      }

    }
LABEL_12:
    offTransitions = self->_offTransitions;
    self->_offTransitions = v7;
    v13 = v7;

    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }
  else
  {
    v11 = self->_offTransitions;
    self->_offTransitions = 0;

    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }
  objc_autoreleasePoolPop(v3);
}

- (void)setTrackUsability:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_trackUsability != v3)
  {
    self->_trackUsability = v3;
    if (v3)
    {
      if (!self->_thresholdOffTransitionCount)
        self->_thresholdOffTransitionCount = 2;
      if (self->_trackedTimeInterval == 0.0)
        self->_trackedTimeInterval = 600.0;
    }
    -[PCInterfaceUsabilityMonitor _flushStaleTransitions](self, "_flushStaleTransitions");
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)setThresholdOffTransitionCount:(unint64_t)a3
{
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_thresholdOffTransitionCount != a3)
  {
    self->_thresholdOffTransitionCount = a3;
    -[PCInterfaceUsabilityMonitor _flushStaleTransitions](self, "_flushStaleTransitions");
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)setTrackedTimeInterval:(double)a3
{
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_trackedTimeInterval != a3)
  {
    self->_trackedTimeInterval = a3;
    -[PCInterfaceUsabilityMonitor _flushStaleTransitions](self, "_flushStaleTransitions");
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (BOOL)_isInterfaceHistoricallyUsable
{
  _BOOL4 v3;

  v3 = -[PCInterfaceUsabilityMonitor _isInterfaceUsable](self, "_isInterfaceUsable");
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_trackUsability)
  {
    -[PCInterfaceUsabilityMonitor _flushStaleTransitions](self, "_flushStaleTransitions");
    if (v3)
      LOBYTE(v3) = -[NSMutableArray count](self->_offTransitions, "count") < self->_thresholdOffTransitionCount;
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v3;
}

- (NSString)linkQualityString
{
  return (NSString *)+[PCInterfaceUsabilityMonitor stringForLinkQuality:](PCInterfaceUsabilityMonitor, "stringForLinkQuality:", -[PCInterfaceUsabilityMonitor linkQuality](self, "linkQuality"));
}

+ (BOOL)isPoorLinkQuality:(int)a3
{
  return a3 < 51;
}

- (BOOL)isPoorLinkQuality
{
  return objc_msgSend((id)objc_opt_class(), "isPoorLinkQuality:", -[PCInterfaceUsabilityMonitor linkQuality](self, "linkQuality"));
}

+ (BOOL)isBadLinkQuality:(int)a3
{
  return a3 < 11;
}

- (BOOL)isBadLinkQuality
{
  return objc_msgSend((id)objc_opt_class(), "isBadLinkQuality:", -[PCInterfaceUsabilityMonitor linkQuality](self, "linkQuality"));
}

- (BOOL)isInternetReachable
{
  BOOL isPathSatisfied;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  isPathSatisfied = self->_isPathSatisfied;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return isPathSatisfied;
}

- (int64_t)interfaceConstraint
{
  int64_t v3;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v3 = self->_interfaceConstraint != 0;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v3;
}

- (BOOL)isRadioHot
{
  return 0;
}

- (BOOL)isNetworkingPowerExpensiveToUse
{
  return 0;
}

- (int64_t)interfaceIdentifier
{
  int64_t interfaceIdentifier;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  interfaceIdentifier = self->_interfaceIdentifier;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return interfaceIdentifier;
}

- (PCInterfaceUsabilityMonitorDelegate)delegate
{
  void *v3;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  -[CUTWeakReference object](self->_delegateReference, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return (PCInterfaceUsabilityMonitorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  void *v4;
  CUTWeakReference *delegateReference;
  CUTWeakReference *v6;
  CUTWeakReference *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x1D17A4604]();
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  delegateReference = self->_delegateReference;
  self->_delegateReference = 0;

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v8);
    v6 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
    v7 = self->_delegateReference;
    self->_delegateReference = v6;

  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  objc_autoreleasePoolPop(v4);

}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4;
  CUTWeakReference *v5;
  OS_dispatch_queue *v6;
  BOOL v7;
  _QWORD v8[4];
  CUTWeakReference *v9;
  id v10;

  v4 = a3;
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v5 = self->_delegateReference;
  v6 = self->_delegateQueue;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PCInterfaceUsabilityMonitor__callDelegateWithBlock___block_invoke;
    v8[3] = &unk_1E8743638;
    v9 = v5;
    v10 = v4;
    dispatch_async((dispatch_queue_t)v6, v8);

  }
}

void __54__PCInterfaceUsabilityMonitor__callDelegateWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v2);
}

- (void)_unschedulePathEvaluator
{
  NSObject *v3;
  OS_nw_path_evaluator *evaluator;
  int v5;
  PCInterfaceUsabilityMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _unschedulePathEvaluatorOnIvarQueue", (uint8_t *)&v5, 0xCu);
  }

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_evaluator)
  {
    nw_path_evaluator_cancel();
    evaluator = self->_evaluator;
    self->_evaluator = 0;

  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)_createPathEvaluator
{
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *evaluator;
  void *v5;
  uint64_t v6;
  id v7;
  id location;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_evaluator)
  {
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }
  else
  {
    objc_initWeak(&location, self);
    evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
    evaluator = self->_evaluator;
    self->_evaluator = evaluator_for_endpoint;

    v6 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v7, &location);
    nw_path_evaluator_set_update_handler();
    v5 = (void *)nw_path_evaluator_copy_path();
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock", v6, 3221225472, __51__PCInterfaceUsabilityMonitor__createPathEvaluator__block_invoke, &unk_1E8743660);
    -[PCInterfaceUsabilityMonitor _pathUpdate:](self, "_pathUpdate:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __51__PCInterfaceUsabilityMonitor__createPathEvaluator__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_pathUpdate:", v5);

}

- (void)_pathUpdate:(id)a3
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  unsigned int is_ultra_constrained;
  int v9;
  OS_nw_interface **p_lastInterface;
  int v11;
  NSObject *v12;
  int64_t interfaceIdentifier;
  const __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *lastInterface;
  uint32_t index;
  const char *v19;
  uint32_t v20;
  OS_nw_interface **p_lastDelegateInterface;
  int v22;
  NSObject *v23;
  int64_t v24;
  const __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *lastDelegateInterface;
  const char *v29;
  uint32_t v30;
  const char *v31;
  uint32_t v32;
  int isPathSatisfied;
  NSObject *v34;
  int64_t v35;
  const __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  int v39;
  const char *v40;
  int v41;
  const char *v42;
  uint64_t reason_description;
  uint64_t v44;
  const char *name;
  int v46;
  int v47;
  int v48;
  NSObject *v49;
  nw_path_status_t status;
  NSObject *interface;
  _QWORD v52[5];
  _QWORD v53[5];
  uint8_t buf[4];
  PCInterfaceUsabilityMonitor *v55;
  __int16 v56;
  __CFString *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  _BYTE v61[20];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  status = nw_path_get_status(v4);
  v5 = status == nw_path_status_satisfied;
  v6 = nw_path_copy_interface();
  if (v6)
    interface = nw_interface_copy_delegate_interface();
  else
    interface = 0;
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (_os_feature_enabled_impl())
  {
    v7 = self->_interfaceConstraint != 0;
    is_ultra_constrained = nw_path_is_ultra_constrained();
    self->_interfaceConstraint = is_ultra_constrained;
    v9 = v7 ^ is_ultra_constrained;
  }
  else
  {
    v9 = 0;
  }
  p_lastInterface = &self->_lastInterface;
  v11 = nw_interface_shallow_compare();
  if ((v11 & 1) == 0)
  {
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      interfaceIdentifier = self->_interfaceIdentifier;
      v14 = CFSTR("unknown");
      if (interfaceIdentifier == 1)
        v14 = CFSTR("WWAN");
      if (interfaceIdentifier)
        v15 = (__CFString *)v14;
      else
        v15 = CFSTR("NonCellular");
      v16 = v15;
      lastInterface = self->_lastInterface;
      if (lastInterface)
      {
        name = nw_interface_get_name(lastInterface);
        if (*p_lastInterface)
          index = nw_interface_get_index((nw_interface_t)*p_lastInterface);
        else
          index = 0;
      }
      else
      {
        index = 0;
        name = "<none>";
      }
      v46 = v9;
      if (v6)
      {
        v19 = nw_interface_get_name(v6);
        v20 = nw_interface_get_index(v6);
      }
      else
      {
        v20 = 0;
        v19 = "<none>";
      }
      *(_DWORD *)buf = 138544642;
      v55 = self;
      v56 = 2114;
      v57 = v16;
      v58 = 2080;
      v59 = name;
      v60 = 1024;
      *(_DWORD *)v61 = index;
      *(_WORD *)&v61[4] = 2080;
      *(_QWORD *)&v61[6] = v19;
      *(_WORD *)&v61[14] = 1024;
      *(_DWORD *)&v61[16] = v20;
      _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ InterfaceUsabilityMonitor [%{public}@]: current interface changed from %s (%u) to %s (%u)", buf, 0x36u);

      v9 = v46;
      v5 = status == nw_path_status_satisfied;
    }

    objc_storeStrong((id *)&self->_lastInterface, v6);
  }
  p_lastDelegateInterface = &self->_lastDelegateInterface;
  if ((nw_interface_shallow_compare() & 1) != 0)
  {
    v22 = v11 ^ 1;
  }
  else
  {
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v5;
      v24 = self->_interfaceIdentifier;
      v25 = CFSTR("unknown");
      if (v24 == 1)
        v25 = CFSTR("WWAN");
      if (v24)
        v26 = (__CFString *)v25;
      else
        v26 = CFSTR("NonCellular");
      v27 = v26;
      lastDelegateInterface = self->_lastDelegateInterface;
      if (lastDelegateInterface)
      {
        v29 = nw_interface_get_name(lastDelegateInterface);
        if (*p_lastDelegateInterface)
          v30 = nw_interface_get_index((nw_interface_t)*p_lastDelegateInterface);
        else
          v30 = 0;
      }
      else
      {
        v30 = 0;
        v29 = "<none>";
      }
      v47 = v9;
      if (interface)
      {
        v31 = nw_interface_get_name(interface);
        v32 = nw_interface_get_index(interface);
      }
      else
      {
        v32 = 0;
        v31 = "<none>";
      }
      *(_DWORD *)buf = 138544642;
      v55 = self;
      v56 = 2114;
      v57 = v27;
      v58 = 2080;
      v59 = v29;
      v60 = 1024;
      *(_DWORD *)v61 = v30;
      *(_WORD *)&v61[4] = 2080;
      *(_QWORD *)&v61[6] = v31;
      *(_WORD *)&v61[14] = 1024;
      *(_DWORD *)&v61[16] = v32;
      _os_log_impl(&dword_1CBC1B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ InterfaceUsabilityMonitor [%{public}@]: current delegate interface changed from %s (%u) to %s (%u)", buf, 0x36u);

      v9 = v47;
      v5 = v48;
    }

    objc_storeStrong((id *)&self->_lastDelegateInterface, interface);
    v22 = 1;
  }
  isPathSatisfied = self->_isPathSatisfied;
  if (isPathSatisfied != v5)
  {
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = self->_interfaceIdentifier;
      v36 = CFSTR("unknown");
      if (v35 == 1)
        v36 = CFSTR("WWAN");
      if (v35)
        v37 = (__CFString *)v36;
      else
        v37 = CFSTR("NonCellular");
      v38 = v37;
      v49 = v6;
      v39 = v5;
      if (self->_isPathSatisfied)
        v40 = "satisfied";
      else
        v40 = "unsatisfied";
      v41 = v9;
      if (status == nw_path_status_satisfied)
        v42 = "satisfied";
      else
        v42 = "unsatisfied";
      reason_description = nw_path_get_reason_description();
      *(_DWORD *)buf = 138544386;
      v55 = self;
      v56 = 2114;
      v57 = v38;
      v58 = 2080;
      v59 = v40;
      v5 = v39;
      v6 = v49;
      v60 = 2080;
      *(_QWORD *)v61 = v42;
      v9 = v41;
      *(_WORD *)&v61[8] = 2080;
      *(_QWORD *)&v61[10] = reason_description;
      _os_log_impl(&dword_1CBC1B000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ InterfaceUsabilityMonitor [%{public}@]: path changed from %s to %s (%s)", buf, 0x34u);

    }
    self->_isPathSatisfied = v5;
  }
  if (!v22
    || (-[PCInterfaceUsabilityMonitor _unscheduleLinkQualityMonitor](self, "_unscheduleLinkQualityMonitor"),
        -[PCInterfaceUsabilityMonitor _createLinkQualityMonitor:](self, "_createLinkQualityMonitor:", 1)))
  {
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }
  v44 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke;
    v53[3] = &unk_1E8743688;
    v53[4] = self;
    -[PCInterfaceUsabilityMonitor _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v53);
  }
  if (isPathSatisfied != v5)
  {
    v52[0] = v44;
    v52[1] = 3221225472;
    v52[2] = __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke_2;
    v52[3] = &unk_1E8743688;
    v52[4] = self;
    -[PCInterfaceUsabilityMonitor _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v52);
  }

}

void __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceConstraintChanged:", *(_QWORD *)(a1 + 32));

}

void __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceReachabilityChanged:", *(_QWORD *)(a1 + 32));

}

- (void)_updatePathParameters
{
  OS_nw_parameters *v3;
  OS_nw_parameters *pathParameters;
  xpc_object_t v5;
  id v6;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  -[PCInterfaceUsabilityMonitor _unschedulePathEvaluator](self, "_unschedulePathEvaluator");
  v3 = (OS_nw_parameters *)nw_parameters_create();
  pathParameters = self->_pathParameters;
  self->_pathParameters = v3;

  if (self->_interfaceIdentifier)
  {
    nw_parameters_set_required_interface_type((nw_parameters_t)self->_pathParameters, nw_interface_type_cellular);
    if (_os_feature_enabled_impl())
      nw_parameters_set_allow_ultra_constrained();
  }
  else
  {
    v5 = xpc_array_create(0, 0);
    xpc_array_set_uint64(v5, 0xFFFFFFFFFFFFFFFFLL, 2uLL);
    nw_parameters_set_prohibited_interface_types();

  }
  v6 = xpc_array_create(0, 0);
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, 0x1389uLL);
  nw_parameters_set_prohibited_interface_subtypes();
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  -[PCInterfaceUsabilityMonitor _createPathEvaluator](self, "_createPathEvaluator");

}

- (void)_unscheduleLinkQualityMonitor
{
  const __SCDynamicStore *dynamicStore;
  __CFString *lqKey;

  dynamicStore = (const __SCDynamicStore *)self->_dynamicStore;
  if (dynamicStore)
  {
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
    CFRelease(self->_dynamicStore);
    self->_dynamicStore = 0;
  }
  lqKey = self->_lqKey;
  if (lqKey)
  {
    CFRelease(lqKey);
    self->_lqKey = 0;
  }
}

- (void)_processLinkQualityUpdateWithChangedKey:(id)a3 updatedLinkQuality:(int)a4
{
  uint64_t v4;
  id v6;
  __CFString *lqKey;
  NSObject *v8;
  int64_t interfaceIdentifier;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  OS_nw_interface *lastInterface;
  void *v14;
  void *v15;
  int linkQuality;
  _QWORD v17[5];
  int v18;
  uint8_t buf[4];
  PCInterfaceUsabilityMonitor *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  OS_nw_interface *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v4 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  lqKey = self->_lqKey;
  if (lqKey && CFEqual(v6, lqKey) && self->_linkQuality != (_DWORD)v4)
  {
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      interfaceIdentifier = self->_interfaceIdentifier;
      v10 = CFSTR("unknown");
      if (interfaceIdentifier == 1)
        v10 = CFSTR("WWAN");
      if (interfaceIdentifier)
        v11 = (__CFString *)v10;
      else
        v11 = CFSTR("NonCellular");
      v12 = v11;
      lastInterface = self->_lastInterface;
      +[PCInterfaceUsabilityMonitor stringForLinkQuality:](PCInterfaceUsabilityMonitor, "stringForLinkQuality:", self->_linkQuality);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PCInterfaceUsabilityMonitor stringForLinkQuality:](PCInterfaceUsabilityMonitor, "stringForLinkQuality:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v20 = self;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = lastInterface;
      v25 = 2114;
      v26 = v14;
      v27 = 2114;
      v28 = v15;
      v29 = 1024;
      v30 = v4;
      _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Interface Manager: %{public}@(%{public}@) LinkQuality changed from %{public}@ to %{public}@ (%d)", buf, 0x3Au);

    }
    linkQuality = self->_linkQuality;
    self->_linkQuality = v4;
    -[PCInterfaceUsabilityMonitor _updateOffTransitionsForLinkQualityChange](self, "_updateOffTransitionsForLinkQualityChange");
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__PCInterfaceUsabilityMonitor__processLinkQualityUpdateWithChangedKey_updatedLinkQuality___block_invoke;
    v17[3] = &unk_1E87436B0;
    v17[4] = self;
    v18 = linkQuality;
    -[PCInterfaceUsabilityMonitor _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);
  }
  else
  {
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }

}

void __90__PCInterfaceUsabilityMonitor__processLinkQualityUpdateWithChangedKey_updatedLinkQuality___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceLinkQualityChanged:previousLinkQuality:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

- (void)_dynamicStoreCallback:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  const __CFString *v10;
  CFPropertyListRef v11;
  NSObject *v12;
  CFTypeID v13;
  const __CFNumber *Value;
  const __CFNumber *v15;
  unint64_t v16;
  id v17;
  CFTypeID v18;
  BOOL v19;
  void *key;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  PCInterfaceUsabilityMonitor *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  CFPropertyListRef v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    key = (void *)*MEMORY[0x1E0CE8BA0];
    v8 = 0x1E8742000uLL;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v10 = *(const __CFString **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = SCDynamicStoreCopyValue((SCDynamicStoreRef)self->_dynamicStore, v10);
        objc_msgSend(*(id *)(v8 + 2800), "usabilityMonitor");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v26 = self;
          v27 = 2114;
          v28 = v10;
          v29 = 2114;
          v30 = v11;
          _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ _dynamicStoreCallback - processing changedKey %{public}@ linkQualityInfo %{public}@.", buf, 0x20u);
        }

        if (v11)
        {
          v13 = CFGetTypeID(v11);
          if (v13 == CFDictionaryGetTypeID())
          {
            Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v11, key);
            if (Value)
            {
              v15 = Value;
              v16 = v8;
              v17 = v4;
              v18 = CFGetTypeID(Value);
              v19 = v18 == CFNumberGetTypeID();
              v4 = v17;
              v8 = v16;
              if (v19)
              {
                *(_DWORD *)buf = 0;
                CFNumberGetValue(v15, kCFNumberIntType, buf);
                -[PCInterfaceUsabilityMonitor _processLinkQualityUpdateWithChangedKey:updatedLinkQuality:](self, "_processLinkQualityUpdateWithChangedKey:updatedLinkQuality:", v10, *(unsigned int *)buf);
              }
            }
          }
          CFRelease(v11);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v6);
  }

}

- (void)_dynamicStoreCallbackForKeys:(id)a3
{
  id v4;

  v4 = a3;
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_dynamicStore)
    -[PCInterfaceUsabilityMonitor _dynamicStoreCallback:](self, "_dynamicStoreCallback:", v4);
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");

}

- (BOOL)_createLinkQualityMonitor:(BOOL)a3
{
  void *v5;
  OS_nw_interface *lastDelegateInterface;
  OS_nw_interface *v7;
  void *v8;
  const __CFAllocator *v9;
  objc_class *v10;
  __CFString *v11;
  const __SCDynamicStore *dynamicStore;
  __CFArray *Mutable;
  __CFString *v14;
  NSObject *v15;
  __CFString *lqKey;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  SCDynamicStoreContext context;
  uint8_t buf[4];
  PCInterfaceUsabilityMonitor *v34;
  __int16 v35;
  OS_nw_interface *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17A4604](self, a2);
  lastDelegateInterface = self->_lastDelegateInterface;
  if (lastDelegateInterface)
  {
    v7 = lastDelegateInterface;
  }
  else
  {
    v7 = self->_lastInterface;
    if (!v7)
      goto LABEL_19;
  }
  if (!self->_dynamicStore)
  {
    if (!a3)
    {
      -[NSRecursiveLock lock](self->_recursiveLock, "lock");
      if (self->_dynamicStore)
      {
        a3 = 1;
        goto LABEL_19;
      }
    }
    self->_linkQuality = -1;
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    context.version = 0;
    context.info = v8;
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
    context.copyDescription = 0;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    self->_dynamicStore = SCDynamicStoreCreate(v9, v11, (SCDynamicStoreCallBack)_dynamicStoreCallback, &context);

    dynamicStore = (const __SCDynamicStore *)self->_dynamicStore;
    if (dynamicStore)
    {
      if (SCDynamicStoreSetDispatchQueue(dynamicStore, (dispatch_queue_t)self->_scQueue))
      {
        Mutable = CFArrayCreateMutable(v9, 0, MEMORY[0x1E0C9B378]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_interface_get_name((nw_interface_t)v7));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        self->_lqKey = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v9, (CFStringRef)*MEMORY[0x1E0CE8B30], v14, (CFStringRef)*MEMORY[0x1E0CE8BA0]);
        +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          lqKey = self->_lqKey;
          *(_DWORD *)buf = 138543874;
          v34 = self;
          v35 = 2114;
          v36 = v7;
          v37 = 2114;
          v38 = lqKey;
          _os_log_impl(&dword_1CBC1B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Interface manager: creating monitor for interface: %{public}@ LinkQuality key: %{public}@", buf, 0x20u);
        }

        CFArrayAppendValue(Mutable, self->_lqKey);
        SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)self->_dynamicStore, Mutable, 0);
        -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
        -[PCInterfaceUsabilityMonitor _dynamicStoreCallbackForKeys:](self, "_dynamicStoreCallbackForKeys:", Mutable);
        CFRelease(Mutable);
        a3 = 0;
        goto LABEL_18;
      }
      +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
        -[PCInterfaceUsabilityMonitor _createLinkQualityMonitor:].cold.2(v14, v24, v25, v26, v27, v28, v29, v30);
    }
    else
    {
      +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
        -[PCInterfaceUsabilityMonitor _createLinkQualityMonitor:].cold.1(v14, v17, v18, v19, v20, v21, v22, v23);
    }
    a3 = 1;
LABEL_18:

  }
LABEL_19:

  objc_autoreleasePoolPop(v5);
  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recursiveLock, 0);
  objc_storeStrong((id *)&self->_offTransitions, 0);
  objc_storeStrong((id *)&self->_lastDelegateInterface, 0);
  objc_storeStrong((id *)&self->_lastInterface, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_pathParameters, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
  objc_storeStrong((id *)&self->_scQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)_createLinkQualityMonitor:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CBC1B000, a1, a3, "Interface manager: failed to create SCDynamicStore object", a5, a6, a7, a8, 0);
}

- (void)_createLinkQualityMonitor:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CBC1B000, a1, a3, "Interface manager: SCDynamicStoreSetDispatchQueue failed", a5, a6, a7, a8, 0);
}

@end
