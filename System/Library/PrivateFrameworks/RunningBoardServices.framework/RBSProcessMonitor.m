@implementation RBSProcessMonitor

- (void)_handleProcessStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RBSProcessMonitorConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[RBSProcessMonitorConfiguration stateDescriptor](self->_configuration, "stateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !self->_valid)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_28;
  }
  objc_msgSend(v4, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_configuration;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RBSProcessMonitorConfiguration matchesProcess:](v7, "matchesProcess:", v6))
  {
    v9 = (void *)objc_msgSend(v4, "copy");
    -[RBSProcessMonitorConfiguration stateDescriptor](v7, "stateDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filterState:", v9);

    -[NSMutableDictionary objectForKey:](self->_stateByIdentity, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    if (v11)
    {
      if ((objc_msgSend(v11, "isEqual:", v9) & 1) != 0)
      {
LABEL_13:
        rbs_monitor_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "process");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v16;
          _os_log_impl(&dword_190CD6000, v15, OS_LOG_TYPE_INFO, "Update skipped for %{public}@", buf, 0xCu);

        }
        v12 = 0;
        v13 = 0;
        goto LABEL_16;
      }
    }
    else if ((objc_msgSend(v4, "isRunning") & 1) == 0
           && (objc_msgSend(v4, "taskState") || (objc_msgSend(v4, "isEmptyState") & 1) != 0))
    {
      goto LABEL_13;
    }
    -[RBSProcessMonitorConfiguration updateHandler](v7, "updateHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "copy");
    +[RBSProcessStateUpdate updateWithState:previousState:exitEvent:](RBSProcessStateUpdate, "updateWithState:previousState:exitEvent:", v14, v20, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    if ((objc_msgSend(v4, "isRunning") & 1) == 0
      && (objc_msgSend(v4, "taskState") || (objc_msgSend(v4, "isEmptyState") & 1) != 0))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_stateByIdentity, "removeObjectForKey:", v8);
    }
    else
    {
      -[NSMutableDictionary setObject:forKey:](self->_stateByIdentity, "setObject:forKey:", v9, v8);
    }

    goto LABEL_22;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_stateByIdentity, "removeObjectForKey:", v8);
  v12 = 0;
  v13 = 0;
LABEL_22:
  os_unfair_lock_unlock(&self->_lock);
  if (v13 && v12)
  {
    ((void (**)(_QWORD, RBSProcessMonitor *, void *, void *))v12)[2](v12, self, v6, v13);
    rbs_monitor_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "process");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "taskState");
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 1024;
      v24 = v19;
      _os_log_impl(&dword_190CD6000, v17, OS_LOG_TYPE_INFO, "Update delivered for %{public}@ with taskState %d", buf, 0x12u);

    }
  }

LABEL_28:
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (unsigned)serviceClass
{
  os_unfair_lock_s *p_lock;
  unsigned int v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
    v4 = -[RBSProcessMonitorConfiguration serviceClass](self->_configuration, "serviceClass");
  else
    v4 = 17;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateConfiguration:(id)a3
{
  void (**v5)(id, RBSProcessMonitor *);
  os_unfair_lock_s *p_lock;
  void *v7;
  RBSServiceLocalProtocol *service;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSMutableDictionary *stateByIdentity;
  void *v22;
  void *v23;
  NSObject *v24;
  RBSProcessMonitorConfiguration *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  void (**v31)(id, RBSProcessMonitor *);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, RBSProcessMonitor *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessMonitor.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    self->_configuring = 1;
    v5[2](v5, self);
    self->_configuring = 0;
    v7 = (void *)-[RBSProcessMonitorConfiguration copy](self->_configuration, "copy");
    os_unfair_lock_unlock(&self->_lock);
    if (v7)
    {
      service = self->_service;
      v36 = 0;
      v9 = -[RBSServiceLocalProtocol subscribeProcessStateMonitor:configuration:error:](service, "subscribeProcessStateMonitor:configuration:error:", self, v7, &v36);
      v10 = v36;
      v11 = v10;
      if (v9)
      {
        v30 = v10;
        v31 = v5;
        os_unfair_lock_lock(&self->_lock);
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[NSMutableDictionary allValues](self->_stateByIdentity, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              -[RBSProcessMonitorConfiguration stateDescriptor](self->_configuration, "stateDescriptor");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "filterState:", v17);

              if ((objc_msgSend(v17, "isEmptyState") & 1) == 0)
              {
                objc_msgSend(v17, "process");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v7, "matchesProcess:", v19);

                if ((v20 & 1) != 0)
                  continue;
              }
              stateByIdentity = self->_stateByIdentity;
              objc_msgSend(v17, "process");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "identity");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](stateByIdentity, "setObject:forKeyedSubscript:", 0, v23);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v14);
        }

        os_unfair_lock_unlock(&self->_lock);
        rbs_monitor_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[RBSProcessMonitor updateConfiguration:].cold.1();

        v11 = v30;
        v5 = v31;
      }
      else
      {
        v26 = objc_msgSend(v10, "rbs_isPermanentFailure");
        rbs_monitor_log();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (v26)
        {
          if (v28)
            -[RBSProcessMonitor updateConfiguration:].cold.2();

          -[RBSProcessMonitor invalidate](self, "invalidate");
        }
        else
        {
          if (v28)
            -[RBSProcessMonitor updateConfiguration:].cold.3();

        }
      }

    }
  }
  else
  {
    v25 = objc_alloc_init(RBSProcessMonitorConfiguration);
    v5[2](v5, (RBSProcessMonitor *)v25);

    os_unfair_lock_unlock(p_lock);
  }

}

- (void)setPredicates:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessMonitor.m"), 208, CFSTR("must only call during configuration"));

  }
  -[RBSProcessMonitorConfiguration setPredicates:](self->_configuration, "setPredicates:", v6);

}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, v0, v1, "Invalidated monitor %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (RBSProcessMonitorConfiguration)configuration
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
    v4 = (void *)-[RBSProcessMonitorConfiguration copy](self->_configuration, "copy");
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return (RBSProcessMonitorConfiguration *)v4;
}

- (RBSProcessMonitor)init
{
  void *v3;
  RBSProcessMonitor *v4;

  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (RBSProcessMonitor *)-[RBSProcessMonitor _initWithService:]((id *)&self->super.isa, v3);

  return v4;
}

+ (id)monitorWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_monitorWithService:configuration:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_monitorWithService:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  id *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[RBSProcessMonitor _initWithService:]((id *)objc_alloc((Class)a1), v7);

  objc_msgSend(v8, "updateConfiguration:", v6);
  return v8;
}

- (id)_initWithService:(id *)a1
{
  id v4;
  id *v5;
  RBSProcessMonitorConfiguration *v6;
  id v7;
  id v8;
  id v9;
  dispatch_queue_t v10;
  id v11;
  objc_super v13;

  v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)RBSProcessMonitor;
    v5 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v5;
    if (v5)
    {
      *((_BYTE *)v5 + 24) = 1;
      objc_storeStrong(v5 + 2, a2);
      *((_DWORD *)a1 + 2) = 0;
      v6 = objc_alloc_init(RBSProcessMonitorConfiguration);
      v7 = a1[4];
      a1[4] = v6;

      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = a1[5];
      a1[5] = v8;

      v10 = +[RBSWorkloop createCalloutQueue:]((uint64_t)RBSWorkloop, CFSTR("RBSProcessMonitorCalloutQueue"));
      v11 = a1[6];
      a1[6] = v10;

    }
  }

  return a1;
}

- (void)setStateDescriptor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessMonitor.m"), 213, CFSTR("must only call during configuration"));

  }
  -[RBSProcessMonitorConfiguration setStateDescriptor:](self->_configuration, "setStateDescriptor:", v6);

}

- (void)setUpdateHandler:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessMonitor.m"), 228, CFSTR("must only call during configuration"));

  }
  -[RBSProcessMonitorConfiguration setUpdateHandler:](self->_configuration, "setUpdateHandler:", v6);

}

- (void)dealloc
{
  _os_crash();
  __break(1u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_stateByIdentity, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)setServiceClass:(unsigned int)a3
{
  uint64_t v3;
  void *v6;

  v3 = *(_QWORD *)&a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessMonitor.m"), 218, CFSTR("must only call during configuration"));

  }
  -[RBSProcessMonitorConfiguration setServiceClass:](self->_configuration, "setServiceClass:", v3);
}

- (void)setEvents:(unint64_t)a3
{
  void *v6;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessMonitor.m"), 223, CFSTR("must only call during configuration"));

  }
  -[RBSProcessMonitorConfiguration setEvents:](self->_configuration, "setEvents:", a3);
}

- (void)_handlePreventLaunchUpdate:(id)a3
{
  id v4;
  RBSProcessMonitorConfiguration *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    v5 = self->_configuration;
    if ((-[RBSProcessMonitorConfiguration events](v5, "events") & 2) != 0)
    {
      -[RBSProcessMonitorConfiguration preventLaunchUpdateHandler]((os_unfair_lock_s *)v5);
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      if (v6)
      {
        ((void (**)(_QWORD, RBSProcessMonitor *, id))v6)[2](v6, self, v4);

      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    rbs_monitor_log();
    v5 = (RBSProcessMonitorConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      -[RBSProcessMonitor _handlePreventLaunchUpdate:].cold.1();
  }

}

+ (id)monitor
{
  return objc_alloc_init((Class)a1);
}

+ (id)_monitorWithService:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = -[RBSProcessMonitor _initWithService:]((id *)objc_alloc((Class)a1), v4);

  return v5;
}

+ (id)monitorWithPredicate:(id)a3 updateHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessMonitor.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessMonitor.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__RBSProcessMonitor_monitorWithPredicate_updateHandler___block_invoke;
  v16[3] = &unk_1E2D16C78;
  v17 = v7;
  v18 = v9;
  v10 = v9;
  v11 = v7;
  objc_msgSend(a1, "monitorWithConfiguration:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __56__RBSProcessMonitor_monitorWithPredicate_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v5, v7, v8);

  objc_msgSend(v4, "setUpdateHandler:", *(_QWORD *)(a1 + 40));
  +[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStateDescriptor:", v6);

}

- (id)stateForIdentity:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stateByIdentity, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSSet)states
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allValues](self->_stateByIdentity, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v6;
}

- (id)description
{
  return -[RBSProcessMonitorConfiguration description](self->_configuration, "description");
}

- (unint64_t)events
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
    v4 = -[RBSProcessMonitorConfiguration events](self->_configuration, "events");
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPreventLaunchUpdateHandle:(id)a3
{
  void *v5;
  char *newValue;

  newValue = (char *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessMonitor.m"), 233, CFSTR("must only call during configuration"));

  }
  -[RBSProcessMonitorConfiguration setPreventLaunchUpdateHandler:](self->_configuration, newValue);

}

- (void)_reconnect
{
  if (a1)
    return (void *)objc_msgSend(a1, "updateConfiguration:", &__block_literal_global);
  return a1;
}

- (void)_handleExitEvent:(id)a3
{
  id v4;
  void *v5;
  RBSProcessMonitorConfiguration *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    objc_msgSend(v4, "process");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_configuration;
    if ((-[RBSProcessMonitorConfiguration events](v6, "events") & 1) != 0
      && -[RBSProcessMonitorConfiguration matchesProcess:](v6, "matchesProcess:", v5))
    {
      -[RBSProcessMonitorConfiguration updateHandler](v6, "updateHandler");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      +[RBSProcessStateUpdate updateWithState:previousState:exitEvent:](RBSProcessStateUpdate, "updateWithState:previousState:exitEvent:", 0, 0, v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v8 && v7)
      ((void (**)(_QWORD, RBSProcessMonitor *, void *, NSObject *))v7)[2](v7, self, v5, v8);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    rbs_monitor_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RBSProcessMonitor _handleExitEvent:].cold.1();
  }

}

- (void)updateConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, v0, v1, "Successfully synced configuration for monitor %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateConfiguration:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_190CD6000, v0, v1, "Permanent error subscribing to process monitor %{public}@ <%{public}@>");
  OUTLINED_FUNCTION_0();
}

- (void)updateConfiguration:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_190CD6000, v0, v1, "Transient error subscribing to process monitor %{public}@ <%{public}@>");
  OUTLINED_FUNCTION_0();
}

- (void)_handleExitEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_190CD6000, v0, v1, "_handleExitEvent called for invalid monitor %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handlePreventLaunchUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_190CD6000, v0, v1, "_handlePreventLaunchUpdate called for invalid monitor %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
