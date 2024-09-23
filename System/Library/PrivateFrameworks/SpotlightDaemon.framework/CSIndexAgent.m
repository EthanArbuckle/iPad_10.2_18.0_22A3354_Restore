@implementation CSIndexAgent

- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3
{
  id v4;
  CSIndexClientConnection *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v14;

  v4 = a3;
  v5 = -[CSIndexClientConnection initWithConfiguration:indexer:]([CSIndexClientConnection alloc], "initWithConfiguration:indexer:", v4, self->_indexer);
  -[CSIndexClientConnection configuration](v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_4:
    objc_msgSend(v4, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSIndexClientConnectionKey keyWithConnection:](CSIndexClientConnectionKey, "keyWithConnection:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_indexConnections, "setObject:forKeyedSubscript:", v5, v11);
    v12 = 1;
    goto LABEL_5;
  }
  -[CSIndexClientConnection configuration](v5, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "internal");

  if (v9)
    goto LABEL_4;
  logForCSLogCategoryIndex();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[CSIndexAgent addClientConnectionIfAllowedForConfiguration:].cold.1(v4);

  v12 = 0;
LABEL_5:

  return v12;
}

- (id)indexConnection:(id)a3
{
  void *v4;
  void *v5;

  +[CSIndexClientConnectionKey keyWithConnection:](CSIndexClientConnectionKey, "keyWithConnection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexConnections, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  id v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v8 = a4;
  v9 = (_xpc_connection_s *)a5;
  logForCSLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CSIndexAgent handleCommand:info:connection:].cold.1((uint64_t)a3, v9, v10);

  -[CSIndexAgent indexConnection:](self, "indexConnection:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "handleCommand:info:", a3, v8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  id v4;
  SDConnectionConfiguration *v5;

  v4 = a3;
  v5 = -[SDConnectionConfiguration initWithConnection:isPrivate:]([SDConnectionConfiguration alloc], "initWithConnection:isPrivate:", v4, 0);

  LOBYTE(self) = -[CSIndexAgent addClientConnectionIfAllowedForConfiguration:](self, "addClientConnectionIfAllowedForConfiguration:", v5);
  return (char)self;
}

+ (id)indexAgent:(BOOL)a3 serviceName:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v5 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__CSIndexAgent_indexAgent_serviceName___block_invoke;
  v10[3] = &unk_24D0EAB10;
  v12 = a3;
  v11 = v5;
  v6 = indexAgent_serviceName__onceToken;
  v7 = v5;
  if (v6 != -1)
    dispatch_once(&indexAgent_serviceName__onceToken, v10);
  v8 = (id)sIndexAgent;

  return v8;
}

void __39__CSIndexAgent_indexAgent_serviceName___block_invoke(uint64_t a1)
{
  int v2;
  CSIndexAgent *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = [CSIndexAgent alloc];
  if (*(_QWORD *)(a1 + 32))
    v4 = *(const __CFString **)(a1 + 32);
  else
    v4 = CFSTR("com.apple.spotlight.IndexAgent");
  if (v2)
    v5 = -[CSXPCConnection initWithServiceName:](v3, "initWithServiceName:", v4);
  else
    v5 = -[CSXPCConnection initMachServiceListenerWithName:](v3, "initMachServiceListenerWithName:", v4);
  v6 = (void *)sIndexAgent;
  sIndexAgent = v5;

  v7 = (id)objc_opt_new();
  objc_msgSend((id)sIndexAgent, "setIndexConnections:", v7);

}

+ (id)indexAgent
{
  return (id)sIndexAgent;
}

+ (id)indexDelegateAgent:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__CSIndexAgent_indexDelegateAgent___block_invoke;
  block[3] = &unk_24D0EA758;
  v9 = v3;
  v4 = indexDelegateAgent__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&indexDelegateAgent__onceToken, block);
  v6 = (id)sIndexDelegateAgent;

  return v6;
}

void __35__CSIndexAgent_indexDelegateAgent___block_invoke(uint64_t a1)
{
  CSIndexAgent *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = [CSIndexAgent alloc];
  if (*(_QWORD *)(a1 + 32))
    v3 = *(const __CFString **)(a1 + 32);
  else
    v3 = CFSTR("com.apple.spotlight.IndexDelegateAgent");
  v4 = -[CSXPCConnection initMachServiceListenerWithName:](v2, "initMachServiceListenerWithName:", v3);
  v5 = (void *)sIndexDelegateAgent;
  sIndexDelegateAgent = v4;

  objc_msgSend((id)sIndexDelegateAgent, "setNonLaunching:", 1);
  v6 = (id)objc_opt_new();
  objc_msgSend((id)sIndexDelegateAgent, "setIndexConnections:", v6);

}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  void *v5;

  +[CSIndexClientConnectionKey keyWithConnection:](CSIndexClientConnectionKey, "keyWithConnection:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_indexConnections, "setObject:forKeyedSubscript:", 0, v5);

  return 0;
}

- (MDIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_indexer, a3);
}

- (NSMutableDictionary)indexConnections
{
  return self->_indexConnections;
}

- (void)setIndexConnections:(id)a3
{
  objc_storeStrong((id *)&self->_indexConnections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexConnections, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
}

- (void)addClientConnectionIfAllowedForConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_213CF1000, v2, v3, "Could not resolve bundle id for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

- (void)handleCommand:(uint64_t)a1 info:(xpc_connection_t)connection connection:(NSObject *)a3 .cold.1(uint64_t a1, xpc_connection_t connection, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  pid_t pid;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 136315394;
  v5 = a1;
  v6 = 1024;
  pid = xpc_connection_get_pid(connection);
  _os_log_debug_impl(&dword_213CF1000, a3, OS_LOG_TYPE_DEBUG, "request %s from pid: %d", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_11();
}

@end
