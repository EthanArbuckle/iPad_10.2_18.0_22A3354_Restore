@implementation SVXServiceCommandTransaction

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SVXServiceCommandTransaction;
  -[SVXServiceCommandTransaction description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {command = %@, handlers = %@, taskTracker = %@}"), v4, self->_command, self->_handlers, self->_taskTracker);

  return v5;
}

- (void)dealloc
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SAAceCommand aceId](self->_command, "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Service command handling context deallocated for command %@."), v4);
  +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXServiceCommandTransaction _dispatchCompletionWithResult:](self, "_dispatchCompletionWithResult:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SVXServiceCommandTransaction;
  -[SVXServiceCommandTransaction dealloc](&v7, sel_dealloc);
}

- (SVXServiceCommandTransaction)initWithPerformer:(id)a3 command:(id)a4 handlers:(id)a5 taskTracker:(id)a6 dependencies:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SVXServiceCommandTransaction *v20;
  SVXServiceCommandTransaction *v21;
  uint64_t v22;
  SAAceCommand *command;
  uint64_t v24;
  NSArray *handlers;
  uint64_t v26;
  id completion;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  NSMutableSet *blockingTransactions;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  _QWORD *v40;
  SVXPerforming *performer;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id obj;
  _QWORD v50[4];
  SVXServiceCommandTransaction *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v48 = a7;
  v19 = a8;
  v60.receiver = self;
  v60.super_class = (Class)SVXServiceCommandTransaction;
  v20 = -[SVXServiceCommandTransaction init](&v60, sel_init);
  v21 = v20;
  if (v20)
  {
    v44 = v18;
    v47 = v15;
    objc_storeStrong((id *)&v20->_performer, a3);
    v21->_state = 0;
    v46 = v16;
    v22 = objc_msgSend(v16, "copy");
    command = v21->_command;
    v21->_command = (SAAceCommand *)v22;

    v24 = objc_msgSend(v17, "copy");
    handlers = v21->_handlers;
    v21->_handlers = (NSArray *)v24;

    objc_storeStrong((id *)&v21->_taskTracker, a6);
    v43 = v19;
    v26 = MEMORY[0x2199D950C](v19);
    completion = v21->_completion;
    v21->_completion = (id)v26;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v45 = v17;
    obj = v17;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v57 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v48, "count"));
            blockingTransactions = v21->_blockingTransactions;
            v21->_blockingTransactions = (NSMutableSet *)v33;

            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v35 = v48;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v53;
              do
              {
                for (j = 0; j != v37; ++j)
                {
                  if (*(_QWORD *)v53 != v38)
                    objc_enumerationMutation(v35);
                  v40 = *(_QWORD **)(*((_QWORD *)&v52 + 1) + 8 * j);
                  if (objc_msgSend(v32, "shouldDependOnCommand:", v40[6]))
                  {
                    -[NSMutableSet addObject:](v21->_blockingTransactions, "addObject:", v40);
                    objc_msgSend(v40, "addBlockedTransaction:", v21);
                  }
                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
              }
              while (v37);
            }

          }
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v29);
    }

    performer = v21->_performer;
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __103__SVXServiceCommandTransaction_initWithPerformer_command_handlers_taskTracker_dependencies_completion___block_invoke;
    v50[3] = &unk_24D24EFF0;
    v51 = v21;
    -[SVXPerforming performBlock:withOptions:](performer, "performBlock:withOptions:", v50, 0);

    v16 = v46;
    v15 = v47;
    v18 = v44;
    v17 = v45;
    v19 = v43;
  }

  return v21;
}

- (void)invalidate
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__SVXServiceCommandTransaction_invalidate__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v3);
}

- (void)addBlockedTransaction:(id)a3
{
  id v4;
  SVXPerforming *performer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SVXServiceCommandTransaction_addBlockedTransaction___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)removeBlockingTransaction:(id)a3
{
  id v4;
  SVXPerforming *performer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SVXServiceCommandTransaction_removeBlockingTransaction___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)handler:(id)a3 didPrepareSuccessfully:(BOOL)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  SVXPerforming *performer;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  performer = self->_performer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__SVXServiceCommandTransaction_handler_didPrepareSuccessfully_context_completion___block_invoke;
  v17[3] = &unk_24D24F040;
  v17[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  -[SVXPerforming performBlock:](performer, "performBlock:", v17);

}

- (void)handler:(id)a3 didHandleWithResult:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SVXPerforming *performer;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  performer = self->_performer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__SVXServiceCommandTransaction_handler_didHandleWithResult_completion___block_invoke;
  v15[3] = &unk_24D24F068;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v15);

}

- (void)_addBlockedTransaction:(id)a3
{
  id v4;
  id v5;
  NSHashTable *blockedTransactions;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v9 = v4;
  if ((self->_state & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    objc_msgSend(v4, "removeBlockingTransaction:", self);
  }
  else
  {
    blockedTransactions = self->_blockedTransactions;
    if (!blockedTransactions)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_blockedTransactions;
      self->_blockedTransactions = v7;

      v5 = v9;
      blockedTransactions = self->_blockedTransactions;
    }
    -[NSHashTable addObject:](blockedTransactions, "addObject:", v5);
  }

}

- (void)_removeBlockingTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  SVXServiceCommandTransaction *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[SVXServiceCommandTransaction _removeBlockingTransaction:]";
    v8 = 2112;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s %@ is no longer blocked by %@.", (uint8_t *)&v6, 0x20u);
  }
  -[NSMutableSet removeObject:](self->_blockingTransactions, "removeObject:", v4);
  -[SVXServiceCommandTransaction _handle](self, "_handle");

}

- (void)_prepare
{
  os_log_t *v3;
  NSObject *v4;
  int64_t state;
  NSObject *v6;
  NSObject *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SAAceCommand *command;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[5];
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  SVXServiceCommandTransaction *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SVXServiceCommandTransaction _prepare]";
    v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  state = self->_state;
  if (state)
  {
    v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SVXServiceCommandTransaction _prepare]";
      v29 = 2048;
      v30 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", buf, 0x16u);
    }
  }
  else
  {
    self->_state = 1;
    objc_initWeak((id *)buf, self);
    v7 = dispatch_group_create();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = self->_handlers;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
          dispatch_group_enter(v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            command = self->_command;
            v19[0] = MEMORY[0x24BDAC760];
            v19[1] = 3221225472;
            v19[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke;
            v19[3] = &unk_24D24F090;
            objc_copyWeak(&v21, (id *)buf);
            v19[4] = v12;
            v20 = v7;
            objc_msgSend(v12, "prepareToHandleCommand:completion:", command, v19);

            objc_destroyWeak(&v21);
          }
          else
          {
            v17[0] = MEMORY[0x24BDAC760];
            v17[1] = 3221225472;
            v17[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke_3;
            v17[3] = &unk_24D24EFF0;
            v18 = v7;
            -[SVXServiceCommandTransaction _handler:didPrepareSuccessfully:context:completion:](self, "_handler:didPrepareSuccessfully:context:completion:", v12, 1, 0, v17);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    dispatch_get_global_queue(21, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke_4;
    v15[3] = &unk_24D24F0E0;
    v15[4] = self;
    objc_copyWeak(&v16, (id *)buf);
    dispatch_group_notify(v7, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handler:(id)a3 didPrepareSuccessfully:(BOOL)a4 context:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  os_log_t *v13;
  NSObject *v14;
  int64_t state;
  void *v16;
  NSMutableDictionary *preparedResultsByHandlerIdentifier;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *preparedContextsByHandlerIdentifier;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  SVXServiceCommandTransaction *v29;
  uint64_t v30;

  v8 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  v13 = (os_log_t *)MEMORY[0x24BE08FB0];
  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v26 = 136315394;
    v27 = "-[SVXServiceCommandTransaction _handler:didPrepareSuccessfully:context:completion:]";
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v26, 0x16u);
  }
  state = self->_state;
  if (state == 1)
  {
    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    preparedResultsByHandlerIdentifier = self->_preparedResultsByHandlerIdentifier;
    if (!preparedResultsByHandlerIdentifier)
    {
      v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v19 = self->_preparedResultsByHandlerIdentifier;
      self->_preparedResultsByHandlerIdentifier = v18;

      preparedResultsByHandlerIdentifier = self->_preparedResultsByHandlerIdentifier;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](preparedResultsByHandlerIdentifier, "setObject:forKey:", v20, v16);

    if (v11)
    {
      preparedContextsByHandlerIdentifier = self->_preparedContextsByHandlerIdentifier;
      if (!preparedContextsByHandlerIdentifier)
      {
        v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v23 = self->_preparedContextsByHandlerIdentifier;
        self->_preparedContextsByHandlerIdentifier = v22;

        preparedContextsByHandlerIdentifier = self->_preparedContextsByHandlerIdentifier;
      }
      v24 = (void *)objc_msgSend(v11, "copy");
      -[NSMutableDictionary setObject:forKey:](preparedContextsByHandlerIdentifier, "setObject:forKey:", v24, v16);

    }
    if (v12)
      v12[2](v12);

  }
  else
  {
    v25 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v26 = 136315394;
      v27 = "-[SVXServiceCommandTransaction _handler:didPrepareSuccessfully:context:completion:]";
      v28 = 2048;
      v29 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_214934000, v25, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v26, 0x16u);
    }
    if (v12)
      v12[2](v12);
  }

}

- (void)_didPrepareAll
{
  os_log_t *v3;
  NSObject *v4;
  int64_t state;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SVXServiceCommandTransaction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SVXServiceCommandTransaction _didPrepareAll]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  state = self->_state;
  if (state == 1)
  {
    self->_state = 2;
    -[SVXServiceCommandTransaction _handle](self, "_handle");
  }
  else
  {
    v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[SVXServiceCommandTransaction _didPrepareAll]";
      v9 = 2048;
      v10 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_handle
{
  os_log_t *v3;
  NSObject *v4;
  int64_t state;
  os_log_t v6;
  NSMutableSet *blockingTransactions;
  const char *v8;
  NSObject *v9;
  os_log_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  SAAceCommand *command;
  void *v19;
  SVXTaskTracking *taskTracker;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSArray *obj;
  uint64_t v27;
  _QWORD block[5];
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD v32[5];
  NSObject *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  SVXServiceCommandTransaction *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[SVXServiceCommandTransaction _handle]";
    v42 = 2112;
    v43 = self;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  state = self->_state;
  if (state != 2)
  {
    v10 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      return;
    *(_DWORD *)buf = 136315394;
    v41 = "-[SVXServiceCommandTransaction _handle]";
    v42 = 2048;
    v43 = (SVXServiceCommandTransaction *)state;
    v8 = "%s Ignored because state is %ld.";
    v9 = v10;
    goto LABEL_9;
  }
  if (-[NSMutableSet count](self->_blockingTransactions, "count"))
  {
    v6 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      return;
    blockingTransactions = self->_blockingTransactions;
    *(_DWORD *)buf = 136315394;
    v41 = "-[SVXServiceCommandTransaction _handle]";
    v42 = 2112;
    v43 = (SVXServiceCommandTransaction *)blockingTransactions;
    v8 = "%s Ignored because blocked by %@.";
    v9 = v6;
LABEL_9:
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, v8, buf, 0x16u);
    return;
  }
  self->_state = 3;
  objc_initWeak((id *)buf, self);
  v11 = dispatch_group_create();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_handlers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        dispatch_group_enter(v11);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_preparedResultsByHandlerIdentifier, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        if (v17)
        {
          command = self->_command;
          -[NSMutableDictionary objectForKey:](self->_preparedContextsByHandlerIdentifier, "objectForKey:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          taskTracker = self->_taskTracker;
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __39__SVXServiceCommandTransaction__handle__block_invoke;
          v32[3] = &unk_24D24F108;
          objc_copyWeak(&v34, (id *)buf);
          v32[4] = v14;
          v33 = v11;
          objc_msgSend(v14, "handleCommand:withContext:taskTracker:completion:", command, v19, taskTracker, v32);

          objc_destroyWeak(&v34);
        }
        else
        {
          v21 = objc_alloc(MEMORY[0x24BDD17C8]);
          -[SAAceCommand aceId](self->_command, "aceId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("Failed to prepare command %@."), v22);
          +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_3;
          v30[3] = &unk_24D24EFF0;
          v31 = v11;
          -[SVXServiceCommandTransaction _handler:didHandleWithResult:completion:](self, "_handler:didHandleWithResult:completion:", v14, v24, v30);

        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }

  dispatch_get_global_queue(21, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_4;
  block[3] = &unk_24D24F0E0;
  block[4] = self;
  objc_copyWeak(&v29, (id *)buf);
  dispatch_group_notify(v11, v25, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

- (void)_handler:(id)a3 didHandleWithResult:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  os_log_t *v11;
  NSObject *v12;
  int64_t state;
  NSMutableDictionary *handledResultsByHandlerIdentifier;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  SVXServiceCommandTransaction *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (os_log_t *)MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v19 = 136315394;
    v20 = "-[SVXServiceCommandTransaction _handler:didHandleWithResult:completion:]";
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v19, 0x16u);
  }
  state = self->_state;
  if (state == 3)
  {
    if (v9)
    {
      handledResultsByHandlerIdentifier = self->_handledResultsByHandlerIdentifier;
      if (!handledResultsByHandlerIdentifier)
      {
        v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v16 = self->_handledResultsByHandlerIdentifier;
        self->_handledResultsByHandlerIdentifier = v15;

        handledResultsByHandlerIdentifier = self->_handledResultsByHandlerIdentifier;
      }
      objc_msgSend(v8, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](handledResultsByHandlerIdentifier, "setObject:forKey:", v9, v17);

    }
  }
  else
  {
    v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v19 = 136315394;
      v20 = "-[SVXServiceCommandTransaction _handler:didHandleWithResult:completion:]";
      v21 = 2048;
      v22 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v19, 0x16u);
    }
  }
  if (v10)
    v10[2](v10);

}

- (void)_didHandleAll
{
  os_log_t *v3;
  NSObject *v4;
  int64_t state;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSHashTable *blockedTransactions;
  SVXTaskTracking *taskTracker;
  int v13;
  const char *v14;
  __int16 v15;
  SVXServiceCommandTransaction *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[SVXServiceCommandTransaction _didHandleAll]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }
  state = self->_state;
  if (state == 3)
  {
    self->_state = 4;
    v6 = -[NSMutableDictionary count](self->_handledResultsByHandlerIdentifier, "count");
    if (v6 == 1)
    {
      -[NSMutableDictionary allValues](self->_handledResultsByHandlerIdentifier, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v6)
      {
        +[SVXServiceCommandResult resultIgnored](SVXServiceCommandResult, "resultIgnored");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        -[SVXServiceCommandTransaction _dispatchCompletionWithResult:](self, "_dispatchCompletionWithResult:", v7);
        -[SVXServiceCommandTransaction _unblockDependentTransactions](self, "_unblockDependentTransactions");
        blockedTransactions = self->_blockedTransactions;
        self->_blockedTransactions = 0;

        taskTracker = self->_taskTracker;
        self->_taskTracker = 0;

        return;
      }
      -[NSMutableDictionary allValues](self->_handledResultsByHandlerIdentifier, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SVXServiceCommandResult resultWithResults:](SVXServiceCommandResult, "resultWithResults:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v10;

    goto LABEL_12;
  }
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[SVXServiceCommandTransaction _didHandleAll]";
    v15 = 2048;
    v16 = (SVXServiceCommandTransaction *)state;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v13, 0x16u);
  }
}

- (void)_invalidate
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSHashTable *blockedTransactions;
  NSMutableSet *blockingTransactions;
  NSMutableDictionary *preparedContextsByHandlerIdentifier;
  NSMutableDictionary *preparedResultsByHandlerIdentifier;
  SVXTaskTracking *taskTracker;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SVXServiceCommandTransaction *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SVXServiceCommandTransaction _invalidate]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  self->_state = 5;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SAAceCommand aceId](self->_command, "aceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Service command handling context invalidated for command %@."), v5);
  +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXServiceCommandTransaction _dispatchCompletionWithResult:](self, "_dispatchCompletionWithResult:", v7);

  -[SVXServiceCommandTransaction _unblockDependentTransactions](self, "_unblockDependentTransactions");
  blockedTransactions = self->_blockedTransactions;
  self->_blockedTransactions = 0;

  blockingTransactions = self->_blockingTransactions;
  self->_blockingTransactions = 0;

  preparedContextsByHandlerIdentifier = self->_preparedContextsByHandlerIdentifier;
  self->_preparedContextsByHandlerIdentifier = 0;

  preparedResultsByHandlerIdentifier = self->_preparedResultsByHandlerIdentifier;
  self->_preparedResultsByHandlerIdentifier = 0;

  taskTracker = self->_taskTracker;
  self->_taskTracker = 0;

}

- (void)_unblockDependentTransactions
{
  void *v3;
  SVXPerforming *performer;
  id v5;
  _QWORD v6[4];
  id v7;
  SVXServiceCommandTransaction *v8;

  if (-[NSHashTable count](self->_blockedTransactions, "count"))
  {
    -[NSHashTable setRepresentation](self->_blockedTransactions, "setRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    performer = self->_performer;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__SVXServiceCommandTransaction__unblockDependentTransactions__block_invoke;
    v6[3] = &unk_24D24F018;
    v7 = v3;
    v8 = self;
    v5 = v3;
    -[SVXPerforming performBlock:withOptions:](performer, "performBlock:withOptions:", v6, 0);

  }
}

- (void)_dispatchCompletionWithResult:(id)a3
{
  void (**completion)(id, id);
  id v5;

  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    v5 = self->_completion;
    self->_completion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedTransactions, 0);
  objc_storeStrong((id *)&self->_blockingTransactions, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_handledResultsByHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_preparedContextsByHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_preparedResultsByHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

void __61__SVXServiceCommandTransaction__unblockDependentTransactions__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeBlockingTransaction:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __39__SVXServiceCommandTransaction__handle__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_2;
  v7[3] = &unk_24D24EFF0;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "handler:didHandleWithResult:completion:", v6, v4, v7);

}

void __39__SVXServiceCommandTransaction__handle__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __39__SVXServiceCommandTransaction__handle__block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_5;
  v2[3] = &unk_24D24F0B8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_msgSend(v1, "performBlock:", v2);
  objc_destroyWeak(&v3);
}

void __39__SVXServiceCommandTransaction__handle__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didHandleAll");

}

void __39__SVXServiceCommandTransaction__handle__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke_2;
  v9[3] = &unk_24D24EFF0;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "handler:didPrepareSuccessfully:context:completion:", v8, a2, v6, v9);

}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke_5;
  v2[3] = &unk_24D24F0B8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_msgSend(v1, "performBlock:", v2);
  objc_destroyWeak(&v3);
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didPrepareAll");

}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__SVXServiceCommandTransaction_handler_didHandleWithResult_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handler:didHandleWithResult:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __82__SVXServiceCommandTransaction_handler_didPrepareSuccessfully_context_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handler:didPrepareSuccessfully:context:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __58__SVXServiceCommandTransaction_removeBlockingTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeBlockingTransaction:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__SVXServiceCommandTransaction_addBlockedTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addBlockedTransaction:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__SVXServiceCommandTransaction_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __103__SVXServiceCommandTransaction_initWithPerformer_command_handlers_taskTracker_dependencies_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepare");
}

@end
