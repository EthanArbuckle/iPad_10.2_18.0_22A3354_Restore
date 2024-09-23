@implementation PXStoryViewConfiguration

- (PXStoryViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewConfiguration.m"), 16, CFSTR("%s is not available as initializer"), "-[PXStoryViewConfiguration init]");

  abort();
}

- (PXStoryViewConfiguration)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  id v7;
  id v8;
  PXStoryViewConfiguration *v9;
  PXStoryViewConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryViewConfiguration;
  v9 = -[PXStoryViewConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_extendedTraitCollection, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PXStoryViewConfiguration configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[PXStoryViewConfiguration extendedTraitCollection](self, "extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithConfiguration:extendedTraitCollection:", v6, v7);

  -[PXStoryViewConfiguration containerViewController](self, "containerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContainerViewController:", v9);

  return v8;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
