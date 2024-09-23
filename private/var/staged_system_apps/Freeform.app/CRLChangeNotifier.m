@implementation CRLChangeNotifier

- (CRLChangeNotifier)init
{
  CRLChangeNotifier *v2;
  NSMapTable *v3;
  NSMapTable *changeSourceOfObjectObservers;
  NSMapTable *v5;
  NSMapTable *changeSourceOfClassObservers;
  dispatch_queue_t v7;
  OS_dispatch_queue *currentlyNotifyingLock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLChangeNotifier;
  v2 = -[CRLChangeNotifier init](&v10, "init");
  if (v2)
  {
    v3 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    changeSourceOfObjectObservers = v2->_changeSourceOfObjectObservers;
    v2->_changeSourceOfObjectObservers = v3;

    v5 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    changeSourceOfClassObservers = v2->_changeSourceOfClassObservers;
    v2->_changeSourceOfClassObservers = v5;

    v7 = dispatch_queue_create("com.apple.freeform.CRLChangeNotifier.notifyingLock", 0);
    currentlyNotifyingLock = v2->_currentlyNotifyingLock;
    v2->_currentlyNotifyingLock = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)p_findCountedObserverForObserver:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001F020C;
  v11[3] = &unk_101243EB8;
  v7 = v5;
  v12 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8));

  return v9;
}

- (void)p_addObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  CRLChangeNotifier *v9;
  uint64_t v10;
  id v11;
  id v12;
  CRLCountedObserver *v13;
  CRLCountedObserver *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v10 = 8;
  if (v5)
    v10 = 16;
  v11 = *(id *)((char *)&v9->super.isa + v10);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v8));
  if (!v12)
  {
    v12 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v11, "setObject:forKey:", v12, v8);
  }
  v13 = (CRLCountedObserver *)objc_claimAutoreleasedReturnValue(-[CRLChangeNotifier p_findCountedObserverForObserver:inArray:](v9, "p_findCountedObserverForObserver:inArray:", v15, v12));
  v14 = v13;
  if (v13)
  {
    -[CRLCountedObserver incrementCount](v13, "incrementCount");
  }
  else
  {
    v14 = -[CRLCountedObserver initWithObserver:]([CRLCountedObserver alloc], "initWithObserver:", v15);
    objc_msgSend(v12, "addObject:", v14);
  }

  objc_sync_exit(v9);
}

- (void)p_removeObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CRLChangeNotifier *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *currentlyNotifyingLock;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  _QWORD block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  v11 = 8;
  if (v5)
    v11 = 16;
  v12 = *(id *)((char *)&v10->super.isa + v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v9));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLChangeNotifier p_findCountedObserverForObserver:inArray:](v10, "p_findCountedObserverForObserver:inArray:", v8, v13));
    if (v14)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      currentlyNotifyingLock = v10->_currentlyNotifyingLock;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001F0590;
      block[3] = &unk_10122C5F0;
      block[4] = v10;
      block[5] = &v23;
      dispatch_sync(currentlyNotifyingLock, block);
      v16 = v14;
      objc_sync_enter(v16);
      if (!objc_msgSend(v16, "decrementCount"))
      {
        if (*((_BYTE *)v24 + 24))
        {
          v17 = v10->_currentlyNotifyingLock;
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1001F05AC;
          v18[3] = &unk_101243EE0;
          v21 = v5;
          v18[4] = v10;
          v19 = v9;
          v20 = v16;
          dispatch_sync(v17, v18);

        }
        else
        {
          objc_msgSend(v13, "removeObject:", v16);
        }
      }
      if (!objc_msgSend(v13, "count"))
        objc_msgSend(v12, "removeObjectForKey:", v9);
      objc_sync_exit(v16);

      _Block_object_dispose(&v23, 8);
    }

  }
  objc_sync_exit(v10);

}

- (void)addObserver:(id)a3 forChangeSource:(id)a4
{
  -[CRLChangeNotifier p_addObserver:forChangeSource:isClass:](self, "p_addObserver:forChangeSource:isClass:", a3, a4, 0);
}

- (void)removeObserver:(id)a3 forChangeSource:(id)a4
{
  -[CRLChangeNotifier p_removeObserver:forChangeSource:isClass:](self, "p_removeObserver:forChangeSource:isClass:", a3, a4, 0);
}

- (void)addObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
  -[CRLChangeNotifier p_addObserver:forChangeSource:isClass:](self, "p_addObserver:forChangeSource:isClass:", a3, a4, 1);
}

- (void)removeObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
  -[CRLChangeNotifier p_removeObserver:forChangeSource:isClass:](self, "p_removeObserver:forChangeSource:isClass:", a3, a4, 1);
}

- (void)p_processChanges:(id)a3 preprocessing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char **v7;
  char *v8;
  id v9;
  NSObject *currentlyNotifyingLock;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  char v21;
  TSKChangeNotificationInfo *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *m;
  void *v28;
  void *v29;
  char v30;
  TSKChangeNotificationInfo *v31;
  id v32;
  uint64_t v33;
  void *n;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CRLChangeNotifier *v47;
  NSObject *v48;
  void *v49;
  CRLChangeNotifier *v50;
  id v51;
  uint64_t v52;
  id obj;
  void *i;
  id v55;
  CRLChangeNotifier *v56;
  NSMapTable *v57;
  _BOOL4 v58;
  uint64_t v59;
  void *v60;
  id v61;
  id k;
  id v63;
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD block[16];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];

  v4 = a4;
  v6 = a3;
  v7 = &selRef_preprocessChanges_forChangeSource_;
  v58 = v4;
  if (!v4)
    v7 = &selRef_processChanges_forChangeSource_;
  v8 = *v7;
  v9 = objc_alloc_init((Class)NSMutableArray);
  v55 = objc_alloc_init((Class)NSMutableOrderedSet);
  currentlyNotifyingLock = self->_currentlyNotifyingLock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F0EFC;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(currentlyNotifyingLock, block);
  v50 = self;
  v56 = self;
  objc_sync_enter(v56);
  v49 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "changesArray"));
  v12 = objc_msgSend(v11, "copy");

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v12;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v52)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "changeSource"));
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v60 = (void *)v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v56->_changeSourceOfObjectObservers, "objectForKey:"));
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(_QWORD *)v78 != v17)
                objc_enumerationMutation(v15);
              v19 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "observer"));
              v21 = objc_opt_respondsToSelector(v20, v8);

              if ((v21 & 1) != 0)
              {
                v22 = -[TSKChangeNotificationInfo initWithCountedObserver:changeEntry:]([TSKChangeNotificationInfo alloc], "initWithCountedObserver:changeEntry:", v19, v13);
                objc_msgSend(v9, "addObject:", v22);

              }
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
          }
          while (v16);
        }

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v57 = v56->_changeSourceOfClassObservers;
        v61 = -[NSMapTable countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
        if (v61)
        {
          v59 = *(_QWORD *)v74;
          do
          {
            for (k = 0; k != v61; k = (char *)k + 1)
            {
              if (*(_QWORD *)v74 != v59)
                objc_enumerationMutation(v57);
              v23 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)k);
              if ((objc_opt_isKindOfClass(v60, v23) & 1) != 0)
              {
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v56->_changeSourceOfClassObservers, "objectForKey:", v23));
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
                if (v25)
                {
                  v26 = *(_QWORD *)v70;
                  do
                  {
                    for (m = 0; m != v25; m = (char *)m + 1)
                    {
                      if (*(_QWORD *)v70 != v26)
                        objc_enumerationMutation(v24);
                      v28 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)m);
                      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "observer"));
                      v30 = objc_opt_respondsToSelector(v29, v8);

                      if ((v30 & 1) != 0)
                      {
                        v31 = -[TSKChangeNotificationInfo initWithCountedObserver:changeEntry:]([TSKChangeNotificationInfo alloc], "initWithCountedObserver:changeEntry:", v28, v13);
                        objc_msgSend(v9, "addObject:", v31);

                      }
                    }
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
                  }
                  while (v25);
                }

              }
            }
            v61 = -[NSMapTable countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          }
          while (v61);
        }

      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    }
    while (v51);
  }

  objc_sync_exit(v56);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = v9;
  v32 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v66;
    do
    {
      for (n = 0; n != v32; n = (char *)n + 1)
      {
        if (*(_QWORD *)v66 != v33)
          objc_enumerationMutation(v63);
        v35 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)n);
        v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "countedObserver"));
        objc_sync_enter(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "observer"));
        if (v58)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "entry"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "changes"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "entry"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "changeSource"));
          objc_msgSend(v37, "preprocessChanges:forChangeSource:", v39, v41);

        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "entry"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "changes"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "entry"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "changeSource"));
          objc_msgSend(v37, "processChanges:forChangeSource:", v43, v45);

          if ((objc_opt_respondsToSelector(v37, "didProcessAllChanges") & 1) != 0)
            objc_msgSend(v55, "addObject:", v37);
        }

        objc_sync_exit(v36);
      }
      v32 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
    }
    while (v32);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "array"));
  objc_msgSend(v46, "makeObjectsPerformSelector:", "didProcessAllChanges");

  v47 = v56;
  objc_sync_enter(v47);
  v48 = v50->_currentlyNotifyingLock;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1001F14BC;
  v64[3] = &unk_10122D110;
  v64[4] = v47;
  dispatch_sync(v48, v64);
  objc_sync_exit(v47);

}

- (void)p_removeZeroCountObserversInMap:(id)a3 fromCountedObserversByChangeSourceMap:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        objc_sync_enter(v11);
        if (!objc_msgSend(v11, "currentCount", (_QWORD)v14))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));
          objc_msgSend(v13, "removeObject:", v11);

        }
        objc_sync_exit(v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)p_removeDeallocatedObserversFromArray:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_101244060));
  objc_msgSend(v3, "filterUsingPredicate:", v4);

}

- (void)p_trimChangeSourceToCountedObserversMap:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11));
        -[CRLChangeNotifier p_removeDeallocatedObserversFromArray:](self, "p_removeDeallocatedObserversFromArray:", v12);
        if (!objc_msgSend(v12, "count"))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)preprocessChanges:(id)a3
{
  -[CRLChangeNotifier p_processChanges:preprocessing:](self, "p_processChanges:preprocessing:", a3, 1);
}

- (void)processChanges:(id)a3
{
  -[CRLChangeNotifier p_processChanges:preprocessing:](self, "p_processChanges:preprocessing:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classObserversToCheckForRemovalAfterNotifications, 0);
  objc_storeStrong((id *)&self->_objectObserversToCheckForRemovalAfterNotifications, 0);
  objc_storeStrong((id *)&self->_currentlyNotifyingLock, 0);
  objc_storeStrong((id *)&self->_changeSourceOfClassObservers, 0);
  objc_storeStrong((id *)&self->_changeSourceOfObjectObservers, 0);
}

@end
