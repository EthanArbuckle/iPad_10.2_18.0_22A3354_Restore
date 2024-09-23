@implementation SBDaemonContext

uint64_t __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCancelation");
}

- (SBDaemonContext)initWithPid:(int)a3 queue:(id)a4
{
  uint64_t v4;
  id v6;
  SBDaemonContext *v7;
  SBDaemonContext *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *daemonRequests;
  uint64_t v11;
  OS_dispatch_source *dispatchSource;
  objc_super v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBDaemonContext;
  v7 = -[SBDaemonContext init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_pid = v4;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    daemonRequests = v8->_daemonRequests;
    v8->_daemonRequests = v9;

    v11 = -[SBDaemonContext _newDispatchSourceForPid:queue:](v8, "_newDispatchSourceForPid:queue:", v4, v6);
    dispatchSource = v8->_dispatchSource;
    v8->_dispatchSource = (OS_dispatch_source *)v11;

    if (!v8->_dispatchSource)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)addRequest:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_daemonRequests, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[NSMutableDictionary setObject:forKey:](self->_daemonRequests, "setObject:forKey:", v8, v6);
    objc_msgSend(v8, "dispatchEnablerOnQueue:", MEMORY[0x1E0C80D38]);
  }

}

- (id)_newDispatchSourceForPid:(int)a3 queue:(id)a4
{
  uint64_t v4;
  NSObject *v6;
  dispatch_source_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[5];
  _QWORD handler[4];
  NSObject *v27;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (!(_DWORD)v4)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBDaemonContext _newDispatchSourceForPid:queue:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_8;
  }
  v7 = dispatch_source_create(MEMORY[0x1E0C80DB0], (int)v4, 0x80000000uLL, v6);
  if (!v7)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBDaemonContext _newDispatchSourceForPid:queue:].cold.2(v4, v10, v18, v19, v20, v21, v22, v23);
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v8 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke;
  handler[3] = &unk_1E8E9DED8;
  v9 = v7;
  v27 = v9;
  dispatch_source_set_event_handler(v9, handler);
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke_2;
  v25[3] = &unk_1E8E9DED8;
  v25[4] = self;
  dispatch_source_set_cancel_handler(v9, v25);
  dispatch_resume(v9);
  v10 = v27;
LABEL_9:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonRequests, 0);
  objc_storeStrong((id *)&self->_dispatchSource, 0);
}

- (void)removeRequestForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_daemonRequests, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_daemonRequests, "removeObjectForKey:", v5);
    objc_msgSend(v4, "dispatchDisablerOnQueue:", MEMORY[0x1E0C80D38]);
    if (!-[NSMutableDictionary count](self->_daemonRequests, "count"))
      dispatch_source_cancel((dispatch_source_t)self->_dispatchSource);
  }

}

- (void)_handleCancelation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *daemonRequests;
  OS_dispatch_source *dispatchSource;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_daemonRequests, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = MEMORY[0x1E0C80D38];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "dispatchDisablerOnQueue:", v7);
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  daemonRequests = self->_daemonRequests;
  self->_daemonRequests = 0;

  dispatchSource = self->_dispatchSource;
  if (dispatchSource)
  {
    self->_dispatchSource = 0;

  }
  +[SBDaemonHandler noteDaemonCanceled:](SBDaemonHandler, "noteDaemonCanceled:", self);
}

- (int)pid
{
  return self->_pid;
}

void __50__SBDaemonContext__newDispatchSourceForPid_queue___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

- (id)description
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@[%i]:"), objc_opt_class(), -[SBDaemonContext pid](self, "pid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_daemonRequests;
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
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_newDispatchSourceForPid:(uint64_t)a3 queue:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D0540000, a1, a3, "Invalid daemon pid %d", a5, a6, a7, a8, 0);
}

- (void)_newDispatchSourceForPid:(uint64_t)a3 queue:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D0540000, a2, a3, "Unable to create dispatch source for pid %d", a5, a6, a7, a8, 0);
}

@end
