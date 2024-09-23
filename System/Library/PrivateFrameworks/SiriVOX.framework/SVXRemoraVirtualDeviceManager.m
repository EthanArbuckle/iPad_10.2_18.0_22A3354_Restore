@implementation SVXRemoraVirtualDeviceManager

- (SVXRemoraVirtualDeviceManager)initWithRunningObserver:(id)a3
{
  id v4;
  void *v5;
  SVXVirtualDeviceFactory *v6;
  SVXRemoraVirtualDeviceManager *v7;

  v4 = a3;
  +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(SVXVirtualDeviceFactory);
  v7 = -[SVXRemoraVirtualDeviceManager initWithRunningObserver:mainQueuePerformer:virtualDeviceFactory:](self, "initWithRunningObserver:mainQueuePerformer:virtualDeviceFactory:", v4, v5, v6);

  return v7;
}

- (SVXRemoraVirtualDeviceManager)initWithRunningObserver:(id)a3 mainQueuePerformer:(id)a4 virtualDeviceFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SVXRemoraVirtualDeviceManager *v12;
  SVXRemoraVirtualDeviceManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXRemoraVirtualDeviceManager;
  v12 = -[SVXRemoraVirtualDeviceManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mainQueuePerformer, a4);
    objc_storeStrong((id *)&v13->_runningObserver, a3);
    objc_storeStrong((id *)&v13->_virtualDeviceFactory, a5);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualDeviceFactory, 0);
  objc_storeStrong((id *)&self->_runningObserver, 0);
  objc_storeStrong((id *)&self->_mainQueuePerformer, 0);
}

@end
