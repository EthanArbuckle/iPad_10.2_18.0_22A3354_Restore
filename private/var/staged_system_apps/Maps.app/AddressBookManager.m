@implementation AddressBookManager

+ (BOOL)addressBookAllowed
{
  return +[CNContactStore _maps_isAuthorized](CNContactStore, "_maps_isAuthorized");
}

+ (id)sharedManager
{
  if (qword_1014D2450 != -1)
    dispatch_once(&qword_1014D2450, &stru_1011B54C8);
  return (id)qword_1014D2448;
}

- (AddressBookManager)init
{
  id v2;
  id v3;
  NSObject *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_group_t v14;
  void *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;

  v24.receiver = self;
  v24.super_class = (Class)AddressBookManager;
  v2 = -[AddressBookManager init](&v24, "init");
  if (v2)
  {
    v3 = sub_100408630();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      *((_DWORD *)v2 + 2) = 0;
      v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v13 = (void *)*((_QWORD *)v2 + 11);
      *((_QWORD *)v2 + 11) = v12;

      v14 = dispatch_group_create();
      v15 = (void *)*((_QWORD *)v2 + 6);
      *((_QWORD *)v2 + 6) = v14;

      v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = dispatch_queue_create("com.apple.Maps.AddressBookManager.collection", v17);
      v19 = (void *)*((_QWORD *)v2 + 2);
      *((_QWORD *)v2 + 2) = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v20, "addObserver:selector:name:object:", v2, "updateStore:", CNContactStoreMeContactDidChangeNotification, 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v21, "addObserver:selector:name:object:", v2, "updateStore:", CNContactStoreDidChangeNotification, 0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v22, "addObserver:selector:name:object:", v2, "updateStoreImmediately:", off_1014B72C0, 0);

      dispatch_group_enter(*((dispatch_group_t *)v2 + 6));
      objc_msgSend(v2, "setNeedsAddressCollection");
      return (AddressBookManager *)v2;
    }
    v5 = v2;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] initialising", buf, 0xCu);

    goto LABEL_9;
  }
  return (AddressBookManager *)v2;
}

- (void)performBlockAfterFirstCollection:(id)a3
{
  void (**v4)(_QWORD);
  OS_dispatch_group *v5;
  id v6;
  NSObject *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = self->_collectGroup;
    os_unfair_lock_unlock(&self->_lock);
    if (!v5)
    {
      v4[2](v4);
      goto LABEL_12;
    }
    v6 = sub_100408630();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      dispatch_group_notify((dispatch_group_t)v5, (dispatch_queue_t)&_dispatch_main_q, v4);
LABEL_12:

      goto LABEL_13;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

    *(_DWORD *)buf = 138543362;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] scheduling post-collection block", buf, 0xCu);

    goto LABEL_10;
  }
LABEL_13:

}

- (MapsSuggestionsCorrectedMapItemProvider)msgCorrectedMapItemProvider
{
  AddressBookManager *v2;
  MapsSuggestionsCorrectedMapItemProvider *msgCorrectedMapItemProvider;
  id v4;
  NSObject *v5;
  AddressBookManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  MapsSuggestionsShortcutManager *shortcutManager;
  id v17;
  MapsSuggestionsShortcutManager *v18;
  MapsSuggestionsCorrectedMapItemProvider *v19;
  MapsSuggestionsCorrectedMapItemProvider *v20;
  MapsSuggestionsCorrectedMapItemProvider *v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;

  v2 = self;
  objc_sync_enter(v2);
  msgCorrectedMapItemProvider = v2->_msgCorrectedMapItemProvider;
  if (!msgCorrectedMapItemProvider)
  {
    v4 = sub_100408630();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v13 = sub_100B3A5D4();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "oneFavorites"));
      shortcutManager = v2->_shortcutManager;
      v2->_shortcutManager = (MapsSuggestionsShortcutManager *)v15;

      objc_initWeak((id *)buf, v2);
      v17 = objc_alloc((Class)MapsSuggestionsCorrectedMapItemProvider);
      v18 = v2->_shortcutManager;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100408ABC;
      v23[3] = &unk_1011AD260;
      objc_copyWeak(&v24, (id *)buf);
      v19 = (MapsSuggestionsCorrectedMapItemProvider *)objc_msgSend(v17, "initWithMeCardReader:handler:", v18, v23);
      v20 = v2->_msgCorrectedMapItemProvider;
      v2->_msgCorrectedMapItemProvider = v19;

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
      msgCorrectedMapItemProvider = v2->_msgCorrectedMapItemProvider;
      goto LABEL_10;
    }
    v6 = v2;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && (objc_msgSend(v10, "isEqualToString:", v9) & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] initialising corrected map item provider", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  v21 = msgCorrectedMapItemProvider;
  objc_sync_exit(v2);

  return v21;
}

- (void)updateStore:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = sub_100408630();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] received notification %{public}@", buf, 0x16u);

  }
  -[AddressBookManager _updateStoreWithCoalescing:](self, "_updateStoreWithCoalescing:", 1);

}

- (void)updateStoreImmediately:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = sub_100408630();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] received notification %{public}@", buf, 0x16u);

  }
  -[AddressBookManager _updateStoreWithCoalescing:](self, "_updateStoreWithCoalescing:", 0);

}

- (void)_updateStoreWithCoalescing:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *contactStoreQueue;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  __CFString *v22;

  v3 = a3;
  v5 = sub_100408630();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_13;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
  v15 = CFSTR("NO");
  if (v3)
    v15 = CFSTR("YES");
  v16 = v15;
  *(_DWORD *)buf = 138543618;
  v20 = v14;
  v21 = 2114;
  v22 = v16;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] updateStoreWithCoalescing: %{public}@", buf, 0x16u);

LABEL_13:
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_contactCache, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  if (v3)
  {
    -[AddressBookManager setNeedsAddressCollection](self, "setNeedsAddressCollection");
  }
  else
  {
    contactStoreQueue = self->_contactStoreQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100409078;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async(contactStoreQueue, block);
  }
}

- (void)_cancelAddressCollectionTimerIfNeeded
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSObject *v5;
  AddressBookManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  GCDTimer *deferredAddressCollectionTimer;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_deferredAddressCollectionTimer)
  {
    v4 = sub_100408630();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      -[GCDTimer invalidate](self->_deferredAddressCollectionTimer, "invalidate");
      deferredAddressCollectionTimer = self->_deferredAddressCollectionTimer;
      self->_deferredAddressCollectionTimer = 0;

      goto LABEL_10;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCDTimer fireDate](self->_deferredAddressCollectionTimer, "fireDate"));
    objc_msgSend(v13, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    v18 = 2048;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] cancelling previous deferred address collection timer (had %#.1lfs to go)", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:
  os_unfair_lock_unlock(p_lock);
}

- (void)setNeedsAddressCollection
{
  id v3;
  NSObject *v4;
  AddressBookManager *v5;
  AddressBookManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  OS_dispatch_queue *contactStoreQueue;
  GCDTimer *v14;
  GCDTimer *deferredAddressCollectionTimer;
  _QWORD v16[4];
  id v17;
  id location;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  uint64_t v22;

  -[AddressBookManager _cancelAddressCollectionTimerIfNeeded](self, "_cancelAddressCollectionTimerIfNeeded");
  objc_initWeak(&location, self);
  v3 = sub_100408630();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && (objc_msgSend(v10, "isEqualToString:", v9) & 1) == 0)
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    v21 = 2048;
    v22 = 0x3FF0000000000000;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] scheduling deferred address collection in %#.1lfs", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_lock);
  contactStoreQueue = self->_contactStoreQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10040949C;
  v16[3] = &unk_1011AE190;
  objc_copyWeak(&v17, &location);
  v14 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:repeating:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:repeating:block:", contactStoreQueue, 0, v16, 1.0));
  deferredAddressCollectionTimer = self->_deferredAddressCollectionTimer;
  self->_deferredAddressCollectionTimer = v14;

  os_unfair_lock_unlock(&self->_lock);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (CNContactStore)contactStore
{
  os_unfair_lock_s *p_lock;
  CNContactStore *contactStore;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactStore *v14;
  CNContactStore *v15;
  CNContactStore *v16;
  uint8_t buf[4];
  void *v19;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v5 = sub_100408630();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v14 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
      v15 = self->_contactStore;
      self->_contactStore = v14;

      contactStore = self->_contactStore;
      goto LABEL_10;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] initialising CNContactStore", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  v16 = contactStore;
  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (NSArray)properties
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100409728;
  block[3] = &unk_1011AC860;
  block[4] = self;
  if (qword_1014D2460 != -1)
    dispatch_once(&qword_1014D2460, block);
  return (NSArray *)(id)qword_1014D2458;
}

- (CNContact)meCard
{
  return self->_meCard;
}

- (BOOL)meCardExists
{
  return self->_meCard != 0;
}

- (NSURL)meCardPunchOutURL
{
  void *v2;

  if (self->_meCard)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("contact://show?ref=me")));
  else
    v2 = 0;
  return (NSURL *)v2;
}

- (void)createMeCardWithContact:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *contactStoreQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_contactStoreQueue);
  objc_initWeak(&location, self);
  contactStoreQueue = self->_contactStoreQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100409B70;
  v11[3] = &unk_1011B0300;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(contactStoreQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)updateContact:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *contactStoreQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_contactStoreQueue);
  objc_initWeak(&location, self);
  contactStoreQueue = self->_contactStoreQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10040A2BC;
  v11[3] = &unk_1011B0300;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(contactStoreQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (AddressBookAddress)meCardHomeAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager allHomeAddresses](self, "allHomeAddresses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (AddressBookAddress *)v3;
}

- (AddressBookAddress)meCardWorkAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager allWorkAddresses](self, "allWorkAddresses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (AddressBookAddress *)v3;
}

- (AddressBookAddress)meCardSchoolAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager allSchoolAddresses](self, "allSchoolAddresses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (AddressBookAddress *)v3;
}

- (NSArray)allHomeAddresses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_homeAddresses, "allValues"));
  v5 = objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSArray)allWorkAddresses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_workAddresses, "allValues"));
  v5 = objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSArray)allSchoolAddresses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_schoolAddresses, "allValues"));
  v5 = objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSArray)allOtherAddresses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_otherAddresses, "allValues"));
  v5 = objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)collectAddresses
{
  id v3;
  NSObject *v4;
  AddressBookManager *v5;
  AddressBookManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  AddressBookAddress *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  unsigned int v34;
  void *v35;
  os_unfair_lock_s *p_lock;
  id v37;
  NSObject *v38;
  AddressBookManager *v39;
  AddressBookManager *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *j;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  __CFString *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *k;
  uint64_t v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  __CFString *v78;
  __CFString *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  void *m;
  uint64_t v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  __CFString *v96;
  __CFString *v97;
  id v98;
  void *v99;
  id v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  uint64_t v107;
  void *n;
  uint64_t v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  NSObject *v114;
  NSDictionary *v115;
  NSDictionary *v116;
  NSDictionary *v117;
  NSDictionary *v118;
  NSDictionary *v119;
  NSDictionary *homeAddresses;
  NSDictionary *v121;
  NSDictionary *workAddresses;
  NSDictionary *v123;
  NSDictionary *schoolAddresses;
  NSDictionary *v125;
  NSDictionary *otherAddresses;
  id v127;
  NSObject *v128;
  AddressBookManager *v129;
  objc_class *v130;
  NSString *v131;
  void *v132;
  void *v133;
  void *v134;
  __CFString *v135;
  OS_dispatch_group *collectGroup;
  __CFString *v137;
  id v138;
  id v139;
  __CFString *v140;
  __CFString *v141;
  id v142;
  id v143;
  __CFString *v144;
  id v145;
  __CFString *v146;
  id v147;
  AddressBookManager *v148;
  id v149;
  id v150;
  os_unfair_lock_s *v151;
  void *v152;
  id v153;
  NSObject *v154;
  id v155;
  id obj;
  id obja;
  id objb;
  id objc;
  __CFString *objd;
  NSDictionary *obje;
  _QWORD block[5];
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  uint8_t v172[128];
  uint8_t buf[4];
  __CFString *v174;
  __int16 v175;
  id v176;
  __int16 v177;
  __CFString *v178;
  __int16 v179;
  id v180;
  __int16 v181;
  __CFString *v182;
  __int16 v183;
  id v184;
  __int16 v185;
  __CFString *v186;
  __int16 v187;
  id v188;
  __int16 v189;
  __CFString *v190;

  v3 = sub_100408630();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v148 = self;
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v5 = self;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

      goto LABEL_8;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543362;
  v174 = v12;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] will collect address...", buf, 0xCu);

  self = v148;
LABEL_11:

  -[AddressBookManager _cancelAddressCollectionTimerIfNeeded](self, "_cancelAddressCollectionTimerIfNeeded");
  if (+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager contactStore](self, "contactStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager properties](self, "properties"));
    v167 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_ios_meContactWithKeysToFetch:error:", v14, &v167));
    v147 = v167;

  }
  else
  {
    v15 = 0;
    v147 = 0;
  }
  v155 = objc_alloc_init((Class)NSMutableDictionary);
  v153 = objc_alloc_init((Class)NSMutableDictionary);
  v150 = objc_alloc_init((Class)NSMutableDictionary);
  v149 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = v15;
  v152 = v15;
  if (v15)
  {
    v165 = 0u;
    v166 = 0u;
    v163 = 0u;
    v164 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "postalAddresses"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v163, v172, 16);
    if (!v18)
      goto LABEL_34;
    v19 = v18;
    v20 = *(_QWORD *)v164;
    while (1)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v164 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)i);
        v23 = -[AddressBookAddress initWithContact:addressValue:]([AddressBookAddress alloc], "initWithContact:addressValue:", v16, v22);
        -[AddressBookAddress _setSuppressStoreUpdateNotifications:](v23, "_setSuppressStoreUpdateNotifications:", 1);
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress addressValue](v23, "addressValue"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));

          if (v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "label"));
            v27 = objc_msgSend(v26, "isEqualToString:", CNLabelHome);

            if (v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress addressValue](v23, "addressValue"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
              v30 = v155;
              goto LABEL_26;
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "label"));
            v32 = objc_msgSend(v31, "isEqualToString:", CNLabelWork);

            if (v32)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress addressValue](v23, "addressValue"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
              v30 = v153;
LABEL_26:
              objc_msgSend(v30, "setObject:forKey:", v23, v29);
            }
            else
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "label"));
              v34 = objc_msgSend(v33, "isEqualToString:", CNLabelSchool);

              v28 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress addressValue](v23, "addressValue"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
              if (v34)
                v35 = v150;
              else
                v35 = v149;
              objc_msgSend(v35, "setObject:forKey:", v23, v29);
              v16 = v152;
            }

          }
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v163, v172, 16);
      if (!v19)
      {
LABEL_34:

        self = v148;
        break;
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v37 = sub_100408630();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v151 = &self->_lock;
    v39 = self;
    v40 = v39;
    if (!v39)
    {
      v46 = CFSTR("<nil>");
LABEL_44:

      v146 = v46;
      v145 = objc_msgSend(v155, "count");
      v47 = v155;
      v48 = v47;
      v154 = v38;
      if (v47)
      {
        v49 = objc_msgSend(v47, "count");
        if (v49)
        {
          v50 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v49);
          v168 = 0u;
          v169 = 0u;
          v170 = 0u;
          v171 = 0u;
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "allKeys"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sortedArrayUsingSelector:", "compare:"));

          obj = v52;
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v169;
            do
            {
              for (j = 0; j != v54; j = (char *)j + 1)
              {
                if (*(_QWORD *)v169 != v55)
                  objc_enumerationMutation(obj);
                v57 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)j);
                v58 = objc_alloc((Class)NSString);
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", v57));
                v60 = objc_msgSend(v58, "initWithFormat:", CFSTR("%@: %@"), v57, v59);
                objc_msgSend(v50, "addObject:", v60);

              }
              v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
            }
            while (v54);
          }

          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "componentsJoinedByString:", CFSTR(", ")));
          v62 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> {%@}"), v48, v61));

          self = v148;
          v38 = v154;
        }
        else
        {
          v62 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v48));
        }
      }
      else
      {
        v62 = CFSTR("<nil>");
      }

      v144 = v62;
      v143 = objc_msgSend(v153, "count");
      v63 = v153;
      v64 = v63;
      if (v63)
      {
        v65 = objc_msgSend(v63, "count");
        if (v65)
        {
          v66 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v65);
          v168 = 0u;
          v169 = 0u;
          v170 = 0u;
          v171 = 0u;
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "allKeys"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "sortedArrayUsingSelector:", "compare:"));

          obja = v68;
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
          if (v69)
          {
            v70 = v69;
            v71 = *(_QWORD *)v169;
            do
            {
              for (k = 0; k != v70; k = (char *)k + 1)
              {
                if (*(_QWORD *)v169 != v71)
                  objc_enumerationMutation(obja);
                v73 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)k);
                v74 = objc_alloc((Class)NSString);
                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", v73));
                v76 = objc_msgSend(v74, "initWithFormat:", CFSTR("%@: %@"), v73, v75);
                objc_msgSend(v66, "addObject:", v76);

              }
              v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
            }
            while (v70);
          }

          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "componentsJoinedByString:", CFSTR(", ")));
          v78 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> {%@}"), v64, v77));

          self = v148;
          v38 = v154;
        }
        else
        {
          v78 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v64));
        }
      }
      else
      {
        v78 = CFSTR("<nil>");
      }

      v79 = v78;
      v80 = objc_msgSend(v150, "count");
      v81 = v150;
      v82 = v81;
      if (v81)
      {
        v83 = objc_msgSend(v81, "count");
        if (v83)
        {
          v138 = v80;
          v140 = v79;
          v84 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v83);
          v168 = 0u;
          v169 = 0u;
          v170 = 0u;
          v171 = 0u;
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "allKeys"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "sortedArrayUsingSelector:", "compare:"));

          objb = v86;
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
          if (v87)
          {
            v88 = v87;
            v89 = *(_QWORD *)v169;
            do
            {
              for (m = 0; m != v88; m = (char *)m + 1)
              {
                if (*(_QWORD *)v169 != v89)
                  objc_enumerationMutation(objb);
                v91 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)m);
                v92 = objc_alloc((Class)NSString);
                v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", v91));
                v94 = objc_msgSend(v92, "initWithFormat:", CFSTR("%@: %@"), v91, v93);
                objc_msgSend(v84, "addObject:", v94);

              }
              v88 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
            }
            while (v88);
          }

          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "componentsJoinedByString:", CFSTR(", ")));
          v96 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> {%@}"), v82, v95));

          self = v148;
          v38 = v154;
          v80 = v138;
          v79 = v140;
        }
        else
        {
          v96 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v82));
        }
      }
      else
      {
        v96 = CFSTR("<nil>");
      }

      v97 = v96;
      v142 = objc_msgSend(v149, "count");
      v98 = v149;
      v99 = v98;
      if (v98)
      {
        v100 = objc_msgSend(v98, "count");
        v16 = v152;
        if (v100)
        {
          v137 = v97;
          v139 = v80;
          v141 = v79;
          v101 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v100);
          v168 = 0u;
          v169 = 0u;
          v170 = 0u;
          v171 = 0u;
          v102 = v99;
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "allKeys"));
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "sortedArrayUsingSelector:", "compare:"));

          objc = v104;
          v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
          if (v105)
          {
            v106 = v105;
            v107 = *(_QWORD *)v169;
            do
            {
              for (n = 0; n != v106; n = (char *)n + 1)
              {
                if (*(_QWORD *)v169 != v107)
                  objc_enumerationMutation(objc);
                v109 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)n);
                v110 = objc_alloc((Class)NSString);
                v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKeyedSubscript:", v109));
                v112 = objc_msgSend(v110, "initWithFormat:", CFSTR("%@: %@"), v109, v111);
                objc_msgSend(v101, "addObject:", v112);

              }
              v106 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v168, buf, 16);
            }
            while (v106);
          }

          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "componentsJoinedByString:", CFSTR(", ")));
          v99 = v102;
          objd = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> {%@}"), v102, v113));

          self = v148;
          v16 = v152;
          v114 = v154;
          v80 = v139;
          v79 = v141;
          v97 = v137;
          goto LABEL_93;
        }
        objd = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v99));
      }
      else
      {
        objd = CFSTR("<nil>");
        v16 = v152;
      }
      v114 = v38;
LABEL_93:

      *(_DWORD *)buf = 138545410;
      v174 = v146;
      v175 = 2048;
      v176 = v145;
      v177 = 2114;
      v178 = v144;
      v179 = 2048;
      v180 = v143;
      v181 = 2114;
      v182 = v79;
      v183 = 2048;
      v184 = v80;
      v185 = 2114;
      v186 = v97;
      v187 = 2048;
      v188 = v142;
      v189 = 2114;
      v190 = objd;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_INFO, "[%{public}@] storing addresses:\n\t%lu Home: %{public}@\n\t%lu Work: %{public}@\n\t%lu School: %{public}@\n\t%lu Other: %{public}@", buf, 0x5Cu);

      p_lock = v151;
      v38 = v114;
      goto LABEL_94;
    }
    v41 = (objc_class *)objc_opt_class(v39);
    v42 = NSStringFromClass(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if ((objc_opt_respondsToSelector(v40, "accessibilityIdentifier") & 1) != 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v40, "performSelector:", "accessibilityIdentifier"));
      v45 = v44;
      if (v44 && !objc_msgSend(v44, "isEqualToString:", v43))
      {
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v43, v40, v45));

        goto LABEL_42;
      }

    }
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v43, v40));
LABEL_42:

    goto LABEL_44;
  }
LABEL_94:

  objc_storeStrong((id *)&self->_meCard, v16);
  v115 = self->_homeAddresses;
  v116 = self->_workAddresses;
  v117 = self->_schoolAddresses;
  v118 = self->_otherAddresses;
  v119 = (NSDictionary *)objc_msgSend(v155, "copy");
  homeAddresses = self->_homeAddresses;
  self->_homeAddresses = v119;

  v121 = (NSDictionary *)objc_msgSend(v153, "copy");
  workAddresses = self->_workAddresses;
  self->_workAddresses = v121;

  v123 = (NSDictionary *)objc_msgSend(v150, "copy");
  schoolAddresses = self->_schoolAddresses;
  self->_schoolAddresses = v123;

  v125 = (NSDictionary *)objc_msgSend(v149, "copy");
  otherAddresses = self->_otherAddresses;
  self->_otherAddresses = v125;

  os_unfair_lock_unlock(p_lock);
  sub_10040B854(v115);
  sub_10040B854(v116);
  sub_10040B854(v117);
  sub_10040B854(v118);
  if (self->_collectGroup)
  {
    v127 = sub_100408630();
    v128 = objc_claimAutoreleasedReturnValue(v127);
    if (!os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
    {
LABEL_102:

      dispatch_group_leave((dispatch_group_t)self->_collectGroup);
      collectGroup = self->_collectGroup;
      self->_collectGroup = 0;

      v16 = v152;
      goto LABEL_103;
    }
    v129 = self;
    v130 = (objc_class *)objc_opt_class(v129);
    v131 = NSStringFromClass(v130);
    v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
    obje = v115;
    if ((objc_opt_respondsToSelector(v129, "accessibilityIdentifier") & 1) != 0)
    {
      v133 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v129, "performSelector:", "accessibilityIdentifier"));
      v134 = v133;
      if (v133 && !objc_msgSend(v133, "isEqualToString:", v132))
      {
        v135 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v132, v129, v134));

        goto LABEL_101;
      }

    }
    v135 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v132, v129));
LABEL_101:

    *(_DWORD *)buf = 138543362;
    v174 = v135;
    _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_INFO, "[%{public}@] completed first address collection", buf, 0xCu);

    v115 = obje;
    goto LABEL_102;
  }
LABEL_103:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10040B940;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)mapItemFormShortcutForCNIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager msgCorrectedMapItemProvider](self, "msgCorrectedMapItemProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItemFormShortcutForCNIdentifier:", v4));

    if (v6)
      v7 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v6, 0);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)contactForRecordId:(int)a3
{
  uint64_t v3;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  AddressBookManager *v25;
  AddressBookManager *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  id v34;
  void *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  uint64_t v42;
  id v43;
  _QWORD v44[5];
  id v45;
  uint8_t v46[4];
  __CFString *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v3 = *(_QWORD *)&a3;
  if (!+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
    return 0;
  v5 = sub_100408630();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = (int)v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact for record: %ld...", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v55 = sub_10040C0A4;
  v56 = sub_10040C0B4;
  v57 = 0;
  v16 = objc_alloc((Class)CNContactFetchRequest);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "properties"));
  v19 = objc_msgSend(v16, "initWithKeysToFetch:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForLegacyIdentifier:](CNContact, "predicateForLegacyIdentifier:", v3));
  objc_msgSend(v19, "setPredicate:", v20);

  objc_msgSend(v19, "setSortOrder:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager contactStore](self, "contactStore"));
  v45 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10040C0BC;
  v44[3] = &unk_1011B54F0;
  v44[4] = buf;
  objc_msgSend(v21, "enumerateContactsWithFetchRequest:error:usingBlock:", v19, &v45, v44);
  v22 = v45;

  v23 = sub_100408630();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = self;
    v26 = v25;
    if (!v25)
    {
      v32 = CFSTR("<nil>");
LABEL_22:

      v33 = v32;
      v34 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v35 = v34;
      if (!v34)
      {
        v41 = CFSTR("<nil>");
        goto LABEL_30;
      }
      v36 = (objc_class *)objc_opt_class(v34);
      v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      if ((objc_opt_respondsToSelector(v35, "accessibilityIdentifier") & 1) != 0)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "performSelector:", "accessibilityIdentifier"));
        v40 = v39;
        if (v39 && (objc_msgSend(v39, "isEqualToString:", v38) & 1) == 0)
        {
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v38, v35, v40));

          goto LABEL_28;
        }

      }
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v38, v35));
LABEL_28:

LABEL_30:
      v42 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v46 = 138544131;
      v47 = v33;
      v48 = 2114;
      v49 = v41;
      v50 = 2048;
      v51 = (int)v3;
      v52 = 2113;
      v53 = v42;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] ... found record %{public}@ for id %ld: %{private}@ ", v46, 0x2Au);

      goto LABEL_31;
    }
    v27 = (objc_class *)objc_opt_class(v25);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if ((objc_opt_respondsToSelector(v26, "accessibilityIdentifier") & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v26, "performSelector:", "accessibilityIdentifier"));
      v31 = v30;
      if (v30 && (objc_msgSend(v30, "isEqualToString:", v29) & 1) == 0)
      {
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v29, v26, v31));

        goto LABEL_20;
      }

    }
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v29, v26));
LABEL_20:

    goto LABEL_22;
  }
LABEL_31:

  v43 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v43;
}

- (id)contactForCNContactIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = sub_100408630();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      v19 = v4;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v16));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager _contactWithCacheIdentifier:predicate:](self, "_contactWithCacheIdentifier:predicate:", v4, v17));

      goto LABEL_14;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2114;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact identifier %{public}@", buf, 0x16u);

    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (id)contactWithEmailAddress:(id)a3
{
  char *v4;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = (char *)a3;
  if (!v4)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[AddressBookManager contactWithEmailAddress:]";
      v25 = 2080;
      v26 = "AddressBookAddress.m";
      v27 = 1024;
      v28 = 575;
      v29 = 2080;
      v30 = "emailAddress";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (objc_msgSend(v4, "length"))
  {
    v5 = sub_100408630();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", v4));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager _contactWithCacheIdentifier:predicate:](self, "_contactWithCacheIdentifier:predicate:", v4, v16));

      goto LABEL_15;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_13;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

LABEL_13:
    *(_DWORD *)buf = 138543619;
    v24 = (const char *)v14;
    v25 = 2113;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact for email %{private}@", buf, 0x16u);

    goto LABEL_14;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)contactWithPhoneNumber:(id)a3
{
  char *v4;
  id v5;
  NSObject *v6;
  AddressBookManager *v7;
  AddressBookManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;

  v4 = (char *)a3;
  if (!v4)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[AddressBookManager contactWithPhoneNumber:]";
      v26 = 2080;
      v27 = "AddressBookAddress.m";
      v28 = 1024;
      v29 = 586;
      v30 = 2080;
      v31 = "phoneNumber";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (objc_msgSend(v4, "length"))
  {
    v5 = sub_100408630();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v4));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v16));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager _contactWithCacheIdentifier:predicate:](self, "_contactWithCacheIdentifier:predicate:", v4, v17));

      goto LABEL_15;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_13;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

LABEL_13:
    *(_DWORD *)buf = 138543619;
    v25 = (const char *)v14;
    v26 = 2113;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact for phone %{private}@", buf, 0x16u);

    goto LABEL_14;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)_contactWithCacheIdentifier:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  AddressBookManager *v14;
  AddressBookManager *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  AddressBookManager *v22;
  AddressBookManager *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  _BOOL4 v39;
  BOOL v40;
  AddressBookManager *v41;
  AddressBookManager *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  AddressBookManager *v48;
  AddressBookManager *v49;
  objc_class *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v62;
  _QWORD v63[5];
  id v64;
  uint8_t buf[4];
  __CFString *v66;
  __int16 v67;
  id v68;
  _BYTE v69[24];
  __int128 v70;
  id v71;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v56 = sub_1004318FC();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v69 = 136315906;
      *(_QWORD *)&v69[4] = "-[AddressBookManager _contactWithCacheIdentifier:predicate:]";
      *(_WORD *)&v69[12] = 2080;
      *(_QWORD *)&v69[14] = "AddressBookAddress.m";
      *(_WORD *)&v69[22] = 1024;
      LODWORD(v70) = 597;
      WORD2(v70) = 2080;
      *(_QWORD *)((char *)&v70 + 6) = "predicate";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", v69, 0x26u);
    }

    if (sub_100A70734())
    {
      v58 = sub_1004318FC();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)v69 = 138412290;
        *(_QWORD *)&v69[4] = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%@", v69, 0xCu);

      }
    }
    goto LABEL_64;
  }
  if (!+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
  {
LABEL_64:
    v30 = 0;
    goto LABEL_65;
  }
  *(_QWORD *)v69 = 0;
  *(_QWORD *)&v69[8] = v69;
  *(_QWORD *)&v69[16] = 0x3032000000;
  *(_QWORD *)&v70 = sub_10040C0A4;
  *((_QWORD *)&v70 + 1) = sub_10040C0B4;
  v71 = 0;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contactCache, "objectForKeyedSubscript:", v6));
    v9 = *(void **)(*(_QWORD *)&v69[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v69[8] + 40) = v8;

  }
  os_unfair_lock_unlock(&self->_lock);
  v10 = *(_QWORD *)(*(_QWORD *)&v69[8] + 40);
  v11 = sub_100408630();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (!v13)
      goto LABEL_27;
    v22 = self;
    v23 = v22;
    if (!v22)
    {
      v29 = CFSTR("<nil>");
      goto LABEL_26;
    }
    v24 = (objc_class *)objc_opt_class(v22);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && (objc_msgSend(v27, "isEqualToString:", v26) & 1) == 0)
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_21;
      }

    }
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_21:

LABEL_26:
    *(_DWORD *)buf = 138543618;
    v66 = v29;
    v67 = 2114;
    v68 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] need to fetch uncached contact with identifier %{public}@", buf, 0x16u);

LABEL_27:
    v31 = objc_alloc((Class)CNContactFetchRequest);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager properties](self, "properties"));
    v33 = objc_msgSend(v31, "initWithKeysToFetch:", v32);

    objc_msgSend(v33, "setPredicate:", v7);
    objc_msgSend(v33, "setSortOrder:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager contactStore](self, "contactStore"));
    v64 = 0;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10040D0E8;
    v63[3] = &unk_1011B54F0;
    v63[4] = v69;
    objc_msgSend(v34, "enumerateContactsWithFetchRequest:error:usingBlock:", v33, &v64, v63);
    v35 = v64;

    v36 = *(_QWORD *)(*(_QWORD *)&v69[8] + 40);
    v37 = sub_100408630();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
    v40 = v6 == 0;
    if (!v36)
      v40 = 1;
    if (!v40)
    {
      if (!v39)
      {
LABEL_48:

        os_unfair_lock_lock(&self->_lock);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contactCache, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&v69[8] + 40), v6);
        os_unfair_lock_unlock(&self->_lock);
LABEL_52:
        v30 = *(id *)(*(_QWORD *)&v69[8] + 40);

        goto LABEL_53;
      }
      v41 = self;
      v42 = v41;
      if (!v41)
      {
        v47 = CFSTR("<nil>");
        goto LABEL_47;
      }
      v43 = (objc_class *)objc_opt_class(v41);
      v44 = NSStringFromClass(v43);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v44);
      if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
        v46 = v45;
        if (v45 && (objc_msgSend(v45, "isEqualToString:", v62) & 1) == 0)
        {
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v62, v42, v46));

          goto LABEL_37;
        }

      }
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v62, v42));
LABEL_37:

LABEL_47:
      *(_DWORD *)buf = 138543618;
      v66 = v47;
      v67 = 2114;
      v68 = v6;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}@] will cache contact with identifier %{public}@", buf, 0x16u);

      goto LABEL_48;
    }
    if (!v39)
    {
LABEL_51:

      goto LABEL_52;
    }
    v48 = self;
    v49 = v48;
    if (!v48)
    {
      v55 = CFSTR("<nil>");
      goto LABEL_50;
    }
    v50 = (objc_class *)objc_opt_class(v48);
    v51 = NSStringFromClass(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    if ((objc_opt_respondsToSelector(v49, "accessibilityIdentifier") & 1) != 0)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v49, "performSelector:", "accessibilityIdentifier"));
      v54 = v53;
      if (v53 && (objc_msgSend(v53, "isEqualToString:", v52) & 1) == 0)
      {
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v52, v49, v54));

        goto LABEL_45;
      }

    }
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v52, v49));
LABEL_45:

LABEL_50:
    *(_DWORD *)buf = 138543618;
    v66 = v55;
    v67 = 2114;
    v68 = v6;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}@] no contact found for identifier %{public}@", buf, 0x16u);

    goto LABEL_51;
  }
  if (v13)
  {
    v14 = self;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_23;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && (objc_msgSend(v19, "isEqualToString:", v18) & 1) == 0)
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_13;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_13:

LABEL_23:
    *(_DWORD *)buf = 138543618;
    v66 = v21;
    v67 = 2114;
    v68 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] fetched cached contact with identifier %{public}@", buf, 0x16u);

  }
  v30 = *(id *)(*(_QWORD *)&v69[8] + 40);
LABEL_53:
  _Block_object_dispose(v69, 8);

LABEL_65:
  return v30;
}

- (id)senderNameForAddress:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  AddressBookManager *v10;
  AddressBookManager *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10040C0A4;
  v26 = sub_10040C0B4;
  v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10040D398;
  v21[3] = &unk_1011B54F0;
  v21[4] = &v22;
  -[AddressBookManager _enumerateContactsWithAddress:ofType:handler:](self, "_enumerateContactsWithAddress:ofType:handler:", v6, v7, v21);
  v8 = sub_100408630();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0)
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

LABEL_10:
    v18 = v23[5];
    *(_DWORD *)buf = 138544131;
    v29 = v17;
    v30 = 2113;
    v31 = v18;
    v32 = 2113;
    v33 = v6;
    v34 = 2113;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] resolved sender name %{private}@ for address \"%{private}@\", type %{private}@", buf, 0x2Au);

  }
  v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)spokenContactNameForAddress:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  AddressBookManager *v10;
  AddressBookManager *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10040C0A4;
  v26 = sub_10040C0B4;
  v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10040D668;
  v21[3] = &unk_1011B54F0;
  v21[4] = &v22;
  -[AddressBookManager _enumerateContactsWithAddress:ofType:handler:](self, "_enumerateContactsWithAddress:ofType:handler:", v6, v7, v21);
  v8 = sub_100408630();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0)
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

LABEL_10:
    v18 = v23[5];
    *(_DWORD *)buf = 138544131;
    v29 = v17;
    v30 = 2113;
    v31 = v18;
    v32 = 2113;
    v33 = v6;
    v34 = 2113;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] resolved spoken name %{private}@ for address \"%{private}@\", type %{private}@", buf, 0x2Au);

  }
  v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (void)_enumerateContactsWithAddress:(id)a3 ofType:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  AddressBookManager *v13;
  AddressBookManager *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  __CFString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed"))
    goto LABEL_18;
  v11 = sub_100408630();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_9;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543875;
    v29 = v20;
    v30 = 2113;
    v31 = v8;
    v32 = 2113;
    v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] will enumerate contacts with address \"%{private}@\", type %{private}@...", buf, 0x20u);

  }
  v21 = objc_alloc((Class)CNContactFetchRequest);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager properties](self, "properties"));
  v23 = objc_msgSend(v21, "initWithKeysToFetch:", v22);

  if (objc_msgSend(v9, "isEqualToString:", CNContactEmailAddressesKey))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", v8));
  }
  else if (objc_msgSend(v9, "isEqualToString:", CNContactPhoneNumbersKey))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v8));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v25));

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v23, "setPredicate:", v24);
  objc_msgSend(v23, "setSortOrder:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager contactStore](self, "contactStore"));
  v27 = 0;
  objc_msgSend(v26, "enumerateContactsWithFetchRequest:error:usingBlock:", v23, &v27, v10);

LABEL_18:
}

- (id)addressForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  AddressBookManager *v14;
  AddressBookManager *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int128 v33;
  NSDictionary *schoolAddresses;
  _BYTE v35[128];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v33 = *(_OWORD *)&self->_homeAddresses;
    schoolAddresses = self->_schoolAddresses;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 3));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", v4));
          if (v10)
          {
            v11 = (void *)v10;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

    v12 = sub_100408630();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    v14 = self;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_19;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_19:

LABEL_22:
    *(_DWORD *)buf = 138543875;
    v28 = v21;
    v29 = 2113;
    v30 = v4;
    v31 = 2113;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] found match for \"%{private}@\": %{private}@", buf, 0x20u);

LABEL_23:
    goto LABEL_24;
  }
  v11 = 0;
LABEL_24:

  return v11;
}

- (id)addressForAddressObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  AddressBookManager *v24;
  AddressBookManager *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  NSObject *v33;
  AddressBookManager *v34;
  AddressBookManager *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  id v42;
  uint64_t v44;
  id v45;
  AddressBookManager *v46;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  __CFString *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _QWORD v63[3];
  _BYTE v64[128];

  v4 = a3;
  if (!v4)
  {
    v42 = 0;
    goto LABEL_44;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_homeAddresses, "allValues"));
  v63[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_workAddresses, "allValues"));
  v63[1] = v6;
  v46 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_schoolAddresses, "allValues"));
  v63[2] = v7;
  v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 3));

  v45 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v45)
  {
    v9 = *(_QWORD *)v53;
    v47 = v8;
    v44 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v49;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v49 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "geocodedMapItem"));

              if (v18)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "geocodedMapItem"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_geoMapItem"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addressObject"));

                if (v21 && objc_msgSend(v21, "isEqual:", v4))
                {
                  v32 = sub_100408630();
                  v33 = objc_claimAutoreleasedReturnValue(v32);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    v34 = v46;
                    v35 = v34;
                    if (v34)
                    {
                      v36 = (objc_class *)objc_opt_class(v34);
                      v37 = NSStringFromClass(v36);
                      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
                      if ((objc_opt_respondsToSelector(v35, "accessibilityIdentifier") & 1) == 0)
                        goto LABEL_34;
                      v39 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v35, "performSelector:", "accessibilityIdentifier"));
                      v40 = v39;
                      if (v39 && !objc_msgSend(v39, "isEqualToString:", v38))
                      {
                        v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v38, v35, v40));

                      }
                      else
                      {

LABEL_34:
                        v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v38, v35));
                      }

                    }
                    else
                    {
                      v41 = CFSTR("<nil>");
                    }

                    *(_DWORD *)buf = 138543875;
                    v57 = v41;
                    v58 = 2113;
                    v59 = v4;
                    v60 = 2113;
                    v61 = v17;
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}@] found match for address object %{private}@: %{private}@", buf, 0x20u);

                  }
                  v42 = v17;

                  v23 = v47;
                  goto LABEL_43;
                }

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
            if (v14)
              continue;
            break;
          }
        }

        v9 = v44;
        v8 = v47;
      }
      v45 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v45);
  }

  v22 = sub_100408630();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = v46;
    v25 = v24;
    if (!v24)
    {
      v31 = CFSTR("<nil>");
      goto LABEL_41;
    }
    v26 = (objc_class *)objc_opt_class(v24);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookManager performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_27;
      }

    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_27:

LABEL_41:
    *(_DWORD *)buf = 138543619;
    v57 = v31;
    v58 = 2113;
    v59 = v4;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}@] no match found for address object %{private}@", buf, 0x16u);

  }
  v42 = 0;
LABEL_43:

LABEL_44:
  return v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutManager, 0);
  objc_storeStrong((id *)&self->_msgCorrectedMapItemProvider, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_otherAddresses, 0);
  objc_storeStrong((id *)&self->_schoolAddresses, 0);
  objc_storeStrong((id *)&self->_workAddresses, 0);
  objc_storeStrong((id *)&self->_homeAddresses, 0);
  objc_storeStrong((id *)&self->_collectGroup, 0);
  objc_storeStrong((id *)&self->_deferredAddressCollectionTimer, 0);
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactStoreQueue, 0);
}

@end
