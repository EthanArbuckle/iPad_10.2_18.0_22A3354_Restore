@implementation SUManagerServerClient

- (SUManagerServerClient)initWithConnection:(id)a3
{
  id v5;
  SUManagerServerClient *v6;
  SUManagerServerClient *v7;
  void *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  NSString *identifier;
  int v12;
  id v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  BKSApplicationStateMonitor *appStateMonitor;
  uint64_t lastAppState;
  BKSApplicationStateMonitor *v19;
  char v20;
  BKSApplicationStateMonitor *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[4];
  id v33;
  SUManagerServerClient *v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SUManagerServerClient;
  v6 = -[SUManagerServerClient init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    -[NSXPCConnection _queue](v7->_connection, "_queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    connection = v7->_connection;
    if (connection)
      -[NSXPCConnection auditToken](connection, "auditToken");
    v10 = CPCopyBundleIdentifierFromAuditToken();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v10;

    v12 = DWORD1(v36);
    v7->_type = 0;
    v7->_pid = v12;
    v7->_isExclusiveClient = 0;
    v13 = objc_alloc(MEMORY[0x24BE08A08]);
    v14 = v7->_identifier;
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7->_identifier);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v16 = objc_msgSend(v13, "initWithBundleIDs:states:", v15, *MEMORY[0x24BE089E0]);
    appStateMonitor = v7->_appStateMonitor;
    v7->_appStateMonitor = (BKSApplicationStateMonitor *)v16;

    if (v14)
    lastAppState = -[BKSApplicationStateMonitor mostElevatedApplicationStateForPID:](v7->_appStateMonitor, "mostElevatedApplicationStateForPID:", v7->_pid);
    v7->_lastAppState = lastAppState;
    v7->_isApplication = (lastAppState & 0xFFFFFFEF) != 0;
    if ((lastAppState & 0xFFFFFFEF) == 0)
    {
      -[BKSApplicationStateMonitor invalidate](v7->_appStateMonitor, "invalidate", lastAppState);
      v19 = v7->_appStateMonitor;
      v7->_appStateMonitor = 0;

      if (!v7->_isApplication)
      {
        v20 = 1;
        goto LABEL_13;
      }
      lastAppState = v7->_lastAppState;
    }
    v20 = -[SUManagerServerClient _isStateMessagable:](v7, "_isStateMessagable:", lastAppState);
LABEL_13:
    v7->_isMessagable = v20;
    v7->_isForeground = 0;
    v21 = v7->_appStateMonitor;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __44__SUManagerServerClient_initWithConnection___block_invoke;
    v32[3] = &unk_24CE3CBD0;
    v33 = v8;
    v34 = v7;
    v22 = v8;
    -[BKSApplicationStateMonitor setHandler:](v21, "setHandler:", v32);

  }
  -[SUManagerServerClient identifier](v7, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("initiated client %@"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);

  return v7;
}

void __44__SUManagerServerClient_initWithConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__SUManagerServerClient_initWithConnection___block_invoke_2;
  v6[3] = &unk_24CE3B610;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __44__SUManagerServerClient_initWithConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationStateChanged:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[SUManagerServerClient invalidate](self, "invalidate");
  -[BKSApplicationStateMonitor invalidate](self->_appStateMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SUManagerServerClient;
  -[SUManagerServerClient dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSXPCConnection *connection;

  -[BKSApplicationStateMonitor setHandler:](self->_appStateMonitor, "setHandler:", 0);
  -[BKSApplicationStateMonitor invalidate](self->_appStateMonitor, "invalidate");
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (SUManagerClientInterface)proxy
{
  return (SUManagerClientInterface *)-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)setType:(int)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[SUManagerServerClient _evaluateForegroundness](self, "_evaluateForegroundness");
  }
}

- (void)wakeupIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD block[5];

  if (self->_isApplication && !self->_isMessagable)
  {
    SULogDebug(CFSTR("Trying to waking up client...: %@"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
    v9 = SBSProcessAssertionCreateForPID();
    if (v9)
    {
      v17 = v9;
      v18 = dispatch_time(0, 5000000000);
      dispatch_get_global_queue(0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__SUManagerServerClient_wakeupIfNecessary__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v17;
      dispatch_after(v18, v19, block);

    }
    else
    {
      SULogInfo(CFSTR("Unable to wakeup client: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)self);
    }
  }
}

void __42__SUManagerServerClient_wakeupIfNecessary__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SUManagerServerClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (BOOL)_isStateForeground:(unsigned int)a3
{
  return a3 == 8;
}

- (BOOL)_isStateMessagable:(unsigned int)a3
{
  unint64_t v3;

  HIDWORD(v3) = a3;
  LODWORD(v3) = a3 - 4;
  return ((v3 >> 2) < 8) & (0x8Bu >> (v3 >> 2));
}

- (void)_evaluateMessagability
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = -[SUManagerServerClient isMessagable](self, "isMessagable");
  v4 = -[SUManagerServerClient _isStateMessagable:](self, "_isStateMessagable:", self->_lastAppState);
  if (v3 != v4)
  {
    self->_isMessagable = v4;
    SULogDebug(CFSTR("Client [%@:<%p>] - messagability changed: isMessagable? %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)self->_identifier);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("SUClientMessagabilityChangedNotification"), self);

  }
}

- (void)_evaluateForegroundness
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int type;
  id v12;

  v3 = -[SUManagerServerClient isForeground](self, "isForeground");
  if (-[SUManagerServerClient _isStateForeground:](self, "_isStateForeground:", self->_lastAppState))
  {
    type = self->_type;
    if (v3 == (type == 1))
      return;
    self->_isForeground = type == 1;
  }
  else
  {
    if (!v3)
      return;
    self->_isForeground = 0;
  }
  SULogDebug(CFSTR("Client [%@:<%p>] - foregroundness changed: isForeground? %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)self->_identifier);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SUClientForegroundnessChangedNotification"), self);

}

- (void)_applicationStateChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v11;
    if (v6)
    {
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE089E8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUManagerServerClient identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasPrefix:", v7);

      if (v9)
      {
        objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE089F8]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self->_lastAppState = objc_msgSend(v10, "intValue");

        -[SUManagerServerClient _evaluateMessagability](self, "_evaluateMessagability");
        -[SUManagerServerClient _evaluateForegroundness](self, "_evaluateForegroundness");
      }

      v5 = v11;
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  SUStringFromClientType(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pid);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Yes");
  if (self->_isApplication)
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  if (self->_isMessagable)
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  if (self->_isForeground)
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  if (!self->_isExclusiveClient)
    v7 = CFSTR("No");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Client <%p>:\n            \ttype: %@\n            \tpid: %@\n            \tbundle ID: %@\n            \tapplication? %@\n            \tmessagable? %@\n            \tforeground? %@\n            \tisExclusiveClient? %@"), self, v4, v5, self->_identifier, v8, v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int)type
{
  return self->_type;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isApplication
{
  return self->_isApplication;
}

- (BOOL)isMessagable
{
  return self->_isMessagable;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isExclusiveClient
{
  return self->_isExclusiveClient;
}

- (void)setIsExclusiveClient:(BOOL)a3
{
  self->_isExclusiveClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end
