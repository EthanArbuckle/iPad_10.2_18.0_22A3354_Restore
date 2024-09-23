@implementation CSSearchClientConnection

- (void)setQueryTask:(id)a3 forQueryID:(int64_t)a4
{
  void *v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_queryTasks;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queryTasks, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

- (id)queryTask:(int64_t)a3
{
  void *v4;
  NSMutableDictionary *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_queryTasks;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queryTasks, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)searchInternal
{
  return -[SDConnectionConfiguration searchInternal](self->_configuration, "searchInternal");
}

- (id)bundleID
{
  return -[SDConnectionConfiguration bundleID](self->_configuration, "bundleID");
}

- (SDConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (id)allowedBundleIDs
{
  return -[SDConnectionConfiguration allowedBundleIDs](self->_configuration, "allowedBundleIDs");
}

- (CSSearchClientConnection)initWithConnectionConfiguration:(id)a3
{
  id v5;
  CSSearchClientConnection *v6;
  CSSearchClientConnection *v7;
  uint64_t v8;
  NSMutableDictionary *queryTasks;
  NSObject *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSSearchClientConnection;
  v6 = -[CSSearchClientConnection init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_opt_new();
    queryTasks = v7->_queryTasks;
    v7->_queryTasks = (NSMutableDictionary *)v8;

    objc_msgSend(v5, "bundleID");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_6:

      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "searchInternal") & 1) == 0)
    {
      logForCSLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CSSearchClientConnection initWithConnectionConfiguration:].cold.1(v5);
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (void)_didReceiveResultsBatchCompletion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Resuming results %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_willSendResultsBatch:(id)a3 qid:(int64_t)a4
{
  id v6;
  unsigned int *p_outBatchCount;
  int v8;
  NSObject *v9;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *pausedTasks;
  void *v12;
  NSObject *v13;

  v6 = a3;
  p_outBatchCount = &self->_outBatchCount;
  do
    v8 = __ldaxr(p_outBatchCount);
  while (__stlxr(v8 + 1, p_outBatchCount));
  if (v8 == 6)
  {
    logForCSLogCategoryQuery();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CSSearchClientConnection _willSendResultsBatch:qid:].cold.2();

    if (!self->_pausedTasks)
    {
      v10 = (NSMutableOrderedSet *)objc_opt_new();
      pausedTasks = self->_pausedTasks;
      self->_pausedTasks = v10;

    }
  }
  if (self->_pausedTasks)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableOrderedSet containsObject:](self->_pausedTasks, "containsObject:", v12) & 1) == 0)
    {
      -[NSMutableOrderedSet addObject:](self->_pausedTasks, "addObject:", v12);
      logForCSLogCategoryQuery();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CSSearchClientConnection _willSendResultsBatch:qid:].cold.1(v8, a4, v13);

      objc_msgSend(v6, "pauseResults");
    }

  }
}

- (unsigned)outBatchCount
{
  return atomic_load(&self->_outBatchCount);
}

- (CSSearchClientConnection)initWithConnection:(id)a3
{
  id v4;
  SDConnectionConfiguration *v5;
  SDConnectionConfiguration *v6;
  CSSearchClientConnection *v7;

  v4 = a3;
  v5 = [SDConnectionConfiguration alloc];
  v6 = -[SDConnectionConfiguration initWithConnection:isPrivate:](v5, "initWithConnection:isPrivate:", v4, sSearchAgentIsPrivate);

  v7 = -[CSSearchClientConnection initWithConnectionConfiguration:](self, "initWithConnectionConfiguration:", v6);
  return v7;
}

- (void)cancelQueryTask:(int64_t)a3
{
  -[CSSearchClientConnection cancelQueryTask:wasCanceledByClient:](self, "cancelQueryTask:wasCanceledByClient:", a3, 1);
}

- (void)cancelQueryTask:(int64_t)a3 wasCanceledByClient:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  NSMutableDictionary *v7;
  id v8;

  if (a3)
  {
    v4 = a4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_queryTasks;
    objc_sync_enter(v7);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_queryTasks, "objectForKeyedSubscript:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_queryTasks, "removeObjectForKey:", v6);
    objc_sync_exit(v7);

    objc_msgSend(v8, "setWasCanceledByClient:", v4);
    objc_msgSend(v8, "cancel");

  }
}

- (void)pollResultsForQueryTask:(int64_t)a3
{
  void *v4;
  NSMutableDictionary *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_queryTasks;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_queryTasks, "objectForKeyedSubscript:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

    objc_msgSend(v6, "poll");
  }
}

- (void)cancelQueryTasks
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = self->_queryTasks;
  objc_sync_enter(v3);
  if (-[NSMutableDictionary count](self->_queryTasks, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_queryTasks;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_queryTasks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "cancel");

          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    -[NSMutableDictionary removeAllObjects](self->_queryTasks, "removeAllObjects");
  }
  objc_sync_exit(v3);

}

- (void)dealloc
{
  objc_super v3;

  -[CSSearchClientConnection cancelQueryTasks](self, "cancelQueryTasks");
  v3.receiver = self;
  v3.super_class = (Class)CSSearchClientConnection;
  -[CSSearchClientConnection dealloc](&v3, sel_dealloc);
}

- (id)protectionClass
{
  return -[SDConnectionConfiguration protectionClass](self->_configuration, "protectionClass");
}

- (NSMutableDictionary)queryTasks
{
  return self->_queryTasks;
}

- (void)setQueryTasks:(id)a3
{
  objc_storeStrong((id *)&self->_queryTasks, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSMutableOrderedSet)pausedTasks
{
  return self->_pausedTasks;
}

- (void)setPausedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_pausedTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedTasks, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queryTasks, 0);
}

- (void)initWithConnectionConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_213CF1000, v2, v3, "Could not resolve bundle from %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_willSendResultsBatch:(NSObject *)a3 qid:.cold.1(int a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_3(&dword_213CF1000, a3, (uint64_t)a3, "Paused results qid: %ld count: %ld", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_willSendResultsBatch:qid:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Pausing results %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
