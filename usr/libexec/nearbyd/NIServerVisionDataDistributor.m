@implementation NIServerVisionDataDistributor

- (id)initPrivate
{
  NIServerVisionDataDistributor *v2;
  NIServerVisionDataDistributor *v3;
  uint64_t v4;
  NSHashTable *consumers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NIServerVisionDataDistributor;
  v2 = -[NIServerVisionDataDistributor init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    consumers = v3->_consumers;
    v3->_consumers = (NSHashTable *)v4;

  }
  return v3;
}

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100212B48;
  block[3] = &unk_1007FA668;
  block[4] = a1;
  if (qword_100859140 != -1)
    dispatch_once(&qword_100859140, block);
  return (id)qword_100859138;
}

- (void)processVisionInput:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  os_unfair_lock_t lock;
  NSHashTable *obj;
  _QWORD block[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = sub_10028D4C0((uint64_t)&self->_machTimeConverter, v5);
  if (v7)
  {
    objc_msgSend(v4, "overrideTimestamp:", *(double *)&v6);
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = self->_consumers;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getQueueForInputingData", lock));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100212D54;
          block[3] = &unk_1007FA518;
          block[4] = v11;
          v16 = v4;
          dispatch_async(v12, block);

        }
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    os_unfair_lock_unlock(lock);
  }

}

- (void)registerForVisionInput:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((objc_msgSend(v6, "supportsCameraAssistance") & 1) == 0)
  {
    v4 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003DF808(v4);
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/VIO/NIServerVisionDataDistributor.mm";
      v9 = 1024;
      v10 = 59;
      v11 = 2080;
      v12 = "-[NIServerVisionDataDistributor registerForVisionInput:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  -[NSHashTable addObject:](self->_consumers, "addObject:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)unregisterForVisionInput:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_consumers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumers, 0);
}

- (id).cxx_construct
{
  sub_10028D4BC(&self->_machTimeConverter, a2);
  return self;
}

@end
