@implementation SXWebContentComponentInteractionManagerFactory

- (SXWebContentComponentInteractionManagerFactory)initWithInteractionProvider:(id)a3 interactionHandlerManager:(id)a4 componentInteractionHandlerFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXWebContentComponentInteractionManagerFactory *v12;
  SXWebContentComponentInteractionManagerFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXWebContentComponentInteractionManagerFactory;
  v12 = -[SXWebContentComponentInteractionManagerFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interactionProvider, a3);
    objc_storeStrong((id *)&v13->_interactionHandlerManager, a4);
    objc_storeStrong((id *)&v13->_componentInteractionHandlerFactory, a5);
  }

  return v13;
}

- (id)interactionManagerForComponentView:(id)a3
{
  id v4;
  SXWebContentComponentInteractionManager *v5;
  void *v6;
  void *v7;
  void *v8;
  SXWebContentComponentInteractionManager *v9;

  v4 = a3;
  v5 = [SXWebContentComponentInteractionManager alloc];
  -[SXWebContentComponentInteractionManagerFactory interactionProvider](self, "interactionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentInteractionManagerFactory interactionHandlerManager](self, "interactionHandlerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXWebContentComponentInteractionManagerFactory componentInteractionHandlerFactory](self, "componentInteractionHandlerFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SXWebContentComponentInteractionManager initWithComponentView:interactionProvider:interactionHandlerManager:componentInteractionHandlerFactory:](v5, "initWithComponentView:interactionProvider:interactionHandlerManager:componentInteractionHandlerFactory:", v4, v6, v7, v8);

  return v9;
}

- (SWInteractionProvider)interactionProvider
{
  return self->_interactionProvider;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (SXWebContentComponentInteractionHandlerFactory)componentInteractionHandlerFactory
{
  return self->_componentInteractionHandlerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentInteractionHandlerFactory, 0);
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
  objc_storeStrong((id *)&self->_interactionProvider, 0);
}

@end
