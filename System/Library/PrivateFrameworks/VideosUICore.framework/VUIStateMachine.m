@implementation VUIStateMachine

- (void)logUnhandledEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_handlers, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sortedArrayUsingSelector:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v58 != v7)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_handlers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v54 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v6);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[NSMutableDictionary allKeys](self->_defaultHandlers, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
    }
    while (v17);
  }

  objc_msgSend(v4, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sortedArrayUsingSelector:", sel_compare_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v36 = v21;
  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v46;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v46 != v37)
          objc_enumerationMutation(v36);
        v40 = v22;
        v23 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v22);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v24 = obj;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v42;
          do
          {
            for (m = 0; m != v26; ++m)
            {
              if (*(_QWORD *)v42 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * m);
              -[NSMutableDictionary objectForKey:](self->_handlers, "objectForKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKey:", v23);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v31)
              {
                -[NSMutableDictionary objectForKey:](self->_defaultHandlers, "objectForKey:", v23);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v32)
                {
                  -[VUIStateMachine logObject](self, "logObject");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v33)
                  {
                    -[VUIStateMachine logObject](self, "logObject");
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v62 = v23;
                      v63 = 2112;
                      v64 = v29;
                      _os_log_impl(&dword_1D951F000, v34, OS_LOG_TYPE_INFO, "[%@] is unhandled for [%@]", buf, 0x16u);
                    }

                  }
                }
              }

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
          }
          while (v26);
        }

        v22 = v40 + 1;
      }
      while (v40 + 1 != v38);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
    }
    while (v38);
  }

}

- (OS_os_log)logObject
{
  return self->_logObject;
}

- (void)registerDefaultHandlerForEvent:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *name;
  NSMutableDictionary *v11;
  NSMutableDictionary *defaultHandlers;
  void *v13;
  int v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[VUIStateMachine shouldAcceptEvents](self, "shouldAcceptEvents"))
  {
    -[VUIStateMachine logObject](self, "logObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[VUIStateMachine logObject](self, "logObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        v14 = 138412290;
        v15 = name;
        _os_log_impl(&dword_1D951F000, v9, OS_LOG_TYPE_DEFAULT, "State machine [%@] can not register default handlers when it is accepting events", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    v11 = self->_handlers;
    objc_sync_enter(v11);
    if (v6 && v7)
    {
      defaultHandlers = self->_defaultHandlers;
      v13 = (void *)objc_msgSend(v7, "copy");
      -[NSMutableDictionary setObject:forKey:](defaultHandlers, "setObject:forKey:", v13, v6);

    }
    objc_sync_exit(v11);

  }
}

- (void)registerHandlerForEvent:(id)a3 onStates:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[VUIStateMachine shouldAcceptEvents](self, "shouldAcceptEvents"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[VUIStateMachine registerHandlerForEvent:onState:withBlock:](self, "registerHandlerForEvent:onState:withBlock:", v8, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v10, (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (void)postEvent:(id)a3 withContext:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSMutableArray *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && -[VUIStateMachine shouldAcceptEvents](self, "shouldAcceptEvents"))
  {
    -[VUIStateMachine ignorableEvents](self, "ignorableEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v8);

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v8, CFSTR("VUIStateMachineEventKey"));
      v16 = objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v9)
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v9, CFSTR("VUIStateMachineContextKey"));
      if (v10)
        -[NSObject setObject:forKey:](v14, "setObject:forKey:", v10, CFSTR("VUIStateMachineUserInfoKey"));
      v17 = self->_events;
      objc_sync_enter(v17);
      -[NSMutableArray addObject:](self->_events, "addObject:", v14);
      v18 = -[NSMutableArray count](self->_events, "count");
      objc_sync_exit(v17);

      if (v18 == 1)
      {
        -[VUIStateMachine logObject](self, "logObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[VUIStateMachine logObject](self, "logObject");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            -[VUIStateMachine name](self, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 138412546;
            v23 = v21;
            v24 = 2112;
            v25 = v8;
            _os_log_impl(&dword_1D951F000, v20, OS_LOG_TYPE_DEFAULT, "State machine [%@] received event [%@], initiating event processing", (uint8_t *)&v22, 0x16u);

          }
        }
        -[VUIStateMachine _processNextEvent](self, "_processNextEvent");
      }
      goto LABEL_17;
    }
    -[VUIStateMachine logObject](self, "logObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[VUIStateMachine logObject](self, "logObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIStateMachine name](self, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v15;
        v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_1D951F000, v14, OS_LOG_TYPE_DEFAULT, "State machine named [%@] received ignorable event [%@]", (uint8_t *)&v22, 0x16u);

      }
LABEL_17:

    }
  }

}

- (void)registerHandlerForEvent:(id)a3 onState:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSString *name;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[VUIStateMachine shouldAcceptEvents](self, "shouldAcceptEvents"))
  {
    if (!v9)
      goto LABEL_16;
    v14 = self->_handlers;
    objc_sync_enter(v14);
    -[NSMutableDictionary objectForKey:](self->_handlers, "objectForKey:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15 && v8 && v10)
    {
      v16 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](self->_handlers, "setObject:forKey:", v16, v9);
      goto LABEL_14;
    }
    if (v8)
    {
      if (v10)
      {
LABEL_14:
        v17 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v16, "setObject:forKey:", v17, v8);

        goto LABEL_15;
      }
      objc_msgSend(v15, "removeObjectForKey:", v8);
    }
LABEL_15:

    objc_sync_exit(v14);
    goto LABEL_16;
  }
  -[VUIStateMachine logObject](self, "logObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[VUIStateMachine logObject](self, "logObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      v18 = 138412290;
      v19 = name;
      _os_log_impl(&dword_1D951F000, v12, OS_LOG_TYPE_DEFAULT, "State machine [%@] can not register event handlers when it is accepting events", (uint8_t *)&v18, 0xCu);
    }

  }
LABEL_16:

}

- (BOOL)shouldAcceptEvents
{
  return self->_shouldAcceptEvents;
}

- (void)_processNextEvent
{
  NSMutableArray *v3;
  void *v4;
  id v5;

  v3 = self->_events;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](self->_events, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v3);

  v4 = v5;
  if (v5)
  {
    if (self->_mode)
      -[VUIStateMachine _dispatchEvent:](self, "_dispatchEvent:", v5);
    else
      -[VUIStateMachine _processEvent:](self, "_processEvent:", v5);
    v4 = v5;
  }

}

- (id)_eventHandlerForEvent:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *handlers;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = self->_handlers;
    objc_sync_enter(v5);
    handlers = self->_handlers;
    -[VUIStateMachine currentState](self, "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](handlers, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[NSMutableDictionary objectForKey:](self->_defaultHandlers, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_sync_exit(v5);
  }
  else
  {
    v9 = 0;
  }
  if (v9)
    v10 = v9;
  else
    v10 = &__block_literal_global_12;
  v11 = (void *)MEMORY[0x1DF08E588](v10);

  return v11;
}

- (void)_processEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSString *name;
  void *v13;
  VUIStateMachine *v14;
  void *v15;
  VUIStateMachine *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  if (v20)
  {
    v4 = v20;
    do
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("VUIStateMachineEventKey"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("VUIStateMachineUserInfoKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("VUIStateMachineContextKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStateMachine _eventHandlerForEvent:](self, "_eventHandlerForEvent:", v5);
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[VUIStateMachine logObject](self, "logObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if (!v10)
      {
        -[VUIStateMachine logObject](self, "logObject");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          name = self->_name;
          -[VUIStateMachine currentState](self, "currentState");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v22 = name;
          v23 = 2112;
          v24 = v5;
          v25 = 2112;
          v26 = v13;
          _os_log_impl(&dword_1D951F000, v11, OS_LOG_TYPE_DEFAULT, "State machine [%@] processing event [%@] in state [%@]", buf, 0x20u);

        }
      }
      v14 = self;
      objc_sync_enter(v14);
      self->_handlingEvent = 1;
      objc_sync_exit(v14);

      ((void (**)(_QWORD, VUIStateMachine *, void *, void *, void *))v8)[2](v8, v14, v5, v7, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      objc_sync_enter(v16);
      self->_handlingEvent = 0;
      objc_sync_exit(v16);

      -[VUIStateMachine _transitionToState:withEvent:context:userInfo:](v16, "_transitionToState:withEvent:context:userInfo:", v15, v5, v7, v6);
      v17 = self->_events;
      objc_sync_enter(v17);
      v18 = -[NSMutableArray count](self->_events, "count");
      if (v18)
      {
        if (v18 == 1)
        {
          -[NSMutableArray removeObjectAtIndex:](self->_events, "removeObjectAtIndex:", 0);
          v19 = 0;
        }
        else
        {
          -[NSMutableArray removeObjectAtIndex:](self->_events, "removeObjectAtIndex:", 0);
          -[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", 0);
          v19 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v19 = 0;
      }

      objc_sync_exit(v17);
      v4 = (void *)v19;
    }
    while (v19);
  }

}

- (NSString)currentState
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)_transitionToState:(id)a3 withEvent:(id)a4 context:(id)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSString *name;
  void *v19;
  NSObject *v20;
  NSString *v21;
  void (**stateChangeHandler)(id, VUIStateMachine *, void *, id, id, id, id);
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  VUIStateMachine *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  NSString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[VUIStateMachine currentState](self, "currentState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  if (objc_msgSend(v15, "isEqualToString:", v10))
  {
    -[VUIStateMachine logObject](self, "logObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[VUIStateMachine logObject](self, "logObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412802;
        v34 = name;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v11;
        _os_log_impl(&dword_1D951F000, v17, OS_LOG_TYPE_DEFAULT, "State machine [%@] remaining at state [%@] on event [%@]", buf, 0x20u);
      }

    }
  }
  else
  {
    -[VUIStateMachine setCurrentState:](self, "setCurrentState:", v10);
    -[VUIStateMachine logObject](self, "logObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[VUIStateMachine logObject](self, "logObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_name;
        *(_DWORD *)buf = 138412802;
        v34 = v21;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v10;
        _os_log_impl(&dword_1D951F000, v20, OS_LOG_TYPE_DEFAULT, "State machine [%@] transitioning from state [%@] to [%@]", buf, 0x20u);
      }

    }
    stateChangeHandler = (void (**)(id, VUIStateMachine *, void *, id, id, id, id))self->_stateChangeHandler;
    if (stateChangeHandler)
    {
      if (self->_callsStateChangeHandlerSynchronously)
      {
        stateChangeHandler[2](stateChangeHandler, self, v15, v10, v11, v12, v13);
      }
      else
      {
        v23 = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = __74__VUIStateMachine_Private___transitionToState_withEvent_context_userInfo___block_invoke;
        v26 = &unk_1E9F2C148;
        v27 = self;
        v28 = v15;
        v29 = v10;
        v30 = v11;
        v31 = v12;
        v32 = v13;
        dispatch_async(MEMORY[0x1E0C80D38], &v23);

      }
    }
  }
  -[VUIStateMachine _executePostTransitionBlocks](self, "_executePostTransitionBlocks", v23, v24, v25, v26, v27);

}

- (void)setCurrentState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void)_executePostTransitionBlocks
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_blocksToExecuteAfterStateTransition;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_blocksToExecuteAfterStateTransition, "copy");
  -[NSMutableArray removeAllObjects](self->_blocksToExecuteAfterStateTransition, "removeAllObjects");
  objc_sync_exit(v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSString)name
{
  return self->_name;
}

- (NSArray)ignorableEvents
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

uint64_t __74__VUIStateMachine_Private___transitionToState_withEvent_context_userInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setShouldAcceptEvents:(BOOL)a3
{
  self->_shouldAcceptEvents = a3;
}

- (void)setLogObject:(id)a3
{
  objc_storeStrong((id *)&self->_logObject, a3);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)sStateMachines;
    sStateMachines = v2;

  }
}

- (void)executeBlockAfterCurrentStateTransition:(id)a3
{
  void (**v4)(void);
  VUIStateMachine *v5;
  _BOOL4 handlingEvent;
  NSMutableArray *v7;
  NSMutableArray *blocksToExecuteAfterStateTransition;
  void *v9;
  void (**v10)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    handlingEvent = v5->_handlingEvent;
    objc_sync_exit(v5);

    if (handlingEvent)
    {
      v7 = v5->_blocksToExecuteAfterStateTransition;
      objc_sync_enter(v7);
      blocksToExecuteAfterStateTransition = v5->_blocksToExecuteAfterStateTransition;
      v9 = (void *)objc_msgSend(v10, "copy");
      -[NSMutableArray addObject:](blocksToExecuteAfterStateTransition, "addObject:", v9);

      objc_sync_exit(v7);
    }
    else
    {
      v10[2]();
    }
    v4 = v10;
  }

}

- (VUIStateMachine)initWithName:(id)a3 initialState:(id)a4 mode:(int64_t)a5 stateChangeHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  VUIStateMachine *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSMutableArray *events;
  uint64_t v18;
  NSMutableDictionary *handlers;
  uint64_t v20;
  NSMutableDictionary *defaultHandlers;
  uint64_t v22;
  NSMutableArray *blocksToExecuteAfterStateTransition;
  id v24;
  uint64_t v25;
  id stateChangeHandler;
  VUIStateMachine *v27;
  uint64_t v28;
  OS_dispatch_queue *dispatchQueue;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)VUIStateMachine;
  v13 = -[VUIStateMachine init](&v31, sel_init);
  if (!v13)
  {
LABEL_10:
    v27 = v13;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "length") && objc_msgSend(v11, "length"))
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    -[VUIStateMachine setCurrentState:](v13, "setCurrentState:", v11);
    v13->_mode = a5;
    v16 = objc_opt_new();
    events = v13->_events;
    v13->_events = (NSMutableArray *)v16;

    v18 = objc_opt_new();
    handlers = v13->_handlers;
    v13->_handlers = (NSMutableDictionary *)v18;

    v20 = objc_opt_new();
    defaultHandlers = v13->_defaultHandlers;
    v13->_defaultHandlers = (NSMutableDictionary *)v20;

    v22 = objc_opt_new();
    blocksToExecuteAfterStateTransition = v13->_blocksToExecuteAfterStateTransition;
    v13->_blocksToExecuteAfterStateTransition = (NSMutableArray *)v22;

    if (v12)
    {
      v24 = (id)objc_msgSend(v12, "copy");
      v25 = MEMORY[0x1DF08E588]();
      stateChangeHandler = v13->_stateChangeHandler;
      v13->_stateChangeHandler = (id)v25;

    }
    else
    {
      v24 = v13->_stateChangeHandler;
      v13->_stateChangeHandler = 0;
    }

    objc_storeStrong((id *)&v13->_logObject, MEMORY[0x1E0C81028]);
    if (a5 == 1)
    {
      dispatch_get_global_queue(21, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      dispatchQueue = v13->_dispatchQueue;
      v13->_dispatchQueue = (OS_dispatch_queue *)v28;

    }
    goto LABEL_10;
  }
  v27 = 0;
LABEL_11:

  return v27;
}

+ (void)registerStateMachine:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    v7 = v3;
    v4 = v3;
    objc_sync_enter(v4);
    objc_msgSend(v4, "setShouldAcceptEvents:", 1);
    v5 = (void *)sStateMachines;
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

    objc_sync_exit(v4);
    v3 = v7;
  }

}

+ (id)stateMachineWithName:(id)a3
{
  return (id)objc_msgSend((id)sStateMachines, "objectForKey:", a3);
}

+ (void)deregisterStateMachine:(id)a3
{
  id v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "setShouldAcceptEvents:", 0);
    objc_msgSend(v3, "purgeEventQueue");
    objc_msgSend(v3, "deregisterHandlers");
    v4 = (void *)sStateMachines;
    objc_msgSend(v3, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeObjectForKey:", v5);
  }
}

+ (id)stateMachinesOfType:(Class)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)sStateMachines, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (VUIStateMachine)initWithName:(id)a3 initialState:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  VUIStateMachine *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *);
  void *v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __50__VUIStateMachine_initWithName_initialState_mode___block_invoke;
  v16 = &unk_1E9F2C0F8;
  objc_copyWeak(&v17, &location);
  v10 = (void *)MEMORY[0x1DF08E588](&v13);
  v11 = -[VUIStateMachine initWithName:initialState:mode:stateChangeHandler:](self, "initWithName:initialState:mode:stateChangeHandler:", v8, v9, a5, v10, v13, v14, v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __50__VUIStateMachine_initWithName_initialState_mode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;

  v17 = a6;
  v11 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, CFSTR("VUIStateMachineOldStateKey"), a4, CFSTR("VUIStateMachineNewStateKey"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("VUIStateMachineContextKey"));
  if (v11)
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("VUIStateMachineUserInfoKey"));
  v13 = (void *)MEMORY[0x1E0CB37C0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v13, "notificationWithName:object:userInfo:", CFSTR("VUIStateMachineStateChangedNotification"), WeakRetained, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotification:", v15);

}

- (void)postEvent:(id)a3
{
  -[VUIStateMachine postEvent:withContext:userInfo:](self, "postEvent:withContext:userInfo:", a3, 0, 0);
}

- (void)postEvent:(id)a3 withContext:(id)a4
{
  -[VUIStateMachine postEvent:withContext:userInfo:](self, "postEvent:withContext:userInfo:", a3, a4, 0);
}

- (void)purgeEventQueue
{
  NSMutableArray *obj;

  obj = self->_events;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)registerHandlerForEvents:(id)a3 onStates:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a4;
  v9 = a5;
  if (!-[VUIStateMachine shouldAcceptEvents](self, "shouldAcceptEvents"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v15 = v22;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v24;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v24 != v18)
                  objc_enumerationMutation(v15);
                -[VUIStateMachine registerHandlerForEvent:onState:withBlock:](self, "registerHandlerForEvent:onState:withBlock:", v14, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19++), v9);
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v17);
          }

          ++v13;
        }
        while (v13 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    v8 = v20;
  }

}

- (void)registerStateTransitionFromState:(id)a3 onEvent:(id)a4 toState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSString *name;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[VUIStateMachine shouldAcceptEvents](self, "shouldAcceptEvents"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__VUIStateMachine_registerStateTransitionFromState_onEvent_toState___block_invoke;
    v14[3] = &unk_1E9F2C120;
    v15 = v10;
    -[VUIStateMachine registerHandlerForEvent:onState:withBlock:](self, "registerHandlerForEvent:onState:withBlock:", v9, v8, v14);
    v12 = v15;
LABEL_6:

    goto LABEL_7;
  }
  -[VUIStateMachine logObject](self, "logObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[VUIStateMachine logObject](self, "logObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412290;
      v17 = name;
      _os_log_impl(&dword_1D951F000, v12, OS_LOG_TYPE_DEFAULT, "State machine [%@] can not register state transitions when it is accepting events", buf, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:

}

id __68__VUIStateMachine_registerStateTransitionFromState_onEvent_toState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)deregisterHandlers
{
  NSMutableDictionary *obj;

  obj = self->_handlers;
  objc_sync_enter(obj);
  -[VUIStateMachine setShouldAcceptEvents:](self, "setShouldAcceptEvents:", 0);
  -[VUIStateMachine purgeEventQueue](self, "purgeEventQueue");
  -[NSMutableDictionary removeAllObjects](self->_handlers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_defaultHandlers, "removeAllObjects");
  objc_sync_exit(obj);

}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setIgnorableEvents:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)callsStateChangeHandlerSynchronously
{
  return self->_callsStateChangeHandlerSynchronously;
}

- (void)setCallsStateChangeHandlerSynchronously:(BOOL)a3
{
  self->_callsStateChangeHandlerSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignorableEvents, 0);
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_blocksToExecuteAfterStateTransition, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_defaultHandlers, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong(&self->_stateChangeHandler, 0);
}

- (void)_dispatchEvent:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  VUIStateMachine *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__VUIStateMachine_Private___dispatchEvent___block_invoke;
  v7[3] = &unk_1E9F2C198;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __43__VUIStateMachine_Private___dispatchEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("VUIStateMachineEventKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("VUIStateMachineUserInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("VUIStateMachineContextKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_eventHandlerForEvent:", v2);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *, void *, void *))v5)[2](v5, *(_QWORD *)(a1 + 40), v2, v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __43__VUIStateMachine_Private___dispatchEvent___block_invoke_2;
  v16 = &unk_1E9F2C170;
  v17 = *(_QWORD *)(a1 + 40);
  v7 = v6;
  v18 = v7;
  v12 = v2;
  v19 = v12;
  v8 = v4;
  v20 = v8;
  v9 = v3;
  v21 = v9;
  dispatch_sync(MEMORY[0x1E0C80D38], &block);
  v10 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  objc_sync_enter(v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectAtIndex:", 0);
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
  objc_sync_exit(v10);

  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "_processNextEvent", v12, block, v14, v15, v16, v17, v18, v19, v20);

}

uint64_t __43__VUIStateMachine_Private___dispatchEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToState:withEvent:context:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

@end
