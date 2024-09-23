@implementation MBNotificationCenter

+ (id)sharedNotificationCenter
{
  if (qword_1000F9EB0 != -1)
    dispatch_once(&qword_1000F9EB0, &stru_1000DA2A0);
  return (id)qword_1000F9EA8;
}

- (MBNotificationCenter)init
{
  MBNotificationCenter *v2;
  objc_class *v3;
  const char *Name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBNotificationCenter;
  v2 = -[MBNotificationCenter init](&v6, "init");
  if (v2)
  {
    v2->_tokensByName = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
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
  v3.super_class = (Class)MBNotificationCenter;
  -[MBNotificationCenter dealloc](&v3, "dealloc");
}

- (void)_postNotification:(id)a3
{
  char i;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;

  for (i = 1; ; i = 0)
  {
    v5 = i;
    v6 = notify_post((const char *)objc_msgSend(a3, "UTF8String"));
    if (!(_DWORD)v6)
      break;
    v8 = v6;
    v9 = MBGetDefaultLog(v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = a3;
      v12 = 2048;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "notify_post(%@) failed: %lu", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "notify_post(%@) failed: %lu", a3, v8);
    }
    if ((v5 & 1) == 0)
      objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("notify_post failed: %lu"), v8));
  }
}

- (int)_tokenForName:(id)a3
{
  NSObject *queue;
  int v4;
  id v6;
  _QWORD block[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084D94;
  block[3] = &unk_1000DA2C8;
  block[4] = self;
  block[5] = a3;
  block[6] = &v8;
  block[7] = &v12;
  dispatch_sync(queue, block);
  if (*((_DWORD *)v13 + 6))
  {
    v6 = objc_alloc((Class)MBException);
    objc_exception_throw(objc_msgSend(v6, "initWithCode:format:", 1, CFSTR("notify_register_check failed: %lu"), *((unsigned int *)v13 + 6)));
  }
  v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (unint64_t)_stateForToken:(int)a3
{
  char i;
  char v5;
  uint64_t state;
  uint64_t v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v13;

  for (i = 1; ; i = 0)
  {
    v5 = i;
    state64 = 0;
    state = notify_get_state(a3, &state64);
    if (!(_DWORD)state)
      break;
    v8 = state;
    v9 = MBGetDefaultLog(state, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "notify_get_state failed: %lu", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "notify_get_state failed: %lu", v8);
    }
    if ((v5 & 1) == 0)
      objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("notify_get_state failed: %lu"), v8));
  }
  return state64;
}

- (void)_setState:(unint64_t)a3 forToken:(int)a4
{
  char i;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  NSObject *v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  uint64_t v15;

  for (i = 1; ; i = 0)
  {
    v7 = i;
    v8 = notify_set_state(a4, a3);
    if (!(_DWORD)v8)
      break;
    v10 = v8;
    v11 = MBGetDefaultLog(v8, v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "notify_set_state(%llu) failed: %lu", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "notify_set_state(%llu) failed: %lu", a3, v10);
    }
    if ((v7 & 1) == 0)
      objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("notify_set_state failed: %lu"), v10));
  }
}

- (void)postNotification:(id)a3
{
  NSObject *v5;
  uint8_t buf[4];
  id v7;

  v5 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Posting notification: %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Posting notification: %@", a3);
  }
  -[MBNotificationCenter _postNotification:](self, "_postNotification:", a3);
}

- (unint64_t)stateForNotification:(id)a3
{
  return -[MBNotificationCenter _stateForToken:](self, "_stateForToken:", -[MBNotificationCenter _tokenForName:](self, "_tokenForName:", a3));
}

- (void)setState:(unint64_t)a3 forNotification:(id)a4
{
  NSObject *v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  unint64_t v11;

  v7 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v9 = a4;
    v10 = 2048;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting notification state: %@ %llu", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "Setting notification state: %@ %llu", a4, a3);
  }
  -[MBNotificationCenter _setState:forToken:](self, "_setState:forToken:", a3, -[MBNotificationCenter _tokenForName:](self, "_tokenForName:", a4));
}

- (void)postNotification:(id)a3 ifStateChanged:(unint64_t)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  unint64_t v14;

  v7 = -[MBNotificationCenter _tokenForName:](self, "_tokenForName:");
  v8 = -[MBNotificationCenter _stateForToken:](self, "_stateForToken:", v7);
  if (v8 != a4)
  {
    v10 = MBGetDefaultLog(v8, v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v12 = a3;
      v13 = 2048;
      v14 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Posting notification for state change: %@ %llu", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "Posting notification for state change: %@ %llu", a3, a4);
    }
    -[MBNotificationCenter _setState:forToken:](self, "_setState:forToken:", a4, v7);
    -[MBNotificationCenter _postNotification:](self, "_postNotification:", a3);
  }
}

@end
