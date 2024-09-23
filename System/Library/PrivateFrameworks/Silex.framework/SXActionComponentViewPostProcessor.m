@implementation SXActionComponentViewPostProcessor

- (SXActionComponentViewPostProcessor)initWithActionProvider:(id)a3 interactionHandlerFactory:(id)a4 interactionHandlerManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXActionComponentViewPostProcessor *v12;
  SXActionComponentViewPostProcessor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXActionComponentViewPostProcessor;
  v12 = -[SXActionComponentViewPostProcessor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionProvider, a3);
    objc_storeStrong((id *)&v13->_factory, a4);
    objc_storeStrong((id *)&v13->_interactionHandlerManager, a5);
  }

  return v13;
}

- (void)processComponent:(id)a3 view:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "additions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "range") == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[SXActionComponentViewPostProcessor actionProvider](self, "actionProvider");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "actionForAddition:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[SXActionComponentViewPostProcessor factory](self, "factory");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "interactionHandlerForAction:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            -[SXActionComponentViewPostProcessor interactionHandlerManager](self, "interactionHandlerManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addInteractionHandler:componentView:types:", v16, v6, 10);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (SXActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SXActionComponentInteractionHandlerFactory)factory
{
  return self->_factory;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
}

@end
