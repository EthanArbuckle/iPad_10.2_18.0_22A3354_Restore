@implementation MBSCachePool

+ (id)sharedPool
{
  if (qword_1000F9DB8 != -1)
    dispatch_once(&qword_1000F9DB8, &stru_1000D91E8);
  return (id)qword_1000F9DB0;
}

- (MBSCachePool)init
{
  MBSCachePool *v2;
  objc_class *v3;
  const char *Name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBSCachePool;
  v2 = -[MBSCachePool init](&v6, "init");
  if (v2)
  {
    v2->_caches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v3);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)MBSCachePool;
  -[MBSCachePool dealloc](&v3, "dealloc");
}

- (id)acquireCache
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_100005990;
  v13 = sub_1000059A0;
  v14 = 0;
  v3 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Removing cache from pool", buf, 2u);
    _MBLog(CFSTR("DEBUG"), "Removing cache from pool");
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000059AC;
  v7[3] = &unk_1000D9210;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  v5 = (id)v10[5];
  if (!v5)
  {
    v5 = -[MBSCachePool _openCache](self, "_openCache");
    v10[5] = (uint64_t)v5;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)releaseCache:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005B5C;
  v4[3] = &unk_1000D9238;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (id)_openCache
{
  MBServiceCache *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  MBServiceCache *v9;

  v2 = -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", +[MBServiceCache systemPath](MBServiceCache, "systemPath"), objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0)));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005E00;
  v7[3] = &unk_1000D9260;
  v7[4] = v2;
  sub_100005628(v7);
  v5 = MBGetDefaultLog(v3, v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Opened cache: %p", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Opened cache: %p", v2);
  }
  return v2;
}

- (void)_closeCache:(id)a3
{
  NSObject *v4;
  uint8_t buf[4];
  id v6;

  v4 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Closing cache: %p", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Closing cache: %p", a3);
  }
  objc_msgSend(a3, "close");
}

- (void)_scheduleDrain
{
  _BOOL4 drainScheduled;
  NSObject *v4;
  _BOOL4 v5;
  dispatch_time_t v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  int v10;

  drainScheduled = self->_drainScheduled;
  v4 = MBGetDefaultLog(self, a2);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (drainScheduled)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Not scheduling duplicate drain", buf, 2u);
      _MBLog(CFSTR("DEBUG"), "Not scheduling duplicate drain");
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 67109120;
      v10 = 10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Scheduling drain of cache pool in %d s", buf, 8u);
      _MBLog(CFSTR("DEBUG"), "Scheduling drain of cache pool in %d s", 10);
    }
    v6 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000610C;
    block[3] = &unk_1000D9260;
    block[4] = self;
    dispatch_after(v6, queue, block);
    self->_drainScheduled = 1;
  }
}

- (void)_drain
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  self->_drainScheduled = 0;
  v3 = -[NSMutableArray count](self->_caches, "count");
  v5 = MBGetDefaultLog(v3, v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Draining cache pool", buf, 2u);
      _MBLog(CFSTR("DEBUG"), "Draining cache pool");
    }
    -[MBSCachePool _closeCache:](self, "_closeCache:", -[NSMutableArray objectAtIndexedSubscript:](self->_caches, "objectAtIndexedSubscript:", 0));
    -[NSMutableArray removeObjectAtIndex:](self->_caches, "removeObjectAtIndex:", 0);
    if (-[NSMutableArray count](self->_caches, "count"))
    {
      -[MBSCachePool _scheduleDrain](self, "_scheduleDrain");
    }
    else
    {
      v8 = MBGetDefaultLog(0, v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Not scheduling cache pool drain because it's empty", v10, 2u);
        _MBLog(CFSTR("DEBUG"), "Not scheduling cache pool drain because it's empty");
      }
    }
  }
  else if (v6)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Can't drain because cache pool is empty", v9, 2u);
    _MBLog(CFSTR("DEBUG"), "Can't drain because cache pool is empty");
  }
}

@end
