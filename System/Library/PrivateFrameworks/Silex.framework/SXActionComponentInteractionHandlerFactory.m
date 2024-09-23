@implementation SXActionComponentInteractionHandlerFactory

- (SXActionComponentInteractionHandlerFactory)initWithActionManager:(id)a3 actionSerializer:(id)a4 analyticsReportingProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXActionComponentInteractionHandlerFactory *v12;
  SXActionComponentInteractionHandlerFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXActionComponentInteractionHandlerFactory;
  v12 = -[SXActionComponentInteractionHandlerFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionManager, a3);
    objc_storeStrong((id *)&v13->_actionSerializer, a4);
    objc_storeStrong((id *)&v13->_analyticsReportingProvider, a5);
  }

  return v13;
}

- (id)interactionHandlerForAction:(id)a3
{
  id v4;
  SXActionComponentInteractionHandler *v5;
  void *v6;
  void *v7;
  void *v8;
  SXActionComponentInteractionHandler *v9;

  if (a3)
  {
    v4 = a3;
    v5 = [SXActionComponentInteractionHandler alloc];
    -[SXActionComponentInteractionHandlerFactory actionManager](self, "actionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXActionComponentInteractionHandlerFactory actionSerializer](self, "actionSerializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXActionComponentInteractionHandlerFactory analyticsReportingProvider](self, "analyticsReportingProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SXActionComponentInteractionHandler initWithAction:actionManager:actionSerializer:analyticsReportingProvider:](v5, "initWithAction:actionManager:actionSerializer:analyticsReportingProvider:", v4, v6, v7, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (SXActionSerializer)actionSerializer
{
  return self->_actionSerializer;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_actionSerializer, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end
