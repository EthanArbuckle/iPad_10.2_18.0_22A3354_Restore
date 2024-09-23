@implementation SiriCoreNetworkActivity

- (SiriCoreNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4
{
  id v6;
  SiriCoreNetworkActivity *v7;
  uint64_t v8;
  NSMutableSet *v9;
  NSMutableSet *connections;
  OS_nw_activity *activity;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriCoreNetworkActivity;
  v7 = -[SiriCoreNetworkActivity init](&v13, sel_init);
  if (v7)
  {
    if (a3)
    {
      v8 = nw_activity_create();
      if (v6)
      {
        nw_activity_set_parent_activity();
        v7->_parentLabel = nw_activity_get_label();
      }
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      connections = v7->_connections;
      v7->_connections = v9;

      activity = v7->_activity;
      v7->_activity = (OS_nw_activity *)v8;

    }
    v7->_state = 0;
    v7->_hasStarted = 0;
  }

  return v7;
}

- (void)activate
{
  if (self->_state <= 0)
  {
    -[SiriCoreNetworkActivity _networkActivityState:](self, "_networkActivityState:", 1);
    if (self->_state == 1)
      nw_activity_activate();
  }
}

- (void)addConnection:(id)a3
{
  int64_t state;
  id v5;

  v5 = a3;
  state = self->_state;
  if (state <= 1)
  {
    -[SiriCoreNetworkActivity _networkActivityState:](self, "_networkActivityState:", 2);
    state = self->_state;
  }
  if (state == 2)
  {
    nw_connection_start_activity();
    -[NSMutableSet addObject:](self->_connections, "addObject:", v5);
  }

}

- (void)removeConnection:(id)a3
{
  id v4;

  if (self->_state == 2)
  {
    v4 = a3;
    nw_connection_end_activity();
    -[NSMutableSet removeObject:](self->_connections, "removeObject:", v4);

  }
}

- (void)stopWithCompletionReason:(int64_t)a3 andError:(id)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SiriCoreNetworkActivity _networkActivityState:](self, "_networkActivityState:", 3);
  if (-[NSMutableSet count](self->_connections, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_connections;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          nw_connection_end_activity();
        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v9);
    }

  }
  if (v6)
  {
    v12 = objc_msgSend(v6, "code");
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDD1398]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v16 = objc_msgSend(v15, "code");
      else
        v16 = -1;

    }
    else
    {
      v16 = -1;
    }
    v17 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[SiriCoreNetworkActivity stopWithCompletionReason:andError:]";
      v24 = 1024;
      v25 = v12;
      v26 = 1024;
      v27 = v16;
      _os_log_impl(&dword_211AB2000, v17, OS_LOG_TYPE_INFO, "%s Reporting to nw_activity that SiriCoreNetworkActivity failed with error code %d and underlying error code %d", buf, 0x18u);
    }
    -[SiriCoreNetworkActivity _completionReasonToNWActivityCompletionReason:](self, "_completionReasonToNWActivityCompletionReason:", a3, v18);
  }
  else
  {
    -[SiriCoreNetworkActivity _completionReasonToNWActivityCompletionReason:](self, "_completionReasonToNWActivityCompletionReason:", a3);
  }
  nw_activity_complete_with_reason_and_underlying_error();

}

- (id)nwActivity
{
  return self->_activity;
}

- (id)nwActivityToken
{
  int is_null;
  void *v3;
  unsigned __int8 uu[8];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)uu = 0;
  v6 = 0;
  nw_activity_get_token();
  is_null = uuid_is_null(uu);
  v3 = 0;
  if (!is_null)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uu);
  return v3;
}

- (int64_t)parentLabel
{
  return self->_parentLabel;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (void)_networkActivityState:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  switch(self->_state)
  {
    case 0:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
        v3 = 0;
      break;
    case 1:
      if (a3 == 3 || !a3)
      {
        -[SiriCoreNetworkActivity _networkActivityAbort](self, "_networkActivityAbort");
        goto LABEL_15;
      }
      break;
    case 2:
      if ((unint64_t)a3 >= 2)
      {
        if (a3 == 2)
        {
          -[SiriCoreNetworkActivity _networkActivityRestart](self, "_networkActivityRestart");
LABEL_15:
          v3 = 0;
        }
      }
      else
      {
        -[SiriCoreNetworkActivity _networkActivityAbort](self, "_networkActivityAbort");
      }
      break;
    case 3:
      if ((unint64_t)a3 < 2)
        v3 = 0;
      break;
    default:
      break;
  }
  self->_state = v3;
}

- (int)_completionReasonToNWActivityCompletionReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return dword_211AE9E38[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
