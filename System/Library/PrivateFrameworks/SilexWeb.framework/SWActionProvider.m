@implementation SWActionProvider

- (SWActionProvider)initWithMessageHandlerManager:(id)a3 actionFactory:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  SWActionProvider *v11;
  uint64_t v12;
  NSMutableArray *actionBlocks;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SWActionProvider;
  v11 = -[SWActionProvider init](&v16, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    actionBlocks = v11->_actionBlocks;
    v11->_actionBlocks = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_actionFactory, a4);
    objc_storeStrong((id *)&v11->_logger, a5);
    +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addMessageHandler:name:", v14, CFSTR("action"));

  }
  return v11;
}

- (void)onAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SWActionProvider actionBlocks](self, "actionBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("action"));

  if (v7)
  {
    -[SWActionProvider logger](self, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[SWActionProvider actionBlocks](self, "actionBlocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(v5, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Action: Invoking action %lu blocks. Message: %@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "log:", v13);

    objc_msgSend(v5, "body");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SWActionProvider actionFactory](self, "actionFactory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "actionForDictionary:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[SWActionProvider logger](self, "logger");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x24BDD17C8];
          -[SWActionProvider actionTypeText:](self, "actionTypeText:", objc_msgSend(v16, "type"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "body");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("Action: action type %@. Message: %@"), v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "log:", v21);

          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          -[SWActionProvider actionBlocks](self, "actionBlocks");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "copy");

          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v29;
            do
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v29 != v26)
                  objc_enumerationMutation(v23);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v27++) + 16))();
              }
              while (v25 != v27);
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            }
            while (v25);
          }

        }
      }
    }

  }
}

- (id)actionTypeText:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("none");
  else
    return off_24DA0B720[a3 - 1];
}

- (SWActionFactory)actionFactory
{
  return self->_actionFactory;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableArray)actionBlocks
{
  return self->_actionBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBlocks, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_actionFactory, 0);
}

@end
