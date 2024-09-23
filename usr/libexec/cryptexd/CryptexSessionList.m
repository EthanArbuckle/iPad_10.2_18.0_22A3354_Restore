@implementation CryptexSessionList

+ (id)createCryptexSessionList
{
  char *v2;
  os_log_t v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;

  v2 = (char *)objc_alloc_init((Class)a1);
  if (v2)
  {
    v3 = os_log_create("com.apple.libcryptex", "usermanager");
    v4 = (void *)*((_QWORD *)v2 + 27);
    *((_QWORD *)v2 + 27) = v3;

    v5 = objc_opt_new(NSMutableArray);
    v6 = (void *)*((_QWORD *)v2 + 26);
    *((_QWORD *)v2 + 26) = v5;

    pthread_rwlock_init((pthread_rwlock_t *)(v2 + 8), 0);
  }
  return v2;
}

+ (id)sharedList
{
  if (qword_10005A408 != -1)
    dispatch_once(&qword_10005A408, &stru_1000555A8);
  return (id)qword_10005A410;
}

- (void)addCryptexSession:(id)a3
{
  _opaque_pthread_rwlock_t *p_rw_lock;
  id v5;
  void *v6;

  p_rw_lock = &self->rw_lock;
  v5 = a3;
  pthread_rwlock_wrlock(p_rw_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
  objc_msgSend(v6, "addObject:", v5);

  pthread_rwlock_unlock(p_rw_lock);
}

- (void)removeCryptexSession:(id)a3
{
  _opaque_pthread_rwlock_t *p_rw_lock;
  id v5;
  void *v6;

  p_rw_lock = &self->rw_lock;
  v5 = a3;
  pthread_rwlock_wrlock(p_rw_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
  objc_msgSend(v6, "removeObject:", v5);

  pthread_rwlock_unlock(p_rw_lock);
}

- (id)findCryptexSession:(char *)a3
{
  _opaque_pthread_rwlock_t *p_rw_lock;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint8_t v11[8];
  _QWORD v12[5];

  p_rw_lock = &self->rw_lock;
  pthread_rwlock_rdlock(&self->rw_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D5F4;
  v12[3] = &unk_1000555C8;
  v12[4] = a3;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v12);

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: couldn't find session for cryptex that exited.", v11, 2u);
    }
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v7));

  }
  pthread_rwlock_unlock(p_rw_lock);
  return v8;
}

- (NSMutableArray)list
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (OS_os_log)log_handle
{
  return self->_log_handle;
}

- (void)setLog_handle:(id)a3
{
  objc_storeStrong((id *)&self->_log_handle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_handle, 0);
  objc_storeStrong((id *)&self->_list, 0);
}

@end
