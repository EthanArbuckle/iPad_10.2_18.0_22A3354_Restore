@implementation SVXHomeHubManagerObserver

- (SVXHomeHubManagerObserver)initWithRemoraVirtualDeviceManager:(id)a3 platformDependenciesTracker:(id)a4
{
  id v7;
  id v8;
  SVXHomeHubManagerObserver *v9;
  uint64_t v10;
  SVXQueuePerformer *mainQueuePerformer;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SVXHomeHubManagerObserver;
  v9 = -[SVXHomeHubManagerObserver init](&v13, sel_init);
  if (v9)
  {
    +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
    v10 = objc_claimAutoreleasedReturnValue();
    mainQueuePerformer = v9->_mainQueuePerformer;
    v9->_mainQueuePerformer = (SVXQueuePerformer *)v10;

    objc_storeStrong((id *)&v9->_remoraVirtualDeviceManager, a3);
    objc_storeStrong((id *)&v9->_platformDependenciesTracker, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformDependenciesTracker, 0);
  objc_storeStrong((id *)&self->_remoraVirtualDeviceManager, 0);
  objc_storeStrong((id *)&self->_mainQueuePerformer, 0);
}

@end
