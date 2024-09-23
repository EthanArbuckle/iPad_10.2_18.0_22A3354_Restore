@implementation VUIPlaybackReporter

- (VUIPlaybackReporter)init
{
  VUIPlaybackReporter *v2;
  VUIPlaybackReporter *v3;
  NSMutableArray *v4;
  NSMutableArray *sessions;
  uint64_t v6;
  OS_os_log *logObject;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIPlaybackReporter;
  v2 = -[VUIPlaybackReporter init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VUIPlaybackReporter _registerObservers](v2, "_registerObservers");
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sessions = v3->_sessions;
    v3->_sessions = v4;

    v3->_enforceSinglePlaybackSession = 1;
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    logObject = v3->_logObject;
    v3->_logObject = (OS_os_log *)v6;

  }
  return v3;
}

- (void)_registerObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__playerStateWillChange_, *MEMORY[0x1E0DB1F70], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__playerCurrentMediaItemWillChange_, *MEMORY[0x1E0DB1E28], 0);

}

- (void)setLogObject:(id)a3
{
  objc_storeStrong((id *)&self->_logObject, a3);
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (OS_os_log)logObject
{
  return self->_logObject;
}

- (id)_sessionForPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIPlaybackReporter sessions](self, "sessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "player");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_playerStateWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("_playerStateWillChange %@"), v5);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DB1F50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporter _handlePlaybackChangeForPlayer:fromState:toState:reason:](self, "_handlePlaybackChangeForPlayer:fromState:toState:reason:", v9, v7, v6, v8);

}

- (void)_playerCurrentMediaItemWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "object");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("_playerCurrentMediaItemWillChange %@"), v6);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DB1E18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("Stopping %@"), v10);
    objc_msgSend(v10, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporter _handlePlaybackChangeForPlayer:fromState:toState:reason:](self, "_handlePlaybackChangeForPlayer:fromState:toState:reason:", v10, v8, v9, v7);

    -[VUIPlaybackReporter _endSession:](self, "_endSession:", v5);
  }

}

- (void)_logWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v12);

  -[VUIPlaybackReporter logObject](self, "logObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), objc_opt_class(), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
}

- (BOOL)_isTransitionValidForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DB1958];
  v8 = a5;
  objc_msgSend(v7, "playing");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10 == v6;

  }
  return v11;
}

- (void)_handlePlaybackChangeForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  id v28;
  const __CFString *v29;
  id v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = a6;
  -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIPlaybackReporter _isTransitionValidForPlayer:fromState:toState:](self, "_isTransitionValidForPlayer:fromState:toState:", v10, v11, v12);
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v12)
  {
    if (-[VUIPlaybackReporter enforceSinglePlaybackSession](self, "enforceSinglePlaybackSession"))
    {
      v31 = v14;
      v32 = v13;
      v33 = v12;
      v34 = v11;
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[VUIPlaybackReporter sessions](self, "sessions");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v38;
        v20 = CFSTR("End session (enforcing single session) %@");
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v22, "player");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            if ((id)v23 != v10)
            {
              -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", v20, v23);
              if (objc_msgSend(v22, "reportingEnabled"))
              {
                objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
                v25 = v10;
                v26 = v20;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIPlaybackReporter _reportForSession:state:reason:](self, "_reportForSession:state:reason:", v22, v27, v35);

                v20 = v26;
                v10 = v25;
              }
              objc_msgSend(v16, "addObject:", v22);
            }

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v18);
      }

      -[VUIPlaybackReporter _endSessions:](self, "_endSessions:", v16);
      v12 = v33;
      v11 = v34;
      v13 = v32;
      v14 = v31;
    }
    if (!v13)
    {
      -[VUIPlaybackReporter _createSessionForPlayer:](self, "_createSessionForPlayer:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[VUIPlaybackReporter _beginSession:](self, "_beginSession:", v13);
        v28 = v13;
      }
      else
      {
        -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("Invalid player. Not creating session %@"), v10);
      }

    }
  }
  v29 = CFSTR("Invalid");
  if (v14)
    v29 = CFSTR("Valid");
  -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("Transition: %@ --> %@ (%@), %@, reason:%@"), v11, v12, v29, v10, v35);
  if (v14)
  {
    if (v13)
    {
      if (objc_msgSend(v13, "reportingEnabled"))
        -[VUIPlaybackReporter _reportForSession:state:reason:](self, "_reportForSession:state:reason:", v13, v12, v35);
    }
    else
    {
      -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("Ignoring event for un-matched session %@"), v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (v30 == v12 && v13)
    -[VUIPlaybackReporter _endSession:](self, "_endSession:", v13);

}

- (void)dealloc
{
  objc_super v3;

  -[VUIPlaybackReporter _removeObservers](self, "_removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)VUIPlaybackReporter;
  -[VUIPlaybackReporter dealloc](&v3, sel_dealloc);
}

- (void)_removeObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_endSessions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[VUIPlaybackReporter sessions](self, "sessions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (void)_endSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("Will end reporting for %@"), v4);
  -[VUIPlaybackReporter sessions](self, "sessions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_beginSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", CFSTR("Will begin reporting for %@"), v4);
  -[VUIPlaybackReporter sessions](self, "sessions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "raise");

}

- (id)_createSessionForPlayer:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise");

  return 0;
}

- (BOOL)enforceSinglePlaybackSession
{
  return self->_enforceSinglePlaybackSession;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_logObject, 0);
}

@end
