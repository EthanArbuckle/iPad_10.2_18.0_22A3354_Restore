@implementation FavoritesPersistence

- (void)_accountsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  FavoritesPersistence *v15;
  char v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ECMailAccountsDidChangeNotificationKeyPreviousAccountIdentifiers));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", ECMailAccountsDidChangeNotificationKeyAccountIdentifiers));

  v16 = objc_msgSend(v6, "isEqualToSet:", v8) ^ 1;
  v9 = v6;
  v13 = v9;
  v10 = v8;
  v14 = v10;
  v15 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10003B960, &unk_10051D020));
  objc_msgSend(v11, "performBlock:", &v12);

}

- (void)_mailboxListingChanged:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FavoritesPersistence *v13;
  uint8_t buf[4];
  void *v15;

  v5 = a3;
  v6 = sub_10000EE34((uint64_t)FavoritesPersistence);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009778;
  v11[3] = &unk_10051A910;
  v12 = v5;
  v13 = self;
  v10 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

- (FavoritesPersistence)initWithConversationSubscriptionProvider:(id)a3 accountsProvider:(id)a4 mailboxPersistence:(id)a5 daemonInterface:(id)a6 analyticsCollector:(id)a7
{
  id v13;
  id v14;
  FavoritesPersistence *v15;
  FavoritesPersistence *v16;
  NSRecursiveLock *v17;
  NSRecursiveLock *lock;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSString *storagePath;
  uint64_t v23;
  EFScheduler *writeCollectionScheduler;
  uint64_t v25;
  EFScheduler *mergeExternalChangesScheduler;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  FavoritesPersistence *v34;
  id v35;
  uint64_t v36;
  EFCancelable *favoritesPersistenceUpdateToken;
  id v38;
  uint64_t v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  NSUbiquitousKeyValueStore *kvStore;
  NSObject *v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  EFCancelable *userDefaultsObserver;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD block[4];
  NSObject *v59;
  FavoritesPersistence *v60;
  _QWORD v61[4];
  FavoritesPersistence *v62;
  id v63;
  objc_super v64;
  _BYTE buf[12];

  v52 = a3;
  v53 = a4;
  v54 = a5;
  v13 = a6;
  v14 = a7;
  v64.receiver = self;
  v64.super_class = (Class)FavoritesPersistence;
  v15 = -[FavoritesPersistence init](&v64, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountsProvider, a4);
    objc_storeStrong((id *)&v16->_conversationSubscriptionProvider, a3);
    v17 = (NSRecursiveLock *)objc_msgSend(objc_alloc((Class)MFRecursiveLock), "initWithName:andDelegate:", CFSTR("FavoritesManagerLock"), 0);
    lock = v16->_lock;
    v16->_lock = v17;

    v19 = MFMailDirectory();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("MailboxCollections.plist")));
    storagePath = v16->_storagePath;
    v16->_storagePath = (NSString *)v21;

    objc_storeStrong((id *)&v16->_mailboxPersistence, a5);
    objc_storeStrong((id *)&v16->_daemonInterface, a6);
    v23 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.FavoritesPersistence.writeCollectionData"), 17));
    writeCollectionScheduler = v16->_writeCollectionScheduler;
    v16->_writeCollectionScheduler = (EFScheduler *)v23;

    v25 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:](EFScheduler, "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.FavoritesPersistence.mergeExternalChanges")));
    mergeExternalChangesScheduler = v16->_mergeExternalChangesScheduler;
    v16->_mergeExternalChangesScheduler = (EFScheduler *)v25;

    sub_100021364((uint64_t)v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v28 = MFUserAgent(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = objc_msgSend(v29, "isMaild");

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[EFObservable observableOnNotifyTokenWithName:](EFObservable, "observableOnNotifyTokenWithName:", CFSTR("FavoritePersistenceShouldReload")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "debounceWithTimeInterval:scheduler:", v32, 0.1));
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_1000A0C48;
      v61[3] = &unk_10051CE48;
      v34 = v16;
      v62 = v34;
      v35 = v27;
      v63 = v35;
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "subscribeWithResultBlock:", v61));
      favoritesPersistenceUpdateToken = v34->_favoritesPersistenceUpdateToken;
      v34->_favoritesPersistenceUpdateToken = (EFCancelable *)v36;

      objc_msgSend(v35, "postNotificationName:object:", CFSTR("MailApplicationFavoritesDidChange"), v34);
      v38 = objc_msgSend(v14, "registerForLogEventsWithPeriodicDataProvider:", v34);

    }
    objc_msgSend(v27, "addObserver:selector:name:object:", v16, "_mailboxListingChanged:", AccountMailboxListingDidChange, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v16, "_mailboxNameChanged:", MFMailboxUidWasRenamedNotification, 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v16, "_accountsDidChange:", ECMailAccountsDidChangeNotification, 0);
    v39 = MFUserAgent(objc_msgSend(v27, "addObserver:selector:name:object:", v16, "_focusDidChange:", CFSTR("MFFocusDidChangeNotification"), 0));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = objc_msgSend(v40, "isMaild");

    if ((v41 & 1) != 0)
    {
      objc_msgSend(v27, "addObserver:selector:name:object:", v16, "_keyValueStoreChangedExternally:", NSUbiquitousKeyValueStoreDidChangeExternallyNotification, 0);
    }
    else
    {
      v42 = objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore additionalStoreWithIdentifier:](NSUbiquitousKeyValueStore, "additionalStoreWithIdentifier:", CFSTR("com.apple.mail.favorites")));
      kvStore = v16->_kvStore;
      v16->_kvStore = (NSUbiquitousKeyValueStore *)v42;

      if (v16->_kvStore)
      {
        objc_msgSend(v27, "addObserver:selector:name:object:", v16, "_keyValueStoreChangedExternally:", NSUbiquitousKeyValueStoreDidChangeExternallyNotification);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000A0CD0;
        block[3] = &unk_10051A910;
        v59 = v27;
        v60 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        v44 = v59;
      }
      else
      {
        v45 = sub_10000EE34((uint64_t)FavoritesPersistence);
        v44 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = CFSTR("com.apple.mail.favorites");
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "failed to create kv store for %@", buf, 0xCu);
        }
      }

    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v47 = EMUserDefaultDisableFollowUp;
    v16->_hideFollowUp = objc_msgSend(v46, "BOOLForKey:", EMUserDefaultDisableFollowUp);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v16);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000A0D90;
    v55[3] = &unk_10051AD90;
    objc_copyWeak(&v57, (id *)buf);
    v48 = v46;
    v56 = v48;
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v47, 1, 1, v55));
    userDefaultsObserver = v16->_userDefaultsObserver;
    v16->_userDefaultsObserver = (EFCancelable *)v49;

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);

  }
  return v16;
}

- (id)dictionaryRepresentation
{
  id v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  FavoriteItem *lastSelectedItem;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = objc_alloc_init((Class)NSMutableArray);
  -[NSRecursiveLock lock](self->_lock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_mailboxCollections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "transient", (_QWORD)v14) & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryRepresentation"));
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Collections"));
  lastSelectedItem = self->_lastSelectedItem;
  if (lastSelectedItem)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem dictionaryRepresentation](lastSelectedItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("LastSelectedItem"));

  }
  return v3;
}

- (FavoritesCollection)mailboxesCollection
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[NSMutableArray count](self->_mailboxCollections, "count"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_mailboxCollections, "objectAtIndex:", 0));
  else
    v3 = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (FavoritesCollection *)v3;
}

- (BOOL)showingOutbox
{
  BOOL showingOutbox;

  -[NSRecursiveLock lock](self->_lock, "lock");
  showingOutbox = self->_showingOutbox;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return showingOutbox;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return objc_msgSend(a3, "isSyncingNotes");
}

- (BOOL)shouldHideInbox
{
  return self->_showingSingleAccount;
}

- (void)setLastSelectedItem:(id)a3
{
  void *v5;
  FavoriteItem *v6;

  v6 = (FavoriteItem *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_lastSelectedItem != v6)
  {
    objc_storeStrong((id *)&self->_lastSelectedItem, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setLastSelectedItem: %@"), v6));
    sub_100045FE4((uint64_t)self, v5);

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSMutableArray *visibleMailboxCollections;
  int v13;
  int64_t v14;
  __int16 v15;
  _BOOL8 v16;

  v7 = a5 > 0;
  v8 = MFLogGeneral(self);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = a5;
    v15 = 2048;
    v16 = a5 > 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Favorites Outbox countDidChange to: %lld shouldShow: %lld", (uint8_t *)&v13, 0x16u);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_showingOutbox == v7)
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  else
  {
    self->_showingOutbox = v7;
    v10 = MFLogGeneral(-[NSRecursiveLock unlock](self->_lock, "unlock"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Favorites Posting notifications for outbox visibility change", (uint8_t *)&v13, 2u);
    }

    visibleMailboxCollections = self->_visibleMailboxCollections;
    self->_visibleMailboxCollections = 0;

    sub_10000EEAC((uint64_t)self, 0);
  }
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDConversationSubscriptionProvider)conversationSubscriptionProvider
{
  return self->_conversationSubscriptionProvider;
}

- (void)_loadMailboxesAfterMailboxListingChanged
{
  sub_100046138((uint64_t)self, 1);
}

- (void)_keyValueStoreChangedExternally:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", NSUbiquitousKeyValueStoreChangeReasonKey));
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == (id)2)
  {
    v7 = sub_10000EE34((uint64_t)FavoritesPersistence);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100391B70(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", NSUbiquitousKeyValueStoreChangedKeysKey));
    sub_100008C78(self, v6, v16);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FavoritesPersistence;
  -[FavoritesPersistence dealloc](&v4, "dealloc");
}

- (id)mailboxesForAutoFetch
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 includeFavoriteMailboxesDuringFetch;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = objc_alloc((Class)NSMutableSet);
  v4 = sub_1000A167C((uint64_t)self, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithArray:", v5);

  -[NSRecursiveLock lock](self->_lock, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence mailboxesCollection](self, "mailboxesCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleItems"));

  includeFavoriteMailboxesDuringFetch = self->_includeFavoriteMailboxesDuringFetch;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "type", (_QWORD)v21) == (id)4)
        {
          v15 = v14;
          v16 = sub_1000A167C((uint64_t)self, (uint64_t)objc_msgSend(v15, "mailboxType"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          objc_msgSend(v6, "addObjectsFromArray:", v17);

LABEL_12:
          continue;
        }
        v18 = objc_msgSend(v14, "type");
        if (includeFavoriteMailboxesDuringFetch && v18 == (id)2)
        {
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representingMailbox"));
          if (v15)
            objc_msgSend(v6, "addObject:", v15);
          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  return v19;
}

- (id)indexPathForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = sub_10000BAD4((uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  for (i = 0; ; ++i)
  {
    if (i >= (unint64_t)objc_msgSend(v6, "count"))
    {
      v11 = 0;
      goto LABEL_7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", i));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleItems"));
    v10 = objc_msgSend(v9, "indexOfObject:", v4);

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
      break;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, i));

LABEL_7:
  return v11;
}

- (void)updateCollections:(id)a3 changeType:(unint64_t)a4 withReason:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  NSMutableArray *v12;
  NSMutableArray *mailboxCollections;
  NSMutableArray *visibleMailboxCollections;
  id v15;

  v15 = a3;
  v10 = a5;
  v11 = a6;
  sub_10002DC4C((uint64_t)self, v15, v10);
  -[NSRecursiveLock lock](self->_lock, "lock");
  v12 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");
  mailboxCollections = self->_mailboxCollections;
  self->_mailboxCollections = v12;

  visibleMailboxCollections = self->_visibleMailboxCollections;
  self->_visibleMailboxCollections = 0;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (a4 != 2)
    sub_10000EEAC((uint64_t)self, v11);

}

- (void)updateCollections:(id)a3 forItemChangeAddedItems:(id)a4 removedItems:(id)a5 withReason:(id)a6 source:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[FavoritesPersistence updateCollections:changeType:withReason:source:](self, "updateCollections:changeType:withReason:source:", v16, 0, v14, v15);
  -[NSRecursiveLock lock](self->_lock, "lock");
  sub_1000A1CAC((id *)&self->super.isa, v12, v13);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)updateCollections:(id)a3 forOrderChange:(unint64_t)a4 withReason:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a5;
  v11 = a6;
  -[FavoritesPersistence updateCollections:changeType:withReason:source:](self, "updateCollections:changeType:withReason:source:", v13, 1, v10, v11);
  if (a4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MailApplicationFavoritesOrderDidChange"), 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MailApplicationAccountsOrderDidChange"), 0);
  }

}

- (void)_focusDidChange:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  FavoritesPersistence *v6;
  id v7;

  v6 = self;
  v3 = a3;
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000A26E8, &unk_10051A910, v6));
  objc_msgSend(v4, "performBlock:", &v5);

}

- (void)_mailboxNameChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence mailboxesCollection](self, "mailboxesCollection"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsOfType:", 2));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "representingMailbox"));
      if ((objc_msgSend(v12, "isEqual:", v5) & 1) != 0)
        break;

      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v8 = v11;

    if (!v8)
      goto LABEL_14;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "syncKey"));
    if (objc_msgSend(v8, "shouldSync"))
    {
      objc_msgSend(v8, "wasChangedExternally");
      v14 = sub_1000A20C8(self, v8);
      -[NSUbiquitousKeyValueStore setObject:forKey:](self->_kvStore, "setObject:forKey:", v14, v13);
      -[NSUbiquitousKeyValueStore synchronize](self->_kvStore, "synchronize");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_mailboxNameChanged: changedItem: %@"), v8));
      sub_100045FE4((uint64_t)self, v15);

    }
  }
  else
  {
LABEL_9:
    v13 = v7;
  }

LABEL_14:
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)setVisibility:(BOOL)a3 forSourceType:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v14 = (id)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence mailboxesCollection](self, "mailboxesCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "items"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForSharedMailboxWithType:selected:](FavoriteItem, "itemForSharedMailboxWithType:selected:", a4, 0));
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v9));
    v12 = v11;
    if (!v11 || objc_msgSend(v11, "isSelected") == v5)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v12, "setSelected:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence mailboxCollections](self, "mailboxCollections"));
      sub_10002DC4C((uint64_t)self, v13, CFSTR("_sharedMailboxControllerBadgeCountDidChange"));

      objc_msgSend(v14, "invalidateVisibleItems");
      v10 = 1;
    }

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (v10)
    sub_10000EEAC((uint64_t)self, 0);

}

- (void)userNotificationCenterSettingsDidChange:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", MSUserNotificationCenterTopicFavoriteMailboxes));
  v5 = objc_msgSend(v4, "alertSetting") == (id)2
    || objc_msgSend(v4, "notificationCenterSetting") == (id)2
    || objc_msgSend(v4, "lockScreenSetting") == (id)2;
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_includeFavoriteMailboxesDuringFetch = v5;
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (BOOL)hasFavoriteMailboxes
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence mailboxesCollection](self, "mailboxesCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleItems"));
  v4 = objc_msgSend(v3, "ef_any:", &stru_10051D090);

  return v4;
}

- (id)favoriteMailboxesForAccount:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence orderedFavoriteMailboxesForAccount:includeUnifiedMailboxes:](self, "orderedFavoriteMailboxesForAccount:includeUnifiedMailboxes:", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "set"));

  return v4;
}

- (id)orderedFavoriteMailboxesForAccount:(id)a3 includeUnifiedMailboxes:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableOrderedSet);
  if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence mailboxesCollection](self, "mailboxesCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleItems"));

  }
  else
  {
    v10 = sub_1000A14F8((uint64_t)self, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "type") != (id)2)
        {
          if (objc_msgSend(v15, "type") != (id)4)
            continue;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "representingMailboxes"));
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1000A349C;
          v23[3] = &unk_10051D0B8;
          v24 = v6;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ef_filter:", v23));

          objc_msgSend(v7, "addObjectsFromArray:", v21);
          v19 = v24;
          goto LABEL_15;
        }
        v16 = v15;
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
        v18 = v17 == v6;

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "representingMailbox"));
          if (v19)
            objc_msgSend(v7, "addObject:", v19);
LABEL_15:

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  return v7;
}

- (id)coreAnalyticsPeriodicEvent
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesPersistence mailboxesCollection](self, "mailboxesCollection", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "analyticsKey"));
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
          v11 = (uint64_t)objc_msgSend(v10, "integerValue");

          if (v11 >= 1)
            v12 = 1;
          else
            v12 = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12 + 1));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v9);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = objc_msgSend(objc_alloc((Class)EMCoreAnalyticsEvent), "initWithEventName:collectionData:", CFSTR("com.apple.mail.mailboxes.favorites.configuration"), v3);
  return v14;
}

- (NSArray)mailboxCollections
{
  return &self->_mailboxCollections->super;
}

- (BOOL)includeFavoriteMailboxesDuringFetch
{
  return self->_includeFavoriteMailboxesDuringFetch;
}

- (FavoriteItem)lastSelectedItem
{
  return self->_lastSelectedItem;
}

- (NSString)storagePath
{
  return self->_storagePath;
}

- (void)setMailboxPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPersistence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_mergeExternalChangesScheduler, 0);
  objc_storeStrong((id *)&self->_favoritesPersistenceUpdateToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_writeCollectionScheduler, 0);
  objc_storeStrong((id *)&self->_outboxFuture, 0);
  objc_storeStrong((id *)&self->_outboxCountObserver, 0);
  objc_storeStrong((id *)&self->_outbox, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_visibleMailboxCollections, 0);
  objc_storeStrong((id *)&self->_conversationSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
  objc_storeStrong((id *)&self->_lastSelectedItem, 0);
  objc_storeStrong((id *)&self->_mailboxCollections, 0);
}

@end
