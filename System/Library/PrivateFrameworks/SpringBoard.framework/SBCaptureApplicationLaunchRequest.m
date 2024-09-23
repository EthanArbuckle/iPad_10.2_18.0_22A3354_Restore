@implementation SBCaptureApplicationLaunchRequest

- (SBCaptureApplicationLaunchRequest)initWithCaptureApplicationBundleIdentifier:(id)a3
{
  id v5;
  SBCaptureApplicationLaunchRequest *v6;
  SBCaptureApplicationLaunchRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCaptureApplicationLaunchRequest;
  v6 = -[SBCaptureApplicationLaunchRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_captureApplicationBundleIdentifier, a3);

  return v7;
}

- (void)dealloc
{
  BSTransaction *launchTransaction;
  objc_super v4;

  -[BSTransaction removeObserver:](self->_launchTransaction, "removeObserver:", self);
  launchTransaction = self->_launchTransaction;
  self->_launchTransaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureApplicationLaunchRequest;
  -[SBCaptureApplicationLaunchRequest dealloc](&v4, sel_dealloc);
}

- (void)initiate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SBCaptureApplicationLaunchRequest_initiate__block_invoke;
  v8[3] = &unk_1E8EA1598;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v3 = (void *)MEMORY[0x1D17E5550](v8);
  if (self->_prewarmCamera)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BB80]), "initWithCameraPrewarmType:applicationBundleIdentifier:", self->_launchType == 0, self->_captureApplicationBundleIdentifier);
    -[SBCaptureApplicationLaunchRequest _cameraPrewarmer](self, "_cameraPrewarmer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prewarmCameraForIdentifier:", v4);

  }
  +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!self->_launchType)
    objc_msgSend(v6, "launchForExtensionToApplicationTransition:launchActions:completionHandler:", self->_captureApplicationBundleIdentifier, self->_launchActions, v3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__SBCaptureApplicationLaunchRequest_initiate__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  SBDeviceApplicationSceneEntity *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationWithBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v4);
    objc_msgSend(WeakRetained, "_setupContentObserverWithSceneEntity:", v5);

LABEL_5:
    v6 = WeakRetained;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:underlyingError:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v7)
  {
    WeakRetained = v6;
    (*(void (**)(void))(v7 + 16))();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)transactionDidComplete:(id)a3
{
  void *v4;
  void *v5;
  void (**completionBlock)(void);
  uint64_t v7;
  void *v8;

  if (objc_msgSend(a3, "isFailed"))
  {
    -[BSTransaction error](self->_launchTransaction, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCaptureApplicationLaunchRequest _errorWithCode:underlyingError:](self, "_errorWithCode:underlyingError:", 2, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  else
  {
    v5 = 0;
  }
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    v8 = v5;
    completionBlock[2]();
    v5 = v8;
  }

}

- (void)setLaunchTransaction:(id)a3
{
  BSTransaction *v5;
  BSTransaction *launchTransaction;
  BSTransaction *v7;
  BSTransaction *v8;

  v5 = (BSTransaction *)a3;
  launchTransaction = self->_launchTransaction;
  if (launchTransaction != v5)
  {
    v8 = v5;
    if (launchTransaction)
    {
      -[BSTransaction removeObserver:](launchTransaction, "removeObserver:", self);
      v7 = self->_launchTransaction;
      self->_launchTransaction = 0;

    }
    objc_storeStrong((id *)&self->_launchTransaction, a3);
    -[BSTransaction addObserver:](self->_launchTransaction, "addObserver:", self);
    v5 = v8;
  }

}

- (id)_cameraPrewarmer
{
  void *v2;
  void *v3;
  void *v4;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraPrewarmer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setupContentObserverWithSceneEntity:(id)a3
{
  SBWaitForSceneContentAvailableTransaction *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "sceneHandle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[SBWaitForSceneContentAvailableTransaction initWithSceneHandle:manualListener:]([SBWaitForSceneContentAvailableTransaction alloc], "initWithSceneHandle:manualListener:", v6, 0);
  -[SBCaptureApplicationLaunchRequest setLaunchTransaction:](self, "setLaunchTransaction:", v4);

  -[SBCaptureApplicationLaunchRequest launchTransaction](self, "launchTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "begin");

}

- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SBCaptureApplicationLaunchErrorDomain, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)captureApplicationBundleIdentifier
{
  return self->_captureApplicationBundleIdentifier;
}

- (void)setCaptureApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
  objc_storeStrong((id *)&self->_launchActions, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)transitionSource
{
  return self->_transitionSource;
}

- (void)setTransitionSource:(int64_t)a3
{
  self->_transitionSource = a3;
}

- (BOOL)prewarmCamera
{
  return self->_prewarmCamera;
}

- (void)setPrewarmCamera:(BOOL)a3
{
  self->_prewarmCamera = a3;
}

- (int64_t)launchType
{
  return self->_launchType;
}

- (void)setLaunchType:(int64_t)a3
{
  self->_launchType = a3;
}

- (BSTransaction)launchTransaction
{
  return self->_launchTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTransaction, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_captureApplicationBundleIdentifier, 0);
}

@end
