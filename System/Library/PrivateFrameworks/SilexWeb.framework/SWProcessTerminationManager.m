@implementation SWProcessTerminationManager

- (SWProcessTerminationManager)initWithTerminationThrottler:(id)a3 errorReporter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SWProcessTerminationManager *v10;
  SWProcessTerminationManager *v11;
  SWProcessTerminationManager *v12;
  uint64_t v13;
  NSMutableArray *onRetryBlocks;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)SWProcessTerminationManager;
    v11 = -[SWProcessTerminationManager init](&v16, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_throttler, a3);
      objc_storeStrong((id *)&v12->_errorReporter, a4);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = objc_claimAutoreleasedReturnValue();
      onRetryBlocks = v12->_onRetryBlocks;
      v12->_onRetryBlocks = (NSMutableArray *)v13;

    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (void)webContentProcessTerminated
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SWProcessTerminationManager throttler](self, "throttler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "retryPolicy");

  if (v4)
  {
    if (v4 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("web_content"), 2, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[SWProcessTerminationManager errorReporter](self, "errorReporter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reportError:", v11);

    }
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SWProcessTerminationManager onRetryBlocks](self, "onRetryBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)onRetry:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SWProcessTerminationManager onRetryBlocks](self, "onRetryBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x219A22DDC](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (SWProcessTerminationPolicyDecider)throttler
{
  return self->_throttler;
}

- (SWErrorReporting)errorReporter
{
  return self->_errorReporter;
}

- (NSMutableArray)onRetryBlocks
{
  return self->_onRetryBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onRetryBlocks, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
}

@end
