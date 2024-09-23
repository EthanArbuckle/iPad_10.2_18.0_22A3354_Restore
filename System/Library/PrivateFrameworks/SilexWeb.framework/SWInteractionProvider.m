@implementation SWInteractionProvider

- (SWInteractionProvider)initWithMessageHandlerManager:(id)a3 documentStateProvider:(id)a4 interactionFactory:(id)a5 logger:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SWInteractionProvider *v14;
  uint64_t v15;
  NSMutableArray *blocks;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SWInteractionProvider;
  v14 = -[SWInteractionProvider init](&v24, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    blocks = v14->_blocks;
    v14->_blocks = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_interactionFactory, a5);
    objc_storeStrong((id *)&v14->_logger, a6);
    +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addMessageHandler:name:", v17, CFSTR("presentable"));

    +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addMessageHandler:name:", v18, CFSTR("update"));

    +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addMessageHandler:name:", v19, CFSTR("interaction"));

    objc_initWeak(&location, v14);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __103__SWInteractionProvider_initWithMessageHandlerManager_documentStateProvider_interactionFactory_logger___block_invoke;
    v21[3] = &unk_24DA0B7C0;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v11, "onLoad:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __103__SWInteractionProvider_initWithMessageHandlerManager_documentStateProvider_interactionFactory_logger___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

}

- (void)onChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SWInteractionProvider blocks](self, "blocks");
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
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("interaction"));

  if (v7)
  {
    -[SWInteractionProvider logger](self, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[SWInteractionProvider interactionBlock](self, "interactionBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Interaction: Invoking interaction, hasBlock=%d, Message: %@"), v10 != 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "log:", v12);

    -[SWInteractionProvider interactionBlock](self, "interactionBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[SWInteractionProvider interactionBlock](self, "interactionBlock");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();

    }
  }
  else
  {
    objc_msgSend(v5, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("interaction"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SWInteractionProvider interactionFactory](self, "interactionFactory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "interactionForDictionary:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[SWInteractionProvider interaction](self, "interaction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) == 0 && v18)
        {
          -[SWInteractionProvider logger](self, "logger");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x24BDD17C8];
          v23 = -[SWInteraction type](self->_interaction, "type");
          v24 = objc_msgSend(v18, "type");
          objc_msgSend(v5, "body");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("Interaction: Changing interaction type from %lu to %lu. Message: %@"), v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "log:", v26);

          objc_storeStrong((id *)&self->_interaction, v18);
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          -[SWInteractionProvider blocks](self, "blocks");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v27, "copy");

          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v34;
            do
            {
              v32 = 0;
              do
              {
                if (*(_QWORD *)v34 != v31)
                  objc_enumerationMutation(v28);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v32++) + 16))();
              }
              while (v30 != v32);
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            }
            while (v30);
          }

        }
      }
    }

  }
}

- (SWInteraction)interaction
{
  return self->_interaction;
}

- (id)interactionBlock
{
  return self->_interactionBlock;
}

- (void)setInteractionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SWInteractionFactory)interactionFactory
{
  return self->_interactionFactory;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_interactionFactory, 0);
  objc_storeStrong(&self->_interactionBlock, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
