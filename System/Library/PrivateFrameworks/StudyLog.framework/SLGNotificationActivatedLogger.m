@implementation SLGNotificationActivatedLogger

- (SLGNotificationActivatedLogger)initWithLogger:(id)a3
{
  id v5;
  NSMutableSet *v6;
  NSMutableSet *activeReasons;
  NSMutableDictionary *v8;
  void *registrationsByReason;

  v5 = a3;
  if (objc_msgSend(v5, "isEnabled"))
  {
    objc_storeStrong((id *)&self->_logger, a3);
    self->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    activeReasons = self->_activeReasons;
    self->_activeReasons = v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    registrationsByReason = self->_registrationsByReason;
    self->_registrationsByReason = v8;
  }
  else
  {
    registrationsByReason = self;
    self = 0;
  }

  return self;
}

- (void)addBeginNotification:(id)a3 endNotification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  SLGNotificationActivatedLogger *v21;
  id v22;
  int v23;
  _QWORD handler[5];
  id v25;
  int out_token;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registrationsByReason, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    out_token = 0;
    v9 = objc_retainAutorelease(v6);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_get_global_queue(33, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke;
    handler[3] = &unk_1E81F3298;
    handler[4] = self;
    v13 = v9;
    v25 = v13;
    notify_register_dispatch(v10, &out_token, v11, handler);

    v23 = 0;
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v17 = v12;
    v18 = 3221225472;
    v19 = __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke_2;
    v20 = &unk_1E81F3298;
    v21 = self;
    v15 = v13;
    v22 = v15;
    notify_register_dispatch(v14, &v23, v11, &v17);

    +[SLGNotificationActivatedLoggerRegistration registrationWithBeginToken:endToken:](SLGNotificationActivatedLoggerRegistration, "registrationWithBeginToken:endToken:", out_token, v23, v17, v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registrationsByReason, "setObject:forKeyedSubscript:", v16, v15);

  }
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginLoggingForReason:", *(_QWORD *)(a1 + 40));
}

uint64_t __71__SLGNotificationActivatedLogger_addBeginNotification_endNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endLoggingForReason:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  -[SLGNotificationActivatedLogger _cancelRegistrations](self, "_cancelRegistrations");
  -[SLGActivatableLogging invalidate](self->_logger, "invalidate");
}

- (BOOL)isActive
{
  return -[SLGActivatableLogging isActive](self->_logger, "isActive");
}

- (void)setActive:(BOOL)a3
{
  -[SLGActivatableLogging setActive:](self->_logger, "setActive:");
  os_unfair_lock_lock(&self->_lock);
  if (!a3)
    -[NSMutableSet removeAllObjects](self->_activeReasons, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setActivationHandler:(id)a3
{
  -[SLGActivatableLogging setActivationHandler:](self->_logger, "setActivationHandler:", a3);
}

- (id)activationHandler
{
  return (id)-[SLGActivatableLogging activationHandler](self->_logger, "activationHandler");
}

- (void)setDeactivationHandler:(id)a3
{
  -[SLGActivatableLogging setDeactivationHandler:](self->_logger, "setDeactivationHandler:", a3);
}

- (id)deactivationHandler
{
  return (id)-[SLGActivatableLogging deactivationHandler](self->_logger, "deactivationHandler");
}

- (void)logBlock:(id)a3 domain:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[SLGNotificationActivatedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:](self->_logger, "logBlock:domain:", v7, v6);

}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (-[SLGNotificationActivatedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:completion:](self->_logger, "logBlock:domain:completion:", v10, v8, v9);

}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (-[SLGNotificationActivatedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:tags:](self->_logger, "logBlock:domain:tags:", v10, v8, v9);

}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[SLGNotificationActivatedLogger isActive](self, "isActive"))
    -[SLGActivatableLogging logBlock:domain:tags:completion:](self->_logger, "logBlock:domain:tags:completion:", v13, v10, v11, v12);

}

- (BOOL)isEnabled
{
  return 1;
}

- (void)_beginLoggingForReason:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_activeReasons, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
  -[SLGActivatableLogging setActive:](self->_logger, "setActive:", 1);
}

- (void)_endLoggingForReason:(id)a3
{
  SLGActivatableLogging *logger;
  id v5;

  logger = self->_logger;
  v5 = a3;
  -[SLGActivatableLogging setActive:](logger, "setActive:", 0);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeObject:](self->_activeReasons, "removeObject:", v5);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_cancelRegistrations
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_registrationsByReason;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_registrationsByReason, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        notify_cancel(objc_msgSend(v9, "beginToken"));
        notify_cancel(objc_msgSend(v9, "endToken"));

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_registrationsByReason, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationsByReason, 0);
  objc_storeStrong((id *)&self->_activeReasons, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
