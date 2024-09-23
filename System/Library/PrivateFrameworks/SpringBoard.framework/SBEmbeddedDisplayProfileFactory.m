@implementation SBEmbeddedDisplayProfileFactory

- (id)initWithDelegate:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SBEmbeddedDisplayProfileFactory;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (id)createProfile
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D97610], "sceneHostingProfileWithDelegate:builder:", a1, &__block_literal_global_353);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __48__SBEmbeddedDisplayProfileFactory_createProfile__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *MEMORY[0x1E0D97620];
  v3 = a2;
  +[FBSSceneSpecification specification](SBApplicationSceneSpecification, "specification");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPriorityLevel:sceneSpecification:", v2, v4);

}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "identity", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainRootDisplay");

  return v5;
}

- (id)displayProfile:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  void *v4;
  void *v5;

  +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance](SBMainDisplayRootWindowScenePresentationBinder, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)displayProfile:(id)a3 modifyInitialSceneParameters:(id)a4
{
  SBEmbeddedDisplayProfileFactoryDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "embeddedFactory:modifyInitialSceneParameters:", self, v6);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
