@implementation FavoritesManager

- (NSMutableArray)visibleMailboxCollections
{
  NSMutableArray *visibleMailboxCollections;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  -[NSRecursiveLock lock](self->_lock, "lock");
  visibleMailboxCollections = self->_visibleMailboxCollections;
  if (!visibleMailboxCollections)
  {
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_mailboxCollections, "count"));
    v5 = self->_visibleMailboxCollections;
    self->_visibleMailboxCollections = v4;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_mailboxCollections;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v7)
      goto LABEL_19;
    v8 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v10, "isOutboxCollection"))
        {
          if (!objc_msgSend(v10, "isVisible"))
            continue;
          goto LABEL_13;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
        v12 = objc_msgSend(v11, "showingOutbox");

        if (v12)
        {
          v13 = MFLogGeneral();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Favorites Adding outbox to visibleMailboxCollections", v19, 2u);
          }

LABEL_13:
          -[NSMutableArray addObject:](self->_visibleMailboxCollections, "addObject:", v10);
          continue;
        }
        v15 = MFLogGeneral();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Favorites Did not add outbox to visibleMailboxCollections", v19, 2u);
        }

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v7)
      {
LABEL_19:

        visibleMailboxCollections = self->_visibleMailboxCollections;
        break;
      }
    }
  }
  v17 = -[NSMutableArray copy](visibleMailboxCollections, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSMutableArray *)v17;
}

- (void)mf_updateMailboxVocabularyForCollections:(id)a3
{
  id v4;
  FavoritesManager *v5;
  unint64_t v6;
  uint64_t v7;

  swift_getObjectType(self);
  v4 = a3;
  v5 = self;
  v6 = sub_10003CFD8();
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  sub_10003D03C();
  swift_bridgeObjectRelease(v7);

}

- (void)_reload:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FavoritesManager.m"), 305, CFSTR("Current thread must be main"));

  }
  v6 = sub_10001916C(self, v5);
  if ((_DWORD)v6)
  {
    v7 = MFLogGeneral(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Favorites _reload:%@", (uint8_t *)&v16, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryRepresentation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Collections")));

    if (v11)
    {
      -[FavoritesManager _reloadFromCollectionDictionaries:](self, "_reloadFromCollectionDictionaries:", v11);
      v13 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject postNotificationName:object:userInfo:](v13, "postNotificationName:object:userInfo:", CFSTR("FavoritesManagerFavoritesDidChangeNotification"), self, 0);
    }
    else
    {
      v14 = MFLogGeneral(v12);
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#Favorites Attempting to reload from empty collection", (uint8_t *)&v16, 2u);
      }
    }

  }
}

- (void)_debounceReload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  if (sub_10001916C(self, v4)
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager reloadDebouncer](self, "reloadDebouncer")),
        v5,
        v5))
  {
    v7 = MFLogGeneral(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Favorites _reload: debounced notification=%@", (uint8_t *)&v10, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager reloadDebouncer](self, "reloadDebouncer"));
    objc_msgSend(v9, "debounceResult:", v4);

  }
  else
  {
    -[FavoritesManager _reload:](self, "_reload:", v4);
  }

}

- (EFDebouncer)reloadDebouncer
{
  return self->_reloadDebouncer;
}

- (FavoritesManager)initWithFavoritesPersistence:(id)a3 collections:(id)a4 conversationSubscriptionProvider:(id)a5
{
  FavoritesManager *v9;
  FavoritesManager *v10;
  _UNKNOWN **v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  FavoriteItem *lastSelectedItem;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  void *v24;
  EFDebouncer *v25;
  EFDebouncer *reloadDebouncer;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  EFCancelable *userDefaultsObserver;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id location;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];

  v35 = a3;
  v37 = a4;
  v36 = a5;
  v48.receiver = self;
  v48.super_class = (Class)FavoritesManager;
  v9 = -[FavoritesManager init](&v48, "init");
  v10 = v9;
  v11 = MSSendMailIntent_ptr;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_favoritesPersistence, a3);
    objc_storeStrong((id *)&v10->_conversationSubscriptionProvider, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v10->_hasLaunchedWithCollapsibleMailboxes = objc_msgSend(v12, "BOOLForKey:", CFSTR("FavoritesManagerDefaultKeyHasLaunchedWithCollapsibleMailboxes"));

    if (v37 && -[FavoritesManager _isDictionaryRepresentationValid:](v10, "_isDictionaryRepresentationValid:", v37))
    {
      v13 = v37;
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(-[FavoritesPersistence dictionaryRepresentation](v10->_favoritesPersistence, "dictionaryRepresentation"));

      v13 = (void *)v14;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Collections")));
    v37 = v13;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LastSelectedItem")));
    if (v33)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[FavoriteItem itemFromDictionary:](FavoriteItem, "itemFromDictionary:", v33));
      lastSelectedItem = v10->_lastSelectedItem;
      v10->_lastSelectedItem = (FavoriteItem *)v15;

    }
    -[FavoritesManager mf_resetMailboxVocabulary](v10, "mf_resetMailboxVocabulary");
    -[FavoritesManager _reloadFromCollectionDictionaries:](v10, "_reloadFromCollectionDictionaries:", v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v18 = objc_msgSend(&off_100542160, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v45;
      v20 = SharedMailboxControllerBadgeCountDidChangeNotification;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(&off_100542160);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue")));
          objc_msgSend(v17, "addObserver:selector:name:object:", v10, "_sharedMailboxControllerBadgeCountDidChange:", v20, v22);

        }
        v18 = objc_msgSend(&off_100542160, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v18);
    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v23 = objc_alloc((Class)EFDebouncer);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10003A248;
    v41[3] = &unk_10051CC50;
    objc_copyWeak(&v42, &location);
    v25 = (EFDebouncer *)objc_msgSend(v23, "initWithTimeInterval:scheduler:startAfter:block:", v24, 1, v41, 0.025);
    reloadDebouncer = v10->_reloadDebouncer;
    v10->_reloadDebouncer = v25;

    objc_msgSend(v17, "addObserver:selector:name:object:", v10, "_debounceReload:", off_10059ECF0, 0);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    v11 = MSSendMailIntent_ptr;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[135], "em_userDefaults"));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v10);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10009E724;
  v38[3] = &unk_10051AD90;
  objc_copyWeak(&v40, &location);
  v28 = EMUserDefaultDisableFollowUp;
  v39 = v27;
  v29 = v27;
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v28, 1, 1, v38));
  userDefaultsObserver = v10->_userDefaultsObserver;
  v10->_userDefaultsObserver = (EFCancelable *)v30;

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v10;
}

- (void)_reloadFromCollectionDictionaries:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  FavoritesCollection *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *m;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  id v41;
  uint64_t v42;
  void *n;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *ii;
  void *v49;
  id v50;
  NSMutableArray *visibleMailboxCollections;
  id v52;
  id v53;
  uint64_t v54;
  void *jj;
  id v56;
  id v57;
  uint64_t v58;
  void *kk;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *k;
  id obj;
  id v71;
  void *v72;
  id v74;
  id v75;
  NSMutableArray *v76;
  unsigned int v77;
  NSMutableDictionary *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint8_t v118[128];
  uint8_t buf[4];
  id v120;

  v62 = a3;
  v3 = MFLogGeneral(v62);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v120 = v62;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Favorites _reloadFromCollectionDictionaries:%@", buf, 0xCu);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[NSMutableArray count](self->_mailboxCollections, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager accountsCollection](self, "accountsCollection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_filter:", &stru_10051CC90));

  }
  else
  {
    v66 = 0;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v7 = _os_feature_enabled_impl("Mail", "CollapsibleMailboxes");
  v77 = v7 & ~-[FavoritesManager hasLaunchedWithCollapsibleMailboxes](self, "hasLaunchedWithCollapsibleMailboxes");
  if (v77 == 1)
    sub_10009EA10((uint64_t)self, 1);
  v75 = objc_alloc_init((Class)NSMutableArray);
  v74 = objc_alloc_init((Class)NSMutableArray);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v62;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v108 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
        v12 = -[FavoritesCollection initWithDictionary:]([FavoritesCollection alloc], "initWithDictionary:", v11);
        objc_msgSend(v75, "addObject:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("expandedItems")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ef_compactMap:", &stru_10051CCD0));
        objc_msgSend(v74, "addObjectsFromArray:", v14);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "ef_filter:", &stru_10051CCF0));
  objc_msgSend(v74, "addObjectsFromArray:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectAtIndex:", 2));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "ef_filter:", &stru_10051CD10));
  v76 = objc_opt_new(NSMutableArray);
  v78 = objc_opt_new(NSMutableDictionary);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v71 = v74;
  v17 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v104 != v18)
          objc_enumerationMutation(v71);
        v20 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)j);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "itemUUID"));
        if (v21)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", v20, v21);

      }
      v17 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
    }
    while (v17);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v63 = v60;
  v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v100;
    do
    {
      for (k = 0; k != v65; k = (char *)k + 1)
      {
        if (*(_QWORD *)v100 != v64)
          objc_enumerationMutation(v63);
        v22 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)k);
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "account"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
        v67 = v22;
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allMailboxUidsSortedWithSpecialsAtTopForAccount:includingLocals:client:outbox:", v72, 1, v24, 0));

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v26 = v68;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v96;
          do
          {
            for (m = 0; m != v27; m = (char *)m + 1)
            {
              if (*(_QWORD *)v96 != v28)
                objc_enumerationMutation(v26);
              v30 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)m);
              if (v7)
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForMailbox:selected:](FavoriteItem, "itemForMailbox:selected:", v30, 1));
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "itemUUID"));
                v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v78, "objectForKeyedSubscript:", v32));

                if (v77)
                  v34 = objc_msgSend(v31, "isExpandable");
                else
                  v34 = 0;
                objc_msgSend(v31, "setExpanded:", objc_msgSend(v33, "isExpanded") | v34);
                objc_msgSend(v25, "addObject:", v31);
                if (objc_msgSend(v31, "isExpanded"))
                  -[NSMutableArray addObject:](v76, "addObject:", v31);

              }
              else
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForMailbox:selected:](FavoriteItem, "itemForMailbox:selected:", v30, 1));
                objc_msgSend(v25, "addObject:", v31);
              }

            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
          }
          while (v27);
        }

        v36 = MFLogGeneral(v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "ef_publicDescription"));
          *(_DWORD *)buf = 138543362;
          v120 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#Favorites Settings mailbox items for account: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v67, "setSubItems:", v25);

      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
    }
    while (v65);
  }

  if (v7)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectAtIndexedSubscript:", 2));
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v40 = v76;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v92;
      do
      {
        for (n = 0; n != v41; n = (char *)n + 1)
        {
          if (*(_QWORD *)v92 != v42)
            objc_enumerationMutation(v40);
          objc_msgSend(v39, "addExpandedItem:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)n));
        }
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
      }
      while (v41);
    }

  }
  v44 = objc_alloc_init((Class)NSMutableArray);
  if (v66)
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v45 = v63;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
    if (!v46)
      goto LABEL_70;
    v47 = *(_QWORD *)v88;
    while (1)
    {
      for (ii = 0; ii != v46; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v88 != v47)
          objc_enumerationMutation(v45);
        v49 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)ii);
        v50 = objc_msgSend(v66, "containsObject:", v49);
        if (!(_DWORD)v50)
        {
          if (!objc_msgSend(v49, "isExpanded"))
            continue;
LABEL_67:
          objc_msgSend(v49, "setExpanded:", v50);
          objc_msgSend(v44, "addObject:", v49);
          continue;
        }
        if ((objc_msgSend(v49, "isExpanded") & 1) == 0)
          goto LABEL_67;
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
      if (!v46)
      {
LABEL_70:

        break;
      }
    }
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_storeStrong((id *)&self->_mailboxCollections, v75);
  visibleMailboxCollections = self->_visibleMailboxCollections;
  self->_visibleMailboxCollections = 0;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (v77)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "ef_filter:", &stru_10051CD30));
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v84;
      do
      {
        for (jj = 0; jj != v53; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v84 != v54)
            objc_enumerationMutation(v52);
          -[FavoritesManager refreshCollectionForItemExpansion:](self, "refreshCollectionForItemExpansion:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)jj));
        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
      }
      while (v53);
    }

  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v56 = v44;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v80;
    do
    {
      for (kk = 0; kk != v57; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v80 != v58)
          objc_enumerationMutation(v56);
        -[FavoritesManager refreshCollectionForItemExpansion:notify:](self, "refreshCollectionForItemExpansion:notify:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)kk), 0);
      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
    }
    while (v57);
  }

  -[FavoritesManager mf_updateMailboxVocabularyForCollections:](self, "mf_updateMailboxVocabularyForCollections:", v75);
}

- (void)mf_resetMailboxVocabulary
{
  FavoritesManager *v3;

  swift_getObjectType(self);
  v3 = self;
  sub_10003D09C();

}

- (void)setPreviousSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousSelectedItem, a3);
}

- (void)setLastSelectedItem:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[FavoritesManager setPreviousSelectedItem:](self, "setPreviousSelectedItem:", self->_lastSelectedItem);
  objc_storeStrong((id *)&self->_lastSelectedItem, a3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
  objc_msgSend(v5, "setLastSelectedItem:", v6);

}

- (id)mailboxesCollection
{
  return -[NSMutableArray objectAtIndex:](self->_mailboxCollections, "objectAtIndex:", 0);
}

- (FavoriteItem)lastSelectedItem
{
  FavoriteItem *lastSelectedItem;
  FavoriteItem *v4;
  void *v5;
  void *v6;
  FavoriteItem *v7;
  FavoriteItem *v8;

  -[NSRecursiveLock lock](self->_lock, "lock");
  lastSelectedItem = self->_lastSelectedItem;
  if (lastSelectedItem)
    v4 = lastSelectedItem;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (!lastSelectedItem)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
    lastSelectedItem = (FavoriteItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastSelectedItem"));

    -[NSRecursiveLock lock](self->_lock, "lock");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
    v7 = (FavoriteItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastSelectedItem"));
    v8 = self->_lastSelectedItem;
    self->_lastSelectedItem = v7;

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  return lastSelectedItem;
}

- (BOOL)hasLaunchedWithCollapsibleMailboxes
{
  return self->_hasLaunchedWithCollapsibleMailboxes;
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (id)accountsCollection
{
  return -[NSMutableArray objectAtIndex:](self->_mailboxCollections, "objectAtIndex:", 2);
}

- (void)_reportFollowUpFeatureSetting:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _BYTE v12[24];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SGSuggestionsService serviceForMail](SGSuggestionsService, "serviceForMail"));
  objc_msgSend(v4, "setSyncTimeout:", 0.1);
  if ((objc_opt_respondsToSelector(v4, "reportValue:forFeatureSetting:error:") & 1) != 0)
  {
    v11 = 0;
    v5 = objc_msgSend(v4, "reportValue:forFeatureSetting:error:", !v3, 0, &v11);
    v6 = v11;
    if (v6)
    {
      v7 = v6;
      v8 = MFLogGeneral(v6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
        sub_1003919BC(v10, (uint64_t)v12, v9);
      }

    }
  }

}

- (id)collectionContainingItem:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_mailboxCollections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items", (_QWORD)v13));
        v11 = objc_msgSend(v10, "containsObject:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setAccountsCollection:(id)a3
{
  -[NSMutableArray setObject:atIndexedSubscript:](self->_mailboxCollections, "setObject:atIndexedSubscript:", a3, 2);
}

- (id)itemsOfType:(int64_t)a3
{
  id v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = objc_alloc_init((Class)NSMutableArray);
  -[NSRecursiveLock lock](self->_lock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_mailboxCollections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "itemsOfType:", a3, (_QWORD)v12));
        objc_msgSend(v5, "addObjectsFromArray:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (id)itemsMatchingName:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  -[NSRecursiveLock lock](self->_lock, "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_mailboxCollections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "itemsMatchingName:", v4, (_QWORD)v13));
        objc_msgSend(v5, "addObjectsFromArray:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array"));

  return v11;
}

- (id)itemsMatchingItemURLStrings:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  -[NSRecursiveLock lock](self->_lock, "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_mailboxCollections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "itemsMatchingItemURLStrings:", v4, (_QWORD)v13));
        objc_msgSend(v5, "addObjectsFromArray:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array"));

  return v11;
}

- (id)itemsContainingName:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  -[NSRecursiveLock lock](self->_lock, "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_mailboxCollections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "itemsContainingName:", v4, (_QWORD)v13));
        objc_msgSend(v5, "addObjectsFromArray:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array"));

  return v11;
}

- (NSArray)suggestedFavoriteItems
{
  id v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  -[NSRecursiveLock lock](self->_lock, "lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_mailboxCollections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), "itemsIncludingSubItems", (_QWORD)v11));
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "array"));

  return (NSArray *)v9;
}

- (id)visibleItemsOfType:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager itemsOfType:](self, "itemsOfType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_filter:", &stru_10051CD50));

  return v4;
}

- (id)favoriteMailboxesForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "favoriteMailboxesForAccount:", v4));

  return v6;
}

- (id)orderedFavoriteMailboxesForAccount:(id)a3 includeUnifiedMailboxes:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "orderedFavoriteMailboxesForAccount:includeUnifiedMailboxes:", v6, v4));

  return v8;
}

- (void)performTransaction:(id)a3
{
  void (**v4)(id, FavoritesManager *);

  v4 = (void (**)(id, FavoritesManager *))a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (v4)
    v4[2](v4, self);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)moveItemOfCollection:(id)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v8 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", a5));
  if (objc_msgSend(v8, "isAccountsCollection") && (v12 = objc_msgSend(v11, "type"), v12 != (id)1))
  {
    if (a5 < 1)
    {
LABEL_8:
      v13 = v11;
    }
    else
    {
      v14 = a5 + 1;
      while (1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v14 - 2));
        if (objc_msgSend(v13, "type") == (id)1)
          break;

        if ((unint64_t)--v14 <= 1)
          goto LABEL_8;
      }

    }
    v15 = MFLogGeneral(v12);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "#Favorites visibleItems:%@ fromItem:%@ toItem:%@", buf, 0x20u);
    }

  }
  else
  {
    v13 = v11;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  v18 = objc_msgSend(v17, "mutableCopy");

  v19 = objc_msgSend(v18, "indexOfObject:", v10);
  v20 = objc_msgSend(v18, "indexOfObject:", v13);
  objc_msgSend(v18, "ef_moveObjectAtIndex:toIndex:", (int)v19, (int)v20);
  objc_msgSend(v8, "setItems:", v18);
  v21 = objc_msgSend(v8, "isAccountsCollection");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("moveItemOfCollection:%@ from:%ld to:%ld"), v8, v19, v20));
  -[FavoritesManager scheduleOrderChangeUpdateFavoritesPersistence:withReason:](self, "scheduleOrderChangeUpdateFavoritesPersistence:withReason:", v21 ^ 1, v22);

}

- (BOOL)updateCollections:(id)a3 withItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  char v14;
  unint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *k;
  uint64_t v30;
  FavoritesManager *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;

  v6 = a3;
  v7 = a4;
  v35 = v6;
  v8 = v6;
  v9 = v7;
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v9, "count"))
    __assert_rtn("-[FavoritesManager updateCollections:withItems:]", "FavoritesManager.m", 539, "collections.count == itemArrays.count");
  v32 = self;
  v33 = v9;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = MFLogGeneral(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v35;
    v49 = 2112;
    v50 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Favorites updateCollections:%@ withItems:%@", buf, 0x16u);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  v14 = 0;
  for (i = 0; i < (unint64_t)objc_msgSend(v35, "count"); i = v34 + 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndex:", i));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndex:", i));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v18));

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v17, "containsObject:", v24) & 1) == 0
            && objc_msgSend(v24, "isDeletable"))
          {
            v25 = objc_msgSend(v16, "removeItem:", v24);
            objc_msgSend(v36, "addObject:", v24);
            v14 = 1;
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v21);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = v17;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    v34 = i;
    if (v27)
    {
      v28 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v26);
          v30 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
          if ((objc_msgSend(v20, "containsObject:", v30) & 1) == 0)
          {
            objc_msgSend(v16, "addItem:ordered:", v30, 1);
            objc_msgSend(v11, "addObject:", v30);
            v14 = 1;
          }
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v27);
    }

  }
  -[NSRecursiveLock unlock](v32->_lock, "unlock");
  -[FavoritesManager scheduleItemChangeUpdateFavoritesPersistence:removedItems:withReason:](v32, "scheduleItemChangeUpdateFavoritesPersistence:removedItems:withReason:", v11, v36, CFSTR("updateCollections:withItems:"));

  return v14 & 1;
}

- (void)refreshCollectionForItemExpansion:(id)a3
{
  -[FavoritesManager refreshCollectionForItemExpansion:notify:](self, "refreshCollectionForItemExpansion:notify:", a3, 1);
}

- (void)refreshCollectionForItemExpansion:(id)a3 notify:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _BOOL4 v20;
  FavoritesManager *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v20 = a4;
  v5 = a3;
  v21 = self;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FavoritesManager visibleMailboxCollections](self, "visibleMailboxCollections"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
      v12 = objc_msgSend(v11, "indexOfObject:", v5);

      if (v12 != (id)0x7FFFFFFFFFFFFFFFLL
        || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "expandedItems")),
            v14 = objc_msgSend(v13, "indexOfObject:", v5),
            v13,
            v14 != (id)0x7FFFFFFFFFFFFFFFLL))
      {
        if ((objc_msgSend(v10, "isMailboxesCollection") & 1) == 0)
          break;
      }
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    v16 = v10;

    if (!v16)
      goto LABEL_15;
    -[NSRecursiveLock lock](v21->_lock, "lock");
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v16, "addOrUpdateExpandedItem:replacedItem:", v5, 0);
    else
      objc_msgSend(v16, "addOrUpdateItem:replacedItem:", v5, 0);
    -[NSRecursiveLock unlock](v21->_lock, "unlock");
    if (v20)
      -[FavoritesManager scheduleUpdateFavoritesPersistenceForChangeType:withReason:](v21, "scheduleUpdateFavoritesPersistenceForChangeType:withReason:", 2, CFSTR("refreshCollectionForItemExpansion"));
  }
  else
  {
LABEL_11:

LABEL_15:
    v17 = MFLogGeneral(v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100391A08((uint64_t)v5, v18, v19);

    v16 = 0;
  }

}

- (void)scheduleUpdateFavoritesPersistenceForChangeType:(unint64_t)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NSMutableArray *v15;
  id v16;
  FavoritesManager *v17;
  unint64_t v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
  v8 = self->_mailboxCollections;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A0110;
  v13[3] = &unk_10051CD78;
  v10 = v7;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  v18 = a3;
  v12 = v6;
  v16 = v12;
  v17 = self;
  objc_msgSend(v9, "performBlock:", v13);

}

- (void)scheduleOrderChangeUpdateFavoritesPersistence:(unint64_t)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NSMutableArray *v15;
  id v16;
  FavoritesManager *v17;
  unint64_t v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
  v8 = self->_mailboxCollections;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A0268;
  v13[3] = &unk_10051CD78;
  v10 = v7;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  v18 = a3;
  v12 = v6;
  v16 = v12;
  v17 = self;
  objc_msgSend(v9, "performBlock:", v13);

}

- (void)scheduleItemChangeUpdateFavoritesPersistence:(id)a3 removedItems:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  id v26;
  FavoritesManager *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
  v12 = self->_mailboxCollections;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A0434;
  v21[3] = &unk_10051CDA0;
  v14 = v11;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  v19 = v11;
  v20 = v8;
  v16 = v8;
  v24 = v16;
  v17 = v9;
  v25 = v17;
  v18 = v10;
  v26 = v18;
  v27 = self;
  objc_msgSend(v13, "performBlock:", v21, v19, v20);

}

- (void)scheduleSetVisibility:(BOOL)a3 forSourceType:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  BOOL v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager favoritesPersistence](self, "favoritesPersistence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A051C;
  v9[3] = &unk_10051CDC8;
  v8 = v6;
  v12 = a3;
  v10 = v8;
  v11 = a4;
  objc_msgSend(v7, "performBlock:", v9);

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

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Collections"));
  lastSelectedItem = self->_lastSelectedItem;
  if (lastSelectedItem)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteItem dictionaryRepresentation](lastSelectedItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("LastSelectedItem"));

  }
  return v3;
}

- (BOOL)_isDictionaryRepresentationValid:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  if (v3 && (v4 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    v5 = objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(NSArray), CFSTR("Collections"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "ef_all:", &stru_10051CDE8) & 1) != 0)
    {
      v8 = objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(NSDictionary), CFSTR("LastSelectedItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)defaultsKeyForAutomaticMailboxVisibilityForSourceType:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("ReadLaterMailboxWasDismissed");
  v4 = CFSTR("SendLaterMailboxWasDismissed");
  if (a3 != 25)
    v4 = 0;
  if (a3 != 15)
    v3 = v4;
  v5 = CFSTR("FlaggedMailboxWasDismissed");
  v6 = CFSTR("ThreadNotificationsMailboxWasDismissed");
  if (a3 != 6)
    v6 = 0;
  if (a3 != 2)
    v5 = v6;
  if ((uint64_t)a3 <= 14)
    return (id)v5;
  else
    return (id)v3;
}

- (void)_sharedMailboxControllerBadgeCountDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _DWORD v20[2];
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (uint64_t)objc_msgSend(v5, "sourceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = objc_msgSend((id)objc_opt_class(self), "defaultsKeyForAutomaticMailboxVisibilityForSourceType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = 0;
  if (v6 > 14)
  {
    if (v6 != 15)
    {
      v11 = 0;
      if (v6 != 25)
        goto LABEL_8;
    }
LABEL_7:
    v11 = v6 != 2;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", SharedNetworkControllerBadgeCountKey));
    v14 = objc_msgSend(v13, "integerValue");

    v10 = (uint64_t)v14 > 0;
    goto LABEL_8;
  }
  if (v6 == 2)
    goto LABEL_7;
  v11 = 0;
  if (v6 == 6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager conversationSubscriptionProvider](self, "conversationSubscriptionProvider"));
    v10 = (unint64_t)objc_msgSend(v12, "hasSubscribedConversations");

    v11 = 0;
  }
LABEL_8:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v16 = objc_msgSend(v15, "BOOLForKey:", v9);

  v18 = MFLogGeneral(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20[0] = 67109890;
    v20[1] = v10;
    v21 = 1024;
    v22 = v11;
    v23 = 1024;
    v24 = v16;
    v25 = 2112;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#Favorites FavoritesManager _sharedMailboxControllerBadgeCountDidChange doShow:%{BOOL}d setHiddenVisibility:%{BOOL}d defaultsValue:%{BOOL}d notification:%@ ", (uint8_t *)v20, 0x1Eu);
  }

  if (v9 && (((v10 | v11) ^ 1 | v16) & 1) == 0)
    -[FavoritesManager scheduleSetVisibility:forSourceType:](self, "scheduleSetVisibility:forSourceType:", v10, v6);

}

- (FavoriteItem)previousSelectedItem
{
  return self->_previousSelectedItem;
}

- (void)setHasLaunchedWithCollapsibleMailboxes:(BOOL)a3
{
  self->_hasLaunchedWithCollapsibleMailboxes = a3;
}

- (BOOL)hasVisibleFavoriteMailboxes
{
  return self->_hasVisibleFavoriteMailboxes;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (EDConversationSubscriptionProvider)conversationSubscriptionProvider
{
  return self->_conversationSubscriptionProvider;
}

- (NSMutableArray)mailboxCollections
{
  return self->_mailboxCollections;
}

- (void)setMailboxCollections:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxCollections, a3);
}

- (void)setVisibleMailboxCollections:(id)a3
{
  objc_storeStrong((id *)&self->_visibleMailboxCollections, a3);
}

- (NSMutableArray)expandedItems
{
  return self->_expandedItems;
}

- (void)setExpandedItems:(id)a3
{
  objc_storeStrong((id *)&self->_expandedItems, a3);
}

- (BOOL)showingOutbox
{
  return self->_showingOutbox;
}

- (void)setShowingOutbox:(BOOL)a3
{
  self->_showingOutbox = a3;
}

- (BOOL)showingSingleAccount
{
  return self->_showingSingleAccount;
}

- (void)setShowingSingleAccount:(BOOL)a3
{
  self->_showingSingleAccount = a3;
}

- (EFCancelable)userDefaultsObserver
{
  return self->_userDefaultsObserver;
}

- (void)setUserDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_reloadDebouncer, 0);
  objc_storeStrong((id *)&self->_expandedItems, 0);
  objc_storeStrong((id *)&self->_visibleMailboxCollections, 0);
  objc_storeStrong((id *)&self->_mailboxCollections, 0);
  objc_storeStrong((id *)&self->_conversationSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_previousSelectedItem, 0);
  objc_storeStrong((id *)&self->_lastSelectedItem, 0);
}

@end
