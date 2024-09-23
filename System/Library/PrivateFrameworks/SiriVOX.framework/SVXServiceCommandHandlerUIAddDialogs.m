@implementation SVXServiceCommandHandlerUIAddDialogs

- (SVXServiceCommandHandlerUIAddDialogs)initWithHandlers:(id)a3 dialogTransformer:(id)a4
{
  id v6;
  id v7;
  SVXServiceCommandHandlerUIAddDialogs *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *handlersByCommandType;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SVXServiceCommandHandlerUIAddDialogs;
  v8 = -[SVXServiceCommandHandlerUIAddDialogs init](&v31, sel_init);
  if (v8)
  {
    v26 = v7;
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    v10 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v11);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v19);
          v21 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v20, v22);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v17);
    }

    v23 = objc_msgSend(v14, "copy");
    handlersByCommandType = v8->_handlersByCommandType;
    v8->_handlersByCommandType = (NSDictionary *)v23;

    objc_storeStrong((id *)&v8->_dialogTransformer, a4);
    v7 = v26;
  }

  return v8;
}

- (BOOL)shouldDependOnCommand:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)isCommandUUFR:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSDictionary *handlersByCommandType;
  objc_class *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddDialogs.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIAddDialogs class]]"));

  }
  -[SVXDialogTransformer transformAddDialogs:](self->_dialogTransformer, "transformAddDialogs:", v5);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        handlersByCommandType = self->_handlersByCommandType;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](handlersByCommandType, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v15, "isCommandUUFR:", v11) & 1) != 0)
        {

          v16 = 1;
          goto LABEL_15;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (void)prepareToHandleCommand:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSDictionary *handlersByCommandType;
  objc_class *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _AddDialogsContextPair *v22;
  NSDictionary *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *group;
  id obj;
  void *v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  NSDictionary *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v28 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddDialogs.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIAddDialogs class]]"));

  }
  v29 = v7;
  -[SVXDialogTransformer transformAddDialogs:](self->_dialogTransformer, "transformAddDialogs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]";
    v47 = 2112;
    v48 = v8;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s AddDialogs transformed into commands: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
LABEL_7:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
      if (objc_msgSend(v10, "count"))
        break;
      handlersByCommandType = self->_handlersByCommandType;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](handlersByCommandType, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v20 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v46 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]";
            v47 = 2112;
            v48 = v15;
            _os_log_debug_impl(&dword_214934000, v20, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler delegating command handling for command %@", buf, 0x16u);
          }
          dispatch_group_enter(group);
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke;
          v37[3] = &unk_24D24CDB8;
          v37[4] = v15;
          v38 = v32;
          v39 = v10;
          v40 = group;
          objc_msgSend(v19, "prepareToHandleCommand:completion:", v15, v37);

        }
        else
        {
          v22 = -[_AddDialogsContextPair initWithCommand:context:]([_AddDialogsContextPair alloc], "initWithCommand:context:", v15, 0);
          objc_msgSend(v32, "addObject:", v22);

        }
      }
      else
      {
        v21 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        {
          v23 = self->_handlersByCommandType;
          *(_DWORD *)buf = 136315650;
          v46 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]";
          v47 = 2112;
          v48 = v15;
          v49 = 2112;
          v50 = v23;
          _os_log_error_impl(&dword_214934000, v21, OS_LOG_TYPE_ERROR, "%s AddDialogs could not find an handler for command: %@ with handlers: %@", buf, 0x20u);
        }
        objc_msgSend(v10, "addObject:", v15);
      }

      if (v12 == ++v14)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v12)
          goto LABEL_7;
        break;
      }
    }
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke_35;
  block[3] = &unk_24D24EED8;
  v34 = v32;
  v35 = v10;
  v36 = v28;
  v24 = v28;
  v25 = v10;
  v26 = v32;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSDictionary *handlersByCommandType;
  objc_class *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  NSDictionary *v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  _QWORD block[4];
  NSObject *v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  NSDictionary *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v43 = a5;
  v39 = a6;
  objc_opt_class();
  v40 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddDialogs.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIAddDialogs class]]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  v14 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v37 = v14;
    *(_DWORD *)buf = 136315394;
    v59 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]";
    v60 = 2048;
    v61 = objc_msgSend(v13, "count");
    _os_log_debug_impl(&dword_214934000, v37, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler retrieved %tu command/context pairs from context", buf, 0x16u);

  }
  v41 = v11;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_group_create();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v13;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v21, "command");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        handlersByCommandType = self->_handlersByCommandType;
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](handlersByCommandType, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = *MEMORY[0x24BE08FB0];
        v28 = *MEMORY[0x24BE08FB0];
        if (v26)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]";
            v60 = 2112;
            v61 = (uint64_t)v22;
            _os_log_debug_impl(&dword_214934000, v27, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler delegating command handling for command %@", buf, 0x16u);
          }
          dispatch_group_enter(v16);
          objc_msgSend(v21, "context");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = MEMORY[0x24BDAC760];
          v50[1] = 3221225472;
          v50[2] = __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke;
          v50[3] = &unk_24D24CDE0;
          v51 = v15;
          v30 = v22;
          v52 = v30;
          v53 = v16;
          objc_msgSend(v26, "handleCommand:withContext:taskTracker:completion:", v30, v29, v43, v50);

          v31 = v51;
        }
        else
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v32 = self->_handlersByCommandType;
            *(_DWORD *)buf = 136315650;
            v59 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]";
            v60 = 2112;
            v61 = (uint64_t)v22;
            v62 = 2112;
            v63 = v32;
            _os_log_error_impl(&dword_214934000, v27, OS_LOG_TYPE_ERROR, "%s AddDialogs could not find an handler for command: %@ with handlers: %@", buf, 0x20u);
          }
          +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, CFSTR("No appropriate handler for command"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v31);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v18);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke_42;
  block[3] = &unk_24D24F068;
  v46 = v16;
  v47 = v40;
  v48 = v15;
  v49 = v39;
  v33 = v15;
  v34 = v39;
  v35 = v40;
  v36 = v16;
  dispatch_group_notify(v36, MEMORY[0x24BDAC9B8], block);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);
  objc_storeStrong((id *)&self->_handlersByCommandType, 0);
}

void __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler received a result command handling for command %@", (uint8_t *)&v5, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke_42(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = a1[5];
    v7 = 136315650;
    v8 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s End TTS request group %@ for %@.", (uint8_t *)&v7, 0x20u);
  }
  v5 = a1[7];
  if (v5)
  {
    +[SVXServiceCommandResult resultWithResults:](SVXServiceCommandResult, "resultWithResults:", a1[6]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _AddDialogsContextPair *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 136315394;
      v13 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]_block_invoke";
      v14 = 2112;
      v15 = v10;
      _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler successfully prepared context for command %@", (uint8_t *)&v12, 0x16u);
    }
    v8 = *(void **)(a1 + 40);
    v9 = -[_AddDialogsContextPair initWithCommand:context:]([_AddDialogsContextPair alloc], "initWithCommand:context:", *(_QWORD *)(a1 + 32), v5);
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315394;
      v13 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]_block_invoke";
      v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s AddDialogs handler preparing context failed for command %@", (uint8_t *)&v12, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke_35(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "count");
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v7 = 136315650;
    v8 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]_block_invoke";
    v9 = 2048;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler finished preparing commands with %tu command/context pairs and %tu failed commands", (uint8_t *)&v7, 0x20u);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "count");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
