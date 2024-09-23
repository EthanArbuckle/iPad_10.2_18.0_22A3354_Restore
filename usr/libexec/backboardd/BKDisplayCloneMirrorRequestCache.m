@implementation BKDisplayCloneMirrorRequestCache

- (void)_lock_addDeathWatcherForPid:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *v5;
  NSMutableDictionary *pidToDeathWatcher;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  _QWORD v10[5];
  int v11;

  v3 = *(_QWORD *)&a3;
  if (!self->_pidToDeathWatcher)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pidToDeathWatcher = self->_pidToDeathWatcher;
    self->_pidToDeathWatcher = v5;

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100045934;
  v10[3] = &unk_1000EC950;
  v10[4] = self;
  v11 = v3;
  v7 = objc_msgSend(objc_alloc((Class)BSProcessDeathWatcher), "initWithPID:queue:deathHandler:", v3, &_dispatch_main_q, v10);
  v8 = self->_pidToDeathWatcher;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v9);

}

- (void)_lock_rebuildModeCache
{
  id v3;
  NSMutableOrderedSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_modeRequestsInOrder;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8);
        if (v9)
          v10 = *(void **)(v9 + 16);
        else
          v10 = 0;
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v11, (_QWORD)v18));

        if (!v12)
          objc_msgSend(v3, "setObject:forKey:", v9, v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v13 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v6 = v13;
    }
    while (v13);
  }

  objc_storeStrong((id *)&self->_displayUUIDToModeRequest, v3);
  v15 = BKLogDisplay(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", v3));
    *(_DWORD *)buf = 138543362;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "clone mirror cache is now %{public}@", buf, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidToDeathWatcher, 0);
  objc_storeStrong((id *)&self->_modeRequestsInOrder, 0);
  objc_storeStrong((id *)&self->_pidToRequests, 0);
  objc_storeStrong((id *)&self->_displayUUIDToModeRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
