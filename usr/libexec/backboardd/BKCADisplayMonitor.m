@implementation BKCADisplayMonitor

- (void)dealloc
{
  os_unfair_lock_s *p_displayLock;
  void *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BKCADisplayMonitor *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  if (!self->_displayLock_isInvalid)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must invoke -invalidate before deallocating BKCADisplayMonitor")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v9 = (objc_class *)objc_opt_class(self, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138544642;
      v14 = v7;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("BKCADisplayMonitor.m");
      v21 = 1024;
      v22 = 198;
      v23 = 2114;
      v24 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    __break(0);
    JUMPOUT(0x100085358);
  }
  os_unfair_lock_unlock(p_displayLock);
  v12.receiver = self;
  v12.super_class = (Class)BKCADisplayMonitor;
  -[BKCADisplayMonitor dealloc](&v12, "dealloc");
}

- (BKCADisplayMonitor)init
{
  void *v3;
  BKCADisplayMonitor *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](BKSharedCADisplayProvider, "sharedInstance"));
  v4 = -[BKCADisplayMonitor initWithDisplayProvider:log:filterPredicate:](self, "initWithDisplayProvider:log:filterPredicate:", v3, 0, 0);

  return v4;
}

- (BKCADisplayMonitor)initWithLog:(id)a3
{
  id v4;
  void *v5;
  BKCADisplayMonitor *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](BKSharedCADisplayProvider, "sharedInstance"));
  v6 = -[BKCADisplayMonitor initWithDisplayProvider:log:filterPredicate:](self, "initWithDisplayProvider:log:filterPredicate:", v5, v4, 0);

  return v6;
}

- (BKCADisplayMonitor)initWithLog:(id)a3 filterPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BKCADisplayMonitor *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](BKSharedCADisplayProvider, "sharedInstance"));
  v9 = -[BKCADisplayMonitor initWithDisplayProvider:log:filterPredicate:](self, "initWithDisplayProvider:log:filterPredicate:", v8, v7, v6);

  return v9;
}

- (BKCADisplayMonitor)initWithDisplayProvider:(id)a3 log:(id)a4 filterPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKCADisplayMonitor *v11;
  OS_os_log *v12;
  id v13;
  OS_os_log *log;
  NSMutableDictionary *v15;
  NSMutableDictionary *displayLock_displayUUIDKeyToImmutableCADisplay;
  NSMutableDictionary *v17;
  NSMutableDictionary *displayLock_displayIndexToDisplayUUID;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  BKCADisplayMonitor *v23;
  id v24;
  id filterPredicateLock_displayFilterPredicate;
  _QWORD v27[4];
  BKCADisplayMonitor *v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)BKCADisplayMonitor;
  v11 = -[BKCADisplayMonitor init](&v29, "init");
  if (v11)
  {
    if (!v8)
      v8 = (id)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](BKSharedCADisplayProvider, "sharedInstance"));
    objc_storeStrong((id *)&v11->_displayProvider, v8);
    if (v9)
    {
      v12 = (OS_os_log *)v9;
    }
    else
    {
      v13 = sub_10005992C();
      v12 = (OS_os_log *)objc_claimAutoreleasedReturnValue(v13);
    }
    log = v11->_log;
    v11->_log = v12;

    v11->_displayLock._os_unfair_lock_opaque = 0;
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    displayLock_displayUUIDKeyToImmutableCADisplay = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v11->_displayLock_displayUUIDKeyToImmutableCADisplay = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    displayLock_displayIndexToDisplayUUID = v11->_displayLock_displayIndexToDisplayUUID;
    v11->_displayLock_displayIndexToDisplayUUID = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor _immutableDisplays](v11, "_immutableDisplays"));
    v20 = objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor _filterDisplays:usingPredicate:](v11, "_filterDisplays:usingPredicate:", v19, v11->_filterPredicateLock_displayFilterPredicate));
    v21 = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v11->_displayLock_displayUUIDKeyToImmutableCADisplay = (NSMutableDictionary *)v20;

    v22 = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000864C4;
    v27[3] = &unk_1000EC6C8;
    v23 = v11;
    v28 = v23;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v27);
    v23->_filterPredicateLock._os_unfair_lock_opaque = 0;
    v24 = objc_msgSend(v10, "copy");
    filterPredicateLock_displayFilterPredicate = v11->_filterPredicateLock_displayFilterPredicate;
    v11->_filterPredicateLock_displayFilterPredicate = v24;

    -[BKCADisplayProvider addMonitor:](v11->_displayProvider, "addMonitor:", v23);
  }

  return v11;
}

- (void)invalidate
{
  os_unfair_lock_s *p_displayLock;
  BKCADisplayProvider *displayProvider;
  BSCompoundAssertion *displayLock_observerAssertion;
  id filterPredicateLock_displayFilterPredicate;

  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  if (!self->_displayLock_isInvalid)
  {
    self->_displayLock_isInvalid = 1;
    -[BKCADisplayProvider removeMonitor:](self->_displayProvider, "removeMonitor:", self);
    displayProvider = self->_displayProvider;
    self->_displayProvider = 0;

    -[BSCompoundAssertion invalidate](self->_displayLock_observerAssertion, "invalidate");
    displayLock_observerAssertion = self->_displayLock_observerAssertion;
    self->_displayLock_observerAssertion = 0;

    os_unfair_lock_lock(&self->_filterPredicateLock);
    filterPredicateLock_displayFilterPredicate = self->_filterPredicateLock_displayFilterPredicate;
    self->_filterPredicateLock_displayFilterPredicate = 0;

    os_unfair_lock_unlock(&self->_filterPredicateLock);
  }
  os_unfair_lock_unlock(p_displayLock);
}

- (id)immutableDisplayForUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_displayLock;
  NSMutableDictionary *displayLock_displayUUIDKeyToImmutableCADisplay;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  p_displayLock = &self->_displayLock;
  os_unfair_lock_assert_not_owner(&self->_displayLock);
  os_unfair_lock_lock(&self->_displayLock);
  displayLock_displayUUIDKeyToImmutableCADisplay = self->_displayLock_displayUUIDKeyToImmutableCADisplay;
  v7 = v4;
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8)
    v9 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](displayLock_displayUUIDKeyToImmutableCADisplay, "objectForKeyedSubscript:", v10));
  os_unfair_lock_unlock(p_displayLock);

  return v11;
}

- (id)addObserver:(id)a3
{
  os_unfair_lock_s *p_displayLock;
  id v5;
  uint64_t v6;
  BSCompoundAssertion *displayLock_observerAssertion;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  id v10;
  void *v11;
  void *v12;

  p_displayLock = &self->_displayLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_displayLock);
  os_unfair_lock_lock(p_displayLock);
  displayLock_observerAssertion = self->_displayLock_observerAssertion;
  if (!displayLock_observerAssertion)
  {
    v8 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("backboardd.CADisplayMonitor")));
    v9 = self->_displayLock_observerAssertion;
    self->_displayLock_observerAssertion = v8;

    displayLock_observerAssertion = self->_displayLock_observerAssertion;
  }
  v10 = objc_msgSend((id)objc_opt_class(v5, v6), "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion acquireForReason:withContext:](displayLock_observerAssertion, "acquireForReason:withContext:", v11, v5));

  os_unfair_lock_unlock(p_displayLock);
  return v12;
}

- (BOOL)displayUUIDIsActive:(id)a3
{
  os_unfair_lock_s *p_displayLock;
  id v5;
  void *v6;

  p_displayLock = &self->_displayLock;
  v5 = a3;
  os_unfair_lock_lock(p_displayLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_displayLock_displayUUIDKeyToImmutableCADisplay, "objectForKey:", v5));

  os_unfair_lock_unlock(p_displayLock);
  return v6 != 0;
}

- (NSArray)activeDisplays
{
  os_unfair_lock_s *p_displayLock;
  void *v4;

  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_displayLock_displayUUIDKeyToImmutableCADisplay, "allValues"));
  os_unfair_lock_unlock(p_displayLock);
  return (NSArray *)v4;
}

- (BOOL)hasActiveDisplays
{
  BKCADisplayMonitor *v2;
  os_unfair_lock_s *p_displayLock;

  v2 = self;
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_displayLock_displayUUIDKeyToImmutableCADisplay, "count") != 0;
  os_unfair_lock_unlock(p_displayLock);
  return (char)v2;
}

- (id)_immutableDisplays
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_not_owner(&self->_displayLock);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayProvider displays](self->_displayProvider, "displays"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_map:", &stru_1000EC708));

  return v4;
}

- (BOOL)_filterDisplay:(id)a3 usingPredicate:(id)a4
{
  id v6;
  uint64_t (**v7)(id, id, id *);
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  char v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  BOOL v25;
  NSObject *v26;
  NSObject *log;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;

  v6 = a3;
  v7 = (uint64_t (**)(id, id, id *))a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  v9 = objc_msgSend(v8, "length");
  v10 = (void *)BKSDisplayUUIDMainKey;
  if (v9)
    v10 = v8;
  v11 = v10;

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentMode"));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "availableModes"));
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentMode"));
      v17 = objc_msgSend(v16, "width");
      v18 = objc_msgSend(v16, "height");
      v19 = (unint64_t)v18;
      if (v17 && v18)
      {
        if (!v7)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v31 = v6;
            v32 = 2114;
            v33 = v11;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Display is active %{public}@ %{public}@ because: connected", buf, 0x16u);
          }
          goto LABEL_18;
        }
        v29 = 0;
        v20 = v7[2](v7, v6, &v29);
        v21 = v29;
        v22 = self->_log;
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if ((v20 & 1) != 0)
        {
          if (v23)
          {
            *(_DWORD *)buf = 138543874;
            v31 = v6;
            v32 = 2114;
            v33 = v11;
            v34 = 2114;
            v35 = *(double *)&v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Display is active %{public}@ %{public}@ because: %{public}@", buf, 0x20u);
          }

LABEL_18:
          v25 = 1;
          goto LABEL_23;
        }
        if (v23)
        {
          *(_DWORD *)buf = 138543874;
          v31 = v6;
          v32 = 2114;
          v33 = v11;
          v34 = 2114;
          v35 = *(double *)&v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Display is inactive %{public}@ %{public}@ because: %{public}@", buf, 0x20u);
        }

      }
      else
      {
        v26 = self->_log;
        v25 = 0;
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
LABEL_23:

          goto LABEL_24;
        }
        *(_DWORD *)buf = 138544130;
        v31 = v6;
        v32 = 2114;
        v33 = v11;
        v34 = 2048;
        v35 = (double)(unint64_t)v17;
        v36 = 2048;
        v37 = (double)v19;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Display is inactive %{public}@ %{public}@ because: size is (%g,%g)", buf, 0x2Au);
      }
      v25 = 0;
      goto LABEL_23;
    }
  }
  v24 = self->_log;
  v25 = 0;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Display is inactive %{public}@ because: not connected", buf, 0xCu);
    v25 = 0;
  }
LABEL_24:

  return v25;
}

- (id)_filterDisplays:(id)a3 usingPredicate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v19 = objc_alloc_init((Class)NSMutableDictionary);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = (void *)BKSDisplayUUIDMainKey;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (-[BKCADisplayMonitor _filterDisplay:usingPredicate:](self, "_filterDisplay:usingPredicate:", v14, v7))
        {
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueId"));
          if (objc_msgSend(v15, "length"))
            v16 = v15;
          else
            v16 = v12;
          v17 = v16;

          objc_msgSend(v19, "setObject:forKey:", v14, v17);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v19;
}

- (void)setDisplayFilterPredicate:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  id v7;
  id v8;
  id filterPredicateLock_displayFilterPredicate;
  int v10;
  id v11;

  v4 = objc_msgSend(a3, "copy");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    v7 = objc_retainBlock(v4);
    v10 = 134217984;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting display predicate: %p", (uint8_t *)&v10, 0xCu);

  }
  os_unfair_lock_lock(&self->_filterPredicateLock);
  v8 = objc_retainBlock(v4);
  filterPredicateLock_displayFilterPredicate = self->_filterPredicateLock_displayFilterPredicate;
  self->_filterPredicateLock_displayFilterPredicate = v8;

  os_unfair_lock_unlock(&self->_filterPredicateLock);
  -[BKCADisplayMonitor reevaluateActiveDisplaysWithReason:](self, "reevaluateActiveDisplaysWithReason:", CFSTR("predicate changed"));

}

- (void)reevaluateActiveDisplaysWithReason:(id)a3
{
  id v4;
  NSObject *log;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *displayLock_displayUUIDKeyToImmutableCADisplay;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *m;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v67 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "reevaluateActiveDisplaysWithReason: %{public}@", buf, 0xCu);
  }
  v41 = v4;
  os_unfair_lock_lock(&self->_filterPredicateLock);
  v6 = objc_msgSend(self->_filterPredicateLock_displayFilterPredicate, "copy");
  os_unfair_lock_unlock(&self->_filterPredicateLock);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor _immutableDisplays](self, "_immutableDisplays"));
  v40 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor _filterDisplays:usingPredicate:](self, "_filterDisplays:usingPredicate:"));
  os_unfair_lock_lock(&self->_displayLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_displayLock_displayUUIDKeyToImmutableCADisplay, "allValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

  v38 = v7;
  objc_storeStrong((id *)&self->_displayLock_displayUUIDKeyToImmutableCADisplay, v7);
  -[NSMutableDictionary removeAllObjects](self->_displayLock_displayIndexToDisplayUUID, "removeAllObjects");
  displayLock_displayUUIDKeyToImmutableCADisplay = self->_displayLock_displayUUIDKeyToImmutableCADisplay;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100086434;
  v61[3] = &unk_1000EC6C8;
  v61[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayLock_displayUUIDKeyToImmutableCADisplay, "enumerateKeysAndObjectsUsingBlock:", v61);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_displayLock_observerAssertion, "context"));
  v14 = objc_msgSend(v13, "copy");

  os_unfair_lock_unlock(&self->_displayLock);
  v44 = objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v44, "intersectSet:", v9);
  v43 = objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v43, "minusSet:", v9);
  v37 = v9;
  v15 = objc_msgSend(v9, "mutableCopy");
  v36 = v11;
  objc_msgSend(v15, "minusSet:", v11);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v21 = v43;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(_QWORD *)v54 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(v20, "monitor:displayDidBecomeActive:", self, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j));
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
          }
          while (v23);
        }

        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v26 = v15;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v50;
          do
          {
            for (k = 0; k != v28; k = (char *)k + 1)
            {
              if (*(_QWORD *)v50 != v29)
                objc_enumerationMutation(v26);
              objc_msgSend(v20, "monitor:displayDidBecomeInactive:", self, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)k));
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
          }
          while (v28);
        }

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v31 = v44;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v46;
          do
          {
            for (m = 0; m != v33; m = (char *)m + 1)
            {
              if (*(_QWORD *)v46 != v34)
                objc_enumerationMutation(v31);
              objc_msgSend(v20, "monitor:activeDisplayPropertiesDidChange:", self, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)m));
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
          }
          while (v33);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v17);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterPredicateLock_displayFilterPredicate, 0);
  objc_storeStrong((id *)&self->_displayLock_displayIndexToDisplayUUID, 0);
  objc_storeStrong((id *)&self->_displayLock_displayUUIDKeyToImmutableCADisplay, 0);
  objc_storeStrong((id *)&self->_displayLock_observerAssertion, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_displayProvider, 0);
}

@end
