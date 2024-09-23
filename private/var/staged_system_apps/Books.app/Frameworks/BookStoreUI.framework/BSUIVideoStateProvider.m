@implementation BSUIVideoStateProvider

- (BSUIVideoStateProvider)init
{
  BSUIVideoStateProvider *v2;
  NSMutableSet *v3;
  NSMutableSet *weakObservers;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSUIVideoStateProvider;
  v2 = -[BSUIVideoStateProvider init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = v3;

    v2->_observerAccessLock._os_unfair_lock_opaque = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "videoPlayerManager"));
    objc_msgSend(v6, "addObserver:", v2);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_32BFF8 != -1)
    dispatch_once(&qword_32BFF8, &stru_2E4918);
  return (id)qword_32BFF0;
}

- (BOOL)captionsEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "videoPlayerManager"));
  v4 = objc_msgSend(v3, "captionsEnabledForActivePlayer");

  return v4;
}

- (void)addWeakObserver:(id)a3
{
  os_unfair_lock_s *p_observerAccessLock;
  id v5;
  void *v6;
  void *v7;

  p_observerAccessLock = &self->_observerAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIVideoStateProvider weakObservers](self, "weakObservers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v5));

  objc_msgSend(v6, "addObject:", v7);
  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)manager:(id)a3 didSetCaptions:(BOOL)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_observerAccessLock;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  void *v36;
  _BYTE v37[128];

  v4 = a4;
  p_observerAccessLock = &self->_observerAccessLock;
  os_unfair_lock_lock(&self->_observerAccessLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIVideoStateProvider weakObservers](self, "weakObservers"));
  v8 = objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(p_observerAccessLock);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value", v25));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
          v36 = v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
          objc_msgSend(v15, "enqueueValueCall:arguments:file:line:", v14, v17, CFSTR("BSUIVideoStateProvider.m"), 76);

        }
        else
        {
          objc_msgSend(v25, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v25;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
        os_unfair_lock_lock(p_observerAccessLock);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIVideoStateProvider weakObservers](self, "weakObservers"));
        objc_msgSend(v24, "removeObject:", v23);

        os_unfair_lock_unlock(p_observerAccessLock);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

}

- (NSMutableSet)weakObservers
{
  return self->_weakObservers;
}

- (void)setWeakObservers:(id)a3
{
  objc_storeStrong((id *)&self->_weakObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObservers, 0);
}

@end
