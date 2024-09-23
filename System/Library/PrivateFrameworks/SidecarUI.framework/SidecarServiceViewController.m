@implementation SidecarServiceViewController

- (SidecarServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SidecarServiceViewController *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)SidecarServiceViewController;
  v4 = -[SidecarServiceViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  SidecarPresenterLogSubsystem(OS_LOG_TYPE_INFO);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_21F2A8000, v6, OS_LOG_TYPE_INFO, "=== Registering Service Provider (%{public}@) ===", buf, 0xCu);

  }
  SidecarRegisterServiceProvider();
  v4->_allowsDisplaySleep = 1;

  return v4;
}

- (BOOL)waitForServiceReady
{
  return 0;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SidecarServiceViewController;
  -[SidecarServiceViewController viewDidLoad](&v3, sel_viewDidLoad);
  if (!-[SidecarServiceViewController waitForServiceReady](self, "waitForServiceReady"))
    -[SidecarServiceViewController serviceReady](self, "serviceReady");
}

- (SidecarRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  SidecarRequest *v4;
  void *v5;
  SidecarRequest *request;
  SidecarRequest *v7;

  v4 = (SidecarRequest *)a3;
  -[SidecarRequest removeObserver:forKeyPath:](self->_request, "removeObserver:forKeyPath:", self, CFSTR("finished"));
  -[SidecarRequest session](self->_request, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  request = self->_request;
  self->_request = v4;
  v7 = v4;

  -[SidecarRequest addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", self, CFSTR("finished"), 0, 0);
}

- (void)sidecarServiceProviderHandleRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[SidecarServiceViewController setRequest:](self, "setRequest:", v4);
  -[SidecarServiceViewController requestDidStart:](self, "requestDidStart:", v4);

}

- (void)sidecarServiceProviderTerminate
{
  -[SidecarServiceViewController _notifyServiceAndTerminate:](self, "_notifyServiceAndTerminate:", 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  objc_super v16;
  _QWORD block[6];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("finished")))
  {
    v13 = v11;
    if (objc_msgSend(v13, "isFinished"))
    {
      SidecarPresenterLogSubsystem(OS_LOG_TYPE_DEBUG);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v13;
        _os_log_impl(&dword_21F2A8000, v15, OS_LOG_TYPE_DEBUG, "=== Request Finished === %{public}@", buf, 0xCu);
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__SidecarServiceViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_24E3E81B0;
      block[4] = self;
      block[5] = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SidecarServiceViewController;
    -[SidecarServiceViewController observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)sidecarRequest:(id)a3 receivedItems:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SidecarServiceViewController_sidecarRequest_receivedItems___block_invoke;
  v7[3] = &unk_24E3E81B0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (void)serviceReady
{
  void *v2;
  id v3;

  if (!self->_calledServiceReady)
  {
    self->_calledServiceReady = 1;
    -[SidecarServiceViewController extensionContext](self, "extensionContext");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_UUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    SidecarServiceProviderReady();

  }
}

- (void)requestDidFinish:(id)a3
{
  -[SidecarServiceViewController completeRequest:](self, "completeRequest:", -[SidecarServiceViewController requestCompleted](self, "requestCompleted", a3));
}

- (void)completeRequest:(int64_t)a3
{
  id v5;

  -[SidecarServiceViewController request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("finished"));
    objc_msgSend(v5, "cancel");
  }
  -[SidecarServiceViewController _notifyServiceAndTerminate:](self, "_notifyServiceAndTerminate:", a3);

}

- (int64_t)requestCompleted
{
  return 1;
}

- (void)_notifyServiceAndTerminate:(int64_t)a3
{
  if (!self->_terminationRequested)
  {
    self->_terminationRequested = 1;
    SidecarOptOutOfReconnect();
  }
}

- (void)setWantsVolumeButtonEvents:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_wantsVolumeButtonEvents != a3)
  {
    v3 = a3;
    -[SidecarServiceViewController hostProxy](self, "hostProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sidecarServiceViewControllerWantsVolumeButtonEvents:", v3);

    self->_wantsVolumeButtonEvents = v3;
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  void *v5;

  if (self->_backgroundStyle != a3)
  {
    -[SidecarServiceViewController hostProxy](self, "hostProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sidecarServiceViewControllerBackgroundStyle:", a3);

    self->_backgroundStyle = a3;
  }
}

- (void)sidecarServiceUpdateSupportedOrientations
{
  void *v3;
  id v4;

  -[SidecarServiceViewController hostProxy](self, "hostProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SidecarServiceViewController _supportedInterfaceOrientationsDidChange](self, "_supportedInterfaceOrientationsDidChange");
    -[SidecarServiceViewController hostProxy](self, "hostProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sidecarServiceOrientationChanged");

  }
}

- (void)setAllowsDisplaySleep:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  if (self->_allowsDisplaySleep != a3)
  {
    v3 = a3;
    self->_allowsDisplaySleep = a3;
    -[SidecarServiceViewController hostProxy](self, "hostProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sidecarServiceDisableDisplaySleep:", !v3);

  }
}

- (void)sidecarServiceShouldPresentWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)sidecarServiceCancel
{
  -[SidecarServiceViewController completeRequest:](self, "completeRequest:", 0);
}

- (void)sidecarServiceSetSceneIdentityToken:(id)a3
{
  FBSSceneIdentityToken *v4;
  FBSSceneIdentityToken *sceneIdentityToken;
  NSObject *v6;
  NSObject *v7;
  FBSSceneIdentityToken *v8;
  FBSSceneIdentityToken *v9;
  int v10;
  FBSSceneIdentityToken *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (FBSSceneIdentityToken *)a3;
  sceneIdentityToken = self->_sceneIdentityToken;
  if (sceneIdentityToken != v4
    && (!sceneIdentityToken || (-[FBSSceneIdentityToken isEqual:](sceneIdentityToken, "isEqual:", v4) & 1) == 0))
  {
    SidecarPresenterLogSubsystem(OS_LOG_TYPE_DEFAULT);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_21F2A8000, v7, OS_LOG_TYPE_DEFAULT, "Setting scene identity token to [%@]", (uint8_t *)&v10, 0xCu);
    }
    v8 = (FBSSceneIdentityToken *)-[FBSSceneIdentityToken copy](v4, "copy");
    v9 = self->_sceneIdentityToken;
    self->_sceneIdentityToken = v8;

  }
}

- (void)sidecarServiceSetSceneIdentifier:(id)a3
{
  NSString *v4;
  NSString *sceneIdentifier;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  sceneIdentifier = self->_sceneIdentifier;
  if (sceneIdentifier != v4
    && (!sceneIdentifier || !-[NSString isEqualToString:](sceneIdentifier, "isEqualToString:", v4)))
  {
    SidecarPresenterLogSubsystem(OS_LOG_TYPE_DEFAULT);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_21F2A8000, v7, OS_LOG_TYPE_DEFAULT, "Setting scene ID to [%@]", (uint8_t *)&v10, 0xCu);
    }
    v8 = (NSString *)-[NSString copy](v4, "copy");
    v9 = self->_sceneIdentifier;
    self->_sceneIdentifier = v8;

  }
}

- (BOOL)allowsDisplaySleep
{
  return self->_allowsDisplaySleep;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)backgrounded
{
  return self->_backgrounded;
}

- (void)setBackgrounded:(BOOL)a3
{
  self->_backgrounded = a3;
}

- (FBSSceneIdentityToken)sceneIdentityToken
{
  return self->_sceneIdentityToken;
}

- (void)setSceneIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (BOOL)wantsVolumeButtonEvents
{
  return self->_wantsVolumeButtonEvents;
}

- (BOOL)waitForReconnect
{
  return self->_waitForReconnect;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentityToken, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __59__SidecarServiceViewController__notifyServiceAndTerminate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "hostProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "hostProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sidecarServiceViewControllerAnimate:completion:", *(_QWORD *)(a1 + 40), &__block_literal_global);

  }
  else
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "terminateWithSuccess");
  }
}

uint64_t __59__SidecarServiceViewController__notifyServiceAndTerminate___block_invoke_2()
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "terminateWithSuccess");
}

uint64_t __61__SidecarServiceViewController_sidecarRequest_receivedItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receivedItems:", *(_QWORD *)(a1 + 40));
}

uint64_t __79__SidecarServiceViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestDidFinish:", *(_QWORD *)(a1 + 40));
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2554C3970);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2554C0588);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
