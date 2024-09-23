@implementation PDCApplicationEnvironmentMonitoringHandle

- (PDCApplicationEnvironmentMonitoringHandle)initWithWorkspace:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  PDCApplicationEnvironmentMonitoringHandle *v12;
  PDCApplicationEnvironmentMonitoringHandle *v13;
  PDCApplicationEnvironmentMonitoringHandle *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PDCApplicationEnvironmentMonitoringHandle;
  v12 = -[PDCApplicationEnvironmentMonitoringHandle init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workspace, a3);
    -[PDCApplicationEnvironmentMonitoringHandle setDelegate:](v13, "setDelegate:", v10);
    objc_storeStrong((id *)&v13->_queue, a5);
    v14 = v13;
  }

  return v13;
}

- (void)invalidate
{
  -[PDCApplicationEnvironmentMonitoringHandle setDelegate:](self, "setDelegate:", 0);
  -[LSApplicationWorkspace removeObserver:](self->_workspace, "removeObserver:", self);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  PDCApplicationEnvironmentMonitoringHandle *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PDCApplicationEnvironmentMonitoringHandle delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v17 = v4;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v12;
              objc_msgSend(v13, "bundleIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v14);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v9);
      }

      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__PDCApplicationEnvironmentMonitoringHandle_applicationsDidUninstall___block_invoke;
      block[3] = &unk_2515A2C28;
      v19 = v6;
      v20 = self;
      v21 = v5;
      v16 = v6;
      dispatch_async(queue, block);

      v4 = v17;
    }
  }
  else
  {
    -[PDCApplicationEnvironmentMonitoringHandle invalidate](self, "invalidate");
  }

}

void __70__PDCApplicationEnvironmentMonitoringHandle_applicationsDidUninstall___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
      objc_msgSend(a1[5], "delegate", (_QWORD)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      objc_msgSend(a1[6], "applicationDidUninstall:", v7);
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (PDCApplicationEnvironmentMonitoring)delegate
{
  return (PDCApplicationEnvironmentMonitoring *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

@end
