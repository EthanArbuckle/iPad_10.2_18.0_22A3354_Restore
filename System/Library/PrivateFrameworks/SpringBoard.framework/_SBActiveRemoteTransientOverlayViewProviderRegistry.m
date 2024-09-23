@implementation _SBActiveRemoteTransientOverlayViewProviderRegistry

- (void)registerViewProvider:(id)a3
{
  void *v4;
  void *v5;
  _SBActiveRemoteTransientOverlayViewProviderAdapter *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_viewProviderAdapterForSceneIdentifier, "objectForKey:", v5);
  v6 = (_SBActiveRemoteTransientOverlayViewProviderAdapter *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(_SBActiveRemoteTransientOverlayViewProviderAdapter);
    -[NSMapTable setObject:forKey:](self->_viewProviderAdapterForSceneIdentifier, "setObject:forKey:", v6, v5);
    objc_msgSend((id)SBApp, "registerRemoteAlertSceneViewProvider:", v6);
  }
  if (objc_msgSend(v7, "handlesSceneBackedRemoteTransientOverlaysOnly"))
    -[_SBActiveRemoteTransientOverlayViewProviderAdapter setSceneBackedProvider:](v6, "setSceneBackedProvider:", v7);
  else
    -[_SBActiveRemoteTransientOverlayViewProviderAdapter setViewServiceProvider:](v6, "setViewServiceProvider:", v7);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_50 != -1)
    dispatch_once(&sharedInstance_onceToken_50, &__block_literal_global_203_1);
  return (id)sharedInstance___registry;
}

- (_SBActiveRemoteTransientOverlayViewProviderRegistry)init
{
  _SBActiveRemoteTransientOverlayViewProviderRegistry *v2;
  uint64_t v3;
  NSMapTable *viewProviderAdapterForSceneIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SBActiveRemoteTransientOverlayViewProviderRegistry;
  v2 = -[_SBActiveRemoteTransientOverlayViewProviderRegistry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    viewProviderAdapterForSceneIdentifier = v2->_viewProviderAdapterForSceneIdentifier;
    v2->_viewProviderAdapterForSceneIdentifier = (NSMapTable *)v3;

  }
  return v2;
}

- (void)unregisterViewProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_viewProviderAdapterForSceneIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sceneBackedProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewServiceProvider");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((id)v8 == v10)
    {
      objc_msgSend(v7, "setSceneBackedProvider:", 0);
    }
    else if ((id)v9 == v10)
    {
      objc_msgSend(v7, "setViewServiceProvider:", 0);
    }
    if (!(v8 | v9))
    {
      objc_msgSend((id)SBApp, "unregisterRemoteAlertSceneViewProvider:", v7);
      -[NSMapTable removeObjectForKey:](self->_viewProviderAdapterForSceneIdentifier, "removeObjectForKey:", v5);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewProviderAdapterForSceneIdentifier, 0);
}

@end
