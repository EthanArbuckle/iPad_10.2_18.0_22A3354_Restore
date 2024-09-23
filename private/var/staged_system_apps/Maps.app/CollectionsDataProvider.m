@implementation CollectionsDataProvider

- (CollectionsDataProvider)initWithContext:(int64_t)a3 observeInfo:(BOOL)a4 observeContents:(BOOL)a5
{
  CollectionsDataProvider *v8;
  CollectionsDataProvider *v9;
  NSArray *collections;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CollectionsDataProvider;
  v8 = -[CollectionsDataProvider init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    v8->_observeInfo = a4;
    v8->_observeContents = a5;
    collections = v8->_collections;
    v8->_context = a3;
    v8->_collections = (NSArray *)&__NSArray0__struct;

  }
  return v9;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "addObserver:", self);

      -[CollectionsDataProvider _updateObservedCollectionsWithCollections:](self, "_updateObservedCollectionsWithCollections:", self->_collectionsByIdentifier);
      -[CollectionsDataProvider _updateCollectionsAndNotifyObservers:](self, "_updateCollectionsAndNotifyObservers:", 1);
    }
    else
    {
      objc_msgSend(v5, "removeObserver:", self);

      -[CollectionsDataProvider _updateObservedCollectionsWithCollections:](self, "_updateObservedCollectionsWithCollections:", &__NSDictionary0__struct);
    }
  }
}

- (void)_updateCollectionsAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  _BOOL4 hasInitialData;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *collections;
  id v12;
  NSArray *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *v31;
  NSDictionary *v32;
  NSDictionary *collectionsByIdentifier;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  int v44;
  NSDictionary *v45;
  NSDictionary *contentsByIdentifier;
  id v47;
  NSObject *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  NSString *v52;
  void *v53;
  unsigned int v54;
  __CFString *v55;
  int v56;
  void *v57;
  __CFString *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  const char *aSelector;
  int aSelectora;
  _BOOL4 v64;
  int v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  unsigned int v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];

  if (!self->_active)
    return;
  v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  if (objc_msgSend(v6, "hasInitialCollections"))
  {
    hasInitialData = self->_hasInitialData;

    if (!hasInitialData)
    {
      v65 = 1;
      self->_hasInitialData = 1;
      goto LABEL_7;
    }
  }
  else
  {

  }
  v65 = 0;
LABEL_7:
  v64 = v3;
  aSelector = a2;
  switch(self->_context)
  {
    case 0:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", a2));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCollections"));
      goto LABEL_15;
    case 1:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", a2));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCollectionsForMacHome"));
      goto LABEL_15;
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", a2));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCollectionsForiOSHome"));
      goto LABEL_15;
    case 3:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", a2));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCollectionsForWatchHome"));
      goto LABEL_15;
    case 4:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", a2));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCollectionsForCarPlay"));
      goto LABEL_15;
    case 5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", a2));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCollectionsForPicker"));
LABEL_15:
      v10 = (void *)v9;

      break;
    default:
      v10 = 0;
      break;
  }
  collections = self->_collections;
  v12 = v10;
  v13 = collections;
  v14 = objc_msgSend(v12, "count");
  if (v14 != (id)-[NSArray count](v13, "count"))
  {
LABEL_22:

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v23 = v12;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v71 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier", aSelector));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
      }
      while (v25);
    }

    v30 = (NSArray *)objc_msgSend(v23, "copy");
    v31 = self->_collections;
    self->_collections = v30;

    v32 = (NSDictionary *)objc_msgSend(v22, "copy");
    collectionsByIdentifier = self->_collectionsByIdentifier;
    self->_collectionsByIdentifier = v32;

    -[CollectionsDataProvider _updateObservedCollectionsWithCollections:](self, "_updateObservedCollectionsWithCollections:", self->_collectionsByIdentifier);
    v21 = 1;
    goto LABEL_30;
  }
  if (objc_msgSend(v12, "count"))
  {
    v15 = 0;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v15, aSelector));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", v15));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
      v20 = objc_msgSend(v17, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
        goto LABEL_22;
    }
    while (++v15 < (unint64_t)objc_msgSend(v12, "count"));
  }

  v21 = 0;
LABEL_30:
  if (self->_observeContents)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v35 = v12;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(_QWORD *)v67 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "content", aSelector));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v41, v42);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
      }
      while (v37);
    }

    v43 = objc_msgSend(v34, "isEqualToDictionary:", self->_contentsByIdentifier);
    v44 = v43 ^ 1;
    if ((v43 & 1) == 0)
    {
      v45 = (NSDictionary *)objc_msgSend(v34, "copy");
      contentsByIdentifier = self->_contentsByIdentifier;
      self->_contentsByIdentifier = v45;

    }
  }
  else
  {
    v44 = 0;
  }
  v47 = sub_100432EDC();
  v48 = objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = (objc_class *)objc_opt_class(self);
    v50 = NSStringFromClass(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = NSStringFromSelector(aSelector);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v54 = -[NSArray count](self->_collections, "count");
    v55 = sub_10039E4FC(v65);
    v56 = v21;
    v57 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v58 = sub_10039E4FC(v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = sub_10039E4FC(v44);
    aSelectora = v44;
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    *(_DWORD *)buf = 138413570;
    v75 = v51;
    v76 = 2112;
    v77 = v53;
    v78 = 1024;
    v79 = v54;
    v80 = 2112;
    v81 = v57;
    v82 = 2112;
    v83 = v59;
    v84 = 2112;
    v85 = v61;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%@ %@, # collections = %d, hasInitialDataChanged = %@, collectionsChanged = %@, contentsChanged = %@", buf, 0x3Au);

    v44 = aSelectora;
    v21 = v56;

  }
  if ((v65 | v21 | v44) == 1 && v64)
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);

}

- (void)_updateInfoOfCollection:(id)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;

  v4 = a4;
  v7 = a3;
  if (self->_active && self->_observeInfo)
  {
    v8 = sub_100432EDC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class(self);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = sub_10039E4FC(v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = 138413058;
      v18 = v12;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@, collection = %@, notifyObservers = %@", (uint8_t *)&v17, 0x2Au);

    }
    if (v4)
      -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
  }

}

- (void)_updateContentsOfCollection:(id)a3 notifyObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  NSDictionary *contentsByIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unsigned int v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *v23;
  id v24;
  NSObject *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  NSString *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v4 = a4;
  v7 = a3;
  v8 = v7;
  if (self->_active && self->_observeContents)
  {
    contentsByIdentifier = self->_contentsByIdentifier;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v11 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](contentsByIdentifier, "objectForKeyedSubscript:", v10));
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = &__NSArray0__struct;
    v14 = v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = &__NSArray0__struct;
    v18 = v17;

    v19 = objc_msgSend(v14, "isEqualToArray:", v18);
    if ((v19 & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self->_contentsByIdentifier));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v21);

      v22 = (NSDictionary *)objc_msgSend(v20, "copy");
      v23 = self->_contentsByIdentifier;
      self->_contentsByIdentifier = v22;

    }
    v24 = sub_100432EDC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v35 = v14;
      v26 = (objc_class *)objc_opt_class(self);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = sub_10039E4FC(v19 ^ 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = sub_10039E4FC(v4);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138413314;
      v37 = v28;
      v38 = 2112;
      v39 = v30;
      v40 = 2112;
      v41 = v8;
      v42 = 2112;
      v43 = v32;
      v44 = 2112;
      v45 = v34;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ %@, collection = %@, contentsChanged = %@, notifyObservers = %@", buf, 0x34u);

      v14 = v35;
    }

    if (((v19 | !v4) & 1) == 0)
      -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);

  }
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v6 = a4;
  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v14, 0x20u);

  }
  -[CollectionsDataProvider _updateCollectionsAndNotifyObservers:](self, "_updateCollectionsAndNotifyObservers:", 1);

}

- (void)collectionHandlerInfoUpdated:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v13, 0x20u);

  }
  -[CollectionsDataProvider _updateInfoOfCollection:notifyObservers:](self, "_updateInfoOfCollection:notifyObservers:", v5, 1);

}

- (void)collectionHandlerContentUpdated:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v13, 0x20u);

  }
  -[CollectionsDataProvider _updateContentsOfCollection:notifyObservers:](self, "_updateContentsOfCollection:notifyObservers:", v5, 1);

}

- (void)_updateObservedCollectionsWithCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  NSDictionary *v24;
  NSDictionary *observedCollectionsByIdentifier;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v5 = v4;
  if (*(_WORD *)&self->_observeInfo)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_observedCollectionsByIdentifier, "allKeys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v7));
    objc_msgSend(v10, "minusSet:", v9);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i)));
          -[CollectionsDataProvider _startObservingCollection:](self, "_startObservingCollection:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v9));
    objc_msgSend(v17, "minusSet:", v7);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_observedCollectionsByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j), (_QWORD)v26));
          -[CollectionsDataProvider _stopObservingCollection:](self, "_stopObservingCollection:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);
    }

    v24 = (NSDictionary *)objc_msgSend(v5, "copy");
    observedCollectionsByIdentifier = self->_observedCollectionsByIdentifier;
    self->_observedCollectionsByIdentifier = v24;

  }
}

- (void)_startObservingCollection:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v5, "addObserver:", self);

}

- (void)_stopObservingCollection:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v5, "removeObserver:", self);

}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (int64_t)context
{
  return self->_context;
}

- (BOOL)observeInfo
{
  return self->_observeInfo;
}

- (BOOL)observeContents
{
  return self->_observeContents;
}

- (NSArray)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_observedCollectionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_contentsByIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
