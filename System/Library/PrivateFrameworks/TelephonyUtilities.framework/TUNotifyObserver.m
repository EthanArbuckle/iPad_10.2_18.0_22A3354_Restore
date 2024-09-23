@implementation TUNotifyObserver

- (TUNotifyObserver)initWithNotificationName:(id)a3 queue:(id)a4
{
  return -[TUNotifyObserver initWithNotificationName:queue:callback:](self, "initWithNotificationName:queue:callback:", a3, a4, 0);
}

- (TUNotifyObserver)initWithNotificationName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUNotifyObserver *v11;
  TUNotifyObserver *v12;
  uint64_t v13;
  NSString *notificationName;
  uint64_t v15;
  id callback;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TUNotifyObserver;
  v11 = -[TUNotifyObserver init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = objc_msgSend(v8, "copy");
    notificationName = v12->_notificationName;
    v12->_notificationName = (NSString *)v13;

    objc_storeStrong((id *)&v12->_queue, a4);
    v15 = objc_msgSend(v10, "copy");
    callback = v12->_callback;
    v12->_callback = (id)v15;

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[TUNotifyObserver _endObserving](self, "_endObserving");
  v3.receiver = self;
  v3.super_class = (Class)TUNotifyObserver;
  -[TUNotifyObserver dealloc](&v3, sel_dealloc);
}

- (id)callback
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _Block_copy(self->_callback);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCallback:(id)a3
{
  void *v4;
  id callback;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_callback != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    callback = self->_callback;
    self->_callback = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)isObserving
{
  TUNotifyObserver *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[TUNotifyObserver token](v2, "token") > 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t state64;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state64 = 0;
  notify_get_state(-[TUNotifyObserver token](self, "token"), &state64);
  v4 = state64;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)beginObserving
{
  os_unfair_lock_s *p_lock;
  id v4;
  const char *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  -[TUNotifyObserver notificationName](self, "notificationName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  -[TUNotifyObserver queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__TUNotifyObserver_beginObserving__block_invoke;
  v7[3] = &unk_1E38A1698;
  objc_copyWeak(&v8, &location);
  notify_register_dispatch(v5, &self->_token, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(p_lock);
}

void __34__TUNotifyObserver_beginObserving__block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "callback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "callback");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

- (void)endObserving
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[TUNotifyObserver _endObserving](self, "_endObserving");
  os_unfair_lock_unlock(p_lock);
}

- (void)_endObserving
{
  notify_cancel(-[TUNotifyObserver token](self, "token"));
  -[TUNotifyObserver setToken:](self, "setToken:", 0);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
