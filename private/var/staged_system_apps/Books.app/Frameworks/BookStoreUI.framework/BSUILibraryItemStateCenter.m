@implementation BSUILibraryItemStateCenter

- (BSUILibraryItemStateCenter)initWithProvider:(id)a3
{
  id v4;
  BSUILibraryItemStateCenter *v5;
  BSUILibraryItemStateCenter *v6;
  uint64_t v7;
  NSMapTable *instanceMap;
  dispatch_queue_t v9;
  OS_dispatch_queue *access;
  uint64_t v11;
  NSMapTable *observers;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BSUILibraryItemStateCenter;
  v5 = -[BSUILibraryItemStateCenter init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_provider, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 517));
    instanceMap = v6->_instanceMap;
    v6->_instanceMap = (NSMapTable *)v7;

    v9 = dispatch_queue_create("BSUILibraryItemStateCenter.access", 0);
    access = v6->_access;
    v6->_access = (OS_dispatch_queue *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 517, 0));
    observers = v6->_observers;
    v6->_observers = (NSMapTable *)v11;

  }
  return v6;
}

- (id)mapItemState:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, CFSTR("itemIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isSample")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("sample"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readingProgress"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("readingProgress"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "wantToRead")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("wantToRead"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isUpdateAvailable")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("updateAvailable"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isStreamable")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("streamable"));

  if ((unint64_t)objc_msgSend(v3, "library") > 5)
    v11 = CFSTR("unknown");
  else
    v11 = off_2E4648[(_QWORD)objc_msgSend(v3, "library")];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, CFSTR("library"));
  if ((unint64_t)objc_msgSend(v3, "download") > 2)
    v12 = CFSTR("unknown");
  else
    v12 = off_2E4678[(_QWORD)objc_msgSend(v3, "download")];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("download"));
  if ((unint64_t)objc_msgSend(v3, "play") > 2)
    v13 = CFSTR("unknown");
  else
    v13 = off_2E4690[(_QWORD)objc_msgSend(v3, "play")];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, CFSTR("play"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isTrackedAsRecent")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, CFSTR("trackedAsRecent"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isPurchased")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, CFSTR("isPurchased"));

  return v4;
}

- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *access;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  _QWORD block[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_13C4C;
  v36 = sub_13C5C;
  v37 = 0;
  v13 = objc_opt_class(NSString, v12);
  v14 = BUDynamicCast(v13, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15
    || (objc_opt_respondsToSelector(v9, "stringValue", v16) & 1) != 0
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"))) != 0)
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13C64;
    block[3] = &unk_2E4258;
    v31 = &v32;
    block[4] = self;
    v18 = v15;
    v30 = v18;
    dispatch_sync(access, block);
    if (!v33[5])
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "itemStateWithIdentifier:", v18));
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateCenter mapItemState:](self, "mapItemState:", v19));
        v21 = objc_claimAutoreleasedReturnValue(+[TUIMutableDynamicValue valueWithValue:](TUIMutableDynamicValue, "valueWithValue:", v20));
        v22 = (void *)v33[5];
        v33[5] = v21;

        sub_13CA0((uint64_t)self, (void *)v33[5], v18);
        v23 = self->_access;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_13D68;
        v26[3] = &unk_2E4280;
        v26[4] = self;
        v27 = v18;
        v28 = &v32;
        dispatch_sync(v23, v26);

      }
    }

  }
  else
  {
    v18 = 0;
  }
  v24 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v24;
}

- (void)updateItemWithIdentifier:(id)a3 state:(id)a4
{
  -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:allowsInsert:](self, "updateItemWithIdentifier:state:allowsInsert:", a3, a4, 0);
}

- (void)insertOrUpdateItemWithIdentifier:(id)a3 state:(id)a4
{
  -[BSUILibraryItemStateCenter updateItemWithIdentifier:state:allowsInsert:](self, "updateItemWithIdentifier:state:allowsInsert:", a3, a4, 1);
}

- (void)updateItemWithIdentifier:(id)a3 state:(id)a4 allowsInsert:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *access;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_13C4C;
  v21 = sub_13C5C;
  v22 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateCenter mapItemState:](self, "mapItemState:", v9));
  if (v8)
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13F44;
    block[3] = &unk_2E46B0;
    v15 = &v17;
    block[4] = self;
    v13 = v8;
    v16 = a5;
    v14 = v10;
    dispatch_sync(access, block);

  }
  objc_msgSend((id)v18[5], "updateWithValue:", v10);
  -[BSUILibraryItemStateCenter _notifyObserversItemUpdatedFor:itemState:](self, "_notifyObserversItemUpdatedFor:itemState:", v8, v9);

  _Block_object_dispose(&v17, 8);
}

- (void)aq_updateInterest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  BSUILibraryItemStateCenter *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_instanceMap, "keyEnumerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v4));

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_140EC;
  v11 = &unk_2E40C8;
  v12 = self;
  v13 = v5;
  v6 = v5;
  os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
  sub_140EC((uint64_t)&v8);
  os_unfair_lock_unlock(&self->_accessLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "updateInterest:", v6, v8, v9);

}

- (id)observersToNotifyForItemIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  id v6;
  _QWORD *v7;
  id v8;
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  BSUILibraryItemStateCenter *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_13C4C;
  v20 = sub_13C5C;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  p_accessLock = &self->_accessLock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v11 = sub_14320;
  v12 = &unk_2E4280;
  v13 = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  v7 = v10;
  os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
  v11((uint64_t)v7);
  os_unfair_lock_unlock(p_accessLock);

  v8 = objc_msgSend((id)v17[5], "copy");
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)addObserver:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *access;
  _QWORD v9[5];
  _QWORD v10[4];
  BSUILibraryItemStateCenter *v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_14560;
  v10[3] = &unk_2E4230;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v6 = v13;
  v7 = v12;
  os_unfair_lock_lock_with_options(&v11->_accessLock, 0x10000);
  sub_14560((uint64_t)v10);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_14610;
  v9[3] = &unk_2E4608;
  v9[4] = self;
  dispatch_sync(access, v9);

}

- (void)addOrUpdateObserver:(id)a3 forSingleItemIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *access;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_14714;
  v11[3] = &unk_2E4230;
  v11[4] = self;
  v12 = a4;
  v13 = v6;
  v7 = v6;
  v8 = v12;
  os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
  sub_14714((uint64_t)v11);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_14778;
  v10[3] = &unk_2E4608;
  v10[4] = self;
  dispatch_sync(access, v10);

}

- (void)removeObserver:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *access;
  _QWORD v9[5];
  _QWORD v10[4];
  BSUILibraryItemStateCenter *v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_14878;
  v10[3] = &unk_2E4230;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v6 = v13;
  v7 = v12;
  os_unfair_lock_lock_with_options(&v11->_accessLock, 0x10000);
  sub_14878((uint64_t)v10);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1495C;
  v9[3] = &unk_2E4608;
  v9[4] = self;
  dispatch_sync(access, v9);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *access;
  _QWORD block[5];
  _QWORD v7[4];
  BSUILibraryItemStateCenter *v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_14A30;
  v7[3] = &unk_2E40C8;
  v8 = self;
  v9 = a3;
  v4 = v9;
  os_unfair_lock_lock_with_options(&v8->_accessLock, 0x10000);
  sub_14A30((uint64_t)v7);
  os_unfair_lock_unlock(&self->_accessLock);
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14A70;
  block[3] = &unk_2E4608;
  block[4] = self;
  dispatch_sync(access, block);

}

- (void)_notifyObserversItemUpdatedFor:(id)a3 itemState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUILibraryItemStateCenter observersToNotifyForItemIdentifier:](self, "observersToNotifyForItemIdentifier:", v6, 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "libraryItemStateCenter:didUpdateItemState:forIdentifier:", self, v7, v6);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BSUILibraryItemStateProviding)provider
{
  return (BSUILibraryItemStateProviding *)objc_loadWeakRetained((id *)&self->_provider);
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_instanceMap, 0);
}

@end
