@implementation UVAgentSceneEntryPoint

- (UVAgentSceneEntryPoint)initWithScene:(id)a3
{
  id v5;
  UVAgentSceneEntryPoint *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UVAgentSceneEntryPoint;
  v6 = -[UVAgentSceneEntryPoint init](&v14, sel_init);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UVAgentSceneEntryPoint.m"), 40, CFSTR("Scene wasn't a window scene."));

    }
    objc_storeWeak((id *)&v6->_scene, v5);
    UVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "_FBSScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_22C669000, v7, OS_LOG_TYPE_DEFAULT, "UVPreviewSceneEntryPoint init: %@ (identifier = %@)", buf, 0x16u);

    }
    -[UVAgentSceneEntryPoint _forceApplicationLaunchCompletion](v6, "_forceApplicationLaunchCompletion");
    objc_msgSend(v5, "_FBSScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[UVAgentSceneRegistry deliverScene:forIdentifier:](_TtC19PreviewsOSSupportUI20UVAgentSceneRegistry, "deliverScene:forIdentifier:", v5, v11);
  }

  return v6;
}

- (void)_forceApplicationLaunchCompletion
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_compellApplicationLaunchToCompleteUnconditionally");

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
