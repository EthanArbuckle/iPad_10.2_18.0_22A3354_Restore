@implementation RDCoreSpotlightDelegateManager

- (RDCoreSpotlightDelegateManager)initWithIsolated:(BOOL)a3 coordinator:(id)a4
{
  id v7;
  RDCoreSpotlightDelegateManager *v8;
  RDCoreSpotlightDelegateManager *v9;
  uint64_t v10;
  NSMutableSet *pendingReindexIdentifiers;
  uint64_t v12;
  NSMutableSet *earlyStoppedStoreIdentifiers;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RDCoreSpotlightDelegateManager;
  v8 = -[RDCoreSpotlightDelegateManager init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    v8->_enableCoreSpotlightIndexing = !a3;
    objc_storeStrong((id *)&v8->_persistentStoreCoordinator, a4);
    *(_WORD *)&v9->_isActivated = 0;
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingReindexIdentifiers = v9->_pendingReindexIdentifiers;
    v9->_pendingReindexIdentifiers = (NSMutableSet *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    earlyStoppedStoreIdentifiers = v9->_earlyStoppedStoreIdentifiers;
    v9->_earlyStoppedStoreIdentifiers = (NSMutableSet *)v12;

  }
  return v9;
}

- (void)validateIndexVersionWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[RDCoreSpotlightDelegateManager enableCoreSpotlightIndexing](self, "enableCoreSpotlightIndexing"))
  {
    +[RDCoreDataCoreSpotlightDelegate deleteAllIndicesIfVersionOutdatedWithCompletionHandler:](_TtC7remindd31RDCoreDataCoreSpotlightDelegate, "deleteAllIndicesIfVersionOutdatedWithCompletionHandler:", v4);
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }

}

- (void)createAndAttachCoreSpotlightDelegateForStoreWithDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  NSObject *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreForURL:", v6));

  if (v7)
  {
    v8 = -[RDCoreDataCoreSpotlightDelegate initForStoreWithDescription:coordinator:]([_TtC7remindd31RDCoreDataCoreSpotlightDelegate alloc], "initForStoreWithDescription:coordinator:", v4, v5);
    if (-[RDCoreSpotlightDelegateManager isActivated](self, "isActivated"))
    {
      -[RDCoreSpotlightDelegateManager _startCoreSpotlightDelegate:forStore:](self, "_startCoreSpotlightDelegate:forStore:", v8, v7);
    }
    else
    {
      v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412802;
        v11 = v7;
        v12 = 2112;
        v13 = v5;
        v14 = 2112;
        v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CoreSpotlight delegates are not activated. Will delay starting delegates {store: %@, coordinator: %@, associatedDelegate: %@}", (uint8_t *)&v10, 0x20u);
      }

      objc_msgSend(v7, "setRd_associatedCoreSpotlightDelegate:", v8);
    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not going to create CoreSpotlight delegate for store description because it doesn't exist in the PSC {coordinator: %@}", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)deleteIndicesForStore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v6 = objc_opt_class(_TtC7remindd31RDCoreDataCoreSpotlightDelegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "coreSpotlightExporter"));
  if (v7)
  {
    v8 = REMDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rd_associatedCoreSpotlightDelegate"));
    v11 = REMDynamicCast(v6, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v11);

  }
  if (!v9 && -[RDCoreSpotlightDelegateManager enableCoreSpotlightIndexing](self, "enableCoreSpotlightIndexing"))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_100683798();

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007BD38;
  v15[3] = &unk_1007DA530;
  v16 = v4;
  v17 = v5;
  v13 = v5;
  v14 = v4;
  objc_msgSend(v9, "deleteAllIndicesWithCompletionHandler:", v15);

}

- (void)activateCoreSpotlightDelegates
{
  RDCoreSpotlightDelegateManager *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  RDCoreSpotlightDelegateManager *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  NSObject *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v2 = self;
  if (-[RDCoreSpotlightDelegateManager enableCoreSpotlightIndexing](self, "enableCoreSpotlightIndexing"))
  {
    if (-[RDCoreSpotlightDelegateManager isActivated](v2, "isActivated"))
    {
      v3 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        sub_10068388C(v3);
      goto LABEL_33;
    }
    v3 = objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager persistentStoreCoordinator](v2, "persistentStoreCoordinator"));
    v4 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activating CoreSpotlight delegates {coordinator: %@}", buf, 0xCu);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject persistentStores](v3, "persistentStores"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v32;
      *(_QWORD *)&v7 = 138412546;
      v29 = v7;
      v30 = v2;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v5);
          v11 = *(NSObject **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v10);
          v12 = objc_opt_class(_TtC7remindd31RDCoreDataCoreSpotlightDelegate);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject rd_associatedCoreSpotlightDelegate](v11, "rd_associatedCoreSpotlightDelegate"));
          v14 = REMDynamicCast(v12, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

          -[NSObject setRd_associatedCoreSpotlightDelegate:](v11, "setRd_associatedCoreSpotlightDelegate:", 0);
          if (!v15)
          {
            v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v36 = v11;
              v37 = 2112;
              v38 = v3;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "The store does not have an associated CoreSpotlight delegate. This is expected if (and only if) the store has been requested to be removed. {store: %@, coordinator: %@}", buf, 0x16u);
            }
            goto LABEL_20;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject coreSpotlightExporter](v11, "coreSpotlightExporter"));

          if (v16)
          {
            v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              v18 = v3;
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject coreSpotlightExporter](v11, "coreSpotlightExporter"));
              *(_DWORD *)buf = 138413058;
              v36 = v11;
              v37 = 2112;
              v38 = v18;
              v39 = 2112;
              v40 = v19;
              v41 = 2112;
              v42 = v15;
              _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "The store already has an active CoreSpotlight delegate {store: %@, coordinator: %@, activeDelegate: %@, associatedDelegate: %@}", buf, 0x2Au);

              v3 = v18;
              v2 = v30;
            }
LABEL_20:

            goto LABEL_22;
          }
          -[RDCoreSpotlightDelegateManager _startCoreSpotlightDelegate:forStore:](v2, "_startCoreSpotlightDelegate:forStore:", v15, v11);
LABEL_22:

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v8);
    }

    -[RDCoreSpotlightDelegateManager setIsActivated:](v2, "setIsActivated:", 1);
    if (-[RDCoreSpotlightDelegateManager pendingReindexAll](v2, "pendingReindexAll"))
    {
      v20 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v3;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Executing pending reindex all request {coordinator: %@}", buf, 0xCu);
      }

      -[RDCoreSpotlightDelegateManager reindexAllSearchableItems](v2, "reindexAllSearchableItems");
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager pendingReindexIdentifiers](v2, "pendingReindexIdentifiers"));
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager pendingReindexIdentifiers](v2, "pendingReindexIdentifiers"));
          *(_DWORD *)buf = 138412546;
          v36 = v3;
          v37 = 2112;
          v38 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Executing pending reindex items request {coordinator: %@, identifiers: %@}", buf, 0x16u);

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager pendingReindexIdentifiers](v2, "pendingReindexIdentifiers"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));
        -[RDCoreSpotlightDelegateManager reindexSearchableItemsWithIdentifiers:](v2, "reindexSearchableItemsWithIdentifiers:", v26);

      }
    }
    -[RDCoreSpotlightDelegateManager setPendingReindexAll:](v2, "setPendingReindexAll:", 0, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager pendingReindexIdentifiers](v2, "pendingReindexIdentifiers"));
    objc_msgSend(v27, "removeAllObjects");

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager earlyStoppedStoreIdentifiers](v2, "earlyStoppedStoreIdentifiers"));
    objc_msgSend(v28, "removeAllObjects");

  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1006838CC(v3);
  }
LABEL_33:

}

- (void)stopCoreSpotlightDelegatesForStores:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;

  v4 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v26;
    v34 = 2112;
    v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping CoreSpotlight delegates {coordinator: %@, stores: %@}", buf, 0x16u);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v28;
    *(_QWORD *)&v8 = 138412546;
    v25 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
        v13 = -[RDCoreSpotlightDelegateManager isActivated](self, "isActivated", v25);
        v14 = objc_opt_class(_TtC7remindd31RDCoreDataCoreSpotlightDelegate);
        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "coreSpotlightExporter"));
          v16 = REMDynamicCast(v14, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

          if (!v17)
          {
            v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v25;
              v33 = v12;
              v34 = 2112;
              v35 = v26;
              _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "The store does not have an active CoreSpotlight delegate {store: %@, coordinator: %@}", buf, 0x16u);
            }

          }
          objc_msgSend(v17, "stopSpotlightIndexing");
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rd_associatedCoreSpotlightDelegate"));
          v20 = REMDynamicCast(v14, v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v20);

          if (!v17)
          {
            v21 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v25;
              v33 = v12;
              v34 = 2112;
              v35 = v26;
              _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "The store does not have an associated CoreSpotlight delegate {store: %@, coordinator: %@}", buf, 0x16u);
            }

          }
          objc_msgSend(v17, "setShouldStart:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager earlyStoppedStoreIdentifiers](self, "earlyStoppedStoreIdentifiers"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            objc_msgSend(v23, "addObject:", v24);

          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

}

- (void)reindexAllSearchableItems
{
  NSObject *v2;
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  uint64_t (**v8)();
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t (**v19)();
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  __int128 v24;
  void *v25;
  unsigned __int8 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v2 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v25;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received request to -reindexAllSearchableItems {coordinator: %@}", buf, 0xCu);
  }

  if (-[RDCoreSpotlightDelegateManager isActivated](self, "isActivated"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "persistentStores"));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v29;
      v8 = &off_100831000;
      *(_QWORD *)&v5 = 138412546;
      v24 = v5;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v9);
          v11 = objc_opt_class(v8 + 14);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "coreSpotlightExporter"));
          v13 = REMDynamicCast(v11, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

          if (v14)
          {
            objc_msgSend(v14, "reindexAllSearchableItemsWithAcknowledgementHandler:", 0);
          }
          else
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
            if (!v15)
              goto LABEL_13;
            v16 = (void *)v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager earlyStoppedStoreIdentifiers](self, "earlyStoppedStoreIdentifiers"));
            v18 = v7;
            v19 = v8;
            v20 = v3;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
            v27 = objc_msgSend(v17, "containsObject:", v21);

            v3 = v20;
            v8 = v19;
            v7 = v18;

            if ((v27 & 1) == 0)
            {
LABEL_13:
              v22 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search", v24));
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v24;
                v33 = v10;
                v34 = 2112;
                v35 = v25;
                _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "The store does not have an active CoreSpotlight delegate {store: %@, coordinator: %@}", buf, 0x16u);
              }

            }
          }

          v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v6);
    }

  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "The spotlight delegates are not activated yet. Going to defer reindexing all. {coordinator: %@}", buf, 0xCu);
    }

    -[RDCoreSpotlightDelegateManager setPendingReindexAll:](self, "setPendingReindexAll:", 1);
  }

}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t (**v11)();
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  NSObject *v26;
  NSObject *v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  RDCoreSpotlightDelegateManager *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;

  v4 = a3;
  v31 = self;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v29;
    v39 = 2112;
    v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to -reindexSearchableItemsWithIdentifiers: {coordinator: %@, identifiers: %@}", buf, 0x16u);
  }

  if (-[RDCoreSpotlightDelegateManager isActivated](self, "isActivated"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "persistentStores"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v33;
      v11 = &off_100831000;
      *(_QWORD *)&v8 = 138412546;
      v28 = v8;
      v30 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v14 = objc_opt_class(v11 + 14);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coreSpotlightExporter"));
          v16 = REMDynamicCast(v14, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

          if (v17)
          {
            objc_msgSend(v17, "reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v4, 0);
          }
          else
          {
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
            if (!v18)
              goto LABEL_13;
            v19 = (void *)v18;
            v20 = v6;
            v21 = v4;
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager earlyStoppedStoreIdentifiers](v31, "earlyStoppedStoreIdentifiers"));
            v23 = v9;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
            v25 = objc_msgSend(v22, "containsObject:", v24);

            v9 = v23;
            v4 = v21;
            v6 = v20;
            v10 = v30;
            v11 = &off_100831000;

            if ((v25 & 1) == 0)
            {
LABEL_13:
              v26 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search", v28));
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v28;
                v38 = v13;
                v39 = 2112;
                v40 = v29;
                _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "The store does not have an active CoreSpotlight delegate {store: %@, coordinator: %@}", buf, 0x16u);
              }

            }
          }

        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v9);
    }
  }
  else
  {
    v27 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "The spotlight delegates are not activated yet. Going to defer reindexing items. {coordinator: %@}", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager pendingReindexIdentifiers](self, "pendingReindexIdentifiers"));
    objc_msgSend(v6, "addObjectsFromArray:", v4);
  }

}

- (void)_startCoreSpotlightDelegate:(id)a3 forStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "shouldStart"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDCoreSpotlightDelegateManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138412802;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Starting CoreSpotlight delegate {store: %@, coordinator: %@, delegate: %@}", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(v6, "startSpotlightIndexing");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coreSpotlightExporter"));

    if (!v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore search](REMLogStore, "search"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v12 = 138412802;
        v13 = v7;
        v14 = 2112;
        v15 = v8;
        v16 = 2112;
        v17 = v6;
        _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "The store still doesn't have active CoreSpotlight delegate after kicking start the associated delegate {store: %@, coordinator: %@, associatedDelegate: %@}", (uint8_t *)&v12, 0x20u);
      }

    }
  }

}

- (BOOL)enableCoreSpotlightIndexing
{
  return self->_enableCoreSpotlightIndexing;
}

- (void)setEnableCoreSpotlightIndexing:(BOOL)a3
{
  self->_enableCoreSpotlightIndexing = a3;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (BOOL)pendingReindexAll
{
  return self->_pendingReindexAll;
}

- (void)setPendingReindexAll:(BOOL)a3
{
  self->_pendingReindexAll = a3;
}

- (NSMutableSet)pendingReindexIdentifiers
{
  return self->_pendingReindexIdentifiers;
}

- (NSMutableSet)earlyStoppedStoreIdentifiers
{
  return self->_earlyStoppedStoreIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earlyStoppedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingReindexIdentifiers, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
}

@end
