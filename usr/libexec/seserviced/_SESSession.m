@implementation _SESSession

- (_SESSession)initWithRemoteObject:(id)a3 queue:(id)a4
{
  id v7;
  OS_dispatch_queue *v8;
  _SESSession *v9;
  _SESSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = (OS_dispatch_queue *)a4;
  v12.receiver = self;
  v12.super_class = (Class)_SESSession;
  v9 = -[_SESSession init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_remoteObject, a3);
    v10->_queue = v8;
    v10->_isBackgrounded = 0;
    *(_WORD *)&v10->_didStart = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

+ (id)validateEntitlements:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = SESDefaultLogObject(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = SESCreateAndLogError(0, v4, SESErrorDomain, 8, CFSTR("SESSession invalid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)setDidEndCallback:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;
  id didEndCallback;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = objc_msgSend(v5, "copy");

  didEndCallback = self->_didEndCallback;
  self->_didEndCallback = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)releaseRemoteObject
{
  id remoteObject;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)start
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  _SESSession *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  v5 = SESDefaultLogObject(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SESSession start %@", (uint8_t *)&v7, 0xCu);
  }

  if (!self->_didStart)
  {
    self->_didStart = 1;
    objc_msgSend(self->_remoteObject, "didStartSession:", 0);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)endSessionInternal:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void (**didEndCallback)(id, _SESSession *);
  id v15;
  int v16;
  _SESSession *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  v7 = SESDefaultLogObject(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SESSession endSessionInternal %@ error %@", (uint8_t *)&v16, 0x16u);
  }

  if (!self->_didStart)
  {
    self->_didStart = 1;
    if (!v4)
    {
      v11 = SESDefaultLogObject(v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = SESCreateAndLogError(0, v12, SESErrorDomain, 0, CFSTR("Session failed to start"));
      v4 = (id)objc_claimAutoreleasedReturnValue(v13);

    }
    objc_msgSend(self->_remoteObject, "didStartSession:", v4);
  }
  self->_didEnd = 1;
  didEndCallback = (void (**)(id, _SESSession *))self->_didEndCallback;
  if (didEndCallback)
  {
    didEndCallback[2](didEndCallback, self);
    v15 = self->_didEndCallback;
    self->_didEndCallback = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)isActive
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_didStart && !self->_didEnd;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)endSession:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011CA4;
  v7[3] = &unk_100303078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)remoteObject
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (id)didEndCallback
{
  return self->_didEndCallback;
}

- (BOOL)isBackgrounded
{
  return self->_isBackgrounded;
}

- (void)setIsBackgrounded:(BOOL)a3
{
  self->_isBackgrounded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteObject, 0);
  objc_storeStrong(&self->_didEndCallback, 0);
}

@end
