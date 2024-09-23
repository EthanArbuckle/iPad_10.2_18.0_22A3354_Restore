@implementation PXFeedViewConfiguration

- (PXFeedViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewConfiguration.m"), 18, CFSTR("%s is not available as initializer"), "-[PXFeedViewConfiguration init]");

  abort();
}

- (PXFeedViewConfiguration)initWithFeedConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  id v6;
  id v7;
  PXFeedViewConfiguration *v8;
  uint64_t v9;
  PXFeedConfiguration *feedConfiguration;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedViewConfiguration;
  v8 = -[PXFeedViewConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    feedConfiguration = v8->_feedConfiguration;
    v8->_feedConfiguration = (PXFeedConfiguration *)v9;

    objc_storeStrong((id *)&v8->_extendedTraitCollection, a4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PXFeedViewConfiguration feedConfiguration](self, "feedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewConfiguration extendedTraitCollection](self, "extendedTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFeedConfiguration:extendedTraitCollection:", v5, v6);

  -[PXFeedViewConfiguration containerViewController](self, "containerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContainerViewController:", v8);

  return v7;
}

- (PXFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
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
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
}

@end
