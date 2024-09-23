@implementation WPDState

- (WPDState)initWithQueue:(id)a3
{
  id v4;
  WPDState *v5;
  WPDState *v6;
  uint64_t v7;
  NSMutableSet *cbManagers;
  uint64_t v9;
  NSMutableDictionary *cbStates;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WPDState;
  v5 = -[WPDState init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cbQueue, v4);
    v6->_state = 0;
    *(_WORD *)&v6->_restricted = 0;
    v7 = objc_opt_new();
    cbManagers = v6->_cbManagers;
    v6->_cbManagers = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    cbStates = v6->_cbStates;
    v6->_cbStates = (NSMutableDictionary *)v9;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WPDState setState:](self, "setState:", 0);
  -[WPDState setRestricted:](self, "setRestricted:", 0);
  -[WPDState cbStates](self, "cbStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[WPDState cbManagers](self, "cbManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5.receiver = self;
  v5.super_class = (Class)WPDState;
  -[WPDState dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  const char *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[WPDState state](self, "state");
  v5 = -[WPDState restricted](self, "restricted");
  v6 = "no";
  if (v5)
    v6 = "yes";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("state: %d, restricted: %s"), v4, v6);
}

- (void)registerManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_0);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDState registerManager:].cold.1((uint64_t)v4, v5);
  -[WPDState cbManagers](self, "cbManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDState cbStates](self, "cbStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

- (void)updateWithManager:(id)a3 Completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  unsigned __int8 v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  unsigned __int8 v21;
  int64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[WPDState initialUpdate](self, "initialUpdate"))
  {
    -[WPDState cbManagers](self, "cbManagers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if ((v9 & 1) != 0)
    {
      v10 = objc_msgSend(v6, "state");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDState cbStates](self, "cbStates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      v14 = +[WPDState getWPStateFromCBManagerState:](WPDState, "getWPStateFromCBManagerState:", v10);
      v22 = v14;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(&unk_24D7D7E18, "isEqualToNumber:", v15);

      v21 = v16;
      if (v14 > -[WPDState state](self, "state") || (v16 & 1) == 0)
      {
        -[WPDState coalesceState:Restricted:UpdateCache:](self, "coalesceState:Restricted:UpdateCache:", &v22, &v21, 0);
        v14 = v22;
      }
      if (v14 != -[WPDState state](self, "state") || (v17 = v21, v17 != -[WPDState restricted](self, "restricted")))
      {
        -[WPDState setState:](self, "setState:", v22);
        -[WPDState setRestricted:](self, "setRestricted:", v21);
        if (v7)
          v7[2](v7);
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_91);
        v18 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v6;
          v25 = 1024;
          v26 = v22;
          v27 = 1024;
          v28 = v21;
          _os_log_debug_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEBUG, "WPDState updated with manager %@ to state: %d restricted: %d", buf, 0x18u);
        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_87);
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDState updateWithManager:Completion:].cold.1((uint64_t)v6, v20);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_85);
    v19 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDState updateWithManager:Completion:].cold.2(v19);
  }

}

- (void)updateWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  int v6;
  NSObject *v7;
  unsigned __int8 v8;
  uint64_t v9;

  v4 = (void (**)(_QWORD))a3;
  v9 = 0;
  v8 = 0;
  -[WPDState setInitialUpdate:](self, "setInitialUpdate:", 1);
  -[WPDState coalesceState:Restricted:UpdateCache:](self, "coalesceState:Restricted:UpdateCache:", &v9, &v8, 1);
  v5 = v9;
  if (v5 != -[WPDState state](self, "state") || (v6 = v8, v6 != -[WPDState restricted](self, "restricted")))
  {
    -[WPDState setState:](self, "setState:", v9);
    -[WPDState setRestricted:](self, "setRestricted:", v8);
    if (v4)
      v4[2](v4);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_92);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDState updateWithCompletion:].cold.1(&v9, &v8, v7);
  }

}

- (void)coalesceState:(int64_t *)a3 Restricted:(BOOL *)a4 UpdateCache:(BOOL)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v21 = a5;
  if (a5)
  {
    -[WPDState cbManagers](self, "cbManagers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __49__WPDState_coalesceState_Restricted_UpdateCache___block_invoke;
    v26[3] = &unk_24D7C18F0;
    v26[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v26);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WPDState cbStates](self, "cbStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = 3;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v13)
        objc_enumerationMutation(v10);
      v16 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "integerValue");
      v17 = +[WPDState getWPStateFromCBManagerState:](WPDState, "getWPStateFromCBManagerState:", v16);
      if (v17 < v14)
        v14 = v17;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(&unk_24D7D7E18, "isEqualToNumber:", v18);

      if (!v14 || (v19 & 1) != 0)
        break;
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
        if (v12)
          goto LABEL_5;
        v19 = 0;
        break;
      }
    }
  }
  else
  {
    v19 = 0;
    v14 = 3;
  }

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_94);
  v20 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v28 = v14;
    v29 = 1024;
    v30 = v19;
    v31 = 1024;
    v32 = v21;
    _os_log_debug_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEBUG, "WPDState coalesce state:%d restricted:%d cache updated:%d ", buf, 0x14u);
  }
  *a3 = v14;
  *a4 = v19;
}

void __49__WPDState_coalesceState_Restricted_UpdateCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "state"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cbStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v4, "hash");

  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

}

+ (int64_t)getWPStateFromCBManagerState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA)
    return 0;
  else
    return qword_21762ED38[a3];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (OS_dispatch_queue)cbQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_cbQueue);
}

- (void)setCbQueue:(id)a3
{
  objc_storeWeak((id *)&self->_cbQueue, a3);
}

- (id)notification
{
  return objc_loadWeakRetained(&self->_notification);
}

- (void)setNotification:(id)a3
{
  objc_storeWeak(&self->_notification, a3);
}

- (NSMutableSet)cbManagers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCbManagers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)cbStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCbStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)initialUpdate
{
  return self->_initialUpdate;
}

- (void)setInitialUpdate:(BOOL)a3
{
  self->_initialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbStates, 0);
  objc_storeStrong((id *)&self->_cbManagers, 0);
  objc_destroyWeak(&self->_notification);
  objc_destroyWeak((id *)&self->_cbQueue);
}

- (void)registerManager:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2175D1000, a2, OS_LOG_TYPE_DEBUG, "WPDState registered manager %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)updateWithManager:(uint64_t)a1 Completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2175D1000, a2, OS_LOG_TYPE_ERROR, "WPDState update with manager - unexpected CBManager %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)updateWithManager:(os_log_t)log Completion:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2175D1000, log, OS_LOG_TYPE_DEBUG, "WPDState update with manager - initialUpdate:NO, ignore", v1, 2u);
}

- (void)updateWithCompletion:(os_log_t)log .cold.1(uint64_t *a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_debug_impl(&dword_2175D1000, log, OS_LOG_TYPE_DEBUG, "WPDState updated to state:%d restricted:%d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_0();
}

@end
