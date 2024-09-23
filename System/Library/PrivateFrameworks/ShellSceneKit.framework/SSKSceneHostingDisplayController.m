@implementation SSKSceneHostingDisplayController

- (SSKSceneHostingDisplayController)initWithProfileConfiguration:(id)a3 displayIdentity:(id)a4
{
  id v8;
  id v9;
  SSKSceneHostingDisplayController *v10;
  SSKSceneHostingDisplayController *v11;
  SSKSceneHostingDisplayControllerAdapter *adapter;
  SSKUpdateDisplayTransformsAdapter *updateTransformsAdapter;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKSceneHostingDisplayController.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileConfiguration"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SSKSceneHostingDisplayController;
  v10 = -[SSKSceneHostingDisplayController init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_profileConfiguration, a3);
    adapter = v11->_adapter;
    v11->_adapter = 0;

    updateTransformsAdapter = v11->_updateTransformsAdapter;
    v11->_updateTransformsAdapter = 0;

  }
  return v11;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  SSKUpdateDisplayTransformsAdapter *v16;
  SSKUpdateDisplayTransformsAdapter *updateTransformsAdapter;
  SSKSceneHostingDisplayControllerAdapter *v18;
  SSKSceneHostingDisplayControllerAdapter *adapter;
  uint64_t v20;
  void *v21;
  void *v22;
  SSKDisplayAssertionPreferences *v23;

  v11 = (void *)MEMORY[0x24BDD17F0];
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  if ((objc_msgSend(v11, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKSceneHostingDisplayController connectToDisplayIdentity:configuration:displayTransformUpdater:caDisplayQueue:assertion:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SSKSceneHostingDisplayController.m"), 69, CFSTR("this call must be made on the main thread"));

  }
  v16 = -[SSKUpdateDisplayTransformsAdapter initWithDisplayConfiguration:displayTransformUpdater:]([SSKUpdateDisplayTransformsAdapter alloc], "initWithDisplayConfiguration:displayTransformUpdater:", v14, v13);

  updateTransformsAdapter = self->_updateTransformsAdapter;
  self->_updateTransformsAdapter = v16;

  v18 = -[SSKSceneHostingDisplayControllerAdapter initWithConfiguration:displayIdentity:displayConfiguration:updateTransformsAdapter:]([SSKSceneHostingDisplayControllerAdapter alloc], "initWithConfiguration:displayIdentity:displayConfiguration:updateTransformsAdapter:", self->_profileConfiguration, v15, v14, self->_updateTransformsAdapter);
  adapter = self->_adapter;
  self->_adapter = v18;

  v23 = objc_alloc_init(SSKDisplayAssertionPreferences);
  -[SSKDisplayAssertionPreferences setWantsControlOfDisplay:](v23, "setWantsControlOfDisplay:", 1);
  if (-[SSKDisplayProfileConfiguration supportsCloning](self->_profileConfiguration, "supportsCloning"))
    v20 = 1;
  else
    v20 = 2;
  -[SSKDisplayAssertionPreferences setCloneMirroringMode:](v23, "setCloneMirroringMode:", v20);
  objc_msgSend(v12, "updateWithPreferences:", v23);

}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKSceneHostingDisplayController displayIdentityDidUpdate:configuration:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SSKSceneHostingDisplayController.m"), 87, CFSTR("this call must be made on the main thread"));

  }
  v6 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKSceneHostingDisplayController.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

    v6 = 0;
  }
  -[SSKUpdateDisplayTransformsAdapter displayUpdated:](self->_updateTransformsAdapter, "displayUpdated:", v6);

}

- (void)displayIdentityDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKSceneHostingDisplayController displayIdentityDidDisconnect:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SSKSceneHostingDisplayController.m"), 93, CFSTR("this call must be made on the main thread"));

  }
  -[SSKSceneHostingDisplayControllerAdapter displayDisconnected:](self->_adapter, "displayDisconnected:", v6);

}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKSceneHostingDisplayController displayAssertionDidGainControlOfDisplay:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SSKSceneHostingDisplayController.m"), 100, CFSTR("this call must be made on the main thread"));

  }
  -[SSKSceneHostingDisplayControllerAdapter gainedControl](self->_adapter, "gainedControl");
}

- (void)displayAssertionDidLoseControlOfDisplay:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKSceneHostingDisplayController displayAssertionDidLoseControlOfDisplay:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SSKSceneHostingDisplayController.m"), 105, CFSTR("this call must be made on the main thread"));

  }
  -[SSKSceneHostingDisplayControllerAdapter lostControl](self->_adapter, "lostControl");
}

- (SSKSceneHostingDisplayControllerDelegate)delegate
{
  return (SSKSceneHostingDisplayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateTransformsAdapter, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_profileConfiguration, 0);
}

@end
