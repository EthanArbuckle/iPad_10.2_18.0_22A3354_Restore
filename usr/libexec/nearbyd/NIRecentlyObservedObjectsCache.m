@implementation NIRecentlyObservedObjectsCache

- (NIRecentlyObservedObjectsCache)init
{
  NIRecentlyObservedObjectsCache *v2;
  NIRecentlyObservedObjectsCache *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *recentDevices;
  NIRecentlyObservedObjectsCache *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NIRecentlyObservedObjectsCache;
  v2 = -[NIRecentlyObservedObjectsCache init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    recentDevices = v3->_recentDevices;
    v3->_recentDevices = v4;

    v6 = v3;
  }

  return v3;
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *recentDevices;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        recentDevices = self->_recentDevices;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "discoveryToken", (_QWORD)v12));
        -[NSMutableDictionary setObject:forKeyedSubscript:](recentDevices, "setObject:forKeyedSubscript:", v9, v11);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a3;
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#recent-obj-cache,Discovered device: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)getMostRecentObjectsWithMaxAge:(double)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  double v7;
  NSMutableDictionary *recentDevices;
  NSMutableArray *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  NSMutableArray *v14;
  double v15;
  double v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  void *v20;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_opt_new(NSMutableArray);
  v7 = sub_10000883C();
  recentDevices = self->_recentDevices;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002D4DE8;
  v13[3] = &unk_100814638;
  v15 = v7;
  v16 = a3;
  v9 = v6;
  v14 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](recentDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v9, "sortedArrayUsingComparator:", &stru_100814678));
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = a3;
    v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#recent-obj-cache,Most recent objects under age %0.2f seconds: %@", buf, 0x16u);
  }

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentDevices, 0);
}

@end
