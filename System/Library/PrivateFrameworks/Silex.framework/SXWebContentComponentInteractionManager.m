@implementation SXWebContentComponentInteractionManager

- (SXWebContentComponentInteractionManager)initWithComponentView:(id)a3 interactionProvider:(id)a4 interactionHandlerManager:(id)a5 componentInteractionHandlerFactory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SXWebContentComponentInteractionManager *v14;
  SXWebContentComponentInteractionManager *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SXWebContentComponentInteractionManager;
  v14 = -[SXWebContentComponentInteractionManager init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_componentView, v10);
    objc_storeStrong((id *)&v15->_interactionProvider, a4);
    objc_storeWeak((id *)&v15->_interactionHandlerManager, v12);
    objc_storeStrong((id *)&v15->_componentInteractionHandlerFactory, a6);
    objc_msgSend(v11, "interaction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXWebContentComponentInteractionManager manageInteractionHandlerForInteraction:](v15, "manageInteractionHandlerForInteraction:", v16);

    objc_initWeak(&location, v15);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __146__SXWebContentComponentInteractionManager_initWithComponentView_interactionProvider_interactionHandlerManager_componentInteractionHandlerFactory___block_invoke;
    v18[3] = &unk_24D688F80;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v11, "onChange:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __146__SXWebContentComponentInteractionManager_initWithComponentView_interactionProvider_interactionHandlerManager_componentInteractionHandlerFactory___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "manageInteractionHandlerForInteraction:", v3);

}

- (void)manageInteractionHandlerForInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    -[SXWebContentComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXWebContentComponentInteractionManager currentInteractionHandler](self, "currentInteractionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXWebContentComponentInteractionManager componentView](self, "componentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInteractionHandler:componentView:", v5, v6);

    if (objc_msgSend(v12, "type") == 2)
    {
      -[SXWebContentComponentInteractionManager componentInteractionHandlerFactory](self, "componentInteractionHandlerFactory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentInteractionHandlerForInteraction:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXWebContentComponentInteractionManager setCurrentInteractionHandler:](self, "setCurrentInteractionHandler:", v8);

      -[SXWebContentComponentInteractionManager interactionHandlerManager](self, "interactionHandlerManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXWebContentComponentInteractionManager currentInteractionHandler](self, "currentInteractionHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXWebContentComponentInteractionManager componentView](self, "componentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addInteractionHandler:componentView:types:", v10, v11, 2);

    }
  }

}

- (SXComponentView)componentView
{
  return (SXComponentView *)objc_loadWeakRetained((id *)&self->_componentView);
}

- (SWInteractionProvider)interactionProvider
{
  return self->_interactionProvider;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return (SXComponentInteractionHandlerManager *)objc_loadWeakRetained((id *)&self->_interactionHandlerManager);
}

- (SXWebContentComponentInteractionHandlerFactory)componentInteractionHandlerFactory
{
  return self->_componentInteractionHandlerFactory;
}

- (SXComponentInteractionHandler)currentInteractionHandler
{
  return self->_currentInteractionHandler;
}

- (void)setCurrentInteractionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_currentInteractionHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInteractionHandler, 0);
  objc_storeStrong((id *)&self->_componentInteractionHandlerFactory, 0);
  objc_destroyWeak((id *)&self->_interactionHandlerManager);
  objc_storeStrong((id *)&self->_interactionProvider, 0);
  objc_destroyWeak((id *)&self->_componentView);
}

@end
