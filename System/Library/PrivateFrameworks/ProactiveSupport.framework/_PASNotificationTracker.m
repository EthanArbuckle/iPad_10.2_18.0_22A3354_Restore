@implementation _PASNotificationTracker

- (id)registerWithQueue:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 *v10;
  dispatch_group_t v11;
  _opaque_pthread_mutex_t *p_lock;
  unint64_t nextNotificationToken;
  NSMutableDictionary *observers;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASNotificationTracker.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASNotificationTracker.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (unsigned __int8 *)objc_opt_new();
  objc_msgSend(v10, "setQueue:", v7);
  v11 = dispatch_group_create();
  objc_msgSend(v10, "setGroup:", v11);

  objc_msgSend(v10, "setHandler:", v9);
  atomic_store(0, v10 + 8);
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  nextNotificationToken = self->_nextNotificationToken;
  observers = self->_observers;
  self->_nextNotificationToken = nextNotificationToken + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", nextNotificationToken);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](observers, "setObject:forKeyedSubscript:", v10, v15);

  pthread_mutex_unlock(p_lock);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setToken:", nextNotificationToken);

  return v16;
}

- (_PASNotificationTracker)init
{
  _PASNotificationTracker *v2;
  _PASNotificationTracker *v3;
  uint64_t v4;
  NSMutableDictionary *observers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PASNotificationTracker;
  v2 = -[_PASNotificationTracker init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    v3->_nextNotificationToken = 1;
    v4 = objc_opt_new();
    observers = v3->_observers;
    v3->_observers = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PASNotificationTracker;
  -[_PASNotificationTracker dealloc](&v3, sel_dealloc);
}

- (BOOL)_deregisterHandlerWithToken:(id)a3 waitOnPending:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  unsigned __int8 *v7;
  NSObject *v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "token"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v6);
  v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_observers, "removeObjectForKey:", v6);
  pthread_mutex_unlock(&self->_lock);
  if (v7)
  {
    atomic_store(1u, v7 + 8);
    if (v4)
    {
      objc_msgSend(v7, "group");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

    }
  }

  return v7 != 0;
}

- (BOOL)deregisterHandlerWithToken:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASNotificationTracker.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v6 = -[_PASNotificationTracker _deregisterHandlerWithToken:waitOnPending:](self, "_deregisterHandlerWithToken:waitOnPending:", v5, 1);

  return v6;
}

- (BOOL)deregisterHandlerAsyncWithToken:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASNotificationTracker.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v6 = -[_PASNotificationTracker _deregisterHandlerWithToken:waitOnPending:](self, "_deregisterHandlerWithToken:waitOnPending:", v5, 0);

  return v6;
}

- (void)issueNotificationAsyncWithContext:(id)a3 callback:(id)a4
{
  id v6;
  dispatch_group_t v7;
  _opaque_pthread_mutex_t *p_lock;
  NSMutableDictionary *observers;
  NSObject *v10;
  id v11;
  NSObject *v12;
  dispatch_block_t block;
  _QWORD v14[4];
  NSObject *v15;
  id v16;

  v6 = a3;
  block = a4;
  v7 = dispatch_group_create();
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  observers = self->_observers;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke;
  v14[3] = &unk_1E442F0B8;
  v10 = v7;
  v15 = v10;
  v16 = v6;
  v11 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observers, "enumerateKeysAndObjectsUsingBlock:", v14);
  pthread_mutex_unlock(p_lock);
  if (block)
  {
    dispatch_get_global_queue(17, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v10, v12, block);

  }
}

- (void)issueNotificationAsyncWithContext:(id)a3
{
  -[_PASNotificationTracker issueNotificationAsyncWithContext:callback:](self, "issueNotificationAsyncWithContext:callback:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
